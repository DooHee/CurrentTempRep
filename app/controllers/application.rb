# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time 
#это было в стандартном контроллере
  filter_parameter_logging :password, :password_confirmation 	#хуй значет что
  helper_method :current_user_session, :current_user		#тоже хз

   private				#все ниже может быть вызвано скорее всего только
					# текущим инстансом контроллера
					#а т.к. все контроллеры наследуются от app - каждый инстанс
					#каждого конртоллера
    def current_user_session
     return @current_user_session if defined?(@current_user_session)
     @current_user_session = UserSession.find
    end
					#вернуть текущую сессию если она уже забита в переменную


    def current_user
     return @current_user if defined?(@current_user)
     @current_user = current_user_session && current_user_session.user	#как я подозреваю паарметры сессии + юзер
    end


  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'bd706a08beefdb2368d2545bcfadc4f6'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
end
