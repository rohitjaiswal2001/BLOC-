# Flutter BLoC Step-by-Step Learning

This project contains a step-by-step introduction to the BLoC (Business Logic Component) pattern in Flutter. 

The project has been initialized as a Git repository, and every step of the learning process has been isolated into its own branch so you can easily review the code at any exact point in time.

## How to navigate the branches
You can switch to any step in your terminal by running:
`git checkout <branch_name>`

*(To come back to the final state, run `git checkout main`)*

---

## The Steps We Took

### Step 1: Basic Counter App
**Branch:** `step1`
*   **What we did:** Added the `flutter_bloc` package and created the core foundation.
*   **Concepts Learned:**
    *   **Events**: The inputs triggered by the user (`IncrementEvent`, `DecrementEvent`).
    *   **States**: The outputs displayed by the UI (`CounterState` holding an integer).
    *   **Bloc**: The brain that maps Events to States (`CounterBloc`).
    *   **BlocProvider**: Placed in `main.dart` to make the BLoC available to the app.
    *   **BlocBuilder**: Placed in `homepage.dart` to automatically redraw the UI when the state changes.

### Step 2: Added a Reset Feature
**Branch:** `step2`
*   **What we did:** Added a "Reset" button to set the counter back to 0.
*   **Concepts Learned:** How to expand an existing BLoC by adding a new `ResetEvent`, handling it in `CounterBloc` by emitting a `count: 0` state, and triggering it via a new button in the UI.

### Step 3: Implemented Equatable
**Branch:** `step3`
*   **What we did:** Added the `equatable` package.
*   **Concepts Learned:** Dart compares objects by memory location, not by value. We learned how to `extend Equatable` on our States and Events to prevent the `BlocBuilder` from uselessly rebuilding the UI when the state hasn't actually changed.

### Step 4: Async Data Fetching
**Branch:** `step4`
*   **What we did:** Created a brand new BLoC (`DataBloc`) to simulate fetching data from the internet.
*   **Concepts Learned:** 
    *   Handling asynchronous operations using `async / await` inside the BLoC event listener.
    *   Emitting different timeline states: `DataInitial`, `DataLoading`, `DataLoaded`, and `DataError`.
    *   Using an `if/else if` block inside a `BlocBuilder` to show completely different UI widgets (like a spinning loading circle) depending on the current state.

### Step 5: Side Effects with BlocListener
**Branch:** `step5`
*   **What we did:** Wrapped our main UI in `homepage.dart` with a `BlocListener` to show a popup `SnackBar` when the counter reaches 5 or -5.
*   **Concepts Learned:**
    *   **BlocListener**: Unlike `BlocBuilder`, this widget **does not** redraw the UI. It listens to the state and is only used for "side effects" that should happen once per state change, like showing a dialog, navigating to a new screen, or displaying a SnackBar.
