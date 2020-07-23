Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2046A22B498
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jul 2020 19:18:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72F611682;
	Thu, 23 Jul 2020 19:17:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72F611682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595524711;
	bh=82CuT3B2oJEoMB9UO7PXa0HTJ/CZfmTTLpJVVu88vMQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sr+XP0B7mljz+DxQrqKQOPxoMUmYcaPomy5OBhPQKp7hMmgtuREMr6tUFd1Lox57N
	 zZJ3L8BqrUOLUWteVBlBoLPxffJiyIhkuStoJWo5IJZHEx8HnObY9lEz2SshtQNYHy
	 jpB+NVF3nrPvJoXxhJe6yfEGi29q+EO8L6HWdljA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A243CF8020D;
	Thu, 23 Jul 2020 19:16:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70A60F80212; Thu, 23 Jul 2020 19:16:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 529BAF800CE
 for <alsa-devel@alsa-project.org>; Thu, 23 Jul 2020 19:16:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 529BAF800CE
Received: by mail-il1-f193.google.com with SMTP id t4so4973542iln.1
 for <alsa-devel@alsa-project.org>; Thu, 23 Jul 2020 10:16:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZUMvuj8eAX170gQ9mGFNERiGRb24OFcJogsQlsHCEEc=;
 b=oQEtHLcrVX/RXFbGLdcELQkqCXEWb79O6ifMtB3/dT4CLTAgzmD4R0PVW4owkU24TY
 3FBKxSxUCUoZY90kEFRB9qryprm9hrwETDSpcyLGd7ddX1Lns81p04PtuO+Bghg+9fRC
 lG/b36ld55wPqRGIOxu1DEN5htxZEhUsdg7FjmBHqLxyzNCqSUqfJ+lFtqbDfs61D8be
 MHw6jVqZpgzoVC4btrxFyAh3hY+noAAPANS9I+rPhh842EV7nR42eakBKp0H7KqmOXv9
 AhWFGStITrpT5ZmTVPmapo8EqHc1bIMcPAd/F6j3T0oyir4MjSBg9SCA2XYSigcC9F9z
 DGpw==
X-Gm-Message-State: AOAM532e9hro3W+pY/QnFVUL/C3d29W89BSxaT1zz5/f/5FFAgVK+Tez
 Id3olxXL+6ANyDd069+KAg==
X-Google-Smtp-Source: ABdhPJxiFoI0aTZugjHZ9P161oA5K6mViNl9PekuivKjxoewfHL+pHLtmo+tDNlrnAlTBWQ2wWOwNA==
X-Received: by 2002:a05:6e02:501:: with SMTP id
 d1mr5642607ils.213.1595524591704; 
 Thu, 23 Jul 2020 10:16:31 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id y2sm1753806iox.22.2020.07.23.10.16.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 10:16:31 -0700 (PDT)
Received: (nullmailer pid 554254 invoked by uid 1000);
 Thu, 23 Jul 2020 17:16:29 -0000
Date: Thu, 23 Jul 2020 11:16:29 -0600
From: Rob Herring <robh@kernel.org>
To: Rohit kumar <rohitkr@codeaurora.org>
Subject: Re: [PATCH v4 12/12] dt-bindings: sound: lpass-cpu: Move to yaml
 format
Message-ID: <20200723171629.GA547775@bogus>
References: <1595413915-17867-1-git-send-email-rohitkr@codeaurora.org>
 <1595413915-17867-13-git-send-email-rohitkr@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1595413915-17867-13-git-send-email-rohitkr@codeaurora.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-arm-msm@vger.kernel.org, plai@codeaurora.org,
 tiwai@suse.com, agross@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, bjorn.andersson@linaro.org,
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

On Wed, Jul 22, 2020 at 04:01:55PM +0530, Rohit kumar wrote:
> Update lpass-cpu binding with yaml formats.
> 
> Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
> ---
>  .../devicetree/bindings/sound/qcom,lpass-cpu.txt   | 130 ---------------
>  .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 185 +++++++++++++++++++++
>  2 files changed, 185 insertions(+), 130 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
> deleted file mode 100644
> index c21392e..00000000
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
> +++ /dev/null
> @@ -1,130 +0,0 @@
> -* Qualcomm Technologies LPASS CPU DAI
> -
> -This node models the Qualcomm Technologies Low-Power Audio SubSystem (LPASS).
> -
> -Required properties:
> -
> -- compatible		: "qcom,lpass-cpu" or "qcom,apq8016-lpass-cpu" or
> -			  "qcom,lpass-cpu-sc7180"
> -- clocks		: Must contain an entry for each entry in clock-names.
> -- clock-names		: A list which must include the following entries:
> -				* "ahbix-clk"
> -				* "mi2s-osr-clk"
> -				* "mi2s-bit-clk"
> -			: required clocks for "qcom,lpass-cpu-apq8016"
> -				* "ahbix-clk"
> -				* "mi2s-bit-clk0"
> -				* "mi2s-bit-clk1"
> -				* "mi2s-bit-clk2"
> -				* "mi2s-bit-clk3"
> -				* "pcnoc-mport-clk"
> -				* "pcnoc-sway-clk"
> -			: required clocks for "qcom,lpass-cpu-sc7180"
> -				* "audio-core"
> -				* "mclk0"
> -				* "mi2s-bit-clk0"
> -				* "mi2s-bit-clk1"
> -				* "pcnoc-sway-clk"
> -				* "pcnoc-mport-clk"
> -
> -- interrupts		: Must contain an entry for each entry in
> -			  interrupt-names.
> -- interrupt-names	: A list which must include the following entries:
> -				* "lpass-irq-lpaif"
> -- pinctrl-N		: One property must exist for each entry in
> -			  pinctrl-names.  See ../pinctrl/pinctrl-bindings.txt
> -			  for details of the property values.
> -- pinctrl-names		: Must contain a "default" entry.
> -- reg			: Must contain an address for each entry in reg-names.
> -- reg-names		: A list which must include the following entries:
> -				* "lpass-lpaif"
> -- #address-cells	: Must be 1
> -- #size-cells		: Must be 0
> -
> -
> -
> -Optional properties:
> -
> -- qcom,adsp		: Phandle for the audio DSP node
> -
> -By default, the driver uses up to 4 MI2S SD lines, for a total of 8 channels.
> -The SD lines to use can be configured by adding subnodes for each of the DAIs.
> -
> -Required properties for each DAI (represented by a subnode):
> -- reg			: Must be one of the DAI IDs
> -			  (usually part of dt-bindings header)
> -- qcom,playback-sd-lines: List of serial data lines to use for playback
> -			  Each SD line should be represented by a number from 0-3.
> -- qcom,capture-sd-lines	: List of serial data lines to use for capture
> -			  Each SD line should be represented by a number from 0-3.
> -
> -Note that adding a subnode changes the default to "no lines configured",
> -so both playback and capture lines should be configured when a subnode is added.
> -
> -Examples:
> -1)
> -
> -lpass@28100000 {
> -	compatible = "qcom,lpass-cpu";
> -	clocks = <&lcc AHBIX_CLK>, <&lcc MI2S_OSR_CLK>, <&lcc MI2S_BIT_CLK>;
> -	clock-names = "ahbix-clk", "mi2s-osr-clk", "mi2s-bit-clk";
> -	interrupts = <0 85 1>;
> -	interrupt-names = "lpass-irq-lpaif";
> -	pinctrl-names = "default", "idle";
> -	pinctrl-0 = <&mi2s_default>;
> -	pinctrl-1 = <&mi2s_idle>;
> -	reg = <0x28100000 0x10000>;
> -	reg-names = "lpass-lpaif";
> -	qcom,adsp = <&adsp>;
> -
> -	#address-cells = <1>;
> -	#size-cells = <0>;
> -
> -	/* Optional to set different MI2S SD lines */
> -	dai@3 {
> -		reg = <MI2S_QUATERNARY>;
> -		qcom,playback-sd-lines = <0 1>;
> -	};
> -};
> -
> -2)
> -
> -#include <dt-bindings/sound/sc7180-lpass.h>
> -
> -lpass_cpu: lpass {
> -	compatible = "qcom,lpass-cpu-sc7180";
> -
> -	reg = <0 0x62F00000 0 0x29000>;
> -
> -	iommus = <&apps_smmu 0x1020 0>;
> -
> -	power-domains = <&lpass_hm LPASS_CORE_HM_GDSCR>;
> -	clocks = <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>,
> -		<&lpasscorecc LPASS_AUDIO_CORE_CORE_CLK>,
> -		<&lpasscorecc LPASS_AUDIO_CORE_EXT_MCLK0_CLK>,
> -		<&lpasscorecc LPASS_AUDIO_CORE_SYSNOC_MPORT_CORE_CLK>,
> -		<&lpasscorecc LPASS_AUDIO_CORE_LPAIF_PRI_IBIT_CLK>,
> -		<&lpasscorecc LPASS_AUDIO_CORE_LPAIF_SEC_IBIT_CLK>;
> -	clock-names = "pcnoc-sway-clk", "audio-core",
> -			"mclk0", "pcnoc-mport-clk",
> -			"mi2s-bit-clk0", "mi2s-bit-clk1";
> -	interrupts = <0 160 IRQ_TYPE_LEVEL_HIGH>;
> -	interrupt-names = "lpass-irq-lpaif";
> -
> -
> -	#sound-dai-cells = <1>;
> -
> -	#address-cells = <1>;
> -	#size-cells = <0>;
> -
> -	mi2s-primary@0 {
> -		reg = <MI2S_PRIMARY>;
> -		qcom,playback-sd-lines = <1>;
> -		qcom,capture-sd-lines = <0>;
> -	};
> -
> -	mi2s-secondary@1 {
> -		reg = <MI2S_SECONDARY>;
> -		qcom,playback-sd-lines = <0>;
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> new file mode 100644
> index 00000000..03c598f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> @@ -0,0 +1,185 @@
> +# SPDX-License-Identifier: GPL-2.0-only

If all the authors are QCom or Linaro please dual license.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm LPASS CPU dai driver bindings
> +
> +maintainers:
> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> +  - Rohit kumar <rohitkr@codeaurora.org>
> +
> +description: |
> +  Qualcomm SOC Low-Power Audio SubSystem (LPASS) that consist of MI2S interface
> +  for audio data transfer on external codecs. LPASS cpu driver is a module to
> +  configure Low-Power Audio Interface(LPAIF) core registers across different
> +  IP versions.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: qcom,lpass-cpu
> +        description: For IPQ806x
> +
> +      - const: qcom,apq8016-lpass-cpu
> +        description: For APQ8016
> +
> +      - const: qcom,lpass-cpu-sc7180
> +        description: For SC7180

Use enum rather than oneOf+const

> +
> +  reg:
> +    maxItems: 1
> +    description: LPAIF core registers
> +
> +  clocks:
> +    minItems: 3
> +    maxItems: 6
> +
> +  clock-names:
> +    minItems: 3
> +    maxItems: 6
> +
> +  interrupts:
> +    maxItems: 1
> +    description: LPAIF DMA buffer interrupt
> +
> +  qcom,adsp:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle for the audio DSP node
> +
> +  iommus:
> +    maxItems: 1
> +    description: Phandle to apps_smmu node with sid mask
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  '#sound-dai-cells':
> +    const: 1
> +
> +patternProperties:
> +  "(^mi2s-[0-9a-f]$|mi2s)":
> +    type: object
> +    description: Required properties for each DAI
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +        description: Must be one of the DAI ID
> +
> +    required:
> +      - reg
> +
> +

Extra blank line.

> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - '#sound-dai-cells'

Add:

additionalProperties: false

> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,lpass-cpu-sc7180
> +
> +    then:
> +      required:
> +        - iommus
> +        - power-domains
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,lpass-cpu
> +
> +    then:
> +      properties:
> +        clock-names:
> +          items:
> +            - const: ahbix-clk
> +            - const: mi2s-osr-clk
> +            - const: mi2s-bit-clk
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,apq8016-lpass-cpu
> +
> +    then:
> +      properties:
> +        clock-names:
> +          items:
> +            - const: ahbix-clk
> +            - const: mi2s-bit-clk0
> +            - const: mi2s-bit-clk1
> +            - const: mi2s-bit-clk2
> +            - const: mi2s-bit-clk3
> +            - const: pcnoc-mport-clk
> +            - const: pcnoc-sway-clk
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,lpass-cpu-sc7180

You already have the same condition previously. Combine into 1.

> +
> +    then:
> +      properties:
> +        clock-names:
> +          items:
> +            - const: pcnoc-sway-clk
> +            - const: audio-core
> +            - const: mclk0
> +            - const: pcnoc-mport-clk
> +            - const: mi2s-bit-clk0
> +            - const: mi2s-bit-clk1
> +
> +examples:
> +  - |
> +    #include <dt-bindings/sound/sc7180-lpass.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +        lpass@62f00000 {
> +            compatible = "qcom,lpass-cpu-sc7180";
> +
> +            reg = <0 0x62f00000  0 0x29000>;
> +
> +            iommus = <&apps_smmu 0x1020 0>;
> +            power-domains = <&lpass_hm 0>;
> +
> +            clocks = <&gcc 131>,
> +                 <&lpasscorecc 6>,
> +                 <&lpasscorecc 7>,
> +                 <&lpasscorecc 10>,
> +                 <&lpasscorecc 8>,
> +                 <&lpasscorecc 9>;
> +
> +            clock-names = "pcnoc-sway-clk", "audio-core",
> +                          "mclk0", "pcnoc-mport-clk",
> +                          "mi2s-bit-clk0", "mi2s-bit-clk1";
> +
> +            interrupts = <0 160 1>;
> +
> +            #sound-dai-cells = <1>;
> +
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            /* Optional to set different MI2S SD lines */
> +            mi2s-primary@0 {
> +                reg = <MI2S_PRIMARY>;
> +                qcom,playback-sd-lines = <1>;
> +                qcom,capture-sd-lines = <0>;
> +            };
> +        };
> +    };
> +
> +...
> -- 
> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
> is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
> 
