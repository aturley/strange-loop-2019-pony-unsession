*Getting in the Saddle with the Pony Programming Language*

Andrew Turley

twitter: @casio_juarez

---

## What is Pony

Pony is
* object-oriented
* actor-based
* compiled
* statically typed

---

## Why Pony

* concurrency is built-in with actors
* no data races

[code](https://playground.ponylang.io/?gist=a0b96fe606b487861c7cdc7fd971495a)

---

## Avoiding Data Races -- Aliases

An alias is a name for an object

Aliases have reference capabilities

There are three things you can do to an object with an alias:
* read from it
* write to it
* send it a message (if it is an alias to an actor)

[code](https://playground.ponylang.io/?gist=310cb1f5df09cc732c98110696123c60)

---

## Avoiding Data Races -- Aliases

Aliases must refer to some object (no null pointers)

Aliases are assigned values from:
* new objects
* exiting objects that have or had aliases

[code](https://playground.ponylang.io/?gist=d90f6d0cd1d813bdd90ac5d7ec2a447a)

---

## Avoiding Data Races -- Aliases

Pony's "no data races" guarantee comes from controling how aliases are used to access objects from different actors

Aliases are controlled by reference capabilities

REFERENCE CAPABILITIES

REF CAPS

---

## Avoiding Data Races -- Rules

There are two rules:

1. If there is a writable alias to an object then no other actor can have a readable or writable alias to that object
2. If there are no writable aliases to an object then more than one actor can have a readable alias to that object

---

## Reference Capabilities

* tag -- no read, no write
* ref ("reference") -- read, write
* val ("value") -- read, no write
* iso ("isolated") -- read, write
* box -- read, no write
* trn ("transitional") -- read, write

All reference capabilities can be used to send a message to an actor

---

## tag

A tag alias can be used to send messages to an actor.

[code](https://playground.ponylang.io/?gist=d90f6d0cd1d813bdd90ac5d7ec2a447a)

---

## ref

A ref alias can be used to read or write to an object.

It makes no guarantees about how many other readable or writable aliases exist.

No other actor can have a read or write alias to the aliased object.

[code](https://playground.ponylang.io/?gist=d90f6d0cd1d813bdd90ac5d7ec2a447a)

---

## val

A val alias can only be used read an object.

It guarantees that there are no writable aliases to this object.

Multiple actors can have val aliases that point to the same object.

[code](https://playground.ponylang.io/?gist=d90f6d0cd1d813bdd90ac5d7ec2a447a)

---

## iso

An iso alias can be used to read or write an object.

It guaranteeds that there are no other readable or writeable aliases to the object.

If you "give up" an iso alias then you know there are no readable or writeable aliases, so you could safely pass the object to another actor and it could create a readable alias.

[code](https://playground.ponylang.io/?gist=d05b9dee59ee58eb37e62c3a0777f9e4)

---

## box

A box alias can be used to read an object.

It makes no guarantees about how many other readable or writable aliases exist.

This lets you write code that can handle either val aliases or ref aliases, as long as the code only reads the object.

[code](https://playground.ponylang.io/?gist=56ee95f5a1ef091f39aa3bc1ed6a57b5)

---

# trn

A trn alias can read or write an object.

It guarantees that there are no other writable aliases, but there might be other readable aliases.

This is mostly used for creating a writable object, modifying it, and then creating a val (read-only) alias to the object.
