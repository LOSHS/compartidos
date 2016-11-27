SELECT CAST(AES_ENCRYPT('My contrena de usuario', UNHEX(SHA2('My encriptado',512)))  AS CHAR(100) CHARACTER SET utf8);


SELECT AES_DECRYPT(AES_ENCRYPT('My contrena de usuario', UNHEX(SHA2('My encriptado',512))), UNHEX(SHA2('My encriptado',512)));

SELECT CAST(AES_DECRYPT(AES_ENCRYPT('My contrena de usuario', UNHEX(SHA2('My encriptado',512))), UNHEX(SHA2('My encriptado',512)))AS CHAR(100) CHARACTER SET utf8);
