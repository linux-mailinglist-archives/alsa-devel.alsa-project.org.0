Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 303DD38E7E1
	for <lists+alsa-devel@lfdr.de>; Mon, 24 May 2021 15:42:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F26684C;
	Mon, 24 May 2021 15:41:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F26684C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621863731;
	bh=GnGjaOv0zTekwrTDxKz3PC+hcebjrj+P+E/Yg0UQaAY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jaojp7HuPTH/FlPzfJ03HcXeBnN8pZuwE3Mf+UCLrwYBaPcFZ8RZBncUz/bz1iDJk
	 OVIXFiAiSC0OBMQesQrUd24ThaE1VZp6TmhUgbmznuOWtVP0h1HQT+kpTriiTGHgE3
	 mLrxq2PhIVWjITt/LeLg1Ix+v0pomEWjeGqy6C1k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24BAAF8022D;
	Mon, 24 May 2021 15:40:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92485F8022D; Mon, 24 May 2021 15:40:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1AE9F80137
 for <alsa-devel@alsa-project.org>; Mon, 24 May 2021 15:40:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1AE9F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qu+hXeFu"
Received: by mail-lj1-x232.google.com with SMTP id e2so27305291ljk.4
 for <alsa-devel@alsa-project.org>; Mon, 24 May 2021 06:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+9LDxds78ZpBu8bZ2YStDaoNow/+xEuqsaqJfEUvzSs=;
 b=qu+hXeFuBGul/Wj3lSSso0pa0MhS9lqMA8CmDT6sB9XlIbhj+tB0N+7fUwaWqxVvEb
 t2XuhasWUa6of9i/F93O8IFlWMTmF1fyWQg/xbozp6wMpWPEelbV7SqrcX0/yrK8u21L
 NS8MtIWVaUGmVmBvXH+tuzqLz9dsY2/iRF0Y6NCOWsoKanKrhcT4Thik9efLJzOExrM1
 ToS3oO4dJ7apJrn5s+ZlFEPLH8bc6d80sLIf9g62Wc1huqAPu1+XktJVxY1MY/qK4qnk
 6Cvgl8f3piNBc5MD17ZePmaqWLV60+t3xdj/omYmTDtGmry4AIhgl4zR/s+HGIwP/dEr
 7t0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+9LDxds78ZpBu8bZ2YStDaoNow/+xEuqsaqJfEUvzSs=;
 b=d04MuKbGxLwIduOMZItKm0NL2vfbAIT11rWsUXzwHR7oJFm+Cp58Ww/5OakKYyRUku
 i9c3oximGCknmTv4MkVnuVWWnN7Bir6Ifc9lTKQxS1cv/7U9OXFezM4sDu3HUr/L4OFw
 uwjDkN0k8TA6wuCGlt5a+IIdjG4PnMjSroY+d1JLzWH4/sou+eKKwFxLr0A5ILS7JzoD
 ORxnoI/5JgG4K6qH2QZ+5mJ0CNiJ0PC9UmmmyyBwboILJWrfv/J5FwOmQtcaWPKAACcz
 o9IpfG1ELlyas5Xd9w+hU6u1lRRaQq3fwegPYdQDRyjrL/GNWZpkOCRmxc7ZQ3Wrik6e
 uLxg==
X-Gm-Message-State: AOAM5333RppzLLmfFIYN09Kc8Y13+DmMNm1ggoa3AlGcXSUvZiYZy4UY
 KbBatTecS4EyRLoehID1xnw=
X-Google-Smtp-Source: ABdhPJz19QS4VATXDdLjkED1I3EhP/WMd2gSaZB1z7bN/6gA9RCnGUzDhmUQrvWEMhAsQt89FnoWGg==
X-Received: by 2002:a2e:a553:: with SMTP id e19mr16915323ljn.280.1621863631965; 
 Mon, 24 May 2021 06:40:31 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-110.dynamic.spd-mgts.ru.
 [109.252.193.110])
 by smtp.googlemail.com with ESMTPSA id w17sm203610lfp.300.2021.05.24.06.40.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 06:40:31 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] ASoC: tegra: Unify ASoC machine drivers
To: Jon Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Ion Agorria <ion@agorria.com>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>
References: <20210520175054.28308-1-digetx@gmail.com>
 <20210520175054.28308-3-digetx@gmail.com>
 <32171079-ed4e-1147-2272-5f11bc480c6a@nvidia.com>
 <91e53907-d87d-aeeb-4644-3926d4311daa@gmail.com>
 <6bc26992-e136-ef6a-a956-382b5cae5db7@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f9631faa-5fc8-ecdd-709b-93b58e45a1ac@gmail.com>
Date: Mon, 24 May 2021 16:40:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <6bc26992-e136-ef6a-a956-382b5cae5db7@nvidia.com>
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

24.05.2021 15:22, Jon Hunter пишет:
> 
> 
> On 21/05/2021 20:05, Dmitry Osipenko wrote:
> 
> ...
> 
>>>> +unsigned int tegra_asoc_machine_mclk_rate(unsigned int srate)
>>>> +{
>>>> +	unsigned int mclk;
>>>> +
>>>> +	switch (srate) {
>>>> +	case 64000:
>>>> +	case 88200:
>>>> +	case 96000:
>>>> +		mclk = 128 * srate;
>>>> +		break;
>>>> +	default:
>>>> +		mclk = 256 * srate;
>>>> +		break;
>>>> +	}
>>>> +	/* FIXME: Codec only requires >= 3MHz if OSR==0 */
>>>> +	while (mclk < 6000000)
>>>> +		mclk *= 2;
>>>
>>> So this appears to be specific to the wm8903 codec or at least this is
>>> where it came from. And given that the switch statement is not complete
>>> in terms of the sample rates (ie. only has a subset), I am wondering if
>>> set should keep this specific to the wm8903 codec?
>>
>> The RT5631 codec of Asus Transformers will re-use this function.
> 
> OK, but does it need this FIXME part? That appears to be codec specific.

Downstream RT5631 Tegra driver has exactly the same FIXME.

Although, I now see that downstream RT5631 uses 384*srate for the
default cases.

I also see that WM8994 driver that we have in grate-kernel for Galaxy
Tab and SGH-I927 also re-uses that mclk_rate function.

>> IIUC, the default switch-case works properly for all rates below 64KHz,
>> at least I haven't had any problems with it. Could you please clarify
>> why you are saying that the switch statement appears to be incomplete?
> 
> It looks a bit weird because less than 64kHz and greater than 96kHz we
> use 256 and for only 64kHz, 88.2kHz and 96kHz we use 128. So it is not
> clear to me which sample rates have actually been tested with this and
> if this is complete or not?
> 
> Is it intended that we use 256 for sample rates greater than 96kHz?

The 128*srate gives MCLK >6MHZ for 64/88/96, 256*srate gives MCLK >6MHZ
for rates below 64kHZ. Looks like the goal is to get MCLK >6MHZ.

 The WM8903 datasheet says:

"The  following  operating  frequency  limits  must  be  observed  when
 configuring  CLK_SYS.  Failure  to  observe   these   limits   will
result   in   degraded  noise   performance   and/or   incorrect
ADC/DAC  functionality.

If DAC_OSR = 0 then CLK_SYS  3MHz
If DAC_OSR = 1 then CLK_SYS  6MHz"

Where DAC_OSR is DAC Oversampling Control
0 = Low power (normal oversample)
1 = High performance (double rate)

I see that DAC_OSR=0 by default, it can be switched to 1 by userspace
ALSA control.
