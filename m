Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 674EE463C9C
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Nov 2021 18:14:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B94F2382;
	Tue, 30 Nov 2021 18:13:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B94F2382
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638292479;
	bh=EqRfC+QbhiSqdJuTC5A2UW3cIP3Zn9snsviwWu1X7DA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eIuw3V5z7y4WJ7hHCsSEQbTmnL26MbbNmYVpjXwq/9Vby5Ew8ang3Vk1BFLycizDt
	 rjRVMpblbUZzbqEyKjVsqyE3wL31sOm24+I63CUW6q7RK99Lb9Pra+czr/jJACc479
	 NwAdcfRhgKdpycwbo1mJbFzRaMIbIK1o9Khjo2Js=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA4ABF802A0;
	Tue, 30 Nov 2021 18:13:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87204F80290; Tue, 30 Nov 2021 18:13:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27604F800EE
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 18:13:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27604F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="EDHBCnZV"
Received: by mail-wr1-x433.google.com with SMTP id s13so46037245wrb.3
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 09:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=r/RzzACEGmvpF3IiOGI/VeVi04SG1oxFn0L0QmRaXOU=;
 b=EDHBCnZV+Wl+S6/VL/Eiow7Rf87bWTxqhf+0uHr57WEzNWkSATf4UO0qpCY8Iy97CC
 TJYxPMSUgDCTum4RriKuoAPtPRpqXLJNSgqMCUfZKggyaPZ1JzgrRiZgHaYuJ3llBNY4
 q5UOM0TlC3qFiTozbSF6V9rwXCw5NqrjOS9nHRdyJia0aLhALTunb8Ypb3oqwskk0tBh
 sTkCvdAVzurcNp22JDLlU9sZMtP1UJT6tktTzABhMQtKcjHkQnlzIG76eX/syvc4lzAu
 ktGbMVPcPFoATkrc/UZmWpv/236DiZXivEvVt0WqkNpls10kohBMwtcTHNZMCBKm9xJO
 UGBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r/RzzACEGmvpF3IiOGI/VeVi04SG1oxFn0L0QmRaXOU=;
 b=CDRtFcEXAjSj+uTMs05+TeokQbo+gkTE+YhKQfKY8GkMGsuhMBvMY8CHO4hHp4yKdI
 2n7Dpfo7WTIiPYfM7p5Xu7lkIhkn6F8ocqT7ejbibWf0v15S9xQGr7eI/+mb2Xi+//Dp
 RhScJ2T/VbKsimo+nxy7OW/ysEVvKUp0l2thqrHelQbEt4dS3Wzs5kjgkr2ViskB2/ST
 sZCT7bgILCHeFDtFsr5siSBVcCbuhw6YB+PVTWpDShVzM994Jxhyx8IfADx1GVC2H8a3
 YJJiF2FK/xzR7oWLTojwj8UI+2fERyQ5MS2hBPxnVM7b8ONvxcn7hh1Q+83b/++BAPrq
 GkQg==
X-Gm-Message-State: AOAM533Dh23u6utavMoka36uOODA6JXIbqh7RNyMhV4tgp3L1jw7fBtI
 66dffwiA7NbSDJU1sLLcEwKQUQ==
X-Google-Smtp-Source: ABdhPJym3UsIoYgofoLQvjSzZVsW6tJDx1MN2tq9DcLrNaC0QZOit3T/fTuKusXLjpplBoXsBqFaJg==
X-Received: by 2002:adf:ed83:: with SMTP id c3mr204682wro.169.1638292379523;
 Tue, 30 Nov 2021 09:12:59 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id n13sm17342354wrt.44.2021.11.30.09.12.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Nov 2021 09:12:59 -0800 (PST)
Subject: Re: [PATCH v3 1/5] dt-bindings: pinctrl: qcom: Update lpass lpi file
 name to SoC specific
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
References: <1638179932-3353-1-git-send-email-srivasam@codeaurora.org>
 <1638179932-3353-2-git-send-email-srivasam@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <14163c1c-c453-0cec-c7e9-1ff0a8a982d3@linaro.org>
Date: Tue, 30 Nov 2021 17:12:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1638179932-3353-2-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Venkata Prasad Potturu <potturu@codeaurora.org>
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



On 29/11/2021 09:58, Srinivasa Rao Mandadapu wrote:
> Change generic lpass lpi pincotrol bindings file to SoC specific file,
> to distinguish and accomadate other SoC specific dt bindings.


TBH, for adding sc7820 lpass lpi support, this rename patch is totally 
not necessary.

> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> ---
>   .../bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml   | 130 ---------------------
>   .../pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml     | 130 +++++++++++++++++++++

Consider using "git mv" when renaming files, this would give a better 
diff stat.

--srini
>   2 files changed, 130 insertions(+), 130 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
>   create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
> deleted file mode 100644
> index e47ebf9..0000000
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
> +++ /dev/null
> @@ -1,130 +0,0 @@
> -# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> -%YAML 1.2
> ----
> -$id: http://devicetree.org/schemas/pinctrl/qcom,lpass-lpi-pinctrl.yaml#
> -$schema: http://devicetree.org/meta-schemas/core.yaml#
> -
> -title: Qualcomm Technologies, Inc. Low Power Audio SubSystem (LPASS)
> -  Low Power Island (LPI) TLMM block
> -
> -maintainers:
> -  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> -
> -description: |
> -  This binding describes the Top Level Mode Multiplexer block found in the
> -  LPASS LPI IP on most Qualcomm SoCs
> -
> -properties:
> -  compatible:
> -    const: qcom,sm8250-lpass-lpi-pinctrl
> -
> -  reg:
> -    minItems: 2
> -    maxItems: 2
> -
> -  clocks:
> -    items:
> -      - description: LPASS Core voting clock
> -      - description: LPASS Audio voting clock
> -
> -  clock-names:
> -    items:
> -      - const: core
> -      - const: audio
> -
> -  gpio-controller: true
> -
> -  '#gpio-cells':
> -    description: Specifying the pin number and flags, as defined in
> -      include/dt-bindings/gpio/gpio.h
> -    const: 2
> -
> -  gpio-ranges:
> -    maxItems: 1
> -
> -#PIN CONFIGURATION NODES
> -patternProperties:
> -  '-pins$':
> -    type: object
> -    description:
> -      Pinctrl node's client devices use subnodes for desired pin configuration.
> -      Client device subnodes use below standard properties.
> -    $ref: "/schemas/pinctrl/pincfg-node.yaml"
> -
> -    properties:
> -      pins:
> -        description:
> -          List of gpio pins affected by the properties specified in this
> -          subnode.
> -        items:
> -          oneOf:
> -            - pattern: "^gpio([0-9]|[1-9][0-9])$"
> -        minItems: 1
> -        maxItems: 14
> -
> -      function:
> -        enum: [ gpio, swr_tx_clk, qua_mi2s_sclk, swr_tx_data, qua_mi2s_ws,
> -                qua_mi2s_data, swr_rx_clk, swr_rx_data, dmic1_clk, i2s1_clk,
> -                dmic1_data, i2s1_ws, dmic2_clk, dmic2_data, i2s1_data,
> -                i2s2_clk, wsa_swr_clk, i2s2_ws, wsa_swr_data, dmic3_clk,
> -                dmic3_data, i2s2_data ]
> -        description:
> -          Specify the alternative function to be configured for the specified
> -          pins.
> -
> -      drive-strength:
> -        enum: [2, 4, 6, 8, 10, 12, 14, 16]
> -        default: 2
> -        description:
> -          Selects the drive strength for the specified pins, in mA.
> -
> -      slew-rate:
> -        enum: [0, 1, 2, 3]
> -        default: 0
> -        description: |
> -            0: No adjustments
> -            1: Higher Slew rate (faster edges)
> -            2: Lower Slew rate (slower edges)
> -            3: Reserved (No adjustments)
> -
> -      bias-pull-down: true
> -
> -      bias-pull-up: true
> -
> -      bias-disable: true
> -
> -      output-high: true
> -
> -      output-low: true
> -
> -    required:
> -      - pins
> -      - function
> -
> -    additionalProperties: false
> -
> -required:
> -  - compatible
> -  - reg
> -  - clocks
> -  - clock-names
> -  - gpio-controller
> -  - '#gpio-cells'
> -  - gpio-ranges
> -
> -additionalProperties: false
> -
> -examples:
> -  - |
> -    #include <dt-bindings/sound/qcom,q6afe.h>
> -    lpi_tlmm: pinctrl@33c0000 {
> -        compatible = "qcom,sm8250-lpass-lpi-pinctrl";
> -        reg = <0x33c0000 0x20000>,
> -              <0x3550000 0x10000>;
> -        clocks = <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> -                 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> -        clock-names = "core", "audio";
> -        gpio-controller;
> -        #gpio-cells = <2>;
> -        gpio-ranges = <&lpi_tlmm 0 0 14>;
> -    };
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml
> new file mode 100644
> index 0000000..e47ebf9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml
> @@ -0,0 +1,130 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/qcom,lpass-lpi-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. Low Power Audio SubSystem (LPASS)
> +  Low Power Island (LPI) TLMM block
> +
> +maintainers:
> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> +
> +description: |
> +  This binding describes the Top Level Mode Multiplexer block found in the
> +  LPASS LPI IP on most Qualcomm SoCs
> +
> +properties:
> +  compatible:
> +    const: qcom,sm8250-lpass-lpi-pinctrl
> +
> +  reg:
> +    minItems: 2
> +    maxItems: 2
> +
> +  clocks:
> +    items:
> +      - description: LPASS Core voting clock
> +      - description: LPASS Audio voting clock
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: audio
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
> +        maxItems: 14
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
> +  - clocks
> +  - clock-names
> +  - gpio-controller
> +  - '#gpio-cells'
> +  - gpio-ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/sound/qcom,q6afe.h>
> +    lpi_tlmm: pinctrl@33c0000 {
> +        compatible = "qcom,sm8250-lpass-lpi-pinctrl";
> +        reg = <0x33c0000 0x20000>,
> +              <0x3550000 0x10000>;
> +        clocks = <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +                 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +        clock-names = "core", "audio";
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        gpio-ranges = <&lpi_tlmm 0 0 14>;
> +    };
> 
