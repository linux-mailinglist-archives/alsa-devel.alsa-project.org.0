Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CA5952A6D
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2024 10:27:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 044C52BDC;
	Thu, 15 Aug 2024 10:27:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 044C52BDC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723710457;
	bh=Z8Bptl+71weUnjMsyHX2MTnzwIckzoc5DzXu0D3tp6Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rTPVfATh5AZIxKi+SsQVQYux+7MhCrFSkqMezVlYUhnh23yo2rlaVbtrn4xRyE+xA
	 3EeS6E+5VWQtbTZN1o4bLdFNDJgrjgL5He4LB37qiku7xlZSHBQv1ZDrMc4YLS7jou
	 FtEOslPxSrw8mf982ncjtxVROE1jQ4/alDkLkxjE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9461DF8086C; Thu, 15 Aug 2024 10:24:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 730D7F8081A;
	Thu, 15 Aug 2024 10:24:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2CC3F802DB; Fri,  9 Aug 2024 21:32:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B5890F800BF
	for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2024 21:32:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5890F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=nPguiWfj
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-52efa16aad9so3163033e87.0
        for <alsa-devel@alsa-project.org>;
 Fri, 09 Aug 2024 12:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723231918; x=1723836718;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VITcg2JB4ebTYpwzqfOR5OkOphumGh3Os/L25Fs1FSk=;
        b=nPguiWfjGupn6KttNDqNC64ty9Xsttn1mhQyRCtESEv0l7d4cy7ZWDDB2r+W+KsdLC
         Sl5dRzpDFZHcbg3xh6MHd0WoikEVEFPzdxaJbDS5H56XVoEHAZIUdU3MWnn6arMZrP+J
         cK2hXjqFLoM6xsjiDmMnrjBIpTEU0jfUmG+/XeN1BDzY7b1g6ZVM88lYaW8FG5n+DJKF
         V7SdNgPih+N+7ibVUhv9L/EPpiPhjF+jNJ2um9q7Tk3Y3XUgKvp+nO8w3cQxCnVrRQYP
         7S1yh3t4gJd0oqN5gRCAumYCoC8Zn/t/NppFoj5VrkxagkgRPXlp0gQGnPXWP9TdG8QB
         9RTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723231918; x=1723836718;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VITcg2JB4ebTYpwzqfOR5OkOphumGh3Os/L25Fs1FSk=;
        b=VpA5Q3A+xpeQ0XFb6DzMly0ra1KmZPoIHTqu7bChEpNUDJUj3uH4fS6cuqNztVAPEH
         HOEJitX3LB85dk9Y/Xhb2tqATcstnL6Lpm3bbkZi+B0OyHlEblYApZdTjW0UA6InYtOL
         k7+g8VcqUx9m/m70jgTrVfgWZb/8KqX2LnXSmdyaaQg2BXol2QzdG6/a691ioWN0CPSI
         4wfTYs4ShMTtqC0vYtffvQTgAqoUApYNjhmK5yBVWZphLZ5/K8685bxOsigec0Bxhwp1
         +0WSDVObuEkIOGSSdTh+czFiYFy4YTH611svU/GPpjexV7NH9OQqrAH6Kem4VSL+B8Sq
         ekWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQJrn0To4F31k9QVR905qKpRSFzB0VJpIoYf5WFQdAfj8ET6o6oo+e65IJXEHSv/j0CmXejOE5GhvUDWFxGKK4cYBrg8skJaEmGU4=
X-Gm-Message-State: AOJu0YydI2e5tthP+ZR0/sncQxwFWGGiPZV2e2TJERzAbRf3bnkiuE1N
	N9QXc49O9Vx0hw6PIS+WZvfB5XZnh35hZzIn33BueX7h5/IsnlAI
X-Google-Smtp-Source: 
 AGHT+IEZZsOEzp4Al5LE7fCwp/ly55/+1pBPiX1vVF7xSc8+G0b5Ei5+RKBJQUfEphDPas9pOvnYiw==
X-Received: by 2002:a05:6512:3989:b0:52e:9382:a36 with SMTP id
 2adb3069b0e04-530ee993e35mr1936647e87.30.1723231917565;
        Fri, 09 Aug 2024 12:31:57 -0700 (PDT)
Received: from [192.168.42.76] (public-gprs548729.centertel.pl.
 [37.225.6.186])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53200f3602bsm12316e87.239.2024.08.09.12.31.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Aug 2024 12:31:56 -0700 (PDT)
Message-ID: <a109d7a3-bfc8-49ea-8ca1-c7b1c517fa4f@gmail.com>
Date: Fri, 9 Aug 2024 21:31:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/8] ASoC: qcom: apq8016_sbc: Add support for msm8953
 SoC
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Stephan Gerhold <stephan@gerhold.net>, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Vladimir Lypak <vladimir.lypak@gmail.com>
References: <20240731-msm8953-msm8976-asoc-v3-0-163f23c3a28d@gmail.com>
 <20240731-msm8953-msm8976-asoc-v3-6-163f23c3a28d@gmail.com>
 <ZqtnyWAXTsSGAg0i@linaro.org>
Content-Language: en-US
From: Adam Skladowski <a39.skl@gmail.com>
In-Reply-To: <ZqtnyWAXTsSGAg0i@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-MailFrom: a39.skl@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: M7XMKAOTVQNZ2NYVVYP4JFINSEOR2XZQ
X-Message-ID-Hash: M7XMKAOTVQNZ2NYVVYP4JFINSEOR2XZQ
X-Mailman-Approved-At: Thu, 15 Aug 2024 08:23:17 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M7XMKAOTVQNZ2NYVVYP4JFINSEOR2XZQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 8/1/24 12:47, Stephan Gerhold wrote:
> On Wed, Jul 31, 2024 at 05:25:30PM +0200, Adam Skladowski wrote:
>> From: Vladimir Lypak <vladimir.lypak@gmail.com>
>>
>> Introduce support for audio card on MSM8953 platform.
>> Main difference between MSM8953 and MSM8916 is Q6AFE CLK API
>> supported by firmware which influence way we set codec clocks.
>> SoCs shipping on at least msm-3.18 should use v2 clocks.
>>
>> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
>> [Adam: rename functions, add msg]
>> Co-developed-by: Adam Skladowski <a39.skl@gmail.com>
>> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
>> ---
>>  sound/soc/qcom/apq8016_sbc.c | 43 +++++++++++++++++++++++++++++++++++++++++--
>>  1 file changed, 41 insertions(+), 2 deletions(-)
>>
>> diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
>> index 5a29adbd3f82..3ed35beb671a 100644
>> --- a/sound/soc/qcom/apq8016_sbc.c
>> +++ b/sound/soc/qcom/apq8016_sbc.c
>> @@ -22,6 +22,11 @@
>>  
> Is there a particular reason why you decided to hardcode the
> q6afe_clk_ver for the SoCs rather than finishing up the dynamic
> detection Otto proposed [1]?
>
> This works for MSM8953 but there are a few SoCs like MSM8909 where
> both clock API versions exist (depending on the firmware versions).
> If we want to support them at some point, we will need the dynamic
> detection anyway. It would be nice to finish up that patch set.
>
> Thanks,
> Stephan
>
> [1]: https://lore.kernel.org/linux-arm-msm/20231029165716.69878-1-otto.pflueger@abscue.de/
This probably sound obvious but i don't understand takes Srinivas
had on these patches.
On top i don't feel good sending code i don't understand much.
On a note i managed to slightly modify fallback commit
and provide match table translating new clks into v1.
In theory if we want we can drop snd_soc_component_set_sysclk()
from soundcard driver and use devm_clk_get/clk_set_rate/clk_prepare_enable
to manage clocks provided by q6afe_clocks.
Biggest issue for me is lack of people who i can even discuss with about,
even here i fail to see much feedback.
