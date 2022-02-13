Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 515FB4B3950
	for <lists+alsa-devel@lfdr.de>; Sun, 13 Feb 2022 05:20:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C054F1705;
	Sun, 13 Feb 2022 05:19:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C054F1705
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644726015;
	bh=p/ufFHAr6UeinZdHwhtVze3Hpr+rcfIupxTX/GoBTEs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JULZuoGd+V9hyW+5+GXAJODsKUmMC2+jka0xYpSX13uLctBAHdoiT7PmI21kA1sNH
	 lJ7V1W/jRQTG+5v6yQbpORYVpUcy0bvPgA0UaljkFWjOi1MYabtvYNbGO0c3o+KcT2
	 BZ7elQcZOe0HKYotWoOXUu6suCXJ8/OiunyFeu1E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 265CAF80269;
	Sun, 13 Feb 2022 05:19:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C000F8025D; Sun, 13 Feb 2022 05:19:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1EDB5F8012F
 for <alsa-devel@alsa-project.org>; Sun, 13 Feb 2022 05:18:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EDB5F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="M7IiHT69"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B1C2BB80A09;
 Sun, 13 Feb 2022 04:18:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF1CAC004E1;
 Sun, 13 Feb 2022 04:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644725935;
 bh=p/ufFHAr6UeinZdHwhtVze3Hpr+rcfIupxTX/GoBTEs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M7IiHT69weTTTjTQzLEW1+5HoFuEUmrLZr7MB3NMNKdWc/0ZUBwFpBQQn/eHyNkx7
 nb44W6j+MgrZ42DxkbrYQI1114YnkLzGYU7zJMghexGRFhvvA6zM0ozFDoU9oXNk84
 z7aMKZuTfkQFPQvJILH1LNlOc6MkVXh5M2chlsCTHV018TH6Wzsn5/G0zBJA4JgtLp
 JPYFDDHIX7v0dQYEjVQR50TO62/0Dx2Ciflfmjsn0APUL0iGEVBKYV4y/HeaUP4bD0
 9r9Gzrr9D2ACEEuJiw6yDqXlfiJUArLmeymwt/PP5k+Uq9+qlqeB/uxLj/J+XV9g0m
 YPCsQyv/ZSsMg==
Date: Sun, 13 Feb 2022 12:18:49 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: imx8mn-bsh-smm-s2pro: Add
 tlv320aic31xx audio card node
Message-ID: <20220213041823.GL4909@dragon>
References: <20220210134049.32576-1-ariel.dalessandro@collabora.com>
 <20220210134049.32576-2-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220210134049.32576-2-ariel.dalessandro@collabora.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Thu, Feb 10, 2022 at 10:40:49AM -0300, Ariel D'Alessandro wrote:
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
> index c6a8ed6745c1..3621354b4a92 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts
> @@ -7,6 +7,7 @@
>  /dts-v1/;
>  
>  #include "imx8mn-bsh-smm-s2-common.dtsi"
> +#include <dt-bindings/sound/tlv320aic31xx.h>
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
> +	fsl,asrc-rate  = <48000>;

Double spaces before '='.

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
> +	codec: tlv320dac3101@18 {

tlv320dac3101: audio-codec@18

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
> +	pinctrl_dac_rst: dac_rst {

Name the node more in the same style as other pinctrl nodes.

Shawn

> +		fsl,pins = <
> +			MX8MN_IOMUXC_GPIO1_IO06_GPIO1_IO6		0x19 /* DAC_RST */
> +		>;
> +	};
> +
> +	pinctrl_espi2: espi2grp {
> +		fsl,pins = <
> +			MX8MN_IOMUXC_ECSPI2_SCLK_ECSPI2_SCLK            0x082
> +			MX8MN_IOMUXC_ECSPI2_MOSI_ECSPI2_MOSI            0x082
> +			MX8MN_IOMUXC_ECSPI2_MISO_ECSPI2_MISO            0x082
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
