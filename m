Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D12CF226244
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jul 2020 16:36:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F56B950;
	Mon, 20 Jul 2020 16:36:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F56B950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595255812;
	bh=IUaCGFz+1FkfmX6UmlCld3D4jv/AkfevYOsihf32mXU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D1PwtqU1jADuUPFojlDQZkwhlPgh6ACVsPeaVZ1Mhd2D6H5qGYVoX6rbPi+jXNc1U
	 jNhOAQIkBuzL/xsZ9+TkPQItxFnN1VHegJe/3NFVCbZc7EQLWGRZA/dv+lDkzdry5d
	 0tsBDthF5+VS4cc9QebQwx6EbzcHS0sGU7AS/S+8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEBA4F80125;
	Mon, 20 Jul 2020 16:35:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 415BFF800F5; Mon, 20 Jul 2020 16:35:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C048F800BF
 for <alsa-devel@alsa-project.org>; Mon, 20 Jul 2020 16:35:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C048F800BF
Received: by mail-wm1-f65.google.com with SMTP id f18so25385132wml.3
 for <alsa-devel@alsa-project.org>; Mon, 20 Jul 2020 07:35:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+r2u+PCexGuJVhWs1yoHEOY5ocWtnaVreiGt6s45ER8=;
 b=pV5QoOxqxn9Y/Qy6I+lI10PZqfVtXByoWwdgledbONlJp89IUVGq3ZxuHrfr+pfFh/
 kofoNsU8XwUDerEDEe6LdxUV6GOGUSTs5y1l6sYJkClsFKkXFzWfPffcm/7wDVMcqnhr
 iqZdU50MDx+nHATgUS9av3CEUUWa1FzUSFQ9EnuHryxxBUyntaQohKCF8HZ2sqAWHCYa
 EmVNGUkkUUl/FvbsTxe4/SrokbcCR0o05+iPLZ1eADQ5Vv54MNBetaBjBwjNCW8AjTUM
 NPjDoMj2JzEICV/tOiRuBrNZkSlz0sSle2c6chIe3I9sMQWOhPRbZ+ZTVPr9g5Smr2TV
 1AVg==
X-Gm-Message-State: AOAM530etpzn5qYd6A989LmcLLw1l7qfTVQC2jbqEynilk84iTbyvgwm
 Rtrh1j+IMgArEZhUm0RFSck=
X-Google-Smtp-Source: ABdhPJxRipv2tkqEqYkuo3zpdcP1VGOvvK0e9Fm2hGi2sGAcG+HMrTSZDYO2+lcXdtzkwgjLmtKn/A==
X-Received: by 2002:a1c:4c16:: with SMTP id z22mr21536363wmf.103.1595255702383; 
 Mon, 20 Jul 2020 07:35:02 -0700 (PDT)
Received: from kozik-lap ([194.230.155.200])
 by smtp.googlemail.com with ESMTPSA id u20sm31202600wmm.15.2020.07.20.07.35.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 20 Jul 2020 07:35:01 -0700 (PDT)
Date: Mon, 20 Jul 2020 16:34:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 3/3] ARM: dts: exynos: Add sound support to Midas
Message-ID: <20200720143458.GB22554@kozik-lap>
References: <20200710173500.22365-1-s.nawrocki@samsung.com>
 <CGME20200710173518eucas1p1eeaaadd2359da3c863c43cd368a84213@eucas1p1.samsung.com>
 <20200710173500.22365-3-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200710173500.22365-3-s.nawrocki@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: simon@lineageos.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 b.zolnierkie@samsung.com, robh+dt@kernel.org, broonie@kernel.org,
 m.szyprowski@samsung.com
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

On Fri, Jul 10, 2020 at 07:35:00PM +0200, Sylwester Nawrocki wrote:
> From: Simon Shields <simon@lineageos.org>
> 
> Update the never-mainlined "samsung,trats2-audio" binding and instead
> use the new "samsung,midas-audio" binding.
> 
> Signed-off-by: Simon Shields <simon@lineageos.org>
> [s.nawrocki: fixed DAPM routing entries for MICBIAS1/2, adjusted to
>  changes in the DT binding]
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi | 38 ++++++++++++++
>  arch/arm/boot/dts/exynos4412-i9300.dts      |  4 ++
>  arch/arm/boot/dts/exynos4412-midas.dtsi     | 78 ++++++++++++++++++++++++-----
>  arch/arm/boot/dts/exynos4412-n710x.dts      | 35 +++++++++++++
>  4 files changed, 142 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
> index 53b3ca3..cff0980 100644
> --- a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
> +++ b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
> @@ -175,3 +175,41 @@
>  	gpio = <&gpm0 0 GPIO_ACTIVE_HIGH>;
>  	status = "okay";
>  };
> +
> +&submic_bias_reg {

Put them in alphabetical order against oder phandle overrides. Same for
n710x.dts.

> +	gpio = <&gpf2 0 GPIO_ACTIVE_HIGH>;
> +	enable-active-high;
> +};
> +
> +&sound {
> +	samsung,audio-routing =
> +		"HP", "HPOUT1L",
> +		"HP", "HPOUT1R",
> +
> +		"SPK", "SPKOUTLN",
> +		"SPK", "SPKOUTLP",
> +		"SPK", "SPKOUTRN",
> +		"SPK", "SPKOUTRP",
> +
> +		"RCV", "HPOUT2N",
> +		"RCV", "HPOUT2P",
> +
> +		"HDMI", "LINEOUT1N",
> +		"HDMI", "LINEOUT1P",
> +
> +		"LINE", "LINEOUT2N",
> +		"LINE", "LINEOUT2P",
> +
> +		"IN1LP", "MICBIAS1",
> +		"IN1LN", "MICBIAS1",
> +		"Main Mic", "MICBIAS1",
> +
> +		"IN1RP", "Sub Mic",
> +		"IN1RN", "Sub Mic",
> +
> +		"IN2LP:VXRN", "MICBIAS2",
> +		"Headset Mic", "MICBIAS2",
> +
> +		"IN2RN", "FM In",
> +		"IN2RP:VXRP", "FM In";
> +};
> diff --git a/arch/arm/boot/dts/exynos4412-i9300.dts b/arch/arm/boot/dts/exynos4412-i9300.dts
> index f8125a9..3691802 100644
> --- a/arch/arm/boot/dts/exynos4412-i9300.dts
> +++ b/arch/arm/boot/dts/exynos4412-i9300.dts
> @@ -20,3 +20,7 @@
>  		reg =  <0x40000000 0x40000000>;
>  	};
>  };
> +
> +&sound {
> +	fm-sel-gpios = <&gpl0 3 GPIO_ACTIVE_HIGH>;
> +};
> diff --git a/arch/arm/boot/dts/exynos4412-midas.dtsi b/arch/arm/boot/dts/exynos4412-midas.dtsi
> index 2c8111c..2752363 100644
> --- a/arch/arm/boot/dts/exynos4412-midas.dtsi
> +++ b/arch/arm/boot/dts/exynos4412-midas.dtsi
> @@ -102,6 +102,30 @@
>  		status = "disabled";
>  	};
>  
> +	vbatt_reg: voltage-regulator-9 {

Since this is the basic DTSI for multiple boards, the numbering here
should be consistent. You will have to rename the ones in Galaxy S3 and
N710 DTSI.

> +		compatible = "regulator-fixed";
> +		regulator-name = "VBATT";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +	};
> +
> +	mic_bias_reg: voltage-regulator-10 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "MICBIAS_LDO_2.8V";
> +		regulator-min-microvolt = <2800000>;
> +		regulator-max-microvolt = <2800000>;
> +		gpio = <&gpf1 7 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	submic_bias_reg: voltage-regulator-11 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "SUB_MICBIAS_LDO_2.8V";
> +		regulator-min-microvolt = <2800000>;
> +		regulator-max-microvolt = <2800000>;
> +	};
> +
>  	gpio-keys {
>  		compatible = "gpio-keys";
>  		pinctrl-names = "default";
> @@ -266,16 +290,18 @@
>  		clock-names = "ext_clock";
>  	};
>  
> -	sound {
> -		compatible = "samsung,trats2-audio";
> -		samsung,i2s-controller = <&i2s0>;
> -		samsung,model = "Trats2";
> -		samsung,audio-codec = <&wm1811>;
> -		samsung,audio-routing =
> -			"SPK", "SPKOUTLN",
> -			"SPK", "SPKOUTLP",
> -			"SPK", "SPKOUTRN",
> -			"SPK", "SPKOUTRP";
> +	sound: sound {
> +		compatible = "samsung,midas-audio";
> +		model = "Midas";
> +		mic-bias-supply = <&mic_bias_reg>;
> +		submic-bias-supply = <&submic_bias_reg>;
> +
> +		cpu {
> +			sound-dai =  <&i2s0 0>;

Double space after '='.

Best regards,
Krzysztof
