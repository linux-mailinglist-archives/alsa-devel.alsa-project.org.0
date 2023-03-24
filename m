Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C8F6C7A30
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Mar 2023 09:47:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FE1FEAA;
	Fri, 24 Mar 2023 09:46:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FE1FEAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679647628;
	bh=NTKhNHku8RfDSMfN5YHUX1RTcNyrLkuO2iYo/Xj6TRc=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QgqPz0QYE1MSWb2sCdhVfQonLSU4WUspRgxvSXMKeK/Yer+AO5wFUpoBaFW7VU/FL
	 WdDbFtBbXpFQ+wZLOxd2fqfdoYqEnS4VRP4jxKlkgo44eJjiYxWS7r2J18AMQARkJD
	 He/PYwnZ7S4BQYX0mKAxGHQ7a35DtgzqNoMe+Db0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BC9AAF800C9;
	Fri, 24 Mar 2023 09:46:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28DACF802E8; Fri, 24 Mar 2023 09:43:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 977A1F8024E
	for <alsa-devel@alsa-project.org>; Fri, 24 Mar 2023 09:43:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 977A1F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=UR7drHxv
Received: by mail-ed1-x52c.google.com with SMTP id t10so4784655edd.12
        for <alsa-devel@alsa-project.org>;
 Fri, 24 Mar 2023 01:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679647389;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9pkgFVoGeYnKQmULx6pOecqU9tc+7JcqHZ5d14Czws4=;
        b=UR7drHxvicAy96qQdewr4wFQCexEtUKU6ju3npBN4uVPNSYR+ZOULPyB9uMnMBPFLY
         V0783SQPRx9ryN73pa7jLlYm4xUbuMQQBfNKmdR4pNR4wrgbrMaDGV1wG2OI5TX9pV2z
         MEgggF3H48gxuKCw2Su1mceWGM0wYeYWEdaYr3sDVZ8CQEbatfQSQUlAebTycIBJvzvw
         h2hT/HjsaSuwD01OmwAWVbEKhmfNgefpcdrvCgdhEimlvgWIPJn7AHvxxPsDeSZIpNXk
         7FE93JCbQxJxFmrV0iVVdOPFuvapM+HlObDvX5gvX94Q1gRKvFZefWtbENlYD0bYaoCJ
         onkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679647389;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9pkgFVoGeYnKQmULx6pOecqU9tc+7JcqHZ5d14Czws4=;
        b=sb0GM7limyUS+2oIqSQkbcn6YdVnmuh5YJ4YqvjT0HBjdEy7J1FabPF5j/1TPYjoBU
         q5/ijJAPeBVc4eEMMe3rfthAExnGAEM0qPbSZ25ikuZFQNK+YJ0ra5Y4djDtnRyLpV8Y
         UWWoCpJRIZ4yDVH1WuwrpKliHvGWdm2MaMs49J8aQi1ppMHj1b243ch5dY3BrRj2rLgP
         l4xHIvQuX59hy2iuLcUIBoEgrQPDtO8kYofgPdvACsohlkuCwjpUqpZBzYgSoKRZW8pw
         46wO6KwzehDQeFYE2Woh/RmJhc3bF0jR5FIW/ZtlJzFQeK0meLR1iML3UZQGPKEV0cpp
         i4qQ==
X-Gm-Message-State: AAQBX9etufJIderAzwErwit4YJ2DT9QOXGvJUKy+pvHDXKrh7ORZzfRH
	R8dBnPJ+iwdtWZ25n6zG3oAQVg==
X-Google-Smtp-Source: 
 AKy350ZLZ/fz0EgFUogPTGYFT/PuMTQQ3UPHlR2U2XCgu/Pj11uRc1snxPkIop3+O73uw4fKPNshrg==
X-Received: by 2002:a17:907:2c78:b0:8ee:babc:d40b with SMTP id
 ib24-20020a1709072c7800b008eebabcd40bmr1728657ejc.58.1679647389713;
        Fri, 24 Mar 2023 01:43:09 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ce50:243f:54cc:5373?
 ([2a02:810d:15c0:828:ce50:243f:54cc:5373])
        by smtp.gmail.com with ESMTPSA id
 d19-20020a1709061f5300b0093198b00fd6sm9805259ejk.189.2023.03.24.01.43.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Mar 2023 01:43:09 -0700 (PDT)
Message-ID: <47b5c50f-ccd8-3333-d9d9-8cea1124ed70@linaro.org>
Date: Fri, 24 Mar 2023 09:43:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2] ASoC: dt-bindings: alc5632: Convert to dtschema
Content-Language: en-US
To: Saalim Quadri <danascape@gmail.com>, broonie@kernel.org
References: <4a553ab8-4cd3-4ce4-8225-20f43b70a5be@sirena.org.uk>
 <20230323193709.5176-1-danascape@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230323193709.5176-1-danascape@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: AICWC44JM66AJ4PT6P2BLQG4WWZYNN22
X-Message-ID-Hash: AICWC44JM66AJ4PT6P2BLQG4WWZYNN22
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, daniel.baluta@nxp.com,
 devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AICWC44JM66AJ4PT6P2BLQG4WWZYNN22/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 23/03/2023 20:37, Saalim Quadri wrote:
> Convert the ALC5632 audio codec bindings to DT schema.
> 
> Signed-off-by: Saalim Quadri <danascape@gmail.com>
> ---


> +
> +maintainers:
> +  - Leon Romanovsky <leon@leon.nu>

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

> +  - Mark Brown <broonie@kernel.org>
> +
> +properties:
> +  compatible:
> +    const: realtek,alc5632
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  gpio-controller: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#gpio-cells'
> +  - gpio-controller
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        alc5632: codec@1a {

Drop label "alc5632".


Best regards,
Krzysztof

