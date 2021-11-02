Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F214433F5
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Nov 2021 17:51:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9362169F;
	Tue,  2 Nov 2021 17:50:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9362169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635871874;
	bh=NXk0JdAJobhtcw3rJqpO8b8z3NhVi63cymA5vvED0+A=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fDkEGDrEl35gxv4uCKUi88meTcw1CQuJfhvv0YlNKKTAVQQF+YwytKEdYM6AFeuwP
	 99PB26aBGfkrpRvqGzHuZS29/UUNd5jusUNzXsJY4rj29yGZMRk2EPswc4vwMbYD6h
	 Hb6LzlL3IMqe8N/1qeR+Sx5x6Tc0Uu1Ym6XTFdFo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67934F8025F;
	Tue,  2 Nov 2021 17:49:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00F16F8025D; Tue,  2 Nov 2021 17:49:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B5CCF80224
 for <alsa-devel@alsa-project.org>; Tue,  2 Nov 2021 17:49:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B5CCF80224
Received: by mail-ot1-f53.google.com with SMTP id
 w29-20020a056830411d00b0055abaca9349so2422314ott.13
 for <alsa-devel@alsa-project.org>; Tue, 02 Nov 2021 09:49:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=w7OCrf7rifBBMWTmL311h+DC3U5MFxTs2snFaNj8QNE=;
 b=Gr8uZ7iJegCJEvuTJwja2AQs8KzAplNWKwxAx16mAyWNILbSIJjs+iMo17qg7FBTJx
 163XJOHJJXOofh9nFQzpEImHRSKxB2NXw07glmPjG7gxsYrvoIoSpGpMFd9JYnmoaenM
 LGYQlUwNByg4kEUkHza5cbAvltgy2GjtLh4tJ3s7rFKpDT5Wi1CY/tTxAdW3FeQe186+
 sW+a/DXdNei/QGrxqDz6qQG8AzUYmBTvhQOqjetw55XTfTq8MTF6FOFDgimZtSVZ7XL+
 1sGNe+jT19ft1VPLZWWZLrvbb0sMed9ClGloJmJ6DvJqxI0TSmpqz+vV24YDjbYsCLSK
 l4/A==
X-Gm-Message-State: AOAM530fXrijlAkNC6p4+X9yadrz1y2a+ln8xFEB0GCBIvNMcqyT0WRR
 J/qLL5q7PW+s5cCeM2RV+Q==
X-Google-Smtp-Source: ABdhPJxNkprmX4LIkrnpupfOPtMxMkApEBcH/bSyncViTFJO8577qI0GbUK13qW17fKIYl7dW5ZQaw==
X-Received: by 2002:a9d:6e16:: with SMTP id e22mr27466399otr.77.1635871785382; 
 Tue, 02 Nov 2021 09:49:45 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id q5sm5218662otg.1.2021.11.02.09.49.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 09:49:44 -0700 (PDT)
Received: (nullmailer pid 3049381 invoked by uid 1000);
 Tue, 02 Nov 2021 16:49:43 -0000
Date: Tue, 2 Nov 2021 11:49:43 -0500
From: Rob Herring <robh@kernel.org>
To: YC Hung <yc.hung@mediatek.com>
Subject: Re: [PATCH v4 2/2] dt-bindings: dsp: mediatek: Add mt8195 DSP
 binding support
Message-ID: <YYFsJ+J9m7QBGpmB@robh.at.kernel.org>
References: <20211028135737.8625-1-yc.hung@mediatek.com>
 <20211028135737.8625-3-yc.hung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211028135737.8625-3-yc.hung@mediatek.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 allen-kh.cheng@mediatek.com, tiwai@suse.com, linux-kernel@vger.kernel.org,
 broonie@kernel.org, linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, daniel.baluta@nxp.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
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

On Thu, Oct 28, 2021 at 09:57:37PM +0800, YC Hung wrote:
> This describes the mt8195 DSP device tree node.
> 
> Signed-off-by: YC Hung <yc.hung@mediatek.com>
> ---
>  .../bindings/dsp/mtk,mt8195-dsp.yaml          | 139 ++++++++++++++++++
>  1 file changed, 139 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml b/Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml
> new file mode 100644
> index 000000000000..f113f71ca094
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml
> @@ -0,0 +1,139 @@
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
> +properties:
> +  compatible:
> +    const: mediatek,mt8195-dsp
> +
> +  reg:
> +    maxItems: 2
> +
> +  reg-names:
> +    maxItems: 2

Need to define what each entry is and the names for them.

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-names:
> +    maxItems: 1

Need to define the name. Though -names with 1 entry is not that useful.

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
> +    maxItems: 2
> +
> +  mbox-names:
> +    description:
> +      Specifies the mailboxes used to communicate with audio DSP
> +    items:
> +      - const: mbox0
> +      - const: mbox1

Is there not a specific function for each mailbox? You already have an 
index implicitly.

> +
> +  memory-region:
> +    description:
> +      phandle to a node describing reserved memory (System RAM memory)
> +      used by DSP (see bindings/reserved-memory/reserved-memory.txt)
> +    maxItems: 2

1 phandle or 2? If 2, what is each one for?

> +
> +  sound:
> +    description:
> +      Sound subnode includes ASoC platform, DPTx codec node, and
> +      HDMI codec node.
> +
> +    type: object

       additionalProperties: false

Though why do you need a child node here in the first place?

> +
> +    properties:
> +      mediatek,platform:
> +        $ref: "/schemas/types.yaml#/definitions/phandle"
> +        description: The phandle of MT8195 ASoC platform.
> +
> +      mediatek,dptx-codec:
> +        $ref: "/schemas/types.yaml#/definitions/phandle"
> +        description: The phandle of MT8195 Display Port Tx codec node.
> +
> +      mediatek,hdmi-codec:
> +        $ref: "/schemas/types.yaml#/definitions/phandle"
> +        description: The phandle of MT8195 HDMI codec node.
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
> +  - sound
> +
> +

Extra blank line.

> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    adsp: adsp@10803000 {

dsp@...

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
> +       mboxes = <&adsp_mailbox 0>, <&adsp_mailbox 1>;
> +       status = "disabled";

Don't disable your example. Drop status.

> +       sound {
> +              mediatek,dptx-codec = <&dp_tx>;
> +              mediatek,hdmi-codec = <&hdmi0>;
> +              mediatek,platform = <&afe>;
> +             };
> +       };
> -- 
> 2.18.0
> 
> 
