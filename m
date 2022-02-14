Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D81054B4F24
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Feb 2022 12:46:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CEC9173A;
	Mon, 14 Feb 2022 12:45:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CEC9173A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644839200;
	bh=G1V33pJNQ00HMRMQYtSYymxMctLJqbcyW6mYO6jW5gU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sei9oX2GHJ7fb6SYD5t/XxN7NXhH3kRCvXhTc9KVzWT8FuMXPyLJ3/bMGZAVWmDQb
	 LFvHtUN+RL1o8axAxoXCcLPS0HzISc4VhQfWt+AJnxeVIjpjNUsVlrN24AzM7xnZVY
	 STCFjJzKD75ldaEmS0zAaYA7duMBDKnHr2mayqUY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7D23F800C0;
	Mon, 14 Feb 2022 12:45:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F4CBF80310; Mon, 14 Feb 2022 12:45:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D413F800C0
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 12:45:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D413F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="hVWzgIGj"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: adalessandro) with ESMTPSA id E0FFE1F43899
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644839123;
 bh=G1V33pJNQ00HMRMQYtSYymxMctLJqbcyW6mYO6jW5gU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hVWzgIGjpfSN+YrqXM2QuDqzogthlRnw0LFqU4Sm4Yf4L59rjF6cwKpZSZYCcSUSJ
 aZxbaILEYFNfUPVUXzYvhlvn8+gDLuquyhDdQ0z4xNh8xEG/0q5+HDYKrwRR1WMsZo
 qne8paHgh/oTqkgeQYtfj4YkuYl6gVUPIty5lDg0tweFhstpU6SScElApNXsG6ZUTX
 8YuRYsHCyB0eJ+uToMEtlzQHVBUDswYxyIJ/+F25fuAXZRO5q7b2FIS7zY2KwxU2t+
 pFQzD+ekeZvUREfAi3TDqX8wyMVDnM75x44kF1avwg71ThC0Xhg4cJywMvdCTPe8Mh
 gQOjec/ycAMOQ==
Message-ID: <b7b66cf6-a121-d4e0-66c2-604c9fe784f4@collabora.com>
Date: Mon, 14 Feb 2022 08:45:13 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v2 2/2] arm64: dts: imx8mn-bsh-smm-s2pro: Add
 tlv320aic31xx audio card node
Content-Language: en-US
To: Shawn Guo <shawnguo@kernel.org>
References: <20220210134049.32576-1-ariel.dalessandro@collabora.com>
 <20220210134049.32576-2-ariel.dalessandro@collabora.com>
 <20220213041823.GL4909@dragon>
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <20220213041823.GL4909@dragon>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi Shawn,

Thanks for the review, will address all the below changes in v3.

Regards,
Ariel

On 2/13/22 01:18, Shawn Guo wrote:
> On Thu, Feb 10, 2022 at 10:40:49AM -0300, Ariel D'Alessandro wrote:
>> BSH SystemMaster (SMM) S2 PRO board comes with an audio card based on
>> tlv320aic31xx family codec.
>>
>> The audio card exposes two playback devices, one of them using the EASRC
>> (Enhanced Asynchronous Sample Rate Converter) module. Note that this
>> would require SDMA and EASRC firmware in order to work.
>>
>> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
>> ---
>>  .../dts/freescale/imx8mn-bsh-smm-s2pro.dts    | 94 +++++++++++++++++++
>>  1 file changed, 94 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts
>> index c6a8ed6745c1..3621354b4a92 100644
>> --- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts
>> +++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts
>> @@ -7,6 +7,7 @@
>>  /dts-v1/;
>>  
>>  #include "imx8mn-bsh-smm-s2-common.dtsi"
>> +#include <dt-bindings/sound/tlv320aic31xx.h>
>>  
>>  / {
>>  	model = "BSH SMM S2 PRO";
>> @@ -16,6 +17,69 @@ memory@40000000 {
>>  		device_type = "memory";
>>  		reg = <0x0 0x40000000 0x0 0x20000000>;
>>  	};
>> +
>> +	sound-tlv320aic31xx {
>> +		compatible = "fsl,imx-audio-tlv320aic31xx";
>> +		model = "tlv320aic31xx-hifi";
>> +		audio-cpu = <&sai3>;
>> +		audio-codec = <&codec>;
>> +		audio-asrc = <&easrc>;
>> +		audio-routing =
>> +			"Ext Spk", "SPL",
>> +			"Ext Spk", "SPR";
>> +		mclk-id = <PLL_CLKIN_BCLK>;
>> +	};
>> +
>> +	vdd_input: vdd_input {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vdd_input";
>> +		regulator-min-microvolt = <5000000>;
>> +		regulator-max-microvolt = <5000000>;
>> +	};
>> +};
>> +
>> +&easrc {
>> +	fsl,asrc-rate  = <48000>;
> 
> Double spaces before '='.
> 
>> +	fsl,asrc-format = <10>;
>> +	status = "okay";
>> +};
>> +
>> +&i2c2 {
>> +	clock-frequency = <400000>;
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pinctrl_i2c2>;
>> +	status = "okay";
>> +
>> +	codec: tlv320dac3101@18 {
> 
> tlv320dac3101: audio-codec@18
> 
>> +		#sound-dai-cells = <0>;
>> +		compatible = "ti,tlv320dac3101";
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&pinctrl_dac_rst>;
>> +		reg = <0x18>;
>> +
>> +		ai31xx-micbias-vg = <MICBIAS_AVDDV>;
>> +
>> +		HPVDD-supply = <&buck4_reg>;
>> +		SPRVDD-supply = <&vdd_input>;
>> +		SPLVDD-supply = <&vdd_input>;
>> +		AVDD-supply = <&buck4_reg>;
>> +		IOVDD-supply = <&buck4_reg>;
>> +		DVDD-supply = <&buck5_reg>;
>> +		reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
>> +
>> +		clocks = <&clk IMX8MN_CLK_SAI3_ROOT>;
>> +		clock-names = "mclk";
>> +	};
>> +};
>> +
>> +&sai3 {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pinctrl_sai3>;
>> +	assigned-clocks = <&clk IMX8MN_CLK_SAI3>;
>> +	assigned-clock-parents = <&clk IMX8MN_AUDIO_PLL1_OUT>;
>> +	assigned-clock-rates = <24576000>;
>> +	fsl,sai-mclk-direction-output;
>> +	status = "okay";
>>  };
>>  
>>  /* eMMC */
>> @@ -30,6 +94,36 @@ &usdhc1 {
>>  };
>>  
>>  &iomuxc {
>> +	pinctrl_dac_rst: dac_rst {
> 
> Name the node more in the same style as other pinctrl nodes.
> 
> Shawn
> 
>> +		fsl,pins = <
>> +			MX8MN_IOMUXC_GPIO1_IO06_GPIO1_IO6		0x19 /* DAC_RST */
>> +		>;
>> +	};
>> +
>> +	pinctrl_espi2: espi2grp {
>> +		fsl,pins = <
>> +			MX8MN_IOMUXC_ECSPI2_SCLK_ECSPI2_SCLK            0x082
>> +			MX8MN_IOMUXC_ECSPI2_MOSI_ECSPI2_MOSI            0x082
>> +			MX8MN_IOMUXC_ECSPI2_MISO_ECSPI2_MISO            0x082
>> +			MX8MN_IOMUXC_ECSPI2_SS0_ECSPI2_SS0		0x040
>> +		>;
>> +	};
>> +
>> +	pinctrl_i2c2: i2c2grp {
>> +		fsl,pins = <
>> +			MX8MN_IOMUXC_I2C2_SCL_I2C2_SCL			0x400000c3
>> +			MX8MN_IOMUXC_I2C2_SDA_I2C2_SDA			0x400000c3
>> +		>;
>> +	};
>> +
>> +	pinctrl_sai3: sai3grp {
>> +		fsl,pins = <
>> +			MX8MN_IOMUXC_SAI3_TXFS_SAI3_TX_SYNC		0xd6
>> +			MX8MN_IOMUXC_SAI3_TXC_SAI3_TX_BCLK		0xd6
>> +			MX8MN_IOMUXC_SAI3_TXD_SAI3_TX_DATA0		0xd6
>> +		>;
>> +	};
>> +
>>  	pinctrl_usdhc1: usdhc1grp {
>>  		fsl,pins = <
>>  			MX8MN_IOMUXC_SD1_CLK_USDHC1_CLK			0x40000090
>> -- 
>> 2.34.1
>>
