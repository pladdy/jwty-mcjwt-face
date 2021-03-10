import falcon
from falcon import testing

import json
import pytest

from jwty_mcjwt_face.app import api


@pytest.fixture
def client():
    return testing.TestClient(api)


def test_decode(client):
    with open("./tests/test_jwt.txt") as f:
        test_jwt = f.read().rstrip()

    expected_claims = {
        "iss": "pladdy-jwt",
        "aud": "pladdy-server",
    }

    response = client.simulate_get(f"/decode?jwt={test_jwt}")

    assert response.status == falcon.HTTP_OK
    result = json.loads(response.content)
    result.pop("iat")  # ignore the iat since it changes
    assert result == expected_claims
