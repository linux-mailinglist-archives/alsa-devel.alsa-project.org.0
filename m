Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6920685D434
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Feb 2024 10:45:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E6F283B;
	Wed, 21 Feb 2024 10:45:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E6F283B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708508744;
	bh=/opIB55MMYKYaC78niYQAuyhzp2B1CswjFKDPDdn5Xk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VJjezJrgC3tBgSlj0iMnE6+SJF6Kq17xcjg+i7zYUiWkc87YyDeP1mtY1nzn/luvX
	 5oVN6J/wsvXK6+Jb3zxx0enWzHS3UH2KcG9i9HiEdRp5hVozj1T2Eo3dje/c06ORTp
	 0f9S+OfJWrv4C3l68K0Oh++/YN1/6smQrHFdI8c4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7095F805AA; Wed, 21 Feb 2024 10:45:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AC4FF805A8;
	Wed, 21 Feb 2024 10:45:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1D6DF80496; Wed, 21 Feb 2024 10:45:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B0A45F80104
	for <alsa-devel@alsa-project.org>; Wed, 21 Feb 2024 10:44:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0A45F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=lbr2ckdB
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a3d484a58f6so51628966b.3
        for <alsa-devel@alsa-project.org>;
 Wed, 21 Feb 2024 01:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708508696; x=1709113496;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NyBaoVH2N/0Qpdr6Z5VWnZpm4sf6QgnERUX3ACGj03I=;
        b=lbr2ckdBogEWf7Pi+N6J4PHX0/PqFIwxMMb9exER4zepcmY9HPnPGY6aihJfrUz5UB
         a7VBBSYavMSbuy3Q8y7Wep9yAscAhrwrEDh944VYfCrRWt/QGXKdWZGN/giuexKm3PE/
         4znvvfUIQt5129xhEuJH9VQSRfMax/mNmNTnEIgKkt2Il3+QOy9YPhbIy2S0N5Ca/ctm
         erCo5f4HDQaOoUWP/+BjRwDadOai4MuJehz2J3n54o+VicqapOpCDpXt4eLqHcOs6nqO
         2iC9N2wECtfBOO793rne5BKtGXm7kqcxxucz9gC9xGeUyAvTgw4kf5HvueGzCiHvPIw/
         8rGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708508696; x=1709113496;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NyBaoVH2N/0Qpdr6Z5VWnZpm4sf6QgnERUX3ACGj03I=;
        b=alMbY4BOyBp+DcP3HheFvDKXheIIRoDee7BbsGdPScT17+HrvmxS8KYsKBPPi2TwOY
         l0ZDceo7uogxzYOgGmOHpB9C90dMQ2IM+EIf+Uo+m7ZagnM6XqAKkM1nhZEAXw27FvRq
         +StEBbkwsh/boO7wmIr35UJDqAh1Xdke5jzHQIDvf695OltFF9fucScgU81Ze+ogGfhc
         QHhR4Z/AWA8a/k2Z3WtjVJz9zw2eIbAv58V63MI98Xjvh0Wm9Iio6uVSrmKN8dQFAiY7
         a9y7C1FGtqigXmmgzxtbHcCSfNHmhh7YLVYursPLGvRVJ/bp2DORfCBtKmCS4HYmA+Cw
         eEew==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOdDX9wPgKeQ/IO8kAuZMOFihrlLaDwnS6HzVyWT9RO+jXiW56T2KKTMie9uJVD9hIYV03jGnvxJQ4g6jZJxc84v/P4xtra4J8LC4=
X-Gm-Message-State: AOJu0Yy3dkj/0D9nqQ15HRR4fG1XWVa2mnPWoiQIxLq/pvMgJdmED1gY
	u6nIIg+ekKw16wfSrREwDqG2CYPAtiivV8ErqcfzWGGYkSKeL/jFf0oRertwcv8=
X-Google-Smtp-Source: 
 AGHT+IHKAvnXAoTx45vIQ/qJlrbVDVZ7kPxLCVw3sTsnFfwKS3/tPeqcsbS4/Vw6sYV6b+JfjsNYeA==
X-Received: by 2002:a17:906:2b97:b0:a3f:50ae:52d with SMTP id
 m23-20020a1709062b9700b00a3f50ae052dmr418708ejg.10.1708508696477;
        Wed, 21 Feb 2024 01:44:56 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id
 sn24-20020a170906629800b00a3e1939b23bsm4464478ejc.127.2024.02.21.01.44.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 01:44:55 -0800 (PST)
Message-ID: <7ae0567d-e5d3-4e00-98f7-5139d5879f75@linaro.org>
Date: Wed, 21 Feb 2024 10:44:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/6] reset: gpio: ASoC: shared GPIO resets
Content-Language: en-US
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Frank Rowand
 <frowand.list@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Sean Anderson <sean.anderson@seco.com>
References: <20240129115216.96479-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240129115216.96479-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: JODWLLOSST2HWMO4CETXMC7HL4H4ZT5P
X-Message-ID-Hash: JODWLLOSST2HWMO4CETXMC7HL4H4ZT5P
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JODWLLOSST2HWMO4CETXMC7HL4H4ZT5P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 29/01/2024 12:52, Krzysztof Kozlowski wrote:
> Hi,
> 
> Dependencies / Merging
> ======================
> 1. Depends on !GPIOLIB stub:
>    https://lore.kernel.org/all/20240125081601.118051-3-krzysztof.kozlowski@linaro.org/
> 
> 2. Patch #2 (cpufreq: do not open-code of_phandle_args_equal()) and patch #4
>    (reset: Instantiate reset GPIO controller for shared reset-gpios) depend on OF
>    change (patch #1).


Hi Philipp,

I got acks from GPIO folks. The also provided stable tag with dependency:
https://lore.kernel.org/all/20240213101000.16700-1-brgl@bgdev.pl/
(which BTW already is in mainline, so you could just merge Linus' tree
into your next branch)

Can you take entire patchset?

Best regards,
Krzysztof

