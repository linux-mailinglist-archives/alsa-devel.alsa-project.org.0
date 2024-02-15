Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F8B8566DA
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Feb 2024 16:04:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3062CDFA;
	Thu, 15 Feb 2024 16:03:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3062CDFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708009444;
	bh=sBG3phRxMAQQReV1JgXC8fHKYzKolSoXzoI65XqO/fU=;
	h=Subject:From:To:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=hC1wcPnzhRr5umpHS65eAGjc5AXeRHK8Kg00KUIIbcL0yGbBsyXRcpjrxhAvRIjUm
	 D0kxMhEUHXwExj9zbL1Ae4U6sxANX2v0FFFT0pz/MuLAFqBpUqU3gn2+e7+zsPAsix
	 XM3pSXFqxb1No5JIfwwlXTGUU7/3lCw+qniP7zic=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6479F805AB; Thu, 15 Feb 2024 16:03:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D1B2F805A0;
	Thu, 15 Feb 2024 16:03:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9F33F80238; Thu, 15 Feb 2024 16:03:26 +0100 (CET)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EFDAF8015B
	for <alsa-devel@alsa-project.org>; Thu, 15 Feb 2024 16:03:26 +0100 (CET)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [ASOC][tlv320aic3110] Error resetting registers
From: =?utf-8?b?SmVzw7pzIEppbcOpbmV6IFPDoW5jaGV6?=
 <Jesus.JimenezSanchez@verifone.com>
To: alsa-devel@alsa-project.org
Date: Thu, 15 Feb 2024 15:03:26 -0000
Message-ID: <170800940662.22.5888632132452192540@mailman-web.alsa-project.org>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: 65MZF4PC67EYNEOJBOCOOKSAZ2PVKXUX
X-Message-ID-Hash: 65MZF4PC67EYNEOJBOCOOKSAZ2PVKXUX
X-MailFrom: Jesus.JimenezSanchez@verifone.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/65MZF4PC67EYNEOJBOCOOKSAZ2PVKXUX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello,

I am having an issue with the tlv320aic3110 codec. I get these two errors during boot up in my embedded device:

[   10.079068] tlv320aic31xx-codec 0-0018: Unable to sync registers 0x1d-0x1d. -6
[   10.161668] tlv320aic31xx-codec 0-0018: Failed to restore cache: -6

According to the datasheet, 0x1d can be "Table 7-69. Page 0 / Register 29 (0x1D): Codec Interface Control 2" or "Table 7-136. Page 1 / Register 1 (0x01) Through Page 1 / Register 29 (0x1D): Reserved".

After about a minute, there are also these errors:

[   66.858820] tlv320aic31xx-codec 0-0018: ASoC: error at snd_soc_component_update_bits on tlv320aic31xx-codec.0-0018: -16
[   66.943057] tlv320aic31xx-codec 0-0018: ASoC: error at snd_soc_component_update_bits on tlv320aic31xx-codec.0-0018: -16
[   67.092200] tlv320aic31xx-codec 0-0018: ASoC: POST_PMU: HPL Driver event failed: -16
[   67.383700] tlv320aic31xx-codec 0-0018: ASoC: error at soc_component_read_no_lock on tlv320aic31xx-codec.0-0018: -16
[   67.482291] tlv320aic31xx-codec 0-0018: ASoC: error at soc_component_read_no_lock on tlv320aic31xx-codec.0-0018: -16
[   67.545386] tlv320aic31xx-codec 0-0018: ASoC: POST_PMU: SPL ClassD event failed: -16
[   67.823211] tlv320aic31xx-codec 0-0018: ASoC: error at soc_component_read_no_lock on tlv320aic31xx-codec.0-0018: -16
[   67.895536] tlv320aic31xx-codec 0-0018: ASoC: error at soc_component_read_no_lock on tlv320aic31xx-codec.0-0018: -16

And finally, after suspend/resume, I get these last errors:

[ 5981.210062] tlv320aic31xx-codec 0-0018: ASoC: POST_PMD: HPL Driver event failed: -16
[ 5981.210103] tlv320aic31xx-codec 0-0018: ASoC: POST_PMD: SPL ClassD event failed: -16
[ 5981.210170] v1v8_ao: Underflow of regulator enable count
[ 5981.210184] Failed to disable DVDD: -EINVAL
[ 5981.223267] tlv320aic31xx-codec 0-0018: Unable to sync registers 0x1d-0x1d. -6
[ 5981.223303] tlv320aic31xx-codec 0-0018: Failed to restore cache: -6
[ 5981.233551] tlv320aic31xx-codec 0-0018: aic31xx_wait_bits: Failed! 0x25 was 0xc1855ddb expected 0x20 (-16, 0x20, 0 us)
[ 5981.233591] tlv320aic31xx-codec 0-0018: ASoC: POST_PMU: HPL Driver event failed: -1
[ 5981.233669] tlv320aic31xx-codec 0-0018: ASoC: POST_PMU: SPL ClassD event failed: -16

Here are all the relevant parts of our device tree:

/ {
	sound0: sound@0 {
		compatible = "simple-audio-card";
		simple-audio-card,name = "Sound";
		simple-audio-card,widgets =
			"Microphone", "Microphone Jack",
			"Headphone", "Headphone Jack",
			"Speaker", "Speaker";
		simple-audio-card,routing =
			"MIC1LP", "Microphone Jack",
			"MIC1RP", "Microphone Jack",
			"MIC1LP", "MICBIAS",
			"MIC1RP", "MICBIAS",
			"Headphone Jack", "HPL",
			"Headphone Jack", "HPR",
			"Speaker", "SPL",
			"Speaker", "SPR";
		simple-audio-card,format = "i2s";
		simple-audio-card,bitclock-master = <&sound0_master>;
		simple-audio-card,frame-master = <&sound0_master>;
		simple-audio-card,bitclock-inversion;
		simple-audio-card,convert-rate = <48000>;

		sound0_master: simple-audio-card,cpu {
			sound-dai = <&i2s1>;
			system-clock-frequency = <12000000>;
		};

		simple-audio-card,codec {
			sound-dai = <&codec>;
			system-clock-frequency = <12000000>;
		};
	};
};

&pinctrl {
	codec_pins_a: codec_pins_a {
		pins1 {
			pinmux = <STM32_PINMUX('H', 2, GPIO)>; /* AUDIO_PWR_EN1 */
		};

		pins2 {
			pinmux = <STM32_PINMUX('C', 0, AF6)>,	/* CODEC_I2S1_SDO */
					 <STM32_PINMUX('A', 6, AF5)>,	/* CODEC_I2S1_SDI */
					 <STM32_PINMUX('B', 1, AF5)>,	/* CODEC_I2S1_BITCLK / I2S1_CK */
					 <STM32_PINMUX('B', 0, AF5)>,	/* I2S1_MCK */
					 <STM32_PINMUX('A', 4, AF5)>;	/* CODEC_I2S1_WORDCLK / I2S1_WS */
		};
	};

	codec_sleep_pins_a: codec_sleep_pins_a {
		pins {
			pinmux = <STM32_PINMUX('H', 2, ANALOG)>,	/* AUDIO_PWR_EN1 */
					 <STM32_PINMUX('C', 0, ANALOG)>,	/* CODEC_I2S1_SDO */
					 <STM32_PINMUX('A', 6, ANALOG)>,	/* CODEC_I2S1_SDI */
					 <STM32_PINMUX('B', 1, ANALOG)>,	/* CODEC_I2S1_BITCLK / I2S1_CK */
					 <STM32_PINMUX('B', 0, ANALOG)>,	/* I2S1_MCK */
					 <STM32_PINMUX('A', 4, ANALOG)>;	/* CODEC_I2S1_WORDCLK / I2S1_WS */
		};
	};
};

&i2s1 {
	status = "okay";
	pinctrl-names =  "default", "sleep";
	pinctrl-0 = <&codec_pins_a>;
	pinctrl-1 = <&codec_sleep_pins_a>;	/* Sleep pins */

	clock-names = "pclk", "i2sclk", "x8k", "x11k";
	clocks = <&rcc SPI1>,
			 <&rcc SPI1_K>,
			 <&scmi_clk CK_SCMI_PLL3_Q>,
			 <&scmi_clk CK_SCMI_PLL3_R>;
};

&i2c1 {
	pinctrl-names = "default", "sleep";
	pinctrl-0 = <&i2c1_pins_a>;
	pinctrl-1 = <&i2c1_sleep_pins_a>;
	i2c-scl-rising-time-ns = <96>;
	i2c-scl-falling-time-ns = <3>;
	clock-frequency = <100000>;
	status = "okay";
	/* spare dmas for other usage */
	/delete-property/dmas;
	/delete-property/dma-names;

	codec: codec@18 {
		compatible = "ti,tlv320aic3110";
		reg = <0x18>;
		#sound-dai-cells = <0>;
		status = "okay";

		reset-gpios = <&gpiof 6 (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>;

		ai31xx-micbias-vg = <MICBIAS_2_0V>;

		/* Regulators */
		HPVDD-supply = <&scmi_v3v3_sw>;	/* 3V3_CODEC */
		SPRVDD-supply = <&v5v0_ao>;	/* 5V0_CODEC */
		SPLVDD-supply = <&v5v0_ao>;	/* 5V0_CODEC */
		AVDD-supply = <&scmi_v3v3_sw>;	/* 3V3_CODEC */
		IOVDD-supply = <&scmi_v3v3_sw>;	/* 3V3_CODEC */
		DVDD-supply = <&scmi_v1v8_periph>;	/* 1V8_CODEC */
	};
};

I have been trying to find a solution for a few days but I haven't been able to find anything important. Is there anything I could do to maybe get closer to the root cause of these errors? Has anyone seen something like this before?

Let me know if you need any other information from me that might help.

Thanks in advance!
