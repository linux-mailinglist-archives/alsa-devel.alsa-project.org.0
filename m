Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECE225CFB8
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Sep 2020 05:19:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E26771ACC;
	Fri,  4 Sep 2020 05:18:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E26771ACC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599189588;
	bh=3T2OcDTfeEj51C2e6kI2738e/E/GcvO0XvoH7OGaVCw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rn8dvBn+/OU8RcqoToNF0jtcodAgQHArMq7GIg089hSf1g5OVds+1mkuuRXzHyxeM
	 te939jn8u8lND5hum34YFLBq6OhaZ63zZpIlZKAmsWCxVGKHT1I4tlnUQdD1NaZkpN
	 KTTt3YhOXeofiU5XHdZyjFXBWFUHxrkFA8SHsv0c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65397F80268;
	Fri,  4 Sep 2020 05:18:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 161EDF8025E; Fri,  4 Sep 2020 05:18:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2BACF80113
 for <alsa-devel@alsa-project.org>; Fri,  4 Sep 2020 05:18:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2BACF80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="qH0x9AqW"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="iGBdKFsC"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 6FD431284;
 Thu,  3 Sep 2020 23:18:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 03 Sep 2020 23:18:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=d
 aya0oYspjG9Gt00RdJSVZlyB/j1e0iHqyBf8JDOAHI=; b=qH0x9AqWShHLGvJbB
 7WcnSKZuR70hZW8ewBHikke14/RXA8iKU/mEzz0GIrLcaBzADVkQO5lzqnRi8mYm
 Xy00p/D0HT0UmACc1lGMyuGbGt2yg1RYNX5Kkf6BV6hYerXKMbCD5ZrB3jup7Q7w
 iE4VSpaSVXDpndzBYdxK4dR9M2hdc2JXXQX5eqOpuuOMxmyASfk4lPsQRNkQAzY7
 9A9DckA8bFLWaDa8/SaelMBPxQSwl4FNutnLFMYq23qmVTvSz5OQB43KhwUCD007
 n87tBPRbzG1E0SSfvTaH1wR2MmELcMJXHvjF1ldAafJePKDJZbCLIknt9vmYSLul
 +jLFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=daya0oYspjG9Gt00RdJSVZlyB/j1e0iHqyBf8JDOA
 HI=; b=iGBdKFsC7cY4mTqOmEfFlQKxEdwHyo1tR7qFwoMoacPY7KvfRFKQGb2fo
 OfLo138V2tSHV9tMGKGYna31Q5n0MnZekdwrIS3DTaSJw/fvRlBUhHAa82FEOT+v
 7Y44RuqcZU/22xfJFaDHBRfCTlwPvcl7gj7Z4f+F8DeHrwYZ/IzGBU6x5WrWRwpv
 oVrcWmnQYUJa4OKDErzDyHmeO0plOzB4RgCbLR5mtlDYZ9eGVegyjOsB3AOsa/EZ
 bZhsGVr3VmI/x0NUAj3sGpzqy52GlXTmL3Y7+KBhQy0vTSrDFw1ToMfX/uJYMneq
 01erHy6INxtw4C9A++lTMSEzNunyA==
X-ME-Sender: <xms:ErJRX56UYu_vQFidW29eL1TaTHtWJrt8O7yvn0EpgZ6tslVOizgTSw>
 <xme:ErJRX25XHcw6Q65G_OWOfyyo84-0xsJ5-pW9tUxJVY7k9nJMS8nGSdIIHMwEey4jd
 m5Dr09dsGrifu85cA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegvddgieelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepufgrmhhu
 vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
 ftrfgrthhtvghrnhepgfelkeduveejtdejhfeiledvhfeggeeiieeklefhfeefffffffeg
 udetteelieejnecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghruf
 hiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgr
 nhgurdhorhhg
X-ME-Proxy: <xmx:ErJRXwdm0znDTekQkNpFRQKbhtAKv3wpFUv2oOzFO8zqvcmj0TS_nw>
 <xmx:ErJRXyInBPKHnNQ5vu1Ha2kaImMh0C6LIlQaLxxooKZZv_I3vojWcQ>
 <xmx:ErJRX9L5iJJURgSbz473jBhbVTvc7YfkTP_ECs06ZMhEX0NV4Eoojw>
 <xmx:E7JRX3CAaQ_5Az1QgjcryG6sjtQ9nSOqGLhE0CbjaIDwHdDRSHcbucvrBQU>
Received: from [192.168.50.169]
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 546CF328005A;
 Thu,  3 Sep 2020 23:18:41 -0400 (EDT)
Subject: Re: [PATCH v2 03/20] ASoC: sun4i-i2s: Adjust LRCLK width
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
References: <20200903203034.1057334-1-peron.clem@gmail.com>
 <20200903203034.1057334-4-peron.clem@gmail.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <e4c5eb23-e932-148c-5da6-90584c95cc81@sholland.org>
Date: Thu, 3 Sep 2020 22:18:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200903203034.1057334-4-peron.clem@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Marcus Cooper <codekipper@gmail.com>,
 linux-sunxi@googlegroups.com, Maxime Ripard <maxime@cerno.tech>,
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

Clément,

On 9/3/20 3:30 PM, Clément Péron wrote:
> From: Marcus Cooper <codekipper@gmail.com>
> 
> Some codecs such as i2s based HDMI audio and the Pine64 DAC require
> a different amount of bit clocks per frame than what is calculated
> by the sample width. Use the values obtained by the tdm slot bindings
> to adjust the LRCLK width accordingly.
> 
> Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> Signed-off-by: Clément Péron <peron.clem@gmail.com>
> Acked-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  sound/soc/sunxi/sun4i-i2s.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> index acf24f512f2c..1b4482b0f4af 100644
> --- a/sound/soc/sunxi/sun4i-i2s.c
> +++ b/sound/soc/sunxi/sun4i-i2s.c
> @@ -478,6 +478,9 @@ static int sun8i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
>  		return -EINVAL;
>  	}
>  
> +	if (i2s->slot_width)
> +		lrck_period = i2s->slot_width;
> +

Same as patch 2, this duplicates logic in sun4i_i2s_hw_params, and would need to
be multiplied by `slots` for PCM (DSP_A/B) mode.

Regards,
Samuel

>  	regmap_update_bits(i2s->regmap, SUN4I_I2S_FMT0_REG,
>  			   SUN8I_I2S_FMT0_LRCK_PERIOD_MASK,
>  			   SUN8I_I2S_FMT0_LRCK_PERIOD(lrck_period));
> 

