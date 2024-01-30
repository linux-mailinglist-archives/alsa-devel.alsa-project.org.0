Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF55842281
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jan 2024 12:14:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED9CDEB6;
	Tue, 30 Jan 2024 12:14:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED9CDEB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706613292;
	bh=/9NzOhfNsiFt9TBV15bxnbKB8v1glIQ/hLc+NQj7LX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ghHVPd/eU0Tqv2XY/lsw3cZ6oXLU4+SG6A/h7p+uenyAzn3G0vtZ0yCU8BY391uxF
	 hBBBRqg4OgUYZBpqOEXNY44RoUpe1cSjJxZcodamUZL1Wj7pSnZotrOzi+hnBCa+5s
	 wH3dFKyLeGplDYAOq7zQthksOgKRKuCACOsLWypw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85E49F80579; Tue, 30 Jan 2024 12:14:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E7828F80579;
	Tue, 30 Jan 2024 12:14:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD928F80563; Tue, 30 Jan 2024 12:14:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 76A32F80548
	for <alsa-devel@alsa-project.org>; Tue, 30 Jan 2024 12:14:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76A32F80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Yumtipkg
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0CDB161200;
	Tue, 30 Jan 2024 11:14:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BED6C433F1;
	Tue, 30 Jan 2024 11:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706613242;
	bh=/9NzOhfNsiFt9TBV15bxnbKB8v1glIQ/hLc+NQj7LX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yumtipkggd8S+HmelxCX+RgmP58dbbSqaP1bl0m9Jk8KAfbq57cRp7DF/g9AQO/bZ
	 SIJSkZTXsWBFcxJJwFps8y+WP7wrW9azpG6uOaqHkoiB9UYw1+yJlRRvSeBUVgArhx
	 Od7wfg+QwsYx9Yf2m2wUE3M3cFWp4KtBlOXhs9BoyWcSXrh7JhKND5VWv43cBGWANy
	 uts3cwul209VPKtFwcCGFai9xYiOlSYUNlTbAkrj45qKvdA7US2r7WSwn30ESSdc3V
	 hsJp1CDqsKtmTKZwz9m50KJIJvoktjc6uZ75SzKX+AVLIq/Nali7SDxE9wbZoZ4w0h
	 uklMom/GuJGVw==
Date: Tue, 30 Jan 2024 11:13:55 +0000
From: Mark Brown <broonie@kernel.org>
To: kovalev@altlinux.org
Cc: stable@vger.kernel.org, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org, u.kleine-koenig@pengutronix.de,
	a.firago@yadro.com, sashal@kernel.org, zhuning0077@gmail.com,
	tiwai@suse.com, perex@perex.cz, lgirdwood@gmail.com
Subject: Re: [PATCH 6.1.y 1/7] ASoC: codecs: es8326: Convert to i2c's
 .probe_new()
Message-ID: <25386374-44e8-4b74-8803-2dcb0806f80d@sirena.org.uk>
References: <20240130094708.290485-1-kovalev@altlinux.org>
 <20240130094708.290485-2-kovalev@altlinux.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JlNGArQx6R6RiAba"
Content-Disposition: inline
In-Reply-To: <20240130094708.290485-2-kovalev@altlinux.org>
X-Cookie: 1 bulls, 3 cows.
Message-ID-Hash: WDFEX5XHC65UCUKBGFPN4OHDFEHQWFZX
X-Message-ID-Hash: WDFEX5XHC65UCUKBGFPN4OHDFEHQWFZX
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--JlNGArQx6R6RiAba
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2024 at 12:47:02PM +0300, kovalev@altlinux.org wrote:
> From: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> Commit 784252bac835c831e10c48be633cd1ff0d697326 upstream.
>=20
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.

This is obviously not a bug fix.

--JlNGArQx6R6RiAba
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmW42fIACgkQJNaLcl1U
h9AF4wf+KMjI0jWwgikQQPyjfg4Md2U3jxs0VUI32Yjrul2MIOQvX5y1E4+/SL76
nXtvq0QhXhQYgk8mdv4zlUD5+9ozi6NqWGNeU0ggquRieWOu1Wl4K5H/OeGDhuIB
uefbKQ+TFBvjzyQRub/KiQkI/RGvjdIj42ttScUuVID6BG3FlXiZQJATy+gWZIs9
2r7Up22dgKsmIw6U4GoV9fvQwP9xIM5gp3/OR8i3wpD+4edGekIUbYcs+NbpSo+e
xUjSz1YlrFfVnTdqZ/6lmdz84P8+0oTesan7TClPSG5qvWDoVvb3ruNeNdwNiMhF
qNRLj14lGgNu/7SJ+RXonBvcPHPpgQ==
=4Ne0
-----END PGP SIGNATURE-----

--JlNGArQx6R6RiAba--
