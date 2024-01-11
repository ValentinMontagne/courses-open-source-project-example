export function count(state: number): number {
  return state + 1;
}

export function setupCounter(element: HTMLButtonElement): void {
  var toto;
  let counter = 0;

  const setCounter = (count: number): void => {
    counter = count;
    element.innerHTML = `count is ${counter}`;
  };
  element.addEventListener('click', () => setCounter(count(counter)));
  setCounter(0);
}
