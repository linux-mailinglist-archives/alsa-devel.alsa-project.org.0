Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD27746D00C
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 10:26:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 354BA219A;
	Wed,  8 Dec 2021 10:25:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 354BA219A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638955573;
	bh=7ZS+mcKe/yPODM2E5t0nd5HwMc405JlfQf40eceChiE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NhmhMIH6M54KbbrsSkSeQ2tdHUTa5plibu2i2pc3JN7kbtyS36a9v/a8xeeJY7dp5
	 hgDmfZ4hXGZUISuG5dLuRJPE+9Du7qmczdet8/cV9VfHoBdtNQuYQd3JYrdiNUrEKi
	 91O73RGrYSlOnu3VsEmtCKuCGLNoKTS6/a3X5C/w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88DF6F804EC;
	Wed,  8 Dec 2021 10:24:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C52E1F804E5; Wed,  8 Dec 2021 10:24:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0190DF80103
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 10:24:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0190DF80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="WHRXXER2"
Received: by mail-wr1-x433.google.com with SMTP id u1so2841777wru.13
 for <alsa-devel@alsa-project.org>; Wed, 08 Dec 2021 01:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3mFT/g8kDKWO3RXXQBJgCEppq9+tS0OcXbhAndJlbwc=;
 b=WHRXXER2O3rJ4A2VcAWr/DwhUSR5L/tE4J5yUMThcd01KomQLmU3zFWdohVBwpg8Ll
 sC79Ur1YnCEod0L4D9AXUhM5EiPedIUoI5X/y7p4FqNf3W7oGxw+W8QOWUB8CHCvga1x
 Q9NAFxhBNCQuz+g8fu60utXMrEmJx7ln/ElzigSgVCTn1eGLw/fm2x/fpzxAMvSOIv4V
 YPiBbFLUwSxgLEZ4paCOLhWRq4qxoIxqxQW93TRL+yfvQW9yd8slq936wB60hw9fZvpd
 9ZOhmduuctSkUCTAmJF01x4/OUzT7ol58tRmm8Iu/3MVkTLK4/HQQzzhKY1Un7+6wobr
 Qexg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3mFT/g8kDKWO3RXXQBJgCEppq9+tS0OcXbhAndJlbwc=;
 b=xz1+dlrzVNSX7B7raY3/7UPqyZb3YuwDsiMqBM/x1+GvLccYgrOlEUpUdWTEBMeXVx
 Sd0EUQrJEjbp6lBpZ1XV+5YtMeLTxT8hXjhGOESBPOoz75IAB5QY3TBzlqOfnKiRk3+e
 I6S9holzbKJAy8YkSqnTKiQv6t4IPhQnWU3RP5ckiKVS3p5L1MXhflgz9Nr4wrEUnye2
 7Ydxr4TLIQqmNLwWtjpsm0JvqcD5bWO/lEMCyOj4yIDIJc6+Bqildv3k2uT7t3i++8/i
 XS42OFCJwTLGNrFBBXOB6SI/7vpKod/zZx0FR4l1ti7vS6EpfXnasPAU8TwLao4WEXa/
 1t3A==
X-Gm-Message-State: AOAM530nZeh2Gf/UoOVM7iZkbVIFLzK/pubk4KD5Y76/3CY69rfnsMwD
 XgwomyJx/JHLot1qf9UI+Nf3zA==
X-Google-Smtp-Source: ABdhPJz4c9t4wMsA/G3koT+zmv/oSJewsTgYyqs8g57t6he/F8MwgK+Mv6qagBFmdxpLd0ECZWxfGg==
X-Received: by 2002:a5d:54d0:: with SMTP id x16mr58385764wrv.606.1638955482132; 
 Wed, 08 Dec 2021 01:24:42 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id ay21sm5088751wmb.7.2021.12.08.01.24.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Dec 2021 01:24:41 -0800 (PST)
Subject: Re: [PATCH v5 2/5] dt-bindings: pinctrl: qcom: Add sc7280 lpass lpi
 pinctrl bindings
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
References: <1638891339-21806-1-git-send-email-quic_srivasam@quicinc.com>
 <1638891339-21806-3-git-send-email-quic_srivasam@quicinc.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <7ae29aa1-34da-c362-5712-4b787474d7f2@linaro.org>
Date: Wed, 8 Dec 2021 09:24:40 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1638891339-21806-3-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Venkata Prasad Potturu <quic_potturu@quicinc.com>
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



On 07/12/2021 15:35, Srinivasa Rao Mandadapu wrote:
> Add device tree binding Documentation details for Qualcomm SC7280
> LPASS LPI pinctrl driver.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---


I remember in my previous review that I requested you to use git mv for 
renaming this

If you do that you will endup diff stat something like this:

------------------------->cut<-----------------------------
diff --git 
a/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml 
b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml
similarity index 97%
rename from 
Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
rename to 
Documentation/devicetree/bindings/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml
index e47ebf934daf..76f205a47640 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
+++ 
b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml
@@ -1,7 +1,7 @@
  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
  %YAML 1.2
  ---
-$id: http://devicetree.org/schemas/pinctrl/qcom,lpass-lpi-pinctrl.yaml#
+$id: 
http://devicetree.org/schemas/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml#
  $schema: http://devicetree.org/meta-schemas/core.yaml#

  title: Qualcomm Technologies, Inc. Low Power Audio SubSystem (LPASS)
------------------------->cut<-----------------------------

--srini

>   .../pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml     | 115 +++++++++++++++++++++
>   1 file changed, 115 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
> new file mode 100644
> index 0000000..d32ee32
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
> @@ -0,0 +1,115 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. Low Power Audio SubSystem (LPASS)
> +  Low Power Island (LPI) TLMM block
> +
> +maintainers:
> +  - Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> +
> +description: |
> +  This binding describes the Top Level Mode Multiplexer block found in the
> +  LPASS LPI IP on most Qualcomm SoCs
> +
> +properties:
> +  compatible:
> +    const: qcom,sc7280-lpass-lpi-pinctrl
> +
> +  reg:
> +    minItems: 2
> +    maxItems: 2
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    description: Specifying the pin number and flags, as defined in
> +      include/dt-bindings/gpio/gpio.h
> +    const: 2
> +
> +  gpio-ranges:
> +    maxItems: 1
> +
> +#PIN CONFIGURATION NODES
> +patternProperties:
> +  '-pins$':
> +    type: object
> +    description:
> +      Pinctrl node's client devices use subnodes for desired pin configuration.
> +      Client device subnodes use below standard properties.
> +    $ref: "/schemas/pinctrl/pincfg-node.yaml"
> +
> +    properties:
> +      pins:
> +        description:
> +          List of gpio pins affected by the properties specified in this
> +          subnode.
> +        items:
> +          oneOf:
> +            - pattern: "^gpio([0-9]|[1-9][0-9])$"
> +        minItems: 1
> +        maxItems: 15
> +
> +      function:
> +        enum: [ gpio, swr_tx_clk, qua_mi2s_sclk, swr_tx_data, qua_mi2s_ws,
> +                qua_mi2s_data, swr_rx_clk, swr_rx_data, dmic1_clk, i2s1_clk,
> +                dmic1_data, i2s1_ws, dmic2_clk, dmic2_data, i2s1_data,
> +                i2s2_clk, wsa_swr_clk, i2s2_ws, wsa_swr_data, dmic3_clk,
> +                dmic3_data, i2s2_data ]
> +        description:
> +          Specify the alternative function to be configured for the specified
> +          pins.
> +
> +      drive-strength:
> +        enum: [2, 4, 6, 8, 10, 12, 14, 16]
> +        default: 2
> +        description:
> +          Selects the drive strength for the specified pins, in mA.
> +
> +      slew-rate:
> +        enum: [0, 1, 2, 3]
> +        default: 0
> +        description: |
> +            0: No adjustments
> +            1: Higher Slew rate (faster edges)
> +            2: Lower Slew rate (slower edges)
> +            3: Reserved (No adjustments)
> +
> +      bias-pull-down: true
> +
> +      bias-pull-up: true
> +
> +      bias-disable: true
> +
> +      output-high: true
> +
> +      output-low: true
> +
> +    required:
> +      - pins
> +      - function
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - '#gpio-cells'
> +  - gpio-ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    lpass_tlmm: pinctrl@33c0000 {
> +        compatible = "qcom,sc7280-lpass-lpi-pinctrl";
> +        reg = <0x33c0000 0x20000>,
> +              <0x3550000 0x10000>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        gpio-ranges = <&lpass_tlmm 0 0 15>;
> +    };
> 
