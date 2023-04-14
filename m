Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD59A6E28E4
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Apr 2023 19:01:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6504AE0F;
	Fri, 14 Apr 2023 19:00:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6504AE0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681491697;
	bh=EpRs9AqAbTQgpLnxdBaxjv1vf5EDo1XTlYCCeeDPAqw=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hUupGX5BNP3sfr0dkBBvKCdcNZO24zNbH/FqafU4j1J7E9stl1vsvnfUPz8mBThUY
	 but4DHt1ReN2O04Z+/NUUrANo8R9ucKGzwwTLaMb/kzHCjyo5l/w9Z30lrYdstqLTE
	 ctCVgxqA1ht2mGESVICkudtMiCSiIs7NkX0INF+k=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D974F8025E;
	Fri, 14 Apr 2023 19:00:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18F7EF8032B; Fri, 14 Apr 2023 19:00:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BD195F80100
	for <alsa-devel@alsa-project.org>; Fri, 14 Apr 2023 19:00:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD195F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=CR9QspsC
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-504eb1155d3so12707655a12.1
        for <alsa-devel@alsa-project.org>;
 Fri, 14 Apr 2023 10:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681491638; x=1684083638;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fcVz7CUgiYkhjPKrULZ6Y+Q6MNzNGZWZZ2qZp+hF1YE=;
        b=CR9QspsCWtzKNvqnQ603pmM+6l4HqsfihOi5xyoIaanOI9D3sVSROgtrnxCxF6AvgW
         jAbr1g3t77RA2eMuIzUbIQd6mPR8SZDNu8DoPo13zJ4k4qGZIa4M+SzZmIixtnc+7Xvm
         bhXQMZibQ9v3ll1MzCkGynzn0HI+/8lLWEerhhF7jcV6w/B9nD5zFIvrKzt9NDlX5t9Z
         koRDQPEHGqKbL0nu/hKLJ0J/sYf3LKaaL9wFszBsaUSbUJcXlSaQwWY1h0ixGP0PitcT
         D2SUFetjeyaSW+cCVsX7lq2iMwREmwlTN+Jb9W29Qy09+ZWgNwLNLSvDuHMgZ3kI9DWU
         NVFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681491638; x=1684083638;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fcVz7CUgiYkhjPKrULZ6Y+Q6MNzNGZWZZ2qZp+hF1YE=;
        b=VBuqtQtHMeHXqbPtT/t7+FR3/GKwqeaL/TRfaMnPP2aO1Bf/L7ZOxYmpyNAGBh4sJn
         puAOLN7me1v+mEmKY2uiS1aUGfA4gPSPOTI99BRZgvPdMZ9ZobVJMv43vBMQX1YM3Kh+
         Gj78/49DYN+7OoGFCnO+0TH732K61m6wS5OApg9KZuUvNNfriAe614uYk+MvTtTzzE5E
         7udLOFiycQPU/W5KA4QV5Yx5VWLYMnd4SZdl1G6seFB48an3N6uAOl6yRkDL205q3s+T
         wuM+NYb1DxzS/0bHRq2WilbI01lAqqtsphyha1xgnrKyX9FwlRtL4+0t5YslyZFX76gO
         526Q==
X-Gm-Message-State: AAQBX9ep06B48ud1YY5T/g9YwrJshup4OChZ/WXiybMvteRGnfThyauB
	J/r1uXqJlEnnsIOYhX3nsl8STA==
X-Google-Smtp-Source: 
 AKy350ZZUwNYw/gqt4ucoxJgVdnUzPsq4LA6OmDG8VF20owwn2Du/lQmxZOGY6pXpqgffpIDOkScGA==
X-Received: by 2002:a05:6402:653:b0:501:fe46:480b with SMTP id
 u19-20020a056402065300b00501fe46480bmr6234787edx.15.1681491637856;
        Fri, 14 Apr 2023 10:00:37 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:39b7:81a0:bd41:17b1?
 ([2a02:810d:15c0:828:39b7:81a0:bd41:17b1])
        by smtp.gmail.com with ESMTPSA id
 i25-20020aa7c719000000b00504ae3a5adfsm2345714edq.2.2023.04.14.10.00.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 10:00:37 -0700 (PDT)
Message-ID: <5544de12-396c-29d4-859c-a6e17b2e2de4@linaro.org>
Date: Fri, 14 Apr 2023 19:00:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 2/9] dt-bindings: ASoC: Add chv3-i2s
Content-Language: en-US
To: =?UTF-8?Q?Pawe=c5=82_Anikiel?= <pan@semihalf.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org
References: <20230414140203.707729-1-pan@semihalf.com>
 <20230414140203.707729-3-pan@semihalf.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230414140203.707729-3-pan@semihalf.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5NQ7XREYC4ZSS25VPGECEOR4ZDEBP22B
X-Message-ID-Hash: 5NQ7XREYC4ZSS25VPGECEOR4ZDEBP22B
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dinguyen@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
 upstream@semihalf.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5NQ7XREYC4ZSS25VPGECEOR4ZDEBP22B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 14/04/2023 16:01, Paweł Anikiel wrote:
> Add binding for chv3-i2s device.

Your subject needs improvements:
1. ASoC goes before bindings
2. You miss some meaningful title of device. "chv3-i2s" can be anything,
so add Google or Google Chameleon. Or use entire compatible.


> 
> Signed-off-by: Paweł Anikiel <pan@semihalf.com>
> ---
>  .../bindings/sound/google,chv3-i2s.yaml       | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/google,chv3-i2s.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/google,chv3-i2s.yaml b/Documentation/devicetree/bindings/sound/google,chv3-i2s.yaml
> new file mode 100644
> index 000000000000..6f49cf059ac5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/google,chv3-i2s.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/google,chv3-i2s.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google Chameleon v3 I2S device
> +
> +maintainers:
> +  - Paweł Anikiel <pan@semihalf.com>
> +
> +description: |
> +  I2S device for the Google Chameleon v3. The device handles both RX
> +  and TX using a producer/consumer ring buffer design.
> +
> +properties:
> +  compatible:
> +    const: google,chv3-i2s

Missing blank line.

Is chv3 the name of your SoC? Where are the SoC bindings? What's exactly
the versioning scheme for it (compatibles must be specific, not generic).

> +  reg:
> +    items:
> +      - description: core registers
> +      - description: irq registers

As well...

> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2s0: i2s@c0060300 {
> +        compatible = "google,chv3-i2s";
> +        reg = <0xc0060300 0x100>,
> +              <0xc0060f00 0x10>;
> +        interrupts = <0 20 IRQ_TYPE_LEVEL_HIGH>;

Isn't 0 also a known define?



Best regards,
Krzysztof

