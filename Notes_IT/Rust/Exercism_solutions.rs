// exercism solution Exercism solution

// leap year solution
pub fn is_leap_year(year: i64) -> bool {
    match (year % 4, year % 100, year % 400) {
        (0, 0, 0) => true,
        (0, 0, _) => false,
        (0, _, _) => true,
        (_, _, _) => false,
    }
}


// raindrop solution
pub fn raindrops(x: u32) -> String {
    let is_factor = |factor| x % factor == 0;
    let mut rez = String::new();

    if is_factor(3) { rez.push_str("Pling"); }
    if is_factor(5) { rez.push_str("Plang"); }
    if is_factor(7) { rez.push_str("Plong"); }

    if rez.is_empty() { rez = x.to_string(); }

    rez
}
