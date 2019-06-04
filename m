Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E166341B5
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2019 10:23:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C375D16DA;
	Tue,  4 Jun 2019 10:22:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C375D16DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559636600;
	bh=NDuHpcWA0MHsR1Petyhwa6xAEw5S0i0pN9nXbEU58mc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XzJBjwa8bIWWyI+mB1OEwahOMyW3MuPzxvOQQQrWe0mpRFPkQo+zWqP/0T5DqKPpj
	 dTRot2NsCskl7A+oJWB+uH0AhZondDh75/pZ/p2nVGNGLwOII5c/GBWJS3e0pi9mwz
	 ZhigXePcQYqWRvFT+aJOHu8oF/elKnMIbKFDmC+4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42950F896FE;
	Tue,  4 Jun 2019 10:21:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C34DEF896F8; Tue,  4 Jun 2019 10:21:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67DCDF89673
 for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2019 10:21:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67DCDF89673
X-Originating-IP: 90.88.144.139
Received: from localhost (aaubervilliers-681-1-24-139.w90-88.abo.wanadoo.fr
 [90.88.144.139]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 21F3820010;
 Tue,  4 Jun 2019 08:21:26 +0000 (UTC)
Date: Tue, 4 Jun 2019 10:21:26 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: codekipper@gmail.com
Message-ID: <20190604082126.7jgk2cn2u253nmr2@flea>
References: <20190603174735.21002-1-codekipper@gmail.com>
 <20190603174735.21002-10-codekipper@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190603174735.21002-10-codekipper@gmail.com>
User-Agent: NeoMutt/20180716
Cc: alsa-devel@alsa-project.org, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, be17068@iperbole.bo.it,
 wens@csie.org, broonie@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH v4 9/9] ASoC: sun4i-i2s: Adjust regmap
	settings
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
Content-Type: multipart/mixed; boundary="===============2121788587669768799=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2121788587669768799==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="id3655fnez2gqvnw"
Content-Disposition: inline


--id3655fnez2gqvnw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 03, 2019 at 07:47:35PM +0200, codekipper@gmail.com wrote:
> From: Marcus Cooper <codekipper@gmail.com>
>
> Bypass the regmap cache when flushing the i2s FIFOs and modify the tables
> to reflect this.
>
> Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> ---
>  sound/soc/sunxi/sun4i-i2s.c | 29 +++++++++--------------------
>  1 file changed, 9 insertions(+), 20 deletions(-)
>
> diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> index 351b8021173b..92828a84902d 100644
> --- a/sound/soc/sunxi/sun4i-i2s.c
> +++ b/sound/soc/sunxi/sun4i-i2s.c
> @@ -595,9 +595,11 @@ static int sun4i_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
>  static void sun4i_i2s_start_capture(struct sun4i_i2s *i2s)
>  {
>  	/* Flush RX FIFO */
> +	regcache_cache_bypass(i2s->regmap, true);
>  	regmap_update_bits(i2s->regmap, SUN4I_I2S_FIFO_CTRL_REG,
>  			   SUN4I_I2S_FIFO_CTRL_FLUSH_RX,
>  			   SUN4I_I2S_FIFO_CTRL_FLUSH_RX);
> +	regcache_cache_bypass(i2s->regmap, false);

Your commit log should say why you need to do this in the first place.

> @@ -771,13 +775,7 @@ static const struct snd_soc_component_driver sun4i_i2s_component = {
>
>  static bool sun4i_i2s_rd_reg(struct device *dev, unsigned int reg)
>  {
> -	switch (reg) {
> -	case SUN4I_I2S_FIFO_TX_REG:
> -		return false;
> -
> -	default:
> -		return true;
> -	}
> +	return true;

That doesn't seem related?

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--id3655fnez2gqvnw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXPYqBgAKCRDj7w1vZxhR
xaI9AP9kw/Dxrjf+ydEaoUMyGCeuWG+T3q9mRR+01bsMCLwC4gD/Vw5P/+LzUpDY
JRMk0P27lfshoHsSOv0tmj90hGxF+QU=
=QlRr
-----END PGP SIGNATURE-----

--id3655fnez2gqvnw--

--===============2121788587669768799==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2121788587669768799==--
