Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5262952061
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2024 18:50:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 736D9238B;
	Wed, 14 Aug 2024 18:50:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 736D9238B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723654213;
	bh=meqvXO3+nmuZ5AIXtSVgg8WAYFetsdNizUtH8eryubs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cYPrLStH5GlQfrFaTVjzzxhQsEkFuoTCYywf2nkZsb8LWujKthEuQdkc2AZ96JqFu
	 JLeitSsDltU7H5qF46PYVeNwybqBXIObYIe9wKKrAQgZJYR2Rbg78k9w9khBlVPOWE
	 4Ei6UPHWXehpaQyEBa2Ylyai82A+zznvk6cNzKxA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48B4AF805AB; Wed, 14 Aug 2024 18:49:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3BD7F80423;
	Wed, 14 Aug 2024 18:49:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3305F80107; Wed, 14 Aug 2024 18:49:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B5891F80107
	for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2024 18:49:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5891F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KYHIl4Bl
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0DD9D61A5C;
	Wed, 14 Aug 2024 16:49:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCAEBC116B1;
	Wed, 14 Aug 2024 16:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723654172;
	bh=meqvXO3+nmuZ5AIXtSVgg8WAYFetsdNizUtH8eryubs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KYHIl4Blh/i77OC9N5FoMY//D7bQrsyMvbhheGmNID6geQzGDJhyX7DUmhvA9V1HF
	 tDY3heh+p+JbGaZ839bp7GA2+lM0r8oAKIv/iVnVZTDju+OaKOx8ZOPeJt9w1P6sjD
	 d+RH8EEzxly1Soxm/s5yjeh3m6oFqDs+aehkqgQWtoY7OZYqc02KqBPyRIFtueDLR3
	 WQtGxzHr/TKvETyuutYRO9UTjVQElN3zSyuBfpvSgTu3h62KeZkp72bW1sO62TKXvR
	 sGQMKkXvavl3cJUSW6xrvs57Mqchsgn6V/Rf6x6O4IVQQik3GBN7DzDCIjx9w+krD9
	 y3E+zKNE1I85g==
Date: Wed, 14 Aug 2024 17:49:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: andriy.shevchenko@linux.intel.com, lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com, 13916275206@139.com,
	zhourui@huaqin.com, alsa-devel@alsa-project.org, i-salazar@ti.com,
	linux-kernel@vger.kernel.org, j-chadha@ti.com,
	liam.r.girdwood@intel.com, jaden-yue@ti.com,
	yung-chuan.liao@linux.intel.com, dipa@ti.com, yuhsuan@google.com,
	henry.lo@ti.com, tiwai@suse.de, baojun.xu@ti.com, soyer@irl.hu,
	Baojun.Xu@fpt.com, judyhsiao@google.com, navada@ti.com,
	cujomalainey@google.com, aanya@ti.com, nayeem.mahmud@ti.com,
	savyasanchi.shukla@netradyne.com, flaviopr@microsoft.com,
	jesse-ji@ti.com, darren.ye@mediatek.com, antheas.dk@gmail.com,
	Jerry2.Huang@lcfuturecenter.com
Subject: Re: [PATCH v1] ASoc: tas2781: Add Calibration Kcontrols for
 Chromebook
Message-ID: <97275835-fff5-49ac-bd15-c6b6c6e89fe0@sirena.org.uk>
References: <20240726084757.369-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QnAnomE4bcSDKfDc"
Content-Disposition: inline
In-Reply-To: <20240726084757.369-1-shenghao-ding@ti.com>
X-Cookie: The second best policy is dishonesty.
Message-ID-Hash: PPRNJV6CHUSYV7BMKSWANCJW6JCVTSZG
X-Message-ID-Hash: PPRNJV6CHUSYV7BMKSWANCJW6JCVTSZG
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PPRNJV6CHUSYV7BMKSWANCJW6JCVTSZG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--QnAnomE4bcSDKfDc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 26, 2024 at 04:47:55PM +0800, Shenghao Ding wrote:
> Add calibration related kcontrol for speaker impedance calibration and
> speaker leakage check for Chromebook

This is pretty hard to understand, it feels like there's a bunch of
cleanup work in here along with the actual control addition and there's
nothing really saying anything concrete about the actual controls to
check that the controls do the right thing.  It's hard to do anything
but the most superficial review here since I don't really understand
what the changes are trying to accomplish.

> -/* pow(10, db/20) * pow(2,30) */
> -static const unsigned char tas2563_dvc_table[][4] =3D {
> -	{ 0X00, 0X00, 0X00, 0X00 }, /* -121.5db */

For example moving this to the header could be done separately (though
perhaps it should just be exported rather than placed in the header)?

> @@ -64,8 +64,8 @@ static int tasdevice_change_chn_book(struct tasdevice_p=
riv *tas_priv,
>  			 */
>  			ret =3D regmap_write(map, TASDEVICE_PAGE_SELECT, 0);
>  			if (ret < 0) {
> -				dev_err(tas_priv->dev, "%s, E=3D%d\n",
> -					__func__, ret);
> +				dev_err(tas_priv->dev, "%s, E=3D%d channel:%d\n",
> +					__func__, ret, chn);
>  				goto out;
>  			}
>  		}

This is another example of a random cleanup.

>  static void tasdev_load_calibrated_data(struct tasdevice_priv *priv, int=
 i)
>  {
> +	struct tasdevice_fw *cal_fmw =3D priv->tasdevice[i].cali_data_fmw;
> +	struct calidata *cali_data =3D &priv->cali_data;
> +	unsigned char *data =3D &cali_data->data[1];
>  	struct tasdevice_calibration *cal;
> -	struct tasdevice_fw *cal_fmw;
> +	int k =3D i * (cali_data->cali_dat_sz + 1);
> +	int j, rc;
> =20
> -	cal_fmw =3D priv->tasdevice[i].cali_data_fmw;
> +	/* Load the calibrated data from cal bin file */
> +	if (!priv->is_user_space_calidata && cal_fmw) {
> +		cal =3D cal_fmw->calibrations;
> =20
> -	/* No calibrated data for current devices, playback will go ahead. */
> -	if (!cal_fmw)
> +		if (cal)
> +			load_calib_data(priv, &cal->dev_data);
>  		return;

It feels like there's an abstraction problem with the different ways to
get calibration data.  Perhaps each way of loading calibration data
should parse the data into a standard format on load and then the rest
of the code doesn't need to worry about where it came from?

> @@ -67,8 +215,13 @@ static int tas2781_digital_getvol(struct snd_kcontrol=
 *kcontrol,
>  	struct tasdevice_priv *tas_priv =3D snd_soc_component_get_drvdata(codec=
);
>  	struct soc_mixer_control *mc =3D
>  		(struct soc_mixer_control *)kcontrol->private_value;
> +	int rc;
> +
> +	mutex_lock(&tas_priv->codec_lock);
> +	rc =3D tasdevice_digital_getvol(tas_priv, ucontrol, mc);
> +	mutex_unlock(&tas_priv->codec_lock);
> =20
> -	return tasdevice_digital_getvol(tas_priv, ucontrol, mc);
> +	return rc;
>  }
> =20

Why all these locking changes?  Could they be split out into a
praparatory change?

> +static int tasdevice_get_chip_id(struct snd_kcontrol *kcontrol,
> +			struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *codec =3D snd_soc_kcontrol_component(kcontrol=
);
> +	struct tasdevice_priv *tas_priv =3D snd_soc_component_get_drvdata(codec=
);
> +
> +	ucontrol->value.integer.value[0] =3D tas_priv->chip_id;
> +
> +	return 0;
> +}

Should these chip ID controls be done separately?  They don't seem super
related.

--QnAnomE4bcSDKfDc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAma84BIACgkQJNaLcl1U
h9D5yQf/S2RGcP8shc2wriIE+yF1lZjsRkb33r0Lhu8jdZM2AkDS7vB7WgX5Yq/S
VLHewFCklL8gQF2tyLEBNsjt+nSzE0JBN65sGlLYnebPBb/stXw5Ld2H7j74+mLi
muB6v7LvP77hImPyOFDusq0T3swIU3MNqGpzWFaK428KnD7JOL7uZYuzt7GnKwOj
dJfX7xxOFpV66cwB8SBhY91y6ybBDC/qwC1N+kkSWAwWP6Z62c8bbVeI3rWx8dMq
e7Kq0m6cC2Xp9Xbm5MAvZPxzmrxMWtf6p/ALvDfjM2tEKTADXKYLX6foZK1lSZ62
wl3RVYwBq8rx0rLVJpF6ttXYc3Swhg==
=pFim
-----END PGP SIGNATURE-----

--QnAnomE4bcSDKfDc--
