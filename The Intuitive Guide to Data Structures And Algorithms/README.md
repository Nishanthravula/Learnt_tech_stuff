# The Intuitive Guide to Data Structures And Algorithms
```
This is not a freaking textbook. No confusing academic jargon. No long lists of properties to memorize. No proofs. Because that stuff doesn't help you actually get it.

Here's what does: Learning what to picture in your head when you think of a dynamic array or a hash map. Learning how to think in algorithms.

That's what this guide is focused on—giving you a visual, intuitive sense for how data structures and algorithms actually work.

So if you've got a big coding interview coming up, or you never learned data structures and algorithms in school, or you did but you're kinda hazy on how some of this stuff fits together...

This guide will fill in the gaps in your knowledge and make you say, "Oooh, that's how that works."

We'll walk you through it all, step by step. Starting from the beginning.

```

# 1.Big O Notation
## Using not-boring math to measure code's efficiency

## The idea behind big O notation

Big O notation is the language we use for talking about how long an algorithm takes to run. It's how we compare the efficiency of different approaches to a problem.

It's like math except it's an awesome, not-boring kind of math where you get to wave your hands through the details and just focus on what's basically happening.

With big O notation we express the runtime in terms of—brace yourself—how quickly it grows relative to the input, as the input gets arbitrarily large.

Let's break that down:

   1. **how quickly the runtime grows—** It's hard to pin down the exact runtime of an algorithm. It depends on the speed of the processor, what else the computer is running, etc. So instead of talking about the runtime directly, we use big O notation to talk about how quickly the runtime grows.
   2. **relative to the input—** If we were measuring our runtime directly, we could express our speed in seconds. Since we're measuring how quickly our runtime grows, we need to express our speed in terms of...something else. With Big O notation, we use the size of the input, which we call "n." So we can say things like the runtime grows "on the order of the size of the input" (O(n)O(n)O(n)) or "on the order of the square of the size of the input" (O(n2)O(n^2)O(n2)).
   3. **as the input gets arbitrarily large—** Our algorithm may have steps that seem expensive when n is small but are eclipsed eventually by other steps as n gets huge. For big O analysis, we care most about the stuff that grows fastest as the input grows, because everything else is quickly eclipsed as n gets very large. (If you know what an asymptote is, you might see why "big O analysis" is sometimes called "asymptotic analysis.")

If this seems abstract so far, that's because it is. Let's look at some examples.


## Some examples
```python
def print_first_item(items):
    print(items[0])
```
* **This function runs in O(1) time (or "constant time") relative to its input.** The input list could be 1 item or 1,000 items, but this function would still just require one "step." 
```python
 def print_all_items(items):
     for item in items:
         print(item)
  ```   
* **This function runs in O(n) time (or "linear time"), where n is the number of items in the list.** If the list has 10 items, we have to print 10 times. If it has 1,000 items, we have to print 1,000 times. 

```python
def print_all_possible_ordered_pairs(items):
    for first_item in items:
        for second_item in items:
            print(first_item, second_item)
```
* **Here we're nesting two loops. If our list has n items, our outer loop runs n times and our inner loop runs n times for each iteration of the outer loop, giving us n^2 total prints.** Thus this function runs in O(n^2) time (or "quadratic time"). If the list has 10 items, we have to print 100 times. If it has 1,000 items, we have to print 1,000,000 times. 

## N could be the actual input, or the size of the input
 Both of these functions have O(n) runtime, even though one takes an integer as its input and the other takes a list: 
```python
def say_hi_n_times(n):
    for time in range(n):
        print("hi")


def print_all_items(items):
    for item in items:
        print(item)
```
* So sometimes n is an actual number that's an input to our function, and other times n is the number of items in an input list (or an input map, or an input object, etc.). 

## Drop the constants
This is why big O notation rules. When you're calculating the big O complexity of something, you just throw out the constants. So like: 
```python
def print_all_items_twice(items):
    for item in items:
        print(item)

    # Once more, with feeling
    for item in items:
        print(item)

```
* This is O(2n), which we just call O(n). 
```python
def print_first_item_then_first_half_then_say_hi_100_times(items):
    print(items[0])

    middle_index = len(items) // 2
    index = 0
    while index < middle_index:
        print(items[index])
        index += 1

    for time in range(100):
        print("hi")
```
* This isO(1+n/2+100), which we just call O(n). 
* Why can we get away with this? Remember, for big O notation we're looking at what happens **as n gets arbitrarily large**. As n gets really big, adding 100 or dividing by 2 has a decreasingly significant effect. 

## Drop the less significant terms 
```python
def print_all_numbers_then_all_pair_sums(numbers):
    print("these are the numbers:")
    for number in numbers:
        print(number)

    print("and these are their sums:")
    for first_number in numbers:
        for second_number in numbers:
            print(first_number + second_number)
```
Here our runtime is O(n + n^2), which we just call O(n2)O(n^2)O(n2). Even if it was O(n^2/2 + 100n), it would still be O(n^2). 
Similarly: 
* O(n^3+50n^2+10000) is O(n^3)
* O((n + 30) * (n + 5)) is O(n^2) 
