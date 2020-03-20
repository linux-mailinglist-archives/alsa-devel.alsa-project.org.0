Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E5518D63A
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Mar 2020 18:50:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D390C846;
	Fri, 20 Mar 2020 18:49:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D390C846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584726606;
	bh=kH6r0irKxa0rb6nxt3outSD00HOBaM/SfWO6IW1kjO8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kkvC1m/QK8bgB2x9ljKfQUCAFFL5/fXJGXDiZUmShlG7evNoseLbhWnP6ZC2lH+OU
	 wB1Pynpkh2t735uOoj2pR8kUg65gjVP6gXC+/sI0gMgWZQBuTwe6/wSU6xYUfRFMP6
	 mBqmyh3EhN4ocBTxqbKDzTGSHDuOUJ0EsaAB0Hn4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A562BF80162;
	Fri, 20 Mar 2020 18:48:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9EDDF8015B; Fri, 20 Mar 2020 18:48:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62449F800DD
 for <alsa-devel@alsa-project.org>; Fri, 20 Mar 2020 18:48:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62449F800DD
Received: by mail-io1-f68.google.com with SMTP id h131so6876588iof.1
 for <alsa-devel@alsa-project.org>; Fri, 20 Mar 2020 10:48:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=sdZ8Fz0NTe2Z8mbny4b+ZzHCT+owc9QawbF3H7/fFjQ=;
 b=r11zJFlqRHXmFLcST8s5uBtdhqaLI8SSgE3kswZuq3XKXuU7N4CfnsiD9NLZucb5aM
 TYVT2NyNy+AyIYKj8kCFP63Ip9yHvnRPPRU4RbSJdp9H7nbOFk/SfkQq2fdJPc8542DY
 T09xQIzq1rNEjUn2nEAUEgmHqLfYUvzOLcnj3QmOKZkvISJ8MTRjoGQXxZNEurB9W8BP
 CsNOSyP9wOjG5gew1yUHnaF+DU3xbh3KFRxzQzmU1b4m+W99cbrCCTTdS6v/tBuG/Rqg
 1Gv1kVMNMRV3jyllza2E6jDkv7ind9smMZOvbLFBoeyUCcFK8CEXn3o992uLXbnOpIbO
 lQPA==
X-Gm-Message-State: ANhLgQ2cZKGh4ixUVJdn10CV+AzTw7olV4ciLYIBxZ6mbuWBaE5pTscG
 xAkjyDpL36udarSRYb0GLg==
X-Google-Smtp-Source: ADFU+vvwo0sFRpgMy8S/+VmmSzmDzKFlPryLvd9OSadfOfVEWtEg1diSdrBlcDY6qZflMYnDgSLyOw==
X-Received: by 2002:a6b:7a07:: with SMTP id h7mr8385084iom.47.1584726495070;
 Fri, 20 Mar 2020 10:48:15 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id t86sm2201336ili.82.2020.03.20.10.48.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 10:48:14 -0700 (PDT)
Received: (nullmailer pid 10514 invoked by uid 1000);
 Fri, 20 Mar 2020 17:48:12 -0000
Date: Fri, 20 Mar 2020 11:48:12 -0600
From: Rob Herring <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v5 6/7] ASoC: dt-bindings: fsl_easrc: Add document for
 EASRC
Message-ID: <20200320174812.GA27070@bogus>
References: <cover.1583725533.git.shengjiu.wang@nxp.com>
 <71b6ad3d0ea79076fded2373490ec1eb8c418d21.1583725533.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71b6ad3d0ea79076fded2373490ec1eb8c418d21.1583725533.git.shengjiu.wang@nxp.com>
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

On Mon, Mar 09, 2020 at 11:58:33AM +0800, Shengjiu Wang wrote:
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
> index 000000000000..ff22f8056a63
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
> +  fsl,easrc-ram-script-name:

'firmware-name' is the established property name for this.

> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/string
> +      - const: imx/easrc/easrc-imx8mn.bin

Though if there's only 1 possible value, why does this need to be in DT?

> +    description: The coefficient table for the filters

If the firmware is only 1 thing, then perhaps this should just be a DT 
property rather than a separate file. It depends on who owns/creates 
this file. If fixed for the platform, then DT is a good fit. If updated 
separately from DT and boot firmware, then keeping it separate makes 
sense.

> +
> +  fsl,asrc-rate:
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
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
> +    };
> -- 
> 2.21.0
> 
