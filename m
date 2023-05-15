Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 695407031D6
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 17:50:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72D1C1DD;
	Mon, 15 May 2023 17:49:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72D1C1DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684165811;
	bh=MHp+GX1+z7sjB87QHeukhpxytZKwHiwi7EMfDusGU2E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WNzKlsL5Rys6PVyXrrpQ26Kbqb+420O69Pz/6/8LaYHdO5ZZtZ6IXLoDPgp/rePdJ
	 Qr+DB7fR4xSEDdTwgteJ5qPTMVEfHF65SrSZVKzA7R40IqZJaLAtVkENIMpw8BOQxf
	 ca5TLItLYYxCwLRKyhoGianEQTKp8oZNzlmEcvAQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF94BF80544; Mon, 15 May 2023 17:49:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 339F3F8025A;
	Mon, 15 May 2023 17:49:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EAED0F80272; Mon, 15 May 2023 17:49:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A56AFF8016A
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 17:49:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A56AFF8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=O+78Kgpf
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9659443fb56so2032323866b.2
        for <alsa-devel@alsa-project.org>;
 Mon, 15 May 2023 08:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684165752; x=1686757752;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kuOCDCQ4uINGloh17xpbxDK2AcWsbYuvkyT42cPN6a8=;
        b=O+78KgpflUclh0zjxfHNPcCNpqtzSLCtAlBE9xkG80phUPVBKslpp5A0Jv2xvfxMcd
         pgk+IW/1taJ6EIlCacLVRbvRCv5mX3JybYhNqFiJvhmcNOQ2AeYm/rS08w3I+EfhBO7a
         /kvknpWp5ey7BqrPSNVOEpWvdw1oBNK1896l1vVosQDEHEZdwCegVJiUjm0mgVSyBFzL
         DaJ/wmXurOBk3keeopemVbRYn4Hyetm2XxDBQFKn43QBE5g6fHE5Upfg1ImOG6VhIvfA
         T5ThgP9Bo2GsCtsxZ/dY/RFH3YO9YfcY1xxNDyY9cxVNkF7qlMprqVxbUMJtBMr/Ysc4
         dvww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684165752; x=1686757752;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kuOCDCQ4uINGloh17xpbxDK2AcWsbYuvkyT42cPN6a8=;
        b=cd81pZOFkbe9PnNFWT0YzWaJsjNrPwio5mrmS1HAzhUY6UH3EHdMofmkrEz3bITIFH
         2ZWUb1Rs+d66Y5JlJ9bAMZeopz8x7R4DY3emUZpizHpE+eOCL3Z4hfp3+6GmtEptSoYd
         2ihtni38rZWSgiXwnYGxj4/zFVbDNZm+94HUe5J5b8ByU9KKh2vg15W0c4ZPIXOvBL2G
         kmPin802h7h8kO1EBXyTiWFJYtEBsEnuBQeO7k6Rm2boxo0JH0dAj7p54XuMzYppbW9J
         RmtjzssV4HIeC9AgsL10IjAOBrlivOc51i2VmVz79mgyVSjoKuX84wmyuO7HzZVEavML
         3e9w==
X-Gm-Message-State: AC+VfDwlH6KsK7da8Tf4CmaVxGBB8eFJ+3iSJPWwgJTFI9cZUI9jyuP7
	HubP8Q/H1NEi/+C4UQpSFxRKYBzpMVhkescdTSI=
X-Google-Smtp-Source: 
 ACHHUZ4Nr88M1lwj1aXZZ/iZMf/swEizt4nguAp5wUyPAk7yNMOTEYXJ4r0IoPj396w6FVjy3qisIQ==
X-Received: by 2002:a17:906:c14f:b0:94d:a2c2:9aeb with SMTP id
 dp15-20020a170906c14f00b0094da2c29aebmr36793720ejc.49.1684165751836;
        Mon, 15 May 2023 08:49:11 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:6470:25b8:7c2d:1992?
 ([2a02:810d:15c0:828:6470:25b8:7c2d:1992])
        by smtp.gmail.com with ESMTPSA id
 ta26-20020a1709078c1a00b009663b1addb0sm9679862ejc.224.2023.05.15.08.49.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 08:49:11 -0700 (PDT)
Message-ID: <15dfe603-7d77-9dbe-30b6-b79fb7334682@linaro.org>
Date: Mon, 15 May 2023 17:49:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] ASoC: dt-bindings: ssm2518: Convert to dtschema
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 alsa-devel@alsa-project.org
References: <20230514225243.777504-1-marex@denx.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230514225243.777504-1-marex@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 7W3J5J6KP2PSY4MN3AYEZMLACD3W4U5M
X-Message-ID-Hash: 7W3J5J6KP2PSY4MN3AYEZMLACD3W4U5M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7W3J5J6KP2PSY4MN3AYEZMLACD3W4U5M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 15/05/2023 00:52, Marek Vasut wrote:
> Convert the ADI SSM2518 audio CODEC bindings to DT schema.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Lars-Peter Clausen <lars@metafoo.de>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: alsa-devel@alsa-project.org
> Cc: devicetree@vger.kernel.org

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

