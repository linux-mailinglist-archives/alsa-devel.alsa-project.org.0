Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B3D7FD88A
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Nov 2023 14:46:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C31C8AEA;
	Wed, 29 Nov 2023 14:46:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C31C8AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701265588;
	bh=XyAdl7d2bcjt9TvorkmOyYlcXwoXipBu9gYOGaZjgQk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=r2cCiwzoxDdb44ES4MlZ1fMOZ25jo2fs63H4meBUimoZSkCa/WfVIXH8T0uYNBwVI
	 wqSXwvKCXjvtITDk50kXjJaAt0NoX+1p9iNoi2uT47ltv1WesI/GnDHcBN/LK5P94d
	 cZMi5DcktIqON/hV4esmdlyoPMBLsMD12Eo18Ehw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CE42F805A8; Wed, 29 Nov 2023 14:46:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 98449F805A1;
	Wed, 29 Nov 2023 14:46:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E29AF8016E; Wed, 29 Nov 2023 14:46:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1A862F80114
	for <alsa-devel@alsa-project.org>; Wed, 29 Nov 2023 14:46:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A862F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=xEqGCuWw
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a00a9c6f1e9so965057266b.3
        for <alsa-devel@alsa-project.org>;
 Wed, 29 Nov 2023 05:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701265566; x=1701870366;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cBSFdLwbP6iBVNXIZiTcHgh2DF6/dUUBZvh33dWqRVw=;
        b=xEqGCuWwSkx/6On7EkyACtpt3WVpXZI24A0pFJN6IaeFn63WVpOq9PGkuUWz5kaGzw
         ACRUHH8G0bCxqGrapW+qevS7Q1xDXo1nUF71f7adxI9F3OIf24xGT27lz+0ntn6acgCa
         CtF1QWznvDZ6tl/tjfbbXfRBA2O8x+zfbQZaklSDYWhKelmjDVp9+9j6xp9dYMArRWyp
         Fhey8/QKDtwBbkLFvN0YBzdwkDAcv27mGemrIFsQW9YmSJwB0vuhzIGIWlhvd8aIsGWT
         843WixvBhmLUjnRotj+WT7Qba2+Manw/m+1PQWXPL50BbBenL28ZS21OSI54BfAdd54S
         sNbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701265566; x=1701870366;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cBSFdLwbP6iBVNXIZiTcHgh2DF6/dUUBZvh33dWqRVw=;
        b=tEX44dgTKFK5L+e/XF8cIGjxVHqQje0x7BcuQ9FrhGYQV5oiHZDLZ7/5T8yQyGcG9+
         bTK4T1yMnN2ENwoDi7q0Ej3DkKbzzrMXeJYsL+llvUvdGEptH4kjWc5F/epobApDe/Wq
         0x41mnhu52pj4Fci387msNK4TBMDHbuMmkPt3wk0EEP7qMyHtvQVS3BkP8YScjjXkPJ4
         7zCL0ZUZuh5IXhRMLSCt+KgWgZS0oCrRb5e4FVzunBUT0Aj7gnaARKFcppxQc0pxM00i
         zNhORdVzR24ZSqDmKlmZfL/cwlqwcAmxbz+D72FzXqi41Hl3XrYYgxqZ9zLIMhGCzkVc
         IZ7Q==
X-Gm-Message-State: AOJu0Yw25jeNLtdwMwPcCJ20uemZlqNshYSQT/WleRpyIPi8bpgiTJej
	bBr4cA30l+GEBvvtg9snL43wKg==
X-Google-Smtp-Source: 
 AGHT+IEDLfeyaa/cILOO4tDHn+EEvUTwqz2+8nc3XcAYN2nENkKkAzsj23smEfgm2ZV7pfSa8xuUOQ==
X-Received: by 2002:a17:906:b299:b0:a03:ad29:a00b with SMTP id
 q25-20020a170906b29900b00a03ad29a00bmr15555698ejz.36.1701265566229;
        Wed, 29 Nov 2023 05:46:06 -0800 (PST)
Received: from [192.168.209.173]
 (178235187166.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.166])
        by smtp.gmail.com with ESMTPSA id
 f8-20020a17090624c800b009fd77d78f7fsm7910195ejb.116.2023.11.29.05.46.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 05:46:05 -0800 (PST)
Message-ID: <eaa034cb-06e8-4204-befa-4389bcb7d9e8@linaro.org>
Date: Wed, 29 Nov 2023 14:46:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] ASoC: codecs: Add WCD939x Codec driver
Content-Language: en-US
To: neil.armstrong@linaro.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: 
 <20231123-topic-sm8650-upstream-wcd939x-codec-v1-0-21d4ad9276de@linaro.org>
 <20231123-topic-sm8650-upstream-wcd939x-codec-v1-5-21d4ad9276de@linaro.org>
 <ad9a7c4b-82f4-4347-b4dd-a394e4ba95f0@linaro.org>
 <42a6f6e0-2846-4cdc-8702-493fadbafb98@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <42a6f6e0-2846-4cdc-8702-493fadbafb98@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5M3RF7H6DANSNWUIYCVF4YYOPAVK5B4T
X-Message-ID-Hash: 5M3RF7H6DANSNWUIYCVF4YYOPAVK5B4T
X-MailFrom: konrad.dybcio@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5M3RF7H6DANSNWUIYCVF4YYOPAVK5B4T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 28.11.2023 16:01, Neil Armstrong wrote:
> On 25/11/2023 13:07, Konrad Dybcio wrote:
> 
> <snip>
> 
>>> +
>>> +static int wcd939x_io_init(struct snd_soc_component *component)
>>> +{
>>> +    snd_soc_component_write_field(component, WCD939X_ANA_BIAS,
>>> +                      WCD939X_BIAS_ANALOG_BIAS_EN, 1);
>> All of these values are BIT()s or 2-4 ORed BIT()s, can you check what they
>> mean?
>>
>> Same for almost all other snd_soc_component_ write/modify functions
> 
> It uses snd_soc_component_write_field() with is the same as
> regmap_write_bits(REGISTER, REGISTER_MASK,
>                   FIELD_PREP(REGISTER_MASK, value);
> 
> So the 1 mean write in enable mask in this case, and mask is single bit,
> read it exactly like if it was using FIELD_PREP(), but even for BITs.
> 
> I did check every single snd_soc_component_write_field() so far to check
> it matches.
> 
> Or it's another question ?
What I wanted to ask is whether it's possible to #define these magic
values within these fields

Konrad
