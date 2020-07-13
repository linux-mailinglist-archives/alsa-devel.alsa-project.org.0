Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D25C21E344
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jul 2020 00:55:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7E3A1665;
	Tue, 14 Jul 2020 00:54:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7E3A1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594680922;
	bh=39Ky/qfJXENw6epTibplgmKziuOOCCcmU2WX3mXNrr8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fCThDlOuiSctWkSqPVN45H2G5SAAgukb4uWZSBg4gqlitrmD3RAuy1q477JgND1zs
	 eOukfyPr8ILIArhHdBLEbB/d96CvSE4b8mFZqndhmOHLmzae4uUYg+WMecUlDSbMWf
	 SzvkBl0uVo49qxUbzm/SjKFVOPXv8FR0D42yWM24=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E208CF80116;
	Tue, 14 Jul 2020 00:53:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D20ADF8021D; Tue, 14 Jul 2020 00:53:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 778BBF80116
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 00:53:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 778BBF80116
Received: by mail-io1-f67.google.com with SMTP id l17so3805248iok.7
 for <alsa-devel@alsa-project.org>; Mon, 13 Jul 2020 15:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=i7bl8lVozvsdgE9YS/29f2AjrQyXq5IegzpDYAlFKDk=;
 b=dNMgM/GGq3vBd09ObfD2tnfsDwK0H8lJ6Va0Dqqwd61SrmZR9h0/qEJRPuXjqsIJNz
 z6qiTBemOmM9pyG6NRKquxxoXF3KSZZPsYvETPRc+XlqXIgojLj89PiPNSykgpjkVqK7
 Le2OZ6TUq8ILiazALF5H68jlAPGJCqNaK0LieLiU+7waDEOQRIb7mY28HgH1bbBrNWQ2
 FXULQD0xEU2U8jE8SCvO7NSjx0STDM4/NqyQTK4ikWFJDWNaQuQqIuCDvf+QqABSfFvH
 dHXGYeTXoUXayzUwrzD7PP2HjMowq0wBoM/v16nPXYD7cwg+UMzWZ8teIePLnsoXOLA1
 chng==
X-Gm-Message-State: AOAM531gmMrR4nOICdftRzHgybvioaABSvb/mt3EaqnXTGW7/lveI5Wk
 RG20LLqyVWpz2IDlyXs1Ug==
X-Google-Smtp-Source: ABdhPJzBmSzmcOPXxwclfcbkJAWg4Hx9r7duDiLMl+AGttmUoSZszkVUBupxhl6WuMml7z/UOFnRDg==
X-Received: by 2002:a6b:640e:: with SMTP id t14mr2061843iog.39.1594680811094; 
 Mon, 13 Jul 2020 15:53:31 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id b13sm8316626iof.21.2020.07.13.15.53.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 15:53:30 -0700 (PDT)
Received: (nullmailer pid 872292 invoked by uid 1000);
 Mon, 13 Jul 2020 22:53:28 -0000
Date: Mon, 13 Jul 2020 16:53:28 -0600
From: Rob Herring <robh@kernel.org>
To: Rohit kumar <rohitkr@codeaurora.org>
Subject: Re: [PATCH v3 8/8] dt-bindings: sound: lpass-cpu: Move to yaml format
Message-ID: <20200713225328.GA778183@bogus>
References: <1594184896-10629-1-git-send-email-rohitkr@codeaurora.org>
 <1594184896-10629-9-git-send-email-rohitkr@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594184896-10629-9-git-send-email-rohitkr@codeaurora.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-arm-msm@vger.kernel.org, plai@codeaurora.org,
 tiwai@suse.com, agross@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, Ajit Pandey <ajitp@codeaurora.org>,
 bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org
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

On Wed, Jul 08, 2020 at 10:38:16AM +0530, Rohit kumar wrote:
> From: Ajit Pandey <ajitp@codeaurora.org>
> 
> Update lpass-cpu binding with yaml formats.
> 
> Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
> Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
> ---
>  .../devicetree/bindings/sound/qcom,lpass-cpu.txt   |  80 -----------
>  .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 154 +++++++++++++++++++++
>  2 files changed, 154 insertions(+), 80 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
> deleted file mode 100644
> index 04e34cc..00000000
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
> +++ /dev/null
> @@ -1,80 +0,0 @@
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
> -Example:
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
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> new file mode 100644
> index 00000000..9c350bc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> @@ -0,0 +1,154 @@
> +# SPDX-License-Identifier: GPL-2.0-only
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
> +description:
> +  Qualcomm SOC Low-Power Audio SubSystem (LPASS) that consist of MI2S interface
> +  for audio data transfer on external codecs. LPASS cpu driver is a module to
> +  configure Low-Power Audio Interface(LPAIF) core registers across different
> +  IP versions.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,lpass-cpu
> +      - qcom,apq8016-lpass-cpu
> +      - qcom,lpass-cpu-sc7180
> +
> +  reg:
> +    items:
> +      - description: LPAIF core registers

Just: 'maxItems: 1' for a single entry.

> +
> +  reg-names:
> +    items:
> +      - const: lpass-lpaif

Not all that useful with only 1.

> +
> +  clocks:
> +    items:
> +      - description: AHBIX core clock
> +      - description: oscillator clock for MI2S external interfaces
> +      - description: Bit clock for single MI2S dai
> +      - description: Bit clock for MI2S_PRIMARY dai interface
> +      - description: Bit clock for MI2S_SECONDARY dai interface
> +      - description: Bit clock for MI2S_TERTIARY dai interface
> +      - description: Bit clock for MI2S_QUATERNARY dai interface
> +      - description: NOC MPORT clock of LPASS core
> +      - description: NOC SWAY clock of LPASS core
> +
> +  clock-names:
> +    items:
> +      - const: ahbix-clk
> +      - const: mi2s-osr-clk
> +      - const: mi2s-bit-clk
> +      - const: mi2s-bit-clk0
> +      - const: mi2s-bit-clk1
> +      - const: mi2s-bit-clk2
> +      - const: mi2s-bit-clk3
> +      - const: pcnoc-mport-clk
> +      - const: pcnoc-sway-clk
> +
> +  interrupts:
> +    items:
> +      - description: LPAIF DMA buffer interrupt

maxItems: 1

> +
> +  interrupt-names:
> +    items:
> +      - const: lpass-irq-lpaif
> +
> +  qcom,adsp:
> +    maxItems: 1
> +    description: Phandle for the audio DSP node

Needs a type $ref. And if just a phandle, 'maxItems: 1' is not 
appropriate.

> +
> +  iommus:
> +    maxItems: 1
> +    description: Phandle to apps_smmu node with sid mask
> +
> +  power-domains:
> +    maxItems: 1
> +    description: Phandle for power domain node

Drop. That's every 'power-domains' property.

> +
> +  '#sound-dai-cells':
> +    const: 1
> +
> +  child-node:

I'm sure I said this on some review recently, but you are defining a 
child node named 'child-node'. You need this under patternProperties 
with the actual child node name.

> +    description: Required properties for each DAI
> +    type: object
> +    properties:
> +      reg:
> +        description: Must be one of the DAI ID
> +                     (Usually part of dtbindings header)

Ideally, you'd define the range of values here.

> +      qcom,playback-sd-lines:
> +        description: List of serial data lines to use for playback
> +                     Each SD line should be represented by a number from 0-3.

Needs a type $ref and 0-3 should be expressed as a schema.

'make dt_binding_check' should complain about this. You did run that, 
right?

> +      qcom,capture-sd-lines :
> +        description: List of serial data lines to use for capture
> +                     Each SD line should be represented by a number from 0-3.

ditto

> +    required:
> +      -reg

space     ^

> +    # Note that adding a subnode changes the default to "no lines configured",
> +    # so both playback and capture lines should be configured when a subnode
> +    # is added.
> +
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-names
> +  - sound-dai-cells

Not a valid property.

> +
> +optional:
> +  - qcom,adsp
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: qcom,lpass-cpu-sc7180
> +
> +then:
> +  required:
> +    - iommus
> +    - power-domains
> +
> +examples:
> +  lpass@28100000 {

This is not valid. 'examples' should be a list.

> +	compatible = "qcom,lpass-cpu";
> +	clocks = <&lcc AHBIX_CLK>,
> +		 <&lcc MI2S_OSR_CLK>,
> +		 <&lcc MI2S_BIT_CLK>;

The example will not build because the includes are missing.

> +
> +	clock-names = "ahbix-clk",
> +		      "mi2s-osr-clk",
> +		      "mi2s-bit-clk";
> +
> +	interrupts = <0 85 1>;
> +        interrupt-names = "lpass-irq-lpaif";
> +
> +	iommus = <&apps_smmu 0x1020 0>;
> +	power-domains = <&lpass_hm LPASS_CORE_HM_GDSCR>;
> +
> +	reg = <0x28100000 0x10000>;
> +	reg-names = "lpass-lpaif";
> +	#sound-dai-cells = <1>;
> +	qcom,adsp = <&adsp>;
> +
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	/* Optional to set different MI2S SD lines */
> +	mi2s-quaternary@3 {
> +		reg = <MI2S_QUATERNARY>;
> +		qcom,playback-sd-lines = <0 1>;
> +  };
> -- 
> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
> is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
> 
