do
function run(msg, matches)
local reply_id = msg['id']
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
