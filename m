Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF757B32E5
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Sep 2023 14:56:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD569AEA;
	Fri, 29 Sep 2023 14:55:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD569AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695992190;
	bh=EoBxvrxDfGkVdyIyzpMbPaY4B2XdkS2E9Vlf3uqDKBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Oz3usNV9HEeU1zLDwYwPbDOG3hexFVxmdiujfzZt0v9yIAERbS3SkQioRrEq/QvlO
	 Dba0JmbtPsO8LqhtpxDrdkCGQWlNe16nxUSF95uhrlj8owDfRkTlvsF86UUKe9uxTV
	 p+j1MCkuhWs/RQ/BGTEcH9WBJQVSw1tejz+PyJeA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D816F8047D; Fri, 29 Sep 2023 14:55:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D9F19F8016A;
	Fri, 29 Sep 2023 14:55:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4745F801D5; Fri, 29 Sep 2023 14:54:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2AC0DF800AE
	for <alsa-devel@alsa-project.org>; Fri, 29 Sep 2023 14:54:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AC0DF800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=nQL3CFIl
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 919D8B81F3C;
	Fri, 29 Sep 2023 12:54:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97A1BC433C8;
	Fri, 29 Sep 2023 12:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695992069;
	bh=EoBxvrxDfGkVdyIyzpMbPaY4B2XdkS2E9Vlf3uqDKBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nQL3CFIlVUWSxJbvvFJ5D6ryVfPSd4t2vrMpnI3g/vlQJNjKl9PzT2h0PH9DDi4H4
	 6VWWjQqELAI+VoZ0pMXf8PLIkszYnqqicz53+I8xYrT1Tw5DdJphpJaycyG8mQJOGo
	 VOIDTPE2EvHzUIkmzXXzPVNea1bMGWL+t0v7bFjQGxJdUQyCOXjgbLUhYegkO3ejW6
	 kpx7h4abs5V/ZIuse+/5Z6lAPvLGYNogP/2LRS4Q/YX4Hq4a8gew5stD7z7bF+M+SL
	 V8RXDlREFHZtvQJqkS2OrlKPcaBTYryhp5IdilsbRozpcBm3IoYFA0gA8fExZRWVUJ
	 D7sxFQiTk9Xkw==
Date: Fri, 29 Sep 2023 14:54:27 +0200
From: Mark Brown <broonie@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Weidong Wang <wangweidong.a@awinic.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] ASoC: codecs: aw88261: Remove non-existing reset gpio
Message-ID: <ZRbJAwoanwLnnaJ1@finisterre.sirena.org.uk>
References: <20230929-aw88261-reset-v1-1-fcbce194a823@fairphone.com>
 <ZRbDW3OiAYyAkWgN@finisterre.sirena.org.uk>
 <CVVET1A2CO26.3O47662JKAL6@otso>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qONoz+opKwc0uBGE"
Content-Disposition: inline
In-Reply-To: <CVVET1A2CO26.3O47662JKAL6@otso>
X-Cookie: Save energy:  Drive a smaller shell.
Message-ID-Hash: C4YGUBCN5PMUMH6RB6WREFW4DN7MVPQE
X-Message-ID-Hash: C4YGUBCN5PMUMH6RB6WREFW4DN7MVPQE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C4YGUBCN5PMUMH6RB6WREFW4DN7MVPQE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--qONoz+opKwc0uBGE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 29, 2023 at 02:44:47PM +0200, Luca Weiss wrote:

> Unfortunately the dt binding is a bit trickier to update since it's made
> for both AW88261 and AW88395.

> After spending a bit of time using non-Google search machines (Google
> seems incapable of finding anything there) I found a datasheet for
> AW88395 and that does appear to have a RSTN "Active low hardware reset"
> pin so we should not remove that one.

> Probably it's easier to separate the two dt bindings then, instead of
> trying to keep them together?

You can do conditionals based on compatibles so it might not be
required.

--qONoz+opKwc0uBGE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUWyQIACgkQJNaLcl1U
h9A/xAf/XN4jfnsD6rctf5QA0do+w2dON4lVcBHZWLQoVexuH4atppdPKFOGfwfW
ycEeWWnTssfIhxGIiQ97rN8onZpMEWh4TI1cfBbUDKnpP1E5tRlLrhBEFH6q6bYe
rK5H9ScASfpxab9MrL5YczeE5aX2LwGNvlfYbPqMP2uOYxuVBZYX7saf7nE8uY9j
k+1wj+aMhW0MUcOJaIiSpyINPL2i/C7Tr0eV5Zfdly0f7iPCV9QiJjbhXzXyr+2q
FbZIqxtzRLJcy2lG2Yw24pc3/AgJdm1RD3b0a0CEayYcRMe1VOlxMMDrDoB2D6XH
w8Y0zxbwNy/sTRiXIBUJZnf3Yc+xcg==
=55Gl
-----END PGP SIGNATURE-----

--qONoz+opKwc0uBGE--
