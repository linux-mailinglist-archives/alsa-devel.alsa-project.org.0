Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD9891BE90
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2024 14:28:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 944F7233B;
	Fri, 28 Jun 2024 14:28:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 944F7233B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719577731;
	bh=hJK0wVcohUrm/QMAdA241PXIxwDTFNwjJipFh5DJ78s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=H6aw0K1ESKIHg8eBT51/WxNLyn5oE5exdIW7DQcPnF0wYFVCMOHywZs7HlTS2dnX2
	 jX7YBZlhU4IcsMWs++LcBM0YKCwNGDdToNBk5PVxEMuElHrhc2SSZvNp97UKQyscQA
	 VOxg5MUSuMqq11tz1/UydlOVZSEp1VG94OjDMwtk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F57FF80589; Fri, 28 Jun 2024 14:28:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 260CDF805C0;
	Fri, 28 Jun 2024 14:28:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78B29F805A9; Fri, 28 Jun 2024 14:28:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BE1C2F80495
	for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2024 14:27:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE1C2F80495
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uxhYQTOz
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 163EACE392A;
	Fri, 28 Jun 2024 12:27:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91BA2C116B1;
	Fri, 28 Jun 2024 12:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719577665;
	bh=hJK0wVcohUrm/QMAdA241PXIxwDTFNwjJipFh5DJ78s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uxhYQTOzDvadvS7QMAwBzg5aiD/rX8maTKwQpgxF/vtp04sRNVjUoCI02+UFbURAZ
	 VlXABhW1gKOH+a3yY0P/Tlwa1KcXkDFLTG83ds2P0LsI+jKIunAqq8qt7aNrY48O/+
	 6fHdM7IPhFrWHF8OvHEG9KZPy6bYQFTseSXXeAV2iFu5kyttIQZfiPCGQPHOCdXvNF
	 dWQX5IHAp3G5A0I+J2P3/B6DlPy//GNn+pgwPwY6VB80qUH0Uu+hJZOBjtFqw/Zoo3
	 PDZl5ITBHF++Z+9gZa5snOFP+kB7ZIcmGhflk+eO6wg2xrt+1sj8X0RcGGPCVN7wcb
	 qz05o+kvMskcQ==
Date: Fri, 28 Jun 2024 13:27:36 +0100
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
	jesse-ji@ti.com, darren.ye@mediatek.com
Subject: Re: [PATCH v1] ASoc: tas2781: Add new Kontrol to set tas2563 digital
 gain
Message-ID: <fc4aaa9d-53e3-4709-a20b-2f77d718e815@sirena.org.uk>
References: <20240628041844.1776-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XEMZY2HieQ0Ithcn"
Content-Disposition: inline
In-Reply-To: <20240628041844.1776-1-shenghao-ding@ti.com>
X-Cookie: divorce, n:
Message-ID-Hash: 74W2BXFC6I6TTNLQJ42GHYSMNGFLSJOR
X-Message-ID-Hash: 74W2BXFC6I6TTNLQJ42GHYSMNGFLSJOR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/74W2BXFC6I6TTNLQJ42GHYSMNGFLSJOR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--XEMZY2HieQ0Ithcn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2024 at 12:18:43PM +0800, Shenghao Ding wrote:

> -static int tas2781_force_fwload_get(struct snd_kcontrol *kcontrol,
> +static int tasdev_force_fwload_get(struct snd_kcontrol *kcontrol,
>  	struct snd_ctl_elem_value *ucontrol)
>  {
>  	struct snd_soc_component *component =3D
> @@ -118,7 +119,7 @@ static int tas2781_force_fwload_get(struct snd_kcontr=
ol *kcontrol,
>  	return 0;
>  }
> =20
> -static int tas2781_force_fwload_put(struct snd_kcontrol *kcontrol,
> +static int tasdev_force_fwload_put(struct snd_kcontrol *kcontrol,
>  	struct snd_ctl_elem_value *ucontrol)

Are these fwload changes really related to the rest of the change?  They
feel like they should be a separate patch, even if it's a peparatory one
for this.

> +static int tas2563_digital_gain_put(
> +	struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol)
> +{

> +	for (i =3D 0; i < tas_dev->ndev; i++) {
> +		ret =3D tasdevice_dev_bulk_write(tas_dev, i, reg,
> +			(unsigned char *)tas2563_dvc_table[vol], 4);
> +		if (ret)
> +			dev_err(tas_dev->dev,
> +				"%s, set digital vol error in device %d\n",
> +				__func__, i);
> +	}
> +
> +out:
> +	mutex_unlock(&tas_dev->codec_lock);
> +	return ret;
> +}

This needs to return 1 if the value is being changed, the mixer-test
selftest will tell you about this and other issues.

> +static const struct snd_kcontrol_new tas2563_snd_controls[] =3D {
> +	SOC_SINGLE_RANGE_EXT_TLV("Speaker Digital Gain", TAS2563_DVC_LVL, 0,
> +		0, ARRAY_SIZE(tas2563_dvc_table) - 1, 0,
> +		tas2563_digital_gain_get, tas2563_digital_gain_put,
> +		tas2563_dvc_tlv),
>  };

Volume controls should end in Volume, again mixer-test will tell you
this - please run mixer-test.

>  static int tasdevice_codec_probe(struct snd_soc_component *codec)
>  {
>  	struct tasdevice_priv *tas_priv =3D snd_soc_component_get_drvdata(codec=
);
> +	int rc;
> +
> +	if (tas_priv->chip_id =3D=3D TAS2781) {
> +	} else {

If you write this as a switch statement it'll be more extensible.

--XEMZY2HieQ0Ithcn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ+rDgACgkQJNaLcl1U
h9BGpAf+MRghGzscAmxRBjyebKkh1iaVhHcFCK++zjP+ZPE9MOGExz2lX+WYMHoe
SAltr4Fys7zepRaRzf2QKM2tjnCTQi0EayXEE/6C4KkoiWevl4NXLAYNjn0KtjqT
uVdgH4CxrAelgeBw1rWXg4K5/enCe1sYJk1cfIUwbrVn1GT0xd/1sIeH6uXR8drk
mRq+D270Ce2YIotP7+0xOev5uOPaUzQeTI3p1tocmDrHlzgoZ6T+hAZ6T9NENnom
SVhnEB7ZmHslxO8YVyPfkuoOUn/J/WgjwhfAD4/TawYoppkWhrWk1zayHeAnjX57
zunLfO6R8hnixDTySiHyXVgwy7Te7A==
=OGLo
-----END PGP SIGNATURE-----

--XEMZY2HieQ0Ithcn--
