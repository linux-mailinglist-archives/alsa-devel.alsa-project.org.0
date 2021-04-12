Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A4B35C1B8
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Apr 2021 11:42:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AD301607;
	Mon, 12 Apr 2021 11:42:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AD301607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618220571;
	bh=pzU9gyEfGkAmCb3DMGj4FSn5wUHK16dOip0vHgHURTc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U4ISsL+7gf9WVYcZknLAou96pre8m/NwgdbSHWP/LSHvFaA1RnK0VtD7sBvnFWVr6
	 rNBj9HqppGPtDpeyFL3O/XubURog/CkTTlFTLYFvOjNSfozuc+wfu//D6+mV4HhegG
	 Ts+439b3WVxS8IG8y+8My+bImRYxxVeeHv/D2jnk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C38E6F800FF;
	Mon, 12 Apr 2021 11:41:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08205F800FF; Mon, 12 Apr 2021 11:41:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0491F8013D
 for <alsa-devel@alsa-project.org>; Mon, 12 Apr 2021 11:41:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0491F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="LYRbMm4s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618220471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=14yXMD03+QgjUK/mfOKS5QvvByQ98G+teL+wU8B4hbY=;
 b=LYRbMm4shf8pBHloTgM9+gELWthYoIX39p89KzwNHcl9heW4je8FNs8h6v0qjMZgkPooQV
 1Zpgv6/AKV83ikexAyJRB5CTJdiOZauYCJXKmVzVtpLlLt86qO2rCbj97TJwU3UbEOWrA5
 kXeqdLDY+YZeMmUARgeFZ5eUsSj2M+o=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-W4WiR5CLNziL1F2iFauF7A-1; Mon, 12 Apr 2021 05:41:08 -0400
X-MC-Unique: W4WiR5CLNziL1F2iFauF7A-1
Received: by mail-ed1-f70.google.com with SMTP id o25so2916093edv.20
 for <alsa-devel@alsa-project.org>; Mon, 12 Apr 2021 02:41:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=14yXMD03+QgjUK/mfOKS5QvvByQ98G+teL+wU8B4hbY=;
 b=UKJdgfF9QbnQVa927pT8YJfTEzJqZNlJ8GjGtJN6HGa8xHaUrbVn4io2bRxoikVcTX
 DxwMOzZw7czzMFieXQIi3bevwB03Ttl7GQxlCfhLbdl2z4WxSeFN21jALTNf8OMGNhq7
 o2LrlL2s6S6YyT1ePHPZj9cIPhp2qRez8lpGq8jW8otv5uRhbfJlVDAXI4E3fltzePlM
 OSoDpazH6v7MSCBSpLCXMMcmyhUANnSC0qtjnj5JKFu3WTx2LT4hHXCIQu46X8EfehER
 7VQYHbLXLffCuEhmFU69KYlSin/doGxFC+2W+UDSt1mQZZ8kNU0YiPqXFXBXcqQ5g/f+
 tR+A==
X-Gm-Message-State: AOAM5339XOg9VALIEcxBR8MTNXh+E6xcgwXOrk1eB5c7Zl0E5RKQlIIk
 V8V3gAGbCN+ToHuadCa9LepavuzjIueyxGfPmuBnaRY+I5zKaMv7IBlqPyeP/vXAAjtkbTWat3a
 xDK55+H8Q/jgHpaJVlR+lkSI=
X-Received: by 2002:a17:906:170d:: with SMTP id
 c13mr25810466eje.491.1618220467266; 
 Mon, 12 Apr 2021 02:41:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcuTISi10aGHrf/bL5sfhHLBzurjn2m0cpoL7UnzJUpI3WpA03tWz2CykoSbhih7yxPeKhAA==
X-Received: by 2002:a17:906:170d:: with SMTP id
 c13mr25810452eje.491.1618220467077; 
 Mon, 12 Apr 2021 02:41:07 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id q18sm6147190edw.56.2021.04.12.02.41.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Apr 2021 02:41:06 -0700 (PDT)
Subject: Re: [PATCH v7 2/2] ASoC: rt715:add micmute led state control supports
To: Perry Yuan <Perry.Yuan@dell.com>, pobrn@protonmail.com,
 pierre-louis.bossart@linux.intel.com, oder_chiou@realtek.com,
 perex@perex.cz, tiwai@suse.com, mgross@linux.intel.com
References: <20210412091939.16036-1-Perry_Yuan@Dell.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <c6f7bd81-a28a-3a7b-25da-b72ce4631efd@redhat.com>
Date: Mon, 12 Apr 2021 11:41:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210412091939.16036-1-Perry_Yuan@Dell.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, platform-driver-x86@vger.kernel.org, broonie@kernel.org,
 Dell.Client.Kernel@dell.com, mario.limonciello@outlook.com
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

Hi Perry,

On 4/12/21 11:19 AM, Perry Yuan wrote:
> From: Perry Yuan <perry_yuan@dell.com>
> 
> Some new Dell system is going to support audio internal micphone
> privacy setting from hardware level with micmute led state changing
> When micmute hotkey pressed by user, soft mute will need to be enabled
> firstly in case of pop noise, and codec driver need to react to mic
> mute event to EC(embedded controller) notifying that SW mute is completed
> Then EC will do the hardware mute physically within the timeout reached
> 
> This patch allow codec rt715 and rt715 sdca driver to change the local micmute
> led state. Dell privacy led trigger driver will ack EC when micmute key pressed
> through this micphone led control interface like hda_generic provided
> ACPI method defined in dell-privacy micmute led trigger will be called
> for notifying the EC that software mute has been completed, then hardware
> audio circuit solution controlled by EC will switch the audio input source off/on
> 
> Signed-off-by: Perry Yuan <perry_yuan@dell.com>

The ALSA kernel-patch-set which I mentioned in previous discussions, which
allows controlling this through sysfs has been merged upstream and is
currently in for-nex.t. So IMHO you should use the new sysfs mechanism
for this rather then adding quirks to individual codec drivers.

Regards,

Hans


> 
> --------
> v5 -> v6:
> * addresed review comments from Jaroslav
> * add quirks for micmute led control as short term solution to control
>   micmute led state change
> * add comments for the invert checking
> v4 -> v5:
> * rebase to latest 5.12 rc4 upstream kernel
> v3 -> v4:
> * remove unused debug log
> * remove compile flag of DELL privacy
> * move the micmute_led to local from rt715_priv
> * when Jaroslav upstream his gerneric LED trigger driver,I will rebase
>   this patch,please consider merge this at first
>   https://lore.kernel.org/alsa-devel/20210211111400.1131020-1-perex@perex.cz/
> v2 -> v3:
> * simplify the patch to reuse some val value
> * add more detail to the commit info
> v1 -> v2:
> * fix some format issue
> --------
> ---
>  sound/soc/codecs/rt715-sdca.c | 42 ++++++++++++++++++++++++++++++++++
>  sound/soc/codecs/rt715.c      | 43 +++++++++++++++++++++++++++++++++++
>  2 files changed, 85 insertions(+)
> 
> diff --git a/sound/soc/codecs/rt715-sdca.c b/sound/soc/codecs/rt715-sdca.c
> index 20528afbdc57..47dc31f7f3e3 100644
> --- a/sound/soc/codecs/rt715-sdca.c
> +++ b/sound/soc/codecs/rt715-sdca.c
> @@ -11,12 +11,14 @@
>  #include <linux/moduleparam.h>
>  #include <linux/kernel.h>
>  #include <linux/init.h>
> +#include <linux/leds.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/pm.h>
>  #include <linux/soundwire/sdw.h>
>  #include <linux/regmap.h>
>  #include <linux/slab.h>
>  #include <linux/platform_device.h>
> +#include <linux/dmi.h>
>  #include <sound/core.h>
>  #include <sound/pcm.h>
>  #include <sound/pcm_params.h>
> @@ -344,6 +346,32 @@ static int rt715_sdca_get_volsw(struct snd_kcontrol *kcontrol,
>  	return 0;
>  }
>  
> +static bool micmute_led_set;
> +static int  dmi_matched(const struct dmi_system_id *dmi)
> +{
> +	micmute_led_set = 1;
> +	return 1;
> +}
> +
> +/* Some systems will need to use this to trigger mic mute LED state changed */
> +static const struct dmi_system_id micmute_led_dmi_table[] = {
> +	{
> +		.callback = dmi_matched,
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_SKU, "0A32"),
> +		},
> +	},
> +	{
> +		.callback = dmi_matched,
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_SKU, "0A3E"),
> +		},
> +	},
> +	{},
> +};
> +
>  static int rt715_sdca_put_volsw(struct snd_kcontrol *kcontrol,
>  	struct snd_ctl_elem_value *ucontrol)
>  {
> @@ -358,6 +386,7 @@ static int rt715_sdca_put_volsw(struct snd_kcontrol *kcontrol,
>  	unsigned int mask = (1 << fls(max)) - 1;
>  	unsigned int invert = p->invert;
>  	int err;
> +	bool micmute_led;
>  
>  	for (i = 0; i < 4; i++) {
>  		if (ucontrol->value.integer.value[i] != rt715->kctl_switch_orig[i]) {
> @@ -394,6 +423,18 @@ static int rt715_sdca_put_volsw(struct snd_kcontrol *kcontrol,
>  			return err;
>  	}
>  
> +	/* Micmute LED state changed by muted/unmute switch
> +	 * to keep syncing with actual hardware mic mute led state
> +	 * invert will be checked to change the state switch
> +	 */
> +	if (invert && micmute_led_set) {
> +		if (ucontrol->value.integer.value[0] || ucontrol->value.integer.value[1])
> +			micmute_led = LED_OFF;
> +		else
> +			micmute_led = LED_ON;
> +		ledtrig_audio_set(LED_AUDIO_MICMUTE, micmute_led);
> +	}
> +
>  	return k_changed;
>  }
>  
> @@ -1066,6 +1107,7 @@ int rt715_sdca_io_init(struct device *dev, struct sdw_slave *slave)
>  
>  	pm_runtime_mark_last_busy(&slave->dev);
>  	pm_runtime_put_autosuspend(&slave->dev);
> +	dmi_check_system(micmute_led_dmi_table);
>  
>  	return 0;
>  }
> diff --git a/sound/soc/codecs/rt715.c b/sound/soc/codecs/rt715.c
> index 34c3357e943b..59d05b28f52e 100644
> --- a/sound/soc/codecs/rt715.c
> +++ b/sound/soc/codecs/rt715.c
> @@ -13,6 +13,7 @@
>  #include <linux/init.h>
>  #include <linux/delay.h>
>  #include <linux/i2c.h>
> +#include <linux/leds.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/pm.h>
>  #include <linux/soundwire/sdw.h>
> @@ -25,6 +26,7 @@
>  #include <linux/of.h>
>  #include <linux/of_gpio.h>
>  #include <linux/of_device.h>
> +#include <linux/dmi.h>
>  #include <sound/core.h>
>  #include <sound/pcm.h>
>  #include <sound/pcm_params.h>
> @@ -70,6 +72,32 @@ static void rt715_get_gain(struct rt715_priv *rt715, unsigned int addr_h,
>  		pr_err("Failed to get L channel gain.\n");
>  }
>  
> +static bool micmute_led_set;
> +static int  dmi_matched(const struct dmi_system_id *dmi)
> +{
> +	micmute_led_set = 1;
> +	return 1;
> +}
> +
> +/* Some systems will need to use this to trigger mic mute LED state changed */
> +static const struct dmi_system_id micmute_led_dmi_table[] = {
> +	{
> +		.callback = dmi_matched,
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_SKU, "0A32"),
> +		},
> +	},
> +	{
> +		.callback = dmi_matched,
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_SKU, "0A3E"),
> +		},
> +	},
> +	{},
> +};
> +
>  /* For Verb-Set Amplifier Gain (Verb ID = 3h) */
>  static int rt715_set_amp_gain_put(struct snd_kcontrol *kcontrol,
>  					struct snd_ctl_elem_value *ucontrol)
> @@ -88,6 +116,7 @@ static int rt715_set_amp_gain_put(struct snd_kcontrol *kcontrol,
>  		RT715_SET_GAIN_MIX_ADC2_L};
>  	unsigned int addr_h, addr_l, val_h, val_ll, val_lr;
>  	unsigned int read_ll, read_rl, i, j, loop_cnt;
> +	bool micmute_led;
>  
>  	if (strstr(ucontrol->id.name, "Main Capture Switch") ||
>  		strstr(ucontrol->id.name, "Main Capture Volume"))
> @@ -185,6 +214,19 @@ static int rt715_set_amp_gain_put(struct snd_kcontrol *kcontrol,
>  	if (dapm->bias_level <= SND_SOC_BIAS_STANDBY)
>  		regmap_write(rt715->regmap,
>  				RT715_SET_AUDIO_POWER_STATE, AC_PWRST_D3);
> +
> +	/* Micmute LED state changed by muted/unmute switch
> +	 * to keep syncing with actual hardware mic mute led state
> +	 * invert will be checked to change the state switch
> +	 */
> +	if (mc->invert && micmute_led_set) {
> +		if (ucontrol->value.integer.value[0] || ucontrol->value.integer.value[1])
> +			micmute_led = LED_OFF;
> +		else
> +			micmute_led = LED_ON;
> +		ledtrig_audio_set(LED_AUDIO_MICMUTE, micmute_led);
> +	}
> +
>  	return 0;
>  }
>  
> @@ -901,6 +943,7 @@ int rt715_io_init(struct device *dev, struct sdw_slave *slave)
>  
>  	pm_runtime_mark_last_busy(&slave->dev);
>  	pm_runtime_put_autosuspend(&slave->dev);
> +	dmi_check_system(micmute_led_dmi_table);
>  
>  	return 0;
>  }
> 

