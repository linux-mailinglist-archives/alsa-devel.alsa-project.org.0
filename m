Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B807D9D27
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Oct 2023 17:39:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06DABE0F;
	Fri, 27 Oct 2023 17:38:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06DABE0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698421149;
	bh=elc69EfXXGWfXn+hGDas4SFr5/uzMl2oSiJJGISCVMg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XXd4/VoZ/dx55DgsZNTrXC9DNWJ5dw3KvFtmdfijRSQAseqVuAN6uBaRsoAnJL42J
	 aVuutvClgU4Qdt7r8FPPk2EclfZTzZaGKCnqL0Yo7RzggI4C/pycX8t1kcQ/W6Mo9l
	 8YTqiEyQDr3xmM8rkUNd9+0oYxD3ZR4OL/5V3VYk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E743F80579; Fri, 27 Oct 2023 17:37:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D81A7F80563;
	Fri, 27 Oct 2023 17:37:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 615C2F80564; Fri, 27 Oct 2023 17:37:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 16522F8055B
	for <alsa-devel@alsa-project.org>; Fri, 27 Oct 2023 17:37:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16522F8055B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HtgP6Ap5
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 17F9EB821D1;
	Fri, 27 Oct 2023 15:37:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D821CC433C9;
	Fri, 27 Oct 2023 15:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698421053;
	bh=elc69EfXXGWfXn+hGDas4SFr5/uzMl2oSiJJGISCVMg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HtgP6Ap5oJ+gXkcgfXSsJMXDpXu/vsTZrJ10Xgkf2RBV2ec+PTd9OUbtgzQvyuMpH
	 huJO8Ki6nzez5lyOqrZboADM+setUUrLSFK7j9wM67YaOqOcBNLhEMjLNCgqcJLaY8
	 nCtOy5LefM2fg4LnXwV4zBnM1Tduj+Q3baRNyVks62V74mys1127CPrybS8TGBODZ1
	 vBmnelwdXV6HeqKwuGlHy+dt6m7zvsWM9YfmdSHsmSvUBePVzyvdQS/LTNW7w4iRgJ
	 fQN/BncjklNMuu9RN1g16VqW/kcsrHAkNM+NdOJhmEkjUx8Am0z6Wtmj4eSdWwlaZA
	 YNZWuKcDILMXg==
Date: Fri, 27 Oct 2023 16:37:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [PATCH 0/2] ASoC: ams-delta.c: use component after check
Message-ID: <ZTvZOWrqnOv/NuFB@finisterre.sirena.org.uk>
References: <87wmv9q632.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NHlxR359ayJCXwLW"
Content-Disposition: inline
In-Reply-To: <87wmv9q632.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Save energy:  Drive a smaller shell.
Message-ID-Hash: TULFOTMMNXUP27B6ES3VRXSFIVOOLW5O
X-Message-ID-Hash: TULFOTMMNXUP27B6ES3VRXSFIVOOLW5O
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TULFOTMMNXUP27B6ES3VRXSFIVOOLW5O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--NHlxR359ayJCXwLW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 27, 2023 at 12:09:23AM +0000, Kuninori Morimoto wrote:
>=20
> Hi Mark, Dan
>=20
> This patch-set fixup ams-delta.c's 2 warning/error.
>=20
> [1/2] is for compile error of .receive_buf =3D cx81801_receive,
> [2/2] is for static checker warnings

Where are you seeing these errors?  In particular the first patch looks
like an issue that was introduced and fixed in mainline, both sides of
that should've been merged up to for-6.7.

--NHlxR359ayJCXwLW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmU72TkACgkQJNaLcl1U
h9CLFQf/UHygjFyMLFtPM5voX98s7aFcynj8WXPXp3xbdYZp7p+wyV8ocwaDaeYt
93yWEmtsOqZqIlyHnNi6tBmznwdTXlDBQl4jw1VW1x1JJwnPV2fOoxC+ik39pE13
8FTv+Pt/fhikg0xwwJVPuqeStw9/aGqZr4UaLsIZueylDDbXl8GdEBLV252xyjGd
uTM8XscdWuBwcqBEuZmYdDGqCcSROZ6kJxaQoxCgglX2mXUebyIPLrZDyysRXbza
Tht7MiCgT9bP2jUafJNTTf7IG789Q7aW/2KSxEcpq7fc17LtRL8RXNFIod/Yf6NG
++1GadUBWHRGqZWSyYH8Ar9quSo37Q==
=rkZs
-----END PGP SIGNATURE-----

--NHlxR359ayJCXwLW--
