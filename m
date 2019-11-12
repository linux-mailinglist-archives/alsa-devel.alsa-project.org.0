Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93042F95BD
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2019 17:35:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04A681666;
	Tue, 12 Nov 2019 17:34:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04A681666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573576547;
	bh=C++XM50GDd8TypAp/joodAjJBJAfEHq5okF5hDvpQqU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cwOaseCnWCdy14+Srh1QJ1A68l1ecrpB96VE/4RmrLRcy1VMOePJJ+iUPdBLcUvJh
	 ePwZS4TLJkLS2ZCnAUVm0q7A+svEUWLzl7/jj+chHF+nr/VgwQS0GzsdwXGPIwnqrX
	 2uCW+ugaHxMvZJjTPI2Y6we1NFuWVcVMWZb4kZHg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E2CEF8044C;
	Tue, 12 Nov 2019 17:34:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95228F80483; Tue, 12 Nov 2019 16:24:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0EA6F80275
 for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2019 16:24:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0EA6F80275
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 7101229047A
Received: by earth.universe (Postfix, from userid 1000)
 id 85D0B3C0C78; Tue, 12 Nov 2019 16:24:11 +0100 (CET)
Date: Tue, 12 Nov 2019 16:24:11 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Message-ID: <20191112152411.d626b34wmvkzpqjf@earth.universe>
References: <20191108174843.11227-1-sebastian.reichel@collabora.com>
 <20191108174843.11227-2-sebastian.reichel@collabora.com>
 <AM5PR1001MB09942731970692EE42BE9CB180740@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <AM5PR1001MB09942731970692EE42BE9CB180740@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
User-Agent: NeoMutt/20180716
X-Mailman-Approved-At: Tue, 12 Nov 2019 17:34:00 +0100
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Support Opensource <Support.Opensource@diasemi.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 "kernel@collabora.com" <kernel@collabora.com>
Subject: Re: [alsa-devel] [PATCHv1 1/5] ASoC: da7213: Add regulator support
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
Content-Type: multipart/mixed; boundary="===============5637897916863445571=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5637897916863445571==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="herodyak6v63emyg"
Content-Disposition: inline


--herodyak6v63emyg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 11, 2019 at 02:07:46PM +0000, Adam Thomson wrote:
> On 08 November 2019 17:49, Sebastian Reichel wrote:
>=20
> > This adds support for most regulators of da7212 for improved
> > power management. The only thing skipped was the speaker supply,
> > which has some undocumented dependencies. It's supposed to be
> > either always-enabled or always-disabled.
> >=20
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > ---
> >  .../devicetree/bindings/sound/da7213.txt      |  4 ++
> >  sound/soc/codecs/da7213.c                     | 72 +++++++++++++++++++
> >  sound/soc/codecs/da7213.h                     |  2 +
> >  3 files changed, 78 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/sound/da7213.txt
> > b/Documentation/devicetree/bindings/sound/da7213.txt
> > index 759bb04e0283..cc8200b7d748 100644
> > --- a/Documentation/devicetree/bindings/sound/da7213.txt
> > +++ b/Documentation/devicetree/bindings/sound/da7213.txt
> > @@ -21,6 +21,10 @@ Optional properties:
> >  - dlg,dmic-clkrate : DMIC clock frequency (Hz).
> >  	[<1500000>, <3000000>]
> >=20
> > + - VDDA-supply : Regulator phandle for Analogue power supply
> > + - VDDMIC-supply : Regulator phandle for Mic Bias
> > + - VDDIO-supply : Regulator phandle for I/O power supply
> > +
> >  =3D=3D=3D=3D=3D=3D
> >=20
> >  Example:
> > diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
> > index aff306bb58df..36e5a7c9ac33 100644
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
> > @@ -806,6 +807,12 @@ static int da7213_dai_event(struct
> > snd_soc_dapm_widget *w,
> >   */
> >=20
> >  static const struct snd_soc_dapm_widget da7213_dapm_widgets[] =3D {
> > +	/*
> > +	 * Power Supply
> > +	 */
> > +	SND_SOC_DAPM_REGULATOR_SUPPLY("VDDA", 0, 0),
>=20
> Having spoken with our HW team, this will cause a POR in the device so we=
 can't
> just enable/disable VDD_A supply. Needs to present at all times. How are =
you
> verifying this?

Ok. The system, that I used for testing shared a regulator
for VDDIO and VDDA. I suppose this needs to be moved next
to enabling VDDIO then.

> > +	SND_SOC_DAPM_REGULATOR_SUPPLY("VDDMIC", 0, 0),
> > +
> >  	/*
> >  	 * Input & Output
> >  	 */
> > @@ -931,7 +938,16 @@ static const struct snd_soc_dapm_widget
> > da7213_dapm_widgets[] =3D {
> >  static const struct snd_soc_dapm_route da7213_audio_map[] =3D {
> >  	/* Dest       Connecting Widget    source */
> >=20
> > +	/* Main Power Supply */
> > +	{"DAC Left", NULL, "VDDA"},
> > +	{"DAC Right", NULL, "VDDA"},
> > +	{"ADC Left", NULL, "VDDA"},
> > +	{"ADC Right", NULL, "VDDA"},
> > +
> >  	/* Input path */
> > +	{"Mic Bias 1", NULL, "VDDMIC"},
> > +	{"Mic Bias 2", NULL, "VDDMIC"},
> > +
> >  	{"MIC1", NULL, "Mic Bias 1"},
> >  	{"MIC2", NULL, "Mic Bias 2"},
> >=20
> > @@ -1691,6 +1707,8 @@ static int da7213_probe(struct snd_soc_component
> > *component)
> >  {
> >  	struct da7213_priv *da7213 =3D
> > snd_soc_component_get_drvdata(component);
> >=20
> > +	pm_runtime_get_sync(component->dev);
> > +
> >  	/* Default to using ALC auto offset calibration mode. */
> >  	snd_soc_component_update_bits(component, DA7213_ALC_CTRL1,
> >  			    DA7213_ALC_CALIB_MODE_MAN, 0);
> > @@ -1811,6 +1829,8 @@ static int da7213_probe(struct snd_soc_component
> > *component)
> >  				    DA7213_DMIC_CLK_RATE_MASK, dmic_cfg);
> >  	}
> >=20
> > +	pm_runtime_put_sync(component->dev);
> > +
> >  	/* Check if MCLK provided */
> >  	da7213->mclk =3D devm_clk_get(component->dev, "mclk");
> >  	if (IS_ERR(da7213->mclk)) {
> > @@ -1848,6 +1868,12 @@ static const struct regmap_config
> > da7213_regmap_config =3D {
> >  	.cache_type =3D REGCACHE_RBTREE,
> >  };
> >=20
> > +static void da7213_power_off(void *data)
> > +{
> > +	struct da7213_priv *da7213 =3D data;
> > +	regulator_disable(da7213->vddio);
> > +}
> > +
> >  static int da7213_i2c_probe(struct i2c_client *i2c,
> >  			    const struct i2c_device_id *id)
> >  {
> > @@ -1860,6 +1886,18 @@ static int da7213_i2c_probe(struct i2c_client *i=
2c,
> >=20
> >  	i2c_set_clientdata(i2c, da7213);
> >=20
> > +	da7213->vddio =3D devm_regulator_get(&i2c->dev, "VDDIO");
> > +	if (IS_ERR(da7213->vddio))
> > +		return PTR_ERR(da7213->vddio);
> > +
> > +	ret =3D regulator_enable(da7213->vddio);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	ret =3D devm_add_action_or_reset(&i2c->dev, da7213_power_off,
> > da7213);
> > +	if (ret < 0)
> > +		return ret;
>=20
> We're seemingly leaving the VDDIO regulator enabled on failure, unless I'm
> missing some magic somewhere?

If regulator_enable fails, the regulator is not enabled. If devm_add_action=
_or_reset
fails, it will call da7213_power_off().

> >  	da7213->regmap =3D devm_regmap_init_i2c(i2c, &da7213_regmap_config);
> >  	if (IS_ERR(da7213->regmap)) {
> >  		ret =3D PTR_ERR(da7213->regmap);
> > @@ -1867,6 +1905,11 @@ static int da7213_i2c_probe(struct i2c_client *i=
2c,
> >  		return ret;
> >  	}
> >=20
> > +	pm_runtime_set_autosuspend_delay(&i2c->dev, 100);
> > +	pm_runtime_use_autosuspend(&i2c->dev);
> > +	pm_runtime_set_active(&i2c->dev);
> > +	pm_runtime_enable(&i2c->dev);
> > +
> >  	ret =3D devm_snd_soc_register_component(&i2c->dev,
> >  			&soc_component_dev_da7213, &da7213_dai, 1);
> >  	if (ret < 0) {
> > @@ -1876,6 +1919,34 @@ static int da7213_i2c_probe(struct i2c_client *i=
2c,
> >  	return ret;
> >  }
> >=20
> > +static int __maybe_unused da7213_runtime_suspend(struct device *dev)
> > +{
> > +	struct da7213_priv *da7213 =3D dev_get_drvdata(dev);
> > +
> > +	regcache_cache_only(da7213->regmap, true);
> > +	regcache_mark_dirty(da7213->regmap);
> > +	regulator_disable(da7213->vddio);
> > +
> > +	return 0;
> > +}
> > +
> > +static int __maybe_unused da7213_runtime_resume(struct device *dev)
> > +{
> > +	struct da7213_priv *da7213 =3D dev_get_drvdata(dev);
> > +	int ret;
> > +
> > +	ret =3D regulator_enable(da7213->vddio);
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
> > @@ -1888,6 +1959,7 @@ static struct i2c_driver da7213_i2c_driver =3D {
> >  		.name =3D "da7213",
> >  		.of_match_table =3D of_match_ptr(da7213_of_match),
> >  		.acpi_match_table =3D ACPI_PTR(da7213_acpi_match),
> > +		.pm =3D &da7213_pm,
> >  	},
> >  	.probe		=3D da7213_i2c_probe,
> >  	.id_table	=3D da7213_i2c_id,
> > diff --git a/sound/soc/codecs/da7213.h b/sound/soc/codecs/da7213.h
> > index 3250a3821fcc..97a250ea39e6 100644
> > --- a/sound/soc/codecs/da7213.h
> > +++ b/sound/soc/codecs/da7213.h
> > @@ -12,6 +12,7 @@
> >=20
> >  #include <linux/clk.h>
> >  #include <linux/regmap.h>
> > +#include <linux/regulator/consumer.h>
> >  #include <sound/da7213.h>
> >=20
> >  /*
> > @@ -524,6 +525,7 @@ enum da7213_sys_clk {
> >  /* Codec private data */
> >  struct da7213_priv {
> >  	struct regmap *regmap;
> > +	struct regulator *vddio;
> >  	struct clk *mclk;
> >  	unsigned int mclk_rate;
> >  	int clk_src;

-- Sebastian

--herodyak6v63emyg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl3KzpsACgkQ2O7X88g7
+pp3dBAAjwY8s+vadK2wX4lKRPKnQdX7lYpbRPeo5qPNiyo3nstCRZvaEX9LDkH2
B7nVLHL0/+88vcElg0Zhk93YmLNrNQGuDPcnREN9cs6/zvEe1z/rdzIghSeXRWVy
tdZbveqmGES0m+62iIaTN8Ffvbnv7/QC89x2L8jRjTWTsfAeUv0nYhZy4X8JSo07
e84mwPyieuJJtdbjGMCCqYL3K/5floyv7Z+LmCznIEL59oWg9ppVvAnciNjNZqxT
Jw/m0E4g3BSsZKunj1QDN7jQnb98uQzMd/5g28UQoD5Pi6nroMfxKrERd4PELTYl
HYHJ8a0VjkuEc9GHl7MXM9OIK7TaOe/izK6S41/EhTTS1ucQTESJcORtb/Eyzs4V
5u2tcBcqS3RyJmS11rDGiIyiSNK9mGuZMIufqurCuANk5RFl+diLRqCTx5H7dxj9
507nFl+iOsCOa3sl5sw/beMi74DMsDK/Oo79efJzbljLfEPNY2sUzdaChT+78QVv
MmSqqnNP3U0bQzC4Jit6tKqdVKqkLLVX5oVI5vyWy9KMK2VS/XcDiBDR/YFHZD+U
Vlk/emvRjwLNSms2zRt9Zi+ErE5GOWrqmG1NKtsLzQnw4WpmuttNx2EEf+kHAt9p
5F4zd1o/CT8C58b5YakR6MA3rXXr9VJn8tW1deeXmPynOnKEXZQ=
=8xPj
-----END PGP SIGNATURE-----

--herodyak6v63emyg--

--===============5637897916863445571==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5637897916863445571==--
