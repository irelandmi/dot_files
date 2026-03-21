#!/bin/bash
# Launch tmux sessions from a config file
# Usage: ./launch.sh [config_file]

eval "$(/opt/homebrew/bin/brew shellenv)"

CONFIG="${1:-$(dirname "$0")/sessions.conf}"

if [ ! -f "$CONFIG" ]; then
	echo "Config not found: $CONFIG" >&2
	exit 1
fi

if ! command -v tmux >/dev/null 2>&1; then
	echo "tmux not found" >&2
	exit 1
fi

session=""
session_dir="$HOME"
first_session=""
window_index=0

create_window() {
	local name="$1"
	local dir="$2"
	local cmd="$3"

	if [ "$window_index" -eq 0 ]; then
		tmux new-session -d -s "$session" -n "$name" -c "$dir"
		first_session="${first_session:-$session}"
	else
		tmux new-window -t "$session" -n "$name" -c "$dir"
	fi

	if [ -n "$cmd" ]; then
		tmux send-keys -t "$session:$name" "$cmd" Enter
	fi

	window_index=$((window_index + 1))
}

parse_window_line() {
	local line="$1"
	local name dir cmd

	name="${line%%|*}"
	name="${name## }"
	name="${name%% }"

	dir="$session_dir"
	cmd=""

	if [[ "$line" == *"|"* ]]; then
		local rest="${line#*|}"
		IFS='|' read -ra parts <<< "$rest"
		for part in "${parts[@]}"; do
			part="${part## }"
			part="${part%% }"
			if [[ "$part" == dir=* ]]; then
				dir="${part#dir=}"
				dir="${dir/#\~/$HOME}"
			elif [[ "$part" == cmd=* ]]; then
				cmd="${part#cmd=}"
			fi
		done
	fi

	create_window "$name" "$dir" "$cmd"
}

while IFS= read -r line || [ -n "$line" ]; do
	line="${line%%#*}"
	line="${line## }"
	line="${line%% }"
	[ -z "$line" ] && continue

	if [[ "$line" == session:* ]]; then
		session="${line#session:}"
		session="${session## }"
		session="${session%% }"
		session_dir="$HOME"
		window_index=0

		if tmux has-session -t "$session" 2>/dev/null; then
			echo "Session '$session' already exists, skipping"
			first_session="${first_session:-$session}"
			session=""
			continue
		fi
	elif [[ "$line" == dir:* ]] && [ -n "$session" ]; then
		session_dir="${line#dir:}"
		session_dir="${session_dir## }"
		session_dir="${session_dir%% }"
		session_dir="${session_dir/#\~/$HOME}"
	elif [[ "$line" == window:* ]] && [ -n "$session" ]; then
		local_line="${line#window:}"
		local_line="${local_line## }"
		parse_window_line "$local_line"
	fi
done < "$CONFIG"

if [ -n "$first_session" ]; then
	if [ -z "$TMUX" ]; then
		tmux attach-session -t "$first_session"
	else
		tmux switch-client -t "$first_session"
	fi
fi
