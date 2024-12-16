# fn:
# default is immutable ref.

# def:
# default is immutable ref. if mutated, it will copy it.

# conventions: borrowed, inout, owned, ref????
# & and &mut seem superior :/

# 171183089
# 63866497

from collections import Optional


fn munch_num(data: String, inout idx: Int) raises -> Int:
    var acc = String()
    acc += munch_digit(data, idx)

    # i miss you ? operator
    try:
        acc += munch_digit(data, idx)
    except:
        pass

    try:
        acc += munch_digit(data, idx)
    except:
        pass

    return int(acc)


fn munch_digit(data: String, inout idx: Int) raises -> String:
    if not (idx < len(data) and data[idx].isdigit()):
        raise Error()
    x = data[idx]
    idx += 1
    return x


fn munch_char(data: String, inout idx: Int, c: String) raises:
    if not (idx < len(data) and data[idx] == c):
        raise Error()
    idx += 1


fn part_one() raises:
    with open("./inputs/3.input", "r") as f:
        data = f.read()

    # look for mul
    acc = 0
    prev_idx = 0
    while prev_idx < len(data):
        try:
            var idx = prev_idx
            munch_char(data, idx, "m")
            munch_char(data, idx, "u")
            munch_char(data, idx, "l")
            munch_char(data, idx, "(")
            val1 = munch_num(data, idx)
            munch_char(data, idx, ",")
            val2 = munch_num(data, idx)
            munch_char(data, idx, ")")
            acc += val1 * val2
            prev_idx = idx
        except:
            prev_idx += 1
    print(acc)


fn match_mul(data: String, inout idx: Int) raises -> Int:
    munch_char(data, idx, "m")
    munch_char(data, idx, "u")
    munch_char(data, idx, "l")
    munch_char(data, idx, "(")
    val1 = munch_num(data, idx)
    munch_char(data, idx, ",")
    val2 = munch_num(data, idx)
    munch_char(data, idx, ")")
    return val1 * val2


fn match_do(data: String, inout idx: Int) raises:
    munch_char(data, idx, "d")
    munch_char(data, idx, "o")
    munch_char(data, idx, "(")
    munch_char(data, idx, ")")


fn match_dont(data: String, inout idx: Int) raises:
    munch_char(data, idx, "d")
    munch_char(data, idx, "o")
    munch_char(data, idx, "n")
    munch_char(data, idx, "'")
    munch_char(data, idx, "t")
    munch_char(data, idx, "(")
    munch_char(data, idx, ")")


fn part_two() raises:
    with open("./inputs/3.input", "r") as f:
        data = f.read()

    # look for mul
    acc = 0
    prev_idx = 0
    ok = True
    while prev_idx < len(data):
        try:
            idx = prev_idx
            x = match_mul(data, idx)
            if ok:
                acc += x
            prev_idx = idx
            continue
        except:
            pass
        try:
            idx = prev_idx
            match_dont(data, idx)
            ok = False
            prev_idx = idx
            continue
        except:
            pass
        try:
            idx = prev_idx
            match_do(data, idx)
            ok = True
            prev_idx = idx
            continue
        except:
            pass
        prev_idx += 1

    print(acc)


fn main() raises:
    part_one()
    part_two()
