import jwt


# 传入JWT和当前用户，验证用户身份
def check_JWT(encoded_jwt, secret_key):
    try:
        decode_jwt = jwt.decode(encoded_jwt, secret_key, algorithms=['HS256'])
        return decode_jwt
    except:
        return False

