Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEF678FE58
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Sep 2023 15:34:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BD81DF8;
	Fri,  1 Sep 2023 15:34:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BD81DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693575298;
	bh=53riXEAEWBAWwbcpkoj7HSeYZAeJjS2cmm5QdmWuqHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lsVhc9u9swgrIbJ5zl/syB8U4BYp2Y+r2IxE/2Dc+7PFiPEHlZy5hF28CBUz7/0l6
	 dIBbcgzxmCXWdimNywcF+ZkyJyvVA+NRBOb6/wZm2mGn8qUINUaxOBz9DtS6cDPtTk
	 MwHtbDjQhTXkeh91wI927GrWfJy7qwXd2G3nqOUc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5159BF80236; Fri,  1 Sep 2023 15:34:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F1402F80155;
	Fri,  1 Sep 2023 15:34:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1125F80158; Fri,  1 Sep 2023 15:34:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B3C1BF80074
	for <alsa-devel@alsa-project.org>; Fri,  1 Sep 2023 15:33:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3C1BF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tQUHjIH7
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 92BEECE238D;
	Fri,  1 Sep 2023 13:33:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 098A9C433C8;
	Fri,  1 Sep 2023 13:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693575228;
	bh=53riXEAEWBAWwbcpkoj7HSeYZAeJjS2cmm5QdmWuqHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tQUHjIH7xxLqDQtDrWnKbVZwBPduSgA+oBpsUMp4nKqE3sLvpg+vz1UhIV8CxGJxK
	 EtSSQPucmr6BOvc7DuY/jTH7mbZEWh9ZMddh6thfQ6l9zLczXHvkjZiuixtTCD67F1
	 hpey3bQYVLjFoWRs3xk3KCL769dTBbzgIFLjEGRYBBjxO+4vcZ9XS/YAyccV+//0Pw
	 hXO9mBSoa01sdNrOWoa085J7gAr909UMJx4lElTUrnuvYrj0pUFGd4ocAPhnmBaTrw
	 GEBh0bYqpINw67DuaI9Sr7bIT4obRLOpLsjMKynU5QYknov64d+R9uSC+bJTmdiSFW
	 1FjzVc1fyvXTA==
Date: Fri, 1 Sep 2023 14:33:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH v4 2/3] ASoC: wm8580: Remove trailing comma in the
 terminator entry
Message-ID: <c4c13a22-39c4-404a-8c53-c110e44a9b56@sirena.org.uk>
References: <20230901065952.18760-1-biju.das.jz@bp.renesas.com>
 <20230901065952.18760-3-biju.das.jz@bp.renesas.com>
 <ZPGmiWDErxnjGlMR@smile.fi.intel.com>
 <baefefc8-55d7-430a-9ec5-2c17c4577d11@sirena.org.uk>
 <ZPHk9tSC64clliFc@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="R5XR92iKDBMMA7+G"
Content-Disposition: inline
In-Reply-To: <ZPHk9tSC64clliFc@smile.fi.intel.com>
X-Cookie: Dealer prices may vary.
Message-ID-Hash: PYOUSCD45SMUAWVMI4L5PRDVNENWB6QK
X-Message-ID-Hash: PYOUSCD45SMUAWVMI4L5PRDVNENWB6QK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PYOUSCD45SMUAWVMI4L5PRDVNENWB6QK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--R5XR92iKDBMMA7+G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 01, 2023 at 04:19:50PM +0300, Andy Shevchenko wrote:
> On Fri, Sep 01, 2023 at 01:54:58PM +0100, Mark Brown wrote:

> > So do reviews which focus on very pedantic issues like this one...

> If you fine with a series as is, take it!

We are in the merge window right now so if I queue things I won't
actually apply them until the merge window is closed, meaning I need to
keep track of what's queued already when new versions come in or
whatever.

> It's really nothing to bikeshed about.

Well, quite.  What I do for these very minor issues if I do end up
commenting on them is mention them but explicitly say that the comment
is more for future reference and there's no need to resend.

--R5XR92iKDBMMA7+G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTx6DUACgkQJNaLcl1U
h9B4tgf+PMzMgvBAKiUpSFPeQBFd8Wuv/pTMGwku/Pi+AExyReaSaaxXWEUdlQrp
C1iGcgBCXhqJB4y8oUxoq2BecmIbdVdSS7Hb9gAnAI3Gg4cDcADuptzBNBckTmFK
3y0ma+g2KvjtLtfoe9biMTyrR4sq2AWqYBzpacoesW6ybygk4kqDkvyKvd3yYaDW
5BFwZBjKtrrPkvXvLO2ho+6u6cc9wMqAPKJyfksBBXPQQITzFYDpgMIH7LF4viQg
JIhmzHobXVVYOKHc9Mchpwn/Z/WrAJ1AxDiuuxI7Epa5Eut1HJ2aPyhIALEZFbFN
R4+DpGuSDF/Se5fH1vEj1vf0ic1sLA==
=90P1
-----END PGP SIGNATURE-----

--R5XR92iKDBMMA7+G--
