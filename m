Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C456C7D78
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Mar 2023 12:49:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81F32E9D;
	Fri, 24 Mar 2023 12:48:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81F32E9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679658587;
	bh=VATGXUTmUw6CTfNa3Ft9rX5iAC5L7yBtXq2J2ASU+l0=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FtUYcpGLB7LMnVs/PwRBBYeM7tkCjL4imtdmx+c4clhwqO1r5V6RRy6iESorDHadw
	 +XMTgVwp+/rNTS9MXIqsweBWEasji/j/+PE9uIsvc1VCk3zXtKwRch/HJmHz/ETE48
	 7v5l3n8N1JmsgTACGxV52a9++SNdLw13ETj1xb3Y=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AED2F8024E;
	Fri, 24 Mar 2023 12:48:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E3B6F802E8; Fri, 24 Mar 2023 12:48:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0B2CAF8024E
	for <alsa-devel@alsa-project.org>; Fri, 24 Mar 2023 12:48:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B2CAF8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=rI+XgDA/
Received: by mail-ed1-x536.google.com with SMTP id h8so6855950ede.8
        for <alsa-devel@alsa-project.org>;
 Fri, 24 Mar 2023 04:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679658525;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e8LtNo9O+N2urrNpkv74xPVkcVBPtljyRPq/ezfzVBE=;
        b=rI+XgDA/H+XuKYBqgGmgj0mj37fzfUDe7gDew0ugQBK+ayvpgkpx0sKAgfpQrVgVPc
         2ioMJcGrktbmW2Lv37II6n2IDGxydQIqCzQjcaag2dpAGzpm7WrrowwTJH57ajwq382f
         ZD+mKdkJhlJM9gueKNoCXDDh59imz8rUhYn/NiO1k3q3jZeoseDkK58MkhaDuAIW/UEZ
         obz+ZnJAzSNBTr8fOcquo3Ok15UO5YW75gr3WgVyYoD6NRmuCfUXz1QhFyVPP62Ofb91
         lSQ7khRiYqgksVeyH8fOWS9NJIQaARz1RQsVvrccon3nTti/TygLjD1/Ducxw2gm1ITK
         rFAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679658525;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e8LtNo9O+N2urrNpkv74xPVkcVBPtljyRPq/ezfzVBE=;
        b=iiDSOVIn2ld6NZ5CAG9E1CPKgE6FDiScy20WvlmZlV9e9xhT/ooEJ41B1oeJ6V3v09
         fyFgQKenDZQtoL1bWdTGr5nONsT5jB+0BhI8R9UeezIU0LWiU50FHz3fJRWaPtCHm8Uv
         jEI08YLy43B0Tzh3zGPEvniFSHnVa0fOKxa25bK3Q/u0+U1kmyj5mstFNWSPdEekRrHH
         59RetE9YhbY4FkexVaV/5wqsv5fWdgnccp8guEBp95OFtRRA3tG04gH8NPzMgPpCUnZt
         u6bpUkuwAWYpI7XcPNsFBDeeDs4CUt5Vc8j8sSRp1JIF/n77sSALgmBKeSeFQdKs8llm
         AoMA==
X-Gm-Message-State: AAQBX9d/XdtzMzGnt1rZhP7mXND0vKmVXjyF6GI6fPZMoUlpV5xUqnH5
	tvlc1J4cklTDU2Ugd4td2kdA4Q==
X-Google-Smtp-Source: 
 AKy350Y+nkI7+I9GQMdFtSG2iD87jfm69SH6LIPv9KX3N+Z4mg0ptJ3fVUsTNB68LSUeqAJXiOf4tA==
X-Received: by 2002:a17:906:580b:b0:931:20fd:3d09 with SMTP id
 m11-20020a170906580b00b0093120fd3d09mr2415525ejq.17.1679658524922;
        Fri, 24 Mar 2023 04:48:44 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:3027:fb0b:ae08:588?
 ([2a02:810d:15c0:828:3027:fb0b:ae08:588])
        by smtp.gmail.com with ESMTPSA id
 y12-20020a17090668cc00b008d044ede804sm8084789ejr.163.2023.03.24.04.48.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Mar 2023 04:48:44 -0700 (PDT)
Message-ID: <4f90e84b-1a9e-bc96-c9b3-12f95ea7bcff@linaro.org>
Date: Fri, 24 Mar 2023 12:48:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v6] ASoC: dt-bindings: Add tas2781 DT documenting that
 binding along with the driver
Content-Language: en-US
To: Shenghao Ding <13916275206@139.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, broonie@kernel.org, lgirdwood@gmail.com
References: <20230324110929.27710-1-13916275206@139.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230324110929.27710-1-13916275206@139.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 4O64323LHYK2OUIZKWZBGHPOWLD4ML6B
X-Message-ID-Hash: 4O64323LHYK2OUIZKWZBGHPOWLD4ML6B
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: kevin-lu@ti.com, shenghao-ding@ti.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, x1077012@ti.com,
 peeyush@ti.com, navada@ti.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4O64323LHYK2OUIZKWZBGHPOWLD4ML6B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 24/03/2023 12:09, Shenghao Ding wrote:
> Create tas2781.yaml for tas2781 driver.
> 
> Signed-off-by: Shenghao Ding <13916275206@139.com>

Where is the driver? Why are you sending these separate? You already got
comment about wrong threading, so I really expect some improvements.
> 
> ---
> Changes in v6:
>  - Remove all the "|" after "description:".
>  - Drop the reset-gpios description.
>  - Be consistent on the I2C.
>  Changes to be committed:
> 	new file:   Documentation/devicetree/bindings/sound/ti,tas2781.yaml
> ---
>  .../devicetree/bindings/sound/ti,tas2781.yaml | 84 +++++++++++++++++++
>  1 file changed, 84 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/ti,tas2781.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/ti,tas2781.yaml b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
> new file mode 100644
> index 000000000000..af37595f3a6e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
> @@ -0,0 +1,84 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2022 - 2023 Texas Instruments Incorporated
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/ti,tas2781.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments TAS2781 SmartAMP
> +
> +maintainers:
> +  - Shenghao Ding <shenghao-ding@ti.com>
> +  - Kevin Lu <kevin-lu@ti.com>
> +
> +description:
> +  The TAS2781 is a mono, digital input Class-D audio amplifier
> +  optimized for efficiently driving high peak power into small
> +  loudspeakers. Integrated an on-chip DSP supports Texas Instruments
> +  Smart Amp speaker protection algorithm. The integrated speaker
> +  voltage and current sense provides for real time
> +  monitoring of loudspeaker behavior.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,tas2781
> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      I2C address of the primary device.

What happened here? Rob's comment seems ignored and now we have
description without anything useful.

> +
> +  reset-gpios:
> +    maxItems: 1
> +

Best regards,
Krzysztof

