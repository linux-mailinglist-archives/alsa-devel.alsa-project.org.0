Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3866173DDE5
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 13:40:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 198DFEB3;
	Mon, 26 Jun 2023 13:39:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 198DFEB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687779603;
	bh=fdYBSRFqS/K9El7Owb6Yi58KjFTsYXDwXY5TjFcYrQE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AJcOQWGJHP0mzltJWUty6TLmIQB429pp2PR1HfIrpH9QXOJ/UUfr7XUBfiYSnfcXx
	 DsboZiP+NXIuRFiwcijto7aGdt6Drkpqnv9beCv0G6RCycEDW0Hdty2mt9q/I9EN3Z
	 boRqYA+jozhOAnUIzbF49+eRP/BTeEopQMAJ+c2U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E51AFF807B5; Mon, 26 Jun 2023 13:29:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 497E2F80794;
	Mon, 26 Jun 2023 13:29:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5374F80141; Sat, 24 Jun 2023 10:01:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B4B75F80130
	for <alsa-devel@alsa-project.org>; Sat, 24 Jun 2023 10:01:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4B75F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=F3QDL4q8
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-98e0c1d5289so2154666b.2
        for <alsa-devel@alsa-project.org>;
 Sat, 24 Jun 2023 01:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687593702; x=1690185702;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9HaHZDehClxR9T/qxmaslajrl1EPqKVL0R9NY/jGTsg=;
        b=F3QDL4q8VywBoEOgLA003XEmcfdYtm3Ea0matX93IHzoJEv8hWPz4+c37arSFLlHPJ
         KJiKcZZsCJW3EISQa/0WZr7GmFkHehvHcqCTL77aPrpRtf7wWxpMpUHHteIIi/i6WgrA
         P+PyBeA1xhafgy3H/e2UWInSjheEjPAhT1BMP3IiTNbjmRYdvtR5v1zPluKBxz0S3DCW
         wy2fTJI3bg3cbA/DNbDMu9pAzD0bF/mNG4WsH3QsxXMLCCGLPK6NC8MJ9l8TNSf1hLUM
         58xmuXiAu9nxjdyxt5KPAyhabLHOsvTKYI7E3U6I1s7LAWe0FlD5wup3cDa7Ngf3ArIy
         5drQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687593702; x=1690185702;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9HaHZDehClxR9T/qxmaslajrl1EPqKVL0R9NY/jGTsg=;
        b=d22GKbsrY0UHy5hxYEFvrb34Y9VcK7MTN9nDSINsqC+yjlSZV8ZE4lNS0gv6hv8sIh
         AI3OhQsBnLzRZXfaatpLselb1XXaZero+7WNVzlBjOrRLErQUGPPdvssBpSi8r4DDgPl
         XmK4sdmqO5Bi9W3/kXp2bEynNvCHU/xc+edepwzW1cdKxyc0c5NKmUFlihp7pxTlzH3q
         TvKpVTYORmMxXFYFbHxr0POsCRK7feJOf2GVlOsKI0KzwhK6i0wM7ugZWWceDbkbQ0WJ
         QGpAgaBmjBA49QCkjLQaLlOi/NJG9IBhwkB1+iOZJ1jcyFoKkc5WUs8ajZXsvhctWMTO
         I2cw==
X-Gm-Message-State: AC+VfDzXwlyeKHIDtReH4dkEhRcHZf0GgV/kaXYBKSPScbC6kC1yL4Jh
	cQU61TsgHlnKF3yxA+TpIa7fvg==
X-Google-Smtp-Source: 
 ACHHUZ7LZUuSsLPmwaJcMGBzTaxcrMKmP11V5Fuvqcxhksu+1Vgcylqr7l5RCc1ndNOBQHLG9wFOKg==
X-Received: by 2002:a17:907:3f18:b0:978:6e73:e837 with SMTP id
 hq24-20020a1709073f1800b009786e73e837mr23104557ejc.4.1687593702085;
        Sat, 24 Jun 2023 01:01:42 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 qh15-20020a170906ecaf00b009885462a644sm587108ejb.215.2023.06.24.01.01.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 01:01:41 -0700 (PDT)
Message-ID: <44780d35-5c90-7195-1dc6-019e54944af0@linaro.org>
Date: Sat, 24 Jun 2023 10:01:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 27/45] dt-bindings: rng: atmel,at91-trng: document
 sam9x7 TRNG
Content-Language: en-US
To: Varshini Rajendran <varshini.rajendran@microchip.com>,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org,
 tglx@linutronix.de, maz@kernel.org, lee@kernel.org, ulf.hansson@linaro.org,
 tudor.ambarus@linaro.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linus.walleij@linaro.org, p.zabel@pengutronix.de, olivia@selenic.com,
 a.zummo@towertech.it, radu_nicolae.pirea@upb.ro, richard.genoud@gmail.com,
 gregkh@linuxfoundation.org, lgirdwood@gmail.com, broonie@kernel.org,
 wim@linux-watchdog.org, linux@roeck-us.net, arnd@arndb.de, olof@lixom.net,
 soc@kernel.org, linux@armlinux.org.uk, sre@kernel.org,
 jerry.ray@microchip.com, horatiu.vultur@microchip.com,
 durai.manickamkr@microchip.com, andrew@lunn.ch, alain.volmat@foss.st.com,
 neil.armstrong@linaro.org, mihai.sain@microchip.com,
 eugen.hristev@collabora.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-pm@vger.kernel.org
Cc: Hari.PrasathGE@microchip.com, cristian.birsan@microchip.com,
 balamanikandan.gunasundar@microchip.com, manikandan.m@microchip.com,
 dharma.b@microchip.com, nayabbasha.sayed@microchip.com,
 balakrishnan.s@microchip.com
References: <20230623203056.689705-1-varshini.rajendran@microchip.com>
 <20230623203056.689705-28-varshini.rajendran@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-28-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: SS5IFDOKAW2A765OTBCYDKMEWSMYGA5T
X-Message-ID-Hash: SS5IFDOKAW2A765OTBCYDKMEWSMYGA5T
X-Mailman-Approved-At: Mon, 26 Jun 2023 11:29:26 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SS5IFDOKAW2A765OTBCYDKMEWSMYGA5T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 23/06/2023 22:30, Varshini Rajendran wrote:
> Add compatbile for Microchip sam9x7 TRNG.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml b/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml
> index 3ce45456d867..7e4dbf5e22b4 100644
> --- a/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml
> +++ b/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml
> @@ -17,6 +17,7 @@ properties:
>        - enum:
>            - atmel,at91sam9g45-trng
>            - microchip,sam9x60-trng
> +          - microchip,sam9x7-trng

Same as in other cases, so just to avoid applying by submaintainer:
looks not tested and not working.

Best regards,
Krzysztof

