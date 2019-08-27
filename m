Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7189E503
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2019 11:57:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 016AC820;
	Tue, 27 Aug 2019 11:57:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 016AC820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566899870;
	bh=AizUU6zxi5Nsi6vuIaXJ6h9ACtSYw8eTFfjczsvt0Uk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lqMUx8MW+Y8/aKpR7Geil0+XWFqlJDNewebHBikO1qH2MmZRhCg2wiryywdC930ho
	 scPvrV+BmfaQOtuHNK+xu1a6rk79mEPFbq9qlKVCYjoKu4kuhbl811Q3EeoWQgSC0p
	 84VbCkhAuWhqcSEg0uicUZiVRJpSkSOpCkPv15KY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BF5DF802A1;
	Tue, 27 Aug 2019 11:56:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2DB87F80274; Tue, 27 Aug 2019 11:56:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43165F801ED
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 11:55:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43165F801ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Ij1ba8VI"
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr
 [86.250.200.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 84CED206BA;
 Tue, 27 Aug 2019 09:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566899757;
 bh=atL+c09nTJMiaNPgzBud/uYn355sWv8brUYuoy1/Mo4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ij1ba8VIqrOZDYUqLFOLUwXkabk9imXGwVmxdSmwN5cZGiTsUxO1aA/95qLigQa/L
 8FSW5wKFkg2kk4bRYb3jVTNbxyMP3df0h7kajb2lXGFq57f9BTBjzR0sfwXVhqCua7
 DwmnG/1Z5xYHmybKdt3fxnGvMgFuAetc1sgOOlfk=
Date: Tue, 27 Aug 2019 11:55:54 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>, lgirdwood@gmail.com, broonie@kernel.org
Message-ID: <20190827095554.33tipdzz4p44zyzr@flea>
References: <20190827093206.17919-1-mripard@kernel.org>
 <20190827093206.17919-2-mripard@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20190827093206.17919-2-mripard@kernel.org>
User-Agent: NeoMutt/20180716
Cc: codekipper@gmail.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 2/2] ASoC: sun4i: Revert A83t description
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
Content-Type: multipart/mixed; boundary="===============4101164858940463464=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4101164858940463464==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ofq54esimqpykuym"
Content-Disposition: inline


--ofq54esimqpykuym
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 27, 2019 at 11:32:06AM +0200, Maxime Ripard wrote:
> From: Maxime Ripard <maxime.ripard@bootlin.com>
>
> The last set of reworks included some fixes to change the A83t behaviour
> and "fix" it.
>
> It turns out that the controller described in the datasheet and the one
> supported here are not the same, yet the A83t has the two of them, and the
> one supported in the driver wasn't the one described in the datasheet.
>
> Fix this by reintroducing the proper quirks.
>
> Fixes: 69e450e50ca6 ("ASoC: sun4i-i2s: Fix the LRCK period on A83t")
> Fixes: bf943d527987 ("ASoC: sun4i-i2s: Fix MCLK Enable bit offset on A83t")
> Fixes: 2e04fc4dbf50 ("ASoC: sun4i-i2s: Fix WSS and SR fields for the A83t")
> Fixes: 515fcfbc7736 ("ASoC: sun4i-i2s: Fix LRCK and BCLK polarity offsets on newer SoCs")
> Fixes: c1d3a921d72b ("ASoC: sun4i-i2s: Fix the MCLK and BCLK dividers on newer SoCs")
> Fixes: fb19739d7f68 ("ASoC: sun4i-i2s: Use module clock as BCLK parent on newer SoCs")
> Fixes: 71137bcd0a9a ("ASoC: sun4i-i2s: Move the format configuration to a callback")
> Fixes: d70be625f25a ("ASoC: sun4i-i2s: Move the channel configuration to a callback")
> Reported-by: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  sound/soc/sunxi/sun4i-i2s.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> index a6a3f772fdf0..498ceebd9135 100644
> --- a/sound/soc/sunxi/sun4i-i2s.c
> +++ b/sound/soc/sunxi/sun4i-i2s.c
> @@ -1106,18 +1106,18 @@ static const struct sun4i_i2s_quirks sun8i_a83t_i2s_quirks = {
>  	.has_reset		= true,
>  	.reg_offset_txdata	= SUN8I_I2S_FIFO_TX_REG,
>  	.sun4i_i2s_regmap	= &sun4i_i2s_regmap_config,
> -	.field_clkdiv_mclk_en	= REG_FIELD(SUN4I_I2S_CLK_DIV_REG, 8, 8),
> -	.field_fmt_wss		= REG_FIELD(SUN4I_I2S_FMT0_REG, 0, 2),
> -	.field_fmt_sr		= REG_FIELD(SUN4I_I2S_FMT0_REG, 4, 6),
> -	.bclk_dividers		= sun8i_i2s_clk_div,
> -	.num_bclk_dividers	= ARRAY_SIZE(sun8i_i2s_clk_div),
> -	.mclk_dividers		= sun8i_i2s_clk_div,
> -	.num_mclk_dividers	= ARRAY_SIZE(sun8i_i2s_clk_div),
> -	.get_bclk_parent_rate	= sun8i_i2s_get_bclk_parent_rate,
> -	.get_sr			= sun8i_i2s_get_sr_wss,
> -	.get_wss		= sun8i_i2s_get_sr_wss,
> -	.set_chan_cfg		= sun8i_i2s_set_chan_cfg,
> -	.set_fmt		= sun8i_i2s_set_soc_fmt,
> +	.field_clkdiv_mclk_en	= REG_FIELD(SUN4I_I2S_CLK_DIV_REG, 7, 7),
> +	.field_fmt_wss		= REG_FIELD(SUN4I_I2S_FMT0_REG, 2, 3),
> +	.field_fmt_sr		= REG_FIELD(SUN4I_I2S_FMT0_REG, 4, 5),
> +	.bclk_dividers		= sun4i_i2s_bclk_div,
> +	.num_bclk_dividers	= ARRAY_SIZE(sun4i_i2s_bclk_div),
> +	.mclk_dividers		= sun4i_i2s_mclk_div,
> +	.num_mclk_dividers	= ARRAY_SIZE(sun4i_i2s_mclk_div),
> +	.get_bclk_parent_rate	= sun4i_i2s_get_bclk_parent_rate,
> +	.get_sr			= sun4i_i2s_get_sr_wss,

This should be sun4i_i2s_get_sr

> +	.get_wss		= sun4i_i2s_get_sr_wss,

This should be sun4i_i2s_get_wss

Sorry for that.

Maxime
--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--ofq54esimqpykuym
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXWT+KgAKCRDj7w1vZxhR
xcK8APoCqQ3/O2zmdGt1Jbk4nJNFD9ugntBZ5RBtIauNpnmlWQD+KGnyPy5+HWfq
E4inmGjbivNP3KzSX7HHh1Rr+fblBQc=
=QDn9
-----END PGP SIGNATURE-----

--ofq54esimqpykuym--

--===============4101164858940463464==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4101164858940463464==--
