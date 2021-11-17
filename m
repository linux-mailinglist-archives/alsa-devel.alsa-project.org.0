Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5320B454AEF
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Nov 2021 17:28:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E35BD1928;
	Wed, 17 Nov 2021 17:27:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E35BD1928
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637166496;
	bh=16aen1s1U8umdKfU+BSzeyvUMqnGuPi+iLr/sHWyQWs=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RMkbLd6Q+mtPEqE0iz5lRcwN05Hia1tep1o7ndLO63LCwA+QG6o+ewqqUqoNCbqjH
	 I1HnrcRxDs6HGyj15batoXj7TVk/0ng3cwW10565qYaclxu2FpuP+YRZ8vNqyJMZKA
	 rX3u1JIfMgs51H+zuT3qRGcaL91kqbeV8Lva9nZk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7266DF8028B;
	Wed, 17 Nov 2021 17:26:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B222AF8027D; Wed, 17 Nov 2021 17:26:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5693CF8016C
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 17:26:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5693CF8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="eSSGNuf3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637166400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wTZPhJ0hwXFD3+Bb6O33JZP3U0Kr3oAirCvwdIgNQrc=;
 b=eSSGNuf3pxmjwlttn7jYrJloOt6wSfLnzAdJghS6x7Bqz4lqvwmOHCoT9XwGE6J4spTZau
 Kq0fLjjRlrj/y5wjh6ubRzynm7466c6hY5FowcYSO+vsrrN1Ky95C+aWVsrjBzzx/GP/ZJ
 pZzkt3K6w6dzOIVoQWXfkl3kF/+gfcQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-33-h9QtqAuOMiOiGJqBvCkpfA-1; Wed, 17 Nov 2021 11:26:39 -0500
X-MC-Unique: h9QtqAuOMiOiGJqBvCkpfA-1
Received: by mail-ed1-f69.google.com with SMTP id
 a3-20020a05640213c300b003e7d12bb925so2633094edx.9
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 08:26:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wTZPhJ0hwXFD3+Bb6O33JZP3U0Kr3oAirCvwdIgNQrc=;
 b=n8dTySPJb0IaBGhgvaWkkHc3fNGlC8Re408ShFci19Es1gLM3Vq3SuMkrJmNTwIZM0
 lv26iA2TmZFZSXs53SQHodfHwa2uQGUDFqgl7crEH/LLv4N/ZA8TLHH8CMl84Y5VjiC4
 9PCecAnqhHPNtiiXx1kyJmjs3r3WRpXF6wkxRBZPpNTl5h4/Jfp97NpZpdDQ81I1vVnb
 5mUi4WyRfgD6iyzNopT4MizbLE6Mphu/BcUJ3nUCMLG+h5PtVlDeW38TYd67IYTJq7bT
 3XJybxfZ6GSprukUV4127YPjl9T/hRPNqG7vCcCc/S/daucUqiNU681NXteQIhaaSYYu
 NVoQ==
X-Gm-Message-State: AOAM533GAX+p0ZAztuF+WmuYsSd0aTU9O9mYHwTN9bbvmIqHQ+g7ZTFX
 9105z8YaBrM33JBNV97ARY0riLklyl+75IcLKbutoJh2UjOu9w3/oivKgFFkSmdQ2nAJ78Yz1H3
 Pzd5S49U9ne1HZALRK/ZhZPY=
X-Received: by 2002:a17:906:f44:: with SMTP id
 h4mr24604602ejj.113.1637166397927; 
 Wed, 17 Nov 2021 08:26:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyThA6L35y7bB5EooatVwrdjPjOEu3kxW9N4TuMCZ8cH3FDqz66Yoa2jSgIh00cS4Kc5I6zmA==
X-Received: by 2002:a17:906:f44:: with SMTP id
 h4mr24604556ejj.113.1637166397702; 
 Wed, 17 Nov 2021 08:26:37 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214?
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id ho30sm186880ejc.30.2021.11.17.08.26.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 08:26:37 -0800 (PST)
Message-ID: <235ed35d-fd0d-cb4c-29ff-9a269ba63f7a@redhat.com>
Date: Wed, 17 Nov 2021 17:26:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 5.16 regression fix 2/2] ASoC: Intel: soc-acpi-cht: Revert
 shrink tables using compatible IDs
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
References: <20211117151022.122286-1-hdegoede@redhat.com>
 <20211117151022.122286-2-hdegoede@redhat.com>
 <f6b445bf-3444-ed7f-b31a-d71dd0599927@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <f6b445bf-3444-ed7f-b31a-d71dd0599927@linux.intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Brent Lu <brent.lu@intel.com>
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

On 11/17/21 16:54, Pierre-Louis Bossart wrote:
> 
> 
> On 11/17/21 9:10 AM, Hans de Goede wrote:
>> Commit 959ae8215a9e ("ASoC: Intel: soc-acpi-cht: shrink tables using
>> compatible IDs") simplified the match tables in soc-acpi-intel-cht-match.c
>> by merging identical entries using the new .comp_ids snd_soc_acpi_mach
>> field to point a single entry to multiple ACPI HIDs and clearing the
>> previously unique per entry .id field.
>>
>> But various machine drivers from sound/soc/intel/boards rely on mach->id
>> in one or more ways. For example all of the following machine-drivers
>> for entries combined during the shrinking:
>> sound/soc/intel/boards/bytcr_rt5640.c
>> sound/soc/intel/boards/cht_bsw_rt5645.c
>> sound/soc/intel/boards/bytcht_da7213.c
>>
>> Do:
>> 	adev = acpi_dev_get_first_match_dev(mach->id, NULL, -1);
>>
>> Which now no longer works and some of them also do:
>>
>> 	pkg_found = snd_soc_acpi_find_package_from_hid(mach->id, ...
>>
>> 	if (!strncmp(snd_soc_cards[i].codec_id, mach->id, 8)) { ...
>>
>> Which now also no longer works. All these calls need to be fixed before
>> we can shrink the tables, so revert this change for now.
>>
>> Fixes: 959ae8215a9e ("ASoC: Intel: soc-acpi-cht: shrink tables using compatible IDs")
>> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> Cc: Brent Lu <brent.lu@intel.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> Thanks for the patch, it's embarrassing. I must have tested the wrong
> code or the wrong device...

No worries, we all make mistakes.

> Could we alternatively keep these tables and just copy the information
> using something like this (compile-tested only)

Interesting I was thinking along these lines myself as an
alternate fix, but I expected all the struct snd_soc_acpi_mach
declarations, e.g. the snd_soc_acpi_intel_baytrail_machines
array, to be const.

But I see now that these are not const, at least not for byt + cht.

So yes this should work and seems a bit nicer fix then
reverting.

I'll give this a test run when I'm done fixing some other
5.16 regressions I'm working on ...

Regards,

Hans



> 
> diff --git a/include/sound/soc-acpi.h b/include/sound/soc-acpi.h
> index 31f4c4f9aeea..ac0893df9c76 100644
> --- a/include/sound/soc-acpi.h
> +++ b/include/sound/soc-acpi.h
> @@ -147,7 +147,7 @@ struct snd_soc_acpi_link_adr {
>   */
>  /* Descriptor for SST ASoC machine driver */
>  struct snd_soc_acpi_mach {
> -       const u8 id[ACPI_ID_LEN];
> +       u8 id[ACPI_ID_LEN];
>         const struct snd_soc_acpi_codecs *comp_ids;
>         const u32 link_mask;
>         const struct snd_soc_acpi_link_adr *links;
> diff --git a/sound/soc/soc-acpi.c b/sound/soc/soc-acpi.c
> index 2ae99b49d3f5..6b9dfa0608a3 100644
> --- a/sound/soc/soc-acpi.c
> +++ b/sound/soc/soc-acpi.c
> @@ -20,8 +20,10 @@ static bool snd_soc_acpi_id_present(struct
> snd_soc_acpi_mach *machine)
> 
>         if (comp_ids) {
>                 for (i = 0; i < comp_ids->num_codecs; i++) {
> -                       if (acpi_dev_present(comp_ids->codecs[i], NULL, -1))
> +                       if (acpi_dev_present(comp_ids->codecs[i], NULL,
> -1)) {
> +                               strncpy(machine->id,
> comp_ids->codecs[i], ACPI_ID_LEN);
>                                 return true;
> +                       }
>                 }
>         }
> 

