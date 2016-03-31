do

-- Check Member
local function check_member_autorealm(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local data = cb_extra.data
  local msg = cb_extra.msg
  for k,v in pairs(result.members) do
    local member_id = v.id
    if member_id ~= our_id then
      -- Group configuration
      data[tostring(msg.to.id)] = {
        group_type = 'Realm',
        settings = {
          set_name = string.gsub(msg.to.print_name, '_', ' '),
          lock_name = 'yes',
          lock_photo = 'no',
          lock_member = 'no',
          flood = 'yes',
		  lock_link = 'yes',
		  sticker = 'ok',
		  version = '3.0',
		  groupmodel = 'normal',
		  tag = 'no',
		  lock_badw = 'no',
		  lock_english = 'no',
		  lock_join = 'no',
		  lock_media = 'no',
		  lock_share = 'no',
		  welcome = 'group'
        }
      }
      save_data(_config.moderation.data, data)
      local realms = 'realms'
      if not data[tostring(realms)] then
        data[tostring(realms)] = {}
        save_data(_config.moderation.data, data)
      end
      data[tostring(realms)][tostring(msg.to.id)] = msg.to.id
      save_data(_config.moderation.data, data)
      return send_large_msg(receiver, 'به ریلیم جدید ما خوش آمدید(welcome to new realm)')
    end
  end
end
local function check_member_realm_add(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local data = cb_extra.data
  local msg = cb_extra.msg
  for k,v in pairs(result.members) do
    local member_id = v.id
    if member_id ~= our_id then
      -- Group configuration
      data[tostring(msg.to.id)] = {
        group_type = 'Realm',
        settings = {
          set_name = string.gsub(msg.to.print_name, '_', ' '),
          lock_name = 'yes',
          lock_photo = 'no',
          lock_member = 'no',
          flood = 'yes',
		  lock_link = 'yes',
		  sticker = 'ok',
		  version = '3.0',
		  groupmodel = 'normal',
		  tag = 'no',
		  lock_badw = 'no',
		  lock_english = 'no',
		  lock_join = 'no',
		  lock_media = 'no',
		  lock_share = 'no',
		  welcome = 'group'
        }
      }
      save_data(_config.moderation.data, data)
      local realms = 'realms'
      if not data[tostring(realms)] then
        data[tostring(realms)] = {}
        save_data(_config.moderation.data, data)
      end
      data[tostring(realms)][tostring(msg.to.id)] = msg.to.id
      save_data(_config.moderation.data, data)
      return send_large_msg(receiver, 'ریلیم اضافه شد!(ream is added!)')
    end
  end
end
function check_member_group(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local data = cb_extra.data
  local msg = cb_extra.msg
  for k,v in pairs(result.members) do
    local member_id = v.id
    if member_id ~= our_id then
      -- Group configuration
      data[tostring(msg.to.id)] = {
        group_type = 'Group',
        moderators = {},
        set_owner = member_id ,
        settings = {
          set_name = string.gsub(msg.to.print_name, '_', ' '),
          lock_name = 'yes',
          lock_photo = 'no',
          lock_member = 'no',
          flood = 'yes',
		  lock_link = 'yes',
		  sticker = 'ok',
		  version = '3.0',
		  groupmodel = 'normal',
		  tag = 'no',
		  lock_badw = 'no',
		  lock_english = 'no',
		  lock_join = 'no',
		  lock_media = 'no',
		  lock_share = 'no',
		  welcome = 'group'
        }
      }
      save_data(_config.moderation.data, data)
      local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = {}
        save_data(_config.moderation.data, data)
      end
      data[tostring(groups)][tostring(msg.to.id)] = msg.to.id
      save_data(_config.moderation.data, data)
      return send_large_msg(receiver, 'شما صاحب گروه شدید(you are owner group now)')
    end
  end
end
local function check_member_modadd(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local data = cb_extra.data
  local msg = cb_extra.msg
  for k,v in pairs(result.members) do
    local member_id = v.id
    if member_id ~= our_id then
      -- Group configuration
      data[tostring(msg.to.id)] = {
        group_type = 'Group',
        moderators = {},
        set_owner = member_id ,
        settings = {
          set_name = string.gsub(msg.to.print_name, '_', ' '),
          lock_name = 'yes',
          lock_photo = 'no',
          lock_member = 'no',
          flood = 'yes',
		  lock_link = 'yes',
		  sticker = 'ok',
		  version = '3.0',
		  groupmodel = 'normal',
		  tag = 'no',
		  lock_badw = 'no',
		  lock_english = 'no',
		  lock_join = 'no',
		  lock_media = 'no',
		  lock_share = 'no',
		  welcome = 'group'
        }
      }
      save_data(_config.moderation.data, data)
      local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = {}
        save_data(_config.moderation.data, data)
      end
      data[tostring(groups)][tostring(msg.to.id)] = msg.to.id
      save_data(_config.moderation.data, data)
      return send_large_msg(receiver, 'گروه اضافه شد و شما صاحب آن شدید(group is added and you have been promoted as the owner')
    end
  end
end
local function automodadd(msg)
  local data = load_data(_config.moderation.data)
  if msg.action.type == 'chat_created' then
    receiver = get_receiver(msg)
    chat_info(receiver, check_member_group,{receiver=receiver, data=data, msg = msg})
  end
end
local function autorealmadd(msg)
  local data = load_data(_config.moderation.data)
  if msg.action.type == 'chat_created' then
    receiver = get_receiver(msg)
    chat_info(receiver, check_member_autorealm,{receiver=receiver, data=data, msg = msg})
  end
end
local function check_member_realmrem(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local data = cb_extra.data
  local msg = cb_extra.msg
  for k,v in pairs(result.members) do
    local member_id = v.id
    if member_id ~= our_id then
      -- Realm configuration removal
      data[tostring(msg.to.id)] = nil
      save_data(_config.moderation.data, data)
      local realms = 'realms'
      if not data[tostring(realms)] then
        data[tostring(realms)] = nil
        save_data(_config.moderation.data, data)
      end
      data[tostring(realms)][tostring(msg.to.id)] = nil
      save_data(_config.moderation.data, data)
      return send_large_msg(receiver, 'ریلیم حذف شد(realm is removed)')
    end
  end
end
local function check_member_modrem(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local data = cb_extra.data
  local msg = cb_extra.msg
  for k,v in pairs(result.members) do
    local member_id = v.id
    if member_id ~= our_id then
      -- Group configuration removal
      data[tostring(msg.to.id)] = nil
      save_data(_config.moderation.data, data)
      local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = nil
        save_data(_config.moderation.data, data)
      end
      data[tostring(groups)][tostring(msg.to.id)] = nil
      save_data(_config.moderation.data, data)
      return send_large_msg(receiver, 'گروه حذف شد(group is removed')
    end
  end
end
--End Check Member
local function show_group_settingsmod(msg, data, target)
 	if not is_momod(msg) then
    	return "فقط مدیران(just admins)"
  	end
  	local data = load_data(_config.moderation.data)
    if data[tostring(msg.to.id)] then
     	if data[tostring(msg.to.id)]['settings']['flood_msg_max'] then
        	NUM_MSG_MAX = tonumber(data[tostring(msg.to.id)]['settings']['flood_msg_max'])
        	print('custom'..NUM_MSG_MAX)
      	else 
        	NUM_MSG_MAX = 5
      	end
    end
    local bots_protection = "Yes"
    if data[tostring(msg.to.id)]['settings']['lock_bots'] then
    	bots_protection = data[tostring(msg.to.id)]['settings']['lock_bots']
   	end
    local leave_ban = "no"
    if data[tostring(msg.to.id)]['settings']['leave_ban'] then
    	leave_ban = data[tostring(msg.to.id)]['settings']['leave_ban']
   	end
    local lock_link = "Yes"
    if data[tostring(msg.to.id)]['settings']['lock_link'] then
    	lock_link = data[tostring(msg.to.id)]['settings']['lock_link']
   	end
    local version = "2"
    if data[tostring(msg.to.id)]['settings']['version'] then
    	version = data[tostring(msg.to.id)]['settings']['version']
   	end
    local groupmodel = "normal"
    if data[tostring(msg.to.id)]['settings']['groupmodel'] then
    	groupmodel = data[tostring(msg.to.id)]['settings']['groupmodel']
   	end
    local sticker = "ok"
    if data[tostring(msg.to.id)]['settings']['sticker'] then
    	sticker = data[tostring(msg.to.id)]['settings']['sticker']
   	end
    local tag = "no"
    if data[tostring(msg.to.id)]['settings']['tag'] then
    	tag = data[tostring(msg.to.id)]['settings']['tag']
   	end
    local lock_badw = "no"
    if data[tostring(msg.to.id)]['settings']['lock_badw'] then
    	lock_badw = data[tostring(msg.to.id)]['settings']['lock_badw']
   	end
    local lock_english = "no"
    if data[tostring(msg.to.id)]['settings']['lock_english'] then
    	lock_english = data[tostring(msg.to.id)]['settings']['lock_english']
   	end
    local lock_join = "no"
    if data[tostring(msg.to.id)]['settings']['lock_join'] then
    	lock_join = data[tostring(msg.to.id)]['settings']['lock_join']
   	end
    local lock_media = "no"
    if data[tostring(msg.to.id)]['settings']['lock_media'] then
    	lock_media = data[tostring(msg.to.id)]['settings']['lock_media']
   	end
    local lock_share = "no"
    if data[tostring(msg.to.id)]['settings']['lock_share'] then
    	lock_share = data[tostring(msg.to.id)]['settings']['lock_share']
   	end
    local welcome = "group"
    if data[tostring(msg.to.id)]['settings']['welcome'] then
    	welcome = data[tostring(msg.to.id)]['settings']['welcome']
   	end
  local settings = data[tostring(target)]['settings']
  local text = "تنظیمات گروه(group seetings):\n🛠🛠🛠🛠🛠🛠🛠🛠🛠🛠\n>قفل نام گروه(lock group name) : "..settings.lock_name.."\n>قفل عکس گروه (lock group photo): "..settings.lock_photo.."\n>قفل اعضا (lock member): "..settings.lock_member.."\n>ممنوعیت ارسال لینک (lock post link): "..lock_link.."\n>قفل ورود(lock join) : "..lock_join.."\n>قفل رسانه (lock media): "..lock_media.."\n>قفل اشتراک گذاری (lock share): "..lock_share.."\n>حساسیت اسپم(flood) : "..NUM_MSG_MAX.."\n>قفل ربات ها (lock bots): "..bots_protection.."\n>خوشامد(welcome) : "..welcome.."\n>قفل تگ(lock tag) : "..tag.."\n>قفل اینگلیسی (lock english):"..lock_english.."\n>قفل فحش(lock bad words) : "..lock_badw.."\n>مدل گروه(group mode) : "..groupmodel.."\n>ورژن (version): "..version
  return text
end

local function set_descriptionmod(msg, data, target, about)
  if not is_momod(msg) then
    return "قفط مدیران(just admins)"
  end
  local data_cat = 'توضیحات'
  data[tostring(target)][data_cat] = about
  save_data(_config.moderation.data, data)
  return 'توضیحات گروه به این متن تغییر یافت(about group is updated to this text):\n'..about
end
local function get_description(msg, data)
  local data_cat = 'توضیحات'
  if not data[tostring(msg.to.id)][data_cat] then
    return 'توضیحی موجود نیست(it is do not have about text'
  end
  local about = data[tostring(msg.to.id)][data_cat]
  local about = string.gsub(msg.to.print_name, "_", " ")..':\n\n'..about
  return 'درباره(about)'..about
end
local function lock_group_join(msg, data, target)
  if not is_momod(msg) then
    return "قفط مدیران(just admins)"
  end
  local group_join_lock = data[tostring(target)]['settings']['lock_join']
  if group_join_lock == 'yes' then
    return 'ورود از قبل قفل است(lock join was enabled)'
  else
    data[tostring(target)]['settings']['lock_join'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'ورود قفل شد(lock join has been enabled)'
  end
end

local function unlock_group_join(msg, data, target)
  if not is_momod(msg) then
    return "فقط مدیران(just for admins)"
  end
  local group_join_lock = data[tostring(target)]['settings']['lock_join']
  if group_join_lock == 'no' then
    return 'ورود از قبل آزاد است(lock join was disabled'
  else
    data[tostring(target)]['settings']['lock_join'] = 'no'
    save_data(_config.moderation.data, data)
    return 'ورود آزاد شد(lock join  has been disabled'
  end
end

local function lock_group_tag(msg, data, target)
  if not is_momod(msg) then
    return "فقط مدیران(just for admins)❗️"
  end
  local group_tag_lock = data[tostring(target)]['settings']['tag']
  if group_tag_lock == 'yes' then
    return 'تگ کردن از قبل قفل است(lock tag was enabled)🔒'
  else
    data[tostring(target)]['settings']['tag'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'تگ کردن ممنوع شد(lock tag has been enabled✅🔒'
  end
end

local function unlock_group_tag(msg, data, target)
  if not is_momod(msg) then
    return "فقط مدیران(just for admins)"
  end
  local group_tag_lock = data[tostring(target)]['settings']['tag']
  if group_tag_lock == 'no' then
    return 'تگ کردن از قبل آزاد است(lock tag was disabled)🔓'
  else
    data[tostring(target)]['settings']['tag'] = 'no'
    save_data(_config.moderation.data, data)
    return 'تگ کردن آزاد شد(lock tag has been disabled)✅🔓'
  end
end

local function lock_group_english(msg, data, target)
  if not is_momod(msg) then
    return "قفط مدیران(just for admins)❗️"
  end
  local group_english_lock = data[tostring(target)]['settings']['lock_english']
  if group_english_lock == 'yes' then
    return 'اینگلیسی از قبل قفل است(lock english was enabled)🔒'
  else
    data[tostring(target)]['settings']['lock_english'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'اینگلیسی قفل شد(lock english has been enabled✅🔒'
  end
end

local function unlock_group_english(msg, data, target)
  if not is_momod(msg) then
    return "قفط مدیران(just for admins)❗️"
  end
  local group_english_lock = data[tostring(target)]['settings']['lock_english']
  if group_english_lock == 'no' then
    return 'اینگلیسی از قبل باز است(lock english was disabled)🔓'
  else
    data[tostring(target)]['settings']['lock_english'] = 'no'
    save_data(_config.moderation.data, data)
    return 'اینگلیسی ازاد شد(lock english has been disabled)✅🔓'
  end
end

local function lock_group_badw(msg, data, target)
  if not is_momod(msg) then
    return "فقط مدیران(just for admins)❗️"
  end
  local group_badw_lock = data[tostring(target)]['settings']['lock_badw']
  if group_badw_lock == 'yes' then
    return 'فحاشی از قبل ممنوع است(lock bad words was enabled) 🔒'
  else
    data[tostring(target)]['settings']['lock_badw'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'فحاشی قفل شد(lock bad words has been enabled)✅🔒'
  end
end

local function unlock_group_badw(msg, data, target)
  if not is_momod(msg) then
    return "فقط مدیران(just for admins)❗️"
  end
  local group_badw_lock = data[tostring(target)]['settings']['lock_badw']
  if group_badw_lock == 'no' then
    return 'فحاشی از قبل آزاد است(lock bad words was disabled)🔓'
  else
    data[tostring(target)]['settings']['lock_badw'] = 'no'
    save_data(_config.moderation.data, data)
    return 'فحاشی آزاد شد(lock bad words has been disabled)✅🔓'
  end
end

local function lock_group_link(msg, data, target)
  if not is_momod(msg) then
    return "فقط مدیران(just for admins)❗️"
  end
  local group_link_lock = data[tostring(target)]['settings']['lock_link']
  if group_link_lock == 'yes' then
    return 'ارسال لینک از قبل ممنوع است(lock post links was enabled)🔒'
  else
    data[tostring(target)]['settings']['lock_link'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'ارسال لینک ممنوع شد(lock post links  has been enabled)✅🔒'
  end
end

local function unlock_group_link(msg, data, target)
  if not is_momod(msg) then
    return "فقط مدیران❗️"
  end
  local group_link_lock = data[tostring(target)]['settings']['lock_link']
  if group_link_lock == 'no' then
    return 'ارسال لینک از قبل آزاد است(lock post links was disabled)🔓'
  else
    data[tostring(target)]['settings']['lock_link'] = 'no'
    save_data(_config.moderation.data, data)
    return 'ارسال لینک آزاد شد(lock post links  has been disabled)✅🔓'
  end
end

local function lock_group_english(msg, data, target)
  if not is_momod(msg) then
    return "فقط برای مدیران(just for sudo)❗️"
  end
  local group_english_lock = data[tostring(target)]['settings']['lock_english']
  if group_english_lock == 'yes' then
    return 'اینگلیسی از قبل قفل است(lock english was disabled)🔒'
  else
    data[tostring(target)]['settings']['lock_english'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'انگلیسی قفل شد(lock english has been enabled)✅🔒'
  end
end

local function unlock_group_english(msg, data, target)
  if not is_momod(msg) then
    return "فقط مدیران(❗️"
  end
  local group_english_lock = data[tostring(target)]['settings']['lock_english']
  if group_english_lock == 'no' then
    return 'اینگلیسی از قبل آزاد است(lock english was disabled)🔓'
  else
    data[tostring(target)]['settings']['lock_english'] = 'no'
    save_data(_config.moderation.data, data)
    return 'اینگلیسی آژاد شد(lock english has been disabled)✅🔓'
  end
end

local function lock_group_bots(msg, data, target)
  if not is_momod(msg) then
    return "قفط مدیران(just for admins)"
  end
  local group_bots_lock = data[tostring(target)]['settings']['lock_bots']
  if group_bots_lock == 'yes' then
    return 'قفل ربات ها از قبل فعال است(lock bots was enabled)'
  else
    data[tostring(target)]['settings']['lock_bots'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'ورود ربات ها قفل شد(lock bots has been enabled)'
  end
end

local function unlock_group_bots(msg, data, target)
  if not is_momod(msg) then
    return "فقط مدیران"
  end
  local group_bots_lock = data[tostring(target)]['settings']['lock_bots']
  if group_bots_lock == 'no' then
    return 'ورود ربات ها از قبل آزاد است(lock bots was disabled)'
  else
    data[tostring(target)]['settings']['lock_bots'] = 'no'
    save_data(_config.moderation.data, data)
    return 'ورود ربات ها ازاد شد(lock bots has been disabled)'
  end
end

local function lock_group_namemod(msg, data, target)
  if not is_momod(msg) then
    return "فقط برای مدیران(just for admins)"
  end
  local group_name_set = data[tostring(target)]['settings']['set_name']
  local group_name_lock = data[tostring(target)]['settings']['lock_name']
  if group_name_lock == 'yes' then
    return 'نام گروه از قبل قفل است(lock group name was enabled)'
  else
    data[tostring(target)]['settings']['lock_name'] = 'yes'
    save_data(_config.moderation.data, data)
    rename_chat('chat#id'..target, group_name_set, ok_cb, false)
    return 'نام گروه قفل شد(lock group name has been enabled)'
  end
end
local function unlock_group_namemod(msg, data, target)
  if not is_momod(msg) then
    return "فقط مدیران(just for admins)"
  end
  local group_name_set = data[tostring(target)]['settings']['set_name']
  local group_name_lock = data[tostring(target)]['settings']['lock_name']
  if group_name_lock == 'no' then
    return 'نام گروه از قبل باز است(lock group name was disabled)'
  else
    data[tostring(target)]['settings']['lock_name'] = 'no'
    save_data(_config.moderation.data, data)
    return 'نام گروه باز شد(lock group name has been disabled)'
  end
end
local function lock_group_floodmod(msg, data, target)
  if not is_owner(msg) then
    return "فقط توسط گلوبال ادمین ها(just for owners)"
  end
  local group_flood_lock = data[tostring(target)]['settings']['flood']
  if group_flood_lock == 'yes' then
    return 'ارسال پیام سریع ممنوع از قبل ممنوع بود(anti fast messages was enabled)'
  else
    data[tostring(target)]['settings']['flood'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'اسپم قفل شد(lock spam has been enabled)'
  end
end

local function unlock_group_floodmod(msg, data, target)
  if not is_owner(msg) then
    return "فقط برای گلوبال ادمین ها(just for owners)"
  end
  local group_flood_lock = data[tostring(target)]['settings']['flood']
  if group_flood_lock == 'no' then
    return 'اسپم قفل نیست(spam is not locked)!'
  else
    data[tostring(target)]['settings']['flood'] = 'no'
    save_data(_config.moderation.data, data)
    return 'ارسال سریع پیام آزاد شد(anti fast messages has been disabled)'
  end
end

local function lock_group_membermod(msg, data, target)
  if not is_momod(msg) then
    return "فقط برای مدیران(just for admins)!"
  end
  local group_member_lock = data[tostring(target)]['settings']['lock_member']
  if group_member_lock == 'yes' then
    return 'ورود اعضا از قبل قفل است(lock member was enabled)'
  else
    data[tostring(target)]['settings']['lock_member'] = 'yes'
    save_data(_config.moderation.data, data)
  end
  return 'ورود اعضا قفل شد(lock member has been enabled)'
end

local function unlock_group_membermod(msg, data, target)
  if not is_momod(msg) then
    return "فقط مدیران(just for admins)"
  end
  local group_member_lock = data[tostring(target)]['settings']['lock_member']
  if group_member_lock == 'no' then
    return 'عضو گیری ازاد است(lock member is disabled)'
  else
    data[tostring(target)]['settings']['lock_member'] = 'no'
    save_data(_config.moderation.data, data)
    return 'عضو گیری ازاد شد(lock member has been disabled)'
  end
end

local function lock_group_leave(msg, data, target)
  if not is_momod(msg) then
    return "فقط برای مدیران(just for admins)"
  end
  local leave_ban = data[tostring(msg.to.id)]['settings']['leave_ban']
  if leave_ban == 'yes' then
    return 'خروج از قبل ممنوع بود(exit was locked)'
  else
    data[tostring(msg.to.id)]['settings']['leave_ban'] = 'yes'
    save_data(_config.moderation.data, data)
  end
  return 'کسانی که خارج میشوند بن خواهند شد(if someone exit from group bot ban it)'
end

local function unlock_group_leave(msg, data, target)
  if not is_momod(msg) then
    return "فقط مدیران(just for admins)!"
  end
  local leave_ban = data[tostring(msg.to.id)]['settings']['leave_ban']
  if leave_ban == 'no' then
    return 'خروج آزاد بود(exit is not locked)'
  else
    data[tostring(msg.to.id)]['settings']['leave_ban'] = 'no'
    save_data(_config.moderation.data, data)
    return 'خروج آزاد شد(exit has been unlocked)'
  end
end

local function lock_group_media(msg, data, target)
  if not is_momod(msg) then
    return "قفط مدیران(just for admins)"
  end
  local group_media_lock = data[tostring(target)]['settings']['lock_media']
  if group_media_lock == 'yes' then
    return 'رسانه از قبل قفل است(media was locked)'
  else
    data[tostring(target)]['settings']['lock_media'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'ارسال رسانه ممنوع شد(media is locked)'
  end
end

local function unlock_group_media(msg, data, target)
  if not is_momod(msg) then
    return "فقط مدیران(just for admins)"
  end
  local group_media_lock = data[tostring(target)]['settings']['lock_media']
  if group_media_lock == 'no' then
    return 'ارسال رسانه از قبل آزاد است(media was disabled)'
  else
    data[tostring(target)]['settings'][
    	'lock_media'] = 'no'
    save_data(_config.moderation.data, data)
    return 'ارسال رسانه آزاد شد(media is unlocked)'
  end
end

local function lock_group_share(msg, data, target)
  if not is_momod(msg) then
    return "قفط مدیران(just for admins)"
  end
  local group_share_lock = data[tostring(target)]['settings']['lock_share']
  if group_share_lock == 'yes' then
    return 'اشتراک گذاری شماره از قبل ممنوع است(share contact was disabled)'
  else
    data[tostring(target)]['settings']['lock_share'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'اشتراک گذاری شماره ممنوع شد(share contact is locked)'
  end
end

local function unlock_group_share(msg, data, target)
  if not is_momod(msg) then
    return "فقط مدیران(just for admins)"
  end
  local group_share_lock = data[tostring(target)]['settings']['lock_share']
  if group_share_lock == 'no' then
    return 'اشتراک گذاری شماره آزاد بود(share contact was disabled)'
  else
    data[tostring(target)]['settings']['lock_share'] = 'no'
    save_data(_config.moderation.data, data)
    return 'اشتراک گذاری شماره آزاد شد(share contact unlocked)'
  end
end

local function unlock_group_photomod(msg, data, target)
  if not is_momod(msg) then
    return "فقط مدیران(just for admins)"
  end
  local group_photo_lock = data[tostring(target)]['settings']['lock_photo']
  if group_photo_lock == 'no' then
    return 'عکس گروه قفل نیست(group photo was disabled'
  else
    data[tostring(target)]['settings']['lock_photo'] = 'no'
    save_data(_config.moderation.data, data)
    return 'عکس گروه باز شد(group photo was unlocked)'
  end
end

local function set_rulesmod(msg, data, target)
  if not is_momod(msg) then
    return "فقط مدیران(just for admins)"
  end
  local data_cat = 'قوانین'
  data[tostring(target)][data_cat] = rules
  save_data(_config.moderation.data, data)
  return 'قوانین گروه به این متن تغییر یافت(group rules is updated to this text:\n'..rules
end
local function modadd(msg)
  -- superuser and admins only (because sudo are always has privilege)
  if not is_admin(msg) then
    return "شما ادمین نیستید(you are not adminb)"
  end
  local data = load_data(_config.moderation.data)
  if is_group(msg) then
    return 'گروه از قبل اد شده(group was aleary added)'
  end
    receiver = get_receiver(msg)
    chat_info(receiver, check_member_modadd,{receiver=receiver, data=data, msg = msg})
end
local function realmadd(msg)
  -- superuser and admins only (because sudo are always has privilege)
  if not is_admin(msg) then
    return "شما ادمین نیستید(you are not admin)"
  end
  local data = load_data(_config.moderation.data)
  if is_realm(msg) then
    return 'ریلیم از قبل اد شده(realm was aleary added)'
  end
    receiver = get_receiver(msg)
    chat_info(receiver, check_member_realm_add,{receiver=receiver, data=data, msg = msg}) 
end
-- Global functions
function modrem(msg)
  -- superuser and admins only (because sudo are always has privilege)
  if not is_admin(msg) then
    return "شما ادمین نیستید(you are not admin)"
  end
  local data = load_data(_config.moderation.data)
  if not is_group(msg) then
    return 'گروه اضافه نشده(group was aleary added)'
  end
    receiver = get_receiver(msg)
    chat_info(receiver, check_member_modrem,{receiver=receiver, data=data, msg = msg})
end

function realmrem(msg)
  -- superuser and admins only (because sudo are always has privilege)
  if not is_admin(msg) then
    return "شما ادمین نیستید(you are not admin)"
  end
  local data = load_data(_config.moderation.data)
  if not is_realm(msg) then
    return 'ریلیم اد نشده(realm was not added)'
  end
    receiver = get_receiver(msg)
    chat_info(receiver, check_member_realmrem,{receiver=receiver, data=data, msg = msg})
end
local function get_rules(msg, data)
  local data_cat = 'قوانین'
  if not data[tostring(msg.to.id)][data_cat] then
    return 'قانونی موجود نیست(rules is not setted to this group)'
  end
  local rules = data[tostring(msg.to.id)][data_cat]
  local rules = 'قوانین گروه(group rules):\n'..rules
  return rules
end

local function set_group_photo(msg, success, result)
  local data = load_data(_config.moderation.data)
  local receiver = get_receiver(msg)
  if success then
    local file = 'data/photos/chat_photo_'..msg.to.id..'.jpg'
    print('File downloaded to:', result)
    os.rename(result, file)
    print('File moved to:', file)
    chat_set_photo (receiver, file, ok_cb, false)
    data[tostring(msg.to.id)]['settings']['set_photo'] = file
    save_data(_config.moderation.data, data)
    data[tostring(msg.to.id)]['settings']['lock_photo'] = 'yes'
    save_data(_config.moderation.data, data)
    send_large_msg(receiver, 'عکس ذخیره شد(photo is saved)!', ok_cb, false)
  else
    print('Error downloading: '..msg.id)
    send_large_msg(receiver, 'Failed, please try again!', ok_cb, false)
  end
end

local function promote(receiver, member_english, member_id)
  local data = load_data(_config.moderation.data)
  local group = string.gsub(receiver, 'chat#id', '')
  if not data[group] then
    return send_large_msg(receiver, 'گروه اضافه نشده')
  end
  if data[group]['moderators'][tostring(member_id)] then
    return send_large_msg(receiver, member_english..' از قبل مدیر است(was admin)')
  end
  data[group]['moderators'][tostring(member_id)] = member_english
  save_data(_config.moderation.data, data)
  return send_large_msg(receiver, member_english..' ترفیع یافت(promoted)')
end

local function promote_by_reply(extra, success, result)
    local msg = result
    local full_name = (msg.from.first_name or '')..' '..(msg.from.last_name or '')
    if msg.from.english then
      member_english = '@'.. msg.from.english
    else
      member_english = full_name
    end
    local member_id = msg.from.id
    if msg.to.type == 'chat' then
      return promote(get_receiver(msg), member_english, member_id)
    end  
end

local function demote(receiver, member_english, member_id)
  local data = load_data(_config.moderation.data)
  local group = string.gsub(receiver, 'chat#id', '')
  if not data[group] then
    return send_large_msg(receiver, 'گروه اضافه نشده(group is not added)')
  end
  if not data[group]['moderators'][tostring(member_id)] then
    return send_large_msg(receiver, member_english..' مدیر نیست (is not admin)!')
  end
  data[group]['moderators'][tostring(member_id)] = nil
  save_data(_config.moderation.data, data)
  return send_large_msg(receiver, member_english..' تنزل یافت(demoted)')
end

local function demote_by_reply(extra, success, result)
    local msg = result
    local full_name = (msg.from.first_name or '')..' '..(msg.from.last_name or '')
    if msg.from.english then
      member_english = '@'..msg.from.english
    else
      member_english = full_name
    end
    local member_id = msg.from.id
    if msg.to.type == 'chat' then
      return demote(get_receiver(msg), member_english, member_id)
    end  
end

local function setleader_by_reply(extra, success, result)
  local msg = result
  local receiver = get_receiver(msg)
  local data = load_data(_config.moderation.data)
  local name_log = msg.from.print_name:gsub("_", " ")
  data[tostring(msg.to.id)]['set_owner'] = tostring(msg.from.id)
      save_data(_config.moderation.data, data)
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] setted ["..msg.from.id.."] as leader")
      local text = msg.from.print_name:gsub("_", " ").." اکنون صاحب گروه است(now is owner) "
      return send_large_msg(receiver, text)
end

local function promote_demote_res(extra, success, result)
--vardump(result)
--vardump(extra)
      local member_id = result.id
      local member_english = "@"..result.english
      local chat_id = extra.chat_id
      local mod_cmd = extra.mod_cmd
      local receiver = "chat#id"..chat_id
      if mod_cmd == 'ترفیع' then
        return promote(receiver, member_english, member_id)
      elseif mod_cmd == 'تنزل' then
        return demote(receiver, member_english, member_id)
      end
end

local function modlist(msg)
  local data = load_data(_config.moderation.data)
  local groups = "groups"
  if not data[tostring(groups)][tostring(msg.to.id)] then
    return 'گروه اد نشده(group is not added'
  end
  -- determine if table is empty
  if next(data[tostring(msg.to.id)]['moderators']) == nil then --fix way
    return 'دراین گروه هیچ مدیری وجود ندارد(this group does not have any admin)'
  end
  local i = 1
  local message = '\nلیست مدیر های گروه(group admins list): ' .. string.gsub(msg.to.print_name, '_', ' ') .. ':\n'
  for k,v in pairs(data[tostring(msg.to.id)]['moderators']) do
    message = message ..i..' - '..v..' [' ..k.. '] \n'
    i = i + 1
  end
  return message
end

local function callbackres(extra, success, result)
--vardump(result)
  local user = result.id
  local name = string.gsub(result.print_name, "_", " ")
  local chat = 'chat#id'..extra.chatid
  send_large_msg(chat, user..'\n'..name)
  return user
end


local function help()
  local help_text = tostring(_config.help_text)
  return help_text
end

local function fa_help()
  local help_fa_text = tostring(_config.help_text)
  return help_fa_text
end

local function cleanmember(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local chat_id = "chat#id"..result.id
  local chatname = result.print_name
  for k,v in pairs(result.members) do
    kick_user(v.id, result.id)     
  end
end

local function killchat(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local chat_id = "chat#id"..result.id
  local chatname = result.print_name
  for k,v in pairs(result.members) do
    kick_user_any(v.id, result.id)     
  end
end

local function killrealm(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local chat_id = "chat#id"..result.id
  local chatname = result.print_name
  for k,v in pairs(result.members) do
    kick_user_any(v.id, result.id)     
  end
end

local function user_msgs(user_id, chat_id)
  local user_info
  local uhash = 'user:'..user_id
  local user = redis:hgetall(uhash)
  local um_hash = 'msgs:'..user_id..':'..chat_id
  user_info = tonumber(redis:get(um_hash) or 0)
  return user_info
end

local function kick_zero(cb_extra, success, result)
    local chat_id = cb_extra.chat_id
    local chat = "chat#id"..chat_id
    local ci_user
    local re_user
    for k,v in pairs(result.members) do
        local si = false
        ci_user = v.id
        local hash = 'chat:'..chat_id..':users'
        local users = redis:smembers(hash)
        for i = 1, #users do
            re_user = users[i]
            if tonumber(ci_user) == tonumber(re_user) then
                si = true
            end
        end
        if not si then
            if ci_user ~= our_id then
                if not is_momod2(ci_user, chat_id) then
                  chat_del_user(chat, 'user#id'..ci_user, ok_cb, true)
                end
            end
        end
    end
end

local function kick_inactive(chat_id, num, receiver)
    local hash = 'chat:'..chat_id..':users'
    local users = redis:smembers(hash)
    -- Get user info
    for i = 1, #users do
        local user_id = users[i]
        local user_info = user_msgs(user_id, chat_id)
        local nmsg = user_info
        if tonumber(nmsg) < tonumber(num) then
            if not is_momod2(user_id, chat_id) then
              chat_del_user('chat#id'..chat_id, 'user#id'..user_id, ok_cb, true)
            end
        end
    end
    return chat_info(receiver, kick_zero, {chat_id = chat_id})
end

local function run(msg, matches)
  local data = load_data(_config.moderation.data)
  local receiver = get_receiver(msg)
   local name_log = user_print_name(msg.from)
  local group = msg.to.id
  if msg.media then
    if msg.media.type == 'photo' and data[tostring(msg.to.id)]['settings']['set_photo'] == 'waiting' and is_chat_msg(msg) and is_momod(msg) then
      load_photo(msg.id, set_group_photo, msg)
    end
  end
  if matches[1] == 'اضافه' or matches[1] == 'add' and not matches[2] then
    if is_realm(msg) then
       return '(error : realm was added)خطا : از قبل ریلیم بوده'
    end
    print("group "..msg.to.print_name.."("..msg.to.id..") added")
    return modadd(msg)
  end
   if matches[1] == 'اضافه' or matches[1] == 'add ' and matches[2] == 'ریلیم' or matches[2] == 'realm' then
    if is_group(msg) then
       return '(error : this is a group)خطا : اینجا یک گروه است'
    end
    print("group "..msg.to.print_name.."("..msg.to.id..") added as a realm")
    return realmadd(msg)
  end
  if matches[1] == 'حذف' or matches[1] == 'rem' and not matches[2] then
    print("group "..msg.to.print_name.."("..msg.to.id..") removed")
    return modrem(msg)
  end
  if matches[1] == 'حذف' or matches[1] == 'rem' and matches[2] == 'ریلیم' or matches[2] == 'realm' then
    print("group "..msg.to.print_name.."("..msg.to.id..") removed as a realm")
    return realmrem(msg)
  end
  if matches[1] == 'chat_created' and msg.from.id == 0 and group_type == "group" then
    return automodadd(msg)
  end
  if matches[1] == 'chat_created' and msg.from.id == 0 and group_type == "realm" then
    return autorealmadd(msg)
  end

  if msg.to.id and data[tostring(msg.to.id)] then
    local settings = data[tostring(msg.to.id)]['settings']
    if matches[1] == 'chat_add_user' then
      if not msg.service then
        return "Are you trying to troll me(می خوای مسخرم کنی)?"
      end
      local group_member_lock = settings.lock_member
      local user = 'user#id'..msg.action.user.id
      local chat = 'chat#id'..msg.to.id
      if group_member_lock == 'yes' and not is_owner2(msg.action.user.id, msg.to.id) then
        chat_del_user(chat, user, ok_cb, true)
      elseif group_member_lock == 'yes' and tonumber(msg.from.id) == tonumber(our_id) then
        return nil
      elseif group_member_lock == 'no' then
        return nil
      end
    end
    if matches[1] == 'chat_del_user' then
      if not msg.service then
         return "Are you trying to troll me?"
      end
      local user = 'user#id'..msg.action.user.id
      local chat = 'chat#id'..msg.to.id
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] deleted user  "..user)
    end
    if matches[1] == 'chat_delete_photo' then
      if not msg.service then
        return "Are you trying to troll me(می خوای مسخرم کنی)?"
        end
      local group_photo_lock = settings.lock_photo
      if group_photo_lock == 'yes' then
        local picturehash = 'picture:changed:'..msg.to.id..':'..msg.from.id
        redis:incr(picturehash)
        ---
        local picturehash = 'picture:changed:'..msg.to.id..':'..msg.from.id
        local picprotectionredis = redis:get(picturehash) 
        if picprotectionredis then 
          if tonumber(picprotectionredis) == 4 and not is_owner(msg) then 
            kick_user(msg.from.id, msg.to.id)
          end
          if tonumber(picprotectionredis) ==  8 and not is_owner(msg) then 
            ban_user(msg.from.id, msg.to.id)
            local picturehash = 'picture:changed:'..msg.to.id..':'..msg.from.id
            redis:set(picturehash, 0)
          end
        end
        
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] tried to deleted picture but failed  ")
        chat_set_photo(receiver, settings.set_photo, ok_cb, false)
      elseif group_photo_lock == 'no' then
        return nil
      end
    end
    if matches[1] == 'chat_change_photo' and msg.from.id ~= 0 then
      if not msg.service then
        return "Are you trying to troll me?"
      end
      local group_photo_lock = settings.lock_photo
      if group_photo_lock == 'yes' then
        local picturehash = 'picture:changed:'..msg.to.id..':'..msg.from.id
        redis:incr(picturehash)
        ---
        local picturehash = 'picture:changed:'..msg.to.id..':'..msg.from.id
        local picprotectionredis = redis:get(picturehash) 
        if picprotectionredis then 
          if tonumber(picprotectionredis) == 4 and not is_owner(msg) then 
            kick_user(msg.from.id, msg.to.id)
          end
          if tonumber(picprotectionredis) ==  8 and not is_owner(msg) then 
            ban_user(msg.from.id, msg.to.id)
          local picturehash = 'picture:changed:'..msg.to.id..':'..msg.from.id
          redis:set(picturehash, 0)
          end
        end
        
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] tried to change picture but failed  ")
        chat_set_photo(receiver, settings.set_photo, ok_cb, false)
      elseif group_photo_lock == 'no' then
        return nil
      end
    end
    if matches[1] == 'chat_rename' then
      if not msg.service then
        return "Are you trying to troll me?"
      end
      local group_name_set = settings.set_name
      local group_name_lock = settings.lock_name
      local to_rename = 'chat#id'..msg.to.id
      if group_name_lock == 'yes' then
        if group_name_set ~= tostring(msg.to.print_name) then
          local namehash = 'name:changed:'..msg.to.id..':'..msg.from.id
          redis:incr(namehash)
          local namehash = 'name:changed:'..msg.to.id..':'..msg.from.id
          local nameprotectionredis = redis:get(namehash) 
          if nameprotectionredis then 
            if tonumber(nameprotectionredis) == 4 and not is_owner(msg) then 
              kick_user(msg.from.id, msg.to.id)
            end
            if tonumber(nameprotectionredis) ==  8 and not is_owner(msg) then 
              ban_user(msg.from.id, msg.to.id)
              local namehash = 'name:changed:'..msg.to.id..':'..msg.from.id
              redis:set(namehash, 0)
            end
          end
          
          savelog(msg.to.id, name_log.." ["..msg.from.id.."] tried to change name but failed  ")
          rename_chat(to_rename, group_name_set, ok_cb, false)
        end
      elseif group_name_lock == 'no' then
        return nil
      end
    end
    if matches[1] == 'تنظیم نام' or matches[1] == 'setname' and is_momod(msg) then
      local new_name = string.gsub(matches[2], '_', ' ')
      data[tostring(msg.to.id)]['settings']['set_name'] = new_name
      save_data(_config.moderation.data, data)
      local group_name_set = data[tostring(msg.to.id)]['settings']['set_name']
      local to_rename = 'chat#id'..msg.to.id
      rename_chat(to_rename, group_name_set, ok_cb, false)
      
      savelog(msg.to.id, "Group { "..msg.to.print_name.." }  name changed to [ "..new_name.." ] by "..name_log.." ["..msg.from.id.."]")
    end
    if matches[1] == 'تنظیم عکس' or matches[1] == 'setphoto' and is_momod(msg) then
      data[tostring(msg.to.id)]['settings']['set_photo'] = 'waiting'
      save_data(_config.moderation.data, data)
      return 'لطفا عکس جدید گروه را ارسال کنید(please send me the group photo now)'
    end
    if matches[1] == 'ترفیع' or matches[1] == 'promote' and not matches[2] then
      if not is_owner(msg) then
        return "فقط توسط صاحب گروه(just for owner)"
      end
      if type(msg.reply_id)~="nil" then
          msgr = get_message(msg.reply_id, promote_by_reply, false)
      end
    end
    if matches[1] == 'ترفیع' or matches[1] == 'promote' and matches[2] then
      if not is_momod(msg) then
        return
      end
      if not is_owner(msg) then
        return "فقط توسط صاحب گروه(just for owner)"
      end
	local member = matches[2]
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] promoted @".. member)
	local cbres_extra = {
	chat_id = msg.to.id,
        mod_cmd = 'ترفیع', 
	from_id = msg.from.id
	}
	local english = matches[2]
	local english = string.gsub(matches[2], '@', '')
	return res_user(english, promote_demote_res, cbres_extra)
    end
    if matches[1] == 'تنزل' or matches[1] == 'demote' and not matches[2] then
      if not is_owner(msg) then
        return "فقط توسط صاحب گروه(just for owner)"
      end
      if type(msg.reply_id)~="nil" then
          msgr = get_message(msg.reply_id, demote_by_reply, false)
      end
    end
    if matches[1] == 'تنزل' or matches[1] == 'demote' and matches[2] then
      if not is_momod(msg) then
        return
      end
      if not is_owner(msg) then
        return "فقط توسط صاحب گروه(just for owner)"
      end
      if string.gsub(matches[2], "@", "") == msg.from.english and not is_owner(msg) then
        return "شما نمیتوانید مقام خود را حذف کنید(you can not demote yourself)"
      end
	local member = matches[2]
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] demoted @".. member)
	local cbres_extra = {
	chat_id = msg.to.id,
        mod_cmd = 'تنزل', 
	from_id = msg.from.id
	}
	local english = matches[2]
	local english = string.gsub(matches[2], '@', '')
	return res_user(english, promote_demote_res, cbres_extra)
    end
    if matches[1] == 'لیست مدیران' or matches[1] == 'modlist' then
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested group modlist")
      return modlist(msg)
    end
    if matches[1] == 'توضیحات' or matches[1] == 'about' then
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested group description")
      return get_description(msg, data)
    end
    if matches[1] == 'قوانین' or matches[1] == 'rules' then
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested group rules")
      return get_rules(msg, data)
    end
    if matches[1] == 'تنظیم' or matches[1] == 'set' then
      if matches[2] == 'قوانین' or matches[2] == 'rules'then
        rules = matches[3]
        local target = msg.to.id
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] has changed group rules to ["..matches[3].."]")
        return set_rulesmod(msg, data, target)
      end
      if matches[2] == 'توضیحات' or matches[2] == 'about' then
        local data = load_data(_config.moderation.data)
        local target = msg.to.id
        local about = matches[3]
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] has changed group description to ["..matches[3].."]")
        return set_descriptionmod(msg, data, target, about)
      end
    end
    if matches[1] == 'قفل' or matches[1] == 'lock' then
      local target = msg.to.id
      if matches[2] == 'نام' or matches[2] == 'name' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked name ")
        return lock_group_namemod(msg, data, target)
      end
      if matches[2] == 'اعضا' or matches[2] == 'member' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked member ")
        return lock_group_membermod(msg, data, target)
        end
      if matches[2] == 'اسپم' or matches[2] == 'flood' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked flood ")
        return lock_group_floodmod(msg, data, target)
      end
      if matches[2] == 'ورود' or matches[2] == 'join' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked join ")
        return lock_group_join(msg, data, target)
      end
      if matches[2] == 'رسانه' or matches[2] == 'media' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked media ")
        return lock_group_media(msg, data, target)
      end
      if matches[2] == 'اشتراک گذاری' or matches[2] == 'share' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked share ")
        return lock_group_share(msg, data, target)
      end
      if matches[2] == 'ربات ها' or matches[2] == 'bots' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked bots ")
        return lock_group_bots(msg, data, target)
      end
      if matches[2] == 'لینک' or matches[2] == 'link' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked link🔒 ")
        return lock_group_link(msg, data, target)
      end
      if matches[2] == 'تگ' or matches[2] == 'tag' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked tag🔒 ")
        return lock_group_tag(msg, data, target)
      end
      if matches[2] == 'فحش' or matches[2] == 'badw' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked badw🔒 ")
        return lock_group_badw(msg, data, target)
      end
      if matches[2] == 'اینگلیسی' or matches[2] == 'english' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked english🔒 ")
        return lock_group_english(msg, data, target)
      end
    if matches[2] == 'خروج' or matches[2] == 'leave' then
       savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked leaving ")
       return lock_group_leave(msg, data, target)
     end
   end
    if matches[1] == 'بازکردن' or matches[1] == 'unlock' then 
      local target = msg.to.id
      if matches[2] == 'نام' or matches[2] == 'name' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked name ")
        return unlock_group_namemod(msg, data, target)
      end
      if matches[2] == 'اعضا' or matches[2] == 'member' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked member ")
        return unlock_group_membermod(msg, data, target)
      end
      if matches[2] == 'عکس' or matches[2] == 'photo' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked photo ")
        return unlock_group_photomod(msg, data, target)
      end
      if matches[2] == 'اسپم' or matches[2] == 'flood' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked flood ")
        return unlock_group_floodmod(msg, data, target)
      end
      if matches[2] == 'ورود' or matches[2] == 'join' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked join ")
        return unlock_group_join(msg, data, target)
      end
	  if matches[2] == 'رسانه' or matches[2] == 'media' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked media ")
        return unlock_group_media(msg, data, target)
      end
	  if matches[2] == 'اشتراگ گذاری' or matches[2] == 'share' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked share ")
        return unlock_group_share(msg, data, target)
      end
      if matches[2] == 'ربات ها' or matches[2] == 'bots' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked bots ")
        return unlock_group_bots(msg, data, target)
      end
      if matches[2] == 'لینک' or matches[2] == 'link' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked link🔓 ")
        return unlock_group_link(msg, data, target)
      end
      if matches[2] == 'تگ' or matches[2] == 'tag' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked tag🔓 ")
        return unlock_group_tag(msg, data, target)
      end
      if matches[2] == 'فحش' or matches[2] == 'badw' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked badw🔓 ")
        return unlock_group_badw(msg, data, target)
      end
      if matches[2] == 'اینگلیسی' or matches[2] == 'english' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked english🔓 ")
        return unlock_group_english(msg, data, target)
      end
    if matches[2] == 'خروج' or matches[2] == 'leave' then
       savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked leaving ")
       return unlock_group_leave(msg, data, target)
     end
   end
    if matches[1] == 'setversion' then
	  if not is_sudo(msg) then
       return "فقط برای سودو(just for sudo)❗️"
      end
      if matches[2] == '1.0' then
        if version ~= '1.0' then
          data[tostring(msg.to.id)]['settings']['version'] = '1.0'
          save_data(_config.moderation.data, data)
        end
        return 'group version has been changed to 1.0'
      end
      if matches[2] == '2.0' then
        if version ~= '2.0' then
          data[tostring(msg.to.id)]['settings']['version'] = '2.0'
          save_data(_config.moderation.data, data)
        end
        return 'group version has been changed to 2.0'
      end
      if matches[2] == '3.0' then
        if version == '3.0' then
          return 'group version has been changed to 3.0'
        else
          data[tostring(msg.to.id)]['settings']['version'] = '3.0'
          save_data(_config.moderation.data, data)
          return 'group version has been changed to 3.0'
        end
      end
    end
    if matches[1] == 'setgroup' then
	  if not is_sudo(msg) then
       return "فقط برای سودو❗️"
      end
      if matches[2] == 'realm' then
        if groupmodel ~= 'realm' then
          data[tostring(msg.to.id)]['settings']['groupmodel'] = 'realm'
          save_data(_config.moderation.data, data)
        end
        return 'Group model has been changed to realm'
      end
      if matches[2] == 'support' then
        if groupmodel ~= 'support' then
          data[tostring(msg.to.id)]['settings']['groupmodel'] = 'support'
          save_data(_config.moderation.data, data)
        end
        return 'Group model has been changed to support'
      end
      if matches[2] == 'feedback' then
        if groupmodel ~= 'feedback' then
          data[tostring(msg.to.id)]['settings']['groupmodel'] = 'feedback'
          save_data(_config.moderation.data, data)
        end
        return 'Group model has been changed to feedback'
      end
      if matches[2] == 'vip' then
        if groupmodel ~= 'vip' then
          data[tostring(msg.to.id)]['settings']['groupmodel'] = 'vip'
          save_data(_config.moderation.data, data)
        end
        return 'Group model has been changed to vip'
      end
      if matches[2] == 'normal' then
        if groupmodel == 'normal' then
          return 'Group model has been changed to normal'
        else
          data[tostring(msg.to.id)]['settings']['groupmodel'] = 'normal'
          save_data(_config.moderation.data, data)
          return 'Group model has been changed to normal'
        end
      end
    end
    if matches[1] == 'settings' or matches[1] == 'تنظیمات' then
      local target = msg.to.id
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested group settings ")
      return show_group_settingsmod(msg, data, target)
    end	

    if matches[1] == 'لینک جدید' or matches[1] == 'newlink' and not is_realm(msg) then
      if not is_momod(msg) then
        return "فقط برای مدیران(just for admins)"
      end
      local function callback (extra , success, result)
        local receiver = 'chat#'..msg.to.id
        if success == 0 then
           return send_large_msg(receiver, '*خطا : \nربات سازنده گروه نیست(error : robot does not created this group)')
        end
        send_large_msg(receiver, "لینک جدید ساخته شد(new link is created)")
        data[tostring(msg.to.id)]['settings']['set_link'] = result
        save_data(_config.moderation.data, data)
      end
      local receiver = 'chat#'..msg.to.id
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] revoked group link ")
      return export_chat_link(receiver, callback, true)
    end
    if matches[1] == 'لینک' or matches[1] == 'link' then
      if not is_momod(msg) then
        return "فقط مدیران(just for admins)"
      end
      local group_link = data[tostring(msg.to.id)]['settings']['set_link']
      if not group_link then 
        return "اول با لینک جدید یک  لینک جدید بسازید(first make a new link by ! or /newlink"
      end
       savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested group link ["..group_link.."]")
      return "لینک گروه(group link):\n🤖🇮🇷🤖🇮🇷🤖🇮🇷🤖🇮🇷🤖🇮🇷🤖🇮🇷🤖🇮🇷🤖🇮🇷🤖🇮🇷🤖🇮🇷\n"..group_link
    end
      if matches[1] == 'لینک خصوصی' or matches[1] == 'linkpv' then
      if not is_momod(msg) then
        return "فقط برای مدیران(just for admins)"
      end
      local group_link = data[tostring(msg.to.id)]['settings']['set_link']
      if not group_link then 
        return "اول با لینک جدید یک  لینک جدید بسازید(first make a new link by ! or /newlink"
      end
       savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested group link ["..group_link.."]")
     send_large_msg('user#id'..msg.from.id, "لینک گروه:\n🤖🇮🇷🤖🇮🇷🤖🇮🇷🤖🇮🇷🤖🇮🇷🤖🇮🇷🤖🇮🇷🤖🇮🇷🤖🇮🇷🤖🇮🇷\n"..group_link)
    end
    if matches[1] == 'دارنده' and matches[2] then
      if not is_owner(msg) then
        return "شما مجاز نیستید"
      end
      data[tostring(msg.to.id)]['set_owner'] = matches[2]
      save_data(_config.moderation.data, data)
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] set ["..matches[2].."] as leader")
      local text = matches[2].." added as leader"
      return text
    end
    if matches[1] == 'دارنده' or matches[1] == 'setleader' and not matches[2] then
      if not is_owner(msg) then
        return "شما مجاز نیستید(you may not)"
      end
      if type(msg.reply_id)~="nil" then
          msgr = get_message(msg.reply_id, setleader_by_reply, false)
      end
    end
    if matches[1] == 'صاحب گروه' or matches[1] == 'owner' then
      local group_leader = data[tostring(msg.to.id)]['set_owner']
      if not group_leader then 
        return "no leader,ask admins in support groups to set leader for your group"
      end
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] used /leader")
      return "آیدی صاحب گروه(owner id) : ["..group_leader..']'
    end
    if matches[1] == 'صاحب' or matches[1] == 'setgpleader' then
      local receiver = "chat#id"..matches[2]
      if not is_admin(msg) then
        return "فقط برای ادمین ها(For admins only!)"
      end
      data[tostring(matches[2])]['set_owner'] = matches[3]
      save_data(_config.moderation.data, data)
      local text = matches[3].." added as leader"
      send_large_msg(receiver, text)
      return
    end
    if matches[1] == 'حساسیت'  or matches[1] == 'setflood' then 
      if not is_momod(msg) then
        return "شما مجاز نیستید(you may not)"
      end
      if tonumber(matches[2]) < 5 or tonumber(matches[2]) > 20 then
        return "عددی از بین 5 و 20 انتخاب کنید(select an number between 5 and 20)"
      end
      local flood_max = matches[2]
      data[tostring(msg.to.id)]['settings']['flood_msg_max'] = flood_max
      save_data(_config.moderation.data, data)
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] set flood to ["..matches[2].."]")
      return 'حساسیت اسپم تغییر یافت به (flood is now:)'..matches[2]
    end
    if matches[1] == 'پاک کردن' or matches[1] == 'clean' then
      if not is_owner(msg) then
        return "شما مجاز نیستید(you may not)"
      end
      if matches[2] == 'اعضا' or matches[2] == 'member' then
        if not is_owner(msg) then
          return "شما مجاز نیستید(you may not)"
        end
        local receiver = get_receiver(msg)
        chat_info(receiver, cleanmember, {receiver=receiver})
      end
      if matches[2] == 'مدیران' or matches[2] == 'modlist' then
        if next(data[tostring(msg.to.id)]['moderators']) == nil then --fix way
          return 'مدیری در گروه نیست(the group does not have any admin)'
        end
        local message = '\nلیست مدیران گروه(group admins list:) ' .. string.gsub(msg.to.print_name, '_', ' ') .. ':\n'
        for k,v in pairs(data[tostring(msg.to.id)]['moderators']) do
          data[tostring(msg.to.id)]['moderators'][tostring(k)] = nil
          save_data(_config.moderation.data, data)
        end
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] cleaned modlist")
      end
      if matches[2] == 'rules' or matches[2] == 'قوانین' then 
        local data_cat = 'قوانین'
        data[tostring(msg.to.id)][data_cat] = nil
        save_data(_config.moderation.data, data)
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] cleaned rules")
      end
      if matches[2] == 'توضیحات' or matches[2] == 'about' then 
        local data_cat = 'توضیحات'
        data[tostring(msg.to.id)][data_cat] = nil
        save_data(_config.moderation.data, data)
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] cleaned about")
      end     
    end
    if matches[1] == 'kill' and matches[2] == 'chat' then
      if not is_admin(msg) then
          return nil
      end
      if not is_realm(msg) then
          local receiver = get_receiver(msg)
          return modrem(msg),
          print("Closing Group..."),
          chat_info(receiver, killchat, {receiver=receiver})
      else
          return 'This is a realm'
      end
   end
    if matches[1] == 'kill' and matches[2] == 'realm' then
     if not is_admin(msg) then
         return nil
     end
     if not is_group(msg) then
        local receiver = get_receiver(msg)
        return realmrem(msg),
        print("Closing Realm..."),
        chat_info(receiver, killrealm, {receiver=receiver})
     else
        return 'This is a group'
     end
   end
    if matches[1] == 'help' or matches[1] == 'help'and matches[2] =='en' then
      if not is_momod(msg) or is_realm(msg) then
        return
      end
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] Used /help")
      return help()
    end
    if matches[1] == 'راهنما' or matches[1] == 'help'and matches[2] =='fa' then
      if not is_momod(msg) or is_realm(msg) then
        return
      end
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] Used /help")
      return fa_help()
    end
    if matches[1] == 'کد' or matches[1] == 'res' and is_momod(msg) then 
      local cbres_extra = {
        chatid = msg.to.id
      }
      local english = matches[2]
      local english = english:gsub("@","")
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] Used /res "..english)
      return res_user(english,  callbackres, cbres_extra)
    end
    if matches[1] == 'kickinactive' then
      --send_large_msg('chat#id'..msg.to.id, 'I\'m in matches[1]')
	    if not is_momod(msg) then
	      return 'Only a moderator can kick inactive users'
	    end
	    local num = 1
	    if matches[2] then
	        num = matches[2]
	    end
	    local chat_id = msg.to.id
	    local receiver = get_receiver(msg)
      return kick_inactive(chat_id, num, receiver)
    end
  end 
end

return {
  patterns = {
  "^(اضافه)$",
  "^(اضافه) (ریلیم)$",
  "^(حذف)$",
  "^(حذف) (ریلیم)$",
  "^(قوانین)$",
  "^(توضیحات)$",
  "^(تنظیم نام) (.*)$",
  "^(تنظیم عکس)$",
  "^(ترفیع) (.*)$",
  "^(ترفیع)",
  "^(پاک کردن) (.*)$",
  "^(kill) (chat)$",
  "^(kill) (realm)$",
  "^(تنزل) (.*)$",
  "^(تنزل)",
  "^(تنظیم) ([^%s]+) (.*)$",
  "^(قفل) (.*)$",
  "^(دارنده) (%d+)$",
  "^(دارنده)",
  "^(صاحب گروه)$",
  "^(کد) (.*)$",
  "^(صاحب) (%d+) (%d+)$",-- (group id) (leader id)
  "^(بازکردن) (.*)$",
  "^(حساسیت) (%d+)$",
  "^(تنظیمات)$",
  "^(لیست مدیران)$",
  "^(لینک جدید)$",
  "^(لینک)$",
  "^(لینک خصوصی)$",
  "^(setversion) (.*)$",
  "^(setgroup) (.*)$",
  "^(add)$",
  "^(add) (realm)$",
  "^(rem)$",
  "^(rem) (realm)$",
  "^(rules)$",
  "^(about)$",
  "^(setname) (.*)$",
  "^(help) (en)$",
  "^(help)$",
  "^(setphoto)$",
  "^(promote) (.*)$",
  "^(promote)",
  "^(clean) (.*)$",
  "^(demote) (.*)$",
  "^(demote)",
  "^(set) ([^%s]+) (.*)$",
  "^(lock) (.*)$",
  "^(setleader) (%d+)$",
  "^(setleader)",
  "^(owner)$",
  "^(res) (.*)$",
  "^(setgpleader) (%d+) (%d+)$",
  "^(unlock) (.*)$",
  "^(setflood) (%d+)$",
  "^(settings)$",
  "^(modlist)$",
  "^(newlink)$",
  "^(link)$",
  "^(kickinactive)$",
  "^(kickinactive) (%d+)$",
  "^(linkpv)$",
  "^[!/#](add)$",
  "^[!/#](add) (realm)$",
  "^[!/#](rem)$",
  "^[!/#](rem) (realm)$",
  "^[!/#](rules)$",
  "^[!/#](about)$",
  "^[!/#](setname) (.*)$",
  "^[!/#](help) (en)$",
  "^[!/#](help)$",
  "^[!/#](setphoto)$",
  "^[!/#](promote) (.*)$",
  "^[!/#](promote)",
  "^[!/#](clean) (.*)$",
  "^[!/#](demote) (.*)$",
  "^[!/#](demote)",
  "^[!/#](set) ([^%s]+) (.*)$",
  "^[!/#](lock) (.*)$",
  "^[!/#](setleader) (%d+)$",
  "^[!/#](setleader)",
  "^[!/#](owner)$",
  "^[!/#](res) (.*)$",
  "^[!/#](setgpleader) (%d+) (%d+)$",
  "^[!/#](unlock) (.*)$",
  "^[!/#](setflood) (%d+)$",
  "^[!/#](settings)$",
  "^[!/#](modlist)$",
  "^[!/#](newlink)$",
  "^[!/#](link)$",
  "^[!/#](linkpv)$",
  "%[(photo)%]",
  "^!!tgservice (.+)$",
  },
  run = run
}
end
