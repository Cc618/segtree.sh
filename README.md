<!-- <h1><a href="src/segtree.sh"><span style="color: black">S</span><span style="color: red">egtree.sh</span></a></h1> -->

<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100% 18" fill="none">
    <text x="0" y="15" fill="#ff0000">S</text>
    <text x="12" y="15" fill="#000000">eegtree.sh</text>
</svg>

Segtree.sh is a Bash library providing a [Segment Tree](https://en.wikipedia.org/wiki/Segment_tree) data structure.

The binary operation is the sum operation.

## Usage
First, source the library :
```sh
. ./segtree.sh
```

Then, here is the workflow to create, update and query the tree :
```sh
values=(1 3 5 6 7)

# Create the segment tree
seg=($(make_seg "${values[@]}"))

# Update: Set value at index 2 to 8, values=(1 3 8 6 7)
seg=($(update_seg 2 8 "${seg[@]}"))

# Query: Get sum from index 1 to 4 (left inclusive, right exclusive)
query_seg 1 4 "${seg[@]}"

# Output:
# 17
```

## Test
A test suite is available [here](test.sh).

## License
This code is uses the [MIT](LICENSE) license.
