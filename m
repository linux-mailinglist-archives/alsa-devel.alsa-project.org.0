Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CD047D5B6
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Dec 2021 18:19:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93DF017C6;
	Wed, 22 Dec 2021 18:18:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93DF017C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640193583;
	bh=czKtHln9V0j/Vy7vMgFnJMeK90nk6jnKfvWe3y30kys=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OFFWlHc7+jrm75CIoy06tHqeaek1gMFpstI5mlHnsY2sB6VjxNEbF45ia+IIH/xoJ
	 4oZeViJ8Bb3egS470I3sHdYvnQalPYWie51SXgE6rHdXPVf+tuJk8gCkVPyltM8n+4
	 ciT1sCfIZwhH/vtt0OxoSS8rdH1HghcjIZVtQCHs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DABDEF80111;
	Wed, 22 Dec 2021 18:18:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6168F80105; Wed, 22 Dec 2021 18:18:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C984CF80105
 for <alsa-devel@alsa-project.org>; Wed, 22 Dec 2021 18:18:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C984CF80105
Received: by mail-qv1-f50.google.com with SMTP id kc16so2920796qvb.3
 for <alsa-devel@alsa-project.org>; Wed, 22 Dec 2021 09:18:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VwGJdZszDEBZ/haW/szM0MBy82aTvjUJCHaFFhvVrG0=;
 b=qOvvGjcz/Rt/kXSCYm7s+2JoLLRu/YOOs98W8kaK1eyFZ1TCSxB0y1L4xU/Pgu9MZa
 tZkeSNoiHHaSHPVGL4cBxOPtf2yuQmylYNZ3H8POh/U7XKVe96e/kWrFHP9DmY+kqf3k
 Gh19K+DW2N2707mcrSB4vs41KYDqBtM27RRoRRgCERnsFb+y8lEKdEfPA1mAaKF2u1tI
 kY9XZTxwTRvDLNC8wY7dJ8GCsrQeADP3Q1s6lOtiWvP6/PFOPJm8i2iMLLMCzsHlaXZY
 bpBg/6PMG/xnQ3DsA1kvo2pNee5QaiXjWa+905Qn/3B83zTocJ7kB76nMRWe8GwTEE7c
 0Kvg==
X-Gm-Message-State: AOAM532el6aA3iyKudsI5WxCMnd18VGdXTUFgVVWzJqi6KyETyaCkmo7
 su9zkzOVI3//7pA3ktjz7Q==
X-Google-Smtp-Source: ABdhPJyJ0bAGX2VL5tWgGbkPj8TCBhCWbSyDJ6PRFRs/4iibZv+H1Rhu7n1V0H4nZJGe1uhaZaf3Ow==
X-Received: by 2002:a05:6214:f04:: with SMTP id
 gw4mr3226167qvb.42.1640193508175; 
 Wed, 22 Dec 2021 09:18:28 -0800 (PST)
Received: from robh.at.kernel.org ([24.55.105.145])
 by smtp.gmail.com with ESMTPSA id b2sm1436713qtq.95.2021.12.22.09.18.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 09:18:27 -0800 (PST)
Received: (nullmailer pid 2347804 invoked by uid 1000);
 Wed, 22 Dec 2021 17:18:25 -0000
Date: Wed, 22 Dec 2021 13:18:25 -0400
From: Rob Herring <robh@kernel.org>
To: YC Hung <yc.hung@mediatek.com>
Subject: Re: [PATCH v2] dt-bindings: dsp: mediatek: add mt8195 dsp document
Message-ID: <YcNd4RXYldP8uWgg@robh.at.kernel.org>
References: <20211217070835.31709-1-yc.hung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211217070835.31709-1-yc.hung@mediatek.com>
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

On Fri, Dec 17, 2021 at 03:08:36PM +0800, YC Hung wrote:
> From: "yc.hung" <yc.hung@mediatek.com>

Should be 'YC Hung'?

> 
> This patch adds mt8195 dsp document.
> 
> Signed-off-by: yc.hung <yc.hung@mediatek.com>
> ---
> Changes since v1:
>   Rename yaml file name as mediatek,mt8195-dsp.yaml
>   Refine descriptions for mailbox, memory-region and drop unused labels
>   in examples.
> ---
>  .../bindings/dsp/mediatek,mt8195-dsp.yaml     | 117 ++++++++++++++++++
>  1 file changed, 117 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml b/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
> new file mode 100644
> index 000000000000..bde763191d86
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
> @@ -0,0 +1,117 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/dsp/mediatek,mt8195-dsp.yaml#
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
> +
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
> +      - description: ipc reply between host and audio DSP.
> +      - description: ipc reuqest between host and audio DSP.
> +
> +  mbox-names:
> +    items:
> +      - const: mbox0
> +      - const: mbox1
> +
> +  memory-region:      
> +    items:
> +      - description: dma buffer between host and DSP.   
> +      - description: DSP system memory.
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
> +    dsp@10803000 {
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
> +    };
> -- 
> 2.18.0
> 
> 
