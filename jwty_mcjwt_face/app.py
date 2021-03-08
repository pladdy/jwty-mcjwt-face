import falcon
import json
import jwt

# slurp in public key for decoding
with open("./public.key") as f:
    public_key = f.read()


class JWTClaims:
    def on_get(self, request, response):
        request_jwt = request.params.get("jwt", "")

        response.body = json.dumps(
            jwt.decode(
                request_jwt,
                public_key,
                audience="pladdy-server",
                algorithms=["RS256"],
            )
        )
        response.status = falcon.HTTP_200


api = falcon.API()

jwt_claims_resources = JWTClaims()

api.add_route("/decode", jwt_claims_resources)
