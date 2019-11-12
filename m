Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9F7F95C0
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2019 17:36:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5915E1668;
	Tue, 12 Nov 2019 17:35:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5915E1668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573576593;
	bh=0xhIHD+ZX3FXrxQx+bn9Gb3gcza1UcpjxLLG+40/nyM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aC5L3on37EbrptQHRVM4gOJpNYb4ji25QTcUBqDeWTfXJ1c10cvKgazUvpR6dVhcy
	 eufYGAreAB1fHQs15Hsj22rhxqOXJOdtLLhS5CoVZBOG4T/BFKjh2YohdUwEapZplY
	 yckCsccsKGia2/ipX1gWRjTZa03tMcOG6t5zznRc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFC5DF8049C;
	Tue, 12 Nov 2019 17:34:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C6B1F80483; Tue, 12 Nov 2019 17:30:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8119AF80144
 for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2019 17:29:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8119AF80144
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 4558129064A
Received: by earth.universe (Postfix, from userid 1000)
 id D9F353C0C78; Tue, 12 Nov 2019 17:29:54 +0100 (CET)
Date: Tue, 12 Nov 2019 17:29:54 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Message-ID: <20191112162954.aac77rtfbl6mlut6@earth.universe>
References: <20191108174843.11227-1-sebastian.reichel@collabora.com>
 <20191108174843.11227-6-sebastian.reichel@collabora.com>
 <AM5PR1001MB099473C446536341366A70A680740@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <AM5PR1001MB099473C446536341366A70A680740@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
User-Agent: NeoMutt/20180716
X-Mailman-Approved-At: Tue, 12 Nov 2019 17:34:00 +0100
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Support Opensource <Support.Opensource@diasemi.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 "kernel@collabora.com" <kernel@collabora.com>
Subject: Re: [alsa-devel] [PATCHv1 5/5] ASoC: da7213: add default clock
	handling
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
Content-Type: multipart/mixed; boundary="===============3088824047191511583=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3088824047191511583==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="apjhnqdgp22efygn"
Content-Disposition: inline


--apjhnqdgp22efygn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 11, 2019 at 02:20:07PM +0000, Adam Thomson wrote:
> On 08 November 2019 17:49, Sebastian Reichel wrote:
>=20
> > This adds default clock/PLL configuration to the driver
> > for usage with generic drivers like simple-card for usage
> > with a fixed rate clock.
> >=20
> > Upstreaming this requires a good way to disable the automatic
> > clock handling for systems doing it manually to avoid breaking
> > existing setups.
> >=20
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > ---
> >  sound/soc/codecs/da7213.c | 34 +++++++++++++++++++++++++++++++++-
> >  sound/soc/codecs/da7213.h |  1 +
> >  2 files changed, 34 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
> > index 197609691525..a4ed382ddfc7 100644
> > --- a/sound/soc/codecs/da7213.c
> > +++ b/sound/soc/codecs/da7213.c
> > @@ -1163,6 +1163,8 @@ static int da7213_hw_params(struct
> > snd_pcm_substream *substream,
> >  			    struct snd_soc_dai *dai)
> >  {
> >  	struct snd_soc_component *component =3D dai->component;
> > +	struct da7213_priv *da7213 =3D
> > snd_soc_component_get_drvdata(component);
> > +	int freq =3D 0;
> >  	u8 dai_ctrl =3D 0;
> >  	u8 fs;
> >=20
> > @@ -1188,38 +1190,54 @@ static int da7213_hw_params(struct
> > snd_pcm_substream *substream,
> >  	switch (params_rate(params)) {
> >  	case 8000:
> >  		fs =3D DA7213_SR_8000;
> > +		freq =3D DA7213_PLL_FREQ_OUT_98304000;
> >  		break;
> >  	case 11025:
> >  		fs =3D DA7213_SR_11025;
> > +		freq =3D DA7213_PLL_FREQ_OUT_90316800;
> >  		break;
> >  	case 12000:
> >  		fs =3D DA7213_SR_12000;
> > +		freq =3D DA7213_PLL_FREQ_OUT_98304000;
> >  		break;
> >  	case 16000:
> >  		fs =3D DA7213_SR_16000;
> > +		freq =3D DA7213_PLL_FREQ_OUT_98304000;
> >  		break;
> >  	case 22050:
> >  		fs =3D DA7213_SR_22050;
> > +		freq =3D DA7213_PLL_FREQ_OUT_90316800;
> >  		break;
> >  	case 32000:
> >  		fs =3D DA7213_SR_32000;
> > +		freq =3D DA7213_PLL_FREQ_OUT_98304000;
> >  		break;
> >  	case 44100:
> >  		fs =3D DA7213_SR_44100;
> > +		freq =3D DA7213_PLL_FREQ_OUT_90316800;
> >  		break;
> >  	case 48000:
> >  		fs =3D DA7213_SR_48000;
> > +		freq =3D DA7213_PLL_FREQ_OUT_98304000;
> >  		break;
> >  	case 88200:
> >  		fs =3D DA7213_SR_88200;
> > +		freq =3D DA7213_PLL_FREQ_OUT_90316800;
> >  		break;
> >  	case 96000:
> >  		fs =3D DA7213_SR_96000;
> > +		freq =3D DA7213_PLL_FREQ_OUT_98304000;
> >  		break;
> >  	default:
> >  		return -EINVAL;
> >  	}
> >=20
> > +	/* setup PLL */
> > +	if (da7213->fixed_clk_auto) {
> > +		snd_soc_component_set_pll(component, 0,
> > DA7213_SYSCLK_PLL,
> > +					  da7213->mclk_rate, freq);
> > +	}
> > +
>=20
> Are we happy with the PLL being always enabled? Seems like a power drain,
> especially if you're using an MCLK which is a natural harmonic for the SR=
 in=20
> question in which case the PLL can be bypassed. Also the bias level funct=
ion in
> this driver will enable and disable the MCLK, if it has been provided, so=
 it's a
> bit strange to have the PLL enabled but it's clock source taken away.

So you are suggesting adding something like this to
da7213_set_bias_level()?

if (freq % da7213->mclk_rate =3D=3D 0)
    source =3D DA7213_SYSCLK_MCLK
else
    source =3D DA7213_SYSCLK_PLL
snd_soc_component_set_pll(component, 0, source, da7213->mclk_rate, freq);

> >  	snd_soc_component_update_bits(component, DA7213_DAI_CTRL,
> > DA7213_DAI_WORD_LENGTH_MASK,
> >  			    dai_ctrl);
> >  	snd_soc_component_write(component, DA7213_SR, fs);
> > @@ -1700,10 +1718,10 @@ static struct da7213_platform_data
> >  	return pdata;
> >  }
> >=20
> > -
> >  static int da7213_probe(struct snd_soc_component *component)
> >  {
> >  	struct da7213_priv *da7213 =3D
> > snd_soc_component_get_drvdata(component);
> > +	int ret;
> >=20
> >  	pm_runtime_get_sync(component->dev);
> >=20
> > @@ -1836,6 +1854,20 @@ static int da7213_probe(struct snd_soc_component
> > *component)
> >  			return PTR_ERR(da7213->mclk);
> >  		else
> >  			da7213->mclk =3D NULL;
> > +	} else {
> > +		/* Store clock rate for fixed clocks for automatic PLL setup */
> > +		ret =3D clk_prepare_enable(da7213->mclk);
> > +		if (ret) {
> > +			dev_err(component->dev, "Failed to enable mclk\n");
> > +			return ret;
> > +		}
>=20
> I've not gone through the clk framework code but surprised to see the nee=
d to
> enable a clock to retrieve it's rate.

/**
 * clk_get_rate - obtain the current clock rate (in Hz) for a clock source.
 *                This is only valid once the clock source has been enabled.
 * @clk: clock source
 */
unsigned long clk_get_rate(struct clk *clk);

Which makes sense for a non-fixed clock, which uses the same API.

> > +		da7213->mclk_rate =3D clk_get_rate(da7213->mclk);
> > +
> > +		clk_disable_unprepare(da7213->mclk);
> > +
> > +		/* assume fixed clock until set_sysclk() is being called */
> > +		da7213->fixed_clk_auto =3D true;
>=20
> I don't see any code where 'fixed_clk_auto' is set to false so it seems t=
hat
> previous operational usage is being broken here.

oops.

> >  	}
> >=20
> >  	return 0;
> > diff --git a/sound/soc/codecs/da7213.h b/sound/soc/codecs/da7213.h
> > index 97a250ea39e6..00aca0126cdb 100644
> > --- a/sound/soc/codecs/da7213.h
> > +++ b/sound/soc/codecs/da7213.h
> > @@ -532,6 +532,7 @@ struct da7213_priv {
> >  	bool master;
> >  	bool alc_calib_auto;
> >  	bool alc_en;
> > +	bool fixed_clk_auto;
> >  	struct da7213_platform_data *pdata;
> >  };
> >=20
> > --
> > 2.24.0.rc1
>=20

-- Sebastian

--apjhnqdgp22efygn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl3K3d8ACgkQ2O7X88g7
+ppe/w/+NNfpGUUIY83SxgZnAoEPqGHlitffk72hH8jOod5umEbyNBIO5m7QAluw
QiBgVetwFXJ547ETC6hZof4jwiKip2B+XKO2JFkiOnjUdkctOTjYgT6d5Kb2kg1K
tyEYg00vY9Ht+kRVrOANUCWA6XkB4aQHWQmT1Bpm+irl4ntG4xOwgFbUuqlhkh73
UA/bX4YFfnpGbA88BPp/2+nwER3I9xF4yG0eaRMVpsv4SKlHsSal1EeJZxc8Mbs7
kww7Eytw8NTCiv4NhCxzduY/97mR8YvPyKRr6aDDRF2n10O46zr5TtY0hFBmuZoy
aHX5IMkHhHFZygzhLHGrZiS4w/fbcf1AY96Nns1iajN2Wi4GDAVZjtFZR6VIxOp7
w8IL3OdVMXoksoa6zA2AUueuEUdI8yJUEY8WXaaJFW4fOKf0MWqENVes4sUDh+GA
FT9wEOyWeUV5KkX04goWDtNemZgIoxVGlCY/OSWtiGzlXVfSvVkAsin5uqb+Lo4h
WDMvzi1mVUWjr1pWIR7OFtQVR2ta3nqecRqAi2pTGprc0eAifFdz+Jn+BIsssDft
6+HqFzuUFF6XiZjbI+jVpjGmJS13ImEDadMM/Pq9t6D0SMs+j1zWWi0/G0ZWB5p9
v4lraEsoDRGf4qCWSkrUAqfnC3mi3zWprs+xjC7ur6DdTsNh3K8=
=ZaXT
-----END PGP SIGNATURE-----

--apjhnqdgp22efygn--

--===============3088824047191511583==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3088824047191511583==--
