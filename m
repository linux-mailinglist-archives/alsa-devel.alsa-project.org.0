Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A93114E8E9F
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 09:04:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B98B1701;
	Mon, 28 Mar 2022 09:03:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B98B1701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648451040;
	bh=KJWiq0YjG26EC2jVSx/2sh8oMq8wE9zu2YjqfRvSsQU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pTbWX0tRQUqbBH+q7AyBjYcCIEtc/PPddoK3dh6Uip69pDNcv1t+10c9E6Q4BEXb/
	 X+a18BKufphXa6xSoxXxsvDJsi45bTmOF1JIPVEApW4zejpBOn2b6TjbKrsNZ5svsz
	 9WMQk7GHf9XVlR6Kb7ZAW86dwksdw0Yd/Qy/yUsE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BAF61F8026A;
	Mon, 28 Mar 2022 09:02:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD3EBF800FA; Mon, 28 Mar 2022 09:02:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15BC3F800FA
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 09:02:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15BC3F800FA
Received: by mail-wr1-f45.google.com with SMTP id u16so18941936wru.4
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 00:02:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ttzi/tDXrHm8JXfwRNFC5cPrcAGFAj+WYkjayZngCu8=;
 b=x1a7r+DIxC9J7Y0d2y8cF/CmeQX871OBGDf7y3TJmSBx+1r+LKm1R5CQwn/ltwGG/P
 uA7Nw5LjLEYGOjU2jxFVNGvu0CC5EPkDr6/8QWYoCrY7L+soSp942rEsYUGkVcPueyKc
 zAdJ0404kAbZuNfZM/l2kbjReEaTBvDa7GK8wklL3pbFskVf+akSVTVrjcaIkLDyQeSb
 qgrNEoqafI8+dxLtohtyHmCNrDypjKR18RQecNapCLA3BMJyOeV+R1lhSL19g5+68e0X
 wV80f9PhHyPAOcXnbE6dRSWuHnCRfPpAzkDJl4arUSmFZWqwyDo4yWWBKJ/Ighy9mm6H
 fVIg==
X-Gm-Message-State: AOAM533XTJ6bcqbUUo3TsF5/BC1czmyoC7+yJeDehTgkczKu6FyAPZib
 TB0S8s5+KudW9lov6l7jyBw=
X-Google-Smtp-Source: ABdhPJzjQh8l8F30AwLVGvdhwBI0GFK0s4dzdv71thdlAp7gQee5x5HSXWJtKK4cj5Qf2Sh6uz7HCQ==
X-Received: by 2002:a5d:6487:0:b0:205:7c2b:b6ba with SMTP id
 o7-20020a5d6487000000b002057c2bb6bamr20807179wri.283.1648450965246; 
 Mon, 28 Mar 2022 00:02:45 -0700 (PDT)
Received: from [192.168.0.162] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.googlemail.com with ESMTPSA id
 p8-20020a5d59a8000000b00204178688d3sm12528434wrr.100.2022.03.28.00.02.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 00:02:44 -0700 (PDT)
Message-ID: <04430db8-da9e-fcf0-c86a-6ef4c0d5408c@kernel.org>
Date: Mon, 28 Mar 2022 09:02:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH v2 1/6] ASoC: dt-bindings: Convert rt5659 bindings to
 YAML schema
Content-Language: en-US
To: Sameer Pujar <spujar@nvidia.com>, broonie@kernel.org,
 lgirdwood@gmail.com, robh+dt@kernel.org, krzk+dt@kernel.org, perex@perex.cz,
 tiwai@suse.com, peter.ujfalusi@linux.intel.com,
 pierre-louis.bossart@linux.intel.com
References: <1648448050-15237-1-git-send-email-spujar@nvidia.com>
 <1648448050-15237-2-git-send-email-spujar@nvidia.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <1648448050-15237-2-git-send-email-spujar@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: oder_chiou@realtek.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, thierry.reding@gmail.com, linux-tegra@vger.kernel.org
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

On 28/03/2022 08:14, Sameer Pujar wrote:
> Convert rt5659.txt DT binding to YAML schema. This binding is applicable
> to rt5658 and rt5659 audio CODECs.
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> Cc: Oder Chiou <oder_chiou@realtek.com>
> ---
>  .../devicetree/bindings/sound/realtek,rt5659.yaml  | 112 +++++++++++++++++++++
>  Documentation/devicetree/bindings/sound/rt5659.txt |  89 ----------------
>  2 files changed, 112 insertions(+), 89 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/realtek,rt5659.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/rt5659.txt
> 
> diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5659.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5659.yaml
> new file mode 100644
> index 0000000..3bd9b6f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/realtek,rt5659.yaml
> @@ -0,0 +1,112 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/realtek,rt5659.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RT5658 and RT5659 audio CODECs
> +
> +description: This device supports I2C only.
> +
> +maintainers:
> +  - Oder Chiou <oder_chiou@realtek.com>
> +
> +allOf:
> +  - $ref: name-prefix.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - realtek,rt5658
> +      - realtek,rt5659
> +
> +  reg:
> +    description: The I2C address of the device

Skip the description, it's obvious.

> +    maxItems: 1
> +
> +  interrupts:
> +    description: The CODEC's interrupt output

Ditto.

> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Master clock (MCLK) to the CODEC
> +
> +  clock-names:
> +    items:
> +      - const: mclk
> +
> +  realtek,in1-differential:
> +    description: MIC1 input is differntial and not single-ended.

typo (differential)

> +    type: boolean
> +
> +  realtek,in3-differential:
> +    description: MIC3 input is differntial and not single-ended.
> +    type: boolean
> +
> +  realtek,in4-differential:
> +    description: MIC3 input is differntial and not single-ended.

MIC4?

> +    type: boolean
> +
> +  realtek,dmic1-data-pin:
> +    description: DMIC1 data pin usage
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum:
> +      - 0 # dmic1 is not used
> +      - 1 # using IN2N pin as dmic1 data pin
> +      - 2 # using GPIO5 pin as dmic1 data pin
> +      - 3 # using GPIO9 pin as dmic1 data pin
> +      - 4 # using GPIO11 pin as dmic1 data pin
> +
> +  realtek,dmic2-data-pin:
> +    description: DMIC2 data pin usage
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum:
> +      - 0 # dmic2 is not used
> +      - 1 # using IN2P pin as dmic2 data pin
> +      - 2 # using GPIO6 pin as dmic2 data pin
> +      - 3 # using GPIO10 pin as dmic2 data pin
> +      - 4 # using GPIO12 pin as dmic2 data pin
> +
> +  realtek,jd-src:
> +    description: Jack detect source
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum:
> +      - 0 # No JD is used
> +      - 1 # using JD3 as JD source
> +      - 2 # JD source for Intel HDA header
> +
> +  realtek,ldo1-en-gpios:
> +    description: The GPIO that controls the CODEC's LDO1_EN pin.

maxItems

> +
> +  realtek,reset-gpios:
> +    description: The GPIO that controls the CODEC's RESET pin.

maxItems

What about the ports node?


Best regards,
Krzysztof
