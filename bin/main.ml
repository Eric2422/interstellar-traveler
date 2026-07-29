let () =
  if Array.length Sys.argv < 2 then raise (Failure "Missing input filepath")

let json = Yojson.Basic.from_file Sys.argv.(1)

let age =
  print_string
    "Greetings, traveler.\nEnter your your age in years (decimals accepted): ";
  float_of_string (read_line ())

let max_speed =
  print_string
    "Enter the maximum speed of your spaceship in meters per second (m/s): ";
  float_of_string (read_line ())

let proper_mass =
  print_string "Enter the proper mass of your spaceship in kilograms (kg): ";
  float_of_string (read_line ())
