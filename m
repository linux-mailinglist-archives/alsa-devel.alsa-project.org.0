Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3A5390B0F
	for <lists+alsa-devel@lfdr.de>; Tue, 25 May 2021 23:10:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EF681777;
	Tue, 25 May 2021 23:09:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EF681777
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621977043;
	bh=L0nq71KKQE3H7/B84Rcld+E6zz/GjpXpLGeFD0HQmuw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HbBsdbcgAx8teFVj4MXrnwxhyO+L3qpP1Hv8ndyxUQoDOploNg2v/Gypjf68GSajD
	 cEkBX59VxaODiRAtC9B3N4yuJAD+V8ooxRhIskVLONrrvpfRuYUSdkcXPRQFZH20Ns
	 4GbbX52ZtWw8sUnyKwsuF81LITMIwHpeMTKTep/Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CDA6F800B6;
	Tue, 25 May 2021 23:09:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0785F800CB; Tue, 25 May 2021 23:09:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35E56F800AC
 for <alsa-devel@alsa-project.org>; Tue, 25 May 2021 23:09:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35E56F800AC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="EDoW110K"
Received: by mail-lj1-x22a.google.com with SMTP id 131so40011741ljj.3
 for <alsa-devel@alsa-project.org>; Tue, 25 May 2021 14:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZD+vlbnCmCd0+YdhT3Kf05pgMEL8yn/TGh5XC3e9yC4=;
 b=EDoW110KV9wcfQ30kqQ1ZybqTTE/mSj56bdcleLHZ9K1K65hsPrg9IrsZJ6lqu84SD
 RuaswPbLyuqVCWQ0oyQgm36Uwfqs9e5USUOw4l22hAuVIBSi0CxekIhx1On8J1Hu+9gv
 ZF/G3WukVhsQGoQEbSwWKl3XJU0aQWLmoFLDB9+NMilvdBo/Qey7m+ScBsh60Vs9X/G7
 tfb5FLBY2sQ88qOQom7PT3Kg3cN7B+TXWhT2uw9rcBT1brIlb6UFMfndAakABXqJf3k7
 tLK3gwnMhy1IclNyskN3N65WqXKwIJcrHn7YXSf4BCWEbttcrpt+SDK+SbYFSu7o0Doj
 XGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZD+vlbnCmCd0+YdhT3Kf05pgMEL8yn/TGh5XC3e9yC4=;
 b=MTsvQFVwn8FYyEgGLvpI/2yLtaQPva8pfIKG2pmhumKuOmRt8i9kQ9xxKGuYYEeODV
 +14iEGX+Ytqz5AK0xNIMIviNR4O6Tgu5QLGihE3YVSUpmnOAKilWoVF5+h1mvaFj43Ov
 C+gGvOIK5gjM5BaxPu9hMl7tTwuuVv5Ho8WkZSYPcvesrEU0CcdjvV35fmWZ1HBAs4Ut
 a8yVxk8im6WXezdS7mKfeFKmZ+yuAFOMnV/3mIt0OMI9dxYJxhppRhvDGBTzj3qaoOkX
 BEJQJv2D9ZSqyyR0fRZewG9NsJ3XrBLf1+GbrOoPJzfMkVhy53nMaHW8Q14oIfPupyVU
 KfZg==
X-Gm-Message-State: AOAM531NuBmmusNv5DRxrY2JMqzngKhaBzpx0UgJXx3EggsRP3w6C13x
 06PQ/sgdUuI5yg6/fdlowJjo7+9qNMQ=
X-Google-Smtp-Source: ABdhPJw6PtppkMwP73a5yk5EfcfAd6aWAG1Me5VORks/eZaK+4hqHBA3sKD4WyW5pJwPIO0LUKzKEA==
X-Received: by 2002:a2e:5045:: with SMTP id v5mr22264105ljd.270.1621976948326; 
 Tue, 25 May 2021 14:09:08 -0700 (PDT)
Received: from [192.168.2.145] (46-138-180-236.dynamic.spd-mgts.ru.
 [46.138.180.236])
 by smtp.googlemail.com with ESMTPSA id w3sm2207406lji.25.2021.05.25.14.09.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 14:09:07 -0700 (PDT)
Subject: Re: [PATCH v3 4/4] ASoC: tegra: Specify components string for Nexus 7
To: Jaroslav Kysela <perex@perex.cz>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Ion Agorria <ion@agorria.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>
References: <20210523234437.25077-1-digetx@gmail.com>
 <20210523234437.25077-5-digetx@gmail.com>
 <ec2098e0-7918-8488-cf7c-a07e5aa6908c@perex.cz>
 <99ef3d77-c626-c632-bbd2-92eb15acad20@gmail.com>
 <bc99da2b-1eb2-8f73-9e92-184cf172ef6f@perex.cz>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ea7730f6-9ca0-ae06-b610-703f9715ffa2@gmail.com>
Date: Wed, 26 May 2021 00:09:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <bc99da2b-1eb2-8f73-9e92-184cf172ef6f@perex.cz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

25.05.2021 19:24, Jaroslav Kysela пишет:
> On 24. 05. 21 16:00, Dmitry Osipenko wrote:
>> 24.05.2021 13:54, Jaroslav Kysela пишет:
>>> Dne 24. 05. 21 v 1:44 Dmitry Osipenko napsal(a):
>>>> Specify components string for Nexus 7 using the Intel BayTrail components
>>>> format. This may allow us to create a more generic UCM for RT5640 codec.
>>>>
>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>> ---
>>>>  sound/soc/tegra/tegra_asoc_machine.c | 19 +++++++++++++++++++
>>>>  1 file changed, 19 insertions(+)
>>>>
>>>> diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
>>>> index a81f2ebfc00c..87e0a47040a5 100644
>>>> --- a/sound/soc/tegra/tegra_asoc_machine.c
>>>> +++ b/sound/soc/tegra/tegra_asoc_machine.c
>>>> @@ -671,6 +671,24 @@ static const struct tegra_asoc_data tegra_rt5640_data = {
>>>>  	.add_hp_jack = true,
>>>>  };
>>>>  
>>>> +/*
>>>> + * Speaker: Connected to SPO L/R P/N pins, stereo.
>>>> + * Internal Microphone: Digital, connected to DMIC1_DAT IN2P/N pins.
>>>> + * Headphones: Connected to HPOL/R pins.
>>>> + * Headset Microphone: Unconnected.
>>>> + *
>>>> + * IF2_DAC/ADC are unpopulated.
>>>> + */
>>>> +static const struct tegra_asoc_data tegra_rt5640_grouper_data = {
>>>> +	.components = "codec:rt5640 cfg-spk:2 cfg-mic:dmic1 aif:1",
>>>
>>> Perhaps, it may be better to handle this string via the DT config (create new
>>> function like snd_soc_of_parse_card_name()).
>>>
>>> The "codec:rt5640" should be set in the driver (it's fixed), but the
>>> "cfg-spk:2 cfg-mic:dmic1 aif:1" part is suitable for the DT config.
>>
>> Not sure that this is possible. The DT is an ABI, while components
>> string has no specification. Any changes to the components string will
>> require DT update.
>>
>> I think it's much more feasible to have a database of components within
>> kernel driver, like Intel sound driver does it for ACPI devices.
> 
> There is no other possibility for ACPI. And while the components string is
> part of the ALSA ABI, it should not be changed in an incompatible way. Only
> new information should be added. The DT solution seems more flexible to me.
> For example the stereo/mono speaker or the AIF number can be set without the
> driver modification for rt5640.

Everything that goes into device-tree needs a firm specification. We
can't add it into device-tree since there is no specification for the
components string other than something that Intel driver made up for its
own needs. So either we could add the components string to the kernel
driver right now or not add it.

I think the best option would be to drop this patch for now.
