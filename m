Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4F7652434
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Dec 2022 17:05:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FF2118D5;
	Tue, 20 Dec 2022 17:04:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FF2118D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671552328;
	bh=TrFwWD21gaBhjwxwXc3lH0C0uj/qnXRP50jD6GR5KdI=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=XB7apzsLcvIbx8lAFE5TSYBLvNnne4P9MX8Z3NmQ9r30JwxhhXCLIqw4eJcgLQZXk
	 603shc0prVwU+vCUEL2QEm+SytVAyR0xG/A4hCfkEMDg6FZffL8AKhIMTdoF3CZpnw
	 Jda10EUX4b0dp0PJfmKtpYCo/bWjcr/JKiPaN5pI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46E33F80022;
	Tue, 20 Dec 2022 17:04:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FBCEF8025E; Tue, 20 Dec 2022 17:04:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 170C3F80022
 for <alsa-devel@alsa-project.org>; Tue, 20 Dec 2022 17:04:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 170C3F80022
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=gtIaUHTn
Received: by mail-lf1-x129.google.com with SMTP id m29so19066985lfo.11
 for <alsa-devel@alsa-project.org>; Tue, 20 Dec 2022 08:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DY1/ZbtXwe/kzCYxDha03m5dSPbCawqPHdgmiIc+QiY=;
 b=gtIaUHTnYckDE12y2FXxA+ytDpmXeyr6vKpt/CV+m0unqjPR23ySidgcdosjGyOv0q
 NDcyBYLJgzWPQfvNpsl0ZgtHFkuVeBxnPuBm2cXsfNT+OEqRXS1lE7RBU85IwU6saB3z
 1LKCtjUU/P6ou4O7rS/L7tJFIvzOuz6bThdCuylFWFw5Nusij0Hz7Q6hfWhmqvTEZfOQ
 ZcWYr/XMk8v2ZpupWoV6nGPObTp/2HO87hrrheF68+szsRFYCk/hbbTq/JbEPVFRDpU+
 Mg9L1r/ktqi67WliIEP5uOIjOljtMEoS4QIKDnPz5QIkQTsR+I5gHo8c6xPwum+OqKUU
 m5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DY1/ZbtXwe/kzCYxDha03m5dSPbCawqPHdgmiIc+QiY=;
 b=QtifiE9LKeHzTbKAsVV3OD3Oq+h0cG8hf4B2Ne+FhJBDmRVIaGv/lE3kB1YGa/MTPg
 ZAmspHD/ENhbMSG60y+5yEN0Ln8l1OHkMtRSkJNJpMRcDuoNr7q4NOI6orwMBouO498A
 6ol4SxQb43VMhsjorUykm9NbRFOOQr0Imzr9zi/Euu5sjNE7QGLU5zfkxRbos01uxM1K
 jE9Mi/EIFbGWKsbWdrFInzWyCCjrFT2HtYTJhMQ02jxrTwEa2CgIyX+9kf81UmtmLr+N
 1sWXOgb6Sn8n5vTGQURVaJemhb4hAQEg7A9ZCGVdO8hqF9LTi9VFurqe+M/291aKd4Mu
 Y5Tg==
X-Gm-Message-State: ANoB5plDW44+mugqjLWKAy7i/nnA0Aa84FFJviSlITEWY7ubk675shXF
 KFOYWGUVsJ8mEYuJRDM2qwdcPA==
X-Google-Smtp-Source: AA0mqf4h11u79tlu5JMN37htLFcnw9h0CeJfR2bQr1v6G9XjFQoOcPBjERCxyLEBbRSl/umlgz9OsQ==
X-Received: by 2002:a05:6512:3091:b0:4b5:a64a:4408 with SMTP id
 z17-20020a056512309100b004b5a64a4408mr24666667lfd.48.1671552253453; 
 Tue, 20 Dec 2022 08:04:13 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a056512214700b004a91df49508sm1498007lfr.177.2022.12.20.08.04.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 08:04:13 -0800 (PST)
Message-ID: <dfd02af2-0a7b-2fc2-a0a0-160b690ac2cb@linaro.org>
Date: Tue, 20 Dec 2022 17:04:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] New yaml file: tas2781
Content-Language: en-US
To: Kevin Lu <luminlong@139.com>, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
References: <20221220144114.2137-1-luminlong@139.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221220144114.2137-1-luminlong@139.com>
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

On 20/12/2022 15:41, Kevin Lu wrote:
> Add DTS discription for tas2781 driver code

1. Use subject prefixes matching the subsystem (git log --oneline -- ...).

2. Anyway that's not correct subject. Look at existing commits.

3. Run spell check.

4. Missing full stop.

> 
> Signed-off-by: Kevin Lu <luminlong@139.com>
> ---
>  .../devicetree/bindings/sound/tas2781.yaml    | 90 +++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/tas2781.yaml

Filename with vendor prefix, just like compatible.

> 
> diff --git a/Documentation/devicetree/bindings/sound/tas2781.yaml b/Documentation/devicetree/bindings/sound/tas2781.yaml
> new file mode 100644
> index 000000000..96fa45bf6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/tas2781.yaml
> @@ -0,0 +1,90 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2022 Texas Instruments Incorporated
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/sound/tas2781.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"

Drop quotes from both.

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
> +      - ti,audev

That's not a correct (real) compatible. Drop.

> +    description: |
> +        ti,audev will disable the irq of tas2781.

Drop description.

Missing blank line.

> +  reg:
> +    maxItems: 1
> +    description: |
> +       I2C address of the device can be between 0x38 to 0x40.
> +
> +  reset-gpioN:

Nope, use existing property. See gpio-consumer-common

> +    maxItems: 4
> +    description: GPIO used to reset the device.

This does not work like that. You did not even test it, right?

> +
> +  ti,topleft-channel:
> +    maxItems: 1
> +    description: I2C Address for each specific device.

No clue what's this. You need to explain in details in description.

> +
> +  ti,topright-channel:
> +    maxItems: 1

Ditto and in all other places.

> +
> +  ti,bottomleft-channel:
> +    maxItems: 1
> +
> +  ti,bottomright-channel:
> +    maxItems: 1
> +
> +  ti,global-address:
> +    maxItems: 1
> +    description: This item is not mandatory. if the device support gloabel mode, this item should be active.

I have no clue what is gloabel mode but the field looks incorrect. Drop
or properly describe.

Also wrong line wrapping.

> +
> +  ti,irq-gpio:
> +    maxItems: 1
> +    description: GPIO used to interrupt the device.

No. Use interrupts.

> +
> +  '#sound-dai-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +   #include <dt-bindings/gpio/gpio.h>
> +   i2c0 {

i2c

> +     #address-cells = <1>;
> +     #size-cells = <0>;
> +     codec: codec@38 {
> +       compatible = "ti,tas2781";
> +       reg = <0x38>;
> +       #sound-dai-cells = <1>;
> +       ti,topleft-channel = <0x38>;
> +       ti,topright-channel = <0x39>;
> +       ti,bottomright-channel = <0x3a>;
> +       ti,bottomright-channel = <0x3b>;
> +       ti,global-address = <0x40>;
> +       ti,reset-gpio0 = <&gpio1 10 GPIO_ACTIVE_HIGH>;
> +       ti,reset-gpio1 = <&gpio1 11 GPIO_ACTIVE_HIGH>;
> +       ti,reset-gpio2 = <&gpio1 12 GPIO_ACTIVE_HIGH>;
> +       ti,reset-gpio3 = <&gpio1 13 GPIO_ACTIVE_HIGH>;


Does not look like you tested the bindings. Please run `make
dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).


Best regards,
Krzysztof

