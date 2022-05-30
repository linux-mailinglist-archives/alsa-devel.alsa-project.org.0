Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B94537691
	for <lists+alsa-devel@lfdr.de>; Mon, 30 May 2022 10:37:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C3021AAF;
	Mon, 30 May 2022 10:36:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C3021AAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653899854;
	bh=pvu7y8L38rWRCVQxVAximbdmkNaSNUesRv3SHI3Ck3c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uMDU20SYBTiMCU9AUdQ4KyLC9zItIFUyFvfHzrtWUQTqRwcKIWXQKq/WMWskT0vZ+
	 10iSUiXk5Kkxc1b291R5QgCWEq4O18fPRkuzdzhdesDomTtaEIYfHOCSdBVqHjofMS
	 PKgw5auFV+voA/un4X4O/7kxdHOjrH9ZGAR6fO5o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D671EF800E5;
	Mon, 30 May 2022 10:36:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20DDDF8012F; Mon, 30 May 2022 10:36:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5706F80124
 for <alsa-devel@alsa-project.org>; Mon, 30 May 2022 10:36:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5706F80124
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nvat0-0006xn-GO; Mon, 30 May 2022 10:36:26 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nvat0-005PvP-GB; Mon, 30 May 2022 10:36:25 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nvasy-00D3L0-19; Mon, 30 May 2022 10:36:24 +0200
Date: Mon, 30 May 2022 10:36:16 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Support Opensource <support.opensource@diasemi.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: da7219: Drop no-op remove function
Message-ID: <20220530083616.xggbphc7ip7h2jr7@pengutronix.de>
References: <20220526204145.1725323-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lspq4dogz5vs3pik"
Content-Disposition: inline
In-Reply-To: <20220526204145.1725323-1-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: alsa-devel@alsa-project.org, kernel@pengutronix.de
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


--lspq4dogz5vs3pik
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 26, 2022 at 10:41:45PM +0200, Uwe Kleine-K=F6nig wrote:
> A remove callback that just returns 0 is equivalent to no callback at all
> as can be seen in i2c_device_remove(). So simplify accordingly.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
>  sound/soc/codecs/da7219.c | 6 ------
>  1 file changed, 6 deletions(-)
>=20
> diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
> index c7493549a9a5..7df18a2c36b9 100644
> --- a/sound/soc/codecs/da7219.c
> +++ b/sound/soc/codecs/da7219.c
> @@ -2694,11 +2694,6 @@ static int da7219_i2c_probe(struct i2c_client *i2c,
>  	return ret;
>  }
> =20
> -static int da7219_i2c_remove(struct i2c_client *client)
> -{
> -	return 0;
> -}
> -
>  static const struct i2c_device_id da7219_i2c_id[] =3D {
>  	{ "da7219", },
>  	{ }
> @@ -2712,7 +2707,6 @@ static struct i2c_driver da7219_i2c_driver =3D {
>  		.acpi_match_table =3D ACPI_PTR(da7219_acpi_match),
>  	},
>  	.probe		=3D da7219_i2c_probe,
> -	.remove		=3D da7219_i2c_remove,
>  	.id_table	=3D da7219_i2c_id,
>  };

This patch conflicts with 89be5dc60d67 ("ASoC: da[79]*: use simple i2c
probe function"), the trivial(?) conflict resolution is:

diff --cc sound/soc/codecs/da7219.c
index 7fdef38ed8cd,7df18a2c36b9..000000000000
--- a/sound/soc/codecs/da7219.c
+++ b/sound/soc/codecs/da7219.c
@@@ -2710,8 -2706,7 +2705,7 @@@ static struct i2c_driver da7219_i2c_dri
  		.of_match_table =3D of_match_ptr(da7219_of_match),
  		.acpi_match_table =3D ACPI_PTR(da7219_acpi_match),
  	},
 -	.probe		=3D da7219_i2c_probe,
 +	.probe_new	=3D da7219_i2c_probe,
- 	.remove		=3D da7219_i2c_remove,
  	.id_table	=3D da7219_i2c_id,
  };
 =20
Please tell me if I should resend the patch rebased to
sound.git/for-next (or 5.19-rc1 once that's out). The same applies to:

	ASoC: lm49453: Drop no-op remove function
	ASoC: da732x: Drop no-op remove function
	ASoC: ak4642: Drop no-op remove function

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--lspq4dogz5vs3pik
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmKUgf0ACgkQwfwUeK3K
7AmfRQf/ULtVAZIs5W638d5VSScJU7uj1zkR/AANtlwg1M4pz+7sxBmQ2mXY4EPo
RdeBe0C5ei9IaAqaDih6h73Q4hHxiSX8NeiNy5bvv+SPOjUq5+m8KhFPDAEVZ8eN
nm6YZSPONES8+3RZzswcYYZSPD4DVcTKesaXLs59o2Z7LN4+N/fTaHsGMVxE8JSW
KcFuTU7Ng/FRkGIzl10HnOPCrd9+TQ61lxVLMKuws4ve1yDXgLPiQkZEhY2BUI4i
CWZ6zLK4CobhiO47qqWq5rl8fRexuLpYL4MnXHro8Ls1CbX47wHK+NRGKIxCfgI4
No7oEen6Wv3SBiQtruOP6XQZpPNw9A==
=lEd8
-----END PGP SIGNATURE-----

--lspq4dogz5vs3pik--
