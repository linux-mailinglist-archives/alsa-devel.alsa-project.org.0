Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1526B826031
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Jan 2024 16:33:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75370E8A;
	Sat,  6 Jan 2024 16:33:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75370E8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704555206;
	bh=IlBamVPEIAyfbsjikpxgytQ236zDtCRmre/7Jsg0EDA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aFWRnqzz88f7VLh3gstsJpPG6hlFYVlmBe40waFlfZCGglaGz3tYOfiUPPmgE8Gcp
	 sR1qW7Hp0XRcZRmwM+MK2e5VWrjxuip81Ftt4a8Uhhj4hhSpc25Da4hrdQpJhjRli6
	 XAKvERveY0I9YC4dCj/e1Lv1qoOZOnr77FjYPuIg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D914CF80580; Sat,  6 Jan 2024 16:32:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CF98CF8057E;
	Sat,  6 Jan 2024 16:32:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9FB7F804B0; Sat,  6 Jan 2024 16:32:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 748AEF802DB
	for <alsa-devel@alsa-project.org>; Sat,  6 Jan 2024 16:32:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 748AEF802DB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=BPNLmPRj
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-556fc91aba9so596169a12.1
        for <alsa-devel@alsa-project.org>;
 Sat, 06 Jan 2024 07:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704555159; x=1705159959;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GX/TYOuEaEWdZOe4Via6FfCNhxFRRVBiWsIZwO9fu64=;
        b=BPNLmPRjyetSHIrqhdic3ECZqIAREQ7l+AQfDiUpCKkMk0FDf3Hxg7upOJdT+EiBry
         BghpsNdU/xl2WYODlOZipbczys1KrN0S+X3HDYLYlOLzOOVLYt1bZXV54BsKgG6fxU1J
         RmN7jOdjS0VVjWZ+TG41O1XbLccrGBUlNHoP6PdjwSK9erR6f3DrEMxL6DaM4gKDcJMY
         SHyl0dTrhwNJdXYIAoK7/1zBuMNESocQ4gacLcpany5VpnLBc1vFiIaVgE04sPJGO0ZO
         Cro7FTFMWZ3VxsKPEQz4hLEGJ+0Dnxuo51MBu7FnTSw+6jke2JTR56Hffs8ArRc2bTSM
         XDcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704555159; x=1705159959;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GX/TYOuEaEWdZOe4Via6FfCNhxFRRVBiWsIZwO9fu64=;
        b=lnCZOkVSQ8w8xxB/4yROjmpycflfFP2dJAt7OflocChx3133rzOzQ8sZc3RI9WTaWS
         DCsQHPjwtuQ6l5CZ/q5EibAa8fPlWlKHKbvNwWuO+rMNjOD38faz88fysbzKS+2qJAPm
         XC3slJnDEbz8Q2JsdrQYklbWKT9fp5kVfiRvpZk8hLjptH0tug8UNYG1+mwdk3/OXhPw
         dwDpimuZn2UOR/p5sZIpjUSrEX9TK1kQYBevO0J/p11A4jKFnuzeUYiV1Yc3c8LorqQK
         ANUO5GFe/LnOHjchMfFSWnHpDNGOc93s3hl66GPqj7yls7YEBNZpfhudr6FP4E2x+Wjm
         mlSw==
X-Gm-Message-State: AOJu0Ywl5qUbIS4CM241YvtINurCOYUdC1K61ABBdmuNL5O+hq2QXIsl
	na8uLJwG3a88ZRGGXJi/uFL5gb73Vfx3Yg==
X-Google-Smtp-Source: 
 AGHT+IH0/XeH7QwrkW7lTxkcr24gZ45qG0SJGvdLsOVexLew253lAEYJOYk6YWQLTeUb2xrFBKkAXQ==
X-Received: by 2002:a17:907:3603:b0:a23:6c6a:41a5 with SMTP id
 bk3-20020a170907360300b00a236c6a41a5mr576428ejc.45.1704555158846;
        Sat, 06 Jan 2024 07:32:38 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.112])
        by smtp.gmail.com with ESMTPSA id
 lb24-20020a170906add800b00a28fa7838d2sm2077369ejb.18.2024.01.06.07.32.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Jan 2024 07:32:38 -0800 (PST)
Message-ID: <c3c8e68f-ee7e-430b-b890-011573e809b1@linaro.org>
Date: Sat, 6 Jan 2024 16:32:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] reset: add GPIO-based reset controller
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: Sean Anderson <sean.anderson@seco.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
References: <20231222150133.732662-1-krzysztof.kozlowski@linaro.org>
 <20231222150133.732662-3-krzysztof.kozlowski@linaro.org>
 <530e3473-eb3b-477c-8599-e7aa12779640@seco.com>
 <88bd6668-7e67-42c7-97b6-d7029f371349@linaro.org>
 <075990bb-5fdb-4d30-9484-9df6b978e805@seco.com>
 <fcbae47b-3b28-42f0-b93f-f83932025dc1@linaro.org>
 <2be19fbf-4c73-4594-be42-31587dc7b747@seco.com>
 <d2d17b94-6f29-423d-a7e0-e24513a8e59f@linaro.org>
 <758c4fe3-1ea1-4a8c-bb6f-3a3df588da75@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <758c4fe3-1ea1-4a8c-bb6f-3a3df588da75@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: KQE73C3EONGMDCUV3E5HCHRPYCLG4PGA
X-Message-ID-Hash: KQE73C3EONGMDCUV3E5HCHRPYCLG4PGA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KQE73C3EONGMDCUV3E5HCHRPYCLG4PGA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 05/01/2024 15:33, Mark Brown wrote:
> On Thu, Jan 04, 2024 at 08:08:50PM +0100, Krzysztof Kozlowski wrote:
>> On 04/01/2024 17:30, Sean Anderson wrote:
> 
>>> device post-assert delay post-deassert delay
>>> ====== ================= ===================
>>> A                  500us                 1ms
>>> B                    1ms               300us
> 
> ...
> 
>> Now, if we are back to realistic cases - use just the longest reset time.
> 
> Isn't the main concern here that when one device probes we don't yet
> know the times for the other devices?

You can never know when second device will appear. It might come from
modules, DTB overlay etc. If we want to satisfy all users, then we need
to wait till all users appear, which I think is not even possible,
considering runtime loaded overlays.

> 
>>> If we leave things up to the drivers, then whoever probes first will get
>>> to decide the reset sequence.
> 
>> In current design yes, but it's not a problem to change it. Where is the
>> limitation? Just read other values and update the reset time.
> 
> We might have already done a reset by that time and earlier devices
> might prevent later devices from resetting again.  It shouldn't be such
> an issue for the post delay, but might be one for the pre delay.

If the reset deassert (or assert, depending what's the default state) is
triggered in the probe, then it will happen with the probe of the first
device. If the delays of that reset are not suitable for the second -
not yet probed - then what do you propose? I have the answer: do not use
the simple, generic solution. The simple and generic solutions work for
simple and generic cases.

Best regards,
Krzysztof

