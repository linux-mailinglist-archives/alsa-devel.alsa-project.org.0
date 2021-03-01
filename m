Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 751113281AA
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Mar 2021 16:02:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1ACB16A8;
	Mon,  1 Mar 2021 16:02:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1ACB16A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614610978;
	bh=1ke6iXCnlfa00rzf+Xw43Do2vdpeNJiMliqLz/VR8ao=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PD3L2LYhu2GAoHH7GZI6upVjNvBEwBhEKQQc8odCIToQ251o6rRsvhlZ64GFJKkOg
	 Z03pXIfgzGCetIGK9eQjGlY3agA78ujUfDUn3lKW4T3xwMJ56I0gIQwCcsrj1thoiv
	 2XUZ+Bt1CXuATPvZ183J5tO/dloHI1u6nbjUtcZg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F171F800E0;
	Mon,  1 Mar 2021 16:01:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BEA62F800E0; Mon,  1 Mar 2021 16:01:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8E72F800E0
 for <alsa-devel@alsa-project.org>; Mon,  1 Mar 2021 16:01:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8E72F800E0
IronPort-SDR: PjpCoLXhZ0xI4N3w/bMj06eK581EjdMOA3gU3jTQAoCb9+dg2TgTSsIfCqNv5wmzFE52LBlyNH
 m1RREhHCSnFA==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="166365369"
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; d="scan'208";a="166365369"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 07:01:16 -0800
IronPort-SDR: RIu8wdV9ecjSdrrfV/CYNJkqq7vcMUP7Y5lYPWrmooxDwvIgoJ8n037rOIxi8lQQnMxfASkBIX
 KAHBJJfa+O4g==
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; d="scan'208";a="406256430"
Received: from jli125-mobl.gar.corp.intel.com (HELO [10.255.229.226])
 ([10.255.229.226])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 07:01:13 -0800
Subject: Re: [PATCH v4 1/2] platform/x86: dell-privacy: Add support for Dell
 hardware privacy
To: Perry Yuan <Perry.Yuan@dell.com>, pobrn@protonmail.com,
 oder_chiou@realtek.com, perex@perex.cz, tiwai@suse.com, hdegoede@redhat.com,
 mgross@linux.intel.com, Mario.Limonciello@dell.com
References: <20210301093753.16300-1-Perry_Yuan@Dell.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <551e30d2-0211-f3cb-fbb8-ee5b2f22a851@linux.intel.com>
Date: Mon, 1 Mar 2021 08:28:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210301093753.16300-1-Perry_Yuan@Dell.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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


> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 581475f59819..18c430456de7 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -51,7 +51,9 @@ obj-$(CONFIG_DELL_WMI_DESCRIPTOR)	+= dell-wmi-descriptor.o
>   obj-$(CONFIG_DELL_WMI_AIO)		+= dell-wmi-aio.o
>   obj-$(CONFIG_DELL_WMI_LED)		+= dell-wmi-led.o
>   obj-$(CONFIG_DELL_WMI_SYSMAN)		+= dell-wmi-sysman/
> -
> +obj-$(CONFIG_DELL_PRIVACY)              += dell-privacy.o
> +dell-privacy-objs                       := dell-privacy-wmi.o \
> +	                                   dell-privacy-acpi.o
>   # Fujitsu
>   obj-$(CONFIG_AMILO_RFKILL)	+= amilo-rfkill.o
>   obj-$(CONFIG_FUJITSU_LAPTOP)	+= fujitsu-laptop.o
> diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
> index 70edc5bb3a14..ec0dcc7fc17c 100644
> --- a/drivers/platform/x86/dell-laptop.c
> +++ b/drivers/platform/x86/dell-laptop.c
> @@ -31,6 +31,8 @@
>   #include "dell-rbtn.h"
>   #include "dell-smbios.h"
>   
> +#include "dell-privacy-wmi.h"
> +
>   struct quirk_entry {
>   	bool touchpad_led;
>   	bool kbd_led_not_present;
> @@ -90,10 +92,12 @@ static struct rfkill *wifi_rfkill;
>   static struct rfkill *bluetooth_rfkill;
>   static struct rfkill *wwan_rfkill;
>   static bool force_rfkill;
> +static bool has_privacy;
>   
>   module_param(force_rfkill, bool, 0444);
>   MODULE_PARM_DESC(force_rfkill, "enable rfkill on non whitelisted models");
>   
> +

spurious line change

>   static const struct dmi_system_id dell_device_table[] __initconst = {
>   	{
>   		.ident = "Dell laptop",
> @@ -2205,11 +2209,17 @@ static int __init dell_init(void)
>   	dell_laptop_register_notifier(&dell_laptop_notifier);
>   
>   	if (dell_smbios_find_token(GLOBAL_MIC_MUTE_DISABLE) &&
> -	    dell_smbios_find_token(GLOBAL_MIC_MUTE_ENABLE)) {
> -		micmute_led_cdev.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
> -		ret = led_classdev_register(&platform_device->dev, &micmute_led_cdev);
> -		if (ret < 0)
> -			goto fail_led;
> +			dell_smbios_find_token(GLOBAL_MIC_MUTE_ENABLE)) {

not sure why you changed the alignment?

> +		if (!privacy_valid)
> +			has_privacy = true;
> +		else
> +			has_privacy = false;
> +		if (!has_privacy) {
> +			micmute_led_cdev.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
> +			ret = led_classdev_register(&platform_device->dev, &micmute_led_cdev);
> +			if (ret < 0)
> +				goto fail_led;
> +		}
>   	}
>   
>   	if (acpi_video_get_backlight_type() != acpi_backlight_vendor)

> +static struct platform_driver dell_privacy_platform_drv = {
> +	.driver = {
> +		.name = PRIVACY_PLATFORM_NAME,
> +	},
> +	.probe = dell_privacy_acpi_probe,
> +	.remove = dell_privacy_acpi_remove,
> +};
> +
> +int __init dell_privacy_acpi_init(void)
> +{
> +	int err;
> +	struct platform_device *pdev;
> +
> +	if (!wmi_has_guid(DELL_PRIVACY_GUID))
> +		return -ENODEV;
> +
> +	privacy_acpi = kzalloc(sizeof(*privacy_acpi), GFP_KERNEL);
> +	if (!privacy_acpi)
> +		return -ENOMEM;
> +
> +	err = platform_driver_register(&dell_privacy_platform_drv);
> +	if (err)
> +		goto pdrv_err;
> +
> +	pdev = platform_device_register_simple(
> +			PRIVACY_PLATFORM_NAME, PLATFORM_DEVID_NONE, NULL, 0);
> +	if (IS_ERR(pdev)) {
> +		err = PTR_ERR(pdev);
> +		goto pdev_err;
> +	}
> +
> +	return 0;
> +
> +pdev_err:
> +	platform_device_unregister(pdev);
> +pdrv_err:
> +	kfree(privacy_acpi);
> +	return err;
> +}

don't you need some sort of device_initcall() to load this module on 
startup?

> +void dell_privacy_process_event(int type, int code, int status)
> +{
> +	struct privacy_wmi_data *priv;
> +	const struct key_entry *key;
> +
> +	mutex_lock(&list_mutex);
> +	priv = list_first_entry_or_null(&wmi_list,
> +			struct privacy_wmi_data,
> +			list);
> +	if (!priv) {
> +		pr_err("dell privacy priv is NULL\n");
> +		goto error;
> +	}
> +	key = sparse_keymap_entry_from_scancode(priv->input_dev, (type << 16) | code);
> +	if (!key) {
> +		dev_dbg(&priv->wdev->dev, "Unknown key with type 0x%04x and code 0x%04x pressed\n",
> +				type, code);
> +		goto error;
> +	}
> +	switch (code) {
> +	case DELL_PRIVACY_TYPE_AUDIO: /* Mic mute */
> +		priv->last_status = status;
> +		sparse_keymap_report_entry(priv->input_dev, key, 1, true);
> +		break;
> +	case DELL_PRIVACY_TYPE_CAMERA: /* Camera mute */
> +		priv->last_status = status;
> +		sparse_keymap_report_entry(priv->input_dev, key, 1, true);
> +		break;

You are doing the same things twice, so group the two cases:

	case DELL_PRIVACY_TYPE_AUDIO: /* Mic mute */
	case DELL_PRIVACY_TYPE_CAMERA: /* Camera mute */
		priv->last_status = status;
		sparse_keymap_report_entry(priv->input_dev, key, 1, true);
		break;

> +	default:
> +			dev_dbg(&priv->wdev->dev, "unknown event type 0x%04x 0x%04x",
> +					type, code);

alignment?

> +	}
> +error:
> +	mutex_unlock(&list_mutex);
> +}
> +EXPORT_SYMBOL_GPL(dell_privacy_process_event);

> +static int dell_privacy_wmi_probe(struct wmi_device *wdev, const void *context)
> +{
> +	struct privacy_wmi_data *priv;
> +	struct key_entry *keymap;
> +	int ret, i;
> +
> +	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(&wdev->dev, priv);
> +	priv->wdev = wdev;
> +	/* create evdev passing interface */
> +	priv->input_dev = devm_input_allocate_device(&wdev->dev);
> +	if (!priv->input_dev)
> +		return -ENOMEM;
> +	/* remap the wmi keymap event to new keymap */
> +	keymap = kcalloc(ARRAY_SIZE(dell_wmi_keymap_type_0012),
> +			sizeof(struct key_entry), GFP_KERNEL);
> +	if (!keymap) {
> +		ret = -ENOMEM;
> +		goto err_free_dev;
> +	}
> +	/* remap the keymap code with Dell privacy key type 0x12 as prefix
> +	 * KEY_MICMUTE scancode will be reported as 0x120001
> +	 */
> +	for (i = 0; i < ARRAY_SIZE(dell_wmi_keymap_type_0012); i++) {
> +		keymap[i] = dell_wmi_keymap_type_0012[i];
> +		keymap[i].code |= (0x0012 << 16);
> +	}
> +	ret = sparse_keymap_setup(priv->input_dev, keymap, NULL);
> +	if (ret)
> +		return ret;
> +	priv->input_dev->dev.parent = &wdev->dev;
> +	priv->input_dev->name = "Dell Privacy Driver";
> +	priv->input_dev->id.bustype = BUS_HOST;
> +	if (input_register_device(priv->input_dev)) {
> +		pr_debug("input_register_device failed to register!\n");
> +		goto err_free_keymap;
> +	}
> +	mutex_lock(&list_mutex);
> +	list_add_tail(&priv->list, &wmi_list);
> +	mutex_unlock(&list_mutex);
> +
> +	if (get_current_status(priv->wdev))
> +		goto err_free_input;
> +
> +	ret = devm_device_add_group(&wdev->dev, &privacy_attribute_group);
> +	if (ret)
> +		goto err_free_input;
> +
> +	kfree(keymap);
> +	return 0;
> +
> +err_free_input:
> +	input_unregister_device(priv->input_dev);
> +err_free_keymap:
> +	privacy_valid = -ENODEV;
> +	kfree(keymap);
> +err_free_dev:
> +	input_free_device(priv->input_dev);

priv->input_dev is allocated with devm_, so why do you need to do 
anything with it? that seems like a miss.

> +	return ret;
> +}
> +

>   MODULE_AUTHOR("Matthew Garrett <mjg@redhat.com>");
>   MODULE_AUTHOR("Pali Rohár <pali@kernel.org>");
> @@ -381,6 +383,7 @@ static void dell_wmi_notify(struct wmi_device *wdev,
>   	u16 *buffer_entry, *buffer_end;
>   	acpi_size buffer_size;
>   	int len, i;
> +	int err;
>   
>   	if (obj->type != ACPI_TYPE_BUFFER) {
>   		pr_warn("bad response type %x\n", obj->type);
> @@ -427,10 +430,9 @@ static void dell_wmi_notify(struct wmi_device *wdev,
>   
>   		switch (buffer_entry[1]) {
>   		case 0x0000: /* One key pressed or event occurred */
> -		case 0x0012: /* Event with extended data occurred */
>   			if (len > 2)
>   				dell_wmi_process_key(wdev, buffer_entry[1],
> -						     buffer_entry[2]);
> +						buffer_entry[2]);

keep the alignment?

>   			/* Extended data is currently ignored */
>   			break;
>   		case 0x0010: /* Sequence of keys pressed */
> @@ -439,6 +441,17 @@ static void dell_wmi_notify(struct wmi_device *wdev,
>   				dell_wmi_process_key(wdev, buffer_entry[1],
>   						     buffer_entry[i]);
>   			break;
> +		case 0x0012:
> +			err = dell_privacy_state();
> +			if (err == 0) {
> +				dell_privacy_process_event(buffer_entry[1],
> +						buffer_entry[3], buffer_entry[4]);
> +			} else {
> +				if (len > 2)
> +					dell_wmi_process_key(wdev, buffer_entry[1],
> +						buffer_entry[2]);
> +			}
> +			break;
>   		default: /* Unknown event */
>   			pr_info("Unknown WMI event type 0x%x\n",
>   				(int)buffer_entry[1]);
> 
