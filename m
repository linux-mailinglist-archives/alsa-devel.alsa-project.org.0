Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCB774FEAF
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 07:27:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 245DF1F1;
	Wed, 12 Jul 2023 07:26:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 245DF1F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689139624;
	bh=Zfl8zPfBgGI9blZYpWqyp043xx3Va+UAjsXiy+wF0Pg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mxU9n6cDE7jJdem2crpVV6i2kFI8ceCP5I3M5qLY3PrleZ4gUART1lLnFTi8J8MvE
	 ZNf28b1D1A0I4NyXKwNPuurNny+YK3KMcSusVgu8AcoPXAqn8wva5wI5JJCEk0gZET
	 Hp1Du/KUhygXZIIb7zYY+yqcN6zp20biy0Mx9Otc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7269BF80236; Wed, 12 Jul 2023 07:26:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 21878F80236;
	Wed, 12 Jul 2023 07:26:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D690F80249; Wed, 12 Jul 2023 07:26:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CC3D2F80093
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 07:25:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC3D2F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=LNTsca7L
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b6a084a34cso100660101fa.1
        for <alsa-devel@alsa-project.org>;
 Tue, 11 Jul 2023 22:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689139558; x=1691731558;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AK4eb7KoL8ndmCPLluj+EXz7PDkhjxyHzXKMz5A/aGE=;
        b=LNTsca7LfYc7UmuC05LHt7V+LYFMGnX7TjiIjqBrGFlds42YrhoVki5mAffAjYjga+
         mjnwnc5Uwuf2zAtW/7Las4tscJg6LZSDxa49UnP5UUeQ7eNq8gPlC2TWiGD0sZCcPNoo
         E0eo1+bF97Qf8uGYolSBxZVPSV97+9KGPEboAlFQ/9tc2aGCaGj9IgYqmhQphJGox23c
         5V2d0Q270czKJpZhg1UEbWsO84+8gRLAoQKB+cU0aEIonhrqEJJC33fbK5LbkPhc9Q3i
         Lg+mPl2eirurAYV9cs6fErGzsuFz89sL5p5S2BoP5KlzIWMEUaAwjnjxUFgyznRK/Gj5
         5Gbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689139558; x=1691731558;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AK4eb7KoL8ndmCPLluj+EXz7PDkhjxyHzXKMz5A/aGE=;
        b=fmkzinP2s2u+lT/bevqwo+JAfKL9piAsexuIVnRJghmL2djWlIwtsfN6PVROZyGP1X
         VYElILaLFhe4dJcrecIpZw8wGT+0SAnPA/w4eSOk4e1Q9FRw1rJ6qsGRkm21J93/6AxP
         bypYUKAJwmegmrNcr1onjxwTfdJO3myN41DFQ9yzwg3MPoKxn7ftmb7pKXBzV0/kWdkA
         HnhidgPJI2gPda2BDSpqWCpP8YCqgTnJPusGaXZsgPKZMWvKV0ibV2Rg8uYvYBdyUxgb
         dymc1gMCZ4WYV25y34wqz4iDoiSt8zL9l3byBjFCwCIkFrNc5LgNoAITn/OA5b9D74eh
         tfKg==
X-Gm-Message-State: ABy/qLYyY+XIrot29BGRDeynA1+lnO8ERxMKCkSDFvPd2Th8wTeaBz2S
	9kV9VS0eKaw3u2OK/15ljI2Y2Q==
X-Google-Smtp-Source: 
 APBJJlHtrGyx7YwUFhU7r6vqVS9mppAzhhjskmPXgB60TsCyGLrwu57v+FF1PLGFyf4SFUkcfG2jjg==
X-Received: by 2002:a05:651c:112:b0:2b7:3b73:2589 with SMTP id
 a18-20020a05651c011200b002b73b732589mr400249ljb.32.1689139557117;
        Tue, 11 Jul 2023 22:25:57 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id
 u17-20020a170906069100b00985bdb7dd5fsm1986826ejb.201.2023.07.11.22.25.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jul 2023 22:25:56 -0700 (PDT)
Message-ID: <a7761c1e-9327-38f7-8e7b-0b3c3007668e@linaro.org>
Date: Wed, 12 Jul 2023 07:25:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1] ASoC: dt-bindings: Add tas2505 audio amplifier
To: Kevin Lu <luminlong@139.com>, broonie@kernel.org, lgirdwood@gmail.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 tiwai@suse.com
Cc: kevin-lu@ti.com, shenghao-ding@ti.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230712044006.48456-1-luminlong@139.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230712044006.48456-1-luminlong@139.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: IS7PE4HGAFLGGOJOQIIWIPJCNLXVPEEQ
X-Message-ID-Hash: IS7PE4HGAFLGGOJOQIIWIPJCNLXVPEEQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IS7PE4HGAFLGGOJOQIIWIPJCNLXVPEEQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 12/07/2023 06:40, Kevin Lu wrote:
> Create tas2505.yaml for tas2505.
> 
> Signed-off-by: Kevin Lu <luminlong@139.com>
> ---
>  .../devicetree/bindings/sound/tas2505.yaml    | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/tas2505.yaml

Filename like compatible.

> 
> diff --git a/Documentation/devicetree/bindings/sound/tas2505.yaml b/Documentation/devicetree/bindings/sound/tas2505.yaml
> new file mode 100644
> index 0000000..6cc3fe4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/tas2505.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2019 Texas Instruments Incorporated
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/sound/tas2505.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"

Drop quotes

> +
> +title: Texas Instruments TAS2505 Mono Audio Amplifier
> +
> +maintainers:
> +  - Kevin Lu <kevin-lu@ti.com>
> +
> +description: |
> +  The TAS2505 is a mono Class-D speaker amp that supports both Digital
> +  and Analog inputs. The device is ideal for automotive instrument cluster,
> +  emergency call (eCall), and telematics applications. Direct I2S input
> +  removes the need for an external DAC in the audio signal path.
> +  An on-chip PLL provides the high speed clock needed by the DSP.
> +  The volume level is register controlled.
> +
> +  Specifications about the audio amplifier can be found at:
> +    https://www.ti.com/lit/gpn/tas2505
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,tas2505

Why are you adding duplicated binding?

> +
> +  reg:
> +    maxItems: 1
> +    description: |
> +       I2C address of the device can be set to 0x18.> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: GPIO used to reset the device.

Drop description, it's obvious.

> +
> +  clock-source:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Sets TDM clock sourse.

source, but anyway that is not the way to set clocks. Use "clocks"
property for your future bindings.

> +    enum:
> +      - 0 # Select MLCK
> +      - 1 # Select BLCK
> +
> +  '#sound-dai-cells':
> +    # The codec has a single DAI, the #sound-dai-cells=<1>; case is left in for backward
> +    # compatibility but is deprecated.

This is the first submission so there is no "deprecated" or "backwards
compatibility".


Best regards,
Krzysztof

