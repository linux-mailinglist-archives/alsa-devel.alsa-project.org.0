Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E767F1D43
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Nov 2023 20:22:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FF4BDEB;
	Mon, 20 Nov 2023 20:22:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FF4BDEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700508176;
	bh=2aUp4hFQlLqMEsSFhngQ+sfVIS5arskcjqcdj3YPsdU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VEBx1qJ5sMemyh+p5SrwlIVUtMgJUEIdMnZIBi/4EcnwWcCuxkl4koK0EvK0tvHzE
	 AV0B6Cr4swYxRvRHyIipgJP6Veq32a4B+ffjqhFHEFNlMqQ2n3e64h18JZ3XPIGG2K
	 P1OiypTQaMlwhKE0j4QBWSRyojZYENA2O3TskElc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 845CDF8057C; Mon, 20 Nov 2023 20:22:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0364DF8056F;
	Mon, 20 Nov 2023 20:22:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78D0CF802E8; Mon, 20 Nov 2023 20:22:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0F08DF80093
	for <alsa-devel@alsa-project.org>; Mon, 20 Nov 2023 20:22:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F08DF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dcV4yGLW
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id A59ECB81B05;
	Mon, 20 Nov 2023 19:22:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EF37C433C8;
	Mon, 20 Nov 2023 19:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700508131;
	bh=2aUp4hFQlLqMEsSFhngQ+sfVIS5arskcjqcdj3YPsdU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dcV4yGLWK2gd5PNmevD1kVTLVXpFfviSxckPidzOa2JWLOgko3w48x3HzKev+5iGp
	 mItw7ctOvCPg27iwQPQuMfoz5uFZYhUBwH9ako5qQG+fqCFVUzXOwSpNqWtxMNhjGd
	 pnABTOtCWMibZ0TGMKkho1hBWudgq7TMsLhKq3Dc1CDxTPOGvINoVe4/Qj/o9qPiKb
	 B9anjKd61F9tv8VWGiPRyb8/TMmAQi1feX+UxyWP7f9WM14oPOS5u8Z2QzV3V6pLw+
	 aN4H4Fjc2OM6h5fxhrUlCXzVdk01kjKKr0NfGo16JBiIra9n1NmFIDg8VslAmtQ0Xy
	 RSn/936gkA3cQ==
Date: Mon, 20 Nov 2023 19:22:06 +0000
From: Mark Brown <broonie@kernel.org>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ASoC: cs43130: Allow driver to work without IRQ
 connection
Message-ID: <7429d3e8-ff23-41ae-8717-b7f6091b1995@sirena.org.uk>
References: <20231120141734.76679-1-mstrozek@opensource.cirrus.com>
 <170050793178.1294254.1258854570735859586.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sbwRwMg36TnlCFW1"
Content-Disposition: inline
In-Reply-To: <170050793178.1294254.1258854570735859586.b4-ty@kernel.org>
X-Cookie: I have become me without my consent.
Message-ID-Hash: MZYAUKBL3F7HDGBMK6QLI3EHFJTYMKDD
X-Message-ID-Hash: MZYAUKBL3F7HDGBMK6QLI3EHFJTYMKDD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MZYAUKBL3F7HDGBMK6QLI3EHFJTYMKDD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--sbwRwMg36TnlCFW1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 20, 2023 at 07:18:51PM +0000, Mark Brown wrote:
> On Mon, 20 Nov 2023 14:17:34 +0000, Maciej Strozek wrote:
> > Add a polling mechanism that will keep the driver operational even in
> > absence of physical IRQ connection. If IRQ line is detected, the driver
> > will continue working as usual, in case of missing IRQ line it will
> > fallback to the polling mechanism introduced in this change.
> > This will support users which choose not to connect an IRQ line as it
> > is not critical to part's operation.
> >=20
> > [...]
>=20
> Applied to
>=20
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-=
next
>=20
> Thanks!

Sorry, this was done in error - dropped it.  Sorry for the noise.

--sbwRwMg36TnlCFW1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVbsd0ACgkQJNaLcl1U
h9Cl8gf9GgraVzbnKi3XHA7coVE5UYqFfYsUnE3OGiGtVlcIDScqqrQ5yX+UO8RT
RI4wJi6DO0g2ts4d9YKg53I7AQrmn1ouyFqggijC50nM9UPWmEFBPNew9fe9qvRM
6w2eZJQcGt1XrcN5e9TuEf24Pj72NQClQnYiWLfGfWq0mLcBJlQj0J6bUXBsYeHN
pU1GhM6OFrxrg1uiEXg6WUupMfKMDEqUHpT1zvBvLhVNs6cwSLwZoQ26LxS2QXoS
ccxORza+wdqsBbg68+sdouidwQpGVbk/1Ghn8m+nTD5Nvt6RISP+h7xuiUo7ZAaK
msoVu0O2q9MTl1jCBy6GLaZolfcPqw==
=QH8Q
-----END PGP SIGNATURE-----

--sbwRwMg36TnlCFW1--
