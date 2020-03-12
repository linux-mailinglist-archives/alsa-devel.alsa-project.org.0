Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA047183A88
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Mar 2020 21:24:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 464881779;
	Thu, 12 Mar 2020 21:24:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 464881779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584044699;
	bh=lK+DbZu+ysfioTaOjQp7MwFz+Cg7MyJVUs9MvHtpsk0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=acLH0eN4k951SQsW/7s+JsYnTiYOcpFrI1mgviGDHdSkrcQJPI9GZd03KN5lZzCqA
	 SzHUgrykrpQZPWC0UFWHd1Vhv3sOt6xvd+QuXyHlO+cujdn1I0/DvBxO/bjF7HpPBm
	 KnDcv6rjJ0dffuJTGfx0OHCeknHU7t7eB7DUXEg8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43EE9F8020C;
	Thu, 12 Mar 2020 21:23:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 134D3F8020C; Thu, 12 Mar 2020 21:23:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C322DF8013E;
 Thu, 12 Mar 2020 21:23:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C322DF8013E
Received: by mail-ot1-f68.google.com with SMTP id 111so7680567oth.13;
 Thu, 12 Mar 2020 13:23:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=edf5TR5CVR3TN5pRGNKw9mhGgcBOLphtKYRyAygi4sY=;
 b=KtSpwDxg4XlM/IMC5Qd1bqK0YahNncwaCoIgM0czKAASjP0ZmxnkYKF/hkutjC6eq1
 oUdScnScZZjCBtXy9ezFzOhV45GLmQX+nwafgrW3YvXUJF8bfiaOqzS8L5h+ejRBmDJI
 VVgUkafy+wLYDEVotlXqC1wNdIxo84dWNaC20cBcSykYKRUMsEd6loHiXDf0CnWzY9A4
 gfj4zoWVf3lKBLWcd+eXIk8/R8zo9aqPO6UVPSWDa8bWYiiz+R39d7n3UOWisLEpC9pk
 vKfWKRir5ttsqqo2fYkWJRxQJbxjr27T6NkFP9sApojlxc0ZYe3ZVf51Eb03dnBFe9Ly
 s9IQ==
X-Gm-Message-State: ANhLgQ2beQrJGAQ4OIaTx/oS35p7hHaKFBlKzYkK/sRbGh0uO24OyZCe
 bwS0BMfppNgKxUYiEARDbw==
X-Google-Smtp-Source: ADFU+vvOQCNhP9ZLDZQxkhEt/jrr6BlY7/vHQ5vgiZhlBHGBv/gpom62mtJzEUMw2/nTR4mZwAQuMA==
X-Received: by 2002:a9d:6452:: with SMTP id m18mr7677326otl.366.1584044588129; 
 Thu, 12 Mar 2020 13:23:08 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w18sm12789082otl.60.2020.03.12.13.23.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2020 13:23:07 -0700 (PDT)
Received: (nullmailer pid 10568 invoked by uid 1000);
 Thu, 12 Mar 2020 20:23:06 -0000
Date: Thu, 12 Mar 2020 15:23:06 -0500
From: Rob Herring <robh@kernel.org>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: sound: Add FSL CPU DAI bindings
Message-ID: <20200312202306.GA18767@bogus>
References: <20200306111353.12906-1-daniel.baluta@oss.nxp.com>
 <20200306111353.12906-2-daniel.baluta@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200306111353.12906-2-daniel.baluta@oss.nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, Xiubo.Lee@gmail.com, shengjiu.wang@nxp.com,
 tiwai@suse.com, ranjani.sridharan@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 peter.ujfalusi@ti.com, broonie@kernel.org, linux-imx@nxp.com,
 Daniel Baluta <daniel.baluta@nxp.com>, liam.r.girdwood@linux.intel.com,
 sound-open-firmware@alsa-project.org
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

On Fri, Mar 06, 2020 at 01:13:52PM +0200, Daniel Baluta wrote:
> From: Daniel Baluta <daniel.baluta@nxp.com>
> 
> Add dt bindings for he Generic FSL CPU DAI.
> 
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  .../devicetree/bindings/sound/fsl,dai.yaml    | 97 +++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,dai.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,dai.yaml b/Documentation/devicetree/bindings/sound/fsl,dai.yaml
> new file mode 100644
> index 000000000000..e6426af67d30
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/fsl,dai.yaml
> @@ -0,0 +1,97 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license new bindings please:

(GPL-2.0-only OR BSD-2-Clause)

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/fsl,dai.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic CPU FSL DAI driver for resource management

Bindings are for h/w devices, not drivers.

> +
> +maintainers:
> +  - Daniel Baluta <daniel.baluta@nxp.com>
> +
> +description: |
> +  On platforms with a DSP we need to split the resource handling between
> +  Application Processor (AP) and DSP. On platforms where the DSP doesn't
> +  have an easy access to resources, the AP will take care of
> +  configuring them. Resources handled by this generic driver are: clocks,
> +  power domains, pinctrl.

The DT should define a DSP node with resources that are part of the 
DSP. What setup the AP has to do should be implied by the compatible 
string and possibly what resources are described.

Or maybe the audio portion of the DSP is a child node...

> +
> +properties:
> +  '#sound-dai-cells':
> +    const: 0
> +
> +  compatible:
> +    enum:
> +      - fsl,esai-dai
> +      - fsl,sai-dai

Not very specific. There's only 2 versions of the DSP and ways it is 
integrated?

> +
> +  clocks:
> +    oneOf:
> +      - items: # for ESAI
> +          - description: Core clock used to access registers.
> +          - description: ESAI baud clock for ESAI controller used to derive
> +                         HCK, SCK and FS.
> +          - description: The system clock derived from ahb clock used to derive
> +                         HCK, SCK and FS.
> +          - description: SPBA clock is required when ESAI is placed as a bus
> +                         slave of the SP Bus and when two or more bus masters
> +                         (CPU, DMA or DSP) try to access it. This property is
> +                         optional depending on SoC design.
> +      - items: # for SAI
> +          - description: Bus clock for accessing registers
> +          - description: Master clock 0 for providing bit clock and frame clock
> +          - description: Master clock 1 for providing bit clock and frame clock
> +          - description: Master clock 2 for providing bit clock and frame clock
> +          - description: Master clock 3 for providing bit clock and frame clock
> +
> +  clock-names:
> +    oneOf:
> +      - items: # for ESAI
> +          - const: core
> +          - const: extal
> +          - const: fsys
> +          - const: spba
> +      - items: # for SAI
> +          - const: bus
> +          - const: mclk0
> +          - const: mclk1
> +          - const: mclk2
> +          - const: mclk3
> +
> +  pinctrl-0:
> +    description: Should specify pin control groups used for this controller.
> +
> +  pinctrl-names:
> +    const: default

pinctrl properties are implicitly allowed an don't have to be listed 
here.

> +
> +  power-domains:
> +    $ref: '/schemas/types.yaml#/definitions/phandle-array'

Don't need a type.

> +    description:
> +      List of phandles and PM domain specifiers, as defined by bindings of the
> +      PM domain provider.

Don't need to re-define common properties.

You do need to say how many power domains (maxItems: 1?).

> +
> +  fsl,dai-index:
> +    $ref: '/schemas/types.yaml#/definitions/uint32'
> +    description: Physical DAI index, must match the index from topology file

Sorry, we don't do indexes in DT.

What's a topology file?

> +
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names
> +  - fsl,dai-index
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx8-clock.h>
> +    esai0_port: esai-port {
> +         #sound-dai-cells = <0>;
> +        compatible = "fsl,esai-dai";
> +
> +        fsl,dai-index = <0>;
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&pinctrl_esai0>;
> +
> +        clocks = <&esai0_lpcg 1>, <&esai0_lpcg 0>,  <&esai0_lpcg 1>,
> +            <&clk_dummy>;
> +        clock-names = "core", "extal", "fsys", "spba";
> +    };
> -- 
> 2.17.1
> 
