Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6536E8244
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Apr 2023 21:59:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 895EFEF3;
	Wed, 19 Apr 2023 21:58:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 895EFEF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681934373;
	bh=a6NaU5kg0RRe+MIkMHLjTM4S22BuexgJ9LpRMkbehO0=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pmwOxBzDocbbdN3QOPrpU+5inxOkyGHlHovjGjDxSIwOIJdDi4uQMzEkCek1I4S+q
	 G2yzA2gDTU0njITgay9KODLySou1z/AEbjfR9gomTkyFJ+oacr2uHSCPxqewl3MElE
	 KfAAWsx5DV2mN2mDNgMeUf2hkcGv59ln5OOxrczI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 39A8CF80155;
	Wed, 19 Apr 2023 21:58:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1C1CF80149; Wed, 19 Apr 2023 21:58:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CC429F80149
	for <alsa-devel@alsa-project.org>; Wed, 19 Apr 2023 21:58:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC429F80149
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1ppDwR-0005x6-CV; Wed, 19 Apr 2023 21:58:11 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1ppDwM-00CPGS-AB; Wed, 19 Apr 2023 21:58:06 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1ppDwL-00Eat3-Ez; Wed, 19 Apr 2023 21:58:05 +0200
Date: Wed, 19 Apr 2023 21:58:05 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: nau8825: fix delay time range check
Message-ID: <20230419195805.fpil775pw2wsrav4@pengutronix.de>
References: <20230419114546.820921-1-arnd@kernel.org>
 <c6bc42c6-4a98-4bb6-9639-acf4c2010b68@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k7olzqvscnyzsee5"
Content-Disposition: inline
In-Reply-To: <c6bc42c6-4a98-4bb6-9639-acf4c2010b68@sirena.org.uk>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: EJR7BY6MIYYMDCDGMXWTKYXA77HR6NPX
X-Message-ID-Hash: EJR7BY6MIYYMDCDGMXWTKYXA77HR6NPX
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Arnd Bergmann <arnd@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, David Lin <CTLIN0@nuvoton.com>,
 Arnd Bergmann <arnd@arndb.de>, Tom Rix <trix@redhat.com>,
 Peter Rosin <peda@axentia.se>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EJR7BY6MIYYMDCDGMXWTKYXA77HR6NPX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--k7olzqvscnyzsee5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 19, 2023 at 12:48:52PM +0100, Mark Brown wrote:
> On Wed, Apr 19, 2023 at 01:45:39PM +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >=20
> > clang points out that the recently added range check is nonsensical:
>=20
> Someone already sent a patch for tihs.

FTR: https://lore.kernel.org/r/20230418120955.3230705-1-trix@redhat.com

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--k7olzqvscnyzsee5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmRAR8wACgkQj4D7WH0S
/k4TkQf/T0DEUGoTk9H/hfDu9v/xHFjLghN1ZIsuA02IHW/nDmfHyCGX1I51xV/d
5zX4GHGk4AyO+qJ27KYo9K0Fj/TJKQEuR8cws86p8uqLztxDuRSLFhusRKpCjcpU
33uann83bN3tSs3cvFUuRLt/bJ/Juc4SHKKWicYvraDRHnLCKgKTZwEQDBhBFa1f
TfVZ7m1RnqSLvv4dpJ+I1IwMCVh7Q01wBM1EHSDDoit/OeyVlrkdQb13Ojz1sYs2
yzhWzY+pEEY/X+1pHmsOZUO+IWHDnlQRf2AsqDhFbA3DEf1QTqb0SWZBZeIeffeE
T7gPx9FOH5kgFoPxHly+IWO1SLLXLg==
=SxS9
-----END PGP SIGNATURE-----

--k7olzqvscnyzsee5--
