Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED14DAC67AF
	for <lists+alsa-devel@lfdr.de>; Wed, 28 May 2025 12:50:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69762601EB;
	Wed, 28 May 2025 12:50:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69762601EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1748429442;
	bh=MrEO9af0lrYximIkKL0NicOVbBhDpgOhzZtxTexn3RA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fQFP9nQcw6MiH4DV52+H6nTlEWacqoimPSy9wj6oFFFBGGQUbdY4K7PiiN/K0EsI9
	 v3OcxwStH8kR9svEMuVnmslwCzJqO44jd9G6XRw6Ik5chKJvjzMQr31wGOTTXw64K1
	 5Q5QVGeN99hhTv8deqDsZEhUADnnMRYynBG22waU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA408F805B6; Wed, 28 May 2025 12:50:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BD8DF80185;
	Wed, 28 May 2025 12:50:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5156FF80212; Wed, 28 May 2025 12:50:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 983CFF800D0
	for <alsa-devel@alsa-project.org>; Wed, 28 May 2025 12:49:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 983CFF800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QQIKugh2
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 76469A4F8B1;
	Wed, 28 May 2025 10:49:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E2C7C4CEEB;
	Wed, 28 May 2025 10:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748429396;
	bh=MrEO9af0lrYximIkKL0NicOVbBhDpgOhzZtxTexn3RA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QQIKugh2EfSxPldV9YW95GWu33Ak0bVE+ZpPZ9ICD2WZmeU9VB9TEpKnn2Y0eWsHh
	 Zi9W0oHXoK2g586kW/g6vnw2TBILsQK3bx/XYaUeefMHEh68GcX3cHFpVRk+m7dU0V
	 ft449sERAj77DhyVHvWL4H0UvhtWGppSFSvsFs3h9Q8/YxsaM15O7JtHmF3xWkQhGY
	 uL9P4arBy9Hb9lgzdUCEDxc7qBQhxbpjdxJFWwmYa42SkGcVHv9qNP9wtzGpdhTQg2
	 DmV2dnTLzulZTPd8+DfiF1nO5AwwaHXGndxwgcMaHAbus57oWKYxlYt5ML9vRH3A9Z
	 HzD4XpNJFMoiA==
Date: Wed, 28 May 2025 11:49:52 +0100
From: Mark Brown <broonie@kernel.org>
To: meowmeowbeanz <meowmeowbeanz@gmx.com>
Cc: alsa-devel@alsa-project.org, mario.limonciello@amd.com
Subject: Re: [PATCH] ASoC: amd: yc: Add support for Lenovo Yoga 7 16ARP8
Message-ID: <87729f96-27c6-47a4-927f-de6ae1738bb7@sirena.org.uk>
References: <5015425.31r3eYUQgx@gemini>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+QH9eworQdq4N/Lo"
Content-Disposition: inline
In-Reply-To: <5015425.31r3eYUQgx@gemini>
Message-ID-Hash: J26ELVHXL7MJ5QIJDB7442EXFCU6RJ3L
X-Message-ID-Hash: J26ELVHXL7MJ5QIJDB7442EXFCU6RJ3L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J26ELVHXL7MJ5QIJDB7442EXFCU6RJ3L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--+QH9eworQdq4N/Lo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 08:24:39PM -0700, meowmeowbeanz wrote:
> From e1bc7cbafcdefad60ac6a34fd834a734c64f3fd5 Mon Sep 17 00:00:00 2001
> From: meowmeowbeanz <meowmeowbeanz@gmx.com>
> Date: Tue, 27 May 2025 19:57:07 -0700
> Subject: [PATCH] ASoC: amd: yc: Add support for Lenovo Yoga 7 16ARP8
>=20
> Add DMI quirk entry for Lenovo Yoga 7 16ARP8 (83BS) to enable
> digital microphone support via ACP driver.

This doesn't apply, it's been MIME encoded and word wrapped from the
looks of things so git can't understand it.  You should be able to send
cleanly using git send-email or (usually easier) the b4 tool:

   https://b4.docs.kernel.org/en/latest/contributor/overview.html

--+QH9eworQdq4N/Lo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmg26k8ACgkQJNaLcl1U
h9Bqfgf/TekvxBitcFvvV/cQyqtx0eJLZZ2U6UHU3SZGi6iC9r6GOoAWVJo3U2yW
8IACCGD/tUiqlWJ3096oGMWEciH5MhOQ6eGQ2NOssjbNIOLXR7TAEDPB79lDVwv6
Yt6D8gg9+mHQoRJfOcDSKKLYPb1hkUbeYuwTeZM8KD7WL5TryPN5340j1ZGQfsVU
ME95qTW0RkhBozwa/3aTKyBE14LU0HSU7ZOuGzzVRvhPRYgErl23BlRVh2Wmh+AK
3UbLU8SnUyqXTgZnuyiraxt9X2xmcC+zmEmg6LPH+UPO3HUBSsFyh6321dUhp451
z46XIdeI8OJROj+PpI2YAhxrmPbpkg==
=nMMZ
-----END PGP SIGNATURE-----

--+QH9eworQdq4N/Lo--
