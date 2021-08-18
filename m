Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEE63F097E
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Aug 2021 18:46:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C1C416AA;
	Wed, 18 Aug 2021 18:45:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C1C416AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629305192;
	bh=+PVoO4Fhg6YkdP9kRFkGzlwBOd34hMkjcf3CLzarzDE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FZ2VZ2r6Ixf/P8591MOcc2Zr0Jwwj08P6lRnOSJ5oF8KkYWLDaGif3jotVPcd5AcO
	 jQ+Yt/KXtOTnmk0ckJ88a3LPBGa2A+Ifg8HH8waXavhisumH8fIx37z5BfzCqw5ngi
	 VSwa6AxnBIvPWyifgcclQCQhXIKthqLmLijePkvw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6851F80259;
	Wed, 18 Aug 2021 18:45:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C13B4F80249; Wed, 18 Aug 2021 18:45:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0218FF80163
 for <alsa-devel@alsa-project.org>; Wed, 18 Aug 2021 18:45:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0218FF80163
Received: by mail-oi1-f180.google.com with SMTP id bd1so4214617oib.3
 for <alsa-devel@alsa-project.org>; Wed, 18 Aug 2021 09:45:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=j4p+QzPcxX1KO6/vzInX+XzVndfnvWYW6jLDLoMv7Jc=;
 b=O8Q5vtB+Xh2kzGgivdt82rtD4WvYwzjUUYIqPn++kynr5GQd3219zxVqGWkRpM6PfX
 SwsU4nc7jILyc/Iqh3WfOUg0KCYn47l3hpkoo8jnKe2CwVkauZMsYQYMM7cPRWfINgE+
 daWURU4XSXLHhy1lCtvtu6q5LHAR5yXE3pDgZotM2L8y8ikOzB4LTlPCsgtrZUtaapGI
 WHiwXwqF+bzuTUkKOOUQAPe5hhRkTpFGO7vHpUCghrJdIafTuBp1Bm8x9OtgzIg4IM4y
 j26pcpbkUy0MCUjURA+pZCKhg1ej5n0tUmiHyPT7yNgfhuLhim8l+FLVP+yeAwUJepkg
 caLg==
X-Gm-Message-State: AOAM531qnbMoCKoYkeSnfE+hryOyHi6ljwWe+VcA07jTWVYd4eQDUOeO
 v8dckaVEXeeDEDnuoI4waw==
X-Google-Smtp-Source: ABdhPJyGMOqRAF2+mTS589CkuekxoogzJnDR4EgPb4SQF+GAKHmsmrRL11YaskqHDxMRmr0Id2Y32A==
X-Received: by 2002:aca:2b05:: with SMTP id i5mr7870896oik.55.1629305100437;
 Wed, 18 Aug 2021 09:45:00 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k24sm102593otp.31.2021.08.18.09.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 09:44:59 -0700 (PDT)
Received: (nullmailer pid 2737924 invoked by uid 1000);
 Wed, 18 Aug 2021 16:44:58 -0000
Date: Wed, 18 Aug 2021 11:44:58 -0500
From: Rob Herring <robh@kernel.org>
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: sound: add rockchip i2s-tdm binding
Message-ID: <YR05Cj5R3cH+rTMx@robh.at.kernel.org>
References: <20210817101119.423853-1-frattaroli.nicolas@gmail.com>
 <20210817101119.423853-3-frattaroli.nicolas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210817101119.423853-3-frattaroli.nicolas@gmail.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org
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

On Tue, Aug 17, 2021 at 12:11:17PM +0200, Nicolas Frattaroli wrote:
> This adds the YAML bindings for the Rockchip I2S/TDM audio driver.
> 
> Signed-off-by: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
> ---
>  .../bindings/sound/rockchip,i2s-tdm.yaml      | 221 ++++++++++++++++++
>  include/dt-bindings/sound/rockchip,i2s-tdm.h  |   9 +
>  2 files changed, 230 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
>  create mode 100644 include/dt-bindings/sound/rockchip,i2s-tdm.h
> 
> diff --git a/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml b/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
> new file mode 100644
> index 000000000000..c3022620b47f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
> @@ -0,0 +1,221 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/rockchip,i2s-tdm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip I2S/TDM Controller
> +
> +description:
> +  The Rockchip I2S/TDM Controller is a Time Division Multiplexed
> +  audio interface found in various Rockchip SoCs, allowing up
> +  to 8 channels of audio over a serial interface.
> +
> +maintainers:
> +  - Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - rockchip,px30-i2s-tdm
> +      - rockchip,rk1808-i2s-tdm
> +      - rockchip,rk3308-i2s-tdm
> +      - rockchip,rk3568-i2s-tdm
> +      - rockchip,rv1126-i2s-tdm
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  dmas:
> +    minItems: 1
> +    maxItems: 2
> +
> +  dma-names:
> +    oneOf:
> +      - const: rx
> +      - items:
> +          - const: tx
> +          - const: rx

If 'rx' is always present, then make it first:

minItems: 1
items:
  - const: rx
  - const: tx

> +
> +  clocks:
> +    items:
> +      - description: clock for TX
> +      - description: clock for RX
> +      - description: clock for I2S bus
> +
> +  clock-names:
> +    items:
> +      - const: mclk_tx
> +      - const: mclk_rx
> +      - const: hclk
> +
> +  rockchip,frame-width:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 64
> +    minimum: 32
> +    maximum: 512
> +    description:
> +      Width of a frame, usually slot width multiplied by number of slots.
> +      Must be even.
> +
> +  resets:
> +    items:
> +      - description: reset for TX
> +      - description: reset for RX
> +
> +  reset-names:
> +    items:
> +      - const: tx-m
> +      - const: rx-m
> +
> +  rockchip,cru:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The phandle of the cru.
> +      Required if both playback and capture are used, i.e. if rockchip,clk-trcm
> +      is 0.
> +
> +  rockchip,grf:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The phandle of the syscon node for the GRF register.
> +
> +  rockchip,mclk-calibrate:
> +    description:
> +      Enable mclk source calibration.
> +    type: boolean
> +
> +  rockchip,trcm-sync:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Which lrck/bclk clocks each direction will sync to. You should use the
> +      constants in <dt-bindings/sound/rockchip,i2s-tdm.h>
> +    oneOf:
> +      - const: 0
> +        description:
> +          RK_TRCM_TXRX. Use both the TX and the RX clock for TX and RX.
> +      - const: 1
> +        description:
> +          RK_TRCM_TX. Use only the TX clock for TX and RX.
> +      - const: 2
> +        description:
> +          RK_TRCM_RX. Use only the RX clock for TX and RX.
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  rockchip,no-dmaengine:
> +    description:
> +      If present, driver will not register a pcm dmaengine, only the dai.
> +      If the dai is part of multi-dais, the property should be present.
> +    type: boolean
> +
> +  rockchip,playback-only:
> +    description: Specify that the controller only has playback capability.
> +    type: boolean
> +
> +  rockchip,capture-only:
> +    description: Specify that the controller only has capture capability.
> +    type: boolean
> +
> +  rockchip,i2s-rx-route:
> +    $ref: /schemas/types.yaml#/definitions/uint32

A single uint32 or

> +    description:
> +      Defines the mapping of I2S RX sdis to I2S data bus lines.
> +      By default, they are mapped one-to-one.
> +    items:
> +      - description: which sdi to connect to data line 0
> +      - description: which sdi to connect to data line 1
> +      - description: which sdi to connect to data line 2
> +      - description: which sdi to connect to data line 3

An array of 4 uint32s?

> +
> +  rockchip,i2s-tx-route:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Defines the mapping of I2S TX sdos to I2S data bus lines.
> +      By default, they are mapped one-to-one.
> +    items:
> +      - description: which sdo to connect to data line 0
> +      - description: which sdo to connect to data line 1
> +      - description: which sdo to connect to data line 2
> +      - description: which sdo to connect to data line 3
> +
> +  rockchip,tdm-fsync-half-frame:
> +    description: Whether to use half frame fsync.
> +    type: boolean
> +
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - dmas
> +  - dma-names
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - rockchip,grf
> +  - "#sound-dai-cells"
> +  - rockchip,trcm-sync
> +
> +allOf:
> +  - if:
> +      properties:
> +        rockchip,clk-trcm:

This property doesn't exist.

> +          contains:
> +            enum: [0]
> +    then:
> +      required:
> +        - rockchip,cru
> +
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/rk3568-cru.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/pinctrl/rockchip.h>
> +    #include <dt-bindings/sound/rockchip,i2s-tdm.h>
> +
> +
> +    foo {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +        i2s@fe410000 {
> +            compatible = "rockchip,rk3568-i2s-tdm";
> +            reg = <0x0 0xfe410000 0x0 0x1000>;
> +            interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&cru MCLK_I2S1_8CH_TX>, <&cru MCLK_I2S1_8CH_RX>,
> +                     <&cru HCLK_I2S1_8CH>;
> +            clock-names = "mclk_tx", "mclk_rx", "hclk";
> +            dmas = <&dmac1 2>, <&dmac1 3>;
> +            dma-names = "tx", "rx";
> +            resets = <&cru SRST_M_I2S1_8CH_TX>, <&cru SRST_M_I2S1_8CH_RX>;
> +            reset-names = "tx-m", "rx-m";
> +            rockchip,trcm-sync = <RK_TRCM_TX>;
> +            rockchip,cru = <&cru>;
> +            rockchip,grf = <&grf>;
> +            #sound-dai-cells = <0>;
> +            pinctrl-names = "default";
> +            pinctrl-0 =
> +                <&i2s1m0_sclktx
> +                &i2s1m0_sclkrx
> +                &i2s1m0_lrcktx
> +                &i2s1m0_lrckrx
> +                &i2s1m0_sdi0
> +                &i2s1m0_sdi1
> +                &i2s1m0_sdi2
> +                &i2s1m0_sdi3
> +                &i2s1m0_sdo0
> +                &i2s1m0_sdo1
> +                &i2s1m0_sdo2
> +                &i2s1m0_sdo3>;
> +            status = "disabled";

Why is the example disabled?

> +        };
> +    };
> diff --git a/include/dt-bindings/sound/rockchip,i2s-tdm.h b/include/dt-bindings/sound/rockchip,i2s-tdm.h
> new file mode 100644
> index 000000000000..32494d64cf33
> --- /dev/null
> +++ b/include/dt-bindings/sound/rockchip,i2s-tdm.h
> @@ -0,0 +1,9 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _DT_BINDINGS_ROCKCHIP_I2S_TDM_H
> +#define _DT_BINDINGS_ROCKCHIP_I2S_TDM_H
> +
> +#define RK_TRCM_TXRX 0
> +#define RK_TRCM_TX 1
> +#define RK_TRCM_RX 2
> +
> +#endif /* _DT_BINDINGS_ROCKCHIP_I2S_TDM_H */
> -- 
> 2.32.0
> 
> 
