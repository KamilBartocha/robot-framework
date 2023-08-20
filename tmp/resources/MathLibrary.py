from robot.api.deco import keyword


@keyword("Sum List")
def sum_list(values):
    return sum(values)