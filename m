Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13754176A2F
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Mar 2020 02:48:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B268C1687;
	Tue,  3 Mar 2020 02:47:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B268C1687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583200110;
	bh=ctG19+s42J2Y9cC8qlXSPN7mcuF71KKyeyCRAQoX9kA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F0UI5iIZZhQcM8YjTLCP/un6iRk5ORQiGsczYGg2+jsZJZViVYJ0zTa7qUd1/IOQ2
	 1QqRSpJh+KDwMgu7/wJ5oSoNamXIkFz2D3dOeyb+ebNC7IGKq2iVnnvc1PHP6PoNX7
	 3ZHStukKezd1VwrWS0YncaQJdAvpmB4PEZBIW0FE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0B90F801ED;
	Tue,  3 Mar 2020 02:46:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0EA03F801ED; Tue,  3 Mar 2020 02:46:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0093FF80130
 for <alsa-devel@alsa-project.org>; Tue,  3 Mar 2020 02:46:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0093FF80130
Received: by mail-oi1-f196.google.com with SMTP id l12so1348597oil.9
 for <alsa-devel@alsa-project.org>; Mon, 02 Mar 2020 17:46:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0fZprhK1W/+54HzE9JKB5hhmjgGt264/Y236IBMlW68=;
 b=PPD//TCM2mk606EwH0+gBH5TnudBqwZht2tpht6QtZu/ZVscY5xcAKLJuir7TK0frI
 JcEu0/ELlh+KxPm5LukA/vboEWGyJvOStTpz06L7MD/DCV4m7PIJrvpCnuQUOKBiAlWH
 8qNBp8+ovvdnfZ+Em3uu5VQAdViVYAYhaGA82fbHnHOA42gx+w8RjYJYsN3oxdgaK5Yg
 BvGlyMkRWTGGQGaJpQ2CbNiBaqSNns1EnVI3RGX4kA9+4+AekAaquPCEh4nPFvulubsh
 UHYX0AkxguSqkLEMou3ry1LU97/48fimfMjqS/2pLJ4+wEVVrUxnM0w7rjzRcdq9d/sV
 Tuig==
X-Gm-Message-State: ANhLgQ2q4UrT/VmWxw/ncg6J4+5m6YCUeRkVEcyN1d3tGTVrBaKYOCK1
 hF7Eh3LZTpfLuOvtwmpOWw==
X-Google-Smtp-Source: ADFU+vtMKankA5j2TyBMep5zxakZ/gSxHjO96dpd6H9OgS/zdaStVrFVHEAotLCrZcCrix4ZjMErJQ==
X-Received: by 2002:aca:bfc2:: with SMTP id p185mr936911oif.57.1583200002745; 
 Mon, 02 Mar 2020 17:46:42 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m19sm7258226otn.47.2020.03.02.17.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 17:46:42 -0800 (PST)
Received: (nullmailer pid 467 invoked by uid 1000);
 Tue, 03 Mar 2020 01:46:40 -0000
Date: Mon, 2 Mar 2020 19:46:40 -0600
From: Rob Herring <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v4 7/8] ASoC: dt-bindings: fsl_easrc: Add document for
 EASRC
Message-ID: <20200303014640.GA26270@bogus>
References: <cover.1583039752.git.shengjiu.wang@nxp.com>
 <2aa0b446c3e2af59e3472d8f7706298691ec4a5c.1583039752.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2aa0b446c3e2af59e3472d8f7706298691ec4a5c.1583039752.git.shengjiu.wang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, tiwai@suse.com,
 lgirdwood@gmail.com, nicoleotsuka@gmail.com, broonie@kernel.org,
 linux-imx@nxp.com, kernel@pengutronix.de, festevam@gmail.com,
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

On Sun, Mar 01, 2020 at 01:24:18PM +0800, Shengjiu Wang wrote:
> EASRC (Enhanced Asynchronous Sample Rate Converter) is a new
> IP module found on i.MX8MN.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../devicetree/bindings/sound/fsl,easrc.yaml  | 96 +++++++++++++++++++
>  1 file changed, 96 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,easrc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,easrc.yaml b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
> new file mode 100644
> index 000000000000..500af8f0c8f0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
> @@ -0,0 +1,96 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license new bindings:

(GPL-2.0-only OR BSD-2-Clause)

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/fsl,easrc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP Asynchronous Sample Rate Converter (ASRC) Controller
> +
> +maintainers:
> +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> +
> +properties:
> +  $nodename:
> +    pattern: "^easrc@.*"
> +
> +  compatible:
> +    oneOf:
> +      - items:

You can drop oneOf and items here.

> +        - enum:
> +          - fsl,imx8mn-easrc

Blank line between properties please.

> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Peripheral clock
> +
> +  clock-names:
> +    items:
> +      - const: mem
> +
> +  dmas:
> +    maxItems: 8
> +
> +  dma-names:
> +    oneOf:

Drop oneOf as there is only one.

> +      - items:
> +          - const: ctx0_rx
> +          - const: ctx0_tx
> +          - const: ctx1_rx
> +          - const: ctx1_tx
> +          - const: ctx2_rx
> +          - const: ctx2_tx
> +          - const: ctx3_rx
> +          - const: ctx3_tx
> +
> +  fsl,easrc-ram-script-name:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: The coefficient table for the filters

Need to define the exact string(s).

> +
> +  fsl,asrc-rate:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Defines a mutual sample rate used by DPCM Back Ends

Constraints?

> +
> +  fsl,asrc-format:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Defines a mutual sample format used by DPCM Back Ends

Constraints?

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - dmas
> +  - dma-name

dma-names

> +  - fsl,easrc-ram-script-name
> +  - fsl,asrc-rate
> +  - fsl,asrc-format
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx8mn-clock.h>
> +
> +    easrc: easrc@300C0000 {
> +           compatible = "fsl,imx8mn-easrc";
> +           reg = <0x0 0x300C0000 0x0 0x10000>;
> +           interrupts = <0x0 122 0x4>;
> +           clocks = <&clk IMX8MN_CLK_ASRC_ROOT>;
> +           clock-names = "mem";
> +           dmas = <&sdma2 16 23 0> , <&sdma2 17 23 0>,
> +                  <&sdma2 18 23 0> , <&sdma2 19 23 0>,
> +                  <&sdma2 20 23 0> , <&sdma2 21 23 0>,
> +                  <&sdma2 22 23 0> , <&sdma2 23 23 0>;
> +           dma-names = "ctx0_rx", "ctx0_tx",
> +                       "ctx1_rx", "ctx1_tx",
> +                       "ctx2_rx", "ctx2_tx",
> +                       "ctx3_rx", "ctx3_tx";
> +           fsl,easrc-ram-script-name = "imx/easrc/easrc-imx8mn.bin";
> +           fsl,asrc-rate  = <8000>;
> +           fsl,asrc-format = <2>;
> +           status = "disabled";

Don't show status in examples.

> +    };
> -- 
> 2.21.0
> 
