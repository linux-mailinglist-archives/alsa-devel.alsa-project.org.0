Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFDB79980E
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Sep 2023 14:43:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 208701EB;
	Sat,  9 Sep 2023 14:42:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 208701EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694263399;
	bh=xr+HEKX4cCDTuOqKdyXJ1E/ji1CQkjaUauZpgB7DUUg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jPWqLJu8nRLSbOwxGwqLLudHaqRdkb8MU6y6I/Yy4r9tP25eqmU8pE5kd6GM5rHIZ
	 c3W2zpDpuCcYyrYTJzVaPKBgTDfcSVC1h52vxmq/xn7TJb2Xk0sH/YmOG36t9oRVXl
	 ifTLIztPsDwQESszKE+7lFwJMC8I/9q1G6m1K1Ek=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 843F5F80552; Sat,  9 Sep 2023 14:42:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 14B42F8047D;
	Sat,  9 Sep 2023 14:42:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F754F80494; Sat,  9 Sep 2023 14:42:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EC39EF800AA
	for <alsa-devel@alsa-project.org>; Sat,  9 Sep 2023 14:42:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC39EF800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CfN5qCgq
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 80DEF60B2B;
	Sat,  9 Sep 2023 12:42:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59892C433C8;
	Sat,  9 Sep 2023 12:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694263336;
	bh=xr+HEKX4cCDTuOqKdyXJ1E/ji1CQkjaUauZpgB7DUUg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CfN5qCgqBJdm5dycCocctI74vqr0SYq4BhRPMVQIeL3mhqZvRLQOFSWGvbOGAq3+Z
	 kYFwlv1lb0GUgIjJFpv7Sr66jWceiI385ydCDXSBBF18AvxYTKIh7S6tZYdehD1jrH
	 RasEgJpNN9ZRewIezIett09FiWwbSxIpq7hV+ffyEvVo+lulRG6yuoDXzxpCkfX6rr
	 WM3C0HIkwwVo9NuHcAT30H+iUjEQpValZYtJnf/jgMraInkAMVmMR/Srl0DgAk+LPF
	 LongSAdtYXqdUiA6WaGxebExEfP5uRiaPHLxPqI7xNjX9GCXXnjubVZuEllVSN1P02
	 /KOMmu1wUr5Xg==
Date: Sat, 9 Sep 2023 13:42:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, patches@opensource.cirrus.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: wm8960: Fix error handling in probe
Message-ID: <ZPxoIQ6ocTcDrmtM@finisterre.sirena.org.uk>
References: <20230909120237.2646275-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vjozxumgwjzG39lU"
Content-Disposition: inline
In-Reply-To: <20230909120237.2646275-1-linux@roeck-us.net>
X-Cookie: Save energy:  Drive a smaller shell.
Message-ID-Hash: KHC27VYECZVOAJJULLFWIXXYUQ3YZE2E
X-Message-ID-Hash: KHC27VYECZVOAJJULLFWIXXYUQ3YZE2E
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KHC27VYECZVOAJJULLFWIXXYUQ3YZE2E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--vjozxumgwjzG39lU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 09, 2023 at 05:02:37AM -0700, Guenter Roeck wrote:
> Commit 422f10adc3eb ("ASoC: wm8960: Add support for the power supplies")
> added regulator support to the wm8960 driver, but neglected to update
> error handling in the probe function. This results in warning backtraces
> if the probe function fails.
>=20
> WARNING: CPU: 0 PID: 1 at drivers/regulator/core.c:2396 _regulator_put.pa=
rt.0+0x1b4/0x1d8
> Modules linked in:
> CPU: 0 PID: 1 Comm: swapper/0 Tainted: G                 N 6.5.0-11075-g9=
2901222f83d #1
> Hardware name: Freescale i.MX6 Ultralite (Device Tree)
>  unwind_backtrace from show_stack+0x10/0x14
>  show_stack from dump_stack_lvl+0x68/0x90
>  dump_stack_lvl from __warn+0x70/0x1a4

Please think hard before including complete backtraces in upstream
reports, they are very large and contain almost no useful information
relative to their size so often obscure the relevant content in your
message. If part of the backtrace is usefully illustrative (it often is
for search engines if nothing else) then it's usually better to pull out
the relevant sections.

--vjozxumgwjzG39lU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmT8aCAACgkQJNaLcl1U
h9Dxlwf+Ln5ZLsZt4L9GtAbAoAzBwg6k6EXI3wl9dsfKZL39RrU2usnPSRoWbgFP
1GHaYDHSOCXfI4SM+Y91nknankLLzeGQG8BlJZ2byDz2T/fwExZlvdWNQccQYJfW
BVQ/3u1byQhsA8BIxmmpejiwFtS5iAwh1280Y1AUiKlT9eQhXESAR0kxhKOaBK3v
gxenKi3LN1t1adtqK+0MRjPTUZofvymMY44PP0Rb2dRZgEkjEMa6EQ2iJqJ5BMhK
CVvlwZjAoUcA+yks821zKxlCx01bPjdn4JYqYjTXcyqL0vP/EBp49/F5tSIR+A2D
SnRPGvTCNGjjIA27bGCOib9cOJVZBA==
=H49g
-----END PGP SIGNATURE-----

--vjozxumgwjzG39lU--
