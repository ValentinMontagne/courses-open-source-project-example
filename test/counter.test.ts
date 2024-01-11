import { expect, test } from 'vitest';
import { count } from '../src/counter';

test('count with state at 3 should be equal to 4', () => {
  expect(count(3)).toBe(5);
});
