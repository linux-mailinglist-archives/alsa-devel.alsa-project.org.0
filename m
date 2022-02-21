Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4724BD46C
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Feb 2022 05:01:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8A771662;
	Mon, 21 Feb 2022 05:00:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8A771662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645416092;
	bh=EkGuGgzb5N9FmkTHBRN2CjL/sAm46fYFQB1dTF/2VrY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oa2ZmIbxvAepOOL41QZByngGv4v6kQhTLzktEhvGCBFTtIEIcm0+X+BIgyXY5sjox
	 HoNb4vsx8IbjhoYXm/UU1xUq30i7MQZKl6lFIHFHsVZnQroT8mj1N1fSltFm28KdKj
	 rOhIui3omQh5ffPscetJcRJZAO/2EjhVfzPPQpWU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39133F80149;
	Mon, 21 Feb 2022 05:00:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2DDAF8013D; Mon, 21 Feb 2022 05:00:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 329E4F800D1
 for <alsa-devel@alsa-project.org>; Mon, 21 Feb 2022 05:00:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 329E4F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fF6eKmzU"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DDA8A61180;
 Mon, 21 Feb 2022 04:00:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4B6EC340E9;
 Mon, 21 Feb 2022 04:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645416009;
 bh=EkGuGgzb5N9FmkTHBRN2CjL/sAm46fYFQB1dTF/2VrY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fF6eKmzUMUxMjiHrZLLWNjEU5kU7w4uFBKc36H0/lCPmE6dj982vcoC/Wq4R33QTm
 B8oVFSRbSS4uUa0DDkVGeJmx9xLCX5qZlnIcfWJ7pBx/PgLBQFjTMmHu1pacA8BHTh
 6EwZJ9ke1lDM4Q3rOx6infC88/VJr+9vjy+eMgrhtDaEoGJ/UWHL+i5wPOZFinksth
 zMYHPmwyNy1AcSm+rvcKR3sraiWUjIY9X3UdMb1ZdRMStNGl1dwimnjTfRbfJ8wbb8
 8NQKLI2hEI+JFW0OhG3rd3J23zW+m+9GVrbJ9Jscf8KuWx+I/G7I1cN/jYE8OywmeM
 oF+/cwDOEHO7w==
Date: Mon, 21 Feb 2022 12:00:03 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Subject: Re: [PATCH v3] arm64: dts: imx8mn-bsh-smm-s2pro: Add tlv320aic31xx
 audio card node
Message-ID: <20220221040003.GI2249@dragon>
References: <20220214120307.15665-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220214120307.15665-1-ariel.dalessandro@collabora.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 krzysztof.kozlowski@canonical.com, s.hauer@pengutronix.de,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 michael@amarulasolutions.com, festevam@gmail.com,
 linux-arm-kernel@lists.infradead.org
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

On Mon, Feb 14, 2022 at 09:03:07AM -0300, Ariel D'Alessandro wrote:
> BSH SystemMaster (SMM) S2 PRO board comes with an audio card based on
> tlv320aic31xx family codec.
> 
> The audio card exposes two playback devices, one of them using the EASRC
> (Enhanced Asynchronous Sample Rate Converter) module. Note that this
> would require SDMA and EASRC firmware in order to work.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> ---
>  .../dts/freescale/imx8mn-bsh-smm-s2pro.dts    | 94 +++++++++++++++++++
>  1 file changed, 94 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts
> index c6a8ed6745c1..44e2635d3096 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts
> @@ -7,6 +7,7 @@
>  /dts-v1/;
>  
>  #include "imx8mn-bsh-smm-s2-common.dtsi"
> +#include <dt-bindings/sound/tlv320aic31xx.h>

Ping me when this header lands on Linus's tree.

Shawn

>  
>  / {
>  	model = "BSH SMM S2 PRO";
> @@ -16,6 +17,69 @@ memory@40000000 {
>  		device_type = "memory";
>  		reg = <0x0 0x40000000 0x0 0x20000000>;
>  	};
> +
> +	sound-tlv320aic31xx {
> +		compatible = "fsl,imx-audio-tlv320aic31xx";
> +		model = "tlv320aic31xx-hifi";
> +		audio-cpu = <&sai3>;
> +		audio-codec = <&codec>;
> +		audio-asrc = <&easrc>;
> +		audio-routing =
> +			"Ext Spk", "SPL",
> +			"Ext Spk", "SPR";
> +		mclk-id = <PLL_CLKIN_BCLK>;
> +	};
> +
> +	vdd_input: vdd_input {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vdd_input";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +	};
> +};
> +
> +&easrc {
> +	fsl,asrc-rate = <48000>;
> +	fsl,asrc-format = <10>;
> +	status = "okay";
> +};
> +
> +&i2c2 {
> +	clock-frequency = <400000>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_i2c2>;
> +	status = "okay";
> +
> +	tlv320dac3101: audio-codec@18 {
> +		#sound-dai-cells = <0>;
> +		compatible = "ti,tlv320dac3101";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_dac_rst>;
> +		reg = <0x18>;
> +
> +		ai31xx-micbias-vg = <MICBIAS_AVDDV>;
> +
> +		HPVDD-supply = <&buck4_reg>;
> +		SPRVDD-supply = <&vdd_input>;
> +		SPLVDD-supply = <&vdd_input>;
> +		AVDD-supply = <&buck4_reg>;
> +		IOVDD-supply = <&buck4_reg>;
> +		DVDD-supply = <&buck5_reg>;
> +		reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
> +
> +		clocks = <&clk IMX8MN_CLK_SAI3_ROOT>;
> +		clock-names = "mclk";
> +	};
> +};
> +
> +&sai3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_sai3>;
> +	assigned-clocks = <&clk IMX8MN_CLK_SAI3>;
> +	assigned-clock-parents = <&clk IMX8MN_AUDIO_PLL1_OUT>;
> +	assigned-clock-rates = <24576000>;
> +	fsl,sai-mclk-direction-output;
> +	status = "okay";
>  };
>  
>  /* eMMC */
> @@ -30,6 +94,36 @@ &usdhc1 {
>  };
>  
>  &iomuxc {
> +	pinctrl_dac_rst: dacrstgrp {
> +		fsl,pins = <
> +			MX8MN_IOMUXC_GPIO1_IO06_GPIO1_IO6		0x19 /* DAC_RST */
> +		>;
> +	};
> +
> +	pinctrl_espi2: espi2grp {
> +		fsl,pins = <
> +			MX8MN_IOMUXC_ECSPI2_SCLK_ECSPI2_SCLK		0x082
> +			MX8MN_IOMUXC_ECSPI2_MOSI_ECSPI2_MOSI		0x082
> +			MX8MN_IOMUXC_ECSPI2_MISO_ECSPI2_MISO		0x082
> +			MX8MN_IOMUXC_ECSPI2_SS0_ECSPI2_SS0		0x040
> +		>;
> +	};
> +
> +	pinctrl_i2c2: i2c2grp {
> +		fsl,pins = <
> +			MX8MN_IOMUXC_I2C2_SCL_I2C2_SCL			0x400000c3
> +			MX8MN_IOMUXC_I2C2_SDA_I2C2_SDA			0x400000c3
> +		>;
> +	};
> +
> +	pinctrl_sai3: sai3grp {
> +		fsl,pins = <
> +			MX8MN_IOMUXC_SAI3_TXFS_SAI3_TX_SYNC		0xd6
> +			MX8MN_IOMUXC_SAI3_TXC_SAI3_TX_BCLK		0xd6
> +			MX8MN_IOMUXC_SAI3_TXD_SAI3_TX_DATA0		0xd6
> +		>;
> +	};
> +
>  	pinctrl_usdhc1: usdhc1grp {
>  		fsl,pins = <
>  			MX8MN_IOMUXC_SD1_CLK_USDHC1_CLK			0x40000090
> -- 
> 2.34.1
> 
