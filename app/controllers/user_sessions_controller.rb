class UserSessionsController < ApplicationController
    def new
     @user_session = UserSession.new 	#новый объект типа <authlogic::session::base
					#если только так: зашол на сайт - пустая сессия, для нее генерится форма
					#сессия есть, но она пустая, но она нужна для формы
					#затем (не вижу гже вызвается, но судя по всему кнопкой ENTER после ввода логина\пароля)
					#вбиваются логин пароль, и создается НОВАЯ сессия, но параметры уже передаются и тогда
					#работает уже метод create
    end

    def create
     @user_session = UserSession.new(params[:user_session]) #парметром передается объект user_session из app контроллера
     if @user_session.save		#если сессия создалась, то гут
      redirect_to account_url		#редирект_ту - рельсовая приблуда, акк_урл - из гема аутлогика
     else
      render :action => :new		#иначе UserSessionController.new но синтаксис не понятен
     end
    end

    def destroy
     current_user_session.destroy	#метод из app.ctrl возваращеет UserSession.find
     redirect_to new_user_session_url	#приблуда руби+гема
    end
end
