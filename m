Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD82634778D
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Mar 2021 12:40:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3983D1678;
	Wed, 24 Mar 2021 12:39:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3983D1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616586045;
	bh=cq0sRsnHjnWoxMVrC9CPGMFEHfUac72l6IpkhdeXXjo=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GY8RR5AP3P+c+tHR11i0Gi/hV0puKBISWY9nFmRd5wFlxhVKNVc9+RbBcqJJ0bbF3
	 5p24qw1rds/TD+zw/elH529cwWZjp6fUZ6Z8cnuMV7wgxERobVj44kHCH7fVQNKXzA
	 RE2hrqstFw/ueEZBaRiw6+C6n5hnrH1AHmhKPugs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 784CEF8012B;
	Wed, 24 Mar 2021 12:39:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FFE6F8016B; Wed, 24 Mar 2021 12:39:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODYSUB_10,PRX_BODY_13,PRX_BODY_30,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8AB4AF8012B
 for <alsa-devel@alsa-project.org>; Wed, 24 Mar 2021 12:39:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AB4AF8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="CN4OrppP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616585948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yQlpyQ/vr/OBSLNJnD0CF7lNA6NTYpffZaQOeLtn3V8=;
 b=CN4OrppPZuuA2W3TpNaVnYFYOkVzfqFuuvO37qO0x0PJfF6HAYxNiCoX28SqFlCJlckvID
 VC36wtiqkf0RlQMAfp6wXBwADCOGIDyAb1TBOdDCvb0SWQVUDJrDWIAWTLUE4x3fpoGolG
 aOnGYgKxfgoUDaCI5Y7sqTL1iMNowlk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-8-HFnJszPGyavQgkFkDDYg-1; Wed, 24 Mar 2021 07:39:06 -0400
X-MC-Unique: 8-HFnJszPGyavQgkFkDDYg-1
Received: by mail-ej1-f70.google.com with SMTP id r26so773924eja.22
 for <alsa-devel@alsa-project.org>; Wed, 24 Mar 2021 04:39:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yQlpyQ/vr/OBSLNJnD0CF7lNA6NTYpffZaQOeLtn3V8=;
 b=MwkvWRFiDVm+3abSExzZaMa9o5nmOatbnqyQYgHljrcSJ+DXwnoHUprm1+xIkIlyBi
 rrthY0MOuLoliRmjNWijDi/1TuQuu+E13UGmn9HEwT3yDstUlZGCwrnqFLxYuH/YBmYk
 eIHtF9pC1nEGj6DKedRIHSWJmJ+054famXO1W/pMRDA/X1Zh/isdfQv3sU7nDJ/+eNRh
 FCNoRgiCmJjWBrLmOOrYarfmpHY4kqyFEo/Nt9FG+oVg4nWMubRk3TdC9tpjW+OSVFoN
 OCoELafmwVqC+et+mbxXL6rIB6ZVrYfsMMQhpmUHnCnrl2gH7226txtu5vGcJbDOzZte
 Ve9A==
X-Gm-Message-State: AOAM532IdxLzWAiI3VcWm26UgBvMFPeqj71pQ5go3omq9HCD7NJiQU9T
 0vTydpFah7upgzNuxbTCo/JMoKxn25BBxQOIezCNjPlDYmd2YK0g2KDZvKmzRxTg5fAYTK66255
 K4htm4YcE+6S8nmT3llpws2I=
X-Received: by 2002:aa7:cc98:: with SMTP id p24mr2891510edt.187.1616585943530; 
 Wed, 24 Mar 2021 04:39:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlb03076b49shouyZ+X5vdtx5BqpvLwCHC60yDEY2fCBaz6nNqcO6WDmonwJpoxz+qe0Dmaw==
X-Received: by 2002:aa7:cc98:: with SMTP id p24mr2891468edt.187.1616585942836; 
 Wed, 24 Mar 2021 04:39:02 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id gb22sm775144ejc.78.2021.03.24.04.39.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 04:39:02 -0700 (PDT)
Subject: Re: [PATCH v5 1/2] platform/x86: dell-privacy: Add support for Dell
 hardware privacy
From: Hans de Goede <hdegoede@redhat.com>
To: Perry Yuan <Perry.Yuan@dell.com>, pobrn@protonmail.com,
 pierre-louis.bossart@linux.intel.com, oder_chiou@realtek.com,
 perex@perex.cz, tiwai@suse.com, mgross@linux.intel.com,
 Mario.Limonciello@dell.com
References: <20210322093841.11840-1-Perry_Yuan@Dell.com>
 <78effa03-c5ab-ad93-9add-85cdc7134786@redhat.com>
Message-ID: <ea2ea8cc-68db-1b8a-ab1a-74664dda2694@redhat.com>
Date: Wed, 24 Mar 2021 12:39:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <78effa03-c5ab-ad93-9add-85cdc7134786@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: platform-driver-x86@vger.kernel.org, alsa-devel@alsa-project.org,
 broonie@kernel.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

On 3/24/21 12:19 PM, Hans de Goede wrote:
> Hi,
> 
> On 3/22/21 10:38 AM, Perry Yuan wrote:
>> From: Perry Yuan <perry_yuan@dell.com>
>>
>> add support for Dell privacy driver for the Dell units equipped
>> hardware privacy design, which protect users privacy of audio and
>> camera from hardware level. Once the audio or camera privacy mode
>> activated, any applications will not get any audio or video stream
>> when user pressed ctrl+F4 hotkey, audio privacy mode will be
>> enabled, micmute led will be also changed accordingly
>> The micmute led is fully controlled by hardware & EC(embedded controller)
>> and camera mute hotkey is Ctrl+F9. Currently design only emmits
>> SW_CAMERA_LENS_COVER event while the camera lens shutter will be
>> changed by EC & hw(hadware) control
>>
>> *The flow is like this:
>> 1) User presses key. HW does stuff with this key (timeout timer is started)
>> 2) WMI event is emitted from BIOS to kernel
>> 3) WMI event is received by dell-privacy
>> 4) KEY_MICMUTE emitted from dell-privacy
>> 5) Userland picks up key and modifies kcontrol for SW mute
>> 6) Codec kernel driver catches and calls ledtrig_audio_set, like this:
>> 	ledtrig_audio_set(LED_AUDIO_MICMUTE,
>> 		rt715->micmute_led ? LED_ON :LED_OFF);
>> 7) If "LED" is set to on dell-privacy notifies EC,
>> 	and timeout is cancelled, HW mic mute activated.
>>
>> Signed-off-by: Perry Yuan <perry_yuan@dell.com>

One last remark, I think that the dell_privacy_present() function which
I suggested in my review should be renamed to:

dell_privacy_has_micmute() and then its return should check the micmute
feature bit in priv->features_present and this new function should then
be used in dell-laptop.c to determine it dell-laptop.c should register
its own mic-mute led_classdev.

This way if a theoretical future laptop shows up where the micmute feature
is not implemented by the privacy interface dell-laptop.c will still
register the non-privacy mic-mute led_classdev.

Regards,

Hans




>> ---
>> v4 -> v5:
>> * addressed feedback from Randy Dunlap
>> * addressed feedback from Pierre-Louis Bossart
>> * rebase to latest 5.12 rc4 upstream kernel
>> * fix some space alignment problem
>> v3 -> v4:
>> * fix format for Kconfig
>> * add sysfs document
>> * add flow comments to the privacy wmi/acpi driver
>> * addressed feedback from Barnabás Pőcze[Thanks very much]
>> * export privacy_valid to make the global state simpler to query
>> * fix one issue which will block the dell-laptop driver to load when
>>   privacy driver invalid
>> * addressed feedback from Pierre-Louis Bossart,remove the EC ID match
>> v2 -> v3:
>> * add sysfs attributes doc
>> v1 -> v2:
>> * query EC handle from EC driver directly.
>> * fix some code style.
>> * add KEY_END to keymap array.
>> * clean platform device when cleanup called
>> * use hexadecimal format for log print in dev_dbg
>> * remove __set_bit for the report keys from probe.
>> * fix keymap leak
>> * add err_free_keymap in dell_privacy_wmi_probe
>> * wmi driver will be unregistered if privacy_acpi_init() fails
>> * add sysfs attribute files for user space query.
>> * add leds micmute driver to privacy acpi
>> * add more design info the commit info
>> ---
>> ---
>>  .../testing/sysfs-platform-dell-privacy-wmi   |  32 ++
>>  drivers/platform/x86/dell/Kconfig             |  16 +
>>  drivers/platform/x86/dell/Makefile            |   3 +
>>  drivers/platform/x86/dell/dell-laptop.c       |  23 +-
>>  drivers/platform/x86/dell/dell-privacy-acpi.c | 164 +++++++++
>>  drivers/platform/x86/dell/dell-privacy-wmi.c  | 340 ++++++++++++++++++
>>  drivers/platform/x86/dell/dell-privacy-wmi.h  |  35 ++
>>  drivers/platform/x86/dell/dell-wmi.c          |  27 +-
>>  8 files changed, 627 insertions(+), 13 deletions(-)
>>  create mode 100644 Documentation/ABI/testing/sysfs-platform-dell-privacy-wmi
>>  create mode 100644 drivers/platform/x86/dell/dell-privacy-acpi.c
>>  create mode 100644 drivers/platform/x86/dell/dell-privacy-wmi.c
>>  create mode 100644 drivers/platform/x86/dell/dell-privacy-wmi.h
>>
>> diff --git a/Documentation/ABI/testing/sysfs-platform-dell-privacy-wmi b/Documentation/ABI/testing/sysfs-platform-dell-privacy-wmi
>> new file mode 100644
>> index 000000000000..20c15a51ec38
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-platform-dell-privacy-wmi
>> @@ -0,0 +1,32 @@
>> +What:		/sys/bus/wmi/devices/6932965F-1671-4CEB-B988-D3AB0A901919/devices_supported
>> +Date:		Feb 2021
>> +KernelVersion:	5.12
>> +Contact:	"perry.yuan@dell.com>"
>> +Description:
>> +		Display which dell hardware level privacy devices are supported
>> +		“Dell Privacy” is a set of HW, FW, and SW features to enhance
>> +		Dell’s commitment to platform privacy for MIC, Camera, and
>> +		ePrivacy screens.
>> +		The supported hardware privacy devices are:
>> +		- 0 = Not Supported
>> +		- 1 = Supported
>> +		- Bit0 -> Microphone
>> +		- Bit1 -> Camera
>> +		- Bit2 -> ePrivacy Screen
>> +
>> +What:		/sys/bus/wmi/devices/6932965F-1671-4CEB-B988-D3AB0A901919/current_state
>> +Date:		Feb 2021
>> +KernelVersion:	5.12
>> +Contact:	"perry.yuan@dell.com>"
>> +Description:
>> +		Allow user space to check current dell privacy device state.
>> +		Describes the Device State class exposed by BIOS which can be
>> +		consumed by various applications interested in knowing the Privacy
>> +		feature capabilities
>> +		There are three Bits for available states:
>> +		- 0 = Enabled
>> +		- 1 = Disabled
> 
> What is the definition of enabled/disabled ? Does enabled mean that the device
> is enabled, or that the device is in privacy mode, so in case of the microphone
> it is actually disabled (muted) ?
> 
>> +		- Bit0 -> Microphone
>> +		- Bit1 -> Camera
>> +		- Bit2 -> ePrivacyScreen
>> +
> 
> Normally we would use strings for something like this and not direclty export a bitfield,
> this would also allow avoiding the enabled / disabled ambiguity
> 
> E.g. you could have the following:
> 
> # supported devices
> $ cat /sys/bus/wmi/devices/6932965F-1671-4CEB-B988-D3AB0A901919/devices_supported
> Microphone Mute
> Camera Shutter
> ePrivacyScreen
> 
> # All devices in privacy mode:
> $ cat /sys/bus/wmi/devices/6932965F-1671-4CEB-B988-D3AB0A901919/current_state
> Microphone muted
> Camera Shutter closed
> ePrivacyScreen privacy-filter enabled
> 
> # All devices in non-privacy mode:
> 
> $ cat /sys/bus/wmi/devices/6932965F-1671-4CEB-B988-D3AB0A901919/current_state
> Microphone unmuted
> Camera Shutter open
> ePrivacyScreen privacy-filter disabled
> 
> You can easily do the bitfield -> string mapping in the kernel by having 3
> string arrays (support, privacy_on, privacy_off) indexed by the bitfield indices.
> 
> 
>> diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/dell/Kconfig
>> index e0a55337f51a..0e0f1eb35bd6 100644
>> --- a/drivers/platform/x86/dell/Kconfig
>> +++ b/drivers/platform/x86/dell/Kconfig
>> @@ -204,4 +204,20 @@ config DELL_WMI_SYSMAN
>>  	  To compile this driver as a module, choose M here: the module will
>>  	  be called dell-wmi-sysman.
>>  
>> +config DELL_PRIVACY
>> +	tristate "Dell Hardware Privacy Support"
>> +	depends on ACPI
>> +	depends on ACPI_WMI
>> +	depends on INPUT
>> +	depends on DELL_LAPTOP
>> +	depends on LEDS_TRIGGER_AUDIO
>> +	select DELL_WMI
>> +	help
>> +	  This driver provides support for the "Dell Hardware Privacy" feature
>> +	  of Dell laptops.
>> +	  Support for a micmute and camera mute privacy will be provided as
>> +	  hardware button Ctrl+F4 and Ctrl+F9 hotkey.
> 
> This suggests that that the driver implements the buttons, which is not the
> case. How about:
> 
> 	  This driver provides integration with the "Dell Hardware Privacy" feature
> 	  of Dell laptops.
> 
> 
> 	  
> 
>> +
>> +	  To compile this driver as a module, choose M here: the module will
>> +	  be called dell_privacy.
>>  endif # X86_PLATFORM_DRIVERS_DELL
>> diff --git a/drivers/platform/x86/dell/Makefile b/drivers/platform/x86/dell/Makefile
>> index d720a3e42ae3..8b0883ee9412 100644
>> --- a/drivers/platform/x86/dell/Makefile
>> +++ b/drivers/platform/x86/dell/Makefile
>> @@ -19,3 +19,6 @@ obj-$(CONFIG_DELL_WMI_AIO)		+= dell-wmi-aio.o
>>  obj-$(CONFIG_DELL_WMI_DESCRIPTOR)	+= dell-wmi-descriptor.o
>>  obj-$(CONFIG_DELL_WMI_LED)		+= dell-wmi-led.o
>>  obj-$(CONFIG_DELL_WMI_SYSMAN)		+= dell-wmi-sysman/
>> +obj-$(CONFIG_DELL_PRIVACY)              += dell-privacy.o
>> +dell-privacy-objs                       := dell-privacy-wmi.o \
>> +	                                   dell-privacy-acpi.o
>> diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x86/dell/dell-laptop.c
>> index 70edc5bb3a14..4c840ab6cb59 100644
>> --- a/drivers/platform/x86/dell/dell-laptop.c
>> +++ b/drivers/platform/x86/dell/dell-laptop.c
>> @@ -31,6 +31,8 @@
>>  #include "dell-rbtn.h"
>>  #include "dell-smbios.h"
>>  
>> +#include "dell-privacy-wmi.h"
>> +
>>  struct quirk_entry {
>>  	bool touchpad_led;
>>  	bool kbd_led_not_present;
>> @@ -90,6 +92,7 @@ static struct rfkill *wifi_rfkill;
>>  static struct rfkill *bluetooth_rfkill;
>>  static struct rfkill *wwan_rfkill;
>>  static bool force_rfkill;
>> +static bool has_privacy;
>>  
>>  module_param(force_rfkill, bool, 0444);
>>  MODULE_PARM_DESC(force_rfkill, "enable rfkill on non whitelisted models");
>> @@ -2206,10 +2209,16 @@ static int __init dell_init(void)
>>  
>>  	if (dell_smbios_find_token(GLOBAL_MIC_MUTE_DISABLE) &&
>>  	    dell_smbios_find_token(GLOBAL_MIC_MUTE_ENABLE)) {
>> -		micmute_led_cdev.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
>> -		ret = led_classdev_register(&platform_device->dev, &micmute_led_cdev);
>> -		if (ret < 0)
>> -			goto fail_led;
>> +		if (!privacy_valid)
> 
> This privacy_valid variable is coming from another module, so you're adding
> a "privacy_valid" symbol to the global kernel symbol namespace, even though this is
> dell specific. Please use the dell_privacy_present() function (see below) instead, so you get:
> 
> 		if (dell_privacy_present())
> 			has_privacy = true;
> 		else
> 			has_privacy = false;
> 
> Which makes much more sense then "if (!privacy_valid) has_privacy = true;" which
> feels as if it is inverted to what it should be.
> 
>> +			has_privacy = true;
>> +		else
>> +			has_privacy = false;
>> +		if (!has_privacy) {
>> +			micmute_led_cdev.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
>> +			ret = led_classdev_register(&platform_device->dev, &micmute_led_cdev);
>> +			if (ret < 0)
>> +				goto fail_led;
>> +		}
>>  	}
>>  
>>  	if (acpi_video_get_backlight_type() != acpi_backlight_vendor)
>> @@ -2257,7 +2266,8 @@ static int __init dell_init(void)
>>  fail_get_brightness:
>>  	backlight_device_unregister(dell_backlight_device);
>>  fail_backlight:
>> -	led_classdev_unregister(&micmute_led_cdev);
>> +	if (!has_privacy)
>> +		led_classdev_unregister(&micmute_led_cdev);
>>  fail_led:
>>  	dell_cleanup_rfkill();
>>  fail_rfkill:
>> @@ -2278,7 +2288,8 @@ static void __exit dell_exit(void)
>>  		touchpad_led_exit();
>>  	kbd_led_exit();
>>  	backlight_device_unregister(dell_backlight_device);
>> -	led_classdev_unregister(&micmute_led_cdev);
>> +	if (!has_privacy)
>> +		led_classdev_unregister(&micmute_led_cdev);
>>  	dell_cleanup_rfkill();
>>  	if (platform_device) {
>>  		platform_device_unregister(platform_device);
>> diff --git a/drivers/platform/x86/dell/dell-privacy-acpi.c b/drivers/platform/x86/dell/dell-privacy-acpi.c
>> new file mode 100644
>> index 000000000000..4c785b62c7c4
>> --- /dev/null
>> +++ b/drivers/platform/x86/dell/dell-privacy-acpi.c
>> @@ -0,0 +1,164 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Dell privacy notification driver
>> + *
>> + * Copyright (C) 2021 Dell Inc. All Rights Reserved.
>> + */
>> +
>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> +
>> +#include <linux/acpi.h>
>> +#include <linux/bits.h>
>> +#include <linux/device.h>
>> +#include <linux/fs.h>
>> +#include <linux/kernel.h>
>> +#include <linux/leds.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/string.h>
>> +#include <linux/sysfs.h>
>> +#include <linux/slab.h>
>> +#include <linux/types.h>
>> +#include <linux/wmi.h>
>> +
>> +#include "dell-privacy-wmi.h"
>> +
>> +#define PRIVACY_PLATFORM_NAME	"dell-privacy-acpi"
>> +#define DELL_PRIVACY_GUID	"6932965F-1671-4CEB-B988-D3AB0A901919"
>> +
>> +struct privacy_acpi_priv {
>> +	struct device *dev;
>> +	struct platform_device *platform_device;
>> +	struct led_classdev cdev;
>> +};
>> +static struct privacy_acpi_priv *privacy_acpi;
>> +
>> +static int dell_privacy_micmute_led_set(struct led_classdev *led_cdev,
>> +		enum led_brightness brightness)
>> +{
>> +	struct privacy_acpi_priv *priv = privacy_acpi;
> 
> Please use container_of on the passed in led_cdev here instead
> of relying on a global variable.
> 
>> +	acpi_status status;
>> +	acpi_handle handle;
>> +	static char *acpi_method = (char *)"ECAK";
>> +
>> +	handle = ec_get_handle();
>> +	if (!handle)
>> +		return -EIO;
>> +	if (!acpi_has_method(handle, acpi_method))
>> +		return -EIO;
>> +	status = acpi_evaluate_object(handle, acpi_method, NULL, NULL);
>> +	if (ACPI_FAILURE(status)) {
>> +		dev_err(priv->dev, "Error setting privacy EC ack value: %s\n",
>> +				acpi_format_exception(status));
>> +		return -EIO;
>> +	}
>> +	pr_debug("set dell privacy micmute ec ack event done\n");
>> +	return 0;
>> +}
>> +
>> +static int dell_privacy_acpi_remove(struct platform_device *pdev)
>> +{
>> +	struct privacy_acpi_priv *priv = dev_get_drvdata(privacy_acpi->dev);
>> +
>> +	led_classdev_unregister(&priv->cdev);
>> +
>> +	return 0;
>> +}
>> +/*
>> + * Pressing the mute key activates a time delayed circuit to physically cut
>> + * off the mute. The LED is in the same circuit, so it reflects the true
>> + * state of the HW mute.  The reason for the EC "ack" is so that software
>> + * can first invoke a SW mute before the HW circuit is cut off.  Without SW
>> + * cutting this off first does not affect the time delayed muting or status
>> + * of the LED but there is a possibility of a "popping" noise.
>> + *
>> + * If the EC receives the SW ack, the circuit will be activated before the
>> + * delay completed.
>> + *
>> + * Exposing as an LED device allows the codec drivers notification path to
>> + * EC ACK to work
>> + */
>> +static int dell_privacy_leds_setup(struct device *dev)
>> +{
>> +	struct privacy_acpi_priv *priv = dev_get_drvdata(dev);
>> +	int ret = 0;
>> +
>> +	priv->cdev.name = "dell-privacy::micmute";
>> +	priv->cdev.max_brightness = 1;
>> +	priv->cdev.brightness_set_blocking = dell_privacy_micmute_led_set;
>> +	priv->cdev.default_trigger = "audio-micmute";
>> +	priv->cdev.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
>> +	ret = devm_led_classdev_register(dev, &priv->cdev);
>> +	if (ret)
>> +		return ret;
>> +	return 0;
>> +}
>> +
>> +static int dell_privacy_acpi_probe(struct platform_device *pdev)
>> +{
>> +	int ret;
>> +
>> +	platform_set_drvdata(pdev, privacy_acpi);
>> +	privacy_acpi->dev = &pdev->dev;
>> +	privacy_acpi->platform_device = pdev;
>> +
>> +	ret = dell_privacy_leds_setup(&pdev->dev);
>> +	if (ret)
>> +		return -EIO;
>> +
>> +	return 0;
>> +}
>> +
>> +static struct platform_driver dell_privacy_platform_drv = {
>> +	.driver = {
>> +		.name = PRIVACY_PLATFORM_NAME,
>> +	},
>> +	.probe = dell_privacy_acpi_probe,
>> +	.remove = dell_privacy_acpi_remove,
>> +};
>> +
>> +int __init dell_privacy_acpi_init(void)
>> +{
>> +	int err;
>> +	struct platform_device *pdev;
>> +
>> +	if (!wmi_has_guid(DELL_PRIVACY_GUID))
>> +		return -ENODEV;
>> +
>> +	privacy_acpi = kzalloc(sizeof(*privacy_acpi), GFP_KERNEL);
>> +	if (!privacy_acpi)
>> +		return -ENOMEM;
>> +
>> +	err = platform_driver_register(&dell_privacy_platform_drv);
>> +	if (err)
>> +		goto pdrv_err;
>> +
>> +	pdev = platform_device_register_simple(
>> +			PRIVACY_PLATFORM_NAME, PLATFORM_DEVID_NONE, NULL, 0);
>> +	if (IS_ERR(pdev)) {
>> +		err = PTR_ERR(pdev);
>> +		goto pdev_err;
>> +	}
> 
> So you're creating a platform_device here, from code called from the
> init_dell_privacy() function in dell-privacy-wmi.c, just so that
> the probe() function for that platform-device can register the
> led_classdev for the (alternative) mute LED.
> 
> Please just put the cdev struct inside struct privacy_wmi_data
> and call dell_privacy_leds_setup() with the wmi-dev as parameter
> from dell_privacy_wmi_probe and have the wmi-dev as the parent
> of the led_classdev.
> 
> This allows removing both the platform-driver and the instantiation
> of the platform-device.
> 
> After removing the unnecessary platfrom-dev/driver there will be
> so little left of dell-privacy-acpi.c, that what remains can and
> should just be folded into dell-privacy-wmi.c. At which point
> you're down to one file for the module which also simplifies the
> Makefile.
> 
>> +
>> +	return 0;
>> +
>> +pdev_err:
>> +	platform_device_unregister(pdev);
>> +pdrv_err:
>> +	kfree(privacy_acpi);
>> +	return err;
>> +}
>> +
>> +void __exit dell_privacy_acpi_exit(void)
>> +{
>> +	struct platform_device *pdev = to_platform_device(privacy_acpi->dev);
>> +
>> +	platform_device_unregister(pdev);
>> +	platform_driver_unregister(&dell_privacy_platform_drv);
>> +	kfree(privacy_acpi);
>> +}
>> +
>> +MODULE_AUTHOR("Perry Yuan <perry_yuan@dell.com>");
>> +MODULE_DESCRIPTION("DELL Privacy ACPI Driver");
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/platform/x86/dell/dell-privacy-wmi.c b/drivers/platform/x86/dell/dell-privacy-wmi.c
>> new file mode 100644
>> index 000000000000..8bde97613477
>> --- /dev/null
>> +++ b/drivers/platform/x86/dell/dell-privacy-wmi.c
>> @@ -0,0 +1,340 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Dell privacy notification driver
>> + *
>> + * Copyright (C) 2021 Dell Inc. All Rights Reserved.
>> + */
>> +
>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> +
>> +#include <linux/acpi.h>
>> +#include <linux/input.h>
>> +#include <linux/input/sparse-keymap.h>
>> +#include <linux/list.h>
>> +#include <linux/module.h>
>> +#include <linux/wmi.h>
>> +
>> +#include "dell-privacy-wmi.h"
>> +
>> +#define DELL_PRIVACY_GUID "6932965F-1671-4CEB-B988-D3AB0A901919"
>> +#define MICROPHONE_STATUS		BIT(0)
>> +#define CAMERA_STATUS		        BIT(1)
>> +#define PRIVACY_SCREEN_STATUS		BIT(2)
>> +
>> +/*
>> + * The wmi_list is used to store the privacy_priv struct with mutex protecting
>> + */
>> +static LIST_HEAD(wmi_list);
>> +static DEFINE_MUTEX(list_mutex);
>> +/*
>> + * global privacy state for other modules to query if the privacy driver loaded successfully
>> + * or no privacy WMI device was detected at initial probe phase
>> + */
>> +int privacy_valid = -EPROBE_DEFER;
>> +EXPORT_SYMBOL_GPL(privacy_valid);
> 
> None of the callers are interpreting the error-codes stored here.
> So this is really treated as a bool, and the info stored in the bool
> is already available inside the wmi_list-head. So just drop this.
> 
>> +
>> +struct privacy_wmi_data {
>> +	struct input_dev *input_dev;
>> +	struct wmi_device *wdev;
>> +	struct list_head list;
>> +	u32 features_present;
>> +	u32 last_status;
>> +};
>> +
>> +/*
>> + * Keymap for WMI privacy events of type 0x0012
>> + */
>> +static const struct key_entry dell_wmi_keymap_type_0012[] = {
>> +	/* privacy mic mute */
>> +	{ KE_KEY, 0x0001, { KEY_MICMUTE } },
>> +	/* privacy camera mute */
>> +	{ KE_SW,  0x0002, { SW_CAMERA_LENS_COVER } },
>> +	{ KE_END, 0},
>> +};
>> +
>> +int dell_privacy_state(void)
> 
> Please rename this to dell_privacy_present(), "state" is very generic / not descriptive
> and use list_first_entry_or_null(&wmi_list) as done in dell_privacy_process_event(), e.g.:
> 
> bool dell_privacy_present(void)
> {
> 	struct privacy_wmi_data *priv;
> 
> 	mutex_lock(&list_mutex);
> 	priv = list_first_entry_or_null(&wmi_list,
> 			struct privacy_wmi_data,
> 			list);
> 	mutex_unlock(&list_mutex);
> 
> 	return priv;
> }
> 
> 
> 
>> +{
>> +	return privacy_valid;
>> +}
>> +EXPORT_SYMBOL_GPL(dell_privacy_state);
>> +/*
>> + * The flow of privacy event:
>> + * 1) User presses key. HW does stuff with this key (timeout is started)
>> + * 2) WMI event is emitted from BIOS
>> + * 3) WMI event is received by dell-privacy
>> + * 4) KEY_MICMUTE emitted from dell-privacy
>> + * 5) Userland picks up key and modifies kcontrol for SW mute
>> + * 6) Codec kernel driver catches and calls ledtrig_audio_set defined by
>> + *    dell-privacy-acpi driver.
>> + *    codec driver will call like this to switch micmute led state.
>> + *	ledtrig_audio_set(LED_AUDIO_MICMUTE, micmute_led ? LED_ON :LED_OFF);
>> + * 7) If "LED" is set to on dell-privacy notifies EC,and timeout is cancelled,
>> + *	HW mic mute activated.
>> + */
>> +void dell_privacy_process_event(int type, int code, int status)
> 
> Please make this return a bool, returning true when it has consumed the event
> and false when it did not consume the event. This will allow other 0x0012 0xXXXX
> codes to still be handled by the existing dell-wmi.c code for this.
> 
>> +{
>> +	struct privacy_wmi_data *priv;
>> +	const struct key_entry *key;
> 
> 	bool ret = false;
> 
>> +
>> +	mutex_lock(&list_mutex);
>> +	priv = list_first_entry_or_null(&wmi_list,
>> +			struct privacy_wmi_data,
>> +			list);
>> +	if (!priv) {
>> +		pr_err("dell privacy priv is NULL\n");
>> +		goto error;
>> +	}
>> +	key = sparse_keymap_entry_from_scancode(priv->input_dev, (type << 16) | code);
>> +	if (!key) {
>> +		dev_dbg(&priv->wdev->dev, "Unknown key with type 0x%04x and code 0x%04x pressed\n",
>> +				type, code);
>> +		goto error;
>> +	}
>> +	switch (code) {
>> +	case DELL_PRIVACY_TYPE_AUDIO: /* Mic mute */
>> +		priv->last_status = status;
>> +		sparse_keymap_report_entry(priv->input_dev, key, 1, true);
> 
> 		ret = true;
> 
>> +		break;
>> +	case DELL_PRIVACY_TYPE_CAMERA: /* Camera mute */
>> +		priv->last_status = status;
>> +		sparse_keymap_report_entry(priv->input_dev, key, 1, true);
> 
> 		ret = true;
> 
>> +		break;
> 
> These 2 cases are exactly the same, please merge them into a single case.
> 
>> +	default:
>> +		dev_dbg(&priv->wdev->dev, "unknown event type 0x%04x 0x%04x",
>> +				type, code);
>> +	}
>> +
>> +error:
>> +	mutex_unlock(&list_mutex);
> 
> 	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(dell_privacy_process_event);
>> +
>> +static ssize_t devices_supported_show(struct device *dev,
>> +		struct device_attribute *attr,
>> +		char *buf)
>> +{
>> +	struct privacy_wmi_data *priv = dev_get_drvdata(dev);
>> +
>> +	return sysfs_emit(buf, "%x\n", priv->features_present);
>> +}
>> +
>> +static ssize_t current_state_show(struct device *dev,
>> +		struct device_attribute *attr,
>> +		char *buf)
>> +{
>> +	struct privacy_wmi_data *priv = dev_get_drvdata(dev);
>> +
>> +	return sysfs_emit(buf, "%x\n", priv->last_status);
>> +}
> 
> Please change these to emit strings as discussed above
> (assuming you agree with my above proposal for this).
> 
>> +
>> +static DEVICE_ATTR_RO(devices_supported);
>> +static DEVICE_ATTR_RO(current_state);
>> +
>> +static struct attribute *privacy_attributes[] = {
>> +	&dev_attr_devices_supported.attr,
>> +	&dev_attr_current_state.attr,
>> +	NULL,
>> +};
>> +
>> +static const struct attribute_group privacy_attribute_group = {
>> +	.attrs = privacy_attributes
>> +};
>> +
>> +/*
>> + * Describes the Device State class exposed by BIOS which can be consumed by
>> + * various applications interested in knowing the Privacy feature capabilities.
>> + * class DeviceState
>> + * {
>> + *  [key, read] string InstanceName;
>> + *  [read] boolean ReadOnly;
>> + *  [WmiDataId(1), read] uint32 DevicesSupported;
>> + *   0 – None, 0x1 – Microphone, 0x2 – Camera, 0x4 -ePrivacy  Screen
>> + *  [WmiDataId(2), read] uint32 CurrentState;
>> + *   0:Off; 1:On. Bit0 – Microphone, Bit1 – Camera, Bit2 - ePrivacyScreen
>> + * };
>> + */
>> +
>> +static int get_current_status(struct wmi_device *wdev)
>> +{
>> +	struct privacy_wmi_data *priv = dev_get_drvdata(&wdev->dev);
>> +	union acpi_object *obj_present;
>> +	u32 *buffer;
>> +	int ret = 0;
>> +
>> +	if (!priv) {
>> +		pr_err("dell privacy priv is NULL\n");
>> +		return -EINVAL;
>> +	}
>> +	/* check privacy support features and device states */
>> +	obj_present = wmidev_block_query(wdev, 0);
>> +	if (!obj_present) {
>> +		dev_err(&wdev->dev, "failed to read Binary MOF\n");
>> +		ret = -EIO;
>> +		privacy_valid = ret;
>> +		return ret;
>> +	}
>> +
>> +	if (obj_present->type != ACPI_TYPE_BUFFER) {
>> +		dev_err(&wdev->dev, "Binary MOF is not a buffer!\n");
>> +		ret = -EIO;
>> +		privacy_valid = ret;
>> +		goto obj_free;
>> +	}
>> +	/*  Although it's not technically a failure, this would lead to
>> +	 *  unexpected behavior
>> +	 */
>> +	if (obj_present->buffer.length != 8) {
>> +		dev_err(&wdev->dev, "Dell privacy buffer has unexpected length (%d)!\n",
>> +				obj_present->buffer.length);
>> +		ret = -EINVAL;
>> +		privacy_valid = ret;
>> +		goto obj_free;
>> +	}
>> +	buffer = (u32 *)obj_present->buffer.pointer;
>> +	priv->features_present = buffer[0];
>> +	priv->last_status = buffer[1];
>> +	privacy_valid = 0;
> 
> As discussed, there is no need for the privacy_valid variable, remove all
> references to it here.
> 
>> +
>> +obj_free:
>> +	kfree(obj_present);
>> +	return ret;
>> +}
>> +
>> +static int dell_privacy_wmi_probe(struct wmi_device *wdev, const void *context)
>> +{
>> +	struct privacy_wmi_data *priv;
>> +	struct key_entry *keymap;
>> +	int ret, i;
>> +
>> +	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +
>> +	dev_set_drvdata(&wdev->dev, priv);
>> +	priv->wdev = wdev;
>> +	/* create evdev passing interface */
>> +	priv->input_dev = devm_input_allocate_device(&wdev->dev);
>> +	if (!priv->input_dev)
>> +		return -ENOMEM;
>> +	/* remap the wmi keymap event to new keymap */
>> +	keymap = kcalloc(ARRAY_SIZE(dell_wmi_keymap_type_0012),
>> +			sizeof(struct key_entry), GFP_KERNEL);
>> +	if (!keymap) {
>> +		ret = -ENOMEM;
>> +		goto err_free_dev;
>> +	}
> 
> No need for the goto here just simplify this to:
> 
> 	if (!keymap)
> 		return -ENOMEM;
> 
>> +	/* remap the keymap code with Dell privacy key type 0x12 as prefix
>> +	 * KEY_MICMUTE scancode will be reported as 0x120001
>> +	 */
>> +	for (i = 0; i < ARRAY_SIZE(dell_wmi_keymap_type_0012); i++) {
>> +		keymap[i] = dell_wmi_keymap_type_0012[i];
>> +		keymap[i].code |= (0x0012 << 16);
>> +	}
>> +	ret = sparse_keymap_setup(priv->input_dev, keymap, NULL);
> 
> You're done with the keymap here, please put a single:
> 
> 	kfree(keymap);
> 
> Here before the if (ret), then you won't need any goto style
> cleanup anywhere in this function.
> 
> This also fixes not free-ing the keymap when sparse_keymap_setup() fails.
> 
>> +	if (ret)
>> +		return ret;
>> +	priv->input_dev->dev.parent = &wdev->dev;
>> +	priv->input_dev->name = "Dell Privacy Driver";
>> +	priv->input_dev->id.bustype = BUS_HOST;
>> +	if (input_register_device(priv->input_dev)) {
>> +		pr_debug("input_register_device failed to register!\n");
> 
> You're not setting ret here.
> 
>> +		goto err_free_keymap;
>> +	}
> 
> No need for the pr_debug, the kernel will already complain if this fails.
> Also since all your resources are devm managed and we've already taken
> care of the keymap this can be simplified to:
> 
> 	ret = input_register_device(priv->input_dev);
> 	if (ret)
> 		returm ret;
> 
>> +	mutex_lock(&list_mutex);
>> +	list_add_tail(&priv->list, &wmi_list);
>> +	mutex_unlock(&list_mutex);
> 
> Move this to directly above the return 0; below, see below.
> 
>> +
>> +	if (get_current_status(priv->wdev))
>> +		goto err_free_input;
> 
> You're again not setting ret here before the goto.
> 
> And you are returning with an error here after adding the device to the wmi_list,
> the list_add_tail call should be done last, directly above the return 0 call.
> 
> Also since all your resources are devm managed and we've already taken
> care of the keymap this can be simplified to:
> 
> 	ret = get_current_status(priv->wdev);
> 	if (ret)
> 		return ret;
> 
>> +
>> +	ret = devm_device_add_group(&wdev->dev, &privacy_attribute_group);
>> +	if (ret)
>> +		goto err_free_input;
> 
> Replace the goto err_free_input() with return ret;
> 
>> +
>> +	kfree(keymap);
> 
> Drop this kfree() (already done above now).
> 
> Move the list_add_tail() here.
> 
>> +	return 0;
>> +
>> +err_free_input:
>> +	input_unregister_device(priv->input_dev);
> 
> This is not necessary for an input_device allocated with devm_input_allocate_device(),
> which means that none of these error handling labels are necessary now, so this can
> all be removed.
> 
> 
> 
>> +err_free_keymap:
>> +	privacy_valid = -ENODEV;
>> +	kfree(keymap);
>> +err_free_dev:
>> +	return ret;
>> +}
>> +
>> +static int dell_privacy_wmi_remove(struct wmi_device *wdev)
>> +{
>> +	struct privacy_wmi_data *priv = dev_get_drvdata(&wdev->dev);
>> +
>> +	mutex_lock(&list_mutex);
>> +	list_del(&priv->list);
>> +	mutex_unlock(&list_mutex);
>> +	privacy_valid = -ENODEV;
>> +	input_unregister_device(priv->input_dev);
> 
> The input_unregister is not necessary (and privacy_valid is gone too).
> 
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct wmi_device_id dell_wmi_privacy_wmi_id_table[] = {
>> +	{ .guid_string = DELL_PRIVACY_GUID },
>> +	{ },
>> +};
>> +
>> +static struct wmi_driver dell_privacy_wmi_driver = {
>> +	.driver = {
>> +		.name = "dell-privacy",
>> +	},
>> +	.probe = dell_privacy_wmi_probe,
>> +	.remove = dell_privacy_wmi_remove,
>> +	.id_table = dell_wmi_privacy_wmi_id_table,
>> +};
>> +
>> +static int __init init_dell_privacy(void)
>> +{
>> +	int ret;
>> +
>> +	ret = wmi_has_guid(DELL_PRIVACY_GUID);> +	if (!ret) {
>> +		privacy_valid = -ENODEV;
>> +		pr_debug("Unable to detect available Dell privacy devices: %d\n", ret);
>> +		return privacy_valid;
>> +	}
> 
> This driver will only get modprobed if the GUID is present and when it is
> not present then loading the driver is a no-op so this can be checked.
> 
>> +
>> +	ret = wmi_driver_register(&dell_privacy_wmi_driver);
>> +	if (ret) {
>> +		pr_err("failed to initialize privacy wmi driver: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = dell_privacy_acpi_init();
>> +	if (ret) {
>> +		pr_err("failed to initialize privacy acpi driver: %d\n", ret);
>> +		goto err_init;
>> +	}
> 
> And with the platform-device/driver removed this is not necessary too,
> which means ...
> 
>> +
>> +	return 0;
>> +
>> +err_init:
>> +	wmi_driver_unregister(&dell_privacy_wmi_driver);
>> +	return ret;
>> +}
>> +
>> +static void dell_privacy_wmi_exit(void)
>> +{
>> +	wmi_driver_unregister(&dell_privacy_wmi_driver);
>> +}
>> +
>> +static void __exit exit_dell_privacy(void)
>> +{
>> +	dell_privacy_wmi_exit();
>> +	dell_privacy_acpi_exit();
>> +}
>> +
>> +module_init(init_dell_privacy);
>> +module_exit(exit_dell_privacy);
> 
> That all of the init_dell_privacy / exit_dell_privacy stuff can be replaced with
> a single line:
> 
> module_wmi_driver(&dell_privacy_wmi_driver);
> 
> 
> 
> 
> 
>> +
>> +MODULE_DEVICE_TABLE(wmi, dell_wmi_privacy_wmi_id_table);
>> +MODULE_AUTHOR("Perry Yuan <perry_yuan@dell.com>");
>> +MODULE_DESCRIPTION("Dell Privacy WMI Driver");
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/platform/x86/dell/dell-privacy-wmi.h b/drivers/platform/x86/dell/dell-privacy-wmi.h
>> new file mode 100644
>> index 000000000000..6dda2990df5d
>> --- /dev/null
>> +++ b/drivers/platform/x86/dell/dell-privacy-wmi.h
>> @@ -0,0 +1,35 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Dell privacy notification driver
>> + *
>> + * Copyright (C) 2021 Dell Inc. All Rights Reserved.
>> + */
>> +
>> +#ifndef _DELL_PRIVACY_WMI_H_
>> +#define _DELL_PRIVACY_WMI_H_
>> +
>> +#if IS_ENABLED(CONFIG_DELL_PRIVACY)
>> +extern int privacy_valid;
> 
> Please remove this from the global kernel namespace
> (make it a static global inside the dell-privacy-wmi.c code).
> 
>> +int  dell_privacy_state(void);
>> +void dell_privacy_process_event(int type, int code, int status);
>> +#else /* CONFIG_DELL_PRIVACY */
>> +int privacy_valid = -ENODEV;
> 
> Drop this.
> 
>> +static inline int dell_privacy_state(void)
>> +{
>> +	return privacy_valid;
> 
> And directly return -ENODEV here.
> 
>> +}
>> +
>> +static inline void dell_privacy_process_event(int type, int code, int status)
>> +{}
>> +#endif /* CONFIG_DELL_PRIVACY */
>> +
>> +int  dell_privacy_acpi_init(void);
>> +void dell_privacy_acpi_exit(void);
>> +
>> +/* DELL Privacy Type */
>> +enum {
>> +	DELL_PRIVACY_TYPE_UNKNOWN = 0x0,
>> +	DELL_PRIVACY_TYPE_AUDIO,
>> +	DELL_PRIVACY_TYPE_CAMERA,
>> +};
> 
> This enum is only used inside dell-privacy-wmi.c, please move it there.
> 
>> +#endif
> 
> With the platform-device/driver removal discussed above all this header file
> needs to do is defines the prototypes / stubs for 2 functions:
> 
> int  dell_privacy_state(void);
> void dell_privacy_process_event(int type, int code, int status);
> 
> I think it would be best to just add these to dell-smbios.h, rather then
> adding a new header just for these 2 prototypes / stubs.
> 
> 
>> diff --git a/drivers/platform/x86/dell/dell-wmi.c b/drivers/platform/x86/dell/dell-wmi.c
>> index bbdb3e860892..389e86de24b0 100644
>> --- a/drivers/platform/x86/dell/dell-wmi.c
>> +++ b/drivers/platform/x86/dell/dell-wmi.c
>> @@ -13,20 +13,22 @@
>>  
>>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>>  
>> -#include <linux/kernel.h>
>> -#include <linux/module.h>
>> +#include <linux/acpi.h>
>> +#include <linux/dmi.h>
>>  #include <linux/init.h>
>> -#include <linux/slab.h>
>> -#include <linux/types.h>
>>  #include <linux/input.h>
>>  #include <linux/input/sparse-keymap.h>
>> -#include <linux/acpi.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/slab.h>
>>  #include <linux/string.h>
>> -#include <linux/dmi.h>
>> +#include <linux/types.h>
>>  #include <linux/wmi.h>
>>  #include <acpi/video.h>
>> +
> 
> Please split the changes sorting these includes alphabetically out
> into a separate cleanup patch.
> 
>>  #include "dell-smbios.h"
>>  #include "dell-wmi-descriptor.h"
>> +#include "dell-privacy-wmi.h"
>>  
>>  MODULE_AUTHOR("Matthew Garrett <mjg@redhat.com>");
>>  MODULE_AUTHOR("Pali Rohár <pali@kernel.org>");
>> @@ -381,6 +383,7 @@ static void dell_wmi_notify(struct wmi_device *wdev,
>>  	u16 *buffer_entry, *buffer_end;
>>  	acpi_size buffer_size;
>>  	int len, i;
>> +	int err;
> 
> Drop this.
> 
>>  
>>  	if (obj->type != ACPI_TYPE_BUFFER) {
>>  		pr_warn("bad response type %x\n", obj->type);
>> @@ -427,7 +430,6 @@ static void dell_wmi_notify(struct wmi_device *wdev,
>>  
>>  		switch (buffer_entry[1]) {
>>  		case 0x0000: /* One key pressed or event occurred */
>> -		case 0x0012: /* Event with extended data occurred */
>>  			if (len > 2)
>>  				dell_wmi_process_key(wdev, buffer_entry[1],
>>  						     buffer_entry[2]);
>> @@ -439,6 +441,17 @@ static void dell_wmi_notify(struct wmi_device *wdev,
>>  				dell_wmi_process_key(wdev, buffer_entry[1],
>>  						     buffer_entry[i]);
>>  			break;
>> +		case 0x0012:
>> +			err = dell_privacy_state();
>> +			if (err == 0) {
>> +				dell_privacy_process_event(buffer_entry[1],
>> +							   buffer_entry[3], buffer_entry[4]);
> 
> This needs a len > 4 check !
> 
>> +			} else {
>> +				if (len > 2)
>> +					dell_wmi_process_key(wdev, buffer_entry[1],
>> +							     buffer_entry[2]);
>> +			}
> 
> Combined with the change to have dell_privacy_process_event() return a bool, this should
> look something like this:
> 
> 			if (len > 4 && dell_privacy_process_event(buffer_entry[1], buffer_entry[3], buffer_entry[4]))
> 				; /* Handled by dell_privacy_process_event() */
> 			else if (len > 2)
> 				dell_wmi_process_key(wdev, buffer_entry[1], buffer_entry[2]);
> 
> 
>> +			break;
>>  		default: /* Unknown event */
>>  			pr_info("Unknown WMI event type 0x%x\n",
>>  				(int)buffer_entry[1]);
>>
> 
> Regards,
> 
> Hans
> 

