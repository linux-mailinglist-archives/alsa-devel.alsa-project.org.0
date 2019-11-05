Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F203CF0608
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 20:32:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7351716DA;
	Tue,  5 Nov 2019 20:32:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7351716DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572982375;
	bh=BHKjUDRqEc03qkld6KXyt3ir91ljCF8MGAjeVKRrOpQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fBT1YVvnFmJwrINmAI2SWfFcTrQ7jai6EoyPG9ECX7EDBdiE0RyAd6UdMkMxwx6sR
	 aUs3xJRNW1hZlckYvnUwcJIDJgyG1jDMAyBW+3fQYeaR1pllOM/vrv5O8xrossvpUx
	 zJNiivipxPkttLJ5h7wizxpDsUJzS6w9n6tV4mOE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4DC6F80271;
	Tue,  5 Nov 2019 20:31:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08628F8049B; Tue,  5 Nov 2019 20:31:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CCC0F800F3
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 20:31:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CCC0F800F3
Received: by mail-ot1-f66.google.com with SMTP id 94so18638530oty.8
 for <alsa-devel@alsa-project.org>; Tue, 05 Nov 2019 11:31:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=eXCrqaM2ReNAR8xM9spgb2Ee5zhCWir3DnZ51DYqUs0=;
 b=dNhLILM03jFzVaWSnkuuJxVK2mQO5smEt53uKAdbKu7smj52/5VwxLJ0pzCDA1qrN+
 1PIfJ/nVqMrDfG/QkFRerN3J5LnayNEMrGzle+3UdRLecLfiJrKs/SMOdh/quQfrbg9m
 J+Qc9GJV9b8bWnFyMYQG4wHNmrIkGfRtPhpPOgUxwcdo9XI+SwtOIFTbFzL7RxHXHC5i
 bMp2rxrQOIpS/cDH7+CypsL6WYNIz1OAfv+g8kaPRifKSfbCTjYxAudMETRygM1fDryV
 8RV9BqlyujyJbXpppSjcfILlLxVmF3UfOxAy/e1utVcRhB69rKQP6to/6H+g0649LTdo
 6u4w==
X-Gm-Message-State: APjAAAVcCWaKDvIkYv605pOVIhDPhvb8v4B5JON6YwzhDWkKs9EWV+fI
 hB1bjsxTEwDlEuoq3npsOg==
X-Google-Smtp-Source: APXvYqzre2W/9ZqnBFFrz/aj+RCDtEBQysbqFeG7AzSN3ieOnpHrDpu7BFOp+KDwAVrQMDlaLseVCw==
X-Received: by 2002:a05:6830:46:: with SMTP id d6mr13605649otp.7.1572982261489; 
 Tue, 05 Nov 2019 11:31:01 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y7sm6891792ote.81.2019.11.05.11.31.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 11:31:00 -0800 (PST)
Date: Tue, 5 Nov 2019 13:31:00 -0600
From: Rob Herring <robh@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <20191105193100.GB4709@bogus>
References: <20191029112700.14548-1-srinivas.kandagatla@linaro.org>
 <20191029112700.14548-2-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191029112700.14548-2-srinivas.kandagatla@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, vinod.koul@linaro.org, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, broonie@kernel.org,
 lee.jones@linaro.org, spapothi@codeaurora.org
Subject: Re: [alsa-devel] [PATCH v3 01/11] ASoC: dt-bindings: add dt
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

On Tue, Oct 29, 2019 at 11:26:50AM +0000, Srinivas Kandagatla wrote:
> This patch adds bindings for wcd9340/wcd9341 audio codec which can
> support both SLIMbus and I2S/I2C interface.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../bindings/sound/qcom,wcd934x.yaml          | 162 ++++++++++++++++++
>  1 file changed, 162 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
> new file mode 100644
> index 000000000000..d6cfde6597db
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
> @@ -0,0 +1,162 @@
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
> +    $ref: '/schemas/types.yaml#/definitions/phandle'
> +    maxItems: 1

Replied on previous version.

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
> +  qcom,micbias1-microvolts:

The standard unit is 'microvolt', not 'microvolts'.

> +    description: micbias1 voltage between 1800000 - 2850000 microvolts
> +
> +  qcom,micbias2-microvolts:
> +    description: micbias2 voltage between 1800000 - 2850000 microvolts
> +
> +  qcom,micbias3-microvolts:
> +    description: micbias3 voltage between 1800000 - 2850000 microvolts
> +
> +  qcom,micbias4-microvolts:
> +    description: micbias4 voltage between 1800000 - 2850000 microvolts
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
> +      documented in their respective bindings.
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
> +  - qcom,micbias1-microvolts
> +  - qcom,micbias2-microvolts
> +  - qcom,micbias3-microvolts
> +  - qcom,micbias4-microvolts
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
> +        qcom,micbias1-microvolts = <1800000>;
> +        qcom,micbias2-microvolts = <1800000>;
> +        qcom,micbias3-microvolts = <1800000>;
> +        qcom,micbias4-microvolts = <1800000>;
> +        clock-names = "extclk";
> +        clocks = <&rpmhcc 2>;
> +
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        pinctrl@42 {
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
