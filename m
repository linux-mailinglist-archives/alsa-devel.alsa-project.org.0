Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5127B6FD80A
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 09:20:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54DA2F30;
	Wed, 10 May 2023 09:19:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54DA2F30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683703248;
	bh=WSM6LkjBWXsgTwPoWRQ5SO0bJczrCBJzfjRs//FLS8c=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EcYMSvODgAHFFGAYQAjQRB6KhACVj3ipaXol52hK18ya71qA7z7yWQKXvep6ZpJO1
	 Qh1AR8bQ4npuDauWxXApGzuTdO1ygOa7fzcMaWJeNmcT1sOazvAe+Vh1+RPQv55WKg
	 IUIlC8D9Z1HHnJadvYib89P8MWlYy8wn+x52wo4s=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 09D53F80310;
	Wed, 10 May 2023 09:19:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1B7CF8032D; Wed, 10 May 2023 09:19:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DDDE0F80087
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 09:19:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDDE0F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=P42meyip
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-50bc456cc39so10307954a12.1
        for <alsa-devel@alsa-project.org>;
 Wed, 10 May 2023 00:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683703186; x=1686295186;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nmk9cMa7ZRPEfm1fw5sH2d5n1idTxrKBeSjk+/HBhWs=;
        b=P42meyipf8VOG/pKzXra8EVr67CRItb1ph2/JDLH95HKs2fMGO4ZiK9Ch8I1XjaPxc
         /5X04HySCOF5asSHuT/iaYeHOwhWFB5SdORkRoU1pmeToi6Zjv6Qfb1Tyq1CA6UL0A7a
         9iVDEXuaUjtCpwD6VvSiQ1dg0Gm71Woln2wLe0FatEKVgS3zvgf+sI214WZIOYBW3IuI
         q/stepndCNY7B6CyeBOAMwFtC5SqCpsTqnfr0qPK33zwqbwMlZqick3kVNuefrgct8Wk
         5QyBQI5EG5Q03qCoKts7t+Z6ILzUdxTUD8GQ6Q+4qTl3yig0vfDTTo8Zh6SPXL+mDVEg
         E5kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683703186; x=1686295186;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nmk9cMa7ZRPEfm1fw5sH2d5n1idTxrKBeSjk+/HBhWs=;
        b=JHmSzN274wT4kJAHNRYXCcZprNp34xfzAE3QkgthH4RglHOSTIUFzs1QcTk0J3ZTrS
         SCfO4xRw74SEdXP8VOLGcvGC+qbwU3kBur/ua2rYBD8fxXeVHDBRfeka1IJiVy44jBRJ
         hoBB2Y9OEIcmW/M3bzQOlaV2BMHotVKNp8P3QXYOvAdPENDBNEDcZ1An9FEHV2JLXadI
         KVJby65tgvExni0P+HMgXeg7WItEZueSLroITIn0dMjh62z3FZrCI3GFfJWT+upflatk
         wvtADlJlVj9dd3zHdi+5Mm+QHnEPFiZxdnXH9QphDtrT028M4F3e5E7hZdyoUUhP2AbU
         qpPA==
X-Gm-Message-State: AC+VfDylfkw6mooahPCL9f6vKjGimrlS8xWBuhs3+k8PYyYjU3s3olXT
	Cwd44aOiSJlDUh4lQLaAHEneDQ==
X-Google-Smtp-Source: 
 ACHHUZ5DYEVKbOYN6RVK0i7fXzSsO6CHPkNIwqoHnsmdzIZ9WCqCjfwODWwJgwPKZxwgIu0xCeB93w==
X-Received: by 2002:a05:6402:203b:b0:505:48c:3266 with SMTP id
 ay27-20020a056402203b00b00505048c3266mr13269966edb.20.1683703185740;
        Wed, 10 May 2023 00:19:45 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c175:a0f9:6928:8c9d?
 ([2a02:810d:15c0:828:c175:a0f9:6928:8c9d])
        by smtp.gmail.com with ESMTPSA id
 y12-20020aa7c24c000000b0050bf7ad9d71sm1566197edo.10.2023.05.10.00.19.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 00:19:45 -0700 (PDT)
Message-ID: <39afb004-5f28-2633-a8be-412cb5e74404@linaro.org>
Date: Wed, 10 May 2023 09:19:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] ASoC: dt-bindings: nau8825: Convert to dtschema
Content-Language: en-US
To: David Lin <CTLIN0@nuvoton.com>, broonie@kernel.org
References: <20230510034409.585800-1-CTLIN0@nuvoton.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230510034409.585800-1-CTLIN0@nuvoton.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ZABX5ZMO5B6QJUT43GZMPTSWS4NVTOGR
X-Message-ID-Hash: ZABX5ZMO5B6QJUT43GZMPTSWS4NVTOGR
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, YHCHuang@nuvoton.com, KCHSU0@nuvoton.com,
 WTLI@nuvoton.com, SJLIN0@nuvoton.com, ctlin0.linux@gmail.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZABX5ZMO5B6QJUT43GZMPTSWS4NVTOGR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10/05/2023 05:44, David Lin wrote:
> Convert the NAU8825 audio CODEC bindings to DT schema.
> 
> Signed-off-by: David Lin <CTLIN0@nuvoton.com>
> ---

Version your patches and provide changelog after ---.

If you just send the same with the same mistakes, that's a NAK.

>  .../devicetree/bindings/sound/nau8825.txt     | 111 --------
>  .../bindings/sound/nuvoton,nau8825.yaml       | 242 ++++++++++++++++++
>  2 files changed, 242 insertions(+), 111 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/nau8825.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/nuvoton,nau8825.yaml
> 


> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        nau8825@1a {

This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Thank you.

Best regards,
Krzysztof

