Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE74AD8A88
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Oct 2019 10:08:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DBB39F6;
	Wed, 16 Oct 2019 10:07:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DBB39F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571213328;
	bh=xg0hXuqcet40AJeOIJi7tXPeS10cA+lam5Ghx6prJHw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RDJjFGjTEAGp/ST8/nDa0tWuqV7xqhJ1gJP59vL4MFgrls/+zCH3npwplGM5Ym9/G
	 PZSJOfwo1QFmBnPPm5zLSXVS6oif84JskafUVGcfq0m559V6xcMAjKDt86YTUKJe+T
	 pK/h2Hju0BDOtl+zJk2W2S+mdr13sxLf9AeHsmbw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CEE05F80323;
	Wed, 16 Oct 2019 10:07:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53F6CF80362; Wed, 16 Oct 2019 10:07:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DAFC8F8011F
 for <alsa-devel@alsa-project.org>; Wed, 16 Oct 2019 10:06:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAFC8F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="2sCOTIwX"
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A2ACC2168B;
 Wed, 16 Oct 2019 08:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571213216;
 bh=xmK/fcgmX84/0Ee+b2avihtOo5xXFs3Rgwm4HoHFFVk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2sCOTIwXhDaoFNm4jG9AqcNOAL5y/DtHUL3wIpBu1vOqVsQv3z5Ng4WSchaVw5fYs
 LRj55cn5IftSfuwc6z3vXQADJOUeQLaEUUZdnE4VX53nAVbIJUr1wgn8+HXfZgMfnk
 35aElQtFqu8ybkI0+QOldoez7AnXNX6/TkcAQm8o=
Date: Wed, 16 Oct 2019 10:06:53 +0200
From: Maxime Ripard <mripard@kernel.org>
To: codekipper@gmail.com
Message-ID: <20191016080653.3seixioa2xiaobd7@gilmour>
References: <20191016070740.121435-1-codekipper@gmail.com>
 <20191016070740.121435-3-codekipper@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191016070740.121435-3-codekipper@gmail.com>
User-Agent: NeoMutt/20180716
Cc: alsa-devel@alsa-project.org, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, be17068@iperbole.bo.it,
 wens@csie.org, broonie@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH v6 2/7] ASoC: sun4i-i2s: Add functions for
 RX and TX channel offsets
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
Content-Type: multipart/mixed; boundary="===============2037745982819223426=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2037745982819223426==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eqduu55cdk37tzbj"
Content-Disposition: inline


--eqduu55cdk37tzbj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Wed, Oct 16, 2019 at 09:07:35AM +0200, codekipper@gmail.com wrote:
> From: Marcus Cooper <codekipper@gmail.com>
>
> Newer SoCs like the H6 have the channel offset bits in a different
> position to what is on the H3. As we will eventually add multi-
> channel support then create function calls as opposed to regmap
> fields to add support for different devices.
>
> Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> ---
>  sound/soc/sunxi/sun4i-i2s.c | 31 +++++++++++++++++++++++++------
>  1 file changed, 25 insertions(+), 6 deletions(-)
>
> diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> index f1a80973c450..875567881f30 100644
> --- a/sound/soc/sunxi/sun4i-i2s.c
> +++ b/sound/soc/sunxi/sun4i-i2s.c
> @@ -157,6 +157,8 @@ struct sun4i_i2s_quirks {
>  	int	(*set_chan_cfg)(const struct sun4i_i2s *,
>  				const struct snd_pcm_hw_params *);
>  	int	(*set_fmt)(struct sun4i_i2s *, unsigned int);
> +	void	(*set_txchanoffset)(const struct sun4i_i2s *, int);
> +	void	(*set_rxchanoffset)(const struct sun4i_i2s *);

The point of removing the regmap_field was that because having a
one-size-fits-all function with regmap_field sort of making the
abstraction was becoming more and more of a burden to maintain.

Having functions for each and every register access is exactly the
same as using regmap_field here, and the issue we adressed is not with
regmap_fields in itself.

If the H6 has a different register layout, then so be it, create a new
set_chan_cfg or set_fmt function for the H6.

Maxime

--eqduu55cdk37tzbj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXabPnQAKCRDj7w1vZxhR
xVgGAQC+c07u++gTF9sgMgydEJb6ZU4fnFFVj0WW2BXaQIv3MAD/fN+TY5xe5CTb
lMZpAVYl2AoGZu9oSTUSKXAUP4bzPwU=
=Qi0K
-----END PGP SIGNATURE-----

--eqduu55cdk37tzbj--

--===============2037745982819223426==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2037745982819223426==--
