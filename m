Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CE6683486
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 19:00:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F77C1EB;
	Tue, 31 Jan 2023 18:59:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F77C1EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675188040;
	bh=MROeDG2X+qvCzyYSXJc7B0nitjtYj9YALJ3wBWO7px0=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=m8icnN027S6COZdFsXdWyZjltvwobFghQnXCLwtuPPs/GFh1tA6Hl3ceSZHNu3+/L
	 SroUflUKaR0NNjDEAPizIH+oaPZ/nYFAom8yLYffHz3cXli5Qqifk1OxNUmz5+qqz8
	 MWq22d2oRgiogIHSZ95FWuqvuW3BBairHPyjV3ew=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15FD4F80169;
	Tue, 31 Jan 2023 18:59:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 750FEF804C2; Tue, 31 Jan 2023 18:59:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DB73F80155
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 18:59:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DB73F80155
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=SsXUyMMS
Received: by mail-wm1-x32b.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so13081455wma.1
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 09:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/szpvn7y9gec1tyWJQBadgKS8WeEN4pwAXM4ABHxKUU=;
 b=SsXUyMMSeCP/y7sVGkHIr+wpXtG+lNexPqRpKCZMGeB2LOgMxzjBwleq77KDiUrHwp
 SNs3p6Z2ZLyYZyDrWO99h05TxvEa3nX9dSE2k+4IWs1ABGkpDK0yH3ARbya2Y2DQLBLQ
 PvOrQ+aPNQM49D/a08vbA2DJI9XwdMVecs7CvJnVw6kN7/HNI1cny2fSHFE8B17TNitz
 Hrk8XloenIKFWf8a2/EWU+eLCsv9MyWD/I1S/EQ3F4d0Jk3E9cK1fhDH/4Ol0DOOkqwO
 MwVpmttmVDVLqScMFYgRYN0BrQ6Qgvr2Y2fyTQw/ths+an/9+uhimFl0fZk2bfFQXVLQ
 U9RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/szpvn7y9gec1tyWJQBadgKS8WeEN4pwAXM4ABHxKUU=;
 b=SaUZWe8TRIfE6EUtlnhe8+nXME+tMWgSn3CBd2dxWQtoEw+d6PIFinp676Z84X2Daq
 SMuhEcN9d5XwaXclqshzlgQW9mpgdMEjOYCGW9uN8dU+4xKfRrvF5EwmInOv3ec56+IN
 L4jpLI3zA5DvLCn4U8Agq2/+bin0gcrhjKVjt2PzNdhILRoUUKByqTFjFnGrByzH1wXo
 a1MddlwPahBpBxYs9KYbeou9FWj90nnG8lIVJyWbyzlWl6Lc+2jmxjdrXaciNZINUePH
 gBPyYDw418JpcHmul7hXfjtNc4NPFP9AU3fhCljLrUkjuIvzREgB98aCwb0JUOxTOv5U
 viRg==
X-Gm-Message-State: AO0yUKX9a2pduhCYzEn76ugxcvcsZkJ+GDYgInQe5clZ1C4MiEgjONHc
 h2Sjt25wixqAtkJZEbzd7KyKHg==
X-Google-Smtp-Source: AK7set/mH8G8arPE9aWgo+oZwj285W4mdjXlicy8LcplDLyXvEcpmpH/9UUR/d6w07g+gluxQr8aGQ==
X-Received: by 2002:a7b:c853:0:b0:3dc:5342:4132 with SMTP id
 c19-20020a7bc853000000b003dc53424132mr10709426wml.4.1675187964539; 
 Tue, 31 Jan 2023 09:59:24 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 p7-20020a1c5447000000b003dc433355aasm13191576wmi.18.2023.01.31.09.59.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 09:59:24 -0800 (PST)
Message-ID: <5ecabe9e-84f2-cc3a-c213-3b623f90842e@linaro.org>
Date: Tue, 31 Jan 2023 18:59:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v5] ASoC: dt-bindings: Add tas2781 amplifier.
Content-Language: en-US
To: Shenghao Ding <13916275206@139.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, broonie@kernel.org, lgirdwood@gmail.com
References: <20230131131735.7118-1-13916275206@139.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230131131735.7118-1-13916275206@139.com>
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
Cc: kevin-lu@ti.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, shenghao-ding@ti.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 31/01/2023 14:17, Shenghao Ding wrote:
> Create tas2781.yaml for tas2781 driver.

You treat my feedback selectively... some things improved, but not
everything. I am literally repeating the same and expect different
results from you... isn't that the definition of insanity?

Let me paste ignored parts:

1. Your patches are still not correctly threaded. There is no threading
at all.

I said it multiple times. What else should I say here?

2. Subject: ASoC: dt-bindings: Add tas2781 amplifier
(drop the full stop - why did you add it there?)

3. Missing changelog under ---.
I mentioned it already few times, didn't I?

> 
> Signed-off-by: Shenghao Ding <13916275206@139.com>
> 
> ---
>  Changes to be committed:
> 	new file:   Documentation/devicetree/bindings/sound/ti,tas2781.yaml
> ---
>  .../devicetree/bindings/sound/ti,tas2781.yaml | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/ti,tas2781.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/ti,tas2781.yaml b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
> new file mode 100644
> index 000000000..9a440d29f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
> @@ -0,0 +1,87 @@
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
> +  reset-gpios:
> +    maxItems: 1
> +    description: |
> +      A GPIO line handling reset of the chip. As the line is active high,
> +      it should be marked GPIO_ACTIVE_HIGH (see ../gpio/gpio.txt)

Drop the reference to gpio.txt.

I give up. I spent too much time on it while being also ignored a bit
too much.


Best regards,
Krzysztof

