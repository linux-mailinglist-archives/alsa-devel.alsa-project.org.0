Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C197C6D4C15
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Apr 2023 17:39:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBE6C826;
	Mon,  3 Apr 2023 17:38:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBE6C826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680536341;
	bh=Zu7XJXaGl+P3gaSTxJyRKbQa7fWRaCkjIAK8uuYyaPw=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dW9vLjfHLWULXtu5J4yccCrUIYgDVrq0wCITOgIV08yz2i/x0x8j04yCB6wcXpwrc
	 pfdKToU3Qu5oSPzOA7Ra0nCHj1MPLzwxJyxj6X58uWyPNohPHxvLlKBDdg6GOT3mk/
	 jrptg+I0GvZQEftKE2xa7ZSGt7IW46w9hsU2Sh8o=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A583BF80249;
	Mon,  3 Apr 2023 17:36:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 880DAF8024C; Mon,  3 Apr 2023 15:00:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8CE5DF801C0
	for <alsa-devel@alsa-project.org>; Mon,  3 Apr 2023 15:00:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CE5DF801C0
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 2625724E094;
	Mon,  3 Apr 2023 20:58:56 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 3 Apr
 2023 20:58:56 +0800
Received: from [192.168.125.145] (183.27.97.179) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 3 Apr
 2023 20:58:55 +0800
Message-ID: <693c38f8-6aec-dd50-94a0-65300b6ed1b2@starfivetech.com>
Date: Mon, 3 Apr 2023 20:58:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v1 3/3] riscv: dts: starfive: add tdm node and sound card
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
References: <20230329153320.31390-1-walker.chen@starfivetech.com>
 <20230329153320.31390-4-walker.chen@starfivetech.com>
 <d455a90a-7e63-2254-75cb-70cb26ae7483@linaro.org>
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <d455a90a-7e63-2254-75cb-70cb26ae7483@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [183.27.97.179]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-MailFrom: walker.chen@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: YRP4ZJXKZGSUB55GPPPTBYV7IPZ6776Q
X-Message-ID-Hash: YRP4ZJXKZGSUB55GPPPTBYV7IPZ6776Q
X-Mailman-Approved-At: Mon, 03 Apr 2023 15:36:51 +0000
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YRP4ZJXKZGSUB55GPPPTBYV7IPZ6776Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 2023/3/30 15:43, Krzysztof Kozlowski wrote:
> On 29/03/2023 17:33, Walker Chen wrote:
>> Add the tdm controller node and sound card for the StarFive JH7110 SoC.
>> 
>> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
>> ---
>>  .../jh7110-starfive-visionfive-2.dtsi         | 87 +++++++++++++++++++
>>  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 34 ++++++++
>>  2 files changed, 121 insertions(+)
>> 
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>> index 1155b97b593d..35137c2edf5d 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>> @@ -62,6 +62,10 @@
>>  	clock-frequency = <297000000>;
>>  };
>>  
>> +&wm8960_mclk {
>> +	clock-frequency = <24576000>;
>> +};
>> +
>>  &i2srx_bclk_ext {
>>  	clock-frequency = <12288000>;
>>  };
>> @@ -102,6 +106,14 @@
>>  	pinctrl-names = "default";
>>  	pinctrl-0 = <&i2c0_pins>;
>>  	status = "okay";
>> +
>> +	wm8960: codec@1a {
>> +		compatible = "wlf,wm8960";
>> +		reg = <0x1a>;
>> +		#sound-dai-cells = <0>;
>> +
>> +		wlf,shared-lrclk;
>> +	};
>>  };
>>  
>>  &i2c2 {
>> @@ -214,6 +226,40 @@
>>  			slew-rate = <0>;
>>  		};
>>  	};
>> +
>> +	tdm0_pins: tdm0-pins {
>> +		tdm0-pins-tx {
>> +			pinmux = <GPIOMUX(44, GPOUT_SYS_TDM_TXD,
>> +					      GPOEN_ENABLE,
>> +					      GPI_NONE)>;
>> +			bias-pull-up;
>> +			drive-strength = <2>;
>> +			input-disable;
>> +			input-schmitt-disable;
>> +			slew-rate = <0>;
>> +		};
>> +
>> +		tdm0-pins-rx {
>> +			pinmux = <GPIOMUX(61, GPOUT_HIGH,
>> +					      GPOEN_DISABLE,
>> +					      GPI_SYS_TDM_RXD)>;
>> +			input-enable;
>> +		};
>> +
>> +		tdm0-pins-sync {
>> +			pinmux = <GPIOMUX(63, GPOUT_HIGH,
>> +					      GPOEN_DISABLE,
>> +					      GPI_SYS_TDM_SYNC)>;
>> +			input-enable;
>> +		};
>> +
>> +		tdm0-pins-pcmclk {
>> +			pinmux = <GPIOMUX(38, GPOUT_HIGH,
>> +					      GPOEN_DISABLE,
>> +					      GPI_SYS_TDM_CLK)>;
>> +			input-enable;
>> +		};
>> +	};
>>  };
>>  
>>  &uart0 {
>> @@ -221,3 +267,44 @@
>>  	pinctrl-0 = <&uart0_pins>;
>>  	status = "okay";
>>  };
>> +
>> +&tdm {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&tdm0_pins>;
>> +	status = "okay";
>> +};
>> +
>> +&sound0 {
>> +	simple-audio-card,dai-link@0 {
>> +		reg = <0>;
>> +		status = "okay";
> 
> Why? Drop.

Will drop it.

> 
>> +		format = "dsp_a";
>> +		bitclock-master = <&dailink_master>;
>> +		frame-master = <&dailink_master>;
>> +
>> +		widgets =
> 
> Drop line break.

OK, will drop it.

> 
>> +				"Microphone", "Mic Jack",
>> +				"Line", "Line In",
>> +				"Line", "Line Out",
>> +				"Speaker", "Speaker",
>> +				"Headphone", "Headphone Jack";
>> +		routing =
> 
> Drop unnecessary line break.

OK, will drop it.

> 
>> +				"Headphone Jack", "HP_L",
>> +				"Headphone Jack", "HP_R",
>> +				"Speaker", "SPK_LP",
>> +				"Speaker", "SPK_LN",
>> +				"LINPUT1", "Mic Jack",
>> +				"LINPUT3", "Mic Jack",
>> +				"RINPUT1", "Mic Jack",
>> +				"RINPUT2", "Mic Jack";
>> +		cpu {
>> +			sound-dai = <&tdm>;
>> +		};
>> +
>> +		dailink_master:codec {
> 
> Missing space after label:.

Will be fixed.

> 
>> +			sound-dai = <&wm8960>;
>> +			clocks = <&wm8960_mclk>;
>> +			clock-names = "mclk";
>> +		};
>> +	};
>> +};
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> index b503b6137743..a89158d1d7a6 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> @@ -210,6 +210,12 @@
>>  		#clock-cells = <0>;
>>  	};
>>  
>> +	wm8960_mclk: wm8960_mclk {
> 
> No underscores in node names. Use consistent naming - do you see here
> any nodes named "mclk"?
> 
> Anyway this is some fake clock. Real clock should come out from wm8960.

Thank you for pointing out this, it will be fixed.

> 
>> +		compatible = "fixed-clock";
>> +		clock-output-names = "wm8960_mclk";
>> +		#clock-cells = <0>;
>> +	};
>> +
>>  	i2srx_bclk_ext: i2srx-bclk-ext-clock {
>>  		compatible = "fixed-clock";
>>  		clock-output-names = "i2srx_bclk_ext";
>> @@ -375,6 +381,27 @@
>>  			status = "disabled";
>>  		};
>>  
>> +		tdm: tdm@10090000 {
>> +			compatible = "starfive,jh7110-tdm";
>> +			reg = <0x0 0x10090000 0x0 0x1000>;
>> +			clocks = <&syscrg JH7110_SYSCLK_TDM_AHB>,
>> +				 <&syscrg JH7110_SYSCLK_TDM_APB>,
>> +				 <&syscrg JH7110_SYSCLK_TDM_INTERNAL>,
>> +				 <&syscrg JH7110_SYSCLK_TDM_TDM>,
>> +				 <&syscrg JH7110_SYSCLK_MCLK_INNER>,
>> +				 <&tdm_ext>;
>> +			clock-names = "tdm_ahb", "tdm_apb",
>> +				      "tdm_internal", "tdm",
>> +				      "mclk_inner", "tdm_ext";
>> +			resets = <&syscrg JH7110_SYSRST_TDM_AHB>,
>> +				 <&syscrg JH7110_SYSRST_TDM_APB>,
>> +				 <&syscrg JH7110_SYSRST_TDM_CORE>;
>> +			dmas = <&dma 20>, <&dma 21>;
>> +			dma-names = "rx","tx";
>> +			#sound-dai-cells = <0>;
>> +			status = "disabled";
>> +		};
>> +
>>  		stgcrg: clock-controller@10230000 {
>>  			compatible = "starfive,jh7110-stgcrg";
>>  			reg = <0x0 0x10230000 0x0 0x10000>;
>> @@ -601,5 +628,12 @@
>>  			#reset-cells = <1>;
>>  			power-domains = <&pwrc JH7110_PD_VOUT>;
>>  		};
>> +
>> +		sound0: snd-card0 {
> 
> 1. Why card0?

There are several audio interfaces in JH7110 SoC, each as an independent sound card.
TDM is for snd-card0, latter i2s will be for snd-card1, spdif will be for snd-card2, etc.

> 2. Where is this node located? In MMIO bus? Run some basic checks on
> your DTS before submitting upstream.
> dtbs_check
> dtbs W=1
> 
> 3. Why this is even in the DTSI? This really looks wrong.

It seems that the sound node should be located in DTS file more appropriately.

Best regards,
Walker
