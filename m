Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3D5E555F
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2019 22:45:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F141918A4;
	Fri, 25 Oct 2019 22:44:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F141918A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572036332;
	bh=Am7Cuskuhf4ufTV5LJW/gEObVNaXKh8FPLfJGHyuEao=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Rm++wo4bM4sN06X8kz/92Xtz+8bEaiG+zIt7k5v6RV1OFALHCT8yu6duCMZkHXiP3
	 nFnR8QDzz4SqKCbZxZowPQ4ZAqxlUT2uBq3TPyKHRaNgP0MD2m9hvq2uG17KPhNyvr
	 jxgEebKNyCVc9UTLs/Nim6MHe1a1A0zBYhBy6rvU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A546F8036F;
	Fri, 25 Oct 2019 22:43:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB2CCF8036F; Fri, 25 Oct 2019 22:43:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19B6EF802A0
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 22:43:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19B6EF802A0
Received: by mail-ot1-f67.google.com with SMTP id n48so2922599ota.11
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 13:43:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mY7W9Qwoy2hYsmzd/xysMomRgnBoZZlGLUvtU9rwd9Y=;
 b=mo/A/oRpc/BcHbYYAJBUR+oWEnhOHe5Ud1YJVg28I4gjAs6u4UPK7exzGaqTwWrdIs
 dluvPOF6mltyEmSPhkeaDfoA/Xy3MphhQwrHGxMDI1/+0XIDj4fz8QbQMZoYMZjUDpkd
 6mmLz9QCD7CwRnNCggnnXfNQYJPyLcL4gerPtH2lzC0lABKRi/9JS8R1I0fax37KqPng
 bxhEywia731fOmlGbph15Lmpw5rtT7hGtYhD3Ok0hd6v3jwT38yKn7A0yQGWduPjbJZQ
 vrEP0RxB4y2ymOztAgZbwypeWcaAceZnO5alJj7gFEKN1WFVW91mrzuM6gwCDtZSs/4F
 LRkg==
X-Gm-Message-State: APjAAAXkLLKwSvGMpSDjxVoOsSsiShJRIUDDhkjwcrQYW95caVMSV+Xx
 e83XtCh7E1E3mXKbQ+fV+Q==
X-Google-Smtp-Source: APXvYqwi5q9kWQoXbZEj5r4KamsevqICE/6M+McbMMUn5YYDFa3NKCPG3yUwt8kDDdHYKaPW7z/tuA==
X-Received: by 2002:a9d:5a0b:: with SMTP id v11mr4410792oth.274.1572036219985; 
 Fri, 25 Oct 2019 13:43:39 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id s6sm1056766otr.5.2019.10.25.13.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 13:43:39 -0700 (PDT)
Date: Fri, 25 Oct 2019 15:43:38 -0500
From: Rob Herring <robh@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <20191025204338.GA25892@bogus>
References: <20191018001849.27205-1-srinivas.kandagatla@linaro.org>
 <20191018001849.27205-2-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191018001849.27205-2-srinivas.kandagatla@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, vinod.koul@linaro.org, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, broonie@kernel.org,
 lee.jones@linaro.org, spapothi@codeaurora.org
Subject: Re: [alsa-devel] [PATCH v2 01/11] ASoC: dt-bindings: add dt
 bindings for WCD9340/WCD9341 audio codec
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Oct 18, 2019 at 01:18:39AM +0100, Srinivas Kandagatla wrote:
> This patch adds bindings for wcd9340/wcd9341 audio codec which can
> support both SLIMbus and I2S/I2C interface.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../bindings/sound/qcom,wcd934x.yaml          | 169 ++++++++++++++++++
>  1 file changed, 169 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
> new file mode 100644
> index 000000000000..299d6b96c339
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
> @@ -0,0 +1,169 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/qcom,wcd934x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Bindings for Qualcomm WCD9340/WCD9341 Audio Codec
> +
> +maintainers:
> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> +
> +description: |
> +  Qualcomm WCD9340/WCD9341 Codec is a standalone Hi-Fi audio codec IC.
> +  It has in-built Soundwire controller, pin controller, interrupt mux and
> +  supports both I2S/I2C and SLIMbus audio interfaces.
> +
> +properties:
> +  compatible:
> +    const: slim217,250
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description: GPIO spec for reset line to use
> +    maxItems: 1
> +
> +  slim-ifc-dev:
> +    description: SLIMBus Interface device phandle

phandle or...

> +    maxItems: 1

array?

Needs a type if a phandle.

> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: extclk
> +
> +  vdd-buck-supply:
> +    description: A reference to the 1.8V buck supply
> +
> +  vdd-buck-sido-supply:
> +    description: A reference to the 1.8V SIDO buck supply
> +
> +  vdd-rx-supply:
> +    description: A reference to the 1.8V rx supply
> +
> +  vdd-tx-supply:
> +    description: A reference to the 1.8V tx supply
> +
> +  vdd-vbat-supply:
> +    description: A reference to the vbat supply
> +
> +  vdd-io-supply:
> +    description: A reference to the 1.8V I/O supply
> +
> +  vdd-micbias-supply:
> +    description: A reference to the micbias supply
> +
> +  qcom,micbias1-millivolt:

The standard unit is '-microvolt' 

> +    description: Voltage betwee 1800mv-2850mv for micbias1 output

typo...

Sounds like constraints.

> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32

With standard units, you can drop the type.

> +
> +  qcom,micbias2-millivolt:
> +    description: Voltage betwee 1800mv-2850mv for micbias2 output
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  qcom,micbias3-millivolt:
> +    description: Voltage betwee 1800mv-2850mv for micbias3 output
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  qcom,micbias4-millivolt:
> +    description: Voltage betwee 1800mv-2850mv for micbias4 output
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  clock-output-names:
> +    const: mclk
> +
> +  clock-frequency:
> +    description: Clock frequency of output clk in Hz
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 1
> +
> +  '#clock-cells':
> +    const: 0
> +
> +  '#sound-dai-cells':
> +    const: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +patternProperties:
> +  "^.*@[0-9a-f]+$":
> +    type: object
> +    description: |
> +      WCD934x subnode for each slave devices. Bindings of each subnodes
> +      depends on the specific driver providing the functionality and
> +      documented in there respective bindings.

s/there/their/

> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +
> +    required:
> +      - reg
> +
> +required:
> +  - compatible
> +  - reg
> +  - reset-gpios
> +  - slim-ifc-dev
> +  - interrupts
> +  - interrupt-controller
> +  - clock-frequency
> +  - clock-output-names
> +  - qcom,micbias1-millivolt
> +  - qcom,micbias2-millivolt
> +  - qcom,micbias3-millivolt
> +  - qcom,micbias4-millivolt
> +  - "#interrupt-cells"
> +  - "#clock-cells"
> +  - "#sound-dai-cells"
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +examples:
> +  - |
> +    codec@1,0{
> +        compatible = "slim217,250";
> +        reg  = <1 0>;
> +        reset-gpios = <&tlmm 64 0>;
> +        slim-ifc-dev  = <&wcd9340_ifd>;
> +        #sound-dai-cells = <1>;
> +        interrupt-parent = <&tlmm>;
> +        interrupts = <54 4>;
> +        interrupt-controller;
> +        #interrupt-cells = <1>;
> +        #clock-cells = <0>;
> +        clock-frequency = <9600000>;
> +        clock-output-names = "mclk";
> +        qcom,micbias1-millivolt = <1800>;
> +        qcom,micbias2-millivolt = <1800>;
> +        qcom,micbias3-millivolt = <1800>;
> +        qcom,micbias4-millivolt = <1800>;
> +        clock-names = "extclk";
> +        clocks = <&rpmhcc 2>;
> +
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        wcdpinctrl@42 {
> +            reg = <0x42 0x2>;
> +        };
> +    };
> +
> +...
> -- 
> 2.21.0
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
