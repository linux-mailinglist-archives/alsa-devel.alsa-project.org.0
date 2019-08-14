Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CD08D1CF
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 13:11:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF09E1669;
	Wed, 14 Aug 2019 13:10:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF09E1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565781073;
	bh=0OK0ZuW+6CTjoOBIATxinRApTVIskClndjjI1npoSO0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c6RVrZfpUw0O2mhrsEG1kJ81K6ortv9v/kYVBVH6h6cljAbFa+l5nszLVyeTVfzx8
	 2QAGjax06GkgTkANAdKRkBOWIb91Nj7teSAfWWOWSz2QFEtKVX6KtEKMMQUrtl2lJC
	 oX88itaFpIYa6sWKwo7K08ci2H25nUPhfhDf4SfM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1ECBFF805A0;
	Wed, 14 Aug 2019 13:08:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85F6DF80214; Wed, 14 Aug 2019 13:08:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_03_06,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1CD7F8015B
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 13:08:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1CD7F8015B
X-Originating-IP: 86.250.200.211
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr
 [86.250.200.211]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 97D71E0003;
 Wed, 14 Aug 2019 11:08:35 +0000 (UTC)
Date: Wed, 14 Aug 2019 09:09:23 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: codekipper@gmail.com
Message-ID: <20190814070923.wwkw7hybjvy3p4br@flea>
References: <20190814060854.26345-1-codekipper@gmail.com>
 <20190814060854.26345-3-codekipper@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190814060854.26345-3-codekipper@gmail.com>
User-Agent: NeoMutt/20180716
Cc: alsa-devel@alsa-project.org, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, be17068@iperbole.bo.it,
 wens@csie.org, broonie@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH v5 02/15] ASoC: sun4i-i2s: Add set_tdm_slot
	functionality
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
Content-Type: multipart/mixed; boundary="===============4466545059468997468=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4466545059468997468==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mpw4oztj7vyrpshs"
Content-Disposition: inline


--mpw4oztj7vyrpshs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Wed, Aug 14, 2019 at 08:08:41AM +0200, codekipper@gmail.com wrote:
> From: Marcus Cooper <codekipper@gmail.com>
>
> Codecs without a control connection such as i2s based HDMI audio and
> the Pine64 DAC require a different amount of bit clocks per frame than
> what is calculated by the sample width. Use the tdm slot bindings to
> provide this mechanism.
>
> Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> ---
>  sound/soc/sunxi/sun4i-i2s.c | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> index 8201334a059b..7c37b6291df0 100644
> --- a/sound/soc/sunxi/sun4i-i2s.c
> +++ b/sound/soc/sunxi/sun4i-i2s.c
> @@ -195,6 +195,9 @@ struct sun4i_i2s {
>  	struct regmap_field	*field_rxchansel;
>
>  	const struct sun4i_i2s_quirks	*variant;
> +
> +	unsigned int	tdm_slots;
> +	unsigned int	slot_width;
>  };
>
>  struct sun4i_i2s_clk_div {
> @@ -346,7 +349,7 @@ static int sun4i_i2s_set_clk_rate(struct snd_soc_dai *dai,
>  	if (i2s->variant->has_fmt_set_lrck_period)
>  		regmap_update_bits(i2s->regmap, SUN4I_I2S_FMT0_REG,
>  				   SUN8I_I2S_FMT0_LRCK_PERIOD_MASK,
> -				   SUN8I_I2S_FMT0_LRCK_PERIOD(32));
> +				   SUN8I_I2S_FMT0_LRCK_PERIOD(word_size));
>
>
>  	/* Set sign extension to pad out LSB with 0 */
>  	regmap_field_write(i2s->field_fmt_sext, 0);
> @@ -450,7 +453,8 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
>  	regmap_field_write(i2s->field_fmt_sr, sr);
>
>  	return sun4i_i2s_set_clk_rate(dai, params_rate(params),
> -				      params_width(params));
> +				      i2s->tdm_slots ?
> +				      i2s->slot_width : params_width(params));

This is slightly more complicated than that.

On the H3 (and all related ones), the CHAN_CFG_TX_SLOT_NUM and
_RX_SLOT_NUM fields in the CHAN_CFG register need to be set to the
number of slots as well.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--mpw4oztj7vyrpshs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXVOzowAKCRDj7w1vZxhR
xYQiAQDZAhUPiv1ty7F7fpZyPJeJRXOokKvsfX401+9n0UxeEwEAimWXgMxiGvqG
BMajnuQhZjSi5H9ncO28lJkw9KzobwU=
=2WOa
-----END PGP SIGNATURE-----

--mpw4oztj7vyrpshs--

--===============4466545059468997468==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4466545059468997468==--
