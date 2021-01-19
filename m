Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B66D12FC114
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jan 2021 21:35:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 322BF18B8;
	Tue, 19 Jan 2021 21:34:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 322BF18B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611088496;
	bh=SVImvOhgkU+hXOYgN2yE2/kkBlbD8b4Lgt+9m6mMkc0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A0qstyHqm/tHypsimdMXcu77n2GD9AbsmSuhzPKtK2LhAQ2ZpKA/Bu2i0U4uRW5XE
	 TXc2/YTjs2mYL43wwEGrTUpSktpa6DaMx2jlekVecCN48aTP+U4o7yV1M4HFfTvJ9B
	 YCtSkxjR71Op3n+3qPHbJ2pOYC4sxKfc2ap0oBfA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66050F8026A;
	Tue, 19 Jan 2021 21:33:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70E7CF80257; Tue, 19 Jan 2021 21:33:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABA59F800FE
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 21:33:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABA59F800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="T6RuepD9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611088389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=23er8d4qGSqJb9+O8wFFWdVfoc1tFodQp+QH8dpUNoA=;
 b=T6RuepD9RA+0C+1IdVEVKQCXrW/Dx0AcQywGp01YdoSwbixKb9nRRRLYd17e6HUALJwWqY
 k5BpSHct2QDdgsG1fJfvxcMVo3Ffak8i6HQZD0ZyV2eVjViovuaAYJySfJ8xrb5oy3v9uJ
 r7LIHYW/UOS+zx3tbYg1Z4bZCQiAwRg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-G337c2IqMFSbzIyNv0a6VA-1; Tue, 19 Jan 2021 15:33:07 -0500
X-MC-Unique: G337c2IqMFSbzIyNv0a6VA-1
Received: by mail-ej1-f72.google.com with SMTP id le12so3645429ejb.13
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 12:33:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=23er8d4qGSqJb9+O8wFFWdVfoc1tFodQp+QH8dpUNoA=;
 b=o1H99TPKWoPvZyCizRqO9V10k4vOdfUBBQm01u/Js+4NiS4x5aV6cmVQMgkyl0WUff
 2Pac72VE1O/I1uBxeNLy0HaakCChji+sN26QXSTa34aoy9AC0xzFviMtquEaih7mnZm9
 eIfQezrfNqGTr4yNbxYZlC2dw8Fpi1bJti/YZ7yhUwt3bYFVNqEQSoyaiDLAjbFXv/wj
 LUbMdKWwKivm5eH1EPDwxXAwS06dDMOVynZo2BR+WNulD5rnjXikIfnus55u7/+ApmHq
 Hh/21Oqd3UWQBTWApWbbXZ5eJdwtkpM50Dz3IvfLzpJPrsKWnMl1/ALI/1Rx9ecCsDnu
 c09w==
X-Gm-Message-State: AOAM531cU7cvb0nL0mg5EiyA+ojfIPMSHix3okSedGaR1wsv+6MnISTZ
 yhzAE55G0VpmJyQGJjq0qxjm2dSzdL9B6wUhfdQT3BEOE/yJYQebhyiyPn9aD0drRZ44UudRjXy
 YHtkCYKq7Krk6Vc2kbgou/wU=
X-Received: by 2002:a05:6402:35ca:: with SMTP id
 z10mr4892576edc.186.1611088385946; 
 Tue, 19 Jan 2021 12:33:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy33Eg9h8JbuZTX6k5/kDSmWInMmfJEaiXUN+F2hixliyB0mPa+RgXNILd+5n9Uwu42CZTX0A==
X-Received: by 2002:a05:6402:35ca:: with SMTP id
 z10mr4892569edc.186.1611088385774; 
 Tue, 19 Jan 2021 12:33:05 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
 by smtp.gmail.com with ESMTPSA id m10sm7230897edi.54.2021.01.19.12.33.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 12:33:05 -0800 (PST)
Subject: Re: [PATCH v3 3/3] ASoC: rt715:add micmute led state control supports
To: "Limonciello, Mario" <Mario.Limonciello@dell.com>,
 Perry Yuan <perry979106@gmail.com>, "Yuan, Perry" <Perry.Yuan@dell.com>,
 "oder_chiou@realtek.com" <oder_chiou@realtek.com>,
 "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 "mgross@linux.intel.com" <mgross@linux.intel.com>
References: <20210112171814.5404-1-Perry_Yuan@Dell.com>
 <BY3PR19MB49131AA4EAE7C24D365FAC8DFAAA0@BY3PR19MB4913.namprd19.prod.outlook.com>
 <44d8e280-c8f3-4e3a-7ef7-b68224c96def@gmail.com>
 <SA1PR19MB4926382ED61402D0F0BFA3B3FAA30@SA1PR19MB4926.namprd19.prod.outlook.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <47830d92-e98a-00f8-bf91-79e187ba7c5b@redhat.com>
Date: Tue, 19 Jan 2021 21:33:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <SA1PR19MB4926382ED61402D0F0BFA3B3FAA30@SA1PR19MB4926.namprd19.prod.outlook.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
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

Hi,

On 1/19/21 5:33 PM, Limonciello, Mario wrote:
>>>> -----Original Message-----
>>>> From: Yuan, Perry <Perry_Yuan@Dell.com>
>>>> Sent: Tuesday, January 12, 2021 11:18
>>>> To: oder_chiou@realtek.com; perex@perex.cz; tiwai@suse.com;
>>>> hdegoede@redhat.com; mgross@linux.intel.com
>>>> Cc: lgirdwood@gmail.com; broonie@kernel.org; alsa-devel@alsa-project.org;
>>>> linux-kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org; Yuan,
>>>> Perry; Limonciello, Mario
>>>> Subject: [PATCH v3 3/3] ASoC: rt715:add micmute led state control supports
>>>>
>>>> From: Perry Yuan <perry_yuan@dell.com>
>>>>
>>>> Some new Dell system is going to support audio internal micphone
>>>> privacy setting from hardware level with micmute led state changing
>>>> When micmute hotkey pressed by user, soft mute will need to be enabled
>>>> firstly in case of pop noise, and codec driver need to react to mic
>>>> mute event to EC(embedded controller) notifying that SW mute is completed
>>>> Then EC will do the hardware mute physically within the timeout reached
>>>>
>>>> This patch allow codec rt715 driver to ack EC when micmute key pressed
>>>> through this micphone led control interface like hda_generic provided
>>>> ACPI method defined in dell-privacy micmute led trigger will be called
>>>> for notifying the EC that software mute has been completed
>>>>
>>>> Signed-off-by: Perry Yuan <perry_yuan@dell.com>
>>>>
>>>> --------
>>>> v2 -> v3
>>>> * simplify the patch to reuse some val value
>>>> * add more detail to the commit info
>>>>
>>>> v1 -> v2:
>>>> * fix some format issue
>>>> --------
>>>> ---
>>>>   sound/soc/codecs/rt715-sdca.c | 16 ++++++++++++++++
>>>>   sound/soc/codecs/rt715-sdca.h |  1 +
>>>>   sound/soc/codecs/rt715.c      | 14 ++++++++++++++
>>>>   sound/soc/codecs/rt715.h      |  1 +
>>>>   4 files changed, 32 insertions(+)
>>>>
>>>> diff --git a/sound/soc/codecs/rt715-sdca.c b/sound/soc/codecs/rt715-sdca.c
>>>> index b43ac8559e45..861a0d2a8957 100644
>>>> --- a/sound/soc/codecs/rt715-sdca.c
>>>> +++ b/sound/soc/codecs/rt715-sdca.c
>>>> @@ -12,6 +12,7 @@
>>>>   #include <linux/version.h>
>>>>   #include <linux/kernel.h>
>>>>   #include <linux/init.h>
>>>> +#include <linux/leds.h>
>>>>   #include <linux/pm_runtime.h>
>>>>   #include <linux/pm.h>
>>>>   #include <linux/soundwire/sdw.h>
>>>> @@ -244,6 +245,7 @@ static int rt715_sdca_get_volsw(struct snd_kcontrol
>>>> *kcontrol,
>>>>   	unsigned int max = mc->max;
>>>>   	int val;
>>>>
>>>> +	pr_err("++++++rt715_sdca_get_volsw++\n");
>>>>   	val = snd_soc_component_read(component, mc->reg);
>>>>   	if (val < 0)
>>>>   		return -EINVAL;
>>>> @@ -261,6 +263,7 @@ static int rt715_sdca_put_volsw(struct snd_kcontrol
>>>> *kcontrol,
>>>>   	struct snd_ctl_elem_value *ucontrol)
>>>>   {
>>>>   	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
>>>> +	struct rt715_sdca_priv *rt715 =
>>>> snd_soc_component_get_drvdata(component);
>>>>   	struct soc_mixer_control *mc =
>>>>   		(struct soc_mixer_control *)kcontrol->private_value;
>>>>   	unsigned int val, val2, loop_cnt = 2, i;
>>>> @@ -268,6 +271,7 @@ static int rt715_sdca_put_volsw(struct snd_kcontrol
>>>> *kcontrol,
>>>>   	unsigned int reg2 = mc->rreg;
>>>>   	unsigned int reg = mc->reg;
>>>>   	unsigned int max = mc->max;
>>>> +	unsigned int val0, val1;
>>>>   	int err;
>>>>
>>>>   	val = ucontrol->value.integer.value[0];
>>>> @@ -287,6 +291,18 @@ static int rt715_sdca_put_volsw(struct snd_kcontrol
>>>> *kcontrol,
>>>>   			return err;
>>>>   	}
>>>>
>>>> +#if IS_ENABLED(CONFIG_DELL_PRIVACY)
>>>> +	/* dell privacy LED trigger state changed by muted/unmute switch */
>>>> +	if (mc->invert) {
>>>> +		if (ucontrol->value.integer.value[0] || ucontrol-
>>>>> value.integer.value[1]) {
>>>> +			rt715->micmute_led = LED_OFF;
>>>> +		} else {
>>>> +			rt715->micmute_led = LED_ON;
>>>> +		}
>>>> +		ledtrig_audio_set(LED_AUDIO_MICMUTE, rt715->micmute_led);
>>>> +	}
>>>> +#endif
>>>> +
>>>>   	return 0;
>>>>   }
>>>>
>>>> diff --git a/sound/soc/codecs/rt715-sdca.h b/sound/soc/codecs/rt715-sdca.h
>>>> index 840c237895dd..f8988ab88f80 100644
>>>> --- a/sound/soc/codecs/rt715-sdca.h
>>>> +++ b/sound/soc/codecs/rt715-sdca.h
>>>> @@ -31,6 +31,7 @@ struct rt715_sdca_priv {
>>>>   	int l_is_unmute;
>>>>   	int r_is_unmute;
>>>>   	int hw_sdw_ver;
>>>> +	bool micmute_led;
>>>>   };
>>>>
>>>>   struct rt715_sdw_stream_data {
>>>> diff --git a/sound/soc/codecs/rt715.c b/sound/soc/codecs/rt715.c
>>>> index cdcba70146da..b4e480744c94 100644
>>>> --- a/sound/soc/codecs/rt715.c
>>>> +++ b/sound/soc/codecs/rt715.c
>>>> @@ -13,6 +13,7 @@
>>>>   #include <linux/init.h>
>>>>   #include <linux/delay.h>
>>>>   #include <linux/i2c.h>
>>>> +#include <linux/leds.h>
>>>>   #include <linux/pm_runtime.h>
>>>>   #include <linux/pm.h>
>>>>   #include <linux/soundwire/sdw.h>
>>>> @@ -88,6 +89,7 @@ static int rt715_set_amp_gain_put(struct snd_kcontrol
>>>> *kcontrol,
>>>>   		RT715_SET_GAIN_MIX_ADC2_L};
>>>>   	unsigned int addr_h, addr_l, val_h, val_ll, val_lr;
>>>>   	unsigned int read_ll, read_rl, i, j, loop_cnt;
>>>> +	unsigned int val0, val1;
>>>>
>>>>   	if (strstr(ucontrol->id.name, "Main Capture Switch") ||
>>>>   		strstr(ucontrol->id.name, "Main Capture Volume"))
>>>> @@ -95,6 +97,18 @@ static int rt715_set_amp_gain_put(struct snd_kcontrol
>>>> *kcontrol,
>>>>   	else
>>>>   		loop_cnt = 1;
>>>>
>>>> +#if IS_ENABLED(CONFIG_DELL_PRIVACY)
>>>> +	/* Micmute LED state changed by muted/unmute switch */
>>>> +	if (mc->invert) {
>>>> +		if (ucontrol->value.integer.value[0] || ucontrol-
>>>>> value.integer.value[1]) {
>>>> +			rt715->micmute_led = LED_OFF;
>>>> +		} else {
>>>> +			rt715->micmute_led = LED_ON;
>>>> +		}
>>>> +		ledtrig_audio_set(LED_AUDIO_MICMUTE, rt715->micmute_led);
>>>> +	}
>>>> +#endif
>>>> +
>>> You might have missed my other comment on v2 feedback, but is there a reason
>>> to keep it behind a compile time flag for dell privacy module?  In practice
>>> any other future led backend provider should work too.  Another way to think
>>> about it - if dell privacy wasn't enabled would this cause a problem to run
>>> this code?  I think it would just be a no-op.
>>>
>>>>   	for (j = 0; j < loop_cnt; j++) {
>>>>   		/* Can't use update bit function, so read the original value first
>>>> */
>>>>   		if (loop_cnt == 1) {
>>>> diff --git a/sound/soc/codecs/rt715.h b/sound/soc/codecs/rt715.h
>>>> index 009a8266f606..57c9af041181 100644
>>>> --- a/sound/soc/codecs/rt715.h
>>>> +++ b/sound/soc/codecs/rt715.h
>>>> @@ -22,6 +22,7 @@ struct rt715_priv {
>>>>   	struct sdw_bus_params params;
>>>>   	bool hw_init;
>>>>   	bool first_hw_init;
>>>> +	bool micmute_led;
>>>>   };
>>>>
>>>>   struct sdw_stream_data {
>>>> --
>>>> 2.25.1
>>
>> Pierre Louis suggested to just set the mic mute led state unconditionally .
>> It is more common interface to allow other platforms to change micmute led.
>> The discussion result is from "[PATCH v2 2/2] ASoC: rt715:add Mic Mute LED
>> control support"
>>
>> Here is the change compared to V3 ,the CONFIG_DELL_PRIVACY will be removed
>>
>> -#if IS_ENABLED(CONFIG_DELL_PRIVACY)
>> -       /* dell privacy LED trigger state changed by muted/unmute switch */
>> +       /* MicMute LED state changed by muted/unmute switch */
>>          if (mc->invert) {
>>                  if (ucontrol->value.integer.value[0] || ucontrol-
>>> value.integer.value[1]) {
>>                          rt715->micmute_led = LED_OFF;
>> diff --git a/sound/soc/codecs/rt715.c b/sound/soc/codecs/rt715.c
>> index b4e480744c94..60bb3d98103e 100644
>> --- a/sound/soc/codecs/rt715.c
>> +++ b/sound/soc/codecs/rt715.c
>> @@ -97,8 +97,7 @@ static int rt715_set_amp_gain_put(struct snd_kcontrol
>> *kcontrol,
>>          else
>>                  loop_cnt = 1;
>>
>> -#if IS_ENABLED(CONFIG_DELL_PRIVACY)
>> -       /* Micmute LED state changed by muted/unmute switch */
>> +       /* MicMute LED state changed by muted/unmute switch */
>>          if (mc->invert) {
>>                  if (ucontrol->value.integer.value[0] || ucontrol-
>>> value.integer.value[1]) {
>>                          rt715->micmute_led = LED_OFF;
>> @@ -107,7 +106,6 @@ static int rt715_set_amp_gain_put(struct snd_kcontrol
>> *kcontrol,
>>                  }
>>                  ledtrig_audio_set(LED_AUDIO_MICMUTE, rt715->micmute_led);
>>          }
>> -#endif
> 
> I'm not sure which thread, but I believe there was still also another suggestion
> that this should be made more "generic" and to work for all codecs.  So that when
> we have lets say a hypothetical rt717 we don't need the same in that module.

Right:


On 1/15/21 6:45 PM, Jaroslav Kysela wrote:
> Dne 12. 01. 21 v 18:18 Perry Yuan napsal(a):
> 
>> +#if IS_ENABLED(CONFIG_DELL_PRIVACY)
>> +	/* dell privacy LED trigger state changed by muted/unmute switch */
>> +	if (mc->invert) {
>> +		if (ucontrol->value.integer.value[0] || ucontrol->value.integer.value[1]) {
>> +			rt715->micmute_led = LED_OFF;
>> +		} else {
>> +			rt715->micmute_led = LED_ON;
>> +		}
>> +		ledtrig_audio_set(LED_AUDIO_MICMUTE, rt715->micmute_led);
>> +	}
>> +#endif
> 
> [removing lkml and x86-platform lists]
> 
> Looking to this code, perhaps, it may be a good idea to move the LED trigger
> handling from the low-level drivers and do it in the top-level control code
> (sound/core/control.c). Adding a new flag SNDRV_CTL_ELEM_ACCESS_MIC_LED may be
> an option and we can nicely handle the situation for multiple microphones (OR
> operation). The motivation is to remove the duplicated code.
> 
> The same situation is for the playback LED.

I believe that this is an excellent suggestion and that this is the way to go.

Regards,

Hans

