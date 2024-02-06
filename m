Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D883784B78D
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Feb 2024 15:13:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89C5E210;
	Tue,  6 Feb 2024 15:13:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89C5E210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707228814;
	bh=Bsokvn5YWnf3uoqaFnfN9YvfGrwDEWEVf1pfDUZWanA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FeF2xPdNkGH/H4suWf6aPJBltVGHR2vijtv9j9HWy1T87+vubpEUv0yH+8UDi4IxB
	 I+Xsj/ysZQwbriuzpsKOedqrAVm8HsGqDT9VWiQKc7Pz2SJUKUOLTqWz54aWt2O7KI
	 nZeYmA8sXWiuqE3yqafR9KwCmasDaVtu20wcc4tc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1BD9F8057A; Tue,  6 Feb 2024 15:13:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 42E7BF805A8;
	Tue,  6 Feb 2024 15:13:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5A14F801EB; Tue,  6 Feb 2024 15:13:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6A6F0F8016E
	for <alsa-devel@alsa-project.org>; Tue,  6 Feb 2024 15:12:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A6F0F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=YOuB9o9K
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40fe2d3d5a9so5491345e9.0
        for <alsa-devel@alsa-project.org>;
 Tue, 06 Feb 2024 06:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707228772; x=1707833572;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f/GUlRf0HmWkHoc7OTDeUe7IIuv9mQx9L8UMYHSrdxA=;
        b=YOuB9o9KbgUVmE+R1FPiBYY+Sux8osBBNS8DgJgMimM+FJHPNCFeI/S1cnhEP+scfE
         eSl5IvVIquVYJ+0+4hQz8dKfKob0SLi9YXnU7qsh+FY6kRvRGnuKfXJqWTWJAKvDBbpd
         QmdZsg1b8iVXUmaUO5jn+CvNH1qMpj5IAw975bPq9d3lmUfSIKH89jS5km3weEZz+NaK
         apkT5zQy2+XtadhXyNm1MXy7TOjVWMenycTueyT6eCiPzuke9Lw1WOF1CK0vrHg5VTqy
         /2WJzSTRCgz3FV6S0gnAN8L00h8LGl6ZqEmsulJZduX2ROlHBibFnxhxut1f3hRYKcV9
         x/5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707228772; x=1707833572;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f/GUlRf0HmWkHoc7OTDeUe7IIuv9mQx9L8UMYHSrdxA=;
        b=sPuw9YSUkPhj4HhjRvyk5iG1YAwToPKKR7bdXL3BoH/fbY+e3ii6BKtfz428kIfwGp
         YzrgoUPVbmULbjeIdT71T4mE/lG3h2BzRF4t89a5Eerv0IDWvnj9BhEIyiLwYn10KC1Q
         c29is+5JWLkvLA9vN17F2oV4tXg6HyoQSZkVcgO1wniq8mRllBR3IkteMkkRRNLfGMIF
         bg3+Z/DJxZ4OgUbykvL25ZU8rSC3jYCMPe7oqgUpSq1s9nOXKmDWnovDBHWGhDnULFVc
         SymbLFk1ekU9qWEZSsFRoWeBzDQTKbR4XvcPPFTZzw5JuvpxNjQ12pTDecyQ7AQ+pEb8
         Za1w==
X-Gm-Message-State: AOJu0YwgNWiAh8pXdUAxNEd27uVFnWjknDvlifTDILbmlKdvyQFZc2o9
	E9OTPXAtQM04DC1uRu+uRYKOCpWCHy0riC6k3+Z6IlVJBg5MS8dKQ86OP9wNWjc=
X-Google-Smtp-Source: 
 AGHT+IHztXKPPEoRWAl5ItxM7oX/l5Dxb1UecXG0cZZ9t15hDEmGoMSNhlYb/7y1oEuc+RYvYgxATw==
X-Received: by 2002:a05:600c:198f:b0:40f:dd35:9224 with SMTP id
 t15-20020a05600c198f00b0040fdd359224mr1646897wmq.4.1707228772550;
        Tue, 06 Feb 2024 06:12:52 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXu+7aOEidgQf+ZljxAaXruBbmXFWN7vR9z/Xj1+EilHtJc4CQHZBO4NYKZVo15M0MdsaG73qvdBsSXXCuGsWReOfWbhkwxwv0xOBJlH/mKUIBwj/sSFVpqgEvX0mrMeKcKBqm1L01vapmGUU6g5fLbgc2XcwMhvdVZA2sXFNP0Ge76dzGNLNTU5jzcA13UlyncTqDZqDUW31pQmqG/IwTgXkVK4tIcd0BWLjaP7ng0xXd3vTiA3Cnto6gLmWSj/4RnUyUsMimpaOmlQhUGT3g8iu3v9tFCekBJairVp/DNC3kUb58BJsOPyrihhB7JEz4Lguiv0jDBbZFSBHPBNeBaO2MgtcUoPY+QVaIAY6TFH5vit/H90wtS5ucV/E2+6qZ/jtiTjdspcMl0jXIPEIWcZDMgLvJn7aJ2A8WdrGJ4UoOKWK5NTYViye/yaKlDPOc6z6betTFmmbqRaE4qW6u83KTS3ByYXgNbAepIWnHzKwPGxRy/QNwU78itobeaEKaSaXQjyWCycUHOb80fFjZSbAkw
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id
 w17-20020a5d6811000000b0033afcc899c1sm2213579wru.13.2024.02.06.06.12.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 06:12:52 -0800 (PST)
Message-ID: <47bbd3e5-d94a-4b7e-afc2-68297f5a79c1@linaro.org>
Date: Tue, 6 Feb 2024 15:12:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux][PATCH] ASoC: dt-bindings: atmel,sam9x5-wm8731: Convert to
 json-schema
Content-Language: en-US
To: Dharma Balasubiramani <dharma.b@microchip.com>, claudiu.beznea@tuxon.dev,
 lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: hari.prasathge@microchip.com
References: <20240206064418.237377-1-dharma.b@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240206064418.237377-1-dharma.b@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 6X6Q7NZ3WBZMANYNKMPTFQ7D2N2SHVGX
X-Message-ID-Hash: 6X6Q7NZ3WBZMANYNKMPTFQ7D2N2SHVGX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6X6Q7NZ3WBZMANYNKMPTFQ7D2N2SHVGX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 06/02/2024 07:44, Dharma Balasubiramani wrote:
> Convert atmel sam9x5-wm8731-audio devicetree binding to json-schema.
> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>

There is no need to prefix patches with "linux".

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

