actor Main
  new create(env: Env) =>
    let person: Person val = recover Person("Andrew Turley", 40) end

    Shaker.shake(person, env.out)

    env.out.print(person.age().string())

class Person
  var _name: String
  var _age: U64

  new create(n: String, a: U64) =>
    _name = n
    _age = a

  fun name(): String =>
    _name

  fun ref increment_age() =>
    _age = _age + 1

  fun age(): U64 =>
    _age

actor Shaker
  be shake(person: Person val, out: OutStream) =>
    out.print("shaking " + person.name())
    shake(person, out)
