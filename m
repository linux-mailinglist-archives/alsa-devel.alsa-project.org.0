Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA6F5B1BF5
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 13:54:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA39616EE;
	Thu,  8 Sep 2022 13:54:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA39616EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662638090;
	bh=ksFJxYOmuo0K0leIYCaPCZpX446qX+tTY629ymhaggI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rZFqTdxErQvNo7c5LQU7i11nQ5HnJ40MTTWudfKahr2vpig32wU6ZbywlcolHEhyQ
	 8S/sscn2YljU/VIkF06YP4oMPMJk9H63SC/cmf1cfmq1bSX5+R83+rHrNfWDP5QykB
	 CjXOjHri10MAHTZCDLjBq3zwu0dndb7HCjUMi2is=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 305BDF8016D;
	Thu,  8 Sep 2022 13:53:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56C82F8016D; Thu,  8 Sep 2022 13:53:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4813EF800CB
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 13:53:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4813EF800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="E1ebbQoH"
Received: by mail-lf1-x129.google.com with SMTP id i26so11556392lfp.11
 for <alsa-devel@alsa-project.org>; Thu, 08 Sep 2022 04:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=iRuj9MmFc1SCJLCaHL8wU+6QRDALzTMmNIxwRLm5wlo=;
 b=E1ebbQoHrW+/VfxPqYc0KjatYpsu58UrKW5S2ZZc8M4onNSkHDJ/19V6NhbIEWN/ZC
 EW+bdOU0fygsFZa9BgSirhgqcjkhddyYn5cF2JeaGU9o31x/zMlvFjl1CgITkBjeIsiI
 1YZB2rllshoEspWfpAnpe9GlwDYVawBxurs964wKLXuLGywagcM1vpngXdZkUo8kx2kt
 GHi3NblhHSn3T781q9eYtTjEBMAZUhDftqT0xesHbPMzEMKdDX14l+9PNb5Zj7nK6eiP
 jrYGTf1xvhdxJ51+ROO4/LYtMWk1pVdtp0Ks3+bp0+eaiJ35ht+AO0EJn6RUlO7bm5cm
 WfnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=iRuj9MmFc1SCJLCaHL8wU+6QRDALzTMmNIxwRLm5wlo=;
 b=QQ9vd7dJmMfP+3dp/1UyeQYj6Huely2Xkql4ZdZFbFPXnb0Xd5a4KQhr7b66tvj9To
 cupyVJLKUTdqR6459/95EicbPoMkNFPpWNZvKrIP5CqKsh+usmNYt/S/xnO3CxVOFjM7
 V2BB8l9QtMoWe2Aj1HJWLud2X+hjhat4Gx4gscTCTBL6sV5+mV5NhFCKa1VUOnXD2vCP
 N8Y9lpAtI0y7ZIZTorG59DcElr54vOcIA1BgOCmwWnMxjB7vVUzdm2kuazRirv9Y84mU
 dxyEiuHHjtuwD4FErjo+a3/JULikm95uen5JoG+au0M7R6476pEile5JhlQN5JZ0nX0Q
 m6Gg==
X-Gm-Message-State: ACgBeo1iVj+e8UH7WL4nELN6tMQULJYPXjj8ZAM3YtcXkpw91gzPMENX
 05QuiSlTxkftcspluMMxmK+SoFst3ubtxA==
X-Google-Smtp-Source: AA6agR4iAQdU6oLoT8Tvfczu2zMwGG5Qj5yA7hI8XaLTD00qADWEc75SRlKViM+IV/RWze1lIH5TOQ==
X-Received: by 2002:a05:6512:259f:b0:494:65bd:7188 with SMTP id
 bf31-20020a056512259f00b0049465bd7188mr2489781lfb.501.1662638021279; 
 Thu, 08 Sep 2022 04:53:41 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 t11-20020a05651c204b00b00261e50a2534sm3128127ljo.33.2022.09.08.04.53.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 04:53:40 -0700 (PDT)
Message-ID: <d447edf0-1726-d742-d932-d24707657691@linaro.org>
Date: Thu, 8 Sep 2022 13:53:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/8] ASoC: rockchip: rk3308: add internal audio codec
 bindings
Content-Language: en-US
To: luca.ceresoli@bootlin.com, alsa-devel@alsa-project.org,
 linux-rockchip@lists.infradead.org
References: <20220907142124.2532620-1-luca.ceresoli@bootlin.com>
 <20220907142124.2532620-2-luca.ceresoli@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220907142124.2532620-2-luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Chris Morgan <macromorgan@hotmail.com>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Johan Jonker <jbx6244@gmail.com>,
 linux-arm-kernel@lists.infradead.org
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

On 07/09/2022 16:21, luca.ceresoli@bootlin.com wrote:
> From: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> Add device tree bindings document for the internal audio codec of the
> Rockchip RK3308 SoC.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Use subject prefixes matching the subsystem (git log --oneline -- ...).

> ---
>  .../bindings/sound/rockchip,rk3308-codec.yaml | 102 ++++++++++++++++++
>  MAINTAINERS                                   |   6 ++
>  .../dt-bindings/sound/rockchip,rk3308-codec.h |  15 +++
>  3 files changed, 123 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml
>  create mode 100644 include/dt-bindings/sound/rockchip,rk3308-codec.h
> 
> diff --git a/Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml b/Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml
> new file mode 100644
> index 000000000000..f3458f86ef06
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml
> @@ -0,0 +1,102 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/rockchip,rk3308-codec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip RK3308 Internal Codec
> +
> +description: |
> +  This is the audio codec embedded in the Rockchip RK3308
> +  SoC. It has 8 24-bit ADCs and 2 24-bit DACs. The maximum supported
> +  sampling rate is 192 kHz.
> +
> +  It is connected internally to one out of a selection of the internal I2S
> +  controllers.
> +
> +  The RK3308 audio codec has 8 independent capture channels, but some
> +  features work on stereo pairs called groups:
> +    * grp 0 -- MIC1 / MIC2
> +    * grp 1 -- MIC3 / MIC4
> +    * grp 2 -- MIC5 / MIC6
> +    * grp 3 -- MIC7 / MIC8
> +
> +maintainers:
> +  - Luca Ceresoli <luca.ceresoli@bootlin.com>
> +
> +properties:
> +  compatible:
> +    const: rockchip,rk3308-codec
> +
> +  reg:
> +    maxItems: 1
> +
> +  rockchip,grf:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the General Register Files (GRF)
> +
> +  clocks:
> +    items:
> +      - description: clock for TX
> +      - description: clock for RX
> +      - description: AHB clock driving the interface
> +
> +  clock-names:
> +    items:
> +      - const: mclk_tx
> +      - const: mclk_rx
> +      - const: hclk
> +
> +  resets: true

maxItems: 1

> +
> +  reset-names:
> +    items:
> +      - const: "acodec"

No quotes.

> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  rockchip,micbias-avdd-multiplier:
> +    description: |
> +      Voltage setting for the MICBIAS pins expressed as a multiplier of
> +      AVDD.
> +
> +      E.g. if rockchip,micbias-avdd-multiplier = 7 (x0.85) and AVDD = 3v3,
> +      then MIC BIAS voltage will be 3.3 V * 0.85 = 2.805 V.
> +
> +      Value 0: multiplier = 0.50
> +      Value N: multiplier = 0.50 + 0.05 * N
> +      Value 7: multiplier = 0.85

Use logical values/units. The units is 0.05, so "-percent" in node name.
https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/property-units.yaml
Then drop ref and use enum.

> +
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maximum: 7
> +
> +required:
> +  - compatible
> +  - reg
> +  - rockchip,grf
> +  - clocks
> +  - resets
> +  - "#sound-dai-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/rk3308-cru.h>
> +
> +    acodec: acodec@ff560000 {

codec

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +        compatible = "rockchip,rk3308-codec";
> +        reg = <0xff560000 0x10000>;
> +        rockchip,grf = <&grf>;
> +        clock-names = "mclk_tx", "mclk_rx", "hclk";
> +        clocks = <&cru SCLK_I2S2_8CH_TX_OUT>,
> +                 <&cru SCLK_I2S2_8CH_RX_OUT>,
> +                 <&cru PCLK_ACODEC>;
> +        reset-names = "acodec";
> +        resets = <&cru SRST_ACODEC_P>;
> +        #sound-dai-cells = <0>;
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 895e8ace80dd..d53a8e74cb1e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17588,6 +17588,12 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/media/rockchip-rga.yaml
>  F:	drivers/media/platform/rockchip/rga/
>  
> +ROCKCHIP RK3308 INTERNAL AUDIO CODEC
> +M:	Luca Ceresoli <luca.ceresoli@bootlin.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml
> +F:	include/dt-bindings/sound/rockchip,rk3308-codec.h
> +
>  ROCKCHIP VIDEO DECODER DRIVER
>  M:	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>  L:	linux-media@vger.kernel.org
> diff --git a/include/dt-bindings/sound/rockchip,rk3308-codec.h b/include/dt-bindings/sound/rockchip,rk3308-codec.h
> new file mode 100644
> index 000000000000..9f1b210a048e
> --- /dev/null
> +++ b/include/dt-bindings/sound/rockchip,rk3308-codec.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */

Dual license.

> +#ifndef __DT_BINDINGS_ROCKCHIP_RK3308_CODEC_H__
> +#define __DT_BINDINGS_ROCKCHIP_RK3308_CODEC_H__
> +
> +#define RK3308_CODEC_MICBIAS_AVDD_x_0_50	0
> +#define RK3308_CODEC_MICBIAS_AVDD_x_0_55	1
> +#define RK3308_CODEC_MICBIAS_AVDD_x_0_60	2
> +#define RK3308_CODEC_MICBIAS_AVDD_x_0_65	3
> +#define RK3308_CODEC_MICBIAS_AVDD_x_0_70	4
> +#define RK3308_CODEC_MICBIAS_AVDD_x_0_75	5
> +#define RK3308_CODEC_MICBIAS_AVDD_x_0_80	6
> +#define RK3308_CODEC_MICBIAS_AVDD_x_0_85	7

You store register values in the bindings. Nope. Bindings are not for this.

Best regards,
Krzysztof
