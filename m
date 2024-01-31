Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 652918438AD
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jan 2024 09:21:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B29314E0;
	Wed, 31 Jan 2024 09:20:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B29314E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706689261;
	bh=tO5NhoozagSwjbc+fk1Ghjoe/kzNdbky8cAkoNrTrmU=;
	h=Date:From:To:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ZPCX1eb0z8/8EPowTlkdKjRh6DonWIb+HkdJpJwoVLAorphKZQmiP4oBWbzMpBGVH
	 OlEkcC3jAylIm9lfoMqNRpC3J3JB61N2edY56rFNMN/4gJ8+yNyQjJGXD8RLlIZ9Yp
	 A9stSsQKGdBn7CnBXGy/tMqLgzHPgFQHrUuIIzAI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FA74F80587; Wed, 31 Jan 2024 09:20:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B4BDFF8020D;
	Wed, 31 Jan 2024 09:20:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 498AEF8055C; Wed, 31 Jan 2024 09:20:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp.ivitera.com (smtp.ivitera.com [88.101.85.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C79B0F8020D
	for <alsa-devel@alsa-project.org>; Wed, 31 Jan 2024 09:20:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C79B0F8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ivitera.com header.i=@ivitera.com header.a=rsa-sha256
 header.s=mail header.b=MmFoIQzx;
	dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.a=rsa-sha256 header.s=mail header.b=h99FVYy9
Received: from localhost (localhost [127.0.0.1])
	by smtp.ivitera.com (Postfix) with ESMTP id 8052F11BCE;
	Wed, 31 Jan 2024 09:20:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1706689201; bh=tO5NhoozagSwjbc+fk1Ghjoe/kzNdbky8cAkoNrTrmU=;
	h=Date:From:To:Subject:From;
	b=MmFoIQzxXuXw0enZvFs0p018C0l3JDxWHpSuc63W2oilMct3sQXb1Ei4vLOBYP2n7
	 0DO+oSmSB21MSuP13rmLzfcvgHrmeZcVbc28KRFUW+64ZI7nN73PWSGaO+LXiBl0q8
	 2vROVsyYP+NFjvONbVy8G8XSdj/ifs6XzqouvxNU=
Received: from smtp.ivitera.com ([127.0.0.1])
	by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kVSs4BDQjL8w; Wed, 31 Jan 2024 09:20:01 +0100 (CET)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
	(Authenticated sender: pavel)
	by smtp.ivitera.com (Postfix) with ESMTPSA id DDC56129B9;
	Wed, 31 Jan 2024 09:20:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1706689200; bh=tO5NhoozagSwjbc+fk1Ghjoe/kzNdbky8cAkoNrTrmU=;
	h=Date:From:To:Subject:From;
	b=h99FVYy9XdbeYUzdxu+PWzcq+75+kUyJZal6GxBgnYJWydSczSAuIh3qtufJ/ka0y
	 +TwDjqmdM19JCohEBru7xIBdxF6mOIfq4QAcVE7fZA2aIhiaGL/atteyEUbUSf5+AN
	 3a6NqGAqVNB1in1uunzmi5dzYrum40UIpKdL/UwA=
Message-ID: <7ab8fcf3-f526-8618-f324-8450d431496f@ivitera.com>
Date: Wed, 31 Jan 2024 09:19:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
From: Pavel Hofman <pavel.hofman@ivitera.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 linux-rockchip@lists.infradead.org
Subject: ASoC: rockchip_i2s_tdm calibration clocking problem
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ONWXBU7CDF3YWRW5QZ3ZY4KNLFMJK7JM
X-Message-ID-Hash: ONWXBU7CDF3YWRW5QZ3ZY4KNLFMJK7JM
X-MailFrom: pavel.hofman@ivitera.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ONWXBU7CDF3YWRW5QZ3ZY4KNLFMJK7JM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

I am hitting a clock issue with rockchip_i2s_tdm.c + simple-audio-card 
(+ RK3308).

At boot the mclk clk_i2s0_8ch_tx is (somehow) initialized to some 
(unimportant?) value 50176000 Hz. Note that this frequency is not 
multiple of either 48kHz or 44.1kHz.

Method asoc_simple_parse_clk() reads this value and sets it to 
simple_dai->sysclk.

Subsequently at asoc_simple_dai_init this "random" initial value is 
stored to i2s_tdm->mclk_tx_freq:

    17.839330]  rockchip_i2s_tdm_set_sysclk+0x50/0xbc 
[snd_soc_rockchip_i2s_tdm]
[   17.839367]  snd_soc_dai_set_sysclk+0x38/0xb8 [snd_soc_core]
[   17.839596]  asoc_simple_init_dai+0x94/0xc0 [snd_soc_simple_card_utils]
[   17.839640]  asoc_simple_dai_init+0x130/0x230 [snd_soc_simple_card_utils]
[   17.839672]  snd_soc_link_init+0x28/0x90 [snd_soc_core]
[   17.839843]  snd_soc_bind_card+0x60c/0xbb4 [snd_soc_core]


When starting playback, called by rockchip_i2s_tdm_hw_params(), 
rockchip_i2s_tdm_calibrate_mclk() correctly switches parent of 
mclk_parent to correct root pll clock mclk_root0/1 for the given 
samplerate and correctly configures mclk_parent frequency.

https://github.com/torvalds/linux/blob/master/sound/soc/rockchip/rockchip_i2s_tdm.c#L862-L864

But right after that, the next line of rockchip_i2s_tdm_hw_params() 
calls rockchip_i2s_tdm_set_mclk()

https://github.com/torvalds/linux/blob/master/sound/soc/rockchip/rockchip_i2s_tdm.c#L866C9-L866C34

This method calls clk_set_rate(i2s_tdm->mclk_tx, i2s_tdm->mclk_tx_freq), 
which resets the clock and its parental chain to the original incorrect 
value stored in i2s_tdm->mclk_tx_freq from the dai initialization.

https://github.com/torvalds/linux/blob/master/sound/soc/rockchip/rockchip_i2s_tdm.c#L693

As a result, no matter what sample rate is being played, the i2s mclk 
clock always ends up configured incorrectly.


DTS I2S sets all clocks, therefore the clk calibration in 
rockchip_i2s_tdm.c should be (and is) used:

	i2s_8ch_0: i2s@ff300000 {
		compatible = "rockchip,rk3308-i2s-tdm";
		reg = <0x0 0xff300000 0x0 0x1000>;
		interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
		clocks = <&cru SCLK_I2S0_8CH_TX>, <&cru SCLK_I2S0_8CH_RX>, <&cru 
HCLK_I2S0_8CH>,
			 <&cru SCLK_I2S0_8CH_TX_SRC>,
			 <&cru SCLK_I2S0_8CH_RX_SRC>,
			 <&cru PLL_VPLL0>,
			 <&cru PLL_VPLL1>;
		clock-names = "mclk_tx", "mclk_rx", "hclk",
			      "mclk_tx_src", "mclk_rx_src",
			      "mclk_root0", "mclk_root1";
		.........


It seems to me that the calibration code should also rewrite the 
initially incorrect i2s_tdm->mclk_tx_freq and i2s_tdm->mclk_rx_freq with 
correct values corresponding to the momentary hw_params rate, or maybe 
rockchip_i2s_tdm_set_mclk() should not be called if 
rockchip_i2s_tdm_calibrate_mclk() is called a line above (i.e. putting 
the call to rockchip_i2s_tdm_set_mclk() into "else" branch).

Thank you very much for help.

With regards,

Pavel.
