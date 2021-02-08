Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E125E31302C
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Feb 2021 12:10:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 686F51678;
	Mon,  8 Feb 2021 12:09:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 686F51678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612782636;
	bh=rzL2QMMgOLn8NOAXZnc1nlk5U1uxGK1nRzkXdu1mCy0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NJmuMZd9F9z5io5hzk9wDzBeI6ORd+XlLIzQN1KDqU85POQH0krAszFCJ+obznmio
	 50lwAiu86rJTQb5IiAP2t/Cs36ETlAWx5cKAxRgpHRbae7pnxEunlVGhO1YrWpxWL1
	 aqtgmwzZP+8INADd6xz6egFEgpp/ZlTPaC+v6ky4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3AD1F8022D;
	Mon,  8 Feb 2021 12:09:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27C96F80169; Mon,  8 Feb 2021 12:09:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0C7EF80114
 for <alsa-devel@alsa-project.org>; Mon,  8 Feb 2021 12:08:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0C7EF80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="E4zt1elf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612782536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8quz8MBuaFB1o0eDBLIyga0pmpD2KOnHz+NV8/Rx3/s=;
 b=E4zt1elfGmGM7nWBV3N4qgNSkNVjPwXNaVSMRUyqHRsfrPRbW9OhBl0QNlLF/4z74deEiP
 f7CI7dqNv21nAF2QJYiq0i1ymMF8iJ0+NXoO6hpu+/IIKBIJAkKCsIUcWloSKy8UYsaIc8
 wNf8OClIsgsz+kTPoH+Lxcmgd6VayKk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-n7VwpSAiMdCjY4zN7bp53A-1; Mon, 08 Feb 2021 06:08:55 -0500
X-MC-Unique: n7VwpSAiMdCjY4zN7bp53A-1
Received: by mail-ed1-f69.google.com with SMTP id bo11so13053708edb.0
 for <alsa-devel@alsa-project.org>; Mon, 08 Feb 2021 03:08:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8quz8MBuaFB1o0eDBLIyga0pmpD2KOnHz+NV8/Rx3/s=;
 b=cGReXcJ4Q7zlMw7E6GRUhWbwZ0Hx2VIEbrjBhTiEniAGs9TYjps5s+KTlLUcrl6LdV
 sif4wu8wLNHoVjkAqg6BwGvgegD8BLZRyzMhO9nXa9GQUegGzGZf9F3AUOgyfObXBlir
 vHwLjCFbhmjAYoaGboKbD/6khJOV22Yc2KtvQUKZQJcxk9gjscrUjmh7fZqJIxdmvIzX
 s9wP+1x4WQPlAw/xJ0w7eO+nkbrbuTXE+WbszIw7KEoryJvoMEhkWyXGHb/qESwoOVkr
 +E1BAQKHnb7yvIcJ1EpWZIXVoJPr71YaRtPcNeRapAHd7Z1iOWDs5eCgVkhhNoHFeuDR
 YRyQ==
X-Gm-Message-State: AOAM533cPVUMixU01WngumoyaWYqd6Mgy9xD/cxO5ShMeWjtBHa7y37p
 bzSCq4hCRq5xkdbZ2XsaxPT+0ZIcTdqT5NGTdpyGPDGoFdN2XABMqE/qvqe45W7ov7W89K/7bOr
 najgL35FZMg+uXsmPuLAPj6Umuu0pM7UhqbR9xi0sflvIiib/XbDz1ODaEAIx1+lyvYd19l3ytK
 w=
X-Received: by 2002:a05:6402:617:: with SMTP id
 n23mr16848555edv.257.1612782533872; 
 Mon, 08 Feb 2021 03:08:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzuxuv7HmbJw0UGM4xEsbdLsOmJranhVY77T3ncLswVu++Q+Jwkfqb7Skw8sf4QaH57rH7k5g==
X-Received: by 2002:a05:6402:617:: with SMTP id
 n23mr16848526edv.257.1612782533565; 
 Mon, 08 Feb 2021 03:08:53 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id b25sm7694324ejz.100.2021.02.08.03.08.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 03:08:53 -0800 (PST)
Subject: Re: [PATCH 1/2] ALSA: hda: intel-dsp-config: Add FLAG_BYT_FIRST /
 _SECOND defines
To: Takashi Iwai <tiwai@suse.de>
References: <20210208093800.62099-1-hdegoede@redhat.com>
 <s5ha6sezxil.wl-tiwai@suse.de>
 <5d6241f2-8df2-8de2-b437-804566e62e25@redhat.com>
 <s5hy2fyyg96.wl-tiwai@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <8ff7b215-42ea-8332-7373-bc5ce346092b@redhat.com>
Date: Mon, 8 Feb 2021 12:08:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <s5hy2fyyg96.wl-tiwai@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
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

On 2/8/21 12:02 PM, Takashi Iwai wrote:
> On Mon, 08 Feb 2021 11:24:53 +0100,
> Hans de Goede wrote:
>>
>> Hi,
>>
>> On 2/8/21 11:04 AM, Takashi Iwai wrote:
>>> On Mon, 08 Feb 2021 10:37:59 +0100,
>>> Hans de Goede wrote:
>>>>
>>>> Instead of hardcording the SST driver having the highest prio, add
>>>> FLAG_BYT_FIRST and FLAG_BYT_SECOND defines, which get set like this
>>>> when both drivers are enabled:
>>>>
>>>> 	#define FLAG_BYT_FIRST               FLAG_SST
>>>> 	#define FLAG_BYT_SECOND              FLAG_SOF
>>>>
>>>> And when only 1 driver is enabled then FLAG_BYT_FIRST gets set to
>>>> the flag for that driver.
>>>>
>>>> This is a preparation patch for making which driver is preferred
>>>> configurable through Kconfig.
>>>>
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>
>>> I find the idea is fine, but the ifdef conditions become too complex
>>> after this change.  It took minutes to check whether the ifdef changes
>>> are really correct for me :)
>>
>> I understand but...
>>
>>> So, it'd be appreciated if this can be re-designed and simplified...
>>
>> This was actually the cleanest which I could come up with, well maybe not the
>> cleanest, but the most "do not repeat yourself" option.
>>
>> The alternative would be something like this:
>>
>> static const struct config_entry acpi_config_table[] = {
>> /* BayTrail */
>> #ifdef CONFIG_SND_INTEL_BYT_PREFER_SOF /* implies both drivers are enabled */
>>         {
>>                 .flags = FLAG_SOF,
>>                 .acpi_hid = "80860F28",
>>         },
>>         {
>>                 .flags = FLAG_SST,
>>                 .acpi_hid = "80860F28",
>>         },
>> #else
>> #if IS_ENABLED(CONFIG_SND_SST_ATOM_HIFI2_PLATFORM_ACPI)
>>         {
>>                 .flags = FLAG_SST,
>>                 .acpi_hid = "80860F28",
>>         },
>> #endif
>> #if IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL
>>         {
>>                 .flags = FLAG_SOF,
>>                 .acpi_hid = "80860F28",
>>         },
>> #endif
>> #endif
>>
>> With the same thing repeating for the Cherry Trail case, now that
>> I actually have written this out I guess it is not too bad, but it
>> does mean repeating all the BYT/CHT entries once, visually
>> leading to 4 extra entries (but the #ifdef #else #endif
>> will always include only 2/4 for each of BYT and CHT.
>>
>> If you like this better I can do a v2 with this approach, that
>> would also reduce the set to a single patch.
> 
> If I understand correctly, we don't need to have two entries since the
> first matching always wins.

Yes that is true,

> So it could be something like below?

> --- a/sound/hda/intel-dsp-config.c
> +++ b/sound/hda/intel-dsp-config.c
> @@ -26,6 +26,12 @@ MODULE_PARM_DESC(dsp_driver, "Force the DSP driver for Intel DSP (0=auto, 1=lega
>  #define FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE (FLAG_SOF_ONLY_IF_DMIC | \
>  					    FLAG_SOF_ONLY_IF_SOUNDWIRE)
>  
> +#if IS_ENABLED(CONFIG_SND_SOC_PREFER_SOF_BAYTRAIL)

This condition would need to be changed to:

#if IS_ENABLED(CONFIG_SND_SOC_PREFER_SOF_BAYTRAIL) || !IS_ENABLED(CONFIG_SND_SST_ATOM_HIFI2_PLATFORM_ACPI)

In case only the SOF driver is enabled.

With that changed I believe that your suggestion should work.

Shall I prepare a new patch going this route ?

Regards,

Hans



> +#define FLAG_SST_OR_SOF_BYT		FLAG_SOF
> +#else
> +#define FLAG_SST_OR_SOF_BYT		FLAG_SST
> +#endif
> +
>  struct config_entry {
>  	u32 flags;
>  	u16 device;
> @@ -459,28 +465,18 @@ EXPORT_SYMBOL_GPL(snd_intel_dsp_driver_probe);
>   */
>  static const struct config_entry acpi_config_table[] = {
>  /* BayTrail */
> -#if IS_ENABLED(CONFIG_SND_SST_ATOM_HIFI2_PLATFORM_ACPI)
> +#if IS_ENABLED(CONFIG_SND_SST_ATOM_HIFI2_PLATFORM_ACPI) || \
> +    IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
>  	{
> -		.flags = FLAG_SST,
> -		.acpi_hid = "80860F28",
> -	},
> -#endif
> -#if IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
> -	{
> -		.flags = FLAG_SOF,
> +		.flags = FLAG_SST_OR_SOF_BYT,
>  		.acpi_hid = "80860F28",
>  	},
>  #endif
>  /* CherryTrail */
> -#if IS_ENABLED(CONFIG_SND_SST_ATOM_HIFI2_PLATFORM_ACPI)
> +#if IS_ENABLED(CONFIG_SND_SST_ATOM_HIFI2_PLATFORM_ACPI) || \
> +    IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
>  	{
> -		.flags = FLAG_SST,
> -		.acpi_hid = "808622A8",
> -	},
> -#endif
> -#if IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
> -	{
> -		.flags = FLAG_SOF,
> +		.flags = FLAG_SST_OR_SOF_BYT,
>  		.acpi_hid = "808622A8",
>  	},
>  #endif
> 
> 
> 
>>
>> Regards,
>>
>> Hans
>>
>>
>>
> 

