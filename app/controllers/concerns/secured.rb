module Secured
  #concern
  #modulo donde pueden ser puestos metodos
  #que se pueden usados por varios controladores
  #tambien concerns para modelos
  def authenticate_user!
    # Bearer <token>
    token_regex = /Bearer (\w+)/
    # leer header Authorization
    headers = request.headers
    #verificar que sea valido
    if headers['Authorization'].present? && header['Authorization'].match(token_regex)
      token = header['Authorization'].match(token_regex)[1]
      if(Current.user = User.find_by_auth_token(token))
        return
      end
    end
    #verifiar que el toquen corresponda a un usuario
    render json: {error: 'unauthorized'}, status: :unauthorized
  end
end
