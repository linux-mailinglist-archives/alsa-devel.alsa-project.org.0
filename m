Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B73766C1F
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jul 2023 13:53:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E73683A;
	Fri, 28 Jul 2023 13:52:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E73683A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690545179;
	bh=GLxhCLN958sLz7I4UiXLmkVWb11HfneVtq5s/4JjN1k=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=t/BzS7+nodzcnqwzDOti2uFKqSLp8+wTWto3uXYoh0hegLMXt7lFVkBtb+AndPtzV
	 mTUVuSH72ViCAuSUpKJ3mDptE8uFVUGJyLfri2+zJTH6FnEOZgvdyeaWaVApqpynW/
	 dG7Y/9A0cWCbF41xDaoWv8dWfE2sgvF+Dfwd0cIs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1DFF0F800C7; Fri, 28 Jul 2023 13:52:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D833F80163;
	Fri, 28 Jul 2023 13:52:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D888F8019B; Fri, 28 Jul 2023 13:52:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 172C4F800C7
	for <alsa-devel@alsa-project.org>; Fri, 28 Jul 2023 13:52:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 172C4F800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=WMx/k6Y0
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-99bc512526cso293970266b.1
        for <alsa-devel@alsa-project.org>;
 Fri, 28 Jul 2023 04:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690545121; x=1691149921;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BvHmDWI+Z1sZthByOc6xsTAB3PUIVD4/Hl2iZRstsXk=;
        b=WMx/k6Y0UO+xP947DsS3nk2e3uQ2WO0K6wGnfok03aZO00u8Rrt9H2YJhy3SyBGcvn
         3mNYi8S1NDkM8nh0QvfiguxNsdMLFq7dxp3M/LQ94KjEuWyvb8u4MJvDrt3giY+mIjVz
         JlbDi0jVE3xt5lCo3FGaRXUdoPTHhXqxXifGbM/QB/wtM9cTHFY2FlRBmkXpQ00ArYz4
         spXCVwnSBmAIJaw8gmunzeO6LO8zEVgbg50R6xc8+7tPscOn4LxTmyzSC5X2Hb+obMf7
         09iewzervfaJZstxUf31Zvtqv+pKknzp0EwPunp+uiU2WoAXjLcwqaWhpsJMhKEnBHko
         9wnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690545121; x=1691149921;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BvHmDWI+Z1sZthByOc6xsTAB3PUIVD4/Hl2iZRstsXk=;
        b=Pw8h/5lV1akAsONgLM99AEz0YOESha6gO/9ukCPhR2uJp1qWU+YYralrYS5l66rlpe
         xYx6uqpaiVXmXqpvOMNGJUEiMILMmZdUgmElPd2lVqlIGohcdVjdr+j7unWxIPFpcFHa
         Kx+mO6cpV0+rFprBmkzN0FQ7BCo+gLG4HGI08e7sPzdmrSeFdMK6VfU56UnyowfqOH4l
         GpLeSMz7LGOwU+wjy16V6H9joFjjKLSubp5XQ3TYUtPVmjQ9IOOCs9HZTkgcntmpM52M
         VqtZArRoar53aafZhYMNcYkEpeRd0lk09YsczrOqn4Db6zUVNIBnTkLBwGgl4AOHG0Hm
         vFyg==
X-Gm-Message-State: ABy/qLblYo2bPymyyPSkWcwgWNragloPhRyM4xhYvWZNwsFB26MqOqBC
	LTJSQ8BLbhAhzUQ9S9UhICNGEA==
X-Google-Smtp-Source: 
 APBJJlH9qI7jXlv52GPyqy9+/LW6P7b3oJDxWS42A/a851ZkhtJdyACEZFuQUlrRP1Krxg9TlTYfQg==
X-Received: by 2002:a17:907:7633:b0:99b:c038:fdac with SMTP id
 jy19-20020a170907763300b0099bc038fdacmr1839010ejc.20.1690545120813;
        Fri, 28 Jul 2023 04:52:00 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id
 mf25-20020a170906cb9900b0099251a40184sm1972601ejb.99.2023.07.28.04.51.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 04:52:00 -0700 (PDT)
Message-ID: <1d1ec200-1d76-1485-4eac-19601aa3e67b@linaro.org>
Date: Fri, 28 Jul 2023 13:51:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 26/50] dt-bindings: atmel-classd: add sam9x7 compatible
Content-Language: en-US
To: Varshini Rajendran <varshini.rajendran@microchip.com>,
 claudiu.beznea@microchip.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230728102740.266612-1-varshini.rajendran@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230728102740.266612-1-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: UFMLG7FYA4Z42V6BL4HZMQV6ETS2Q65O
X-Message-ID-Hash: UFMLG7FYA4Z42V6BL4HZMQV6ETS2Q65O
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UFMLG7FYA4Z42V6BL4HZMQV6ETS2Q65O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 28/07/2023 12:27, Varshini Rajendran wrote:
> Add sam9x7 compatible to DT bindings documentation.
> 

Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching.

> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  .../devicetree/bindings/sound/atmel,sama5d2-classd.yaml    | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/atmel,sama5d2-classd.yaml b/Documentation/devicetree/bindings/sound/atmel,sama5d2-classd.yaml
> index 43d04702ac2d..ae3162fcfe02 100644
> --- a/Documentation/devicetree/bindings/sound/atmel,sama5d2-classd.yaml
> +++ b/Documentation/devicetree/bindings/sound/atmel,sama5d2-classd.yaml
> @@ -18,7 +18,12 @@ description:
>  
>  properties:
>    compatible:
> -    const: atmel,sama5d2-classd
> +    oneOf:
> +      - items:

No need for items here.

> +          - const: atmel,sama5d2-classd
> +      - items:
> +          - const: microchip,sam9x7-classd
> +          - const: atmel,sama5d2-classd

Best regards,
Krzysztof

