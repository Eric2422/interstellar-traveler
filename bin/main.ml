open Yojson.Basic.Util

type right_ascension = { hour : float; minute : float; second : float }
type declination = { degree : float; minute : float; second : float }

let c = 299789458

let () =
    if Array.length Sys.argv < 3 then
      raise (Failure "Usage: <traveler input file> <destinations input file>");

    let traveler_json = Yojson.Basic.from_file Sys.argv.(1) in

    let age = traveler_json |> member "age" |> to_float in
    let max_speed = traveler_json |> member "max_speed" |> to_float in
    let proper_mass = traveler_json |> member "proper_mass" |> to_float in
        Printf.printf "Traveler input file: %s\n" Sys.argv.(1);
        Printf.printf "  Age: %f years\n" age;
        Printf.printf "  Maximum speed: %f c (%f m/s)\n"
          (max_speed /. float c)
          max_speed;
        Printf.printf "  Proper mass: %f kg\n" proper_mass;

        let destinations_json = Yojson.Basic.from_file Sys.argv.(2) in
        let destinations = keys destinations_json in

        Printf.printf "\nDestinations input file: %s\n" Sys.argv.(2);
        Array.iter
          (fun ele ->
            Printf.printf "- %s: %fʰ %fᵐ %fˢ, %f° %f′ %f″, %f ly\n" ele
              (destinations_json |> member ele |> member "right_ascension"
             |> member "hour" |> to_float)
              (destinations_json |> member ele |> member "right_ascension"
             |> member "minute" |> to_float)
              (destinations_json |> member ele |> member "right_ascension"
             |> member "second" |> to_float)
              (destinations_json |> member ele |> member "declination"
             |> member "degree" |> to_float)
              (destinations_json |> member ele |> member "declination"
             |> member "minute" |> to_float)
              (destinations_json |> member ele |> member "declination"
             |> member "second" |> to_float)
              (destinations_json |> member ele |> member "declination"
             |> member "second" |> to_float))
          (Array.of_list destinations)
