Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F90B107646
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Nov 2019 18:11:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC9D2846;
	Fri, 22 Nov 2019 18:10:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC9D2846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574442699;
	bh=ywYWRwPbrmDNT7M+j0z0fVbuTd+s1HTY6HgyatdE/HY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c14Es4lnDRaf+FhoEg7uYPI13ftEBhyzd+NQkRGT1d2E7VIXNyHQcOImcHZJXdle1
	 Qb3vWHzPXV5CyrP/kM6HKW2LajY85M85q3BVPmrcbOhJ93SQiqyAYdT93jBviB4s7E
	 xN+gG+aaU7+d5seVxF0GLRhMW7oyELzU9jWXODVY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73A69F8013F;
	Fri, 22 Nov 2019 18:09:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17825F80140; Fri, 22 Nov 2019 18:09:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,
 RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65757F800EF
 for <alsa-devel@alsa-project.org>; Fri, 22 Nov 2019 18:09:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65757F800EF
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 0139628FC9C
Received: by earth.universe (Postfix, from userid 1000)
 id E1EB43C0C71; Fri, 22 Nov 2019 18:09:46 +0100 (CET)
Date: Fri, 22 Nov 2019 18:09:46 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Message-ID: <20191122170946.kbodf45wa24jnz2n@earth.universe>
References: <20191120152406.2744-1-sebastian.reichel@collabora.com>
 <20191120152406.2744-3-sebastian.reichel@collabora.com>
 <AM5PR1001MB09945AE319B4ED33C193ABE9804E0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <AM5PR1001MB09945AE319B4ED33C193ABE9804E0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Support Opensource <Support.Opensource@diasemi.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 "kernel@collabora.com" <kernel@collabora.com>
Subject: Re: [alsa-devel] [PATCHv2 2/6] ASoC: da7213: Add regulator support
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
Content-Type: multipart/mixed; boundary="===============3419240049367347544=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3419240049367347544==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gk55dsxwjd3b4ywe"
Content-Disposition: inline


--gk55dsxwjd3b4ywe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Nov 21, 2019 at 09:15:02PM +0000, Adam Thomson wrote:
> On 20 November 2019 15:24, Sebastian Reichel wrote:
>=20
> > This adds support for most regulators of da7212 for improved
> > power management. The only thing skipped was the speaker supply,
> > which has some undocumented dependencies. It's supposed to be
> > either always-enabled or always-disabled.
> >
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > ---
> >  .../devicetree/bindings/sound/da7213.txt      |  4 +
> >  sound/soc/codecs/da7213.c                     | 79 ++++++++++++++++++-
> >  sound/soc/codecs/da7213.h                     |  9 +++
> >  3 files changed, 91 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/da7213.txt
> > b/Documentation/devicetree/bindings/sound/da7213.txt
> > index 759bb04e0283..cc8200b7d748 100644
> > --- a/Documentation/devicetree/bindings/sound/da7213.txt
> > +++ b/Documentation/devicetree/bindings/sound/da7213.txt
> > @@ -21,6 +21,10 @@ Optional properties:
> >  - dlg,dmic-clkrate : DMIC clock frequency (Hz).
> >  	[<1500000>, <3000000>]
> >
> > + - VDDA-supply : Regulator phandle for Analogue power supply
> > + - VDDMIC-supply : Regulator phandle for Mic Bias
> > + - VDDIO-supply : Regulator phandle for I/O power supply
> > +
> >  =3D=3D=3D=3D=3D=3D
> >
> >  Example:
> > diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
> > index aff306bb58df..0359249118d0 100644
> > --- a/sound/soc/codecs/da7213.c
> > +++ b/sound/soc/codecs/da7213.c
> > @@ -19,6 +19,7 @@
> >  #include <linux/module.h>
> >  #include <sound/pcm.h>
> >  #include <sound/pcm_params.h>
> > +#include <linux/pm_runtime.h>
> >  #include <sound/soc.h>
> >  #include <sound/initval.h>
> >  #include <sound/tlv.h>
> > @@ -806,6 +807,11 @@ static int da7213_dai_event(struct
> > snd_soc_dapm_widget *w,
> >   */
> >
> >  static const struct snd_soc_dapm_widget da7213_dapm_widgets[] =3D {
> > +	/*
> > +	 * Power Supply
> > +	 */
> > +	SND_SOC_DAPM_REGULATOR_SUPPLY("VDDMIC", 0, 0),
> > +
> >  	/*
> >  	 * Input & Output
> >  	 */
> > @@ -932,6 +938,9 @@ static const struct snd_soc_dapm_route
> > da7213_audio_map[] =3D {
> >  	/* Dest       Connecting Widget    source */
> >
> >  	/* Input path */
> > +	{"Mic Bias 1", NULL, "VDDMIC"},
> > +	{"Mic Bias 2", NULL, "VDDMIC"},
> > +
> >  	{"MIC1", NULL, "Mic Bias 1"},
> >  	{"MIC2", NULL, "Mic Bias 2"},
> >
> > @@ -1691,6 +1700,8 @@ static int da7213_probe(struct snd_soc_component
> > *component)
> >  {
> >  	struct da7213_priv *da7213 =3D
> > snd_soc_component_get_drvdata(component);
> >
> > +	pm_runtime_get_sync(component->dev);
>=20
> It seems that this function can return errors, although I do see lots of
> instances of this being called where the return value isn't checked. Not =
had
> time to walk the code fully but are we sure no errors are going to happen=
 here?

In this case, the runtime PM is already enabled because of
pm_runtime_set_active() being called previously. So this only
increases the usage counter.

> > +
> >  	/* Default to using ALC auto offset calibration mode. */
> >  	snd_soc_component_update_bits(component, DA7213_ALC_CTRL1,
> >  			    DA7213_ALC_CALIB_MODE_MAN, 0);
> > @@ -1811,6 +1822,8 @@ static int da7213_probe(struct snd_soc_component
> > *component)
> >  				    DA7213_DMIC_CLK_RATE_MASK, dmic_cfg);
> >  	}
> >
> > +	pm_runtime_put_sync(component->dev);
>=20
> Same question here.

da7213_runtime_suspend() always returns 0.

> > +
> >  	/* Check if MCLK provided */
> >  	da7213->mclk =3D devm_clk_get(component->dev, "mclk");
> >  	if (IS_ERR(da7213->mclk)) {
> > @@ -1848,11 +1861,22 @@ static const struct regmap_config
> > da7213_regmap_config =3D {
> >  	.cache_type =3D REGCACHE_RBTREE,
> >  };
> >
> > +static void da7213_power_off(void *data)
> > +{
> > +	struct da7213_priv *da7213 =3D data;
> > +	regulator_bulk_disable(DA7213_NUM_SUPPLIES, da7213->supplies);
> > +}
> > +
> > +static const char *da7213_supply_names[DA7213_NUM_SUPPLIES] =3D {
> > +	[DA7213_SUPPLY_VDDA] =3D "VDDA",
> > +	[DA7213_SUPPLY_VDDIO] =3D "VDDIO",
> > +};
> > +
> >  static int da7213_i2c_probe(struct i2c_client *i2c,
> >  			    const struct i2c_device_id *id)
> >  {
> >  	struct da7213_priv *da7213;
> > -	int ret;
> > +	int i, ret;
> >
> >  	da7213 =3D devm_kzalloc(&i2c->dev, sizeof(*da7213), GFP_KERNEL);
> >  	if (!da7213)
> > @@ -1860,6 +1884,25 @@ static int da7213_i2c_probe(struct i2c_client *i=
2c,
> >
> >  	i2c_set_clientdata(i2c, da7213);
> >
> > +	/* Get required supplies */
> > +	for (i =3D 0; i < DA7213_NUM_SUPPLIES; ++i)
> > +		da7213->supplies[i].supply =3D da7213_supply_names[i];
> > +
> > +	ret =3D devm_regulator_bulk_get(&i2c->dev, DA7213_NUM_SUPPLIES,
> > +				      da7213->supplies);
> > +	if (ret) {
> > +		dev_err(&i2c->dev, "Failed to get supplies: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	ret =3D regulator_bulk_enable(DA7213_NUM_SUPPLIES, da7213-
> > >supplies);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	ret =3D devm_add_action_or_reset(&i2c->dev, da7213_power_off,
> > da7213);
> > +	if (ret < 0)
> > +		return ret;
> > +
> >  	da7213->regmap =3D devm_regmap_init_i2c(i2c, &da7213_regmap_config);
> >  	if (IS_ERR(da7213->regmap)) {
> >  		ret =3D PTR_ERR(da7213->regmap);
> > @@ -1867,6 +1910,11 @@ static int da7213_i2c_probe(struct i2c_client *i=
2c,
> >  		return ret;
> >  	}
> >
> > +	pm_runtime_set_autosuspend_delay(&i2c->dev, 100);
> > +	pm_runtime_use_autosuspend(&i2c->dev);
> > +	pm_runtime_set_active(&i2c->dev);
>=20
> Again this can return an error. Are we certain this won't fail?

This only provides the information, that the device is running. The
parent might be affected, but that is running anyways since we are
probing a child device.

> > +	pm_runtime_enable(&i2c->dev);
> > +
> >  	ret =3D devm_snd_soc_register_component(&i2c->dev,
> >  			&soc_component_dev_da7213, &da7213_dai, 1);
> >  	if (ret < 0) {
> > @@ -1876,6 +1924,34 @@ static int da7213_i2c_probe(struct i2c_client *i=
2c,
> >  	return ret;
> >  }
> >
> > +static int __maybe_unused da7213_runtime_suspend(struct device *dev)
> > +{
> > +	struct da7213_priv *da7213 =3D dev_get_drvdata(dev);
> > +
> > +	regcache_cache_only(da7213->regmap, true);
> > +	regcache_mark_dirty(da7213->regmap);
> > +	regulator_bulk_disable(DA7213_NUM_SUPPLIES, da7213->supplies);
> > +
> > +	return 0;
> > +}
> > +
> > +static int __maybe_unused da7213_runtime_resume(struct device *dev)
> > +{
> > +	struct da7213_priv *da7213 =3D dev_get_drvdata(dev);
> > +	int ret;
> > +
> > +	ret =3D regulator_bulk_enable(DA7213_NUM_SUPPLIES, da7213-
> > >supplies);
> > +	if (ret < 0)
> > +		return ret;
> > +	regcache_cache_only(da7213->regmap, false);
> > +	regcache_sync(da7213->regmap);
> > +	return 0;
> > +}
> > +
> > +static const struct dev_pm_ops da7213_pm =3D {
> > +	SET_RUNTIME_PM_OPS(da7213_runtime_suspend,
> > da7213_runtime_resume, NULL)
> > +};
> > +
> >  static const struct i2c_device_id da7213_i2c_id[] =3D {
> >  	{ "da7213", 0 },
> >  	{ }
> > @@ -1888,6 +1964,7 @@ static struct i2c_driver da7213_i2c_driver =3D {
> >  		.name =3D "da7213",
> >  		.of_match_table =3D of_match_ptr(da7213_of_match),
> >  		.acpi_match_table =3D ACPI_PTR(da7213_acpi_match),
> > +		.pm =3D &da7213_pm,
> >  	},
> >  	.probe		=3D da7213_i2c_probe,
> >  	.id_table	=3D da7213_i2c_id,
> > diff --git a/sound/soc/codecs/da7213.h b/sound/soc/codecs/da7213.h
> > index 3250a3821fcc..3890829dfb6e 100644
> > --- a/sound/soc/codecs/da7213.h
> > +++ b/sound/soc/codecs/da7213.h
> > @@ -12,6 +12,7 @@
> >
> >  #include <linux/clk.h>
> >  #include <linux/regmap.h>
> > +#include <linux/regulator/consumer.h>
> >  #include <sound/da7213.h>
> >
> >  /*
> > @@ -521,9 +522,17 @@ enum da7213_sys_clk {
> >  	DA7213_SYSCLK_PLL_32KHZ
> >  };
> >
> > +/* Regulators */
> > +enum da7213_supplies {
> > +	DA7213_SUPPLY_VDDA =3D 0,
> > +	DA7213_SUPPLY_VDDIO,
> > +	DA7213_NUM_SUPPLIES,
> > +};
> > +
> >  /* Codec private data */
> >  struct da7213_priv {
> >  	struct regmap *regmap;
> > +	struct regulator_bulk_data supplies[DA7213_NUM_SUPPLIES];
> >  	struct clk *mclk;
> >  	unsigned int mclk_rate;
> >  	int clk_src;
> > --
> > 2.24.0

--gk55dsxwjd3b4ywe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl3YFkUACgkQ2O7X88g7
+po30A//RCzD8tGjVb4d/G7dZdysRylbx7pg2UdoQzR3LORFcjK1Pi9cLaRERCIx
Uqcw2MhtCb97uIYDRTWRL9h5KNO3q9szfnrbkQfvmxCvm5gRUqHWaPDH3yORB0Dc
7rQClpdmm8IFWMNYlhL0m9R+3bmQ4973NsK/c6d9F24SB/wFd5RWhw+/9AjeRFOz
2rj+840+KZJyz6RFCt8LhDIPyUi1MLxLGR924/itBUFZmqhNg34jr1eCGKD7UwFK
h8qHMQdJ8Cc/XCTnLEbt4ndxoR2wAN+JamYefT30+GD+ghtoORHy9MfSpWZlfz69
/3lGnX/VJ1/Md0HxTEWxFdQRkXAt9hzL0MpKiB++muyjyvExIkxv8esFDEm5R2VX
TGFPcdR/TXAwi8ZX/MKrPulcRC9d33tyMninTOCztY+JEJ6mcP+WV2RGQQHlvjg7
2gdOiNhUHveePebWhArJ6czAKIQIEjZLA0ka2mjOgMxafX/ODA34PhZ0K3YmAd2b
8ztT//UYV+XM9vo6HPuqs/8auaX7zkoasHliZR8aijxGG66LMf66emCxuRRoAMXS
vkQZzOCRyy0E/As0H4cjlR/4MbTpxpltszRBmmjYt6s8JrcGUr5xi6WArOeyhP43
bXYYYrT1iRQ9ZqG9+TB3+RILy4NGuywmsl37wPN57t8PaqjCX3I=
=1dJK
-----END PGP SIGNATURE-----

--gk55dsxwjd3b4ywe--

--===============3419240049367347544==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3419240049367347544==--
