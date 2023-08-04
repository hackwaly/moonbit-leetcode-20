// / @param {String} s
// / @return {Bool}
pub func isValid(s : String) -> Bool {
  l := s.length()
  var i = 0
  var stack = List::Nil
  while i < l {
    c := s.get(i)
    stack = match (stack, c) {
      (_, '(' | '[' | '{') => Cons(c, stack)
      (Cons('(', stack2), ')') => stack2
      (Cons('[', stack2), ']') => stack2
      (Cons('{', stack2), '}') => stack2
      _ => {
        return false
      }
    }
    i = i + 1
  }
  return match stack {
    Nil => true
    Cons(_) => false
  }
}

func init {
  fn test(s) {
    (if isValid(s) {
      "ok"
    } else {
      "fail"
    }).print()
  }

  test("()")
  test("()[]{}")
  test("(]")
}

