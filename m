Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6298A66B17F
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Jan 2023 15:25:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C173D88B0;
	Sun, 15 Jan 2023 15:25:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C173D88B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673792753;
	bh=lB50Gj6PrNuCWxwxC5QJtvOQGj0uvcFkezAyAJVjkLY=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ONaYoMMzPPBBrRSp2b8AlH+yA8ZxGXS7L8j0eBbY1HsofXY447kLiaKstyFRLzw/R
	 M6R1oyAWKw7MEIZc+0/D/2mlJ5tnGfbjVil21SBRrBW1mchTWH7u4pE+Ad8C3AS5wu
	 HPuatUSorFNTQ/5zwnd1zJFIZ9St+GMIzqNJQf7o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F710F801EB;
	Sun, 15 Jan 2023 15:24:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1F93F804DE; Sun, 15 Jan 2023 15:24:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09268F8026D
 for <alsa-devel@alsa-project.org>; Sun, 15 Jan 2023 15:24:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09268F8026D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=O+rd/HyG
Received: by mail-ed1-x534.google.com with SMTP id v30so37516948edb.9
 for <alsa-devel@alsa-project.org>; Sun, 15 Jan 2023 06:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6IoZ76KwUCL1cqVizi7jor5ObAdKymPi7IVnSChtivQ=;
 b=O+rd/HyGIpwbOvRxpAzEL5hycb7Ldd05Bkmc0ReGQ8J3DLFmCxOVR/WNeC8e23xeuy
 Q70w1Ve61QDIiy0fvvO735BWccQ3jmt+M3atp7dE9miRsE1M7U5c+Cf41gnoreHBfpdD
 u8ztvUNn3GRY0m1FdAi6TG601JxxmvJVLhntpTIPcltG18S0DRpgCLmWK6cW15ajm/TF
 E96EcQONl1IZdEcy1N5tGq1b1FAIgxzzofPCTgy6vEqx+P77Lse67Y8Pe5NNvr3bbhqb
 7pePfPw2hsgUQXH7ZFmWj6ZHcCBxBqi0QH0X+QE6VHNAYPOM3yiDDRuRb61bIfdVXRRd
 byAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6IoZ76KwUCL1cqVizi7jor5ObAdKymPi7IVnSChtivQ=;
 b=WHl8C45112DHxywOfN36Cf3KfMGs7D3qNDvNQWWsyhGTqw1j+ErBpGVrTAYKjzQrzU
 I2f0xu3xsomVgk/2d1gG3Cm0uuIwH83MM5A4Y7I0zpDTEheQjBq9MwaEaAftu8zIhwN0
 vHZ/Nmkgv5yjnJ14TvNbmzMiTfe3SezNghhOqySGY+wrd9hRxaiMrJ8pNnmet7k5kwqH
 S6MPZtblUF65aXjazy8TLTvfrjV0TvWXL4jR7et1gZ+n1/febAJbisU7pJDtiN3RsZJc
 SEbQpSdHBQhd8X0T+dUNAknOF7kqRHL/h4biuQ4ylW2RwVR5vD692EFXJjdGhIrTOZMZ
 UnSg==
X-Gm-Message-State: AFqh2kq1xptZTSIYu4NtM/grF2jzekZjLFlxrmLsnX81BytheogK8Dgp
 FwDyCTlysd2tSodD48sCAN0elw==
X-Google-Smtp-Source: AMrXdXvqARNALDKkdSGT8usje4vt7FpVeTK0wvt4xJZxCeTFNVA+7h7GVWmhNdfN9x+EJ/hbYPXIOA==
X-Received: by 2002:a05:6402:241b:b0:461:2288:6808 with SMTP id
 t27-20020a056402241b00b0046122886808mr81710853eda.21.1673792686842; 
 Sun, 15 Jan 2023 06:24:46 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a0564021f0200b0048c85c5ad30sm10329632edb.83.2023.01.15.06.24.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Jan 2023 06:24:46 -0800 (PST)
Message-ID: <c3d5b577-2810-7ce1-3136-b0bc6c9171a5@linaro.org>
Date: Sun, 15 Jan 2023 15:24:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1] Asoc: dt_bindings: Add tas2781 yaml
Content-Language: en-US
To: Kevin Lu <luminlong@139.com>, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
References: <20230115121629.2420-1-luminlong@139.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230115121629.2420-1-luminlong@139.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, navada@ti.com, kevin-lu@ti.com,
 shenghao-ding@ti.com, peeyush@ti.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 15/01/2023 13:16, Kevin Lu wrote:
> Complete the DTS for tas2781

1. This is not a v1 but v2.
2. Subject - still wrong.
3. Commit msg - does not make sense to me. I don't understand it.
4. Other comments - also not implemented.

This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Thank you.



> 
> Signed-off-by: Kevin Lu <luminlong@139.com>
> ---
>  .../devicetree/bindings/sound/ti,tas2781.yaml | 122 ++++++++++++++++++
>  1 file changed, 122 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/ti,tas2781.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/ti,tas2781.yaml b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
> new file mode 100644
> index 0000000..7d73f46
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
> @@ -0,0 +1,122 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2022 Texas Instruments Incorporated
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/ti,tas2781.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments TAS2781 Smart PA
> +
> +maintainers:
> +  - Shenghao Ding <shenghao-ding@ti.com>
> +  - Kevin Lu <kevin-lu@ti.com>
> +
> +description: |
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
> +    description: |
> +      I2C address of the device can be in range from 0x38 to 0x40.
> +
> +  ti,audio-slots:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 4
> +    description: |
> +      This item is used to store the i2c address of the device
> +      for deifferent audio slots. It is not required for Mono case.
> +
> +  ti,global-addr:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      This item is used to store the generic i2c address of
> +      all the tas2781 devices for I2C broadcast during the multi-device
> +      writes, useless in mono case.
> +
> +  ti,reset-gpios:

I asked you to use existing property. Drop prefix.

> +    minItems: 1
> +    maxItems: 4
> +    description: GPIO specifier for the reset pin.
> +
> +  ti,irq-gpio:
> +    maxItems: 1
> +    description: GPIO used to interrupts the device.

So you ignored around 3 or four my comments. I'll stop the review - it
does not make sense.

NAK - this is not correct property. Implement the feedback.

Best regards,
Krzysztof

