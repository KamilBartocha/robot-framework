from robot.api.deco import keyword


ROBOT_LIBRARY_VERSION = "0.0.1"


@keyword
def sum_list(values_list):
    """
    Sum all list values

    Example:
    | Sum List | ${counters_list} |
    """
    return sum([float(element) for element in values_list])
