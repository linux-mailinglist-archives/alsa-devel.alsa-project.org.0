Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 776C17687AB
	for <lists+alsa-devel@lfdr.de>; Sun, 30 Jul 2023 21:50:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BA58828;
	Sun, 30 Jul 2023 21:49:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BA58828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690746603;
	bh=ZwXzwML+EhmOlxIng2pIBYyb52WfJX+On6MtT4vhZO4=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=RJ2w1lFUE+WfrVx28+z72pTJsjR4YY/itnLxdYW/UmDewB3i4mGwai/DUNtOQEUbN
	 2UUr+JVuXNAyQpIcQfAVFXkavEe+fRfVjEvoAVii+c4cVc9/ZQmPnAitser0q4yVKz
	 /UQyuosZIk18leXijRu8v7sSFwh0L/hUt+5BVqaM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0455F8016D; Sun, 30 Jul 2023 21:49:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77EC5F80163;
	Sun, 30 Jul 2023 21:49:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04B6EF8016D; Sun, 30 Jul 2023 21:49:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 620A8F80153
	for <alsa-devel@alsa-project.org>; Sun, 30 Jul 2023 21:49:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 620A8F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=PdbGH6vU
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-997c4107d62so562388966b.0
        for <alsa-devel@alsa-project.org>;
 Sun, 30 Jul 2023 12:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690746545; x=1691351345;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K0RMQyHf1S3Bsa35UR4acJ/fdA34+QRYTwD5K564HMM=;
        b=PdbGH6vUkI5RQ3CsT3okvuaa4Tcwo6GZad0kgWK/QuxR3QVPimaMRiv6d2GJUcGdqZ
         6wJWS0nJlo6X5BNG5jmYttbJ0eYPO3LGZ4y+NsVyDlnqddRtYPSLDEt2mj4GEwH2tiIq
         5s7wiSK7DUzLI2jsISRff6MAi5Aipr4KhKwvnuGauNEVViVg33sBJRNsr5EMCYFbTbgU
         12C8OVJfKdKbHH8FY3jkjakNdtH9r2hLtbSDLMViwbxmYmtpBXJa5YWjPJ5p69yMrqcD
         d3qDM48XHPzuZiacpWAjHdEVIWmyJI5xSGoPsjTjUSNx4QL9RvwOE+08mlUlmuJKVdr6
         OOEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690746545; x=1691351345;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K0RMQyHf1S3Bsa35UR4acJ/fdA34+QRYTwD5K564HMM=;
        b=h8hVcxRTwLo/4hKtrGGvNXf5XH4d1+7y/FMGBnsO0C5ttqYoTip8T+NS/HMF5x54Vg
         a2cWuSXVjhJwlL8ja4Ykrm/6kYaH6hMURYcDR8C8Pugk3nQCNJ4WnPdIkANPCq72q4d2
         V0JyFfVLhiLZl9gblv2HZEOuohhooDXls2VeChZ4ATm8vcCd5+lPsd2LGr05/Sh/j1Hn
         ytRpNxeRmRG/tFmrK9Tydfq52t2yHIIjp5pyaVTf1pzdp/8SCeuSJbLE1OGkh2l+3Qaq
         uLjkIQse6hJd2sr9LAo43mvjynvffigmQTBx26RL+JHd3MzaoR8pK3kiwN+oz98oy/Pa
         3iag==
X-Gm-Message-State: ABy/qLZ7iVl88boZLk9tIOgF3fvm6pTyh2Gd4EULTtXRzxvylxAynIjf
	qy+D7SRl/1Cl878oTHsTI9LiDw==
X-Google-Smtp-Source: 
 APBJJlHrpb+viUP1W8CeU7uOtAtMAoCLVyCpfXOl41PJX7SxhNONrYammNz0vfDLN9J1iEhBRDJV9A==
X-Received: by 2002:a17:907:a0c6:b0:96f:8666:5fc4 with SMTP id
 hw6-20020a170907a0c600b0096f86665fc4mr4970673ejc.50.1690746544975;
        Sun, 30 Jul 2023 12:49:04 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id
 v25-20020a17090606d900b00992e265a22dsm5085950ejb.136.2023.07.30.12.49.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Jul 2023 12:49:04 -0700 (PDT)
Message-ID: <deea8977-53a1-31d0-ba3d-8daac1ab49c1@linaro.org>
Date: Sun, 30 Jul 2023 21:49:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH] ASoC: dt-bindings: Convert maxim,max98925 to DT schema
Content-Language: en-US
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Ryan Lee
 <ryans.lee@maximintegrated.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230730194230.34447-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230730194230.34447-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: AVB4WAOFIVRARHF4PANFUEQQCLB2OJES
X-Message-ID-Hash: AVB4WAOFIVRARHF4PANFUEQQCLB2OJES
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AVB4WAOFIVRARHF4PANFUEQQCLB2OJES/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 30/07/2023 21:42, Krzysztof Kozlowski wrote:
> Convert the Maxim Integrated MAX98925/MAX98926/MAX98927 speaker
> amplifier bindings to DT schema format.  Changes during conversion: add
> sound-dai-cells, already used by DTS.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

...

> +  imon-slot-no:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 30
> +    default: 0
> +    description:
> +      Slot number used to send current information.
> +
> +  interleave-mode:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1]
> +    default: 0

Ehhh, two drivers have actually different property for this and the
original bindings were not correct. I will send a v2 unifying it.

Best regards,
Krzysztof

