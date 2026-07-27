let age =
  print_string
    "Greetings, traveler.\n\
     Enter your your age as a decimal number of years (e.g., 3.14): ";
  float_of_string (read_line ())
in
print_float age;

let speed =
  print_string
    "Enter the maximum speed of your spaceship in meters per second (m/s): ";
  float_of_string (read_line ())
in
print_float speed
