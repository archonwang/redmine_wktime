  get 'wktime/index', :to => 'wktime#index'

  get 'wktime/getissues', :to => 'wktime#getissues'

  get 'wktime/getactivities', :to => 'wktime#getactivities'
  
  get 'wktime/getusers', :to => 'wktime#getusers'

  get 'wktime/getMembersbyGroup', :to => 'wktime#getMembersbyGroup'
  
  get 'wktime/deleterow', :to => 'wktime#deleterow'

  get 'wktime/export', :to => 'wktime#export'
  
  match 'wktime/edit', :to => 'wktime#edit', :via => [:get, :post]

  get 'wktime/new', :to => 'wktime#new'
			  
  post 'wktime/update', :to => 'wktime#update'
			  
  delete 'wktime/destroy', :to => 'wktime#destroy'
  
  get 'wktime/getStatus', :to => 'wktime#getStatus' 
  
  get 'wktime/getTracker', :to => 'wktime#getTracker'
  
  delete 'wktime/deleteEntries', :to => 'wktime#deleteEntries'
  
  post 'wktime/sendSubReminderEmail', :to => 'wktime#sendSubReminderEmail'
  
  post 'wktime/sendApprReminderEmail', :to => 'wktime#sendApprReminderEmail'
  
  get 'wktime/testapi', :to => 'wktime#testapi' 
  
  #get 'wktime/updateAttendance', :to => 'wktime#updateAttendance'
match 'updateAttendance', :controller => 'wktime', :action => 'updateAttendance', :via => [:get]  
    
  get 'wktime/time_rpt', :to => 'wktime#time_rpt'  
  
  #For Weekly expenses
  
  get 'wkexpense/index', :to => 'wkexpense#index'
  
  get 'wkexpense/new', :to => 'wkexpense#new'
  
  get 'wkexpense/getusers', :to => 'wkexpense#getusers'
  
  get 'wkexpense/getMembersbyGroup', :to => 'wkexpense#getMembersbyGroup'
  
  match 'wkexpense/edit', :to => 'wkexpense#edit', :via => [:get, :post]
  
  delete 'wkexpense/destroy', :to => 'wkexpense#destroy'
  
  post 'wkexpense/update', :to => 'wkexpense#update'
  
  get 'wkexpense/deleterow', :to => 'wkexpense#deleterow'

  get 'wkexpense/export', :to => 'wkexpense#export'
  
  get 'wkexpense/getissues', :to => 'wkexpense#getissues'

  get 'wkexpense/getactivities', :to => 'wkexpense#getactivities'
  
  post 'wkexpense/sendSubReminderEmail', :to => 'wkexpense#sendSubReminderEmail'
  
  post 'wkexpense/sendApprReminderEmail', :to => 'wkexpense#sendApprReminderEmail'  
  
  #For Weekly expense report
  
  get 'projects/wk_expense_entries/reportdetail' , :to => 'wkexpense#reportdetail'
  
  get 'projects/wk_expense_entries/report' , :to => 'wkexpense#report'
  
  delete 'wkexpense/deleteEntry', :to => 'wkexpense#deleteEntry'
  
  delete 'wkexpense/deleteEntries', :to => 'wkexpense#deleteEntries' 
  
  get 'wkexpense/time_rpt', :to => 'wkexpense#time_rpt' 
 
  resources :projects do	
	resources :wk_expense_entries, :controller => 'wkexpense' do
		collection do
			get 'reportdetail' 
			get 'report'
		end
	end   
  end
  
  #For Attendance
	resources :wk_attendances, :controller => 'wkimportattendance'  do
	  collection do
		post 'show'
	  end
	end
  get 'wkattendance/index', :to => 'wkattendance#index'
  
  post 'wkattendance/index', :to => 'wkattendance#index'
   
  match 'wkattendance/edit', :to => 'wkattendance#edit', :via => [:get, :post]
			  
  post 'wkattendance/update', :to => 'wkattendance#update'
   
  get 'wkattendance/getIssuesByProject', :to => 'wkattendance#getIssuesByProject'
   
  get 'wkattendance/getProjectByIssue', :to => 'wkattendance#getProjectByIssue' 

   get 'wkattendance/clockindex', :to => 'wkattendance#clockindex'
   
   post 'wkattendance/clockindex', :to => 'wkattendance#clockindex'

  match 'wkattendance/clockedit', :to => 'wkattendance#clockedit', :via => [:get, :post]  

get 'wkattendance/getGroupMembers', :to => 'wkattendance#getGroupMembers'
  
  get 'wkattendance/getMembersbyGroup', :to => 'wkattendance#getMembersbyGroup'
  
  post 'wkattendance/saveClockInOut', :to => 'wkattendance#saveClockInOut'
  
  #For Report   
  get 'wkreport/index', :to => 'wkreport#index'
   
  get 'wkreport/reportattn', :to => 'wkreport#reportattn'  
  
  match 'updateClockInOut', :controller => 'wkattendance', :action => 'updateClockInOut', :via => [:get]
  
  get 'wkreport/getGroupMembers', :to => 'wkreport#getGroupMembers'
  
  get 'wkreport/getMembersbyGroup', :to => 'wkreport#getMembersbyGroup'
  
  get 'wkattendance/runPeriodEndProcess', :to => 'wkattendance#runPeriodEndProcess'
  
  #For payroll
  get 'wkpayroll/index', :to => 'wkpayroll#index'
  
  get 'wkpayroll/edit', :to => 'wkpayroll#edit'
  
  get 'wkpayroll/payslip_rpt', :to => 'wkpayroll#payslip_rpt' 
  
  post 'wkpayroll/updateUserSalary', :to => 'wkpayroll#updateUserSalary'
  
  get 'wkpayroll/user_salary_settings', :to => 'wkpayroll#user_salary_settings'
  
  get 'wkpayroll/getGroupMembers', :to => 'wkpayroll#getGroupMembers'
  
  get 'wkpayroll/getMembersbyGroup', :to => 'wkpayroll#getMembersbyGroup'
  
  post 'wkpayroll/generatePayroll', :to => 'wkpayroll#generatePayroll'
  
   get 'wkpayroll/payroll_rpt', :to => 'wkpayroll#payroll_rpt'
   
   get 'wkpayroll/usrsettingsindex', :to => 'wkpayroll#usrsettingsindex'
   
   post 'wkpayroll/usrsettingsindex', :to => 'wkpayroll#usrsettingsindex'
   
   
    #For Billing
    get 'wkbilling/index', :to => 'wkbilling#index'	
	
	get 'wkaccount/index', :to => 'wkaccount#index'
	
	match 'wkaccount/index', :to => 'wkaccount#index', :via => [:get, :post]
	
	post 'wkaccount/update', :to => 'wkaccount#update'
	
	get 'wkaccount/edit', :to => 'wkaccount#edit'	
	
	delete 'wkaccount/destroy', :to => 'wkaccount#destroy'
	
	get 'wkcontracts/index', :to => 'wkcontracts#index'
	
	
	get 'wkaccountproject/index', :to => 'wkaccountproject#index'
	
	get 'wktax/index', :to => 'wktax#index'	
	
	get 'wkinvoice/index', :to => 'wkinvoice#index'	
	
	post 'wktax/index', :to => 'wktax#index'
	
	get 'wkinvoice/invoiceedit', :to => 'wkinvoice#invoiceedit'
	
	get 'wkinvoice/getAccountProjIds', :to => 'wkinvoice#getAccountProjIds'
    
	get 'wktax/edit', :to => 'wktax#edit'
	
	post 'wktax/update', :to => 'wktax#update'	
	
	delete 'wktax/destroy', :to => 'wktax#destroy'
	
	get 'wkinvoice/edit', :to => 'wkinvoice#edit'	
	
	post 'wkinvoice/update', :to => 'wkinvoice#update'
	
	delete 'wkinvoice/destroy', :to => 'wkinvoice#destroy'
	
	get 'wkaccountproject/edit', :to => 'wkaccountproject#edit'
	
	delete 'wkaccountproject/destroy', :to => 'wkaccountproject#destroy'
	
	post 'wkaccountproject/update', :to => 'wkaccountproject#update'
	
	get 'wkcontract/index', :to => 'wkcontract#index'
	
	get 'wkcontract/edit', :to => 'wkcontract#edit'
	
	post 'wkcontract/update', :to => 'wkcontract#update'
	
	delete 'wkcontract/destroy', :to => 'wkcontract#destroy'
	
	get 'wkinvoice/invreport', :to => 'wkinvoice#invreport' 

	# For Accounting
	
	get 'wkgltransaction/index', :to => 'wkgltransaction#index'	
	
	get 'wkgltransaction/edit', :to => 'wkgltransaction#edit'
	
	get 'wkgltransaction/update', :to => 'wkgltransaction#update'
	
	delete 'wkgltransaction/destroy', :to => 'wkgltransaction#destroy'
	
	get 'wkledger/index', :to => 'wkledger#index'
	
	get 'wkledger/edit', :to => 'wkledger#edit'
	
	get 'wkledger/update', :to => 'wkledger#update'
	
	delete 'wkledger/destroy', :to => 'wkledger#destroy'
  
	get 'wkaccounting/pl_rpt', :to => 'wkaccounting#pl_rpt'
	
	get 'wkaccounting/balance_sheet', :to => 'wkaccounting#balance_sheet'
	
	get 'wkbase/updateClockInOut', :to => 'wkbase#updateClockInOut'
	
	# For CRM
	
	get 'wkcrm/index', :to => 'wkcrm#index'
	
	get 'wklead/index', :to => 'wklead#index'
	
	post 'wklead/index', :to => 'wklead#index'
	
	post 'wklead/update', :to => 'wklead#update'
	
	get 'wklead/edit', :to => 'wklead#edit'	
	
	get 'wklead/show', :to => 'wklead#show'	
	
	get 'wklead/covert', :to => 'wklead#convert'
	
	delete 'wklead/destroy', :to => 'wklead#destroy'
	
	get 'wkopportunity/index', :to => 'wkopportunity#index'
	
	get 'wkcrmactivity/index', :to => 'wkcrmactivity#index'
	
	get 'wkcrmcontact/index', :to => 'wkcrmcontact#index'
	
    get 'wkcrmactivity/edit', :to => 'wkcrmactivity#edit'
	
	get 'wkcrm/getActRelatedIds', :to => 'wkcrm#getActRelatedIds'
	
	get 'wkcrmactivity/update', :to => 'wkcrmactivity#update'
	
	delete 'wkcrmactivity/destroy', :to => 'wkcrmactivity#destroy'
	
	get 'wkopportunity/edit', :to => 'wkopportunity#edit'
	
	get 'wkopportunity/update', :to => 'wkopportunity#update'

    delete 'wkopportunity/destroy', :to => 'wkopportunity#destroy'

	post 'wkopportunity/index', :to => 'wkopportunity#index'
	
	get 'wkcrmcontact/edit', :to => 'wkcrmcontact#edit'
	
	post 'wkcrmcontact/update', :to => 'wkcrmcontact#update'
	
	delete 'wkcrmcontact/destroy', :to => 'wkcrmcontact#destroy'
	
	get 'wkcrmenumeration/index', :to => 'wkcrmenumeration#index'
	
	get 'wkcrmenumeration/edit', :to => 'wkcrmenumeration#edit'
	
	post 'wkcrmenumeration/update', :to => 'wkcrmenumeration#update'
	
	delete 'wkcrmenumeration/destroy', :to => 'wkcrmenumeration#destroy' 
	
	get 'wkcrm/lead_conv_rpt', :to => 'wkcrm#lead_conv_rpt'
	
	get 'wkcrm/sales_act_rpt', :to => 'wkcrm#sales_act_rpt'