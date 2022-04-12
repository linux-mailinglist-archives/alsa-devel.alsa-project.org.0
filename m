Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C44584FE3CE
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 16:29:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 548171896;
	Tue, 12 Apr 2022 16:28:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 548171896
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649773780;
	bh=YFfSozxKWGARm1Bg7MjORmKpuy/HiURkTcrA72/EgyQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ecDXTNO0BG2zsDFyzmGfxVOxzJ+M46EGbTl/GDW5vUZqX9hXmbrg7yjY8HEBeI9ui
	 Vz12msjf6ATmtH58Gune+DSPiyvOt29j5cTtmaJMWtJ2qOQGU9TcwYo1xVhM7r4dSy
	 K/crFzrHx1MnaY8JV+tXENvHrunHGpqrRAfNLt44=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96DB3F80095;
	Tue, 12 Apr 2022 16:28:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91DDCF80154; Tue, 12 Apr 2022 16:28:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A906F80095
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 16:28:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A906F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XXBSJepw"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id D8A95CE1EDF;
 Tue, 12 Apr 2022 14:28:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19390C385A5;
 Tue, 12 Apr 2022 14:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649773706;
 bh=YFfSozxKWGARm1Bg7MjORmKpuy/HiURkTcrA72/EgyQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XXBSJepwTb0+5fLCxlsppkVoAEz8/+Kan4rfKBzBg3Bj3jY7hdtq6LEIj5Wxk6QUc
 s9ldHinCuB98Max0sGB98xdSeDSlwJL2zUhR/1tclaZU9wOA4t4ClbtdqFDzAbQS69
 4AJQ6tRCiCCWzS2B9owloLb8rc2i9XcaXALYZtvIWIYSCOvJXj7fOxM9jBbNH4a/Vy
 6h5m0cj/TxrmxVykDAOd6hr5aa7CnwugtdJTQOlpvKPNbK7q4UiJjIMndv4btii/W0
 J4hmXgt8ONJ1tXFOQLAKOzU0q1hyIUcttwJ/FlkcD3QJMjIxtiPQKs8uznFqurrpQS
 Tuyv3/MJahtxQ==
Date: Tue, 12 Apr 2022 15:28:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Raphael-Xu <13691752556@139.com>
Subject: Re: [PATCH v8 3/3] update to support either TAS2764 or TAS2780
Message-ID: <YlWMhd+0OxXfBNZr@sirena.org.uk>
References: <20220411075652.2346-1-13691752556@139.com>
 <20220411075652.2346-3-13691752556@139.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hGQYvHqgzIq+1DSU"
Content-Disposition: inline
In-Reply-To: <20220411075652.2346-3-13691752556@139.com>
X-Cookie: Approved for veterans.
Cc: navada@ti.com, alsa-devel@alsa-project.org, shenghao-ding@ti.com,
 raphael-xu@ti.com
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


--hGQYvHqgzIq+1DSU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 11, 2022 at 03:56:52PM +0800, Raphael-Xu wrote:

>  static void tas27xx_reset(struct tas27xx_priv *tas27xx)
>  {
>  	if (tas27xx->reset_gpio) {
>  		gpiod_set_value_cansleep(tas27xx->reset_gpio, 0);
> -		msleep(20);
> +		usleep_range(2000, 2050);
>  		gpiod_set_value_cansleep(tas27xx->reset_gpio, 1);
> +		usleep_range(5000, 5050);
>  	}

This looks like an unrelated but good fix?  It should be a separate
patch.

> +			TAS27XX_PWR_CTRL,
> +			TAS27XX_PWR_CTRL_MASK,
> +			TAS27XX_PWR_CTRL_SHUTDOWN);
> +		if (ret >=3D 0) {
> +			tas27xx->mb_power_up =3D false;
> +			ret =3D 0;

mb_power_up seems to never be read - what purpose does it serve?

> -	return 0;
> +	if (ret < 0)
> +		pr_err("%s:%u:errCode:0x%0x:set BIAS error\n",
> +			__func__, __LINE__, ret);

Please use something like normal kernel logging styles - use dev_err()
like the rest of the function, no __func__ or __line__ and log the error
code as an integer.  In general please try to follow the kernel coding
style.

> +	mutex_unlock(&tas27xx->codec_lock);

It's not clear what this lock is protecting - it seems to be serialising
things that the core will already ensure don't run concurrently.  It at
least needs some documentation.  If it's not needed at all then a lot of
the diff could be dropped which would help a lot since as far as I can
see the bulk of the changes here are for adding this lock so it's hard
to see the device specific changes.  I'd also suggest pulling this out
into a separate patch.

> -	return 0;
> +EXIT:
> +	mutex_unlock(&tas27xx->codec_lock);

Normal coding style for labels is lower case.

>  {
> -	struct tas27xx_priv *tas27xx =3D
> +	struct tas27xx_priv *tas27xx =3D

This looks like an unneeded whitespace change?  There's a lot of these
where I can't spot what the actual change is...

>  }
> -#else
> -#define tas27xx_codec_suspend NULL
> -#define tas27xx_codec_resume NULL
>  #endif

This (and the related change below adding ifdefs for the use) are an
unrelated stylistic change and should be in a separate patch if they
make sense though I can't see any reason for them?  It's generally
considered better style not to need the ifdefs.

>  static int tas27xx_mute(struct snd_soc_dai *dai, int mute, int direction)
>  {
>  	struct snd_soc_component *component =3D dai->component;
> -	int ret;
> +	struct tas27xx_priv *tas27xx =3D
> +		snd_soc_component_get_drvdata(component);
> +	int ret =3D 0;
> +
> +	mutex_lock(&tas27xx->codec_lock);
> =20
> +	if (!mute) {
> +		ret =3D snd_soc_component_read(component,
> +			TAS27XX_CLK_CFG);
> +		if (ret < 0) {
> +			dev_err(tas27xx->dev,
> +				"%s:%u:errCode:0x%x read "
> +				"TAS27XX_CLK_CFG error\n",
> +				__func__, __LINE__, ret);
> +			goto EXIT;
> +		}
> +		if ((ret & TAS27XX_CLK_CFG_MASK) !=3D TAS27XX_CLK_CFG_ENABLE) {
> +			ret =3D snd_soc_component_update_bits(component,
> +				TAS27XX_CLK_CFG,
> +				TAS27XX_CLK_CFG_MASK,
> +				TAS27XX_CLK_CFG_ENABLE);
> +			if (ret < 0) {
> +				dev_err(tas27xx->dev,
> +					"%s:%u: Failed to CLK_CFG_ENABLE\n",
> +					__func__, __LINE__);
> +				goto EXIT;
> +			}
> +			usleep_range(3000, 3050);
> +		}

This clock configuration on mute is suprising - what's going on here?
It's an unusal thing to do.

>  		ret =3D snd_soc_component_update_bits(component,
> -					TAS27XX_TDM_CFG2,
> -					TAS27XX_TDM_CFG2_RXW_MASK,
> -					TAS27XX_TDM_CFG2_RXW_16BITS);
> +			TAS27XX_TDM_CFG2,
> +			TAS27XX_TDM_CFG2_RXW_MASK,
> +			TAS27XX_TDM_CFG2_RXW_16BITS);

Unrelated indentation change.

> @@ -522,26 +648,54 @@ static int tas27xx_codec_probe(struct snd_soc_compo=
nent *component)
>  		gpiod_set_value_cansleep(tas27xx->sdz_gpio, 1);
> =20
>  	tas27xx_reset(tas27xx);
> +	usleep_range(5000, 5050);

There's already a sleep in the reset function, why does this caller need
an extra one?

> -	ret =3D snd_soc_component_update_bits(tas27xx->component,
> -						TAS27XX_TDM_CFG5,
> +	ret =3D snd_soc_component_update_bits(component,

The changes to use a local component variable could probably usefully be
a separate patch, it obscures everything else that's going on.

> +static bool tas27xx_volatile(struct device *dev,
> +	unsigned int reg)

This should be a separate change probably, it looks like a bug fix.

> +{
> +	switch (reg) {
> +	case TAS27XX_SW_RST:
> +	case TAS27XX_PWR_CTRL:
> +	case TAS27XX_PAGE:

It's suprising that the power control and paging registers would be
volatile?  Same for some of the other registers...

> +	case TAS27XX_DVC:
> +	case TAS27XX_CHNL_0:
> +	case TAS27XX_TDM_CFG0:
> +	case TAS27XX_TDM_CFG1:
> +	case TAS27XX_TDM_CFG2:
> +	case TAS27XX_TDM_CFG3:
> +	case TAS27XX_TDM_CFG5:
> +	case TAS27XX_TDM_CFG6:

=2E..like the TDM configuration.

>  static const struct i2c_device_id tas27xx_i2c_id[] =3D {
>  	{ "tas2764", TAS2764},
> +	{ "tas2780", TAS2780},
>  	{ }

I don't see any runtime differences between the two variants - nothing
is keyed off the ID?

>  static const struct of_device_id tas27xx_of_match[] =3D {
>  	{ .compatible =3D "ti,tas2764" },
> +	{ .compatible =3D "ti,tas2780" },
>  	{},
>  };

If it were we'd need to also have something here.

--hGQYvHqgzIq+1DSU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJVjIQACgkQJNaLcl1U
h9A6Igf9FoRL/WaON2LP10laTcyuOIctrx2i1k2TzuVq6xTsJRLT4vBEGxhYRDP3
bRfPt/XtDmeHVgzOfdFzVvIWLa7jNlQaDuoYIOG2nzr4wfdoYWuda/nTYG2MLKxb
5XqKv1uGEugdhuIneyivqIewtMV2asD2sXHCd8gvRKJwMSy81NSbEKQ9tkzY3AGe
GlO1j3voGqPxJgJhmwfYGJnNZ5Zz4ojjGVNHYExCLJeqtE3xysY8vfdQ7L5D9/bp
0sGzN46gvQH0hkByzJ0KPJXU00kseos2tc0t1R4iqfeo3IhWIgfTMLRvz2HGyfVl
4mCutlSRGeNryFCAXJvWDs0JFMGZ9g==
=2AHS
-----END PGP SIGNATURE-----

--hGQYvHqgzIq+1DSU--
