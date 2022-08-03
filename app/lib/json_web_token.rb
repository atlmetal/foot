require 'net/http'
require 'uri'

class JsonWebToken
  # Metodo que va a verificar el token que le pasemos y en caso de ser valido va a retornar el
  # contenido del mismo. En caso de ser invalido va a aroojar una excepcion.
  def self.verify(token)
    JWT.decode(token, nil,
              # Muy importante! Verify the signature of this token
              true, # Verify the signature of this token
              # El algortimo usado para la firma. RS256 usa una llave privada para generar la firma
              # Esta llave privada esta custodiada por Auth0 asi que no debemos preocuparnos por esto.
              # Para validar la firma se utiliza una llave publica que es literalmente publica y se
              # puede encontrar en el caso de este ejemplo en https://pepeplatzi.auth0.com/.well-known/jwks.json.
              # Para ver la llave publica de tu dominio Auth0 debes reemplazar "pepeplatzi" con tu
              # usuario de Auth0. Cualquiera puede ver esta llave asi que es seguro publicarla y compartirla.
              # El objetivo es permitirle a otras partes verificar firmas generadas por tu aplicacion.
              algorithm: 'RS256',
              # Quien emite este token. Usa tu dominio de Auth0
              iss: 'dev-xouhogfh.us.auth0.com',
              # Verificar que el token fue emitido por lo que pusimos en "iss"
              verify_iss: true,
              # Para quien fue emitido este token. Aqui debes colocar tu Client ID de Auth0
              aud: 'ZIZ2rnGH3iRipa3UNbksMuGbbHgUKElR',
              # Verificar que el token fue emitido para lo que pusimos en "aud"
              verify_aud: true) do |header|
      # Dentro de este bloque se especifica como obtener la llave publica para verificar la firma
      # de este token. En este caso, delegamos esa tarea al metodo jwks_hash
      jwks_hash[header['kid']]
    end
  end

  def self.jwks_hash
    # Obtenemos la llave publica del dominio de Auth0
    jwks_raw = Net::HTTP.get URI("https://simon0191.auth0.com/.well-known/jwks.json")
    # Decodificamos la llave publica y la retornamos
    jwks_keys = Array(JSON.parse(jwks_raw)['keys'])
    Hash[
      jwks_keys
      .map do |k|
        [ k['kid'], OpenSSL::X509::Certificate.new(Base64.decode64(k['x5c'].first)).public_key]
      end
    ]
  end
end
