Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40336786870
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Aug 2023 09:37:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BA7C84C;
	Thu, 24 Aug 2023 09:36:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BA7C84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692862624;
	bh=peqHtYVGLtBkBvLoHA5nK7mqSXzyIRTxXZ+BBcUZLQk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nLOqoBSW5/wrzfoWM6xXnHV0pr0Eqa0baVe8UkZ2f7t95nXzx+lw3c9WPdCDyEtG+
	 y02EPXUIxAbI33ZSzcRDJrrDiKJaL9NUsCjzDznQDHSZ5hYGUs6nXTgdab4bW1Vks6
	 0GxLaLtXy7I645U5E0iRBczALO9yPt44TosihJz8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5EF99F80609; Thu, 24 Aug 2023 09:32:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A54FF80602;
	Thu, 24 Aug 2023 09:32:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9299FF80158; Wed, 23 Aug 2023 04:42:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=NICE_REPLY_A,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C83F7F80022
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 04:42:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C83F7F80022
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id BB07824E2EE;
	Wed, 23 Aug 2023 10:42:01 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 23 Aug
 2023 10:42:01 +0800
Received: from [192.168.125.113] (113.72.145.205) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 23 Aug
 2023 10:42:00 +0800
Message-ID: <65292b7f-0e9d-65c1-4ca5-b23d301e02cd@starfivetech.com>
Date: Wed, 23 Aug 2023 10:42:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 5/5] riscv: dts: starfive: Add the nodes and pins of
 I2Srx/I2Stx0/I2Stx1
To: Xingyu Wu <xingyu.wu@starfivetech.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Claudiu Beznea
	<Claudiu.Beznea@microchip.com>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, Maxim Kochetkov <fido_max@inbox.ru>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
CC: Jose Abreu <joabreu@synopsys.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<linux-riscv@lists.infradead.org>
References: <20230821144151.207339-1-xingyu.wu@starfivetech.com>
 <20230821144151.207339-6-xingyu.wu@starfivetech.com>
Content-Language: en-US
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <20230821144151.207339-6-xingyu.wu@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [113.72.145.205]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-MailFrom: walker.chen@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: LGSVPYDJ7N7PPMHGJLQECCMHV4WMH4QG
X-Message-ID-Hash: LGSVPYDJ7N7PPMHGJLQECCMHV4WMH4QG
X-Mailman-Approved-At: Thu, 24 Aug 2023 07:32:02 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LGSVPYDJ7N7PPMHGJLQECCMHV4WMH4QG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 2023/8/21 22:41, Xingyu Wu wrote:
> Add I2Srx/I2Stx0/I2Stx1 nodes and pins configuration for the
> StarFive JH7110 SoC.
> 
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  .../jh7110-starfive-visionfive-2.dtsi         | 58 +++++++++++++++++
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 65 +++++++++++++++++++
>  2 files changed, 123 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index d79f94432b27..7179f1a31cf2 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -203,6 +203,24 @@ &i2c6 {
>  	status = "okay";
>  };
>  
> +&i2srx {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2srx_pins>;
> +	status = "okay";
> +};
> +
> +&i2stx0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mclk_ext_pins>;
> +	status = "okay";
> +};
> +
> +&i2stx1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2stx1_pins>;
> +	status = "okay";
> +};
> +
>  &mmc0 {
>  	max-frequency = <100000000>;
>  	bus-width = <8>;
> @@ -337,6 +355,46 @@ GPOEN_SYS_I2C6_DATA,
>  		};
>  	};
>  
> +	i2srx_pins: i2srx-0 {
> +		clk-sd-pins {
> +			pinmux = <GPIOMUX(38, GPOUT_LOW,
> +					      GPOEN_DISABLE,
> +					      GPI_SYS_I2SRX_BCLK)>,
> +				 <GPIOMUX(63, GPOUT_LOW,
> +					      GPOEN_DISABLE,
> +					      GPI_SYS_I2SRX_LRCK)>,
> +				 <GPIOMUX(38, GPOUT_LOW,
> +					      GPOEN_DISABLE,
> +					      GPI_SYS_I2STX1_BCLK)>,
> +				 <GPIOMUX(63, GPOUT_LOW,
> +					      GPOEN_DISABLE,
> +					      GPI_SYS_I2STX1_LRCK)>,
> +				 <GPIOMUX(61, GPOUT_LOW,
> +					      GPOEN_DISABLE,
> +					      GPI_SYS_I2SRX_SDIN0)>;
> +			input-enable;
> +		};
> +	};
> +
> +	i2stx1_pins: i2stx1-0 {
> +		sd-pins {
> +			pinmux = <GPIOMUX(44, GPOUT_SYS_I2STX1_SDO0,
> +					      GPOEN_ENABLE,
> +					      GPI_NONE)>;
> +			bias-disable;
> +			input-disable;
> +		};
> +	};
> +
> +	mclk_ext_pins: mclk-ext-0 {
> +		mclk-ext-pins {
> +			pinmux = <GPIOMUX(4, GPOUT_LOW,
> +					     GPOEN_DISABLE,
> +					     GPI_SYS_MCLK_EXT)>;
> +			input-enable;
> +		};
> +	};
> +
>  	mmc0_pins: mmc0-0 {
>  		 rst-pins {
>  			pinmux = <GPIOMUX(62, GPOUT_SYS_SDIO0_RST,
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index e85464c328d0..621b68c02ea8 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -512,6 +512,30 @@ tdm: tdm@10090000 {
>  			status = "disabled";
>  		};
>  
> +		i2srx: i2s@100e0000 {
> +			compatible = "starfive,jh7110-i2srx";
> +			reg = <0x0 0x100e0000 0x0 0x1000>;
> +			clocks = <&syscrg JH7110_SYSCLK_I2SRX_BCLK_MST>,
> +				 <&syscrg JH7110_SYSCLK_I2SRX_APB>,
> +				 <&syscrg JH7110_SYSCLK_MCLK>,
> +				 <&syscrg JH7110_SYSCLK_MCLK_INNER>,
> +				 <&mclk_ext>,
> +				 <&syscrg JH7110_SYSCLK_I2SRX_BCLK>,
> +				 <&syscrg JH7110_SYSCLK_I2SRX_LRCK>,
> +				 <&i2srx_bclk_ext>,
> +				 <&i2srx_lrck_ext>;
> +			clock-names = "i2sclk", "apb", "mclk",
> +				      "mclk_inner", "mclk_ext", "bclk",
> +				      "lrck", "bclk_ext", "lrck_ext";
> +			resets = <&syscrg JH7110_SYSRST_I2SRX_APB>,
> +				 <&syscrg JH7110_SYSRST_I2SRX_BCLK>;
> +			dmas = <0>, <&dma 24>;
> +			dma-names = "tx", "rx";
> +			starfive,syscon = <&sys_syscon 0x18 0x2>;
> +			#sound-dai-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		usb0: usb@10100000 {
>  			compatible = "starfive,jh7110-usb";
>  			ranges = <0x0 0x0 0x10100000 0x100000>;
> @@ -736,6 +760,47 @@ spi6: spi@120a0000 {
>  			status = "disabled";
>  		};
>  
> +		i2stx0: i2s@120b0000 {
> +			compatible = "starfive,jh7110-i2stx0";
> +			reg = <0x0 0x120b0000 0x0 0x1000>;
> +			clocks = <&syscrg JH7110_SYSCLK_I2STX0_BCLK_MST>,
> +				 <&syscrg JH7110_SYSCLK_I2STX0_APB>,
> +				 <&syscrg JH7110_SYSCLK_MCLK>,
> +				 <&syscrg JH7110_SYSCLK_MCLK_INNER>,
> +				 <&mclk_ext>;
> +			clock-names = "i2sclk", "apb", "mclk",
> +				      "mclk_inner","mclk_ext";
> +			resets = <&syscrg JH7110_SYSRST_I2STX0_APB>,
> +				 <&syscrg JH7110_SYSRST_I2STX0_BCLK>;
> +			dmas = <&dma 47>;
> +			dma-names = "tx";
> +			#sound-dai-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2stx1: i2s@120c0000 {
> +			compatible = "starfive,jh7110-i2stx1";
> +			reg = <0x0 0x120c0000 0x0 0x1000>;
> +			clocks = <&syscrg JH7110_SYSCLK_I2STX1_BCLK_MST>,
> +				 <&syscrg JH7110_SYSCLK_I2STX1_APB>,
> +				 <&syscrg JH7110_SYSCLK_MCLK>,
> +				 <&syscrg JH7110_SYSCLK_MCLK_INNER>,
> +				 <&mclk_ext>,
> +				 <&syscrg JH7110_SYSCLK_I2STX1_BCLK>,
> +				 <&syscrg JH7110_SYSCLK_I2STX1_LRCK>,
> +				 <&i2stx_bclk_ext>,
> +				 <&i2stx_lrck_ext>;
> +			clock-names = "i2sclk", "apb", "mclk",
> +				      "mclk_inner", "mclk_ext", "bclk",
> +				      "lrck", "bclk_ext", "lrck_ext";
> +			resets = <&syscrg JH7110_SYSRST_I2STX1_APB>,
> +				 <&syscrg JH7110_SYSRST_I2STX1_BCLK>;
> +			dmas = <&dma 48>;
> +			dma-names = "tx";
> +			#sound-dai-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		sfctemp: temperature-sensor@120e0000 {
>  			compatible = "starfive,jh7110-temp";
>  			reg = <0x0 0x120e0000 0x0 0x10000>;

Reviewed-by: Walker Chen <walker.chen@starfivetech.com>
Thanks!
