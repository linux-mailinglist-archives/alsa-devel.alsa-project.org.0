Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1ED5BBCF6
	for <lists+alsa-devel@lfdr.de>; Sun, 18 Sep 2022 11:51:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A2FD85D;
	Sun, 18 Sep 2022 11:51:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A2FD85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663494716;
	bh=iXINPMAkjcf8E5x4KSjqZbIUNxb+Pyo6zpWlEXi04Yk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=exR177u7FZWxMbIuCsvOdxpDYKQY2TK62xrHucmrD69NeRLePt0iYuP/KRAPcudyx
	 qKgYcX64ib35WegyGyonvqek+my8aED+esQKznnnOsHU6uy/5T0IfizI1CYYtU808Z
	 PEHt7dYOUCaMha8hnBFKjpRfIZuBFW+97UpoBDfc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76C41F804CA;
	Sun, 18 Sep 2022 11:50:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AAEC6F80134; Sun, 18 Sep 2022 11:50:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1E68F80134
 for <alsa-devel@alsa-project.org>; Sun, 18 Sep 2022 11:50:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1E68F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Wp0ZjomX"
Received: by mail-lf1-x131.google.com with SMTP id s6so31072018lfo.7
 for <alsa-devel@alsa-project.org>; Sun, 18 Sep 2022 02:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=PKBg5ng7PnWT5G7IkXOVZef3/wyXg4tjFKeAtGbo5Lk=;
 b=Wp0ZjomX491U2rtytMCDb+CR94gy+1DIlxKK12p7ND8SR/hx3X3hdiRuZ1MbpphJTq
 txKv40nzT3myoEkSuZB1SCD7vGdILwv6DZ4hzYb4gxbV4wsNef/3Lx435X7KZ3k1YIvH
 y1EQPXAGFXLS1Q2xdTZJLGMegi4lSAkwQ+UHP9fasg0ftekSOBRryTwXZYncYwsfLJru
 Nm+ipzZAl93L75RmHQ006JdD2JgzIkpfYFjLjLJQ01dkevVf59iASAz0N5YS9fFD+4uG
 uUQ7oznjf8vQ+duVO8RWaXxjbVZGU93lGdI8uvCgaJyiwqfxZ1GmxfMwH2DI65MlGw1S
 9++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=PKBg5ng7PnWT5G7IkXOVZef3/wyXg4tjFKeAtGbo5Lk=;
 b=0zxKsMQS+G4h0z3HCmSulP6ydmjjlT2lIPPlG3XUerJLu3vs5zkOS9U5HgiIg3w+DW
 G5DlZE7m8xOJO6SYKraQ5l58YfXc6+eshTTOM8tnrDWA6ht+t7+/Lo613FnbxDF5Q+NX
 oRzIox8XCUEoTs7uQvNsFUKAt9QHOLQnaQMVoUvphi22g2YPtVnHyU+tgOHGVOz9mPWs
 kuwIq1p9GI/fVD0Boii51BxXuLNTVdRCZ+5pE57Aa+rJoeAd34Hlog1k6Td87nFFYKFb
 TAROXjYgKqiTQU7r+Obbb/A3fC5boEoIeL2cQIKmVrppYYi87+fGLIMTBL4H14Mj4viE
 StWA==
X-Gm-Message-State: ACrzQf029Lz1UHNtnb/Ca1NQKQXJuo1tBVK7KSL2lW6Jx14Y6rp/OzmA
 oPHcQNoqWYAxZrIKI5aOjpSl9Q==
X-Google-Smtp-Source: AMsMyM5fLqyeOXxhQHdX+OOxELBYD3ckReSg83MxwbqlwSMZaQyVVpAnIOHc9SP/XraIp0pF3FQnyQ==
X-Received: by 2002:a19:6b05:0:b0:49f:53b9:abb0 with SMTP id
 d5-20020a196b05000000b0049f53b9abb0mr3821048lfa.166.1663494648565; 
 Sun, 18 Sep 2022 02:50:48 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 z15-20020a056512308f00b004977e865220sm4574286lfd.55.2022.09.18.02.50.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Sep 2022 02:50:47 -0700 (PDT)
Message-ID: <d264ff4f-3aa3-8dd4-26fc-9cffe950f386@linaro.org>
Date: Sun, 18 Sep 2022 10:50:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 1/3] dt-bindings: sound: ts3a227e: convert to yaml
Content-Language: en-US
To: Astrid Rost <astrid.rost@axis.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dylan Reid <dgreid@chromium.org>, Rob Herring <robh+dt@kernel.org>
References: <20220915113955.22521-1-astrid.rost@axis.com>
 <20220915113955.22521-2-astrid.rost@axis.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220915113955.22521-2-astrid.rost@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Astrid Rost <astridr@axis.com>, kernel@axis.c, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

On 15/09/2022 12:39, Astrid Rost wrote:
> Convert from ts3a227e.txt to yaml.
> 
> Signed-off-by: Astrid Rost <astrid.rost@axis.com>

Thank you for your patch. There is something to discuss/improve.

> ---
>  .../devicetree/bindings/sound/ts3a227e.txt    | 30 --------
>  .../devicetree/bindings/sound/ts3a227e.yaml   | 69 +++++++++++++++++++
>  2 files changed, 69 insertions(+), 30 deletions(-)


> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/ts3a227e.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/sound/ts3a227e.yaml#"


Filename based on compatible, so ti,ts3a227e.yaml

> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"

Drop quotes from both lines above.

> +
> +title: Texas Instruments TS3A227E
> +  Autonomous Audio Accessory Detection and Configuration Switch
> +
> +maintainers:
> +  - Dylan Reid <dgreid@chromium.org>
> +
> +description: |
> +  The TS3A227E detect headsets of 3-ring and 4-ring standards and
> +  switches automatically to route the microphone correctly. It also
> +  handles key press detection in accordance with the Android audio
> +  headset specification v1.0.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,ts3a227e
> +
> +  reg:
> +    description: I2C address of the device.

Skip description, it's obvious.

> +    const: 0x3b
> +
> +  interrupts:
> +    maxItems: 1
> +    description: |
> +      Interrupt number for /INT pin from the ts3a227e.

Skip description

> +
> +  ti,micbias:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Intended MICBIAS voltage (datasheet section 9.6.7).
> +    enum:
> +      - 0 # 2.1 V
> +      - 1 # 2.2 V
> +      - 2 # 2.3 V
> +      - 3 # 2.4 V
> +      - 4 # 2.5 V
> +      - 5 # 2.6 V
> +      - 6 # 2.7 V
> +      - 7 # 2.8 V
> +    default: 2

Old bindings said default is 1. It this was intended, please mention in
commit msg deviations from pure conversion.

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
> +    #include <dt-bindings/gpio/gpio.h>

This header is not used.

> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    i2c0 {

Node name just "i2c"

> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        codec: ts3a227e@3b {

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

audio-controller? audio-switch?

> +            compatible = "ti,ts3a227e";
> +            reg = <0x3b>;
> +            interrupt-parent = <&gpio1>;
> +            interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
> +        };
> +    };
> +
> +...


Best regards,
Krzysztof
