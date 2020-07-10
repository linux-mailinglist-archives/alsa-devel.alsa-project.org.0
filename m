Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E34D721AEEF
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jul 2020 07:46:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89FBC1616;
	Fri, 10 Jul 2020 07:45:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89FBC1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594359996;
	bh=4C6FJFl+BaWyEzetPvPphikt4VfIn6u77xtg+KOKJjw=;
	h=From:Subject:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TivVO6U4DPCeGfh+M2+6ZEjIFiQ6ESY4kbt92zE0NB2oS7ziCPQC1hf8kbJoR2JKi
	 cizvoXISgp6Jug0vTWz+b7bARHlUwXNHAesbQP5eBH4eWUGtsLR1chXqVoSopsp4so
	 WWBzXLalgtmjd45+OpcApKvUHyVcd4+nr7uFqSmI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1633F8015C;
	Fri, 10 Jul 2020 07:44:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC3FDF8015D; Fri, 10 Jul 2020 07:44:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3012CF80150
 for <alsa-devel@alsa-project.org>; Fri, 10 Jul 2020 07:44:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3012CF80150
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="uad/q7X5"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Ur6lTTEW"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 08A7EDD6;
 Fri, 10 Jul 2020 01:44:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 10 Jul 2020 01:44:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:subject:to:cc:references:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=T
 Y2tPFdx7fey0wUOp1pvyVk5MN3ejOr1EHuMUz2E4uw=; b=uad/q7X5nHnT4xj1W
 i2l77nLmfCp6jQOTGMJbWYTpfABM7ixr34xCNBx9La+vAOYsJ2jF7iqgOeUiqPrG
 Ud1aa0FrLMABYP8G8Xxp24qDSpYog/MhIV7Qhx48Kl3n5FXvICCL5fsFeXin+lAn
 xnvL3Qw1dIEeZFJieWOteqBKwUpIT8PeGFgmXtnkyb+lEU6R00I5iTbz74xGwUkU
 Jw/40fGNhBK/pWojqHdyfmLfh4qaFeM16pBWx2Q1VpwFXUcfUmB405bVZXRGA9QS
 b3oFgn3rWYmUyBjTJJTnCeU1hBU1I8uIBM3Qjy1IU13+SqH89muOpWJO/7mZ5+Ug
 /oglg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=TY2tPFdx7fey0wUOp1pvyVk5MN3ejOr1EHuMUz2E4
 uw=; b=Ur6lTTEWnuNnAfC5iF7QiKaGjy8kpSy83jKu+RkG/QJ3/0p+r9iqvRzlh
 FgYGadoxl1U5xsJROSCazI8MmIwfRmbBLzLmVVA0JasxYjzQM1YjhSZyLt+4v94a
 EhccUr6iyxB+UxkezLcJWL84PGYPwfIQrw9ZYH82VVUEMCSuYrN6i3eTLTiC9pVL
 UvpbbFZ3Rv/3DC20gpcN6+AvKhxnfxRAxavFl/Imes30Jxzio+0TWmpWKjAPGqBT
 VCRViwimPrXxm+bJZ4Dh4qVedNHSU+zv8POLDifTtbQCDfq/oI0VQH0fQQ47HuXu
 h0gmsJsfMqqpuKhNMSBoDy6AMVbCg==
X-ME-Sender: <xms:RwAIX1Mdssdja-kjIY6gmqeRvzNXo5OCPqUUh3IRZQ3KRxcoxeRIEg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrvddtgdellecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhuffvfhfkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeevvdffgedtieehfeeltdekleejvedtvdefueehueeihfdvjefgkeef
 udegjeejtdenucfkphepjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuih
 iivgepudenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
 ugdrohhrgh
X-ME-Proxy: <xmx:RwAIX38qqVdKFz3jtZqbg4iqXexfxRYJSEch7FLyc42AjswekGSl1w>
 <xmx:RwAIX0SKqZWRqFd5KnZ7q92SD6RVpQ2uPnNfl3zvTS6zuXlcxSqkHQ>
 <xmx:RwAIXxtj_L7X7Rw_7uRU0mKFV3lUjgJBlpyOuPj7hEnfHllHRIFRuA>
 <xmx:RwAIX71oTe-9aYbTNFcnbIAiU0R-6u9uKuGMcAB-ABD8LBdnPRwaOxAvub0>
Received: from [192.168.50.169]
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 75E5B3280059;
 Fri, 10 Jul 2020 01:44:38 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
Subject: Re: [linux-sunxi] [PATCH 02/16] ASoC: sun4i-i2s: Adjust LRCLK width
To: peron.clem@gmail.com, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
References: <20200704113902.336911-1-peron.clem@gmail.com>
 <20200704113902.336911-3-peron.clem@gmail.com>
Message-ID: <72fa00f8-85b4-4653-f27e-57791271a068@sholland.org>
Date: Fri, 10 Jul 2020 00:44:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200704113902.336911-3-peron.clem@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Marcus Cooper <codekipper@gmail.com>,
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

On 7/4/20 6:38 AM, Clément Péron wrote:
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
> index 9690389cb68e..8bae97efea30 100644
> --- a/sound/soc/sunxi/sun4i-i2s.c
> +++ b/sound/soc/sunxi/sun4i-i2s.c
> @@ -470,6 +470,9 @@ static int sun8i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
>  		return -EINVAL;
>  	}
>  
> +	if (i2s->slot_width)
> +		lrck_period = i2s->slot_width;
> +
>  	regmap_update_bits(i2s->regmap, SUN4I_I2S_FMT0_REG,
>  			   SUN8I_I2S_FMT0_LRCK_PERIOD_MASK,
>  			   SUN8I_I2S_FMT0_LRCK_PERIOD(lrck_period));
> 

It looks like the existing code would have the same problem, that this should be
lrck_period - 1 according to the manual (I checked H3).

Regards,
Samuel
