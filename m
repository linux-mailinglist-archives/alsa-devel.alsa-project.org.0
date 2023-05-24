Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E5970F6A1
	for <lists+alsa-devel@lfdr.de>; Wed, 24 May 2023 14:37:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D3091EC;
	Wed, 24 May 2023 14:36:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D3091EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684931828;
	bh=6azGPYo4HE4MOwk+GOtH1Ev1feI3M+XZsbmx1stI+Rk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WDfWAuaccdJ1O+bjoTkFn794HiXqIoSkk0eA/Ec/sair2NqMTsDtz87nH5S9UGIsA
	 KVtkN0O9VWC5Wq1PhJr/oMcWinEiFfPAOmP0ajsGAJpos3J1gDvAbKywqMWGi0MZXq
	 7nJkJTmE7542IGWpxHEpDyiDTGbCTXSYzGXjfNIk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3846CF80086; Wed, 24 May 2023 14:36:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C6D51F8016A;
	Wed, 24 May 2023 14:36:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1EAB3F80249; Wed, 24 May 2023 14:36:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6AF94F80053
	for <alsa-devel@alsa-project.org>; Wed, 24 May 2023 14:35:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AF94F80053
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1q1nib-00080c-CC; Wed, 24 May 2023 14:35:53 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q1niY-002URL-Vz; Wed, 24 May 2023 14:35:51 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q1niY-007Ygk-95; Wed, 24 May 2023 14:35:50 +0200
Date: Wed, 24 May 2023 14:35:47 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, pierre-louis.bossart@linux.intel.com,
	alsa-devel@alsa-project.org, patches@opensource.cirrus.com
Subject: Re: [PATCH] ASoC: cs35l45: Relicense to GPL only
Message-ID: <20230524123547.inixua4uwypttn4m@pengutronix.de>
References: <20230510092534.3919120-1-ckeepax@opensource.cirrus.com>
 <20230524090556.GC68926@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6o7dkdstgta35bdu"
Content-Disposition: inline
In-Reply-To: <20230524090556.GC68926@ediswmail.ad.cirrus.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: 6SJDZOEW7ZACBKYLSJYRJF6PCEUDA4WP
X-Message-ID-Hash: 6SJDZOEW7ZACBKYLSJYRJF6PCEUDA4WP
X-MailFrom: ukl@pengutronix.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6SJDZOEW7ZACBKYLSJYRJF6PCEUDA4WP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--6o7dkdstgta35bdu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Charles,

On Wed, May 24, 2023 at 09:05:56AM +0000, Charles Keepax wrote:
> On Wed, May 10, 2023 at 10:25:34AM +0100, Charles Keepax wrote:
> > Cirrus never intended to upstream dual licensed code, convert to
> > GPL only.
> >=20
> > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > ---
> >=20
> > Apologies for this but this was never our intention and I believe that
> > it can be a little legally involved maintaining dual licensed kernel co=
de.
> > Fortunately not that many people outside of Cirrus have contributed to
> > the files in question. I have CCed everyone who has contributed both
> > internally and externally.
>=20
> Pierre, Uwe,
>=20
> Apologies for chasing but it would be really helpful to get an
> ack for this one, we need the approval of everyone who
> contributed to fix the licensing issue.

I'd say removing a license option isn't so critical; and my contribution
probably isn't relevant for the copyright, but INAL and for avoidance of
doubt:

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--6o7dkdstgta35bdu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmRuBKIACgkQj4D7WH0S
/k5olgf7BDIiY/dqgkPuB0MzWyahmLx81EHrw04Z0zbUg/145ryr0USWf2RfKjH8
Hn8moUPPyUJvlXXlnxM9agjGXpsEM860poQN3umSJqBjNHn+tJonHT72+CIDLYZ1
yOO52nhWdWvgX1az7/CmdY5eIH4uBMVeC/eaiw5/5WUIwcn9NQoTScR6D8HgrTwk
d07oHnYxyKLFtxL61OLFKfIvY9weA78xZ4aKI9myqWePS9engf/QvTOgpr9m2aGx
qkqUx/W8EKYNpTsCNXvXOLpakNKs4uwPibiIhQ8byHTQtRJMT3ZWZvTvDDjDofbz
00ca9a8ZCvanrVcXiqgQalYKfsj2mw==
=U/BL
-----END PGP SIGNATURE-----

--6o7dkdstgta35bdu--
