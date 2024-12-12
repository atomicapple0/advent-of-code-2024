def part_one():
    with open("./inputs/2.input", "r") as f:
        lines = f.read().splitlines(keepends=False)

    var data = List[List[Int]]()
    for i in range(len(lines)):
        line = lines[i]
        words = line.split(" ")
        row = List[Int]()
        for j in range(len(words)):
            row.append(int(words[j]))
        data.append(row)

    tot_safe = 0
    for i in range(len(data)):
        row = data[i]
        is_inc = (row[1] - row[0]) > 0
        safe = 1
        for j in range(1, len(row)):
            delta = row[j] - row[j - 1]
            if not is_inc:
                delta = -delta
            if not (1 <= delta <= 3):
                safe = 0
                break
        if safe:
            tot_safe += 1

    print(tot_safe)


fn is_safe(row: List[Int]) -> Bool:
    is_inc = (row[1] - row[0]) > 0
    for j in range(1, len(row)):
        delta = row[j] - row[j - 1]
        if not is_inc:
            delta = -delta
        if not (1 <= delta <= 3):
            return False
    return True


fn part_two() raises:
    with open("./inputs/2.input", "r") as f:
        lines = f.read().splitlines(keepends=False)

    var data = List[List[Int]]()
    for i in range(len(lines)):
        line = lines[i]
        words = line.split(" ")
        row = List[Int]()
        for j in range(len(words)):
            row.append(int(words[j]))
        data.append(row)

    tot_safe = 0
    for i in range(len(data)):
        row = data[i]

        if is_safe(row):
            tot_safe += 1
        else:
            for skip in range(len(row)):
                row_new = row
                _ = row_new.pop(skip)
                if is_safe(row_new):
                    tot_safe += 1
                    break
    print(tot_safe)


def main():
    part_one()
    part_two()
