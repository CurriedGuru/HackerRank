// https://www.hackerrank.com/challenges/big-sorting/problem

use std::io;
use std::cmp::Ordering;

fn read_integer() -> usize {
    let mut line = String::new();
    io::stdin().read_line(&mut line)
        .expect("Failed to read from stdin");
    let int: usize = match line.trim().parse() {
        Ok(num) => num,
        Err(_) => 0,
    };
    return int;
}

fn read_string(line: &mut String) {
    io::stdin().read_line(line)
        .expect("Failed to read from stdin");
}

fn insert_string(list: &mut Vec<String>, str: String) {
    let mut index: i32 = (list.len() as i32) - 1;
    while index >= 0 {
        let curr = match list.get(index as usize) {
            Some(x) => x,
            None => break,
        };

        if curr.len() < str.len() || (curr.len() == str.len() && curr.cmp(&str) == Ordering::Less) {
            break;
        }
        index = index - 1;
    }
    list.insert((index+1) as usize, str);
}

fn main() {
    let mut n = read_integer();
    let mut list: Vec<String> = Vec::with_capacity(n);
    while n > 0 {
        let mut str = String::new();
        read_string(&mut str);
        let str = str.trim_end().to_string();
        insert_string(&mut list, str);
        n = n - 1;
    }
    for str in list {
        println!("{}", str);
    }
}

