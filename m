Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BC933334D
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Mar 2021 03:50:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78FE2178F;
	Wed, 10 Mar 2021 03:49:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78FE2178F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615344624;
	bh=y+ttdnbFRHpmJbihbHmuLzeKRiIX18ukIn1SliLX4bo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WrOpjZCR31rcKgSvyADa1HrbDWkRssFoKp8+SNbSqqae6FpWgfU/QS+Hi50n7294K
	 g+4ONiCi9opgHLikIZ6N/gnpd835jx3OEpO/LySgheOAlSL/50RYqKvBdTtOaiVgLz
	 Ff4XHzifnMUhMOvKGQUCwN1Frar8y3WocYrPmOYA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B337CF801ED;
	Wed, 10 Mar 2021 03:48:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A59D7F801D8; Wed, 10 Mar 2021 03:48:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9EF95F8012F
 for <alsa-devel@alsa-project.org>; Wed, 10 Mar 2021 03:48:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9EF95F8012F
Received: by mail-il1-f175.google.com with SMTP id e2so14192881ilu.0
 for <alsa-devel@alsa-project.org>; Tue, 09 Mar 2021 18:48:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tEOOZPHDEcY0BRs13eDY3wS0u+L4s5FzuNZ5kGdjLNs=;
 b=cLiSRVZb8B8gqHqu7mnHM1+9LKR0sKJWDYq5KKqzb+2yNZZLh5RaRQSfA7eWufN7Cd
 0PdeuM17ajf/ivk+ssgXjg1fR3ZXtw3RQHo//SyH2ETloLNV9cR+NaCZ7B8jXirSqA35
 5wEGrD5rvR+X5VVozQoIfOngoF0AVDspdAg287hHydb6nWw8lfrBtbgpHbP1MHLhKTW4
 CiVOAbV01f6KLz7Y+8nTZ+0rcHVK4W+LIEbEc+wyb89TwTSS51NvBvHgS/I3jgM9jn7c
 HWhSIl+CXP9raxLksA/av3Mxomn2DmVNJrkgt71FN5thpz1k+QmS9/9oa3WKvwNCHR5m
 lYmQ==
X-Gm-Message-State: AOAM531dOG9Lx2qW4mPVEirG20qqCIP9BuHkiXYhOWCO+n7z3le/OqyD
 6zsgwEwWi6j6IThF0DAOeg==
X-Google-Smtp-Source: ABdhPJxlxbdsnOqUBKBvn9roAYNjrX2t5RPeImFkLklYb3N4N/Nb+GkhzCBE7xUxdgoLpquCONAlmw==
X-Received: by 2002:a05:6e02:685:: with SMTP id o5mr998162ils.39.1615344518240; 
 Tue, 09 Mar 2021 18:48:38 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id x6sm8397734ioh.19.2021.03.09.18.48.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 18:48:37 -0800 (PST)
Received: (nullmailer pid 1645357 invoked by uid 1000);
 Wed, 10 Mar 2021 02:48:34 -0000
Date: Tue, 9 Mar 2021 19:48:34 -0700
From: Rob Herring <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v4 3/6] ASoC: dt-bindings: fsl_rpmsg: Add binding doc for
 rpmsg cpu dai driver
Message-ID: <20210310024834.GA1623179@robh.at.kernel.org>
References: <1615209750-2357-1-git-send-email-shengjiu.wang@nxp.com>
 <1615209750-2357-4-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1615209750-2357-4-git-send-email-shengjiu.wang@nxp.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, timur@kernel.org,
 lgirdwood@gmail.com, linuxppc-dev@lists.ozlabs.org, Xiubo.Lee@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, nicoleotsuka@gmail.com,
 broonie@kernel.org, festevam@gmail.com
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

On Mon, Mar 08, 2021 at 09:22:27PM +0800, Shengjiu Wang wrote:
> fsl_rpmsg cpu dai driver is driver for rpmsg audio, which is mainly used

Bindings describe h/w blocks, not drivers.

> for getting the user's configuration from device tree and configure the
> clocks which is used by Cortex-M core. So in this document define the
> needed property.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../devicetree/bindings/sound/fsl,rpmsg.yaml  | 118 ++++++++++++++++++
>  1 file changed, 118 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
> new file mode 100644
> index 000000000000..5731c1fbc0a6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
> @@ -0,0 +1,118 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/fsl,rpmsg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP Audio RPMSG CPU DAI Controller
> +
> +maintainers:
> +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> +
> +description: |
> +  fsl_rpmsg cpu dai driver is virtual driver for rpmsg audio, which doesn't
> +  touch hardware. It is mainly used for getting the user's configuration
> +  from device tree and configure the clocks which is used by Cortex-M core.
> +  So in this document define the needed property.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx7ulp-rpmsg
> +      - fsl,imx8mn-rpmsg
> +      - fsl,imx8mm-rpmsg
> +      - fsl,imx8mp-rpmsg
> +
> +  model:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: User specified audio sound card name
> +
> +  clocks:
> +    items:
> +      - description: Peripheral clock for register access
> +      - description: Master clock
> +      - description: DMA clock for DMA register access
> +      - description: Parent clock for multiple of 8kHz sample rates
> +      - description: Parent clock for multiple of 11kHz sample rates
> +    minItems: 5

If this doesn't touch hardware, what are these clocks for?

You don't need 'minItems' unless it's less than the number of 'items'.

> +
> +  clock-names:
> +    items:
> +      - const: ipg
> +      - const: mclk
> +      - const: dma
> +      - const: pll8k
> +      - const: pll11k
> +    minItems: 5
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  fsl,audioindex:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1]
> +    default: 0
> +    description: Instance index for sound card in
> +                 M core side, which share one rpmsg
> +                 channel.

We don't do indexes in DT. What's this numbering tied to?

> +
> +  fsl,version:

version of what?

This seems odd at best.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [1, 2]

You're going to update this with every new firmware version?

> +    default: 2
> +    description: The version of M core image, which is
> +                 to make driver compatible with different image.
> +
> +  fsl,buffer-size:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: pre allocate dma buffer size

How can you have DMA, this doesn't touch h/w?

> +
> +  fsl,enable-lpa:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: enable low power audio path.
> +
> +  fsl,rpmsg-out:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      This is a boolean property. If present, the transmitting function
> +      will be enabled.
> +
> +  fsl,rpmsg-in:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      This is a boolean property. If present, the receiving function
> +      will be enabled.
> +
> +  fsl,codec-type:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1, 2]
> +    default: 0
> +    description: Sometimes the codec is registered by
> +                 driver not by the device tree, this items
> +                 can be used to distinguish codecs.

How does one decide what value to use?

> +
> +  audio-codec:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of the audio codec

The codec is controlled from the Linux side?

> +
> +  memory-region:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle to the reserved memory nodes
> +
> +required:
> +  - compatible
> +  - fsl,audioindex
> +  - fsl,version
> +  - fsl,buffer-size
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    rpmsg_audio: rpmsg_audio {
> +        compatible = "fsl,imx8mn-rpmsg";
> +        fsl,audioindex = <0> ;
> +        fsl,version = <2>;
> +        fsl,buffer-size = <0x6000000>;
> +        fsl,enable-lpa;

How does this work? Don't you need somewhere to put the 'rpmsg' data?

> +    };
> -- 
> 2.27.0
> 
