Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C74A321AEF8
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jul 2020 07:48:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78AC9166E;
	Fri, 10 Jul 2020 07:47:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78AC9166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594360097;
	bh=mPJNYufoRRHvUDW1GHp2D88MfCZKaDEpI/msyaDk5Kc=;
	h=From:Subject:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rldRwKx977FY1JddDdsegbQvzwCEMQMJlJOUySAQnArtpaMARtN+FffmsQ2xJwC/+
	 knzAIeZrXlILH0AoCI7jFCxCGrX+1p9XSvswwhmiZotZ87W+RKJTnHntp3t1N1DCLL
	 h96NTn1byOF6XmwOLHg07XB/Q0xXkaIuD3o1FSmM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DAEC4F802C4;
	Fri, 10 Jul 2020 07:45:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DAE48F802A9; Fri, 10 Jul 2020 07:44:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AC62F80268
 for <alsa-devel@alsa-project.org>; Fri, 10 Jul 2020 07:44:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AC62F80268
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="gMySc//R"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Dt7SnWbK"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 037D7E41;
 Fri, 10 Jul 2020 01:44:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 10 Jul 2020 01:44:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:subject:to:cc:references:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=X
 gums4BgP7kONJ1S1G2iTtD3H/SLu3oMYgn5fIT0t8Y=; b=gMySc//RQl62/uV2b
 tNAyPm9nv27hERlYJ4GPJAipW8w1xkOTSTMau9/ekzGB38bKsvfTrPrguF8Tz2DL
 lGmwPUCqHhU/opnzVKwY6wtChzQm5l2F167ZijDKl2mGRl9yPmGSsmD14hr/anMH
 WEBVkVlSrgaQ6XwjjIt1bR2vkxYoQc7hg0QWxaJvpbLWJWeGyyv+cU8Yj3cPO1Lj
 6GHtJ/SrhuglIK7zOE3v8NKqMZi0uEl3jEX6nZDU3G5n7MquKP+UAFz4J45R5hgc
 lKfF21M+b8mW7c5t4dVJjJcfuusNaB03gmolYP2MU89SRuuk98IYajcQGqpxBOBC
 tn1zw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=Xgums4BgP7kONJ1S1G2iTtD3H/SLu3oMYgn5fIT0t
 8Y=; b=Dt7SnWbKtkNRZ0bhd+mHFU8P3YiA8MQf8ElenZvr33lILqcYrIKj+v9+Z
 tcyKmIZt7WRJ30LXt+We9PE1bn70Tf9/FJwrJ26rbhaX3ctFRnefnXeHcuLhCdyN
 +o5ebA2YZkdRjXPD4s8b2tz00101qyyCY4nMcwNXhN6HzCDPMUPOV94b6+yB696K
 Laqi5qBDT1YaDl3o3PS4kAt/KzH+01sQDSA0W5mNSc6oY0wTBajC2p5HK7RByweb
 DyZP4/F0aYJc6sQ6hp2PUJLdqS2Jf6PQHnwb2l9O2p2IkpXWdpdj8tf6Ww35d0RR
 BjDsL4r8ORm1P3tEqWkDcLAcMWqfg==
X-ME-Sender: <xms:VAAIX1AJk-9-lJzLF97LEDq-91FkueZskyx-HtPNqrnlknuaUUMkHQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrvddtgddutddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffuvfhfkffffgggjggtgfesthekredttdefjeenucfhrhhomhepufgrmhhu
 vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
 ftrfgrthhtvghrnhepvedvffegtdeiheefledtkeeljeevtddvfeeuheeuiefhvdejgfek
 fedugeejjedtnecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghruf
 hiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgr
 nhgurdhorhhg
X-ME-Proxy: <xmx:VAAIXzjzrlnzJcwiVbYnm2cSNW30X19LMp9mYtrg_Gk5i4cc3e9IBg>
 <xmx:VAAIXwk3Ah2aXD3avOF5ARpPjW5-xvKWQ7o6RYIAdNNvBgpYgv8ypA>
 <xmx:VAAIX_zwkiZwSKoPDVtzDv9rCG8_vC7cmAjsXShlyNkxXuiC-8AElg>
 <xmx:VAAIX2ad7Nq7-B1BH8UMfi3KCGzHs9Ki5wR4oXOUPISnAxDWK2O363-F8Hc>
Received: from [192.168.50.169]
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id E50C5328005D;
 Fri, 10 Jul 2020 01:44:51 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
Subject: Re: [linux-sunxi] [PATCH 05/16] ASoc: sun4i-i2s: Add 20 and 24 bit
 support
To: peron.clem@gmail.com, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
References: <20200704113902.336911-1-peron.clem@gmail.com>
 <20200704113902.336911-6-peron.clem@gmail.com>
Message-ID: <1e320dfd-9388-54b2-dba9-7def0bf4bbad@sholland.org>
Date: Fri, 10 Jul 2020 00:44:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200704113902.336911-6-peron.clem@gmail.com>
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

On 7/4/20 6:38 AM, Clément Péron wrote:
> From: Marcus Cooper <codekipper@gmail.com>
> 
> Extend the functionality of the driver to include support of 20 and
> 24 bits per sample.
> 
> Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> Signed-off-by: Clément Péron <peron.clem@gmail.com>
> ---
>  sound/soc/sunxi/sun4i-i2s.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> index f78167e152ce..bc7f9343bc7a 100644
> --- a/sound/soc/sunxi/sun4i-i2s.c
> +++ b/sound/soc/sunxi/sun4i-i2s.c
> @@ -577,6 +577,9 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
>  	case 16:
>  		width = DMA_SLAVE_BUSWIDTH_2_BYTES;
>  		break;
> +	case 32:
> +		width = DMA_SLAVE_BUSWIDTH_4_BYTES;
> +		break;

This breaks the sun4i variants, because sun4i_i2s_get_wss returns 4 for a 32 bit
width, but it needs to return 3.

As a side note, I wonder why we use the physical width (the spacing between
samples in RAM) to drive the slot width. S24_LE takes up 4 bytes per sample in
RAM, which we need for DMA. But I don't see why we would want to transmit the
padding over the wire. I would expect it to be transmitted the same as S24_3LE
(which has no padding). It did not matter before, because the only supported
format had no padding.

Regards,
Samuel

>  	default:
>  		dev_err(dai->dev, "Unsupported physical sample width: %d\n",
>  			params_physical_width(params));
> @@ -1063,6 +1066,10 @@ static int sun4i_i2s_dai_probe(struct snd_soc_dai *dai)
>  	return 0;
>  }
>  
> +#define SUN4I_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | \
> +			 SNDRV_PCM_FMTBIT_S20_LE | \
> +			 SNDRV_PCM_FMTBIT_S24_LE)
> +
>  static struct snd_soc_dai_driver sun4i_i2s_dai = {
>  	.probe = sun4i_i2s_dai_probe,
>  	.capture = {
> @@ -1070,14 +1077,14 @@ static struct snd_soc_dai_driver sun4i_i2s_dai = {
>  		.channels_min = 1,
>  		.channels_max = 8,
>  		.rates = SNDRV_PCM_RATE_8000_192000,
> -		.formats = SNDRV_PCM_FMTBIT_S16_LE,
> +		.formats = SUN4I_FORMATS,
>  	},
>  	.playback = {
>  		.stream_name = "Playback",
>  		.channels_min = 1,
>  		.channels_max = 8,
>  		.rates = SNDRV_PCM_RATE_8000_192000,
> -		.formats = SNDRV_PCM_FMTBIT_S16_LE,
> +		.formats = SUN4I_FORMATS,
>  	},
>  	.ops = &sun4i_i2s_dai_ops,
>  	.symmetric_rates = 1,
> 

