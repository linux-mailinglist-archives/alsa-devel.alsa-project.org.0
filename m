Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F52149258E
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jan 2022 13:17:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2023E17D2;
	Tue, 18 Jan 2022 13:16:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2023E17D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642508221;
	bh=TeasRQNWTr+4R1mqfR2HEtxKoElq5Rerwp22+t8NNQ0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KLV6Q0cLDPlXOdjw7wE9pzRhdalqOCMYh3kVXI8MgWw9EPHIdoQgcrRbD0WhxfW3G
	 nat2JSkuJTt15iTL/zAkCjxqD/sP1qNHNE59GSgcBx8OsETzVMozTSK4Kov+r2sfmt
	 kfXkB0XJbQPsxTAdbr56NjKp0PUPpsGygNzeG8Qk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79307F80100;
	Tue, 18 Jan 2022 13:15:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 731B3F8023B; Tue, 18 Jan 2022 13:15:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58187F80100
 for <alsa-devel@alsa-project.org>; Tue, 18 Jan 2022 13:15:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58187F80100
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n9nOg-0002FJ-HV; Tue, 18 Jan 2022 13:15:34 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1n9nOd-00Azx0-Ru; Tue, 18 Jan 2022 13:15:31 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n9nOc-0004cn-HW; Tue, 18 Jan 2022 13:15:30 +0100
Date: Tue, 18 Jan 2022 13:15:30 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Lucas tanure <tanureal@opensource.cirrus.com>
Subject: Re: [PATCH] ALSA: hda: cs35l41: Make cs35l41_hda_remove() return void
Message-ID: <20220118121530.mzeint3qjbvyqfsx@pengutronix.de>
References: <20220117220055.120955-1-u.kleine-koenig@pengutronix.de>
 <57c1382b-e21a-6294-5b17-3d4b51f1f1ba@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cuiejjiyo2tefqqw"
Content-Disposition: inline
In-Reply-To: <57c1382b-e21a-6294-5b17-3d4b51f1f1ba@opensource.cirrus.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, David Rhodes <david.rhodes@cirrus.com>,
 kernel@pengutronix.de, James Schulman <james.schulman@cirrus.com>
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


--cuiejjiyo2tefqqw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 18, 2022 at 11:59:15AM +0000, Lucas tanure wrote:
> On 1/17/22 22:00, Uwe Kleine-K=F6nig wrote:
> > Up to now cs35l41_hda_remove() returns zero unconditionally. Make it
> > return void instead which makes it easier to see in the callers that
> > there is no error to handle.
> >=20
> > Also the return value of i2c and spi remove callbacks is ignored anyway.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > ---
> >   sound/pci/hda/cs35l41_hda.c     | 4 +---
> >   sound/pci/hda/cs35l41_hda.h     | 2 +-
> >   sound/pci/hda/cs35l41_hda_i2c.c | 4 +++-
> >   sound/pci/hda/cs35l41_hda_spi.c | 4 +++-
> >   4 files changed, 8 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
> > index 30b40d865863..ce3782826830 100644
> > --- a/sound/pci/hda/cs35l41_hda.c
> > +++ b/sound/pci/hda/cs35l41_hda.c
> > @@ -508,7 +508,7 @@ int cs35l41_hda_probe(struct device *dev, const cha=
r *device_name, int id, int i
> >   }
> >   EXPORT_SYMBOL_GPL(cs35l41_hda_probe);
> > -int cs35l41_hda_remove(struct device *dev)
> > +void cs35l41_hda_remove(struct device *dev)
> >   {
> >   	struct cs35l41_hda *cs35l41 =3D dev_get_drvdata(dev);
> > @@ -517,8 +517,6 @@ int cs35l41_hda_remove(struct device *dev)
> >   	if (!cs35l41->vspk_always_on)
> >   		gpiod_set_value_cansleep(cs35l41->reset_gpio, 0);
> >   	gpiod_put(cs35l41->reset_gpio);
> > -
> > -	return 0;
> >   }
> >   EXPORT_SYMBOL_GPL(cs35l41_hda_remove);
> > diff --git a/sound/pci/hda/cs35l41_hda.h b/sound/pci/hda/cs35l41_hda.h
> > index 76c69a8a22f6..8ecaddf5f132 100644
> > --- a/sound/pci/hda/cs35l41_hda.h
> > +++ b/sound/pci/hda/cs35l41_hda.h
> > @@ -64,6 +64,6 @@ struct cs35l41_hda {
> >   int cs35l41_hda_probe(struct device *dev, const char *device_name, in=
t id, int irq,
> >   		      struct regmap *regmap);
> > -int cs35l41_hda_remove(struct device *dev);
> > +void cs35l41_hda_remove(struct device *dev);
> >   #endif /*__CS35L41_HDA_H__*/
> > diff --git a/sound/pci/hda/cs35l41_hda_i2c.c b/sound/pci/hda/cs35l41_hd=
a_i2c.c
> > index 4a9462fb5c14..d4240b8ded10 100644
> > --- a/sound/pci/hda/cs35l41_hda_i2c.c
> > +++ b/sound/pci/hda/cs35l41_hda_i2c.c
> > @@ -32,7 +32,9 @@ static int cs35l41_hda_i2c_probe(struct i2c_client *c=
lt, const struct i2c_device
> >   static int cs35l41_hda_i2c_remove(struct i2c_client *clt)
> >   {
> > -	return cs35l41_hda_remove(&clt->dev);
> > +	cs35l41_hda_remove(&clt->dev);
> > +
> > +	return 0;
> >   }
> >   static const struct i2c_device_id cs35l41_hda_i2c_id[] =3D {
> > diff --git a/sound/pci/hda/cs35l41_hda_spi.c b/sound/pci/hda/cs35l41_hd=
a_spi.c
> > index 77426e96c58f..d63c487bc3a9 100644
> > --- a/sound/pci/hda/cs35l41_hda_spi.c
> > +++ b/sound/pci/hda/cs35l41_hda_spi.c
> > @@ -30,7 +30,9 @@ static int cs35l41_hda_spi_probe(struct spi_device *s=
pi)
> >   static int cs35l41_hda_spi_remove(struct spi_device *spi)
> >   {
> > -	return cs35l41_hda_remove(&spi->dev);
> > +	cs35l41_hda_remove(&spi->dev);
> > +
> > +	return 0;
> >   }
> >   static const struct spi_device_id cs35l41_hda_spi_id[] =3D {
> >=20
> > base-commit: 0c947b893d69231a9add855939da7c66237ab44f
>=20
> I don't see much point in this patch. The idea of the core driver is to
> concentrate as much as code as possible can, so the I2C and SPI driver are
> minimal.

How is the spi (or i2c) driver any bigger here? For now the core driver
has a feature (returning an error code, but always 0) that isn't used at
all. How is that any good?

The motivation for this patch is that I want to do this in the near
future:

	diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
	--- a/include/linux/spi/spi.h
	+++ b/include/linux/spi/spi.h
	@@ -280,7 +280,7 @@ struct spi_message;
	 struct spi_driver {
		const struct spi_device_id *id_table;
		int			(*probe)(struct spi_device *spi);
	-	int			(*remove)(struct spi_device *spi);
	+	void			(*remove)(struct spi_device *spi);
		void			(*shutdown)(struct spi_device *spi);
		struct device_driver	driver;
	 };

And as this has to touch all spi drivers in the same commit, I prefer
having only hunks like:

	-static int cs35l41_hda_spi_remove(struct spi_device *spi)
	+static void cs35l41_hda_spi_remove(struct spi_device *spi)
	 {
		cs35l41_hda_remove(&spi->dev);
	-
	-	return 0;
	 }
=20
which are obviously correct compared to

	-static int cs35l41_hda_spi_remove(struct spi_device *spi)
	+static void cs35l41_hda_spi_remove(struct spi_device *spi)
	 {
	- 	return cs35l41_hda_remove(&spi->dev);
	+	cs35l41_hda_remove(&spi->dev);
	 }

BTW, the long term plan is to do the same for i2c.=20

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--cuiejjiyo2tefqqw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmHmr18ACgkQwfwUeK3K
7AnvBgf/TciqqaS2Q5a+RkigHCugix4FHvtEpZxyLAzM7jGSZ2H93NKXkCKa3oVf
4oTR6CJuy54OYW/bIhL558/7DU/ahKI18GKk9p1YsGTTZuR7CIe8NS5obNB2c4Wc
OgZeMY37KF4znKEhkRkhXOtRJDDzK/hZQKK0/sppeOsbJyugSpUPs4b8okTMpO94
uNc0sSWrN2f13I5nQBtUMiKO9k2WMOUCxAkwC5j/29rP2GyU61kVlOGLL0xVpqdq
lq7Y0xqaaf8S4+onLeVfumMIU4v1XkZPGTQ86BipTOqrO7nqmvwYMnZDyHMinP3t
aepoN1hn1uqthbTq1+B2Wau+cVzIWw==
=ke50
-----END PGP SIGNATURE-----

--cuiejjiyo2tefqqw--
