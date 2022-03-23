Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AECB4E53D2
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Mar 2022 15:00:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D6931685;
	Wed, 23 Mar 2022 15:00:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D6931685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648044052;
	bh=CVCRQInqJDjYFXXhZlVGu/WWzJnSV1ckB/NiCxYHM4s=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lCGJkOjOzIXrUREAeyiYOg9ENLvFaXI1OQgm2EI7Tepcobss2vNOkmjCQ13QB/VF6
	 Yft3XR8RH4APz+caF+29sJnv/FDqVhKZ1sbMbVTZshAh+K/ozfV+Zw+S82GTSWc+8g
	 31IzzuksBivDEBUr9Sm7Z87pAEGEzo4A4X1tRwZs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02D29F80310;
	Wed, 23 Mar 2022 14:59:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2E1FF802DB; Wed, 23 Mar 2022 14:59:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03B7FF800F5
 for <alsa-devel@alsa-project.org>; Wed, 23 Mar 2022 14:59:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03B7FF800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="gkBRFnj/"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: adalessandro) with ESMTPSA id 920E81F44C79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648043978;
 bh=CVCRQInqJDjYFXXhZlVGu/WWzJnSV1ckB/NiCxYHM4s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gkBRFnj/EbCqALEijYgPG41DsvgsBlPPSNdvWIjYL3RkTEBbI9ow3Q9tRxAb+Pz4U
 WTZPhFq6pLoEdPtoUeBOXKu5IDXj5BDUlPVp7nlC6y7eSPtaTKRHy4KluFmnc4itme
 +iMEc49GGtR8yTRk85OrDKl6NDQZIP0uawS+mDGEAPwSdZGcQfImfG74rSZiT8oT0e
 msp6xjOPcXM2MfPOTPxGcug4vvmKe9D5GuW2uC85vY62n42+5r2GfkOk/6+Nb09kG8
 7qxlrzkbR2/dElbxizv5edy4W/fJIKf9q/R4MkQVfuyr5toBnUMW/kx6s6wupXdL+1
 XKb2MYB+0pcFA==
Message-ID: <d79b0b6a-97fc-52d3-c45b-ac7312e131b3@collabora.com>
Date: Wed, 23 Mar 2022 10:59:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v4] arm64: dts: imx8mn-bsh-smm-s2pro: Add tlv320aic31xx
 audio card node
Content-Language: en-US
To: shawnguo@kernel.org
References: <20220323135601.42435-1-ariel.dalessandro@collabora.com>
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <20220323135601.42435-1-ariel.dalessandro@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 krzysztof.kozlowski@canonical.com, s.hauer@pengutronix.de, lgirdwood@gmail.com,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org, broonie@kernel.org,
 linux-imx@nxp.com, kernel@pengutronix.de, michael@amarulasolutions.com,
 festevam@gmail.com, linux-arm-kernel@lists.infradead.org
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

Shawn,

Can we get this integrated into the linux-next tree so it's available
for the merge window?

Note that dt-bindings/sound/tlv320aic31xx.h is already merged into
linux-next.

Regards,
Ariel

On 3/23/22 10:56, Ariel D'Alessandro wrote:
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
>  .../dts/freescale/imx8mn-bsh-smm-s2pro.dts    | 90 +++++++++++++++++++
>  1 file changed, 90 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts
> index c6a8ed6745c1..fbbb3367037b 100644
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
> @@ -16,6 +17,65 @@ memory@40000000 {
>  		device_type = "memory";
>  		reg = <0x0 0x40000000 0x0 0x20000000>;
>  	};
> +
> +	sound-tlv320aic31xx {
> +		compatible = "fsl,imx-audio-tlv320aic31xx";
> +		model = "tlv320aic31xx-hifi";
> +		audio-cpu = <&sai3>;
> +		audio-codec = <&tlv320dac3101>;
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
> +		compatible = "ti,tlv320dac3101";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_dac_rst>;
> +		reg = <0x18>;
> +		#sound-dai-cells = <0>;
> +		HPVDD-supply = <&buck4_reg>;
> +		SPRVDD-supply = <&vdd_input>;
> +		SPLVDD-supply = <&vdd_input>;
> +		AVDD-supply = <&buck4_reg>;
> +		IOVDD-supply = <&buck4_reg>;
> +		DVDD-supply = <&buck5_reg>;
> +		reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
> +		ai31xx-micbias-vg = <MICBIAS_AVDDV>;
> +		clocks = <&clk IMX8MN_CLK_SAI3_ROOT>;
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
> @@ -30,6 +90,36 @@ &usdhc1 {
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
