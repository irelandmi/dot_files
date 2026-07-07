# Pragmatic Python
## Pragmatic Programmer Principles Applied to Python

---

### ETC — Easier to Change

- Favor composition over inheritance. Use protocols (`typing.Protocol`) and dataclasses over deep class hierarchies.
- Keep modules small and focused. A module should have one reason to change.
- Use keyword arguments for functions with more than 2-3 parameters — they're self-documenting and order-independent.
- Prefer standard library solutions (`pathlib`, `itertools`, `collections`, `contextlib`) before reaching for dependencies.

### DRY — Don't Repeat Yourself

- Use `dataclasses` or `NamedTuple` to define structured data once rather than passing dicts around.
- Shared constants belong in a single module, imported where needed.
- If you're writing the same try/except pattern repeatedly, extract it into a decorator or context manager.
- Use `__init__.py` exports deliberately — define your public API in one place.

### Orthogonality & Decoupling

- Separate I/O from logic. Pure functions that take data and return data are trivially testable.
- Avoid global state. If you need shared config, pass it explicitly or use dependency injection.
- Use `abc.ABC` or `typing.Protocol` to define boundaries between components.
- Keep imports clean — circular imports are a sign of coupling. If two modules import each other, extract the shared concept.

### Tracer Bullets

- Start with a working `__main__` block or CLI entry point (use `argparse` or `click`). Get end-to-end flow working before fleshing out internals.
- Use `logging` from the start, not `print()`. It's trivial to set up and pays off immediately.
- Type hints as tracer architecture — annotate function signatures early to sketch out the data flow before implementing.

### Broken Windows

- Run `ruff` (linting + formatting) on every save or commit. Don't let style drift accumulate.
- Fix deprecation warnings when you see them, not "later."
- Don't leave bare `except:` or `except Exception:` blocks that silently swallow errors.
- Remove dead code. Don't comment it out — that's what version control is for.

### Crash Early

- Let exceptions propagate. Don't catch them unless you can actually handle them.
- Use `assert` for invariants during development. Use `raise ValueError`/`TypeError` for input validation at boundaries.
- Prefer `str | None` over sentinel values. Use `None` explicitly rather than empty strings or `-1`.
- `sys.exit(1)` is better than limping along in a broken state.

### Transformations & Pipelines

- Think in terms of data transformations: generators, comprehensions, `map`, `filter`, `itertools`.
- Generator pipelines for processing large data — lazy evaluation keeps memory bounded.
- `functools.reduce`, `itertools.chain`, `itertools.starmap` for composing transformations.
- Write functions that take iterables and yield iterables — they compose naturally.

```python
# pipeline style
raw = read_lines(path)
parsed = (parse(line) for line in raw)
valid = (r for r in parsed if r.is_valid)
results = [transform(r) for r in valid]
```

### Deliberate Programming

- Understand the Python data model. Know when `__eq__`, `__hash__`, `__repr__`, `__enter__/__exit__` matter.
- Know the difference between `is` and `==`, mutable default arguments, and closure variable binding.
- Don't rely on dict ordering "by coincidence" in code that targets < 3.7. In modern Python, it's guaranteed — know which guarantees you're relying on.
- Use `breakpoint()` instead of guessing. Read tracebacks bottom-up.

### Design by Contract

- Type hints are lightweight contracts. Use them consistently.
- `typing.Protocol` for structural subtyping — define what you need, not what you inherit from.
- Use `@dataclass(frozen=True)` for value objects that shouldn't be mutated.
- Pydantic or `attrs` with validators for runtime contract enforcement at system boundaries.

### Testing

- Use `pytest` — it's the standard. Simple functions with `assert` statements.
- Test behavior, not implementation. Test the public API of a module.
- `pytest.parametrize` for property-like testing across inputs.
- Use `hypothesis` for real property-based testing when the domain warrants it.
- Fixtures for setup/teardown. `tmp_path` for filesystem tests. `monkeypatch` for environment.
- Separate fast unit tests from slow integration tests with markers.

### Concurrency

- `asyncio` for I/O-bound concurrent work. Don't mix sync and async carelessly.
- `multiprocessing` for CPU-bound parallelism (GIL makes threads ineffective for CPU work).
- `concurrent.futures.ThreadPoolExecutor` for simple I/O parallelism without async.
- Never share mutable state between threads/processes. Use queues, events, or immutable data.

### Configuration & Reversibility

- Use environment variables (`os.environ`) or `.env` files (with `python-dotenv`) for deployment config.
- `tomllib` (3.11+) for application config files. TOML over YAML over JSON for human-edited config.
- Keep feature toggles and external service URLs in config, not code.
- Use `uv` for dependency management — fast, reproducible, lockfile-based.

### Plain Text & Tooling

- Format: `ruff format`. Lint: `ruff check`. Type check: `mypy` or `pyright`.
- Use `pyproject.toml` as the single source for project metadata, dependencies, and tool config.
- Virtual environments always. `uv venv` + `uv sync` for reproducible setups.
- `Makefile` or `justfile` for common project tasks (test, lint, build, run).

### Naming & Readability

- Follow PEP 8: `snake_case` for functions/variables, `PascalCase` for classes, `UPPER_CASE` for constants.
- Name functions as verbs (`parse_record`, `validate_input`), classes as nouns (`HttpClient`, `UserAccount`).
- Avoid single-letter names outside of comprehensions and very short lambdas.
- If a function needs a comment to explain what it does, rename it instead.

---

### Quick Reference

| Pragmatic Principle | Python Expression |
|---|---|
| ETC | Protocols, dataclasses, composition |
| DRY | Decorators, context managers, single-source modules |
| Orthogonality | Pure functions, no global state, clean imports |
| Tracer Bullets | `__main__` entry point, type hints as architecture sketch |
| Broken Windows | `ruff` on every commit, fix warnings immediately |
| Crash Early | Let exceptions propagate, `assert` invariants |
| Transformations | Generators, comprehensions, pipelines |
| Deliberate | Understand the data model, use `breakpoint()` |
| Contracts | Type hints, `Protocol`, `frozen=True` dataclasses |
| Testing | `pytest`, parametrize, `hypothesis` |
