Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32491665938
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Jan 2023 11:43:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 721AAE43A;
	Wed, 11 Jan 2023 11:42:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 721AAE43A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673433787;
	bh=Jh6P01APnXH6kprR+1Y6g9ET4KrsF7MUmXeJ1Gmuwnk=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=R6+32XNgLd94iAp0tSFiE8+LO8UFtN3l1eAC+J7Z1NwVf/KEBpZcY8a8Lz0L6BHpH
	 tXYi5v8YcsvJsU1EQQk5Hpmiza35IYAB45HOcHxSExjhn3/l6+182MEPWRQnTGhGv8
	 +So5zV0B79lblC3JGW/3bDyHYpSmnLv/jfsgPxVA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCDFAF8019B;
	Wed, 11 Jan 2023 11:42:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D552CF803DC; Wed, 11 Jan 2023 11:42:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5CC7F8019B
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 11:42:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5CC7F8019B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=cM0cDprD
Received: by mail-wm1-x330.google.com with SMTP id
 j16-20020a05600c1c1000b003d9ef8c274bso7923564wms.0
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 02:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QCB9HC+nOODlhgQeT6tYCcnxKnTMlcj4XPzktx4ilxw=;
 b=cM0cDprDbL3928y3K/CBVa6ETnMywsmJPhhQAv4pvu4CEHy4GKdy3qbaQEAd38EHzZ
 ne7dt8ylDAA9lcwTB0/EJu9Lw/rdNjxjhHLy8PftjKhF19i4YEjBJ6RfqZ9CESSQQRdU
 tlOty7NB1h1kgm/obRWwkCTVf7w5s+0Ue7kAlcYKSRnngSFk/UkeKH1QSWfZADyV9ZDG
 suB9V6DhKlSJx4ByrBi4E6QcZnYyO0d/XU1gIWYnfRHAvw7Brn2vLhh8nZ4JAXIzEiuD
 wUwdFIN1+klb4V0qt39R9BZSJXA0t3kFbH1HNTaVmejDs1vlEMdioeqdUyIwaVIDdBD8
 rXlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QCB9HC+nOODlhgQeT6tYCcnxKnTMlcj4XPzktx4ilxw=;
 b=cOp6i7MzencPjFMVVGKp53PXTcDWX9Qq/P7tdVXS7jCMLu+BGHwP+rjOMxQgm/bCOn
 4GpPMtiHOF6iHUVAVH958WAlUySms+oVt58A8GSSR1LmE4S6rLdnwHuedBpvqOPUzxdQ
 Kt5g7tRarN7lZ06QN+IOqFekK/ZW+Z32sl9yeJl9chJ0+6OgvM9n98qiaCvDDSkTuwxX
 fNxg9hi2hX57rhboFacl3zQ5XCWqefwMZussPSLZ8YXPmGACGS8PlXqoU7NEb8vx7F6X
 e7PYmgB7jaL93lr2vIrIfnOgd8hk3Fy3xjuBf5SQAoaYl2vmW3ysN7iRabSjJ+NJe3D9
 5UTA==
X-Gm-Message-State: AFqh2kp5Yf3gqIPTjj+A52MRtnkUpTKiCo7rbzDtnzVllkha1FoV27sN
 XRvAPNgW43aACoHlaRdISMAr/Q==
X-Google-Smtp-Source: AMrXdXu+qZ79UaiIi9fB8q9zgE864/BrT4A7HXZ3JRhyGLpw7KkMcEnaFBxgrbP2oUdKUB6eoTKR/g==
X-Received: by 2002:a05:600c:35d1:b0:3d3:58d1:2588 with SMTP id
 r17-20020a05600c35d100b003d358d12588mr53288995wmq.41.1673433719242; 
 Wed, 11 Jan 2023 02:41:59 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 q6-20020a05600c46c600b003d1f3e9df3csm24237019wmo.7.2023.01.11.02.41.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 02:41:58 -0800 (PST)
Message-ID: <5dab7c06-7d6a-0e8c-4618-6607df27217d@linaro.org>
Date: Wed, 11 Jan 2023 11:41:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] dt-bindings: sound: tlv320aic3x: Add optional clock
 and port properties
Content-Language: en-US
To: Jai Luthra <j-luthra@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20221230132644.6398-1-j-luthra@ti.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221230132644.6398-1-j-luthra@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 30/12/2022 14:26, Jai Luthra wrote:
> Describe optional properties for clocks and ports that were missing in
> the original txt binding, to fix warnings like:
> 
> aic33@18: 'assigned-clock-parents', 'assigned-clock-rates',
> 	'assigned-clocks' do not match any of the regexes:
> 	'pinctrl-[0-9]+'
> 	arch/arm/boot/dts/omap2420-n810.dtb
> 
> tlv320aic3106@1b: 'port' does not match any of the regexes:
> 	'pinctrl-[0-9]+'
> 	arch/arm/boot/dts/am335x-sl50.dtb
> 
> codec@18: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	arch/arm/boot/dts/imx6dl-gw5903.dtb
> 	arch/arm/boot/dts/imx6q-gw5903.dtb
> 
> Some uses of "port" still lead to warnings because they pass clocks in
> the endpoint, but that is discouraged:
> https://lore.kernel.org/all/20210205152644.GA3083322@robh.at.kernel.org/
> 
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> ---
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

