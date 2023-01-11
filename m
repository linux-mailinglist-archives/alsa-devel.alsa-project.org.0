Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E5A66606F
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Jan 2023 17:29:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A52B6C29;
	Wed, 11 Jan 2023 17:28:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A52B6C29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673454556;
	bh=uU3Y9GiFhya/dgYG5vN/LRF4cAC/4aVRadvTPKOqovM=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ISsk3Pemux949PqIYjKT5hPbvuhFqVV5jtQ9sfBflV2HupFjDxA2Ri2oWsO4TnZCq
	 GYtCCPMnIlS2E1qjVpd2Mg1xgHYPMvUH/UmGdhBOQFHwqgDCzGzmVB2e4+O5bdG1u1
	 osLpJXXqQ+pQ6GyupGGmk77rKWi7DHBNSwXSz+DE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE795F8016E;
	Wed, 11 Jan 2023 17:28:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41987F803DC; Wed, 11 Jan 2023 17:28:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47DC6F8016E
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 17:28:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47DC6F8016E
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=QG/1xRDc
Received: by mail-wm1-x32d.google.com with SMTP id l26so11494143wme.5
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 08:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=h7CWF9KkUKbOJvIgyBGuBX3AgumkGtq/yuQpNawXVGo=;
 b=QG/1xRDc2gvPUcV3qYyLpo9U1+DrMtmYMCpfUHY3aBxCA/zvDPrypygAq50eRHghxJ
 VMQZMBAirs1WNJzVVb5Z2Cr9RIBnVWz/mxGftXpw0Vl5NqIg/1370zLOgEEStiNr9L8n
 6u97vE0rrLrlha03SYeQIX+8vZD2HXqxn2I6ogvtXhMWZ0MD3iV9VAa/QA1qSafYq10g
 /Dv0x3t+uUCvWLa3esZKGcAoUI+MRcKPyf+GgWtlOiYECKsOOcVajufpcYZI4oa6IFCo
 9iMsozsf8EujJzSufGogv/LJdpQ9o8xZZwozSz9oZSGHTiz2dEmesqr5B2O9Lk/fQEck
 r8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h7CWF9KkUKbOJvIgyBGuBX3AgumkGtq/yuQpNawXVGo=;
 b=HywRlQv79pdrd9ZkTEMBdWEDQ+bGAY+aHiLfto/ZFUPPK7pnfXx0N6KYULXDgr1N5l
 RmMNyMnZqEMXdTDnEnD57nJrnhzv9ClmSMhrkUgochMlEliXVOUDslG86mHUyKDW+DjF
 ZvAER1nO13PowufJfV6RLP+4e+9Oav26PjhoMU5f/PhGW0F3fp9DpZs5g7y0eTckIDrq
 BxXzexsTSeoyRwqGCabNA+6QyeEiDq3QHdhHPJjOXLAupnhiy59OicwJh0EPHFBwII24
 wAuB9/C48jcDeZiSs2xAGIcKRISGhslMDuAj/BsRsgYV3ehHg5scZKtXg5yiFdVtKzoK
 KjMQ==
X-Gm-Message-State: AFqh2kqf/lZdXIOX+gGkQ3Bc4YFzZ1Q+3BIEk8xVLLbSMNNTmiXj4apv
 MtcLQqJZ0aiOG0z3+V9OB1QPhA==
X-Google-Smtp-Source: AMrXdXsJO0FKX4wDji1FsHRVmHI5Sp0+ktkb3opEqy9j/XqlcQpG//WN65wKFYu7H+P8NXUVJtGUQg==
X-Received: by 2002:a05:600c:1e09:b0:3cf:b73f:bf8f with SMTP id
 ay9-20020a05600c1e0900b003cfb73fbf8fmr51982781wmb.7.1673454493504; 
 Wed, 11 Jan 2023 08:28:13 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a05600c4f0300b003a6125562e1sm20455115wmq.46.2023.01.11.08.28.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 08:28:13 -0800 (PST)
Message-ID: <c4497bde-c1e0-1efc-7a46-233495f7760b@linaro.org>
Date: Wed, 11 Jan 2023 17:28:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/3] dt-bindings: sound: Add Renesas IDT821034 codec
Content-Language: en-US
To: Herve Codina <herve.codina@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
References: <20230111134905.248305-1-herve.codina@bootlin.com>
 <20230111134905.248305-2-herve.codina@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230111134905.248305-2-herve.codina@bootlin.com>
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
 linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-gpio@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 11/01/2023 14:49, Herve Codina wrote:
> The Renesas IDT821034 codec is a quad PCM codec with
> programmable gain.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  .../bindings/sound/renesas,idt821034.yaml     | 97 +++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/renesas,idt821034.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/renesas,idt821034.yaml b/Documentation/devicetree/bindings/sound/renesas,idt821034.yaml
> new file mode 100644
> index 000000000000..2c29b770e3f7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/renesas,idt821034.yaml
> @@ -0,0 +1,97 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/renesas,idt821034.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas IDT821034 codec device
> +
> +maintainers:
> +  - Herve Codina <herve.codina@bootlin.com>
> +
> +description: |
> +  The IDT821034 codec is a four channel PCM codec with onchip filters and
> +  programmable gain setting.
> +
> +  The time-slots used by the codec must be set and so, the properties
> +  'dai-tdm-slot-num', 'dai-tdm-slot-width', 'dai-tdm-slot-tx-mask' and
> +  'dai-tdm-slot-rx-mask' must be present in the ALSA sound card node for
> +  sub-nodes that involve the codec. The codec uses one 8bit time-slot per
> +  channel.
> +  'dai-tdm-tdm-slot-with' must be set to 8.
> +
> +  The IDT821034 codec also supports 5 gpios (SLIC signals) per channel.
> +
> +allOf:
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +  - $ref: /schemas/gpio/gpio.yaml#

This one is never needed. Drop.

> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: renesas,idt821034
> +
> +  reg:
> +    description:
> +      SPI device address.
> +    maxItems: 1
> +
> +  spi-max-frequency:
> +    maximum: 8192000
> +
> +  spi-cpha: true
> +
> +  '#sound-dai-cells':
> +    const: 0
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  gpio-controller: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - spi-cpha
> +  - '#sound-dai-cells'
> +  - gpio-controller
> +  - '#gpio-cells'
> +
> +additionalProperties: false

This should be rather unevaluatedProperties: false, so other properties
from spi-props and dai-common will work.

> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    spi0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        codec: idt821034@0 {

Node names should be generic, so "audio-codec"
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +            compatible = "renesas,idt821034";
> +            reg = <0>;
> +            spi-max-frequency = <8192000>;
> +            spi-cpha;
> +            #sound-dai-cells = <0>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +        };
> +    };
> +    sound {
> +        compatible = "simple-audio-card";

Drop sound{} node. Not relevant to the case here and it's the same in
every case of audio codec... unless something here is specific. But even
the dai-tdm properties are sound card specific.


Best regards,
Krzysztof

