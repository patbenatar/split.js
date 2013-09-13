# Split.js

A super lightweight library to pick a sample group for users in split tests
and persist that decision in a cookie.

## Dependencies
* jQuery
* [jQuery.cookie](https://github.com/carhartl/jquery-cookie)

## Usage

### Decisions with a callback

```javascript
Split.test("experiment_name", ["group_a", "group_b"], function (group) {
  // Do some cool stuff with the group
  $("nav").addClass(group)

  if (group == "group_a") {
    alert("Welcome to Group A!");
  }
});
```

### Simple decision making

```
group = Split.test("experiment_name", ["group_a", "group_b"])
// => "group_a"
```

### Recall previous decisions

```
group = Split.test("experiment_name")
// => "group_a"
```

### Typecasting

Split will attempt to typecast cookie values into numbers and booleans so you
can split test with those types:

```javascript
Split.test("is_awesome", [true, false])
=> true

Split.test("number_of_buttons", [1, 2, 3, 4])
=> 3
```