Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EAD7FA666
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 17:30:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42A60DED;
	Mon, 27 Nov 2023 17:30:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42A60DED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701102610;
	bh=c7UXKhyCEJLe4p8fNvCpJdR2nuw6fvls3719IBlx6wc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jazCT33LoqWv6ZNnCcpis8ipiJVBNzpUI91uDwoQw9mdsmT4C+ZIXqp6AyHuap3FB
	 SHrPDduG+q2myvoFCXEvDJF3vzNZ8FXeZ6CC96l1vy1fMClyaI6+aBzFYUZbQ3RJNH
	 yHzxWCrjjOob6EcuE1C9iBmVjD2UYf+JbOowkp2o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7FE71F8057F; Mon, 27 Nov 2023 17:29:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DB733F8057A;
	Mon, 27 Nov 2023 17:29:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24CA4F8016E; Mon, 27 Nov 2023 17:29:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9AB79F800F5
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 17:29:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AB79F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Df/pEzrS
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id C48E2B8369B;
	Mon, 27 Nov 2023 16:29:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41BA3C433C7;
	Mon, 27 Nov 2023 16:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701102564;
	bh=c7UXKhyCEJLe4p8fNvCpJdR2nuw6fvls3719IBlx6wc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Df/pEzrS8cN4nviesAg8zjNi8LYuVLMtLlNKvDRQJLZNnxkhSzdk+19covWXKAwPw
	 fi2NXKt+6eN3Z1N+FiB98tLcpblr0xkW8wIiw4E+mFh6PNnMez4ehd8YuuSXSvdFmv
	 k58mGQzZd7TVkMAhA3TTjKoPCnnf3hYS4Oi2LhSAfXGTght1RqGqPD53ozyX9BLIxh
	 vHzZUW43Oy35oO2otlJqQ5s1iWr6ZHcQpHnXpmcniieUeMZOWqjjcqe+kAPMl0vy50
	 L+uLDC0xR/YDt5xJ6Abj1d37IbYpQNX/RbFoTL/zJL7naBDAJ3Nk2IBodmaSBCXFxo
	 IPsNf4TKQjoOQ==
Date: Mon, 27 Nov 2023 16:28:40 +0000
From: Mark Brown <broonie@kernel.org>
To: Malcolm Hart <malcolm@5harts.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Sven Frotscher <sven.frotscher@gmail.com>, git@augustwikerfors.se,
	alsa-devel@alsa-project.org, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: ASoC: amd: yc: Fix non-functional mic on ASUS E1504FA
Message-ID: <ZWTDuKDj3v9ZSlFX@finisterre.sirena.org.uk>
References: <b9dd23931ee8709a63d884e4bd012723c9563f39.camel@5harts.com>
 <ZWSckMPyqJl4Ebib@finisterre.sirena.org.uk>
 <87leajgqz1.fsf@5harts.com>
 <08590a87-e10c-4d05-9c4f-39d170a17832@amd.com>
 <87h6l72o8f.fsf@5harts.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jZEA8hOLgvi+THE/"
Content-Disposition: inline
In-Reply-To: <87h6l72o8f.fsf@5harts.com>
X-Cookie: Slow day.  Practice crawling.
Message-ID-Hash: KGT32YJT4W57QPU7NA7IK7ZRWKV7NAHQ
X-Message-ID-Hash: KGT32YJT4W57QPU7NA7IK7ZRWKV7NAHQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KGT32YJT4W57QPU7NA7IK7ZRWKV7NAHQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--jZEA8hOLgvi+THE/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 27, 2023 at 03:44:37PM +0000, Malcolm Hart wrote:
>=20
>=20
> From da1e023a39987c1bc2d5b27ecf659d61d9a4724c Mon Sep 17 00:00:00 2001
> From: foolishhart <62256078+foolishhart@users.noreply.github.com>
> Date: Mon, 27 Nov 2023 11:51:04 +0000
> Subject: [PATCH] Update acp6x-mach.c
>=20
> Added 	ASUSTeK COMPUTER INC  "E1504FA" to quirks file to enable microphon=
e array on ASUS Vivobook GO 15.
> ---
>  sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
>  1 file changed, 7 insertions(+)

You've not provided a Signed-off-by for this so I can't do anything with
it, please see Documentation/process/submitting-patches.rst for details
on what this is and why it's important.

Please don't send new patches in reply to old patches or serieses, this
makes it harder for both people and tools to understand what is going
on - it can bury things in mailboxes and make it difficult to keep track
of what current patches are, both for the new patches and the old ones.

--jZEA8hOLgvi+THE/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVkw7cACgkQJNaLcl1U
h9BWSwf/bRWKgTTQMcjabBit1tuhBSBYvUALjvjAsJF9DJtrCMduzgvOBBM+De7d
ozxI4XNRZBnFfng00zan1sFrWTrSl7lpbydNW/GFySZtDhmodMk8C1sGnbeg/lE8
i+LroPK/tJOo0zJRF/5O8MExUgVuf7ZoMRCjUPhPAos22EDbtzntbEeudxpZzKGM
s7F0zrTriemx4w1pvSRGLv42ykDiujQXx0BxkLzE/31v668ULeOyMwXBBC+FLR/n
o9DaKXB/HODATBzpPPuwwAU1ubfI8gQlsE5Ha7utw1n2OpjYhL2zDPH5YmGKmbKD
gmGWY82OdFtKdgO7mZbTdTQCexiuww==
=6B4G
-----END PGP SIGNATURE-----

--jZEA8hOLgvi+THE/--
