class WkcrmController < WkbaseController
  unloadable
  before_filter :require_login
  before_filter :check_perm_and_redirect, :only => [:index, :edit, :update, :lead_conv_rpt, :sales_act_rpt]
  before_filter :check_crm_admin_and_redirect, :only => [:destroy]
  include WkcrmHelper
	def index
	end
	
	def lead_conv_rpt
		@from = session[:wkreport][:from]
		@to = session[:wkreport][:to]
		groupId = session[:wkreport][:group_id]
		userId = session[:wkreport][:user_id]
		if userId.blank?			
			userId = isModuleAdmin('wktime_crm_group') ? User.current.id : 0
		end
		@leadList = getLeadList(@from, @to, groupId, userId)
		render :action => 'lead_conv_rpt', :layout => false
	end
	
	def sales_act_rpt
		@to = session[:wkreport][:to]
		@from = session[:wkreport][:from]
		groupId = session[:wkreport][:group_id]
		userId = session[:wkreport][:user_id]
		if userId.blank?			
			userId = isModuleAdmin('wktime_crm_group') ? User.current.id : 0
		end
		@activityList = getActivityList(@from,@to, groupId, userId)
		render :action => 'sales_act_rpt', :layout => false
	end 
  
	def updateAddress
		wkAddress = nil
		addressId = nil
	    if params[:address_id].blank? || params[:address_id].to_i == 0
		    wkAddress = WkAddress.new 
	    else
		    wkAddress = WkAddress.find(params[:address_id].to_i)
	    end
		# For Address table
		wkAddress.address1 = params[:address1]
		wkAddress.address2 = params[:address2]
		wkAddress.work_phone = params[:work_phone]
		wkAddress.city = params[:city]
		wkAddress.state = params[:state]
		wkAddress.pin = params[:pin]
		wkAddress.country = params[:country]
		wkAddress.fax = params[:fax]
		wkAddress.mobile = params[:mobile]
		wkAddress.email = params[:email]
		wkAddress.website = params[:website]
		wkAddress.department = params[:department]
		if wkAddress.valid?
			wkAddress.save
			addressId = wkAddress.id
		end		
		addressId
	end
  
	def getActRelatedIds
		relatedArr = ""	
		relatedId = nil
		if params[:related_type] == "WkOpportunity"
			relatedId = WkOpportunity.all.order(:name)
		elsif params[:related_type] == "WkLead"
			relatedId = WkLead.includes(:contact).where.not(:status => 'C').order("wk_crm_contacts.first_name, wk_crm_contacts.last_name")
		elsif params[:related_type] == "WkCrmContact"
			relatedId = WkCrmContact.includes(:lead).where(wk_leads: { status: ['C', nil] }).order(:first_name, :last_name)
		else
			relatedId = WkAccount.where(:account_type => 'A').order(:name)
		end
		if !relatedId.blank?
			relatedId.each do | entry|	
				if params[:related_type] == "WkLead"
					relatedArr <<  entry.id.to_s() + ',' + entry.contact.name  + "\n" 
				elsif params[:related_type].to_s == "WkCrmContact"
					relatedArr <<  entry.id.to_s() + ',' + entry.name  + "\n"
				else
					relatedArr <<  entry.id.to_s() + ',' + entry.name  + "\n" 
				end
			end
		end
		respond_to do |format|
			format.text  { render :text => relatedArr }
		end
    end
	
	def check_perm_and_redirect
		unless check_permission
			render_403
			return false
		end
	end
	
	def check_crm_admin_and_redirect
	  unless isModuleAdmin('wktime_crm_admin') 
	    render_403
	    return false
	  end
    end

	def check_permission
		ret = false
		return isModuleAdmin('wktime_crm_group') || isModuleAdmin('wktime_crm_admin') 
	end

end
