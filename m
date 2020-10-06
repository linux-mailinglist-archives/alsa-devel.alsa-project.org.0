Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B972851AB
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Oct 2020 20:36:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B030F16F8;
	Tue,  6 Oct 2020 20:35:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B030F16F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602009394;
	bh=/hYTiv93KJIvXrIsN/pOxgWkMJg0nawkIy3HXAFsuFs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K0WWIkYKdeJqdAISc4JQnTbdKT+Os67gLwBnXp3SPmZx1NzUPdn2MbaYkcaWsVMEK
	 NBDwU3WIU0EYPz0iY1zdC/6mVoNzKQqXA8a9sHzIkAVLGkPi9mWSGuCkDjfNX5GLiQ
	 5V3xlMb0VBOtpKS0sXqZEDVbaMZBidD8v3K0W+es=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57A5FF80129;
	Tue,  6 Oct 2020 20:34:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98D8CF8012A; Tue,  6 Oct 2020 20:34:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B11EF80127
 for <alsa-devel@alsa-project.org>; Tue,  6 Oct 2020 20:34:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B11EF80127
Received: by mail-ot1-f66.google.com with SMTP id m11so7612430otk.13
 for <alsa-devel@alsa-project.org>; Tue, 06 Oct 2020 11:34:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=T/nFz+O76MoZAtkSPqoZ0ETSJ6m02PU0D0DZHAvgJEQ=;
 b=PljT27Os33w6bAdTKt0o4cuqarCJk2PF71qUROyNMvv3Uk+m8neB+asox7XukXESuH
 aXrEc8wo1IBVB0bTc4yPaNbrdTvKK7HBWpvvuwseX1M3LqM6MHI6/eiJEKvAqc1t6WH5
 CXG9ikForQodNjF2UJJGAL8eI14dgRwVZMIO1HymRQals85pQmdIXxyIXMG47inpnYak
 Ep63dkHkSGzm2L0Z86QTbkxUeM5rYA2d5KrUTSqQwGtZk8MI/rtVisPXPZ67/CmCnZE7
 YwJQrERFJUQFjAcJG21FNNdD7WMP1J3Xxl/R7TsNIEZwXGrqDXhtxwAaufDfkcH/gIHh
 zn4Q==
X-Gm-Message-State: AOAM5338EuDTuDafgrcOXM6xglkFX0/lXssSbjcvMDcBu85FWZI6KOBq
 16KExgvHMIenNGKKdeSj8g==
X-Google-Smtp-Source: ABdhPJx1phcZuRuWBcr3gfWZUoekTD2tydrcY/GXETjtFdoxVappQeymuyeEy49v7QhaTXJ8YJ0LpQ==
X-Received: by 2002:a9d:67c3:: with SMTP id c3mr4065466otn.9.1602009284472;
 Tue, 06 Oct 2020 11:34:44 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m25sm1339206otl.71.2020.10.06.11.34.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 11:34:43 -0700 (PDT)
Received: (nullmailer pid 2597692 invoked by uid 1000);
 Tue, 06 Oct 2020 18:34:42 -0000
Date: Tue, 6 Oct 2020 13:34:42 -0500
From: Rob Herring <robh@kernel.org>
To: "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>
Subject: Re: [PATCH v3 2/2] ASoC: dt-bindings: fsl_xcvr: Add document for XCVR
Message-ID: <20201006183442.GA2591611@bogus>
References: <1601371167-32239-1-git-send-email-viorel.suman@oss.nxp.com>
 <1601371167-32239-3-git-send-email-viorel.suman@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1601371167-32239-3-git-send-email-viorel.suman@oss.nxp.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Viorel Suman <viorel.suman@nxp.com>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Viorel Suman <viorel.suman@gmail.com>,
 Cosmin-Gabriel Samoila <cosmin.samoila@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org
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

On Tue, Sep 29, 2020 at 12:19:27PM +0300, Viorel Suman (OSS) wrote:
> From: Viorel Suman <viorel.suman@nxp.com>
> 
> XCVR (Audio Transceiver) is a new IP module found on i.MX8MP.
> 
> Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
> ---
>  .../devicetree/bindings/sound/fsl,xcvr.yaml        | 103 +++++++++++++++++++++
>  1 file changed, 103 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
> new file mode 100644
> index 00000000..8abab2d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
> @@ -0,0 +1,103 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/fsl,xcvr.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP Audio Transceiver (XCVR) Controller
> +
> +maintainers:
> +  - Viorel Suman <viorel.suman@nxp.com>
> +
> +properties:
> +  $nodename:
> +    pattern: "^xcvr@.*"
> +
> +  compatible:
> +    const: fsl,imx8mp-xcvr
> +
> +  reg:
> +    items:
> +      - description: 20K RAM for code and data
> +      - description: registers space
> +      - description: RX FIFO address
> +      - description: TX FIFO address
> +
> +  reg-names:
> +    items:
> +      - const: ram
> +      - const: regs
> +      - const: rxfifo
> +      - const: txfifo
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Peripheral clock
> +      - description: PHY clock
> +      - description: SPBA clock
> +      - description: PLL clock
> +
> +  clock-names:
> +    items:
> +      - const: ipg
> +      - const: phy
> +      - const: spba
> +      - const: pll_ipg
> +
> +  dmas:
> +    maxItems: 2
> +
> +  dma-names:
> +    items:
> +      - const: rx
> +      - const: tx
> +
> +  firmware-name:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    const: imx/xcvr/xcvr-imx8mp.bin
> +    description: |
> +      Should contain the name of the default firmware image
> +      file located on the firmware search path

We generally only have this if the name/path can't be fixed (per 
compatible) in the driver. Given you only have 1 possible value, that 
doesn't seem to be the case here.

> +
> +  resets:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - dmas
> +  - dma-names
> +  - firmware-name
> +  - resets

additionalProperties: false

> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/imx8mp-clock.h>
> +    #include <dt-bindings/reset/imx8mp-reset.h>
> +
> +    xcvr: xcvr@30cc0000 {
> +           compatible = "fsl,imx8mp-xcvr";
> +           reg = <0x30cc0000 0x800>,
> +                 <0x30cc0800 0x400>,
> +                 <0x30cc0c00 0x080>,
> +                 <0x30cc0e00 0x080>;
> +           reg-names = "ram", "regs", "rxfifo", "txfifo";
> +           interrupts = <0x0 128 IRQ_TYPE_LEVEL_HIGH>;
> +           clocks = <&audiomix_clk IMX8MP_CLK_AUDIOMIX_EARC_IPG>,
> +                    <&audiomix_clk IMX8MP_CLK_AUDIOMIX_EARC_PHY>,
> +                    <&audiomix_clk IMX8MP_CLK_AUDIOMIX_SPBA2_ROOT>,
> +                    <&audiomix_clk IMX8MP_CLK_AUDIOMIX_AUDPLL_ROOT>;
> +           clock-names = "ipg", "phy", "spba", "pll_ipg";
> +           dmas = <&sdma2 30 2 0>, <&sdma2 31 2 0>;
> +           dma-names = "rx", "tx";
> +           firmware-name = "imx/xcvr/xcvr-imx8mp.bin";
> +           resets = <&audiomix_reset 0>;
> +    };
> -- 
> 2.7.4
> 
