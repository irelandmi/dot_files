# The Pragmatic Programmer: 20th Anniversary Edition
## Key Takeaways

David Thomas & Andrew Hunt, 2019 (2nd Edition)

---

### Core Philosophy

- **It's your life.** You have agency over your career, your tools, and your craft. If something is broken, fix it. If something is missing, build it.
- **Think critically about everything.** Don't accept things blindly — question assumptions, challenge constraints, and think about the bigger picture.

---

### Chapter-by-Chapter Highlights

#### 1. A Pragmatic Philosophy
- **The Cat Ate My Source Code** — Take responsibility. Provide options, not excuses.
- **Software Entropy** — Don't leave "broken windows" (bad code, poor decisions) unrepaired. Neglect accelerates rot.
- **Stone Soup and Boiled Frogs** — Be a catalyst for change. But also stay aware of slow, creeping scope/quality drift.
- **Good-Enough Software** — Know when to stop. Involve users in trade-off decisions. Perfect is the enemy of shipped.
- **Your Knowledge Portfolio** — Invest regularly in learning. Diversify. Manage risk. Learn a new language every year. Read a technical book each month.
- **Communicate!** — Know your audience. Plan what you want to say. Choose the right moment.

#### 2. A Pragmatic Approach
- **The Essence of Good Design** — Good design is easier to change than bad design (ETC principle). This is the single most important design heuristic.
- **DRY — Don't Repeat Yourself** — Every piece of knowledge must have a single, unambiguous, authoritative representation. Not just code — applies to documentation, data schemas, APIs.
- **Orthogonality** — Keep things decoupled. Changes in one area shouldn't ripple through unrelated areas. Easier to test, easier to change.
- **Reversibility** — Nothing is forever. Build for flexibility. Avoid locking into vendors, architectures, or designs you can't undo.
- **Tracer Bullets** — Build end-to-end skeleton systems early. They give you a framework to hang code on and provide immediate feedback.
- **Prototypes and Post-it Notes** — Prototype to learn, then throw it away. Make it clear prototypes are disposable.
- **Domain Languages** — Write code in the language of the problem domain when possible.
- **Estimating** — Learn to estimate to avoid surprises. Iterate and refine your estimates. "I'll get back to you" is a valid answer.

#### 3. The Basic Tools
- **The Power of Plain Text** — Store knowledge in plain text. It outlives all other formats.
- **Shell Games** — Master the command line. GUIs can't be scripted or composed.
- **Power Editing** — Know your editor cold. Fluency removes friction from thought-to-code.
- **Version Control** — Everything in version control. Always. No exceptions.
- **Debugging** — Fix the problem, not the blame. Don't panic. Reproduce first, then isolate. Binary search through failing states.
- **Text Manipulation** — Learn a text manipulation language (awk, sed, Python, Ruby) to automate grunt work.
- **Engineering Daybooks** — Keep a journal. Write down what you did, what you learned, and what you want to try.

#### 4. Pragmatic Paranoia
- **Design by Contract** — Define preconditions, postconditions, and invariants. Be strict in what you accept, lazy in what you promise.
- **Dead Programs Tell No Lies** — Crash early. A dead program does less damage than a crippled one silently corrupting data.
- **Assertive Programming** — Use assertions to check things that "can never happen." If it can't happen, assert it.
- **How to Balance Resources** — Finish what you start. Whoever allocates a resource should deallocate it. Nest allocations.
- **Don't Outrun Your Headlights** — Take small steps. Get feedback. Adjust. Don't try to predict the future beyond one or two steps.

#### 5. Bend, or Break
- **Decoupling** — Minimize dependencies between components. Tell, don't ask. Law of Demeter. Avoid train wrecks (a.b().c().d()).
- **Juggling the Real World** — Use events to decouple. Finite state machines, observer pattern, pub/sub, reactive streams — pick the right one for the job.
- **Transforming Programming** — Think of programs as data transformations (pipelines, chains). Input -> transforms -> output. This often simplifies design dramatically.
- **Inheritance Tax** — Prefer interfaces/protocols, delegation, and mixins over inheritance. Inheritance is rarely the right answer.
- **Configuration** — Parameterize your app using external configuration. Don't hardwire values. Make apps configurable without recompiling.

#### 6. Concurrency
- **Breaking Temporal Coupling** — Analyze workflow to find what can happen concurrently. Don't impose artificial sequential constraints.
- **Shared State Is Incorrect State** — Shared mutable state is the root of most concurrency bugs. Use actors, processes, or immutable data.
- **Actors and Processes** — Actors: independent processors with private state, communicating via async messages. A clean concurrency model.

#### 7. While You Are Coding
- **Listen to Your Lizard Brain** — If something feels wrong, stop. Your instincts are often picking up on patterns your conscious mind hasn't processed.
- **Programming by Coincidence** — Don't rely on things that work "by accident." Understand *why* your code works. Code deliberately.
- **Algorithm Speed** — Estimate Big-O before choosing an approach. Don't optimize prematurely, but don't ignore algorithmic complexity.
- **Refactoring** — Refactor early and often. It's not "special" work — it's part of normal development. Don't refactor and add functionality at the same time.
- **Test to Code** — Testing isn't about finding bugs. It's a lens for design. TDD's real value is the thinking it forces. Test state coverage, not code coverage.
- **Property-Based Testing** — Use generative testing to explore edge cases you wouldn't think of manually. Contracts + property tests are powerful.
- **Stay Safe Out There** — Minimize attack surface. Principle of least privilege. Don't trust input. Encrypt sensitive data. Patch dependencies.
- **Naming Things** — Names matter. They express intent. Rename when meaning drifts. Consistency within a team matters more than "perfect" names.

#### 8. Before the Project
- **The Requirements Pit** — Requirements are learned, not gathered. They're a process, not a document. Dig for the real need behind stated requirements.
- **Solving Impossible Puzzles** — Identify the real constraints. Some constraints are imagined. Enumerate degrees of freedom.
- **Working Together** — Pair program, mob program, or just work closely. Conway's law is real — communication shapes systems.
- **The Essence of Agility** — Agility is not a noun (not a process, framework, or ceremony). It's how you respond to change. Good design (ETC) is what enables it.

#### 9. Pragmatic Projects
- **Pragmatic Teams** — Small, stable, cross-functional teams. Maintain quality, automate everything, know when to stop.
- **Coconuts Don't Cut It** — Cargo culting processes from other organizations doesn't work. Understand *why* before adopting *what*.
- **Pragmatic Starter Kit** — Version control, regression testing, full automation. The three legs of the stool.
- **Delight Your Users** — The goal isn't to deliver code. The goal is to solve the user's business problem.
- **Pride and Prejudice** — Sign your work. Take pride in what you build. But stay open to criticism and change.

---

### The Top Principles (Quick Reference)

| Principle | Summary |
|---|---|
| ETC (Easier to Change) | The fundamental design principle |
| DRY | Single source of truth for every piece of knowledge |
| Orthogonality | Decouple components so changes stay local |
| Reversibility | Build to allow changing your mind |
| Tracer Bullets | End-to-end skeleton first, flesh out later |
| Broken Windows | Don't tolerate entropy — fix it or board it up |
| Crash Early | Dead programs are better than corrupted ones |
| Transformations | Think pipelines: input -> transforms -> output |
| Deliberate Programming | Understand *why* your code works, not just *that* it works |
| Test to Think | Tests drive design, not just verification |
