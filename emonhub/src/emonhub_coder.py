import struct

# Initialize nodes data
nodelist = {}


def check_datacode(datacode):

    # Data types & sizes (number of bytes)
    datacodes = {'b': '1', 'h': '2', 'i': '4', 'l': '4', 'q': '8', 'f': '4', 'd': '8',
                 'B': '1', 'H': '2', 'I': '4', 'L': '4', 'Q': '8', 'c': '1', '?': '1'}

    # if datacode is valid return the data size in bytes
    if datacode in datacodes:
        return int(datacodes[datacode])
    # if not valid return False
    else:
        return False


def decode(datacode, frame):
    # Ensure little-endian & standard sizes used
    e = '<'

    # set the base data type to bytes
    b = 'B'

    # get data size from data code
    s = int(check_datacode(datacode))

    result = struct.unpack(e + datacode[0], struct.pack(e + b*s, *frame))
    if datacode in ['l', 'L']:
        if result[0] == 2147483647:
            return 0

    return result[0]

def encode(datacode, value):
    # Ensure little-endian & standard sizes used
    e = '<'

    # set the base data type to bytes
    b = 'B'

    # get data size from data code
    s = int(check_datacode(datacode))

    #value = 60
    #datacode = "b"
    result = struct.unpack(e + b*s, struct.pack(e + datacode, value))
    return result
