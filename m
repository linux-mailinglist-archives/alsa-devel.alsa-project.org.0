Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7DC76F1C5
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Aug 2023 20:23:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7A393E7;
	Thu,  3 Aug 2023 20:22:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7A393E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691087003;
	bh=rYzPPj1pajmgQ2TmW2GpIgJRYwl2kR2mxM9iWu7OYjo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bfcLVki/MzrHqFdDYuOkOdHl/Nu9JH5NspuA3SNh8fBzUrjUc1A5+qpopboB8WI12
	 DMXhjaUmsH59MvAHbncUUcfkG5jtOzEWnpJcO42V5Iq8phGCT9FnQysiC2cq/x0UVt
	 4pBVCYaVfu/DRS/lEP9CyEI08ERnBbenn/8DpH0E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 332FAF80544; Thu,  3 Aug 2023 20:22:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DC3C7F801D5;
	Thu,  3 Aug 2023 20:22:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3AAA4F8025A; Thu,  3 Aug 2023 20:22:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A0E12F80149
	for <alsa-devel@alsa-project.org>; Thu,  3 Aug 2023 20:22:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0E12F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=m6aJL/mR
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5ABD261D61;
	Thu,  3 Aug 2023 18:22:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94685C433C7;
	Thu,  3 Aug 2023 18:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691086943;
	bh=rYzPPj1pajmgQ2TmW2GpIgJRYwl2kR2mxM9iWu7OYjo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m6aJL/mRpVeQmNONdk7XxK2AOhD3aqkWHWLT9qV9Ktw2/Dt/gpNObxCUZ9JYjZYpw
	 gP9Kt3vD0bkHcpyKO+CEM1X83XC5marYngM7sWTtf23hVjmsKZQIQ3tHvXv00g7f0Y
	 RQqt5TvhRGAyGY51SzwYWWEKUYWpnAEyZ/96SIb1BYipcXpWbV86/dQJw4+hQnTDsP
	 NMGDEZwSdI12lx6uDzVl8h5Ai4O3iqdN3NqTIgp8RAS+LyTggF9ihk/SBBgTNOePls
	 Bd+/EEbK2FMcxSMzxYPL3TNaIxVyLhvq2G96s0w6ZF+or2qQRIn+FjJXyVz83Je+VX
	 OdxN8LqfnCGAw==
Date: Thu, 3 Aug 2023 19:22:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v2 RESEND*3] ASoC: fsl MPC52xx drivers require
 PPC_BESTCOMM
Message-ID: <4be1bfef-9f66-4fa8-bb8b-57e25fbba729@sirena.org.uk>
References: <20230803025941.24157-1-rdunlap@infradead.org>
 <9581313f-5340-455d-a75d-dc27d2eb3ec0@sirena.org.uk>
 <63bc327d-999a-1654-e7b5-6bcfd7477a32@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g3EJGwd85dmsC6Ch"
Content-Disposition: inline
In-Reply-To: <63bc327d-999a-1654-e7b5-6bcfd7477a32@infradead.org>
X-Cookie: One Bell System - it works.
Message-ID-Hash: YU5DDO74J6WQMPZ2IX43WY4YTYH5FCFG
X-Message-ID-Hash: YU5DDO74J6WQMPZ2IX43WY4YTYH5FCFG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YU5DDO74J6WQMPZ2IX43WY4YTYH5FCFG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--g3EJGwd85dmsC6Ch
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 03, 2023 at 11:09:43AM -0700, Randy Dunlap wrote:
> On 8/3/23 04:27, Mark Brown wrote:
> > On Wed, Aug 02, 2023 at 07:59:41PM -0700, Randy Dunlap wrote:

> >> Both SND_MPC52xx_SOC_PCM030 and SND_MPC52xx_SOC_EFIKA select
> >> SND_SOC_MPC5200_AC97. The latter symbol depends on PPC_BESTCOMM,
> >> so the 2 former symbols should also depend on PPC_BESTCOMM since
> >> "select" does not follow any dependency chains.

> > Take a hint, it's not clear that the patch is tasteful.

> Thank you for replying.  I'll drop it and just report the build errors.

To be clear I generally don't give you review comments because in the
past I grew so frustrated with having them and their escalations
ignored that it seemed better to just not start.  If the patch seems
fine I generally apply it, usually you just don't resend patches so that
works.=20

--g3EJGwd85dmsC6Ch
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTL8FkACgkQJNaLcl1U
h9A2ZAf/cC6V/6CosGIVhHjsgdpesC1xuhx10tq2L5C4HOOufOJXJ7KEEw9YRJl7
NbAWAp2aavscsub/zcP3OzBDFZ9vDRcYDniGIOdt9rv+JGtURTv8aFrbQdBFAAWR
KXfprV0EWwi45+heZNxo6a53tlFYu7Q0h5mVaI7O0R6wbMRr3z92A3BaCH1Eq3/8
6QZkJal7oeNWoHVHwUGSMb3PoqbRVadxYEWudjYGsAVhJ0IdHWyh1G6cx69iIOMz
DCVffJQOXcvvtkmc+oYvd2zfYT2sDSMcpRVBptb/2Dsy9gaaN3CwG9E/Agu4Li5L
WgG5XZBI+Jy/KxTlgICIsEVFG2bjvA==
=Nre9
-----END PGP SIGNATURE-----

--g3EJGwd85dmsC6Ch--
