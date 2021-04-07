Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 809EF356FFF
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Apr 2021 17:17:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C75A1676;
	Wed,  7 Apr 2021 17:16:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C75A1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617808665;
	bh=7n3uVtWC4OdFol6U3TjiryPNgVJHJJG+wenGUleOZoU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xktg8uDTcFymhbFu3p0kGP2eURHwUgK2xQCF/NGobDzo9v7zIfViAOYmSSHNB/nuZ
	 3pBqVXBB31d0vKSuWxWZ/4EYdBvU/itBQEZhwQYSE+H8FWEZI/Zu1Pqym/06ETzT6K
	 wc1GThg+5rdIgiZ0q2mNs6QfZ6eluk75QhdSo/rs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 991A3F8025C;
	Wed,  7 Apr 2021 17:16:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E242CF80245; Wed,  7 Apr 2021 17:16:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, PRX_BODYSUB_10, PRX_BODY_13, SPF_HELO_NONE,
 SPF_NONE, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6FB4FF80162
 for <alsa-devel@alsa-project.org>; Wed,  7 Apr 2021 17:16:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FB4FF80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="dthBw156"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617808559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WnwFf5vQ/aAjIZjS11hKp19j6MMWcA2QZoTXxtt+ASs=;
 b=dthBw156ivDzsrO7qkAzoP70Rn1b4jomc9LIaHGnmp0HD4X3c8pDK6FJnuujMlfipZjwdv
 Mnv3B47eCUsEa0/wbGAx/I+V+RNTskD8STBlosGgt0aXf0yvIT9np6G6Bi7paw0T6yQDYC
 neFabZZAVShg9tlij3Gt/WTRQRFPn78=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352--GhypVWMM46YzMKQxYIrLA-1; Wed, 07 Apr 2021 11:15:56 -0400
X-MC-Unique: -GhypVWMM46YzMKQxYIrLA-1
Received: by mail-ej1-f71.google.com with SMTP id jt26so1245102ejc.18
 for <alsa-devel@alsa-project.org>; Wed, 07 Apr 2021 08:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WnwFf5vQ/aAjIZjS11hKp19j6MMWcA2QZoTXxtt+ASs=;
 b=AZVD/GxhJ5fGi2OcPoG9CfrvgEaHdwX/h3RqE1A+LEzVidaGvYjxSadpuAcCkA/PlJ
 yf/E6YL2zKEY2K8lheUEMJyiG4VaTFgFLySFuD17ve3PmICB9kZpHwS2Aiu5HTkA0e7V
 zVz6srt47BkElmaeUGiwl6oEJ6t7VqicwLSwqwf9to/3Wx9mD7UtpsnjCwcqruShMrCQ
 HB4nCn8Ah46uW4h6uAo4snKgMIWT1qq/e5p9u8Ek3Sc5jS+EW9xRe6nOf3p1WUzSvPfW
 6aDkqqTb/fVpmoJXlqONO/sAxsJrvgoNLwmdTd8ud+w1LSGaropM3GqP9Xf8vnkDCTnz
 NDKw==
X-Gm-Message-State: AOAM532sSlLaBdOJQgi0kidQxq9Ku8cmSiKVPgJxCLBfadWIMKeZkvFn
 FhrgewGmOJjPasu+bpRAnEph8azka2DZc0q04Cjd15dUg7kcYST92+ncDPSS6ERMO1U6TNKe42Z
 nPCHX8F0R0Iqx0cT1bLqQ6mc=
X-Received: by 2002:a17:906:d796:: with SMTP id
 pj22mr4335769ejb.32.1617808554443; 
 Wed, 07 Apr 2021 08:15:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwDkJ5BStj2Bkt+lI5GR763zV1xheo/zIa2hQRM5MHVCtyY7UX8fEM+W9PqskroP30jhcNAA==
X-Received: by 2002:a17:906:d796:: with SMTP id
 pj22mr4335704ejb.32.1617808553842; 
 Wed, 07 Apr 2021 08:15:53 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id y6sm2246605ejw.83.2021.04.07.08.15.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Apr 2021 08:15:52 -0700 (PDT)
Subject: Re: [PATCH v6 1/2] platform/x86: dell-privacy: Add support for Dell
 hardware privacy
To: =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
 Perry Yuan <Perry.Yuan@dell.com>
References: <20210404083137.14364-1-Perry_Yuan@Dell.com>
 <cWWbrEA1yiaAjQlmJAa4JxS_mMAPGbFs8_1vyHRYw9oX5IL3q_B99re11CL1DoTZOER54QHidpc-pb-BQaY2JTLMirsXVFLta-PtfwWhR3E=@protonmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <0a778a57-273d-f716-5b4e-58696e5cc972@redhat.com>
Date: Wed, 7 Apr 2021 17:15:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <cWWbrEA1yiaAjQlmJAa4JxS_mMAPGbFs8_1vyHRYw9oX5IL3q_B99re11CL1DoTZOER54QHidpc-pb-BQaY2JTLMirsXVFLta-PtfwWhR3E=@protonmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: "oder_chiou@realtek.com" <oder_chiou@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "mgross@linux.intel.com" <mgross@linux.intel.com>,
 "Mario.Limonciello@dell.com" <Mario.Limonciello@dell.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "mario.limonciello@outlook.com" <mario.limonciello@outlook.com>,
 "Dell.Client.Kernel@dell.com" <Dell.Client.Kernel@dell.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

Hi Perry, Barnabás,

Barnabás thank you for your review. I agree with all your remarks.

Perry, Thank you for the new version, this version is looking good.
This is almost ready for merging.

Please fix the review remarks from Barnabás. I also have a couple of small
review remarks myself below.

On 4/4/21 6:53 PM, Barnabás Pőcze wrote:
> Hi
> 
> 
> 2021. április 4., vasárnap 10:31 keltezéssel, Perry Yuan írta:
> 
>> From: Perry Yuan <perry_yuan@dell.com>
>>
>> add support for Dell privacy driver for the Dell units equipped
>> hardware privacy design, which protect users privacy of audio and
>> camera from hardware level. Once the audio or camera privacy mode
>> activated, any applications will not get any audio or video stream
>> when user pressed ctrl+F4 hotkey, audio privacy mode will be
>> enabled, micmute led will be also changed accordingly
>> The micmute led is fully controlled by hardware & EC(embedded controller)
>> and camera mute hotkey is Ctrl+F9. Currently design only emits
>> SW_CAMERA_LENS_COVER event while the camera lens shutter will be
>> changed by EC & HW(hardware) control
>>
>> *The flow is like this:
>> 1) User presses key. HW does stuff with this key (timeout timer is started)
>> 2) WMI event is emitted from BIOS to kernel
>> 3) WMI event is received by dell-privacy
>> 4) KEY_MICMUTE emitted from dell-privacy
>> 5) Userland picks up key and modifies kcontrol for SW mute
>> 6) Codec kernel driver catches and calls ledtrig_audio_set, like this:
>>    ledtrig_audio_set(LED_AUDIO_MICMUTE, rt715->micmute_led ? LED_ON :LED_OFF);
>> 7) If "LED" is set to on dell-privacy notifies EC, and timeout is cancelled,
>>    HW mic mute activated. If EC not notified, HW mic mute will also be
>>    activated when timeout used up, it is just later than active ack
>>
>> Signed-off-by: Perry Yuan <perry_yuan@dell.com>
>> ---
>> v5 -> v6:
>> * addressed feedback from Hans
>> * addressed feedback from Pierre
>> * optimize some debug format with dev_dbg()
>> * remove platform driver,combined privacy acpi driver into single wmi
>>   driver file
>> * optimize sysfs interface with string added to be more clearly reading
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
>>  .../testing/sysfs-platform-dell-privacy-wmi   |  55 +++
>>  drivers/platform/x86/dell/Kconfig             |  14 +
>>  drivers/platform/x86/dell/Makefile            |   1 +
>>  drivers/platform/x86/dell/dell-laptop.c       |  23 +-
>>  drivers/platform/x86/dell/dell-privacy-wmi.c  | 441 ++++++++++++++++++
>>  drivers/platform/x86/dell/dell-privacy-wmi.h  |  32 ++
>>  drivers/platform/x86/dell/dell-wmi.c          |  13 +-
>>  7 files changed, 572 insertions(+), 7 deletions(-)
>>  create mode 100644 Documentation/ABI/testing/sysfs-platform-dell-privacy-wmi
>>  create mode 100644 drivers/platform/x86/dell/dell-privacy-wmi.c
>>  create mode 100644 drivers/platform/x86/dell/dell-privacy-wmi.h
>>
>> diff --git a/Documentation/ABI/testing/sysfs-platform-dell-privacy-wmi b/Documentation/ABI/testing/sysfs-platform-dell-privacy-wmi
>> new file mode 100644
>> index 000000000000..a57ddc6a221e
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-platform-dell-privacy-wmi
>> @@ -0,0 +1,55 @@
>> +What:		/sys/bus/wmi/devices/6932965F-1671-4CEB-B988-D3AB0A901919/dell_privacy_supported_type
>> +Date:		Apr 2021
>> +KernelVersion:	5.13
>> +Contact:	"perry.yuan@dell.com>"
>> +Description:
>> +		Display which dell hardware level privacy devices are supported
>> +		“Dell Privacy” is a set of HW, FW, and SW features to enhance
>> +		Dell’s commitment to platform privacy for MIC, Camera, and
>> +		ePrivacy screens.
>> +		The supported hardware privacy devices are:
>> +Attributes:
>> +		Microphone Mute:
>> +				Identifies the local microphone can be muted by hardware, no applications
>> +				is available to capture system mic sound
>> +
>> +                Camera Shutter:
>    ^^^^^^^^^^^^^^^^
> 
> Spaces used instead of tabs.
> 
> 
>> +				Identifies camera shutter controlled by hardware, which is a micromechanical
>> +				shutter assembly that is built onto the camera module to block capturing images
>> +				from outside the laptop
>> +
>> +		supported:
>> +				The privacy device is supported by this system
>> +
>> +		unsupported:
>> +				The privacy device is not supported on this system
>> +
>> +		For example to check which privacy devices are supported:
>> +
>> +		# cat /sys/bus/wmi/drivers/dell-privacy/6932965F-1671-4CEB-B988-D3AB0A901919/dell_privacy_supported_type
>> +		[Microphone Mute] [supported]
>> +		[Camera Shutter] [supported]
>> +		[ePrivacy Screen] [unsupport]

[unsupport] should be [unsupported] here.

>> +
>> +What:		/sys/bus/wmi/devices/6932965F-1671-4CEB-B988-D3AB0A901919/dell_privacy_current_state
>> +Date:		Apr 2021
>> +KernelVersion:	5.13
>> +Contact:	"perry.yuan@dell.com>"
>> +Description:
>> +		Allow user space to check current dell privacy device state.
>> +		Describes the Device State class exposed by BIOS which can be
>> +		consumed by various applications interested in knowing the Privacy
>> +		feature capabilities
>> +Attributes:
>> +		muted:
>> +			Identifies the privacy device is turned off and cannot send stream to OS applications
>> +
>> +		unmuted:
>> +			Identifies the privacy device is turned on ,audio or camera driver can get
>> +			stream from mic and camera module to OS applications
>> +
>> +		For example to check all supported current privacy device states:
>> +
>> +		# cat /sys/bus/wmi/drivers/dell-privacy/6932965F-1671-4CEB-B988-D3AB0A901919/dell_privacy_current_state
>> +		[Microphone] [unmuted]
>> +		[Camera Shutter] [unmuted]
>> diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/dell/Kconfig
>> index e0a55337f51a..05d124442b25 100644
>> --- a/drivers/platform/x86/dell/Kconfig
>> +++ b/drivers/platform/x86/dell/Kconfig
>> @@ -204,4 +204,18 @@ config DELL_WMI_SYSMAN
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
>> +	  This driver provides integration with the "Dell Hardware Privacy" feature
>> +	  of Dell laptops.
>> +
>> +	  To compile this driver as a module, choose M here: the module will
>> +	  be called dell_privacy.
>>  endif # X86_PLATFORM_DRIVERS_DELL
>> diff --git a/drivers/platform/x86/dell/Makefile b/drivers/platform/x86/dell/Makefile
>> index d720a3e42ae3..7da0c33dfcca 100644
>> --- a/drivers/platform/x86/dell/Makefile
>> +++ b/drivers/platform/x86/dell/Makefile
>> @@ -19,3 +19,4 @@ obj-$(CONFIG_DELL_WMI_AIO)		+= dell-wmi-aio.o
>>  obj-$(CONFIG_DELL_WMI_DESCRIPTOR)	+= dell-wmi-descriptor.o
>>  obj-$(CONFIG_DELL_WMI_LED)		+= dell-wmi-led.o
>>  obj-$(CONFIG_DELL_WMI_SYSMAN)		+= dell-wmi-sysman/
>> +obj-$(CONFIG_DELL_PRIVACY)              += dell-privacy-wmi.o
>> diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x86/dell/dell-laptop.c
>> index 70edc5bb3a14..a9b4cf13913c 100644
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
>> +		if (dell_privacy_has_micmute())
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
>> diff --git a/drivers/platform/x86/dell/dell-privacy-wmi.c b/drivers/platform/x86/dell/dell-privacy-wmi.c
>> new file mode 100644
>> index 000000000000..3fae8dd077f1
>> --- /dev/null
>> +++ b/drivers/platform/x86/dell/dell-privacy-wmi.c
>> @@ -0,0 +1,441 @@
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
>> +#include <linux/bitops.h>
>> +#include <linux/input.h>
>> +#include <linux/input/sparse-keymap.h>
>> +#include <linux/list.h>
>> +#include <linux/leds.h>
>> +#include <linux/module.h>
>> +#include <linux/wmi.h>
>> +
>> +#include "dell-privacy-wmi.h"
>> +
>> +#define DELL_PRIVACY_GUID "6932965F-1671-4CEB-B988-D3AB0A901919"
>> +#define MICROPHONE_STATUS		BIT(0)
>> +#define CAMERA_STATUS		        BIT(1)
>> +#define DELL_PRIVACY_AUDIO_EVENT  0x1
>> +#define DELL_PRIVACY_CAMERA_EVENT 0x2
>> +#define cdev_to_led(c)       container_of(c, struct privacy_wmi_data, cdev)
> 
> This name is confusing in my opinion. Something like `led_to_priv` could be
> clearer.
> 
> 
>> +
>> +/*
>> + * The wmi_list is used to store the privacy_priv struct with mutex protecting
>> + */
>> +static LIST_HEAD(wmi_list);
>> +static DEFINE_MUTEX(list_mutex);
>> +
>> +struct privacy_wmi_data {
>> +	struct input_dev *input_dev;
>> +	struct wmi_device *wdev;
>> +	struct list_head list;
>> +	struct led_classdev cdev;
>> +	u32 features_present;
>> +	u32 last_status;
>> +};
>> +
>> +/* DELL Privacy Type */
>> +enum dell_hardware_privacy_type {
>> +	DELL_PRIVACY_TYPE_AUDIO = 0,
>> +	DELL_PRIVACY_TYPE_CAMERA,
>> +	DELL_PRIVACY_TYPE_SCREEN,
>> +	DELL_PRIVACY_TYPE_MAX,
>> +};
>> +
>> +static const char * const privacy_types[DELL_PRIVACY_TYPE_MAX] = {
>> +	[DELL_PRIVACY_TYPE_AUDIO] = "Microphone",
>> +	[DELL_PRIVACY_TYPE_CAMERA] = "Camera Shutter",
>> +	[DELL_PRIVACY_TYPE_SCREEN] = "ePrivacy Screen",
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
>> +/*
>> + * global privacy state for other modules to query if the privacy driver loaded successfully
>> + * or no privacy WMI device was detected at initial probe phase
>> + */
>> +bool dell_privacy_present(void)
>> +{
>> +	struct privacy_wmi_data *priv;
>> +
>> +	mutex_lock(&list_mutex);
>> +	priv = list_first_entry_or_null(&wmi_list,
>> +			struct privacy_wmi_data,
>> +			list);
>> +	mutex_unlock(&list_mutex);
>> +
>> +	return priv;
>> +}
>> +EXPORT_SYMBOL_GPL(dell_privacy_present);

As Barnabás also says below this function is not necessary, please remove it.

>> +
>> +/*
>> + * Allow other modules to check current dell privacy mic mute state
>> + */
>> +int dell_privacy_has_micmute(void)
>> +{
>> +	struct privacy_wmi_data *priv;
>> +	int ret;
>> +
>> +	mutex_lock(&list_mutex);
>> +	priv = list_first_entry_or_null(&wmi_list,
>> +			struct privacy_wmi_data,
>> +			list);
>> +	/*
>> +	 * There is no privacy device node yet, so we need to wait
>> +	 * until the privacy driver has created software node for the micmute device.
>> +	 * This function will return -EPROBE_DEFER until the privacy device is registered.
>> +	 */
>> +	if (!priv) {
>> +		ret = -EPROBE_DEFER;
>> +		goto out;
>> +	}
>> +	ret = priv->features_present & MICROPHONE_STATUS;
>> +	if (!ret) {
>> +		dev_err(&priv->wdev->dev, "privacy mic mute feature is not supported: %d\n", ret);
>> +		ret = -ENODEV;
>> +		goto out;
>> +	}
>> +	dev_err(&priv->wdev->dev, "privacy mic mute feature is supported: %d\n", ret);
> 
> I think this could be `dev_info()`, but definitely not `dev_err()`. Although I'd
> personally move the logging from here to the probe function if you want to log
> which features are available. `ret` is necessarily 1 here, so I don't think printing it
> provides additional information.
> 
> 
>> +
>> +out:
>> +	mutex_unlock(&list_mutex);
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(dell_privacy_has_micmute);
>> +
>> +/*
>> + * The flow of privacy event:
>> + * 1) User presses key. HW does stuff with this key (timeout is started)
>> + * 2) WMI event is emitted from BIOS
>> + * 3) WMI event is received by dell-privacy
>> + * 4) KEY_MICMUTE emitted from dell-privacy
>> + * 5) Userland picks up key and modifies kcontrol for SW mute
>> + * 6) Codec kernel driver catches and calls ledtrig_audio_set defined by
>> + *    dell-privacy-acpi driver. Codec driver will call like this to switch micmute led state.
>> + *    ledtrig_audio_set(LED_AUDIO_MICMUTE, micmute_led ? LED_ON :LED_OFF);
>> + * 7) If "LED" is set to on dell-privacy notifies EC,and timeout is cancelled,
>> + *	HW mic mute activated.
>> + */
>> +bool dell_privacy_process_event(int type, int code, int status)
>> +{
>> +	struct privacy_wmi_data *priv;
>> +	const struct key_entry *key;
>> +	bool ret = false;
>> +
>> +	mutex_lock(&list_mutex);
>> +	priv = list_first_entry_or_null(&wmi_list,
>> +			struct privacy_wmi_data,
>> +			list);
>> +	if (!priv) {
>> +		dev_err(&priv->wdev->dev, "priv data is NULL\n");

Please drop the dev_err here, this is expected to happen on devices without privacy features,
since the intention is to use this function as dell_privacy_present() + process_event()
functionality in one function. Doing things this way is simpler and avoids a race since this
function holds the mutex the entire time.

>> +		goto error;
>> +	}
>> +
> 
> I think the rest of the function could be replaced with:
> 
>   ret = sparse_keymap_report_event(priv->input_dev, DELL_SCAN_CODE(type, code), 1, true)
> 
>   if (ret)
>     priv->last_status = status;
> 
>   error:
>     [...]
> 
> (see later a comment for the definition of DELL_SCAN_CODE())
> 
> 
>> +	key = sparse_keymap_entry_from_scancode(priv->input_dev, (type << 16) | code);
>> +	if (!key) {
>> +		dev_warn(&priv->wdev->dev, "Unknown key with type 0x%04x and code 0x%04x pressed\n",
>> +			type, code);
>> +		goto error;
>> +	}
>> +	dev_dbg(&priv->wdev->dev, "Key with type 0x%04x and code 0x%04x pressed\n", type, code);
>> +
>> +	switch (code) {
>> +	case DELL_PRIVACY_AUDIO_EVENT: /* Mic mute */
>> +	case DELL_PRIVACY_CAMERA_EVENT: /* Camera mute */
>> +		priv->last_status = status;
>> +		sparse_keymap_report_entry(priv->input_dev, key, 1, true);
>> +		ret = true;
>> +		break;
>> +	default:
>> +		dev_dbg(&priv->wdev->dev, "unknown event type 0x%04x 0x%04x", type, code);
> 
> The capitalization is inconsistent. Please either make all messages lowercase or
> make them all start with an uppercase letter. (And a newline character is missing.)
> 
> 
>> +	}
>> +
>> +error:
>> +	mutex_unlock(&list_mutex);
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(dell_privacy_process_event);
>> +
>> +static ssize_t dell_privacy_supported_type_show(struct device *dev,
>> +					struct device_attribute *attr,
>> +					char *buf)
>> +{
>> +	enum dell_hardware_privacy_type type;
>> +	struct privacy_wmi_data *priv = dev_get_drvdata(dev);
>> +	char *s = buf;
>> +	u32 privacy_list;
>> +
>> +	privacy_list = priv->features_present;
>> +	for (type = DELL_PRIVACY_TYPE_AUDIO; type < DELL_PRIVACY_TYPE_MAX; type++) {
>> +		if (privacy_types[type]) {
> 
> Is this check necessary?

No I don't think it is, this check can be removed, good catch.

> 
> 
>> +			if (privacy_list & BIT(type))
>> +				s += sprintf(s, "[%s] [supported]\n", privacy_types[type]);
>> +			else
>> +				s += sprintf(s, "[%s] [unsupport]\n", privacy_types[type]);

[unsupport] should be [unsupported] here.

> 
> You can use `sysfs_emit_at()` here.
> 
> 
>> +		}
>> +	}
>> +
>> +	if (s != buf)
>> +		/* convert the last space to a newline */
>> +		*(s-1) = '\n';
> 
> I believe this is not needed?

Right this is no longer necessary now that we have 1 line per feature.

> 
> 
>> +	return (s - buf);
>> +}
>> +
>> +static ssize_t dell_privacy_current_state_show(struct device *dev,
>> +					struct device_attribute *attr,
>> +					char *buf)
>> +{
>> +	struct privacy_wmi_data *priv = dev_get_drvdata(dev);
>> +	enum dell_hardware_privacy_type type;
>> +	u32 privacy_state = priv->last_status;
>> +	u32 privacy_supported = priv->features_present;
>> +	char *s = buf;
>> +
>> +	for (type = DELL_PRIVACY_TYPE_AUDIO; type < DELL_PRIVACY_TYPE_MAX; type++) {
>> +		if (privacy_supported & BIT(type)) {
>> +			if (privacy_state & BIT(type))
>> +				s += sprintf(s, "[%s] [unmuted]\n", privacy_types[type]);
>> +			else
>> +				s += sprintf(s, "[%s] [muted]\n", privacy_types[type]);
> 
> sysfs_emit_at
> 
> 
>> +		}
>> +	}
>> +
>> +	if (s != buf)
>> +		/* convert the last space to a newline */
>> +		*(s-1) = '\n';
> 
> not needed?

Ack.

>> +	return (s - buf);
>> +}
>> +
>> +static DEVICE_ATTR_RO(dell_privacy_supported_type);
>> +static DEVICE_ATTR_RO(dell_privacy_current_state);
>> +
>> +static struct attribute *privacy_attributes[] = {
>> +	&dev_attr_dell_privacy_supported_type.attr,
>> +	&dev_attr_dell_privacy_current_state.attr,
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
>           ^           ^                 ^             ^        ^^
> Please use a single type of hyphen/dash consistently.     One space is enough.
> 
> 
>> + *  [WmiDataId(2), read] uint32 CurrentState;
>> + *   0:Off; 1:On. Bit0 – Microphone, Bit1 – Camera, Bit2 - ePrivacyScreen
>                           ^                  ^              ^
> Same here.
> 
> 
>> + * };
>> + */
>> +static int get_current_status(struct wmi_device *wdev)
>> +{
>> +	struct privacy_wmi_data *priv = dev_get_drvdata(&wdev->dev);
>> +	union acpi_object *obj_present;
>> +	u32 *buffer;
>> +	int ret = 0;
>> +
>> +	if (!priv) {
>> +		pr_err("dell privacy priv is NULL\n");
> 
> dev_err?

Ack.

>> +		return -EINVAL;
>> +	}
>> +	/* check privacy support features and device states */
>> +	obj_present = wmidev_block_query(wdev, 0);
>> +	if (!obj_present) {
>> +		dev_err(&wdev->dev, "failed to read Binary MOF\n");
>> +		ret = -EIO;
>> +		return ret;
> 
> return -EIO ?
> 
> 
>> +	}
>> +
>> +	if (obj_present->type != ACPI_TYPE_BUFFER) {
>> +		dev_err(&wdev->dev, "Binary MOF is not a buffer!\n");
>> +		ret = -EIO;
>> +		goto obj_free;
>> +	}
>> +	/*  Although it's not technically a failure, this would lead to
>> +	 *  unexpected behavior
>> +	 */
>> +	if (obj_present->buffer.length != 8) {
>> +		dev_err(&wdev->dev, "Dell privacy buffer has unexpected length (%d)!\n",
>> +				obj_present->buffer.length);
>> +		ret = -EINVAL;
>> +		goto obj_free;
>> +	}
>> +	buffer = (u32 *)obj_present->buffer.pointer;
>> +	priv->features_present = buffer[0];
>> +	priv->last_status = buffer[1];
> 
> It's a minor thing, but I still think it'd more explicit and somewhat better to
> use `get_unaligned_le32()` (or `get_unaligned_cpu32()`).
> 
> 
>> +
>> +obj_free:
>> +	kfree(obj_present);
>> +	return ret;
>> +}
>> +
>> +static int dell_privacy_micmute_led_set(struct led_classdev *led_cdev,
>> +					enum led_brightness brightness)
>> +{
>> +	struct privacy_wmi_data *priv = cdev_to_led(led_cdev);
>> +	static char *acpi_method = (char *)"ECAK";
>> +	acpi_status status;
>> +	acpi_handle handle;
>> +
>> +	handle = ec_get_handle();
>> +	if (!handle)
>> +		return -EIO;
>> +
>> +	if (!acpi_has_method(handle, acpi_method))
>> +		return -EIO;
>> +
>> +	status = acpi_evaluate_object(handle, acpi_method, NULL, NULL);
>> +	if (ACPI_FAILURE(status)) {
>> +		dev_err(&priv->wdev->dev, "Error setting privacy EC ack value: %s\n",
>> +				acpi_format_exception(status));
>> +		return -EIO;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
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
>> +	struct privacy_wmi_data *priv = dev_get_drvdata(dev);
>> +	int ret;
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
> 
> You can replace the last four lines with:
> 
>   return devm_led_classdev_register(...);
> 
> 
>> +}
>> +
>> +static int dell_privacy_wmi_probe(struct wmi_device *wdev, const void *context)
>> +{
>> +	struct privacy_wmi_data *priv;
>> +	struct key_entry *keymap;
>> +	int ret, i;
>> +
>> +	ret = wmi_has_guid(DELL_PRIVACY_GUID);
>> +	if (!ret)
>> +		pr_debug("Unable to detect available Dell privacy devices: %d\n", ret);
> 
> When this branch is taken, `ret` is necessarily zero, so I don't think printing it
> provides useful information.
> 
> And I believe this `wmi_has_guid()` check is unnecessary since the probe method
> would not be called if the device didn't have such WMI guid if I'm not mistaken.

Ack, Perry please drop this check.

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
>> +
>> +	/* remap the wmi keymap event to new keymap */
>> +	keymap = kcalloc(ARRAY_SIZE(dell_wmi_keymap_type_0012),
>> +			sizeof(struct key_entry), GFP_KERNEL);
>> +	if (!keymap)
>> +		return -ENOMEM;
>> +
>> +	/* remap the keymap code with Dell privacy key type 0x12 as prefix
>> +	 * KEY_MICMUTE scancode will be reported as 0x120001
>> +	 */
>> +	for (i = 0; i < ARRAY_SIZE(dell_wmi_keymap_type_0012); i++) {
>> +		keymap[i] = dell_wmi_keymap_type_0012[i];
>> +		keymap[i].code |= (0x0012 << 16);
>> +	}
> 
> I still don't see the need for allocating and copying the keymap. Wouldn't the
> following be sufficient?
> 
>   #define DELL_SCAN_CODE(type, code) ((type) << 16 | (code))
>   static const struct key_entry dell_wmi_keymap_type_0012[] = {
>     { KE_KEY, DELL_SCAN_CODE(0x0012, 0x0001), { KEY_MICMUTE } },
>     { KE_SW,  DELL_SCAN_CODE(0x0012, 0x0002), { SW_CAMERA_LENS_COVER } },
>     { KE_END, 0},
>   };
> 
> Other Dell drivers potentially merge multiple keymaps, so dynamically allocating
> the key_entry array is justified. Here I see no such need. Can you explain why
> this copying is done?

I was wondering the same thing when I reviewed v5, but this is consistent with
the handling in dell-wmi.c so I'm fine with keeping it as is for consistency.
But if you (perry) want to change this to the simpler code which Barnabás is
suggesting that is fine too.

> 
> 
>> +	ret = sparse_keymap_setup(priv->input_dev, keymap, NULL);
>> +	if (ret)
>> +		return ret;
> 
> `keymap` is leaked if this or any of the later early-returns are taken.

Right as I mentioned in my review of v5, the "kfree(keymap);" needs to be moved
before the "if (ret)" here, so the end results looks like this:

	ret = sparse_keymap_setup(priv->input_dev, keymap, NULL);
	kfree(keymap);
	if (ret)
		return ret;

And the kfree(keymap) below goes away.

> 
> 
>> +
>> +	priv->input_dev->dev.parent = &wdev->dev;
>> +	priv->input_dev->name = "Dell Privacy Driver";
>> +	priv->input_dev->id.bustype = BUS_HOST;
>> +
>> +	ret = input_register_device(priv->input_dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = get_current_status(priv->wdev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = devm_device_add_group(&wdev->dev, &privacy_attribute_group);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = dell_privacy_leds_setup(&priv->wdev->dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	mutex_lock(&list_mutex);
>> +	list_add_tail(&priv->list, &wmi_list);
>> +	mutex_unlock(&list_mutex);
>> +	kfree(keymap);

This kfree(keymap) needs to be removed. Note that switching to the suggested
non copied keymap would get rid of all of this.

>> +	return 0;
>> +}
>> +
>> +static int dell_privacy_wmi_remove(struct wmi_device *wdev)
>> +{
>> +	struct privacy_wmi_data *priv = dev_get_drvdata(&wdev->dev);
>> +
>> +	mutex_lock(&list_mutex);
>> +	list_del(&priv->list);
>> +	mutex_unlock(&list_mutex);
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
>> +module_wmi_driver(dell_privacy_wmi_driver);
>> +
>> +MODULE_DEVICE_TABLE(wmi, dell_wmi_privacy_wmi_id_table);
>> +MODULE_AUTHOR("Perry Yuan <perry_yuan@dell.com>");
>> +MODULE_DESCRIPTION("Dell Privacy WMI Driver");
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/platform/x86/dell/dell-privacy-wmi.h b/drivers/platform/x86/dell/dell-privacy-wmi.h
>> new file mode 100644
>> index 000000000000..a24893754286
>> --- /dev/null
>> +++ b/drivers/platform/x86/dell/dell-privacy-wmi.h
>> @@ -0,0 +1,32 @@
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
>> +int dell_privacy_has_micmute(void);
>> +bool dell_privacy_present(void);
>> +bool dell_privacy_process_event(int type, int code, int status);
>> +#else /* CONFIG_DELL_PRIVACY */
>> +static inline int dell_privacy_has_micmute(void)
>> +{
>> +	return -ENODEV;
>> +}
>> +
>> +static inline int dell_privacy_present(void)
>                  ^^^
> It's declared with `bool` return type a couple lines above.
> 
> 
>> +{
>> +	return -ENODEV;
>> +}
>> +
>> +static inline void dell_privacy_process_event(int type, int code, int status)
>                  ^^^^
> It's declared with `bool` return type a couple lines above.
> 
> 
>> +{}
>> +#endif /* CONFIG_DELL_PRIVACY */
>> +
>> +int  dell_privacy_acpi_init(void);
>> +void dell_privacy_acpi_exit(void);
> 
> These two don't seem to be referenced anywhere?

These no longer exist and should be removed from the header.

> 
> 
>> +#endif
>> diff --git a/drivers/platform/x86/dell/dell-wmi.c b/drivers/platform/x86/dell/dell-wmi.c
>> index bbdb3e860892..8ef9e22a538f 100644
>> --- a/drivers/platform/x86/dell/dell-wmi.c
>> +++ b/drivers/platform/x86/dell/dell-wmi.c
>> @@ -27,6 +27,7 @@
>>  #include <acpi/video.h>
>>  #include "dell-smbios.h"
>>  #include "dell-wmi-descriptor.h"
>> +#include "dell-privacy-wmi.h"
>>
>>  MODULE_AUTHOR("Matthew Garrett <mjg@redhat.com>");
>>  MODULE_AUTHOR("Pali Rohár <pali@kernel.org>");
>> @@ -381,6 +382,7 @@ static void dell_wmi_notify(struct wmi_device *wdev,
>>  	u16 *buffer_entry, *buffer_end;
>>  	acpi_size buffer_size;
>>  	int len, i;
>> +	int ret;
>>
>>  	if (obj->type != ACPI_TYPE_BUFFER) {
>>  		pr_warn("bad response type %x\n", obj->type);
>> @@ -427,7 +429,6 @@ static void dell_wmi_notify(struct wmi_device *wdev,
>>
>>  		switch (buffer_entry[1]) {
>>  		case 0x0000: /* One key pressed or event occurred */
>> -		case 0x0012: /* Event with extended data occurred */
>>  			if (len > 2)
>>  				dell_wmi_process_key(wdev, buffer_entry[1],
>>  						     buffer_entry[2]);
>> @@ -439,6 +440,16 @@ static void dell_wmi_notify(struct wmi_device *wdev,
>>  				dell_wmi_process_key(wdev, buffer_entry[1],
>>  						     buffer_entry[i]);
>>  			break;
>> +		case 0x0012:
>> +			ret = dell_privacy_present();
>> +			if ((ret) && (len > 2)) {
> 
> Is the `len > 2` check correct?
> 
> Moreover, I personally don't see any reason to use a new variable here (`ret`).
> 
> If you incorporate the `dell_privacy_present()` check into
> `dell_privacy_process_event()`,

`dell_privacy_process_event()` already incorporates a presency check; and
by only relying on that check we also avoid a race between the check and
processing the event.

> then even
> 
>   if (len > ?? && dell_privacy_process_event(...))
>     /* nothing */ ;
>   else if (len > 2)
>     dell_wmi_process_key(...);
> 
> would work as Hans has already pointed it out. And there'd be no need for
> `dell_privacy_present()` anymore.

Ack, please change this and remove the entire dell_privacy_present() function.

So you should end up with this here:

			if (len > 4 && dell_privacy_process_event(buffer_entry[1], buffer_entry[3], buffer_entry[4]))
				/* nothing */ ;
			else if (len > 2)
				dell_wmi_process_key(wdev, buffer_entry[1], dell_wmi_process_key(wdev, buffer_entry[1],
			break;

Regards,

Hans



> 
> 
>> +				dell_privacy_process_event(buffer_entry[1],
>> +							  buffer_entry[3], buffer_entry[4]);
>> +			} else if (len > 2) {
>> +				dell_wmi_process_key(wdev, buffer_entry[1],
>> +						     buffer_entry[2]);
>> +			}
>> +			break;
>>  		default: /* Unknown event */
>>  			pr_info("Unknown WMI event type 0x%x\n",
>>  				(int)buffer_entry[1]);
>> --
>> 2.25.1
>>
> 
> 
> Regards,
> Barnabás Pőcze
> 

