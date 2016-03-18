do
function run(msg, matches)
local reply_id = msg['id']
local Arian = 144616352
	if msg.from.id == tonumber(Arian) then
		 text = text..'مقام : مدیر کل ربات (Executive Admin) \n\n'
		elseif is_sudo(msg) then
		 text = text..'مقام : ادمین ربات (Admin) \n\n'
		elseif is_owner(msg) then
		 text = text..'مقام : مدیر کل گروه (Owner) \n\n'
		elseif is_momod(msg) then
		 text = text..'مقام : مدیر گروه (Moderator) \n\n'
		else
		 text = text..'مقام : کاربر (Member) \n\n'
		end
	  else
	   text = text..'مقام : '..value..'\n'
	  end
	end
    

local info = '#Name : '..msg.from.first_name..'\n\n'
..'♦ایدی : '..msg.from.id..'\n'
..'♦نام کاربری : @'..msg.from.username..'\n\n'
..'♦'text'\n'
..'♦ایدی گروه : '..msg.to.id..'\n'
..'♦نام گروه : '..msg.to.title'\n'1
..'♦تعداد پیام های فرستاده شده: '..user_info_msgs..
reply_msg(reply_id, info, ok_cb, false)
end

return {
patterns = {
"^(اینفو)$"
},
run = run
}

end
