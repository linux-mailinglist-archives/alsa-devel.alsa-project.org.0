Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2DD7A94C4
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 15:27:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE72FDF6;
	Thu, 21 Sep 2023 15:26:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE72FDF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695302858;
	bh=55D5QCNyS6QyGNW80rGsqo1BdWdXaF4KP3IfIox9r64=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uqeOTrpgf2Q7pggu+AlehQh5rMGoofEnSoAcfgvJHBQuaRpzQfADOKzXPgxy5lp+O
	 5Q8i35MuAmecVU01EUBc3xhSe8VizY/SiGcBW537MNBSY8IglqqMSEWDu6oo46nnAD
	 5/CWQv8QcFycI+rwgSQ8/eVG9koWq4VYTPk+btms=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76C07F805A0; Thu, 21 Sep 2023 15:24:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BAEBAF80494;
	Thu, 21 Sep 2023 15:24:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA365F8025A; Thu, 21 Sep 2023 08:10:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 29FFBF80124
	for <alsa-devel@alsa-project.org>; Thu, 21 Sep 2023 08:10:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29FFBF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=T08WP1aT
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-404800222d2so1411145e9.0
        for <alsa-devel@alsa-project.org>;
 Wed, 20 Sep 2023 23:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695276611; x=1695881411;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lqILmRrkFisrRKmaW78QkaeJdw1v2LLslqXL7U2Qibs=;
        b=T08WP1aTON5O/OChW+8zKrsItbTUORz6MKwrurNAM0/KCQiOLpHyNmAGihhAvZ+GmS
         tUxsVmVtzUBQewcttBJDAH1tCc+d4/ztB7eN5jTMkApeBswWPwFkZNPHjO6QVjI4ke3F
         mgRUmA70KKcQUqB8lzHzdLRVhAFh76TOCuyhRIfnCzRNuB3xjMwj7VEjpptwEQ6yu6AC
         VqR0KRgIS3+GlX+M9wqzp1l8QHlrgkraY61uERyqvlSjb7kplGjUUJk6ynubu2okUFvP
         aIc9D/VE4wVnz+q8ItTz5rsQF7GljtNIpjIfBZ00y4HhA3TSrBGIR1d+tglWs9RPiX5Y
         VlDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695276611; x=1695881411;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lqILmRrkFisrRKmaW78QkaeJdw1v2LLslqXL7U2Qibs=;
        b=VF6BSDlZpXMMzFIM286vEu5U0LeyP7Csls3j0H+XNkjvMjzsB+DWioTTcS+W30l/vh
         HMfdMXBdFQrMcDZVMczHq1fC2ojGwPvfMLKgTXtPH4fc8lIPDL/KGr1EaKcES2BHZdGh
         ULIJbpN1bCBlGFnQl8HFs7Gqs86n06YlZV5Xf8haDLYjZSFH8NtUBwbZcV/CEC5XvCql
         yeC2FJaWov59ADfHCURFDLMlpR7ouuMPonNXTIyWI3VyUZGtiIsXgF1zT5gPmqKbKD39
         +UJIHry+2VFvsm7PcTd0t9DW9Ql7uT03Y+CDSpoBiWeKayHY2JmMt2SuDa7x1PpeLNL4
         wHzQ==
X-Gm-Message-State: AOJu0YyuZXbibFFA7XelxIMGd4vtM8JJQjjEgzszy6Clhn62X0fkEYBV
	Sy6i1BpgsXTKb4DOB/KZCdc=
X-Google-Smtp-Source: 
 AGHT+IF+oKDTsosZGaZ2uvEa7WyXJpyPAvqXNP8oaQypnhzCu6F2pFqji6uAa0WEyjJeWR0GnqpeNA==
X-Received: by 2002:a05:600c:3b82:b0:401:c717:ec69 with SMTP id
 n2-20020a05600c3b8200b00401c717ec69mr4204678wms.4.1695276610627;
        Wed, 20 Sep 2023 23:10:10 -0700 (PDT)
Received: from [10.0.0.26] ([178.160.241.68])
        by smtp.gmail.com with ESMTPSA id
 h4-20020a056000000400b0031aef72a021sm748255wrx.86.2023.09.20.23.10.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Sep 2023 23:10:10 -0700 (PDT)
Message-ID: <285260c6-b9ff-b5f5-4e98-03ab4d6514c9@gmail.com>
Date: Thu, 21 Sep 2023 10:10:08 +0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 2/2] ALSA: Add new driver for MARIAN M2 sound card
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, corbet@lwn.net,
 alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 skhan@linuxfoundation.org
References: <20230920151610.113880-1-ivan.orlov0322@gmail.com>
 <20230920151610.113880-2-ivan.orlov0322@gmail.com>
 <87edisvny4.wl-tiwai@suse.de>
Content-Language: en-US
From: Ivan Orlov <ivan.orlov0322@gmail.com>
In-Reply-To: <87edisvny4.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: ivan.orlov0322@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 74VVZDYLXBPICTRHFA744QS2AW7KPEYA
X-Message-ID-Hash: 74VVZDYLXBPICTRHFA744QS2AW7KPEYA
X-Mailman-Approved-At: Thu, 21 Sep 2023 13:24:00 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/74VVZDYLXBPICTRHFA744QS2AW7KPEYA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 9/20/23 19:55, Takashi Iwai wrote:
>> +	spin_lock(&marian->reglock);
>> +	marian_generic_set_dco(marian, ucontrol->value.integer.value[0]);
>> +	spin_unlock(&marian->reglock);
> 
> The control get/put callbacks can sleep, hence usually it's
> spin_lock_irq().  Or if the all places for this lock are sleepable
> context, use a mutex instead.
> 

Alright, it looks like reglock is used in sleepable context only, so 
I'll replace it with mutex. Thanks!

>> +static int marian_control_pcm_loopback_info(struct snd_kcontrol *kcontrol,
>> +					    struct snd_ctl_elem_info *uinfo)
>> +{
>> +	uinfo->type = SNDRV_CTL_ELEM_TYPE_BOOLEAN;
>> +	uinfo->count = 1;
>> +	uinfo->value.integer.min = 0;
>> +	uinfo->value.integer.max = 1;
>> +
>> +	return 0;
> 
> This can be replaced with snd_ctl_boolean_mono_info.
> 
>

Oh, I forgot to use 'snd_ctl_boolean_mono_info' here. Will be done.

>> +}
>> +
>> +static int marian_control_pcm_loopback_get(struct snd_kcontrol *kcontrol,
>> +					   struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct marian_card *marian = snd_kcontrol_chip(kcontrol);
>> +
>> +	ucontrol->value.integer.value[0] = marian->loopback;
>> +
>> +	return 0;
>> +}
>> +
>> +static int marian_control_pcm_loopback_put(struct snd_kcontrol *kcontrol,
>> +					   struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct marian_card *marian = snd_kcontrol_chip(kcontrol);
>> +
>> +	marian->loopback = ucontrol->value.integer.value[0];
> 
> Better to normalize with !!ucontrol->value.integer.value[0].
> The value check isn't done as default.
> 
Will be fixed, thanks!

>> +static int marian_control_pcm_loopback_create(struct marian_card *marian)
>> +{
>> +	struct snd_kcontrol_new c = {
>> +		.iface = SNDRV_CTL_ELEM_IFACE_PCM,
>> +		.name = "Loopback",
> 
> Better to have "Switch" suffix.
>

Yeah, and I guess some other controls also have to be renamed. Will be 
done :)

>> +static int marian_m2_output_frame_mode_create(struct marian_card *marian, char *label, u32 idx)
>> +{
>> +	struct snd_kcontrol_new c = {
>> +		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
>> +		.name = label,
>> +		.private_value = idx,
>> +		.access = SNDRV_CTL_ELEM_ACCESS_READWRITE | SNDRV_CTL_ELEM_ACCESS_VOLATILE,
> 
> Does this have to be VOLATILE?  Some others look also dubious.
> Basically you set the value via this mixer element, then it's
> persistent.
>

As I understand, some controls which depend on external inputs (like the 
'Input 1 Freq', which measures frequency on the Input 1), should be 
volatile, right?

This one definitely shouldn't, so I will change it to persistent.

Thank you for your prompt reply and review!

--
Kind regards,
Ivan Orlov

> 
> thanks,
> 
> Takashi

