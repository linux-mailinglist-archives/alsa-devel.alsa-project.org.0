Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 816EB5F339C
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Oct 2022 18:31:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E89B7185B;
	Mon,  3 Oct 2022 18:30:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E89B7185B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664814671;
	bh=BVrWl/L4OvvE0c6nx7VqTvdbdR4GZKGELyhq7c+9eLE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eqO90e2DCClIhlCjDdqkqfTDsr7AgxcS5UlyL5UFgEr6GZoNfIvNYZ2s9N4HSbmA0
	 nW4xHwzkmet31fjPxvMfvdAm44EO1zqSw8CROF3bR8Wvx+dq87sZCOdwC1CuDElLQI
	 qWJ+Z1dIWk/zU2qx6ztqZmi7u+QcPooU1MTl2DWA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52B1FF80431;
	Mon,  3 Oct 2022 18:30:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0862F80269; Mon,  3 Oct 2022 18:30:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2E6AF800CC
 for <alsa-devel@alsa-project.org>; Mon,  3 Oct 2022 18:30:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2E6AF800CC
Received: by mail-oi1-f170.google.com with SMTP id d64so11832087oia.9
 for <alsa-devel@alsa-project.org>; Mon, 03 Oct 2022 09:30:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=Z8bhw8KWURng5sgFh0E/mD3292ZtU7YxiWBlIMJpOYY=;
 b=OpP1XlFaHzCMfVhs/ymS6QC/uWNd2NrqamymIdSsezDZZ4ehxlbCCdlEO0C7P7R/TN
 4npJwdOQPx7QQPjqV7PxELYM55oOFDB98bspzF5avol/euZX8Vs3NWHz/9V1tG1h6ic1
 Iiu6CI06140AFvmS6FmXU/8EZLXJDJ4GkH8KOfj/hPuZyztNcv0sa/RsiRALDMrK6uoL
 zvDTy66eqQE3wdEwLlo9NOZ2b5BzT4MKXthev4qZ7fMQlObnsW4oadbxNHgVXVvP7QOv
 Bp4lcYwgHL0M4zEk8YldfyP34fwhdmeBsUSiuVaYgkYMzBH6r9n4FIRflBEGe2I7yYqD
 9Rqw==
X-Gm-Message-State: ACrzQf3JNt2h5fSp3dnx1Zs4SmJCtKWwttrjx3KTLNicdfu0z4trJJLt
 n+4/dLd90ehaPjMHIt8oIQ==
X-Google-Smtp-Source: AMsMyM7kaYivTKyMC0GBQUQuZJsRhUMyCBIBIpe90Y012jEle/2jTj0mEN9L2psWqu+lC5AHZFfeAA==
X-Received: by 2002:a05:6808:179e:b0:350:ae4d:dd3f with SMTP id
 bg30-20020a056808179e00b00350ae4ddd3fmr4354231oib.0.1664814603763; 
 Mon, 03 Oct 2022 09:30:03 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 d1-20020a056871040100b0010e73e252b8sm3070361oag.6.2022.10.03.09.30.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 09:30:03 -0700 (PDT)
Received: (nullmailer pid 2413088 invoked by uid 1000);
 Mon, 03 Oct 2022 16:30:02 -0000
Date: Mon, 3 Oct 2022 11:30:02 -0500
From: Rob Herring <robh@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Subject: Re: [PATCH 10/12] dt-bindings: mediatek: mt8188: add audio afe
 document
Message-ID: <20221003163002.GA2407363-robh@kernel.org>
References: <20220930145701.18790-1-trevor.wu@mediatek.com>
 <20220930145701.18790-11-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220930145701.18790-11-trevor.wu@mediatek.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
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

On Fri, Sep 30, 2022 at 10:56:59PM +0800, Trevor Wu wrote:
> Add mt8188 audio afe document.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>  .../bindings/sound/mt8188-afe-pcm.yaml        | 202 ++++++++++++++++++
>  1 file changed, 202 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mt8188-afe-pcm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt8188-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8188-afe-pcm.yaml
> new file mode 100644
> index 000000000000..50d53c5d59ad
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mt8188-afe-pcm.yaml
> @@ -0,0 +1,202 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mt8188-afe-pcm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek AFE PCM controller for mt8188
> +
> +maintainers:
> +  - Trevor Wu <trevor.wu@mediatek.com>
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8188-audio

If the block is called 'AFE PCM controller', then perhaps use some of 
that for the name instead of just 'audio'.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    const: audiosys
> +
> +  memory-region:
> +    maxItems: 1
> +    description: |
> +      Shared memory region for AFE memif.  A "shared-dma-pool".
> +      See ../reserved-memory/reserved-memory.txt for details.

What does that file contain?

No need to provide generic descriptions of common properties, so the 
reference can just be dropped.

> +
> +  mediatek,topckgen:
> +    $ref: "/schemas/types.yaml#/definitions/phandle"

Don't need quotes.

> +    description: The phandle of the mediatek topckgen controller
> +
> +  mediatek,infracfg:
> +    $ref: "/schemas/types.yaml#/definitions/phandle"
> +    description: The phandle of the mediatek infracfg controller
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: 26M clock
> +      - description: audio pll1 clock
> +      - description: audio pll2 clock
> +      - description: clock divider for i2si1_mck
> +      - description: clock divider for i2si2_mck
> +      - description: clock divider for i2so1_mck
> +      - description: clock divider for i2so2_mck
> +      - description: clock divider for dptx_mck
> +      - description: a1sys hoping clock
> +      - description: audio intbus clock
> +      - description: audio hires clock
> +      - description: audio local bus clock
> +      - description: mux for dptx_mck
> +      - description: mux for i2so1_mck
> +      - description: mux for i2so2_mck
> +      - description: mux for i2si1_mck
> +      - description: mux for i2si2_mck
> +      - description: audio 26m clock
> +
> +  clock-names:
> +    items:
> +      - const: clk26m
> +      - const: apll1_ck
> +      - const: apll2_ck
> +      - const: apll12_div0
> +      - const: apll12_div1
> +      - const: apll12_div2
> +      - const: apll12_div3
> +      - const: apll12_div9
> +      - const: a1sys_hp_sel
> +      - const: aud_intbus_sel
> +      - const: audio_h_sel
> +      - const: audio_local_bus_sel
> +      - const: dptx_m_sel
> +      - const: i2so1_m_sel
> +      - const: i2so2_m_sel
> +      - const: i2si1_m_sel
> +      - const: i2si2_m_sel
> +      - const: adsp_audio26m
> +
> +  mediatek,etdm-in1-chn-disabled:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    maxItems: 16
> +    description: Specify which input channel should be disabled.

What value disables/enables?

items:
  enum: [ ??? ]

> +
> +  mediatek,etdm-in2-chn-disabled:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    maxItems: 16
> +    description: Specify which input channel should be disabled.
> +
> +patternProperties:
> +  "^mediatek,etdm-in[1-2]-mclk-always-on-rate-hz$":
> +    description: Specify etdm in mclk output rate for always on case.
> +
> +  "^mediatek,etdm-out[1-3]-mclk-always-on-rate-hz$":
> +    description: Specify etdm out mclk output rate for always on case.
> +
> +  "^mediatek,etdm-in[1-2]-multi-pin-mode$":
> +    type: boolean
> +    description: if present, the etdm data mode is I2S.
> +
> +  "^mediatek,etdm-out[1-3]-multi-pin-mode$":
> +    type: boolean
> +    description: if present, the etdm data mode is I2S.
> +
> +  "^mediatek,etdm-in[1-2]-cowork-source$":
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      etdm modules can share the same external clock pin. Specify
> +      which etdm clock source is required by this etdm in moudule.
> +    enum:
> +      - 0 # etdm1_in
> +      - 1 # etdm2_in
> +      - 2 # etdm1_out
> +      - 3 # etdm2_out
> +
> +  "^mediatek,etdm-out[1-2]-cowork-source$":
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      etdm modules can share the same external clock pin. Specify
> +      which etdm clock source is required by this etdm out moudule.
> +    enum:
> +      - 0 # etdm1_in
> +      - 1 # etdm2_in
> +      - 2 # etdm1_out
> +      - 3 # etdm2_out
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - resets
> +  - reset-names
> +  - mediatek,topckgen
> +  - mediatek,infracfg
> +  - power-domains
> +  - clocks
> +  - clock-names
> +  - memory-region
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    afe: afe@10b10000 {
> +        compatible = "mediatek,mt8188-audio";
> +        reg = <0x10b10000 0x10000>;
> +        interrupts = <GIC_SPI 822 IRQ_TYPE_LEVEL_HIGH 0>;
> +        resets = <&watchdog 14>;
> +        reset-names = "audiosys";
> +        mediatek,topckgen = <&topckgen>;
> +        mediatek,infracfg = <&infracfg_ao>;
> +        power-domains = <&spm 7>; //MT8195_POWER_DOMAIN_AUDIO
> +        memory-region = <&snd_dma_mem_reserved>;
> +        clocks = <&clk26m>,
> +                 <&topckgen 72>, //CLK_TOP_APLL1
> +                 <&topckgen 73>, //CLK_TOP_APLL2
> +                 <&topckgen 186>, //CLK_TOP_APLL12_CK_DIV0
> +                 <&topckgen 187>, //CLK_TOP_APLL12_CK_DIV1
> +                 <&topckgen 188>, //CLK_TOP_APLL12_CK_DIV2
> +                 <&topckgen 189>, //CLK_TOP_APLL12_CK_DIV3
> +                 <&topckgen 191>, //CLK_TOP_APLL12_CK_DIV9
> +                 <&topckgen 83>, //CLK_TOP_A1SYS_HP
> +                 <&topckgen 31>, //CLK_TOP_AUD_INTBUS
> +                 <&topckgen 32>, //CLK_TOP_AUDIO_H
> +                 <&topckgen 69>, //CLK_TOP_AUDIO_LOCAL_BUS
> +                 <&topckgen 81>, //CLK_TOP_DPTX
> +                 <&topckgen 77>, //CLK_TOP_I2SO1
> +                 <&topckgen 78>, //CLK_TOP_I2SO2
> +                 <&topckgen 79>, //CLK_TOP_I2SI1
> +                 <&topckgen 80>, //CLK_TOP_I2SI2
> +                 <&adsp_audio26m 0>; //CLK_AUDIODSP_AUDIO26M
> +        clock-names = "clk26m",
> +                      "apll1_ck",
> +                      "apll2_ck",
> +                      "apll12_div0",
> +                      "apll12_div1",
> +                      "apll12_div2",
> +                      "apll12_div3",
> +                      "apll12_div9",
> +                      "a1sys_hp_sel",
> +                      "aud_intbus_sel",
> +                      "audio_h_sel",
> +                      "audio_local_bus_sel",
> +                      "dptx_m_sel",
> +                      "i2so1_m_sel",
> +                      "i2so2_m_sel",
> +                      "i2si1_m_sel",
> +                      "i2si2_m_sel",
> +                      "adsp_audio_26m";
> +    };
> +
> +...
> -- 
> 2.18.0
> 
> 
