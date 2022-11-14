Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E00656277F6
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Nov 2022 09:40:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6762D163B;
	Mon, 14 Nov 2022 09:40:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6762D163B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668415256;
	bh=M3+sWcQeHEdNh/9GpIA3Zz8L5MMV4w+erpeltcfCgCI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PYY0bwtinyPdxM9x1RMfjZR9KyLMXdCF9IV8Gk22csUUHD9uAlAndpQGYW/oBikHC
	 YVf3WJ3GL1PJbTCxevRNF5r+QVkboH5tXpCuZ7+erenTi7NBIwTcQMqpvsvUuIgKE1
	 55syiahf4kqYxPI3JMDO0Z3Vk9GGLZupPdvGQPjE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AE15F800B6;
	Mon, 14 Nov 2022 09:40:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C74E1F80431; Mon, 14 Nov 2022 09:39:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54209F800B8
 for <alsa-devel@alsa-project.org>; Mon, 14 Nov 2022 09:39:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54209F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="yuLv1bnA"
Received: by mail-lf1-x132.google.com with SMTP id l12so18095089lfp.6
 for <alsa-devel@alsa-project.org>; Mon, 14 Nov 2022 00:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+oFfY/N68Q8NBaNJQXMJs0RKI38kQ4LuijQR5F4a/tc=;
 b=yuLv1bnAvS6XAzdHgwoHAvcVJtX6207M2s8jV7pyKDwCP0CvT+cd/3Xt5lGkm5BJU+
 Q3bYi1/IdjR/HZ6wSnY3VzbZxVNhNiTzBlTeFymDfsvA2BVYsaJsdu2WjdPWt1We6hGh
 3hITpvEWn0FqxFGvSmZSrz5NFWa6G4yfkl/fA1R8/xfPWlADILvzE2GlOqZA/V+1T1B+
 FBRBSipZrrC3341jQFwwckdqD8qpq0qJus/exN3S2VdhlcIU7s5K3tkPREmFa4PLEdOJ
 omWmfNZZu1y4hgmSMuEj8DKaKHWeqQiGVe+LTK11PL+kiZ6/26T9+V9A1noq93R9Isan
 IjZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+oFfY/N68Q8NBaNJQXMJs0RKI38kQ4LuijQR5F4a/tc=;
 b=EFLUUf+9M22QO7hK1QQf2lskZ/DxmBK/VcBmmx0Lem0qlkwtbQNL5aayJo62Hkg+OE
 T42AURDGJRpxt2hx239qd/g+5VJLkfUoehtB7d5LwHQ3JoXRf88TiRGSXgICRMpPP163
 Oh0INcTh0lL1RlqElw9KZIMGB57fHyzy6RtzeYjNffznTJxuI8vCl5Nda56ItVW+61Yr
 UAdjrOpBahcFwfTCBnISUcYKpkQbJi5/BM+8Yt97GKFT/ss2z5Cpq/UAus7Pux5WPWFi
 W9fUhHCBshErqgJ8Bld+0tmDlXku94yQxEePRJtYgE2wiKo54nqP4g37yRb7kU4B2y9J
 59Eg==
X-Gm-Message-State: ANoB5pk2iDBQEX5qup3p/8Gcs4d74pD8Cp4zD6FnYmo+DLyAvU5T/sRh
 AjUUnxYbIbhlsmXiiXJnazq8u/9FJA0Fq9AD
X-Google-Smtp-Source: AA0mqf55Qbw0TgvF9gSuSuMW1+4uG6FK38zccVWIo/t5cBVtuwBpj2peQhN7JVCP1hdYk91xYoHmJw==
X-Received: by 2002:a05:6512:3132:b0:4aa:1754:9ae3 with SMTP id
 p18-20020a056512313200b004aa17549ae3mr3586939lfd.344.1668415190232; 
 Mon, 14 Nov 2022 00:39:50 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a05651205c600b004a26ba3458fsm1739532lfo.62.2022.11.14.00.39.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Nov 2022 00:39:49 -0800 (PST)
Message-ID: <e0386c67-da39-b77b-2c92-6d70ee321fa9@linaro.org>
Date: Mon, 14 Nov 2022 09:39:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 04/12] dt-bindings: pinctrl: Add Cirrus Logic CS48L31/32/33
Content-Language: en-US
To: Richard Fitzgerald <rf@opensource.cirrus.com>, lee@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linus.walleij@linaro.org, broonie@kernel.org, tglx@linutronix.de,
 maz@kernel.org
References: <20221109165331.29332-1-rf@opensource.cirrus.com>
 <20221109165331.29332-5-rf@opensource.cirrus.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221109165331.29332-5-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 09/11/2022 17:53, Richard Fitzgerald wrote:
> Codecs in this family have multiple digital I/O functions for audio,
> DSP subsystem, GPIO and various special functions. All muxable pins
> are selectable as either a GPIO or one of the available alternate
> functions.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---
>  .../bindings/pinctrl/cirrus,cs48l32.yaml      | 98 +++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/cirrus,cs48l32.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/cirrus,cs48l32.yaml b/Documentation/devicetree/bindings/pinctrl/cirrus,cs48l32.yaml
> new file mode 100644
> index 000000000000..b24fbae6a8f8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/cirrus,cs48l32.yaml
> @@ -0,0 +1,98 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/cirrus,cs48l32.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cirrus Logic CS48L32 audio codec pinctrl driver

Drop driver.
s/pinctrl/Pin Controller/


> +
> +maintainers:
> +  - patches@opensource.cirrus.com
> +
> +description: |
> +The Cirrus Logic CS48L32 codec has a number of GPIO functions for
> +interfacing to external hardware. Certain groups of GPIO pins also
> +have an alternate function.
> +
> +The properties for this driver exist within the parent MFD driver node.

Drop driver... so probably entire sentence.

> +See the core bindings for the parent MFD driver for an example:

Drop driver. Describe hardware instead.

> +
> +    Documentation/devicetree/bindings/mfd/cirrus,cs48l32.yaml
> +
> +And the generic pinctrl bindings:
> +
> +    Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt

Drop entire sentence.

> +
> +properties:

Your schema does not match on its own. Where is the compatible? This is
not how schemas for devices (also MFD) is done.

> +  pin-settings:
> +    description:
> +      One subnode is required to contain the default settings. It
> +      contains an arbitrary number of configuration subnodes, one for
> +      each group or pin configuration you want to apply as a default.
> +    type: object
> +    patternProperties:
> +      '-pins$':
> +        type: object
> +        allOf:
> +          - $ref: "pincfg-node.yaml#"
> +          - $ref: "pinmux-node.yaml#"

Drop quotes.

Except this, test your patches before sending.

Best regards,
Krzysztof

