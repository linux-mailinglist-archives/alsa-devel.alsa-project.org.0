Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B1F1A83C1
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 17:49:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BADCE1687;
	Tue, 14 Apr 2020 17:48:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BADCE1687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586879368;
	bh=yDomIilinKjKK4g9W8MaLiIgzrCHzp7UDmwVuhtnFmk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BqiQIj4w+mt1b1TPl4rXZa9zy99equK6207P3p/fE0buvjMzE5SnRVtQZSEakFsG/
	 pxutTaQ8DD1RKwK1mx+3wfE3IhAKSUXUOoqQfvu6s8hWvQA4FPJMdAZDVpQBTPTI47
	 mb5bXOy64eE/oZ+won9sY9B/Oj3OpNpN1GLMsalw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7242DF800B9;
	Tue, 14 Apr 2020 17:47:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C1EAF80126; Tue, 14 Apr 2020 17:47:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DEF6CF800F5
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 17:46:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEF6CF800F5
Received: by mail-oi1-f196.google.com with SMTP id x10so1373202oie.1
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 08:46:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5/QdFs0H17QBuX1uwsHW6SudnkNXUrD80svVL4aPMwA=;
 b=qQCoR2NijLrx/3kfre/z6RoGsEoliCp5xO3Q2gBugpPogk0836dLV9s1YIUOkUPNsc
 TODSkqcU1zXqaMy5ENxe228rSDvl0j1THr/rwS54KSA7V+t6kfod+0NTr8W3403GAOLr
 AlzzIv1wdI+mAkF7KYfWbqxm8bq6tVTItlHXkLZBXFIuOcZRuMj+RNTLR9kU2Sc3RRKn
 c2B1qvT9PARkDz/QatvC8fozVOuEyoF91/F9jNc6+FAaAMEDUpPILQuoTs6kFCqJPr6K
 fFXd/dIrs5IO5W6qCgQKyFx44Knr4Ryib4wi0wHqUCYqKBl6PqJG81G3TLIdGpjfy3yG
 Iu3A==
X-Gm-Message-State: AGi0PuZV2U4BJdcIQg69SEX+W1l8OcDmgGQx1bJULcmgRDcQetwHKJte
 WagNV/1HdnE/JpXXiJDTaQ==
X-Google-Smtp-Source: APiQypJ3eP83Z2ZO3/8+TVOT/jGS5+ZbScl3AXJZ0ygf+ficXnDSMlWcvhkIksYNLU3yBioFZCcKvA==
X-Received: by 2002:aca:2209:: with SMTP id b9mr16431716oic.103.1586879206591; 
 Tue, 14 Apr 2020 08:46:46 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id z24sm1428489otq.75.2020.04.14.08.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 08:46:45 -0700 (PDT)
Received: (nullmailer pid 28325 invoked by uid 1000);
 Tue, 14 Apr 2020 15:46:43 -0000
Date: Tue, 14 Apr 2020 10:46:43 -0500
From: Rob Herring <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v6 6/7] ASoC: dt-bindings: fsl_easrc: Add document for
 EASRC
Message-ID: <20200414154643.GA29098@bogus>
References: <cover.1585726761.git.shengjiu.wang@nxp.com>
 <68208297b49e85adfddf843bc205d154790a49de.1585726761.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68208297b49e85adfddf843bc205d154790a49de.1585726761.git.shengjiu.wang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 nicoleotsuka@gmail.com, broonie@kernel.org, festevam@gmail.com,
 linux-kernel@vger.kernel.org
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

On Wed, Apr 01, 2020 at 04:45:39PM +0800, Shengjiu Wang wrote:
> EASRC (Enhanced Asynchronous Sample Rate Converter) is a new
> IP module found on i.MX8MN.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../devicetree/bindings/sound/fsl,easrc.yaml  | 101 ++++++++++++++++++
>  1 file changed, 101 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,easrc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,easrc.yaml b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
> new file mode 100644
> index 000000000000..14ea60084420
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
> @@ -0,0 +1,101 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
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
> +    const: fsl,imx8mn-easrc
> +
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
> +    items:
> +      - const: ctx0_rx
> +      - const: ctx0_tx
> +      - const: ctx1_rx
> +      - const: ctx1_tx
> +      - const: ctx2_rx
> +      - const: ctx2_tx
> +      - const: ctx3_rx
> +      - const: ctx3_tx
> +
> +  firmware-name:
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/string
> +      - const: imx/easrc/easrc-imx8mn.bin
> +    description: The coefficient table for the filters
> +
> +  fsl,asrc-rate:

fsl,asrc-rate-hz

> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32

And then you can drop this.

> +      - minimum: 8000
> +      - maximum: 192000
> +    description: Defines a mutual sample rate used by DPCM Back Ends
> +
> +  fsl,asrc-format:
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - enum: [2, 6, 10, 32, 36]
> +        default: 2
> +    description:
> +      Defines a mutual sample format used by DPCM Back Ends
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - dmas
> +  - dma-names
> +  - firmware-name
> +  - fsl,asrc-rate
> +  - fsl,asrc-format
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx8mn-clock.h>
> +
> +    easrc: easrc@300C0000 {

Lowercase hex

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
> +           firmware-name = "imx/easrc/easrc-imx8mn.bin";
> +           fsl,asrc-rate  = <8000>;
> +           fsl,asrc-format = <2>;
> +    };
> -- 
> 2.21.0
> 
