Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E353FCF94
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Sep 2021 00:31:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE43816D9;
	Wed,  1 Sep 2021 00:30:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE43816D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630449069;
	bh=Ax8gk9v+7Rk9mTw8Z0myQKhXLSuIivUGOI1C/q8GI1o=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=szw0vjFtOBxtE2X54ooNKRKH96wwIOow9/CqW3NQRjnnl2QCuQ2TIThqTvcyG0NR8
	 yPKjOjJGYeDRjS5sVp3bZWrkkX/9tBU0WvmfJYU4/Z15sjZrs19leIjax+LgLhCzpQ
	 LLyuhyAazvqkWqvfzWJVpt2CNY/pHq6f0cnPd6Os=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30388F8028D;
	Wed,  1 Sep 2021 00:29:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 838B9F8025B; Wed,  1 Sep 2021 00:29:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CF00F80169
 for <alsa-devel@alsa-project.org>; Wed,  1 Sep 2021 00:29:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CF00F80169
Received: by mail-oi1-f182.google.com with SMTP id r26so1271134oij.2
 for <alsa-devel@alsa-project.org>; Tue, 31 Aug 2021 15:29:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DlIKGrJhzXDsC2KcNbGElcUOBBOTh/HViU6kDBixtqI=;
 b=VwPW9RPS8NSf1hGta6Aaq937gC09p5RdPuOtDYzMqSw4Q04EYHk3A2UGvIqSjUn1o7
 D8Fd53Km15nY7A9XO6KRuEeN53FWsVzNN7f+1xgj1U3EiazgnwiBjibsAeBHEHn2m5gJ
 nI/z0hdItU4C6WWGKmI0/PEKtTPIu5oQ/ZQT4fZpBGK/mhUkZKy22LzqPecLGtNSDkpA
 2U2XOMjLgymL81dBT9uVdB1P5ae2grrGZr7bAVFnfNacxqWE7KpAPqR6fakdrzAm1you
 qJX0OZPVJxwKXH6lqYiemsYBeNTJPNiX1A6Y6qiV2TWFNSdHdR0oau57xRHyUcX1c0yM
 4XVA==
X-Gm-Message-State: AOAM531wuzfbl5xv74dsS3Fy/f3Sz5b/P9ylzsCtjKQ+lZm5twRCi5MT
 rBmvYJ0sOVVRaoui3ZXR6A==
X-Google-Smtp-Source: ABdhPJxJpEVmzxg/L1hN2ArJ25r6p596P18MN9gR3Yo8prFOuHrsPGKBIVNukJC2oiJeGwhh1XTWJg==
X-Received: by 2002:a05:6808:46:: with SMTP id v6mr4833237oic.61.1630448943615; 
 Tue, 31 Aug 2021 15:29:03 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id n73sm3970960oig.9.2021.08.31.15.29.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 15:29:03 -0700 (PDT)
Received: (nullmailer pid 756533 invoked by uid 1000);
 Tue, 31 Aug 2021 22:29:02 -0000
Date: Tue, 31 Aug 2021 17:29:02 -0500
From: Rob Herring <robh@kernel.org>
To: Sugar Zhang <sugar.zhang@rock-chips.com>
Subject: Re: [PATCH v2 7/7] ASoC: dt-bindings: rockchip: Convert pdm bindings
 to yaml
Message-ID: <YS6tLlVSjnYZtEil@robh.at.kernel.org>
References: <1630285788-28002-1-git-send-email-sugar.zhang@rock-chips.com>
 <1630285861-28147-2-git-send-email-sugar.zhang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1630285861-28147-2-git-send-email-sugar.zhang@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 broonie@kernel.org, heiko@sntech.de, devicetree@vger.kernel.org
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

On Mon, Aug 30, 2021 at 09:11:01AM +0800, Sugar Zhang wrote:
> This patch converts pdm bindings to yaml.
> 
> Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
> ---
> 
> Changes in v2:
> - Fix yamllint errors.
> 
>  .../devicetree/bindings/sound/rockchip,pdm.txt     |  64 ------------
>  .../devicetree/bindings/sound/rockchip,pdm.yaml    | 115 +++++++++++++++++++++
>  2 files changed, 115 insertions(+), 64 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/rockchip,pdm.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/rockchip,pdm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/rockchip,pdm.txt b/Documentation/devicetree/bindings/sound/rockchip,pdm.txt
> deleted file mode 100644
> index b2d7e47..0000000
> --- a/Documentation/devicetree/bindings/sound/rockchip,pdm.txt
> +++ /dev/null
> @@ -1,64 +0,0 @@
> -* Rockchip PDM controller
> -
> -Required properties:
> -
> -- compatible: "rockchip,pdm"
> -  - "rockchip,px30-pdm"
> -  - "rockchip,rk1808-pdm"
> -  - "rockchip,rk3308-pdm"
> -  - "rockchip,rk3568-pdm"
> -  - "rockchip,rv1126-pdm"
> -- reg: physical base address of the controller and length of memory mapped
> -  region.
> -- dmas: DMA specifiers for rx dma. See the DMA client binding,
> -	Documentation/devicetree/bindings/dma/dma.txt
> -- dma-names: should include "rx".
> -- clocks: a list of phandle + clock-specifer pairs, one for each entry in clock-names.
> -- clock-names: should contain following:
> -   - "pdm_hclk": clock for PDM BUS
> -   - "pdm_clk" : clock for PDM controller
> -- resets: a list of phandle + reset-specifer paris, one for each entry in reset-names.
> -- reset-names: reset names, should include "pdm-m".
> -- pinctrl-names: Must contain a "default" entry.
> -- pinctrl-N: One property must exist for each entry in
> -	     pinctrl-names. See ../pinctrl/pinctrl-bindings.txt
> -	     for details of the property values.
> -
> -Optional properties:
> -- rockchip,path-map: This is a variable length array, that shows the mapping
> -  of SDIx to PATHx. By default, they are one-to-one mapping as follows:
> -
> -   path0 <-- sdi0
> -   path1 <-- sdi1
> -   path2 <-- sdi2
> -   path3 <-- sdi3
> -
> -  e.g. "rockchip,path-map = <3 2 1 0>" means the mapping as follows:
> -
> -   path0 <-- sdi3
> -   path1 <-- sdi2
> -   path2 <-- sdi1
> -   path3 <-- sdi0
> -
> -Example for rk3328 PDM controller:
> -
> -pdm: pdm@ff040000 {
> -	compatible = "rockchip,pdm";
> -	reg = <0x0 0xff040000 0x0 0x1000>;
> -	clocks = <&clk_pdm>, <&clk_gates28 0>;
> -	clock-names = "pdm_clk", "pdm_hclk";
> -	dmas = <&pdma 16>;
> -	#dma-cells = <1>;
> -	dma-names = "rx";
> -	pinctrl-names = "default", "sleep";
> -	pinctrl-0 = <&pdmm0_clk
> -		     &pdmm0_sdi0
> -		     &pdmm0_sdi1
> -		     &pdmm0_sdi2
> -		     &pdmm0_sdi3>;
> -	pinctrl-1 = <&pdmm0_clk_sleep
> -		     &pdmm0_sdi0_sleep
> -		     &pdmm0_sdi1_sleep
> -		     &pdmm0_sdi2_sleep
> -		     &pdmm0_sdi3_sleep>;
> -};
> diff --git a/Documentation/devicetree/bindings/sound/rockchip,pdm.yaml b/Documentation/devicetree/bindings/sound/rockchip,pdm.yaml
> new file mode 100644
> index 0000000..fa24ddf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/rockchip,pdm.yaml
> @@ -0,0 +1,115 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/rockchip,pdm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip PDM controller
> +
> +description:
> +  The Pulse Density Modulation Interface Controller (PDMC) is
> +  a PDM interface controller and decoder that support PDM format.
> +  It integrates a clock generator driving the PDM microphone
> +  and embeds filters which decimate the incoming bit stream to
> +  obtain most common audio rates.
> +
> +maintainers:
> +  - Heiko Stuebner <heiko@sntech.de>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - rockchip,pdm
> +      - rockchip,px30-pdm
> +      - rockchip,rk1808-pdm
> +      - rockchip,rk3308-pdm
> +      - rockchip,rk3568-pdm
> +      - rockchip,rv1126-pdm
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: clock for PDM controller
> +      - description: clock for PDM BUS
> +
> +  clock-names:
> +    items:
> +      - const: pdm_clk
> +      - const: pdm_hclk
> +
> +  dmas:
> +    maxItems: 1
> +
> +  dma-names:
> +    items:
> +      - const: rx
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    items:
> +      - description: reset for PDM controller
> +
> +  reset-names:
> +    items:
> +      - const: pdm-m
> +
> +  rockchip,path-map:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description:
> +      Defines the mapping of PDM SDIx to PDM PATHx.
> +      By default, they are mapped one-to-one.
> +    items:
> +      - description: which sdi to connect to path 0
> +      - description: which sdi to connect to path 1
> +      - description: which sdi to connect to path 2
> +      - description: which sdi to connect to path 3

This would be more specific in terms of allowed values:

maxItems: 4
uniqueItems: true
items:
  enum: [ 0, 1, 2, 3 ]

> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - dmas
> +  - dma-names
> +  - "#sound-dai-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/rk3328-cru.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/pinctrl/rockchip.h>
> +    pdm@ff040000 {
> +      compatible = "rockchip,pdm";
> +      reg = <0x0 0xff040000 0x0 0x1000>;
> +      interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
> +      clocks = <&cru SCLK_PDM>, <&cru HCLK_PDM>;
> +      clock-names = "pdm_clk", "pdm_hclk";
> +      dmas = <&dmac 16>;
> +      dma-names = "rx";
> +      #sound-dai-cells = <0>;
> +      pinctrl-names = "default", "sleep";
> +      pinctrl-0 = <&pdmm0_clk
> +                   &pdmm0_sdi0
> +                   &pdmm0_sdi1
> +                   &pdmm0_sdi2
> +                   &pdmm0_sdi3>;
> +      pinctrl-1 = <&pdmm0_clk_sleep
> +                   &pdmm0_sdi0_sleep
> +                   &pdmm0_sdi1_sleep
> +                   &pdmm0_sdi2_sleep
> +                   &pdmm0_sdi3_sleep>;
> +    };
> -- 
> 2.7.4
> 
> 
> 
> 
