Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6863544EDC9
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Nov 2021 21:16:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01C0A166F;
	Fri, 12 Nov 2021 21:15:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01C0A166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636748203;
	bh=4artUiOGxj/QrtNhrVLGBE3tGoRigOW370FqwMthFbo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b9Vi1wV0ZBhFEwFJXodUSk+vAgYyiZnWTm0Q3cbw2Erzbgb/Q10oNxn5m7Mpvd2Ps
	 imX8mt6igI4/9Bh0wm21EEXPVWEHzUOItnz6thqTKsalcUkWk3/HSCu2HzCgseKX7l
	 BgnMr/fcr49etne3ysD1KuG4e3SmIB2T8hcPSv2s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4732DF800C1;
	Fri, 12 Nov 2021 21:15:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6398F8049E; Fri, 12 Nov 2021 21:15:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E471F80086
 for <alsa-devel@alsa-project.org>; Fri, 12 Nov 2021 21:15:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E471F80086
Received: by mail-ot1-f54.google.com with SMTP id
 r10-20020a056830080a00b0055c8fd2cebdso15529158ots.6
 for <alsa-devel@alsa-project.org>; Fri, 12 Nov 2021 12:15:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=keLT6GqkBxKBg5E7mpziqAGsje8UnIi4oJ/70fWYsOk=;
 b=RXHBcNfwbyqknOTaLOcCZrIaOPg7tdwHl97CStJ9PO90tuF6A0Q9gp2vTpWxuJiM7B
 FhgvODYhHLJRxK9z6dRPKOACaTVJt8hwLz4Oc1xwxA2qpnpHMktxTJH6C01LirjCuGh6
 t5gaRcpopPNF4a7q56ums96SqlLsTUs+pCLV+F2YAFXis4eohbVVyQj6Sk4/UEBUGXCE
 IiA1prohrZtXoJYhVLG0urqd+F4a6GKQEs8H7txMa7U3IakSnYOJ3KKYGVMsrUqbx51Y
 w2Z3g8AtROCmwnAPWE4ohTrCBYDBclbTvUfbPCVxocGkmk4KxkrJcrec6eIGNeBGYEs4
 WGLw==
X-Gm-Message-State: AOAM530PK/V4TIJ+K1ZnDMqz9b64BzFrMAn7L0Kd2HqN/PS5rWMH8Eeq
 Bmd5oW4tX/fYRaHlgT6f7w==
X-Google-Smtp-Source: ABdhPJz0IgudO9I+dADfCJrqhnAcSXUvXv7srFOWzM/tpxDv/VcAcn13Yy2W70rZqXpm+7Y/UoSzNQ==
X-Received: by 2002:a9d:6307:: with SMTP id q7mr14945920otk.83.1636748115023; 
 Fri, 12 Nov 2021 12:15:15 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id y9sm1235608oon.8.2021.11.12.12.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 12:15:14 -0800 (PST)
Received: (nullmailer pid 3294254 invoked by uid 1000);
 Fri, 12 Nov 2021 20:15:13 -0000
Date: Fri, 12 Nov 2021 14:15:13 -0600
From: Rob Herring <robh@kernel.org>
To: YC Hung <yc.hung@mediatek.com>
Subject: Re: [PATCH v5] dt-bindings: dsp: mediatek: Add mt8195 DSP binding
 support
Message-ID: <YY7LUWS5YDBBl/Kp@robh.at.kernel.org>
References: <20211103102607.12277-1-yc.hung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211103102607.12277-1-yc.hung@mediatek.com>
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

On Wed, Nov 03, 2021 at 06:26:08PM +0800, YC Hung wrote:
> From: "yc.hung" <yc.hung@mediatek.com>
> 
> This describes the mt8195 DSP device tree node.
> 
> Signed-off-by: yc.hung <yc.hung@mediatek.com>
> ---
> Changes since v4:
>   - remove patch 1 with clocks as it will be reviewed and merged to SOF tree.
>     https://github.com/thesofproject/linux/pull/3237
>   - refine DT file binding files with Rob's comments.
> 
>  .../bindings/dsp/mtk,mt8195-dsp.yaml          | 142 ++++++++++++++++++
>  1 file changed, 142 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml b/Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml
> new file mode 100644
> index 000000000000..aeeb7af69625
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml
> @@ -0,0 +1,142 @@
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
> +
> +  sound:
> +    description:
> +      Sound subnode includes ASoC platform, DPTx codec node, and
> +      HDMI codec node.
> +
> +    type: object

Same question as v4, why do you need a sub-node here. Just move these 
properties up a level.

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
