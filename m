Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAB5B91056
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Sep 2025 13:58:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E970D601F9;
	Mon, 22 Sep 2025 13:58:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E970D601F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1758542338;
	bh=HX3E30IHqIF6O3DenosKcHkyqy9Gh60cCJAKMryfqKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Fdne+PxTXTDborWx0q8ZUntv4718ddY1zuy7nrSnH4zAKDHlDQDueZJho6NyV4nMQ
	 aw0ULldDIIwaVbP5mATeX0sHEwa0vm0Z+ZV5g3I3H2viE7lPzxz1Gj6iM8mS9JtjOS
	 ipYn9PCpmuPobLuaixpYfp11FmTRy2WrMk/OvdnY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47C68F805CA; Mon, 22 Sep 2025 13:58:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B6B27F805C6;
	Mon, 22 Sep 2025 13:58:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F059F80254; Mon, 22 Sep 2025 13:58:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9274EF800E3
	for <alsa-devel@alsa-project.org>; Mon, 22 Sep 2025 13:58:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9274EF800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Z0GAXHQM
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 35B42601E7;
	Mon, 22 Sep 2025 11:58:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C2D5C4CEF0;
	Mon, 22 Sep 2025 11:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758542288;
	bh=HX3E30IHqIF6O3DenosKcHkyqy9Gh60cCJAKMryfqKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z0GAXHQMOhzuryetOuStIWzE+mXNfSnx/PTNQLTnPRecWDXK90lGMeKBh6cD4VsFB
	 MnM1PVr7ZT9AR8oSMZYYVRLV15ok2EAzmj9a/1bC9VB2DExCoqFeGtR8W0W0n6+S7C
	 jZnEG5TBIpZ4k8K9GkBWFsgHmkJ7fh+/wpolip1tMVxGtmKnevz2uFtGaSHGJLUxGH
	 Fg6gUPPkZOZtVBbUJngGY/Bq15/UlDJ1r6afb2ttKy7W40pAm21CGt6uTjWzJ4P0tY
	 Sm86nRz160W3X+zkuFTVCEqwMUIh2Z0SLmGkhymIelt6cLmVhyBWmR64sksHp8gwEJ
	 03UAvMq3xuIDg==
Date: Mon, 22 Sep 2025 13:58:03 +0200
From: Mark Brown <broonie@kernel.org>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	yung-chuan.liao@linux.intel.com, cezary.rojewski@intel.com,
	peter.ujfalusi@linux.intel.com, ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev,
	navada@ti.com, shenghao-ding@ti.com, v-hampiholi@ti.com,
	baojun.xu@ti.com
Subject: Re: [PATCH v5 1/5] ASoC: ops: improve snd_soc_get_volsw
Message-ID: <aNE5y5iMWSLyEMmr@finisterre.sirena.org.uk>
References: <20250912083624.804-1-niranjan.hy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p6H9WN8cpiBZ26bE"
Content-Disposition: inline
In-Reply-To: <20250912083624.804-1-niranjan.hy@ti.com>
X-Cookie: Reunite Gondwondaland!
Message-ID-Hash: QM5GBB4FLH2UAOTGCBEG2WUYZAQE4EZE
X-Message-ID-Hash: QM5GBB4FLH2UAOTGCBEG2WUYZAQE4EZE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QM5GBB4FLH2UAOTGCBEG2WUYZAQE4EZE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--p6H9WN8cpiBZ26bE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2025 at 02:06:20PM +0530, Niranjan H Y wrote:

> * add error handling in case register read fails
> * clamp the values if the register value read is
>   out of range

This is really two changes, they don't even overlap code wise - see
submitting-patches.rst.

> @@ -249,9 +250,15 @@ static int soc_get_volsw(struct snd_kcontrol *kcontr=
ol,
>  {
>  	struct snd_soc_component *component =3D snd_kcontrol_chip(kcontrol);
>  	unsigned int reg_val;
> -	int val;
> +	int val, ret =3D 0;
> =20
>  	reg_val =3D snd_soc_component_read(component, mc->reg);
> +	val =3D reg_val;
> +	if (val < 0) {

Here reg_val is an unsigned int, but then we assign that to an int check
if it's less than 0.  I don't see how that can work sensibly, and indeed
when I test it on some amlogic platforms it blows up:

   https://lava.sirena.org.uk/scheduler/job/1862694#L1927

that normaly succeds:

   https://lava.sirena.org.uk/scheduler/job/1863246#L1931

It's obviously not a bad idea to have error checking, we should really
do that, but it's a bigger rework than this.

--p6H9WN8cpiBZ26bE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjROcsACgkQJNaLcl1U
h9CeYgf9EKFJkDnAwswEm7R8IAmEZ+Ivx5AOvI5p/vO9SgDYC5uKXSae/460idRN
KqjvlSmrQ9ra0u4NeTcX9cdJ9KXsplZWh1Bk1kP79ZCsmZTVM7VbXzkm/Aze2w/2
s497e9oTVI0gICubAPbVjk8ULjTFV+ifyKEGJqALJb1bxC34GFeo0T2loK7mujS4
bu+BR+O6w+cebzxJHQf7slbPv7N4YQRUQsS+RiAVmxaEZwyitFmkOMbqW32/8GUA
czl0wdYelJsFWJCaSjlLxqWgU6tABRgXpOJaWge04swGz7y4ZZkQl/XJpnGBRWnD
2MXRZmETi4E2rf3KmLser4ofQ6eAag==
=CQ1/
-----END PGP SIGNATURE-----

--p6H9WN8cpiBZ26bE--
