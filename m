Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDD8477C2B
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Dec 2021 20:05:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 256B72075;
	Thu, 16 Dec 2021 20:04:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 256B72075
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639681523;
	bh=kRs9CGc9qdgDGb6qMYZ5T8aLaIllgWuAh89BRRkVjwU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rVlrlFmutSGHvtZavGtiwbpoEh9ave8xu3DT2cZBtrJ0ziNv28gFA78CE87w1YZ7I
	 GS+/q8twf8J7r+gFp0iuQW34utmkDqsF5c9cNGatUKNmDRCsXvVyiLC2m1XNA1eBLY
	 A+pLeljraUTqF13dfRfEgLZyvreovp0pbmgooLDk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AFB4F800DE;
	Thu, 16 Dec 2021 20:04:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82C86F8014C; Thu, 16 Dec 2021 20:04:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF66DF800DE
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 20:04:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF66DF800DE
Received: by mail-ot1-f50.google.com with SMTP id
 v15-20020a9d604f000000b0056cdb373b82so48562otj.7
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 11:04:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5/FblGQaJYZssbV69UJ4GBrUt2uvEHBBh4mxqSnBM3E=;
 b=SDV34zMDPrIbrQu7gqE/bh/Gnliu0u08oNZXcSq3KC0HpUGpAxdZNk0crp/mTRxleF
 X2D+cap0eDLjgQ7qzDloAUBMYutw7NX/jtSp/ByVjwLXFFivSQzFS595ltrAEdaaCRhs
 3Bc2jOTI8+ZMCS9fSEDhISAM9EvDS7zsbLYLd0GNmB+ye14Ao86fPj4jmu5e9uxqWhn9
 DAbKlPc4LBGE42Mn/IqgbWW6XSUo9EGqnocUEhkMLPjdokhN/M+l6pdmM2PbWwe4PaVx
 e6n0fujA2rM7ZYz6N5vKVVlVnVF8PXcC52D3b/VCg2omjP1xc+qMKS8ICvumIu3dDSwG
 zoaw==
X-Gm-Message-State: AOAM532O2pU4P9SulsrHXP0Nk6y99tM0tZI61/eOIF8wjNAaAI5d57x1
 I/nDITvdBWVKcCv34n5Kyw==
X-Google-Smtp-Source: ABdhPJylzhDYwAG/ANQ9sMz1+y1MrNz8yzIlAoSA+tfilj3ZOjyyjojSNkGMgpWF30qXQkkor7jaQQ==
X-Received: by 2002:a9d:75d4:: with SMTP id c20mr13665614otl.85.1639681442381; 
 Thu, 16 Dec 2021 11:04:02 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id s26sm1164360oiw.19.2021.12.16.11.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 11:04:01 -0800 (PST)
Received: (nullmailer pid 575687 invoked by uid 1000);
 Thu, 16 Dec 2021 19:04:00 -0000
Date: Thu, 16 Dec 2021 13:04:00 -0600
From: Rob Herring <robh@kernel.org>
To: YC Hung <yc.hung@mediatek.com>
Subject: Re: [PATCH] dt-bindings: dsp: mediatek: add mt8195 dsp document
Message-ID: <YbuNoG3mw2/syi8+@robh.at.kernel.org>
References: <20211215031955.28244-1-yc.hung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211215031955.28244-1-yc.hung@mediatek.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 allen-kh.cheng@mediatek.com, tiwai@suse.com, linux-kernel@vger.kernel.org,
 broonie@kernel.org, linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, daniel.baluta@nxp.com,
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

On Wed, Dec 15, 2021 at 11:19:55AM +0800, YC Hung wrote:
> From: "yc.hung" <yc.hung@mediatek.com>
> 
> This patch adds mt8195 dsp document.
> 
> Signed-off-by: yc.hung <yc.hung@mediatek.com>
> ---
>  .../bindings/dsp/mtk,mt8195-dsp.yaml          | 116 ++++++++++++++++++

mediatek,mt8195-dsp.yaml

>  1 file changed, 116 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml b/Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml
> new file mode 100644
> index 000000000000..33db11ee2336
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml
> @@ -0,0 +1,116 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/dsp/mtk,mt8195-dsp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek mt8195 DSP core
> +
> +maintainers:
> +  - YC Hung <yc.hung@mediatek.com>
> +
> +description: |
> +  Some boards from mt8195 contain a DSP core used for
> +  advanced pre- and post- audio processing.

blank line

> +properties:
> +  compatible:
> +    const: mediatek,mt8195-dsp
> +
> +  reg:
> +    items:
> +      - description: Address and size of the DSP Cfg registers
> +      - description: Address and size of the DSP SRAM
> +
> +  reg-names:
> +    items:
> +      - const: cfg
> +      - const: sram
> +
> +  interrupts:
> +    items:
> +      - description: watchdog interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: wdt
> +
> +  clocks:
> +    items:
> +      - description: mux for audio dsp clock
> +      - description: 26M clock
> +      - description: mux for audio dsp local bus
> +      - description: default audio dsp local bus clock source
> +      - description: clock gate for audio dsp clock
> +      - description: mux for audio dsp access external bus
> +
> +  clock-names:
> +    items:
> +      - const: adsp_sel
> +      - const: clk26m_ck
> +      - const: audio_local_bus
> +      - const: mainpll_d7_d2
> +      - const: scp_adsp_audiodsp
> +      - const: audio_h
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  mboxes:
> +    items:
> +      - description: a mailbox is ised for ipc reply between host and audio DSP.
> +      - description: a mailbox is ised for ipc reuqest between host and audio DSP.

typos

'a mailbox is ised for ' part can be dropped.


> +
> +  mbox-names:
> +    items:
> +      - const: mbox0
> +      - const: mbox1
> +
> +  memory-region:      
> +    items:
> +      - description: A phandle to a reserved memory region is used for dma buffer between host and DSP.   
> +      - description: A phandle to a reserved memory region is used for DSP system memory.

'A phandle to a reserved memory region is used for' part can be dropped.

> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - clock-names
> +  - memory-region
> +  - power-domains
> +  - mbox-names
> +  - mboxes
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    adsp: dsp@10803000 {

Drop unused labels.

> +       compatible =  "mediatek,mt8195-dsp";
> +       reg = <0x10803000  0x1000>,
> +             <0x10840000  0x40000>;
> +       reg-names = "cfg", "sram";
> +       interrupts = <GIC_SPI 694 IRQ_TYPE_LEVEL_HIGH 0>;
> +       interrupt-names = "wdt";
> +       clocks = <&topckgen 10>, //CLK_TOP_ADSP
> +                <&clk26m>,
> +                <&topckgen 107>, //CLK_TOP_AUDIO_LOCAL_BUS
> +                <&topckgen 136>, //CLK_TOP_MAINPLL_D7_D2
> +                <&scp_adsp 0>, //CLK_SCP_ADSP_AUDIODSP
> +                <&topckgen 34>; //CLK_TOP_AUDIO_H
> +       clock-names = "adsp_sel",
> +                     "clk26m_ck",
> +                     "audio_local_bus",
> +                     "mainpll_d7_d2",
> +                     "scp_adsp_audiodsp",
> +                     "audio_h";
> +       memory-region = <&adsp_dma_mem_reserved>,
> +                       <&adsp_mem_reserved>;
> +       power-domains = <&spm 6>; //MT8195_POWER_DOMAIN_ADSP
> +       mbox-names = "mbox0", "mbox1";
> +       mboxes = <&adsp_mailbox0>, <&adsp_mailbox1>;
> +       };

Wrong indentation.

> -- 
> 2.18.0
> 
> 
