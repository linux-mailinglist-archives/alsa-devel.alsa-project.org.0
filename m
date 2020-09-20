Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8281127173B
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Sep 2020 20:54:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06192167C;
	Sun, 20 Sep 2020 20:53:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06192167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600628042;
	bh=5fnMLhiLFWH5jsnpoEP8cZP4tMCIFx0i5yUjBSSU6JA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Nz73X33afEzexpjJwme6nCNA8Vfs0/jyetqfe0g3DMBvWESJIpup6qQuKAbkaiPbX
	 HxTyBKzqjToDKHaOZYSS6hHckAnvYxmyWGnwyfB/5rl5o6lKnA2EFTI4sHxjSvRmGj
	 d6clI0alqDMKn1J/2TVSLF9wOp/LCxbpUg1My7fE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1577AF8010A;
	Sun, 20 Sep 2020 20:52:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB029F80232; Sun, 20 Sep 2020 20:52:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 570E8F8010A
 for <alsa-devel@alsa-project.org>; Sun, 20 Sep 2020 20:52:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 570E8F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="oFC6W7pv"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="VReChI7L"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2F68C5800A3;
 Sun, 20 Sep 2020 14:52:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sun, 20 Sep 2020 14:52:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=U
 aKCWb+alngLYqUciWW42BXBdBSdxoHktDXuWpsVbrI=; b=oFC6W7pv/B3eHmUKR
 5P4lPrdAPq4Je35suAc4Jnc9Y2mx/f6alNQMyaLHujFUmtjAblXP8YV3sB4JgOaj
 1q/URKWa54gXKwZ+/qa6myvdQuwdPT4XX2QjfDa/MEbOzNmMph1xbHpcBftlqmmu
 le8crrD+s5xT9ff+Ts9ghK+W5mZvai7etQMyvaOuHlaRsthzlOsp9htLJy1PzWRD
 9MoTVVTd9nlXjl/qu7K6zEiVIJYXpY97A1uKCFcCuxQzyluAwqlJqtARhADODX4m
 PevuLPGAdXAJyeAz9/ND4/uM5bPN2Jca/tw5hqd5Dsu5Jzgx/zANMe5Tg/Lrxk8k
 lGE8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=UaKCWb+alngLYqUciWW42BXBdBSdxoHktDXuWpsVb
 rI=; b=VReChI7L+/asa/We8ef+cHzapzCWscrW00o9/Tfxe2AJkNafuoRlHDFSE
 7v+Vt1cfM3xe8ypmDp9uu84JbASRu0Z3noC77ROi5XTYvw7SG6z1ARLg59WhAnEb
 06ZmZGW9JIdH0l/mjewLKaidA4o7YBtYCwZLHXxAmOVGijvIJa+NlKT+ds3I8Du4
 CeA8dQ2wj6NPc4EQ3WLqZiMLPZM2aERJ5zWgPtRe0kZKKexocea8CENl+QdgoWc4
 Ek2qvqXRJY8GohzinSi9Q1Ulwfn9YAYA8kJagh8aI03yBTA3dnbOYX8W9tfiNjye
 gm/Gnii7e0RJTF6HExOZamm+WnZRA==
X-ME-Sender: <xms:3KRnX-urMvU9Q17WZsg0I44fQd7RIohRuDcYbdqPfEOkN_HSvw7QKA>
 <xme:3KRnXzdxonus58aXIzgMhbuV6GwFTaCm7tmXVnE_a9_XrlPdLFCOn6uZvGCy4SDKd
 LppPbNlmkbgjJVnRA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddtgddufedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepufgrmhhu
 vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
 ftrfgrthhtvghrnhepuddvleffkeejhfduieelheejteehleefieeikefgteeugefhtdev
 keefvefgheeinecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepjedtrddufe
 ehrddugeekrdduhedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
 lhhfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:3KRnX5z29Z1ju_ZDS9Yav0YREkL2MbH_JK_QZbayg1l6Jm2d8ZYvIw>
 <xmx:3KRnX5OU_SGLZL2fXculMRXlA0MoH1mOV6ohI9_0vZy6CHbNSI9Kpw>
 <xmx:3KRnX-8YPPoC05bhO1FvnIhRo9PVg-ScC41SsnoO6PzLS6pJ21RX4g>
 <xmx:3qRnX5VoP_9B6N7A2NI8mlo0RSDz8KMC6osnEwfyAMBz4uPqugmjRg>
Received: from [192.168.50.169]
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1E85B3280065;
 Sun, 20 Sep 2020 14:52:12 -0400 (EDT)
Subject: Re: [PATCH v3 06/19] ASoC: sun4i-i2s: Fix sun8i volatile regs
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
References: <20200920180758.592217-1-peron.clem@gmail.com>
 <20200920180758.592217-7-peron.clem@gmail.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <497a7062-4acf-d928-c2ee-ec595ed6799b@sholland.org>
Date: Sun, 20 Sep 2020 13:52:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200920180758.592217-7-peron.clem@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Marcus Cooper <codekipper@gmail.com>,
 linux-sunxi@googlegroups.com, linux-arm-kernel@lists.infradead.org
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

On 9/20/20 1:07 PM, Clément Péron wrote:
> The FIFO TX reg is volatile and sun8i i2s register
> mapping is different from sun4i.
> 
> Even if in this case it's doesn't create an issue,
> Avoid setting some regs that are undefined in sun8i.
> 
> Signed-off-by: Clément Péron <peron.clem@gmail.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> ---
>  sound/soc/sunxi/sun4i-i2s.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> index ce4913f0ffe4..a35be0e2baf5 100644
> --- a/sound/soc/sunxi/sun4i-i2s.c
> +++ b/sound/soc/sunxi/sun4i-i2s.c
> @@ -1126,12 +1126,19 @@ static bool sun8i_i2s_rd_reg(struct device *dev, unsigned int reg)
>  
>  static bool sun8i_i2s_volatile_reg(struct device *dev, unsigned int reg)
>  {
> -	if (reg == SUN8I_I2S_INT_STA_REG)
> +	switch (reg) {
> +	case SUN4I_I2S_FIFO_CTRL_REG:

Please check if this breaks audio recording with runtime PM enabled. I noticed
this with an older revision of the series that also changed
sun4i_i2s_volatile_reg. Marking SUN4I_I2S_FIFO_CTRL_REG as volatile broke
setting of SUN4I_I2S_FIFO_CTRL_TX_MODE/RX_MODE, because the set_fmt() callback
is not run with a runtime PM reference held, and volatile registers are not
written by regcache_sync() during sun4i_i2s_runtime_resume().

As a workaround, I moved the TX_MODE/RX_MODE initialization to hw_params(), but
I am not sure it is the right thing to do:

https://github.com/smaeul/linux/commit/5e40ac610986.patch

Cheers,
Samuel

> +	case SUN4I_I2S_FIFO_RX_REG:
> +	case SUN4I_I2S_FIFO_STA_REG:
> +	case SUN4I_I2S_RX_CNT_REG:
> +	case SUN4I_I2S_TX_CNT_REG:
> +	case SUN8I_I2S_FIFO_TX_REG:
> +	case SUN8I_I2S_INT_STA_REG:
>  		return true;
> -	if (reg == SUN8I_I2S_FIFO_TX_REG)
> -		return false;
>  
> -	return sun4i_i2s_volatile_reg(dev, reg);
> +	default:
> +		return false;
> +	}
>  }
>  
>  static const struct reg_default sun4i_i2s_reg_defaults[] = {
> 

