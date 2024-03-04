Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 485998701BE
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Mar 2024 13:44:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A13A39F6;
	Mon,  4 Mar 2024 13:44:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A13A39F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709556260;
	bh=LdCePQgPdx/+9m/zexikhSQ8q667okKeZiVG052vBEI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nBJOKlErCDTi9oug6OEoSQtTsE9CBCqzYyRUqRVnJdp3gpZHG/LUbKYo5IdrWeCa/
	 xa9J7Eab3OXdklWZWJfU51jYjbNdVxAGCDHHmKkB2VZOf5acSSJO3g/e69VJxDtssG
	 aQ2MZGYGvvo1XFJU+RIrFW8Xr02yJpPkf+9hKWkI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2F1FF805A0; Mon,  4 Mar 2024 13:43:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 690AFF805A0;
	Mon,  4 Mar 2024 13:43:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1538AF8024E; Mon,  4 Mar 2024 13:43:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0E2DCF8014B
	for <alsa-devel@alsa-project.org>; Mon,  4 Mar 2024 13:43:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E2DCF8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=l+rYMq8i
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9D4871BF206;
	Mon,  4 Mar 2024 12:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709556211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r8fiNaO/LNk/DNM1VzAkgWp6ITdQul2gPeq1Y3bECeA=;
	b=l+rYMq8i1ZrXDZ7j4GG6hUKWiUTz4c2OxZ0Zh7RL7eZt20IUrzua9sbb3jjWrOYm8H/f8J
	mxMqzOBB7VieWoXLAe1deacN3F2kQ95WeCmmIBniEaRCZAyoW7Fz33Vvkf1R0RNgQfsvVB
	PnD2374It6Qi2zUVEriuK5Ooh/RKYJ/JtCvvqBclA6K3QIuTNnY/FSmPsH4NLuYCT6hjvJ
	5IAnvIoKynI7xuLdn5zscM05sCKwebKTblF0gmIyR8WApbqnh4IfVHOkWh0ISmSAPrh2o9
	gQhzBVZwSMOi0b0bbJwEeTK3zq/LP6eWCIxacFpI2IlTxh0FCU5uWA6Su1OdNw==
Date: Mon, 4 Mar 2024 13:43:29 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Pavel Hofman <pavel.hofman@ivitera.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 linux-rockchip@lists.infradead.org, Nicolas Frattaroli
 <frattaroli.nicolas@gmail.com>, Sugar Zhang <sugar.zhang@rock-chips.com>,
 linux-sound@vger.kernel.org
Subject: Re: ASoC: rockchip_i2s_tdm calibration clocking problem
Message-ID: <20240304134329.392c75bf@booty>
In-Reply-To: <c590ff6e-e57e-a7f7-e47d-2e14261a782c@ivitera.com>
References: <c590ff6e-e57e-a7f7-e47d-2e14261a782c@ivitera.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
Message-ID-Hash: LFBWBHRT6IXXUM5UBYPP2ZR7X66DVVNY
X-Message-ID-Hash: LFBWBHRT6IXXUM5UBYPP2ZR7X66DVVNY
X-MailFrom: luca.ceresoli@bootlin.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LFBWBHRT6IXXUM5UBYPP2ZR7X66DVVNY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello Pavel,

On Wed, 31 Jan 2024 09:25:41 +0100
Pavel Hofman <pavel.hofman@ivitera.com> wrote:

> Hi,
> 
> I am hitting a clock issue with rockchip_i2s_tdm.c + simple-audio-card 
> (+ RK3308).
> 
> At boot the mclk clk_i2s0_8ch_tx is (somehow) initialized to some 
> (unimportant?) value 50176000 Hz. Note that this frequency is not 
> multiple of either 48kHz or 44.1kHz.
> 
> Method asoc_simple_parse_clk() reads this value and sets it to 
> simple_dai->sysclk.
> 
> Subsequently at asoc_simple_dai_init this "random" initial value is 
> stored to i2s_tdm->mclk_tx_freq:
> 
>     17.839330]  rockchip_i2s_tdm_set_sysclk+0x50/0xbc 
> [snd_soc_rockchip_i2s_tdm]
> [   17.839367]  snd_soc_dai_set_sysclk+0x38/0xb8 [snd_soc_core]
> [   17.839596]  asoc_simple_init_dai+0x94/0xc0 [snd_soc_simple_card_utils]
> [   17.839640]  asoc_simple_dai_init+0x130/0x230 [snd_soc_simple_card_utils]
> [   17.839672]  snd_soc_link_init+0x28/0x90 [snd_soc_core]
> [   17.839843]  snd_soc_bind_card+0x60c/0xbb4 [snd_soc_core]
> 
> 
> When starting playback, called by rockchip_i2s_tdm_hw_params(), 
> rockchip_i2s_tdm_calibrate_mclk() correctly switches parent of 
> mclk_parent to correct root pll clock mclk_root0/1 for the given 
> samplerate and correctly configures mclk_parent frequency.
> 
> https://github.com/torvalds/linux/blob/master/sound/soc/rockchip/rockchip_i2s_tdm.c#L862-L864
> 
> But right after that, the next line of rockchip_i2s_tdm_hw_params() 
> calls rockchip_i2s_tdm_set_mclk()
> 
> https://github.com/torvalds/linux/blob/master/sound/soc/rockchip/rockchip_i2s_tdm.c#L866C9-L866C34
> 
> This method calls clk_set_rate(i2s_tdm->mclk_tx, i2s_tdm->mclk_tx_freq), 
> which resets the clock and its parental chain to the original incorrect 
> value stored in i2s_tdm->mclk_tx_freq from the dai initialization.
> 
> https://github.com/torvalds/linux/blob/master/sound/soc/rockchip/rockchip_i2s_tdm.c#L693
> 
> As a result, no matter what sample rate is being played, the i2s mclk 
> clock always ends up configured incorrectly.

Thanks for the detailed report. I've also run in the same issue while
working on the RK3308 internal audio codec and your analysis matches my
findings.

> DTS I2S sets all clocks, therefore the clk calibration in 
> rockchip_i2s_tdm.c should be (and is) used:
> 
> 	i2s_8ch_0: i2s@ff300000 {
> 		compatible = "rockchip,rk3308-i2s-tdm";
> 		reg = <0x0 0xff300000 0x0 0x1000>;
> 		interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
> 		clocks = <&cru SCLK_I2S0_8CH_TX>, <&cru SCLK_I2S0_8CH_RX>, <&cru 
> HCLK_I2S0_8CH>,  
> 			 <&cru SCLK_I2S0_8CH_TX_SRC>,
> 			 <&cru SCLK_I2S0_8CH_RX_SRC>,
> 			 <&cru PLL_VPLL0>,
> 			 <&cru PLL_VPLL1>;
> 		clock-names = "mclk_tx", "mclk_rx", "hclk",
> 			      "mclk_tx_src", "mclk_rx_src",
> 			      "mclk_root0", "mclk_root1";
> 		.........
> 
> 
> It seems to me that the calibration code should also rewrite the 
> initially incorrect i2s_tdm->mclk_tx_freq and i2s_tdm->mclk_rx_freq with 
> correct values corresponding to the momentary hw_params rate, or maybe 
> rockchip_i2s_tdm_set_mclk() should not be called if 
> rockchip_i2s_tdm_calibrate_mclk() is called a line above (i.e. putting 
> the call to rockchip_i2s_tdm_set_mclk() into "else" branch).

In my latest v3 series I have implemented a different solution, so
you way want to review and/or test it and give your feedback in that
thread:

https://lore.kernel.org/all/20240221-rk3308-audio-codec-v3-1-dfa34abfcef6@bootlin.com/

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
