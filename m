Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 382732A6F34
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Nov 2020 21:53:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B68EF16A5;
	Wed,  4 Nov 2020 21:52:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B68EF16A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604523193;
	bh=ln4wCs9GBNY97wDL6ZhltxiiPuNh8Wc+LZb6ytUmAMQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oagQED0i2l9WAbFd27kTGllgurKOxe5g5tAM7N9LG9Kpm9K4y7gcASn4v4TuasiQV
	 0u5YdYRFN+GsVeMLXTnl9QC2K0FVXfD3FFUw20SdF1yY7t/xi3txAJM0vYwBnvTkHZ
	 8FltGxNrI1ZB2j7Pt/4CNPNAzf5KNnJcFhYlCHOk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E366F8023E;
	Wed,  4 Nov 2020 21:51:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07350F80234; Wed,  4 Nov 2020 21:51:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oo1-f66.google.com (mail-oo1-f66.google.com
 [209.85.161.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB05DF800EC
 for <alsa-devel@alsa-project.org>; Wed,  4 Nov 2020 21:51:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB05DF800EC
Received: by mail-oo1-f66.google.com with SMTP id v123so5419763ooa.5
 for <alsa-devel@alsa-project.org>; Wed, 04 Nov 2020 12:51:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zU7TvNlHCXUbxg33AP9uABJXLZIQj73d3PF91e5ahFk=;
 b=UaaQm8Hav1soCiFfTl+OqpfsFDdr826q2wCACkgX56cEws2z3Kk0JqoetLjew4Lce2
 p5xuEiR6LtpgB/B8vH5Rot3Mqvq2hdI74yxrwJ0+svXPKV1dHwFPa7K+/iI52cry0RAa
 kCtE+CkwTgG2t6Lbe5/xgYuvltLIrGRdPLro3GT+c58aRQgUgc0hMcRY4y9zT74z9Asg
 JWsw8AVK7kN6hcu0e/om3frALGj4FNGGcDGL3iCWlDzSNbrikSj5IpbJlf7kNCc6My5l
 mbah66tH78fqf4qVvMeR3PKuNnghKsrBRRcWU2dUiRIiYw8Vqc9rVgK8sP07j9e09GdB
 uQ+w==
X-Gm-Message-State: AOAM531ZQrCwk+RR0nDUifvJeNsZKJyVMJO3IJ7Rui3YkCSqctS0tTK2
 k4IC12srX9lUu5VGWuClTw==
X-Google-Smtp-Source: ABdhPJxZqptYULI2FOUTrzrUjpbZox4XBSx56Qe40B14mu1laJn7ZPmIHTqTDF6AK9k/Ewhe8Ken3Q==
X-Received: by 2002:a4a:b209:: with SMTP id d9mr14933ooo.70.1604523090920;
 Wed, 04 Nov 2020 12:51:30 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 8sm740428oii.45.2020.11.04.12.51.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 12:51:30 -0800 (PST)
Received: (nullmailer pid 4105152 invoked by uid 1000);
 Wed, 04 Nov 2020 20:51:29 -0000
Date: Wed, 4 Nov 2020 14:51:29 -0600
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v5 2/3] dt-bindings: ASoC: renesas,rsnd: switch to yaml
 base Documentation
Message-ID: <20201104205129.GB4068421@bogus>
References: <87zh45d0zp.wl-kuninori.morimoto.gx@renesas.com>
 <87wnz9d0yj.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wnz9d0yj.wl-kuninori.morimoto.gx@renesas.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Sameer Pujar <spujar@nvidia.com>
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

On Thu, Oct 29, 2020 at 03:06:23PM +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> This patch switches from .txt base to .yaml base Document.
> It is still keeping detail explanations at .txt
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  .../bindings/sound/renesas,rsnd.txt           | 520 ------------------
>  .../bindings/sound/renesas,rsnd.yaml          | 456 +++++++++++++++
>  2 files changed, 456 insertions(+), 520 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.txt b/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
> index b39743d3f7c4..b731f16aea84 100644
> --- a/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
> +++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
> @@ -253,523 +253,3 @@ This is example of TDM 6ch.
>  Driver can automatically switches TDM <-> stereo mode in this case.
>  
>  see "Example: simple sound card for TDM"
> -
> -=============================================
> -Required properties:
> -=============================================
> -
> -- compatible			: "renesas,rcar_sound-<soctype>", fallbacks
> -				  "renesas,rcar_sound-gen1" if generation1, and
> -				  "renesas,rcar_sound-gen2" if generation2 (or RZ/G1)
> -				  "renesas,rcar_sound-gen3" if generation3 (or RZ/G2)
> -				  Examples with soctypes are:
> -				    - "renesas,rcar_sound-r8a7742" (RZ/G1H)
> -				    - "renesas,rcar_sound-r8a7743" (RZ/G1M)
> -				    - "renesas,rcar_sound-r8a7744" (RZ/G1N)
> -				    - "renesas,rcar_sound-r8a7745" (RZ/G1E)
> -				    - "renesas,rcar_sound-r8a77470" (RZ/G1C)
> -				    - "renesas,rcar_sound-r8a774a1" (RZ/G2M)
> -				    - "renesas,rcar_sound-r8a774b1" (RZ/G2N)
> -				    - "renesas,rcar_sound-r8a774c0" (RZ/G2E)
> -				    - "renesas,rcar_sound-r8a774e1" (RZ/G2H)
> -				    - "renesas,rcar_sound-r8a7778" (R-Car M1A)
> -				    - "renesas,rcar_sound-r8a7779" (R-Car H1)
> -				    - "renesas,rcar_sound-r8a7790" (R-Car H2)
> -				    - "renesas,rcar_sound-r8a7791" (R-Car M2-W)
> -				    - "renesas,rcar_sound-r8a7793" (R-Car M2-N)
> -				    - "renesas,rcar_sound-r8a7794" (R-Car E2)
> -				    - "renesas,rcar_sound-r8a7795" (R-Car H3)
> -				    - "renesas,rcar_sound-r8a7796" (R-Car M3-W)
> -				    - "renesas,rcar_sound-r8a77965" (R-Car M3-N)
> -				    - "renesas,rcar_sound-r8a77990" (R-Car E3)
> -				    - "renesas,rcar_sound-r8a77995" (R-Car D3)
> -- reg				: Should contain the register physical address.
> -				  required register is
> -				   SRU/ADG/SSI      if generation1
> -				   SRU/ADG/SSIU/SSI/AUDIO-DMAC-periperi if generation2/generation3
> -				   Select extended AUDIO-DMAC-periperi address if SoC has it,
> -				   otherwise select normal AUDIO-DMAC-periperi address.
> -- reg-names			: Should contain the register names.
> -				   scu/adg/ssi	if generation1
> -				   scu/adg/ssiu/ssi/audmapp if generation2/generation3
> -- rcar_sound,ssi		: Should contain SSI feature.
> -				  The number of SSI subnode should be same as HW.
> -				  see below for detail.
> -- rcar_sound,ssiu		: Should contain SSIU feature.
> -				  The number of SSIU subnode should be same as HW.
> -				  see below for detail.
> -- rcar_sound,src		: Should contain SRC feature.
> -				  The number of SRC subnode should be same as HW.
> -				  see below for detail.
> -- rcar_sound,ctu		: Should contain CTU feature.
> -				  The number of CTU subnode should be same as HW.
> -				  see below for detail.
> -- rcar_sound,mix		: Should contain MIX feature.
> -				  The number of MIX subnode should be same as HW.
> -				  see below for detail.
> -- rcar_sound,dvc		: Should contain DVC feature.
> -				  The number of DVC subnode should be same as HW.
> -				  see below for detail.
> -- rcar_sound,dai		: DAI contents.
> -				  The number of DAI subnode should be same as HW.
> -				  see below for detail.
> -- #sound-dai-cells		: it must be 0 if your system is using single DAI
> -				  it must be 1 if your system is using multi  DAI
> -- clocks			: References to SSI/SRC/MIX/CTU/DVC/AUDIO_CLK clocks.
> -- clock-names			: List of necessary clock names.
> -				  "ssi-all", "ssi.X", "src.X", "mix.X", "ctu.X",
> -				  "dvc.X", "clk_a", "clk_b", "clk_c", "clk_i"
> -
> -Optional properties:
> -- #clock-cells			: it must be 0 if your system has audio_clkout
> -				  it must be 1 if your system has audio_clkout0/1/2/3
> -- clock-frequency		: for all audio_clkout0/1/2/3
> -- clkout-lr-asynchronous	: boolean property. it indicates that audio_clkoutn
> -				  is asynchronizes with lr-clock.
> -- resets			: References to SSI resets.
> -- reset-names			: List of valid reset names.
> -				  "ssi-all", "ssi.X"
> -
> -SSI subnode properties:
> -- interrupts			: Should contain SSI interrupt for PIO transfer
> -- shared-pin			: if shared clock pin
> -- pio-transfer			: use PIO transfer mode
> -- no-busif			: BUSIF is not ussed when [mem -> SSI] via DMA case
> -- dma				: Should contain Audio DMAC entry
> -- dma-names			: SSI  case "rx"  (=playback), "tx"  (=capture)
> -				  Deprecated: see SSIU subnode properties
> -				  SSIU case "rxu" (=playback), "txu" (=capture)
> -
> -SSIU subnode properties:
> -- dma				: Should contain Audio DMAC entry
> -- dma-names			: "rx" (=playback), "tx" (=capture)
> -
> -SRC subnode properties:
> -- dma				: Should contain Audio DMAC entry
> -- dma-names			: "rx" (=playback), "tx" (=capture)
> -
> -DVC subnode properties:
> -- dma				: Should contain Audio DMAC entry
> -- dma-names			: "tx" (=playback/capture)
> -
> -DAI subnode properties:
> -- playback			: list of playback modules
> -- capture			: list of capture  modules
> -
> -
> -=============================================
> -Example:
> -=============================================
> -
> -rcar_sound: sound@ec500000 {
> -	#sound-dai-cells = <1>;
> -	compatible = "renesas,rcar_sound-r8a7791", "renesas,rcar_sound-gen2";
> -	reg =	<0 0xec500000 0 0x1000>, /* SCU */
> -		<0 0xec5a0000 0 0x100>,  /* ADG */
> -		<0 0xec540000 0 0x1000>, /* SSIU */
> -		<0 0xec541000 0 0x1280>, /* SSI */
> -		<0 0xec740000 0 0x200>;  /* Audio DMAC peri peri*/
> -	reg-names = "scu", "adg", "ssiu", "ssi", "audmapp";
> -
> -	clocks = <&mstp10_clks R8A7790_CLK_SSI_ALL>,
> -		<&mstp10_clks R8A7790_CLK_SSI9>, <&mstp10_clks R8A7790_CLK_SSI8>,
> -		<&mstp10_clks R8A7790_CLK_SSI7>, <&mstp10_clks R8A7790_CLK_SSI6>,
> -		<&mstp10_clks R8A7790_CLK_SSI5>, <&mstp10_clks R8A7790_CLK_SSI4>,
> -		<&mstp10_clks R8A7790_CLK_SSI3>, <&mstp10_clks R8A7790_CLK_SSI2>,
> -		<&mstp10_clks R8A7790_CLK_SSI1>, <&mstp10_clks R8A7790_CLK_SSI0>,
> -		<&mstp10_clks R8A7790_CLK_SCU_SRC9>, <&mstp10_clks R8A7790_CLK_SCU_SRC8>,
> -		<&mstp10_clks R8A7790_CLK_SCU_SRC7>, <&mstp10_clks R8A7790_CLK_SCU_SRC6>,
> -		<&mstp10_clks R8A7790_CLK_SCU_SRC5>, <&mstp10_clks R8A7790_CLK_SCU_SRC4>,
> -		<&mstp10_clks R8A7790_CLK_SCU_SRC3>, <&mstp10_clks R8A7790_CLK_SCU_SRC2>,
> -		<&mstp10_clks R8A7790_CLK_SCU_SRC1>, <&mstp10_clks R8A7790_CLK_SCU_SRC0>,
> -		<&mstp10_clks R8A7790_CLK_SCU_DVC0>, <&mstp10_clks R8A7790_CLK_SCU_DVC1>,
> -		<&audio_clk_a>, <&audio_clk_b>, <&audio_clk_c>, <&m2_clk>;
> -	clock-names = "ssi-all",
> -			"ssi.9", "ssi.8", "ssi.7", "ssi.6", "ssi.5",
> -			"ssi.4", "ssi.3", "ssi.2", "ssi.1", "ssi.0",
> -			"src.9", "src.8", "src.7", "src.6", "src.5",
> -			"src.4", "src.3", "src.2", "src.1", "src.0",
> -			"dvc.0", "dvc.1",
> -			"clk_a", "clk_b", "clk_c", "clk_i";
> -
> -	rcar_sound,dvc {
> -		dvc0: dvc-0 {
> -			dmas = <&audma0 0xbc>;
> -			dma-names = "tx";
> -		};
> -		dvc1: dvc-1 {
> -			dmas = <&audma0 0xbe>;
> -			dma-names = "tx";
> -		};
> -	};
> -
> -	rcar_sound,mix {
> -		mix0: mix-0 { };
> -		mix1: mix-1 { };
> -	};
> -
> -	rcar_sound,ctu {
> -		ctu00: ctu-0 { };
> -		ctu01: ctu-1 { };
> -		ctu02: ctu-2 { };
> -		ctu03: ctu-3 { };
> -		ctu10: ctu-4 { };
> -		ctu11: ctu-5 { };
> -		ctu12: ctu-6 { };
> -		ctu13: ctu-7 { };
> -	};
> -
> -	rcar_sound,src {
> -		src0: src-0 {
> -			interrupts = <0 352 IRQ_TYPE_LEVEL_HIGH>;
> -			dmas = <&audma0 0x85>, <&audma1 0x9a>;
> -			dma-names = "rx", "tx";
> -		};
> -		src1: src-1 {
> -			interrupts = <0 353 IRQ_TYPE_LEVEL_HIGH>;
> -			dmas = <&audma0 0x87>, <&audma1 0x9c>;
> -			dma-names = "rx", "tx";
> -		};
> -		src2: src-2 {
> -			interrupts = <0 354 IRQ_TYPE_LEVEL_HIGH>;
> -			dmas = <&audma0 0x89>, <&audma1 0x9e>;
> -			dma-names = "rx", "tx";
> -		};
> -		src3: src-3 {
> -			interrupts = <0 355 IRQ_TYPE_LEVEL_HIGH>;
> -			dmas = <&audma0 0x8b>, <&audma1 0xa0>;
> -			dma-names = "rx", "tx";
> -		};
> -		src4: src-4 {
> -			interrupts = <0 356 IRQ_TYPE_LEVEL_HIGH>;
> -			dmas = <&audma0 0x8d>, <&audma1 0xb0>;
> -			dma-names = "rx", "tx";
> -		};
> -		src5: src-5 {
> -			interrupts = <0 357 IRQ_TYPE_LEVEL_HIGH>;
> -			dmas = <&audma0 0x8f>, <&audma1 0xb2>;
> -			dma-names = "rx", "tx";
> -		};
> -		src6: src-6 {
> -			interrupts = <0 358 IRQ_TYPE_LEVEL_HIGH>;
> -			dmas = <&audma0 0x91>, <&audma1 0xb4>;
> -			dma-names = "rx", "tx";
> -		};
> -		src7: src-7 {
> -			interrupts = <0 359 IRQ_TYPE_LEVEL_HIGH>;
> -			dmas = <&audma0 0x93>, <&audma1 0xb6>;
> -			dma-names = "rx", "tx";
> -		};
> -		src8: src-8 {
> -			interrupts = <0 360 IRQ_TYPE_LEVEL_HIGH>;
> -			dmas = <&audma0 0x95>, <&audma1 0xb8>;
> -			dma-names = "rx", "tx";
> -		};
> -		src9: src-9 {
> -			interrupts = <0 361 IRQ_TYPE_LEVEL_HIGH>;
> -			dmas = <&audma0 0x97>, <&audma1 0xba>;
> -			dma-names = "rx", "tx";
> -		};
> -	};
> -
> -	rcar_sound,ssiu {
> -		ssiu00: ssiu-0 {
> -			dmas = <&audma0 0x15>, <&audma1 0x16>;
> -			dma-names = "rx", "tx";
> -		};
> -		ssiu01: ssiu-1 {
> -			dmas = <&audma0 0x35>, <&audma1 0x36>;
> -			dma-names = "rx", "tx";
> -		};
> -
> -		...
> -
> -		ssiu95: ssiu-49 {
> -			dmas = <&audma0 0xA5>, <&audma1 0xA6>;
> -			dma-names = "rx", "tx";
> -		};
> -		ssiu96: ssiu-50 {
> -			dmas = <&audma0 0xA7>, <&audma1 0xA8>;
> -			dma-names = "rx", "tx";
> -		};
> -		ssiu97: ssiu-51 {
> -			dmas = <&audma0 0xA9>, <&audma1 0xAA>;
> -			dma-names = "rx", "tx";
> -		};
> -	};
> -
> -	rcar_sound,ssi {
> -		ssi0: ssi-0 {
> -			interrupts = <0 370 IRQ_TYPE_LEVEL_HIGH>;
> -			dmas = <&audma0 0x01>, <&audma1 0x02>;
> -			dma-names = "rx", "tx";
> -		};
> -		ssi1: ssi-1 {
> -			interrupts = <0 371 IRQ_TYPE_LEVEL_HIGH>;
> -			dmas = <&audma0 0x03>, <&audma1 0x04>;
> -			dma-names = "rx", "tx";
> -		};
> -
> -		...
> -
> -		ssi8: ssi-8 {
> -			interrupts = <0 378 IRQ_TYPE_LEVEL_HIGH>;
> -			dmas = <&audma0 0x11>, <&audma1 0x12>;
> -			dma-names = "rx", "tx";
> -		};
> -		ssi9: ssi-9 {
> -			interrupts = <0 379 IRQ_TYPE_LEVEL_HIGH>;
> -			dmas = <&audma0 0x13>, <&audma1 0x14>;
> -			dma-names = "rx", "tx";
> -		};
> -	};
> -
> -	rcar_sound,dai {
> -		dai0 {
> -			playback = <&ssi5 &src5>;
> -			capture  = <&ssi6>;
> -		};
> -		dai1 {
> -			playback = <&ssi3>;
> -		};
> -		dai2 {
> -			capture  = <&ssi4>;
> -		};
> -		dai3 {
> -			playback = <&ssi7>;
> -		};
> -		dai4 {
> -			capture  = <&ssi8>;
> -		};
> -	};
> -};
> -
> -=============================================
> -Example: simple sound card
> -=============================================
> -
> -	rsnd_ak4643: sound {
> -		compatible = "simple-audio-card";
> -
> -		simple-audio-card,format = "left_j";
> -		simple-audio-card,bitclock-master = <&sndcodec>;
> -		simple-audio-card,frame-master = <&sndcodec>;
> -
> -		sndcpu: simple-audio-card,cpu {
> -			sound-dai = <&rcar_sound>;
> -		};
> -
> -		sndcodec: simple-audio-card,codec {
> -			sound-dai = <&ak4643>;
> -			clocks = <&audio_clock>;
> -		};
> -	};
> -
> -&rcar_sound {
> -	pinctrl-0 = <&sound_pins &sound_clk_pins>;
> -	pinctrl-names = "default";
> -
> -	/* Single DAI */
> -	#sound-dai-cells = <0>;
> -
> -
> -	rcar_sound,dai {
> -		dai0 {
> -			playback = <&ssi0 &src2 &dvc0>;
> -			capture  = <&ssi1 &src3 &dvc1>;
> -		};
> -	};
> -};
> -
> -&ssi1 {
> -	shared-pin;
> -};
> -
> -=============================================
> -Example: simple sound card for Asynchronous mode
> -=============================================
> -
> -sound {
> -	compatible = "simple-scu-audio-card";
> -	...
> -	/*
> -	 * SRC Asynchronous mode setting
> -	 * Playback:
> -	 * All input data will be converted to 48kHz
> -	 * Capture:
> -	 * Inputed 48kHz data will be converted to
> -	 * system specified Hz
> -	 */
> -	simple-audio-card,convert-rate = <48000>;
> -	...
> -	simple-audio-card,cpu {
> -		sound-dai = <&rcar_sound>;
> -	};
> -	simple-audio-card,codec {
> -		...
> -	};
> -};
> -
> -=============================================
> -Example: simple sound card for channel convert
> -=============================================
> -
> -sound {
> -	compatible = "simple-scu-audio-card";
> -	...
> -	/*
> -	 * CTU setting
> -	 * All input data will be converted to 2ch
> -	 * as output data
> -	 */
> -	simple-audio-card,convert-channels = <2>;
> -	...
> -	simple-audio-card,cpu {
> -		sound-dai = <&rcar_sound>;
> -	};
> -	simple-audio-card,codec {
> -		...
> -	};
> -};
> -
> -=============================================
> -Example: simple sound card for MIXer
> -=============================================
> -
> -sound {
> -	compatible = "simple-scu-audio-card";
> -	...
> -	simple-audio-card,cpu@0 {
> -		sound-dai = <&rcar_sound 0>;
> -	};
> -	simple-audio-card,cpu@1 {
> -		sound-dai = <&rcar_sound 1>;
> -	};
> -	simple-audio-card,codec {
> -		...
> -	};
> -};
> -
> -&rcar_sound {
> -	...
> -	rcar_sound,dai {
> -		dai0 {
> -			playback = <&src1 &ctu02 &mix0 &dvc0 &ssi0>;
> -		};
> -		dai1 {
> -			playback = <&src2 &ctu03 &mix0 &dvc0 &ssi0>;
> -		};
> -	};
> -};
> -
> -=============================================
> -Example: simple sound card for TDM
> -=============================================
> -
> -rsnd_tdm: sound {
> -	compatible = "simple-audio-card";
> -
> -	simple-audio-card,format = "left_j";
> -	simple-audio-card,bitclock-master = <&sndcodec>;
> -	simple-audio-card,frame-master = <&sndcodec>;
> -
> -	sndcpu: simple-audio-card,cpu {
> -		sound-dai = <&rcar_sound>;
> -		dai-tdm-slot-num = <6>;
> -	};
> -
> -	sndcodec: simple-audio-card,codec {
> -		sound-dai = <&xxx>;
> -	};
> -};
> -
> -=============================================
> -Example: simple sound card for TDM Split
> -=============================================
> -
> -sound_card: sound {
> -	compatible = "audio-graph-scu-card";
> -	prefix = "xxxx";
> -	routing = "xxxx Playback", "DAI0 Playback",
> -		  "xxxx Playback", "DAI1 Playback",
> -		  "xxxx Playback", "DAI2 Playback",
> -		  "xxxx Playback", "DAI3 Playback";
> -	convert-channels = <8>; /* TDM Split */
> -
> -	dais = <&rsnd_port0     /* playback ch1/ch2 */
> -		&rsnd_port1     /* playback ch3/ch4 */
> -		&rsnd_port2     /* playback ch5/ch6 */
> -		&rsnd_port3     /* playback ch7/ch8 */
> -		>;
> -};
> -
> -audio-codec {
> -	...
> -	port {
> -		codec_0: endpoint@1 {
> -			remote-endpoint = <&rsnd_ep0>;
> -		};
> -		codec_1: endpoint@2 {
> -			remote-endpoint = <&rsnd_ep1>;
> -		};
> -		codec_2: endpoint@3 {
> -			remote-endpoint = <&rsnd_ep2>;
> -		};
> -		codec_3: endpoint@4 {
> -			remote-endpoint = <&rsnd_ep3>;
> -		};
> -	};
> -};
> -
> -&rcar_sound {
> -	...
> -	ports {
> -		rsnd_port0: port@0 {
> -			rsnd_ep0: endpoint {
> -				remote-endpoint = <&codec_0>;
> -				...
> -				playback = <&ssiu30 &ssi3>;
> -			};
> -		};
> -		rsnd_port1: port@1 {
> -			rsnd_ep1: endpoint {
> -				remote-endpoint = <&codec_1>;
> -				...
> -				playback = <&ssiu31 &ssi3>;
> -			};
> -		};
> -		rsnd_port2: port@2 {
> -			rsnd_ep2: endpoint {
> -				remote-endpoint = <&codec_2>;
> -				...
> -				playback = <&ssiu32 &ssi3>;
> -			};
> -		};
> -		rsnd_port3: port@3 {
> -			rsnd_ep3: endpoint {
> -				remote-endpoint = <&codec_3>;
> -				...
> -				playback = <&ssiu33 &ssi3>;
> -			};
> -		};
> -	};
> -};
> -
> -=============================================
> -Example: simple sound card for Multi channel
> -=============================================
> -
> -&rcar_sound {
> -	pinctrl-0 = <&sound_pins &sound_clk_pins>;
> -	pinctrl-names = "default";
> -
> -	/* Single DAI */
> -	#sound-dai-cells = <0>;
> -
> -
> -	rcar_sound,dai {
> -		dai0 {
> -			playback = <&ssi0 &ssi1 &ssi2 &src0 &dvc0>;
> -		};
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> new file mode 100644
> index 000000000000..9be88c2e4f16
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> @@ -0,0 +1,456 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas R-Car Sound Driver Device Tree Bindings
> +
> +maintainers:
> +  - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> +
> +properties:
> +
> +  compatible:
> +    oneOf:
> +      # for Gen1 SoC
> +      - items:
> +          - enum:
> +              - renesas,rcar_sound-r8a7778   # R-Car M1A
> +              - renesas,rcar_sound-r8a7779   # R-Car H1
> +          - enum:
> +              - renesas,rcar_sound-gen1
> +      # for Gen2 SoC
> +      - items:
> +          - enum:
> +              - renesas,rcar_sound-r8a7742   # RZ/G1H
> +              - renesas,rcar_sound-r8a7743   # RZ/G1M
> +              - renesas,rcar_sound-r8a7744   # RZ/G1N
> +              - renesas,rcar_sound-r8a7745   # RZ/G1E
> +              - renesas,rcar_sound-r8a77470  # RZ/G1C
> +              - renesas,rcar_sound-r8a7790   # R-Car H2
> +              - renesas,rcar_sound-r8a7791   # R-Car M2-W
> +              - renesas,rcar_sound-r8a7793   # R-Car M2-N
> +              - renesas,rcar_sound-r8a7794   # R-Car E2
> +          - enum:
> +              - renesas,rcar_sound-gen2
> +      # for Gen3 SoC
> +      - items:
> +          - enum:
> +              - renesas,rcar_sound-r8a774a1  # RZ/G2M
> +              - renesas,rcar_sound-r8a774b1  # RZ/G2N
> +              - renesas,rcar_sound-r8a774c0  # RZ/G2E
> +              - renesas,rcar_sound-r8a774e1  # RZ/G2H
> +              - renesas,rcar_sound-r8a7795   # R-Car H3
> +              - renesas,rcar_sound-r8a7796   # R-Car M3-W
> +              - renesas,rcar_sound-r8a77965  # R-Car M3-N
> +              - renesas,rcar_sound-r8a77990  # R-Car E3
> +              - renesas,rcar_sound-r8a77995  # R-Car D3
> +          - enum:
> +              - renesas,rcar_sound-gen3
> +      # for Generic
> +      - items:
> +          - enum:
> +              - renesas,rcar_sound-gen1
> +              - renesas,rcar_sound-gen2
> +              - renesas,rcar_sound-gen3
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 5
> +
> +  reg-names:
> +    minItems: 1
> +    maxItems: 5
> +
> +  "#sound-dai-cells":
> +    description: |
> +      it must be 0 if your system is using single DAI
> +      it must be 1 if your system is using multi  DAIs
> +    enum: [0, 1]
> +
> +  "#clock-cells":
> +    description: |
> +      it must be 0 if your system has audio_clkout
> +      it must be 1 if your system has audio_clkout0/1/2/3
> +    enum: [0, 1]
> +
> +  clock-frequency:
> +    description: for audio_clkout0/1/2/3
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +
> +  clkout-lr-asynchronous:
> +    description: audio_clkoutn is asynchronizes with lr-clock.
> +    $ref: /schemas/types.yaml#/definitions/flag
> +
> +  power-domains: true
> +
> +  resets:
> +    maxItems: 11
> +
> +  reset-names:
> +    maxItems: 11
> +
> +  clocks:
> +    description: References to SSI/SRC/MIX/CTU/DVC/AUDIO_CLK clocks.
> +    minItems: 1
> +    maxItems: 31
> +
> +  clock-names:
> +    description: List of necessary clock names.
> +    minItems: 1
> +    maxItems: 31
> +    items:
> +      oneOf:
> +        - const: ssi-all
> +        - pattern: '^ssi\.[0-9]$'
> +        - pattern: '^src\.[0-9]$'
> +        - pattern: '^mix\.[0-1]$'
> +        - pattern: '^ctu\.[0-1]$'
> +        - pattern: '^dvc\.[0-1]$'
> +        - pattern: '^clk_(a|b|c|i)$'
> +
> +  port:
> +    description: OF-Graph subnode
> +    $ref: "audio-graph-card.yaml#/properties/port"
> +
> +  ports:
> +    description: multi OF-Graph subnode
> +    $ref: "audio-graph-card.yaml#/properties/ports"
> +
> +# use patternProperties to avoid naming "xxx,yyy" issue
> +patternProperties:
> +  "^rcar_sound,dvc$":
> +    description: DVC subnode.
> +    type: object
> +    patternProperties:
> +      "^dvc-[0-1]$":
> +        type: object
> +        properties:
> +          dmas:
> +            maxItems: 1
> +          dma-names:
> +            const: "tx"
> +        required:
> +          - dmas
> +          - dma-names
> +    additionalProperties: false
> +
> +  "^rcar_sound,mix$":
> +    description: MIX subnode.
> +    type: object
> +    patternProperties:
> +      "^mix-[0-1]$":
> +        type: object
> +        # no propaties

typo

If no properties, then should have 'additionalProperties: false'/

> +    additionalProperties: false
> +
> +  "^rcar_sound,ctu$":
> +    description: CTU subnode.
> +    type: object
> +    patternProperties:
> +      "^ctu-[0-7]$":
> +        type: object
> +        # no propaties

Same here.

> +    additionalProperties: false
> +
> +  "^rcar_sound,src$":
> +    description: SRC subnode.
> +    type: object
> +    patternProperties:
> +      "^src-[0-9]$":
> +        type: object
> +        properties:
> +          interrupts:
> +            maxItems: 1
> +          dmas:
> +            maxItems: 2
> +          dma-names:
> +            allOf:
> +              - items:
> +                  enum:
> +                    - tx
> +                    - rx
> +        allOf:
> +          - if:
> +              properties:
> +                status:
> +                  const: "ok"

I think we have a GH issue for this problem. Please don't work around it 
and we'll need to fix it.

> +            then:
> +              required:
> +                - interrupts
> +                - dmas
> +                - dma-names
> +    additionalProperties: false
> +
> +  "^rcar_sound,ssiu$":
> +    description: SSIU subnode.
> +    type: object
> +    patternProperties:
> +      "^ssiu-[0-9]+$":
> +        type: object
> +        properties:
> +          dmas:
> +            maxItems: 2
> +          dma-names:
> +            allOf:
> +              - items:
> +                  enum:
> +                    - tx
> +                    - rx
> +        required:
> +          - dmas
> +          - dma-names
> +    additionalProperties: false
> +
> +  "^rcar_sound,ssi$":
> +    description: SSI subnode.
> +    type: object
> +    patternProperties:
> +      "^ssi-[0-9]$":
> +        type: object
> +        properties:
> +          interrupts:
> +            maxItems: 1
> +          dmas:
> +            minItems: 2
> +            maxItems: 4
> +          dma-names:
> +            allOf:
> +              - items:
> +                  enum:
> +                    - tx
> +                    - rx
> +                    - txu # if no ssiu node
> +                    - rxu # if no ssiu node
> +
> +          shared-pin:
> +            description: shared clock pin
> +            $ref: /schemas/types.yaml#/definitions/flag
> +          pio-transfer:
> +            description: PIO transfer mode
> +            $ref: /schemas/types.yaml#/definitions/flag
> +          no-busif:
> +            description: BUSIF is not used when [mem -> SSI] via DMA case
> +            $ref: /schemas/types.yaml#/definitions/flag
> +        required:
> +          - interrupts
> +          - dmas
> +          - dma-names
> +    additionalProperties: false
> +
> +  # For DAI base
> +  "^rcar_sound,dai$":
> +    description: DAI subnode.
> +    type: object
> +    patternProperties:
> +      "^dai([0-9]+)?$":
> +        type: object
> +        properties:
> +          playback:
> +            $ref: /schemas/types.yaml#/definitions/phandle-array
> +          capture:
> +            $ref: /schemas/types.yaml#/definitions/phandle-array
> +        anyOf:
> +          - required:
> +              - playback
> +          - required:
> +              - capture
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - "#sound-dai-cells"
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,rcar_sound-gen1
> +    then:
> +      properties:
> +        reg:
> +          maxItems: 3
> +        reg-names:
> +          maxItems: 3
> +          items:
> +            enum:
> +              - scu
> +              - ssi
> +              - adg
> +    else:
> +      properties:
> +        reg:
> +          maxItems: 5
> +        reg-names:
> +          maxItems: 5
> +          items:
> +            enum:
> +              - scu
> +              - adg
> +              - ssiu
> +              - ssi
> +              - audmapp
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    rcar_sound: sound@ec500000 {
> +        #sound-dai-cells = <1>;
> +        compatible = "renesas,rcar_sound-r8a7790", "renesas,rcar_sound-gen2";
> +        reg = <0xec500000 0x1000>, /* SCU  */
> +              <0xec5a0000 0x100>,  /* ADG  */
> +              <0xec540000 0x1000>, /* SSIU */
> +              <0xec541000 0x1280>, /* SSI  */
> +              <0xec740000 0x200>;  /* Audio DMAC peri peri*/
> +        reg-names = "scu", "adg", "ssiu", "ssi", "audmapp";
> +
> +        clocks = <&mstp10_clks 1005>,                      /* SSI-ALL    */
> +                 <&mstp10_clks 1006>, <&mstp10_clks 1007>, /* SSI9, SSI8 */
> +                 <&mstp10_clks 1008>, <&mstp10_clks 1009>, /* SSI7, SSI6 */
> +                 <&mstp10_clks 1010>, <&mstp10_clks 1011>, /* SSI5, SSI4 */
> +                 <&mstp10_clks 1012>, <&mstp10_clks 1013>, /* SSI3, SSI2 */
> +                 <&mstp10_clks 1014>, <&mstp10_clks 1015>, /* SSI1, SSI0 */
> +                 <&mstp10_clks 1022>, <&mstp10_clks 1023>, /* SRC9, SRC8 */
> +                 <&mstp10_clks 1024>, <&mstp10_clks 1025>, /* SRC7, SRC6 */
> +                 <&mstp10_clks 1026>, <&mstp10_clks 1027>, /* SRC5, SRC4 */
> +                 <&mstp10_clks 1028>, <&mstp10_clks 1029>, /* SRC3, SRC2 */
> +                 <&mstp10_clks 1030>, <&mstp10_clks 1031>, /* SRC1, SRC0 */
> +                 <&mstp10_clks 1020>, <&mstp10_clks 1021>, /* MIX1, MIX0 */
> +                 <&mstp10_clks 1020>, <&mstp10_clks 1021>, /* CTU1, CTU0 */
> +                 <&mstp10_clks 1019>, <&mstp10_clks 1018>, /* DVC0, DVC1 */
> +                 <&audio_clk_a>, <&audio_clk_b>,           /* CLKA, CLKB */
> +                 <&audio_clk_c>, <&audio_clk_i>;           /* CLKC, CLKI */
> +
> +        clock-names = "ssi-all",
> +                      "ssi.9", "ssi.8",
> +                      "ssi.7", "ssi.6",
> +                      "ssi.5", "ssi.4",
> +                      "ssi.3", "ssi.2",
> +                      "ssi.1", "ssi.0",
> +                      "src.9", "src.8",
> +                      "src.7", "src.6",
> +                      "src.5", "src.4",
> +                      "src.3", "src.2",
> +                      "src.1", "src.0",
> +                      "mix.1", "mix.0",
> +                      "ctu.1", "ctu.0",
> +                      "dvc.0", "dvc.1",
> +                      "clk_a", "clk_b",
> +                      "clk_c", "clk_i";
> +
> +        rcar_sound,dvc {
> +               dvc0: dvc-0 {
> +                    dmas = <&audma0 0xbc>;
> +                    dma-names = "tx";
> +               };
> +               dvc1: dvc-1 {
> +                    dmas = <&audma0 0xbe>;
> +                    dma-names = "tx";
> +               };
> +        };
> +
> +        rcar_sound,mix {
> +            mix0: mix-0 { };
> +            mix1: mix-1 { };
> +        };
> +
> +        rcar_sound,ctu {
> +            ctu00: ctu-0 { };
> +            ctu01: ctu-1 { };
> +            ctu02: ctu-2 { };
> +            ctu03: ctu-3 { };
> +            ctu10: ctu-4 { };
> +            ctu11: ctu-5 { };
> +            ctu12: ctu-6 { };
> +            ctu13: ctu-7 { };
> +        };
> +
> +        rcar_sound,src {
> +            src0: src-0 {
> +                status = "disabled";
> +            };
> +            src1: src-1 {
> +                interrupts = <0 353 0>;
> +                dmas = <&audma0 0x87>, <&audma1 0x9c>;
> +                dma-names = "rx", "tx";
> +            };
> +            /* skip after src-2 */
> +        };
> +
> +        rcar_sound,ssiu {
> +            ssiu00: ssiu-0 {
> +                dmas = <&audma0 0x15>, <&audma1 0x16>;
> +                dma-names = "rx", "tx";
> +            };
> +            ssiu01: ssiu-1 {
> +                dmas = <&audma0 0x35>, <&audma1 0x36>;
> +                dma-names = "rx", "tx";
> +            };
> +            /* skip after ssiu-2 */
> +        };
> +
> +        rcar_sound,ssi {
> +            ssi0: ssi-0 {
> +                interrupts = <0 370 1>;
> +                dmas = <&audma0 0x01>, <&audma1 0x02>;
> +                dma-names = "rx", "tx";
> +            };
> +            ssi1: ssi-1 {
> +                interrupts = <0 371 1>;
> +                dmas = <&audma0 0x03>, <&audma1 0x04>;
> +                dma-names = "rx", "tx";
> +            };
> +            /* skip other ssi-2 */
> +        };
> +
> +        /* DAI base */
> +        rcar_sound,dai {
> +            dai0 {
> +                playback = <&ssi5 &src5>;
> +                capture  = <&ssi6>;
> +            };
> +            dai1 {
> +                playback = <&ssi3>;
> +            };
> +            dai2 {
> +                capture  = <&ssi4>;
> +            };
> +            dai3 {
> +                playback = <&ssi7>;
> +            };
> +            dai4 {
> +                capture  = <&ssi8>;
> +            };
> +        };
> +
> +        /* assume audio-graph */
> +        port {
> +            rsnd_endpoint: endpoint {
> +                remote-endpoint = <&codec_endpoint>;
> +
> +                dai-format = "left_j";
> +                bitclock-master = <&rsnd_endpoint0>;
> +                frame-master = <&rsnd_endpoint0>;
> +
> +                playback = <&ssi0 &src0 &dvc0>;
> +                capture  = <&ssi1 &src1 &dvc1>;
> +            };
> +        };
> +    };
> +
> +
> +    /* assume audio-graph */
> +    codec {
> +        port {
> +            codec_endpoint: endpoint {
> +                remote-endpoint = <&rsnd_endpoint>;
> +            };
> +        };
> +    };
> -- 
> 2.25.1
> 
