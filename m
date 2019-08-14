Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4978D1D2
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 13:12:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 733AF1666;
	Wed, 14 Aug 2019 13:11:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 733AF1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565781123;
	bh=PoMdkDzlSf8JSkH5nKY0zMawC2bjEPs4b8sArTB5V/8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tmoh8QNKwT/latDUE5JUUHHuk1mXY3XIcXUp4W8LlYS+/Rot94RAxV6MNs4Qcecqu
	 aQnVKYNZ/w5Oczp7VdjM0OO46AqlOXKjUKRep1wT2v0y04zsjdT2th+Ook7utS18J7
	 NxoGG6Cr+Cq5NgCHdGwM8c2Z0eD6ZnVBt3v+FoiA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01257F805E2;
	Wed, 14 Aug 2019 13:08:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 861FFF805E1; Wed, 14 Aug 2019 13:08:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_03_06,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09CE4F8015B
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 13:08:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09CE4F8015B
X-Originating-IP: 86.250.200.211
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr
 [86.250.200.211]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 055BE240006;
 Wed, 14 Aug 2019 11:08:36 +0000 (UTC)
Date: Wed, 14 Aug 2019 09:13:43 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: codekipper@gmail.com
Message-ID: <20190814071343.vvjbozrmv5ionwnf@flea>
References: <20190814060854.26345-1-codekipper@gmail.com>
 <20190814060854.26345-4-codekipper@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190814060854.26345-4-codekipper@gmail.com>
User-Agent: NeoMutt/20180716
Cc: alsa-devel@alsa-project.org, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, be17068@iperbole.bo.it,
 wens@csie.org, broonie@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH v5 03/15] ASoC: sun4i-i2s: Correct divider
	calculations
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
Content-Type: multipart/mixed; boundary="===============1304006164219149383=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1304006164219149383==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bamdgrdnwpokqt4x"
Content-Disposition: inline


--bamdgrdnwpokqt4x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

(I just noticed this, but can you update my mail address, it's not
@free-electrons for quite a while, you probably want to change your
scripts to use mripard@kernel.org)

On Wed, Aug 14, 2019 at 08:08:42AM +0200, codekipper@gmail.com wrote:
> From: Marcus Cooper <codekipper@gmail.com>
>
> The clock division circuitry is different on the H3 and later SoCs.
> The division of bclk is now based on pll2.
>
> Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> ---
>  sound/soc/sunxi/sun4i-i2s.c | 73 +++++++++++++++++++++++++------------
>  1 file changed, 49 insertions(+), 24 deletions(-)
>
> diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> index 7c37b6291df0..34f31439ae7b 100644
> --- a/sound/soc/sunxi/sun4i-i2s.c
> +++ b/sound/soc/sunxi/sun4i-i2s.c
> @@ -127,8 +127,6 @@ struct sun4i_i2s;
>   * @has_chsel_offset: SoC uses offset for selecting dai operational mode.
>   * @reg_offset_txdata: offset of the tx fifo.
>   * @sun4i_i2s_regmap: regmap config to use.
> - * @mclk_offset: Value by which mclkdiv needs to be adjusted.
> - * @bclk_offset: Value by which bclkdiv needs to be adjusted.
>   * @field_clkdiv_mclk_en: regmap field to enable mclk output.
>   * @field_fmt_wss: regmap field to set word select size.
>   * @field_fmt_sr: regmap field to set sample resolution.
> @@ -150,8 +148,6 @@ struct sun4i_i2s_quirks {
>  	bool				has_chsel_offset;
>  	unsigned int			reg_offset_txdata;	/* TX FIFO */
>  	const struct regmap_config	*sun4i_i2s_regmap;
> -	unsigned int			mclk_offset;
> -	unsigned int			bclk_offset;
>
>  	/* Register fields for i2s */
>  	struct reg_field		field_clkdiv_mclk_en;
> @@ -212,7 +208,25 @@ static const struct sun4i_i2s_clk_div sun4i_i2s_bclk_div[] = {
>  	{ .div = 8, .val = 3 },
>  	{ .div = 12, .val = 4 },
>  	{ .div = 16, .val = 5 },
> -	/* TODO - extend divide ratio supported by newer SoCs */
> +};
> +
> +static const struct sun4i_i2s_clk_div sun8i_i2s_clk_div[] = {
> +	{ .div = 0, .val = 0 },

Having a divider of 0 seems like a bad idea.

> +	{ .div = 1, .val = 1 },
> +	{ .div = 2, .val = 2 },
> +	{ .div = 4, .val = 3 },
> +	{ .div = 6, .val = 4 },
> +	{ .div = 8, .val = 5 },
> +	{ .div = 12, .val = 6 },
> +	{ .div = 16, .val = 7 },
> +	{ .div = 24, .val = 8 },
> +	{ .div = 32, .val = 9 },
> +	{ .div = 48, .val = 10 },
> +	{ .div = 64, .val = 11 },
> +	{ .div = 96, .val = 12 },
> +	{ .div = 128, .val = 13 },
> +	{ .div = 176, .val = 14 },
> +	{ .div = 192, .val = 15 },
>  };
>
>  static const struct sun4i_i2s_clk_div sun4i_i2s_mclk_div[] = {
> @@ -224,21 +238,21 @@ static const struct sun4i_i2s_clk_div sun4i_i2s_mclk_div[] = {
>  	{ .div = 12, .val = 5 },
>  	{ .div = 16, .val = 6 },
>  	{ .div = 24, .val = 7 },
> -	/* TODO - extend divide ratio supported by newer SoCs */
>  };
>
>  static int sun4i_i2s_get_bclk_div(struct sun4i_i2s *i2s,
>  				  unsigned int oversample_rate,
> -				  unsigned int word_size)
> +				  unsigned int word_size,
> +				  const struct sun4i_i2s_clk_div *bdiv,
> +				  unsigned int size)

Wouldn't it be simpler to just have the divider list in the variant
structure? It would avoid having to refactor all the functions, and
it's not like it's really going to change from one call to another
anyway.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--bamdgrdnwpokqt4x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXVO0pwAKCRDj7w1vZxhR
xeUlAP9r6Z9EM/cbBKKY+kiTaI16sfr7c9NwecdxGZCT7mrOkAEAlrY4YQHdPrGM
Ek/ZDh1DW7Q85spOkTJgAF0ugAOlDwQ=
=8Nke
-----END PGP SIGNATURE-----

--bamdgrdnwpokqt4x--

--===============1304006164219149383==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1304006164219149383==--
