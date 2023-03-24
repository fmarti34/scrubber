# Scrubber

## Prerequisites

To use Scrubber, you'll need to have Ruby installed on your system. It was tested with Ruby 3.0.0

## Installation
To install Scrubber, simply clone this repository:

```
git clone https://github.com/fmarti34/scrubber.git
```

## Usage
To run the Scrubber, use the following command:

```
$ ruby scrub.rb sensitive_fields.txt input.json
```
Where sensitive_fields.txt is a file containing the list of fields to be scrubbed and input.json is the input file to be scrubbed.

For example you can use the files that are in `spec/tests/`

```
ruby scrub.rb spec/tests/06_nested_object/sensitive_fields.txt spec/tests/06_nested_object/input.json
```
which will give you an output of:
```
{
  "name": "***** ***",
  "id": 12324,
  "contact": {
    "email": "****@*******.***",
    "phone": "**********"
  }
}
```

## Testing
To run the RSpec tests, use the following command:

```
$ rspec spec/scrubber_spec.rb
```

This will run the tests in spec/scrubber_spec.rb and output the results. These tests are 
tests that were provided in the google drive.
