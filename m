Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2F87FB52E
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Nov 2023 10:05:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87AAA1E9;
	Tue, 28 Nov 2023 10:05:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87AAA1E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701162336;
	bh=lcIC/TL7XDLsLeLthEGCBsLWIKYM9JnPtlrOe7dnszI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cnv2nOUjiI5Y/DDB412As4jT6ibi9EuC5Viy4ovxVgFgn/u0SEgnmT3vvvayNT5Z5
	 wxKrkx2L5JpCuaoqSU1e310vfaHywkeJgNIB0F5z+z1U4xzJXgSmrpOjjAzLsOBrFq
	 c7+rsna5DqjhSwcNuCR3wxOZONVXScFTlFBoEmJY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C07BF8058C; Tue, 28 Nov 2023 10:05:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 55EB0F80570;
	Tue, 28 Nov 2023 10:05:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 975B2F8016E; Tue, 28 Nov 2023 10:05:00 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 52BB6F80114
	for <alsa-devel@alsa-project.org>; Tue, 28 Nov 2023 10:04:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52BB6F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Z0+a/F38
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-54a94e68fb1so10093015a12.0
        for <alsa-devel@alsa-project.org>;
 Tue, 28 Nov 2023 01:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701162295; x=1701767095;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qc5JcQopyjaw0h7Rm7v1ZmQjJI8MfwTNyQE5kCaerF8=;
        b=Z0+a/F38XFOO/AW/vuf0a21+T67D1FwjT2XGgC9OFDUhO6zBo/b6aBjh/Vftd+jePw
         74GBkhECG/SKDTp7Av3INaxf0/3MxtMQEMawZxlq15WNsQOpM4uIIi+YxtUMKf9qAwEr
         DpnN/j/Yyf4Qm2IwrsFPAC6yohKW5ZpbN0RjMUdmxeZdJLZVXLAXwimmDs4Sy07Rrsoc
         fs637EPVxA/YUZXcKzBgp4eHGFyupGhllQskw++rxtxEjuH4zikRz56dfCgGGGlTV+nx
         b4tSJrGfmAbJJ3cwNIzX+XPmTFRruC1n+yPCy9LpWsWYhT2ljC9cHCS3ADfFxSVVdeQS
         hwUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701162295; x=1701767095;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qc5JcQopyjaw0h7Rm7v1ZmQjJI8MfwTNyQE5kCaerF8=;
        b=hsJyMJpd0RvuQCkCskTcXNMWuignqZ5czO6zgSanR754ou7YXcNtnnp0FEMdFtv3NX
         Fqad/7+f8Piw6hwHK0/VuZpGZBdRcJ6v3mwB+ngmHtZBVYZFcSEbwPuFxiVJoAUkZF5u
         KLWfhKnGQ6lb9fYlkzVNaLak6Ih0SBNsUXQkrm6nlHDeH41VPkV3F6ZVp6WzViLP7CHh
         SltHCivF3c1sCb31lN3s3H/svaoUocMwQBt56Px8wMx5d3x6iiFVirCnEVHBSQQoru7N
         6DW2xMIIU/gSvenyFLKAPyDdWNjx4yT+yh1CX1cWswY/kTqHYh8f9RLEns7HgVTU6ri2
         kGMg==
X-Gm-Message-State: AOJu0YxiJjZkmcaQ8vc3Gd7309TcorcCmSDl0DajwoO2TUvvSRpC5UCm
	B67zSFrb9jz5ApCviPKODj8LRw==
X-Google-Smtp-Source: 
 AGHT+IFEakoL6s8aB1Kbjd7EnmUyefNOANreyJhr02mT953pYfarluOEy7EfLk05JeBiqJ9ZxOftdQ==
X-Received: by 2002:a17:906:20d4:b0:a0f:78db:cb15 with SMTP id
 c20-20020a17090620d400b00a0f78dbcb15mr4884972ejc.21.1701162294413;
        Tue, 28 Nov 2023 01:04:54 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id
 19-20020a170906319300b00992b8d56f3asm6528618ejy.105.2023.11.28.01.04.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 01:04:53 -0800 (PST)
Message-ID: <60c9ba5d-a2b8-43cd-8b8d-2c709b8e5d04@linaro.org>
Date: Tue, 28 Nov 2023 10:04:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] ASoC: dt-bindings: document WCD939x Audio Codec
Content-Language: en-US
To: neil.armstrong@linaro.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: 
 <20231123-topic-sm8650-upstream-wcd939x-codec-v1-0-21d4ad9276de@linaro.org>
 <20231123-topic-sm8650-upstream-wcd939x-codec-v1-2-21d4ad9276de@linaro.org>
 <160fc6c4-b07d-49c5-976b-aa0fa35e4f0f@linaro.org>
 <b637c287-93e5-4214-9275-80fac3c6181b@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <b637c287-93e5-4214-9275-80fac3c6181b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 7GTN3XGGI5VX7PF6I7LFU2PNFD4EX5EC
X-Message-ID-Hash: 7GTN3XGGI5VX7PF6I7LFU2PNFD4EX5EC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7GTN3XGGI5VX7PF6I7LFU2PNFD4EX5EC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 28/11/2023 09:59, Neil Armstrong wrote:
> On 24/11/2023 09:33, Krzysztof Kozlowski wrote:
>> On 23/11/2023 15:49, Neil Armstrong wrote:
>>
>>> +  Qualcomm WCD9390/WCD9395 Codec is a standalone Hi-Fi audio codec IC.
>>> +  It has RX and TX Soundwire slave devices.
>>> +  The WCD9390/WCD9395 IC has a functionally separate USB-C Mux subsystem
>>> +  accessible over an I2C interface.
>>> +  The Audio Headphone and Microphone data path between the Codec and the USB-C Mux
>>> +  subsystems are external to the IC, thus requiring DT port-endpoint graph description
>>> +  to handle USB-C altmode & orientation switching for Audio Accessory Mode.
>>> +
>>> +allOf:
>>> +  - $ref: dai-common.yaml#
>>> +  - $ref: qcom,wcd93xx-common.yaml#
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - qcom,wcd9390-codec
>>> +      - qcom,wcd9395-codec
>>
>> 9395 should be compatible with 9390, so please express it with a list
>> using fallback. I know that earlier wcd93xx do not follow that concept,
>> but maybe we will fix them some point as well.
> 
> I don't get why this would be needed, yes their are compatible but still
> two separate ICs with different internal capabilities.
> 
> It the first time I get such request for new documentation

Maybe it is first time for you, but I ask about this all the time. What
is important is whether the programming model or how the OS uses the
device is the same.

Here the device exposes its version in registers, so you can easily rely
on the compatibility. That's also the case multiple times talked on the
mailing lists.

Best regards,
Krzysztof

