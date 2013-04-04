# encoding: utf-8
class ApplicationController < ActionController::Base
  #protect_from_forgery

  before_filter :params_filter
  def params_filter
    if RUBY_VERSION >= '1.9'
      self.utf8nize(params)
    end
  end

  def utf8nize(obj)
    if obj.is_a? String
      if obj.respond_to?(:force_encoding)
        obj.force_encoding("UTF-8")
      else
        obj
      end
    elsif obj.is_a? Hash
      obj.each {|key, val|
              obj[key] = self.utf8nize(val)
          }
    elsif obj.is_a? Array
      obj.map {|val| self.utf8nize(val)}
    else
      obj
    end
  end

  #----------------------------------------------------------------------------
  def current_user_session
    @current_user_session ||= Authentication.find
  end
  
  #----------------------------------------------------------------------------
  def current_user
    @current_user ||= (current_user_session && current_user_session.record) 
  end

  #----------------------------------------------------------------------------
  def require_user
    unless current_user
      result = {
        :success => false,
        :msg     => '请先登录帐号'
      }
      respond_to do |format|
        format.json { render :json => result }
      end
    end   
  end


  #----------------------------------------------------------------------------
  def require_no_user
=begin    
    if current_user
      store_location
      flash[:notice] = t(:msg_logout_needed)
      redirect_to profile_url
    end
=end    
  end

  # Get list of records for a given model class.
  #----------------------------------------------------------------------------
  def get_list_of_records(klass, options = {})
    items = klass.name.tableize
    self.current_page = options[:page]           if options[:page]
    per_page          = options[:per_page]       if options[:per_page]

    wants = request.format
    scope = klass.scoped
    scope = scope.page(current_page).per(per_page)
    scope
  end

  # Proxy current page for any of the controllers by storing it in a session.
  #----------------------------------------------------------------------------
  def current_page=(page)
    @current_page = session["#{controller_name}_current_page".to_sym] = page.to_i
  end

  #----------------------------------------------------------------------------
  def current_page
    page = params[:page] || session["#{controller_name}_current_page".to_sym] || 1
    @current_page = page.to_i
  end

end