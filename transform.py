#!/usr/bin/env python
import json

with open('flex.json') as file:

    k = json.load(file)

    json_string = """
     {
                "31": [
                    [
                        "1",
                        "1198603f21"
                    ]
                ]
            }
    """

    for n in range(len(k)):
        k[n]['eventtype'] = "38"
        k[n]['eventdesc'] = json.loads(json_string)

    d = json.dumps(k, indent=4)

    print(d)
