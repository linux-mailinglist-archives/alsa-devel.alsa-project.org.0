Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5924E6BCB73
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 10:52:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BEB11127;
	Thu, 16 Mar 2023 10:51:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BEB11127
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678960337;
	bh=wGIXAVg9sUupiAbc3biSEOn9G2QeWN58zS2KUhXQG9w=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UdTO1aggipY1M1jpZ06aVRgeMJ0/r/rqGtgq6PQEB7R9iRns0lUrh/jJ+87ueJwty
	 hRGtktiEdF1StOGR94KGsgEQPjq+bw8pKTF2rgIqWIR8GgmSbXDORLbiYNMmnfYYnX
	 wsZYAxpJq/0Dt25AKEcSDzAPtNodExjF15mKs/6k=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 29414F8032D;
	Thu, 16 Mar 2023 10:51:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67AF6F80423; Thu, 16 Mar 2023 10:51:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 79E73F80272
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 10:51:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79E73F80272
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pckGM-0005xR-CZ; Thu, 16 Mar 2023 10:51:10 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pckGL-004WFF-Du; Thu, 16 Mar 2023 10:51:09 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pckGK-005LFx-I7; Thu, 16 Mar 2023 10:51:08 +0100
Date: Thu, 16 Mar 2023 10:51:08 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 000/173] ALSA/ASoC: Convert to platform remove callback
 returning void
Message-ID: <20230316095108.d2dphmu3psppoawu@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
 <17d833f6-5e7c-4016-9dd5-0305891fddc2@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wmfdfku4klvnpved"
Content-Disposition: inline
In-Reply-To: <17d833f6-5e7c-4016-9dd5-0305891fddc2@sirena.org.uk>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: R7ZYPFFK3OECD73WYQHLJMBZJZWESPC7
X-Message-ID-Hash: R7ZYPFFK3OECD73WYQHLJMBZJZWESPC7
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R7ZYPFFK3OECD73WYQHLJMBZJZWESPC7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--wmfdfku4klvnpved
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 15, 2023 at 05:23:23PM +0000, Mark Brown wrote:
> On Wed, Mar 15, 2023 at 04:04:52PM +0100, Uwe Kleine-K=F6nig wrote:
> > Hello,
> >=20
> > this series adapts the platform drivers below sound/ to use the .remove=
_new()
> > callback. Compared to the traditional .remove() callback .remove_new() =
returns
> > no value. This is a good thing because the driver core doesn't (and can=
not)
> > cope for errors during remove. The only effect of a non-zero return val=
ue in
> > .remove() is that the driver core emits a warning. The device is remove=
d anyhow
> > and an early return from .remove() usually yields a resource leak.
>=20
> ALSA and ASoC patches generally get applied to separate trees so it's
> probably better to send them separately unless there's dependencies.

OK, I should have considered that giving that the subject prefixes are
also different, sorry. I hope to remember that for the next quest.

I won't resend this series split in two for this development cycle but
address this for the next merge window, taking into account patches
that were applied despite your hint.

As things stand now that would be for ALSA:

	b4 am -l -t -P1,3-12,172-173 20230315150745.67084-1-u.kleine-koenig@pengut=
ronix.de

and for ASoC:

	b4 am -l -t -P2,13-119,121-171 20230315150745.67084-1-u.kleine-koenig@peng=
utronix.de

Oh, but I see Takashi suggested to take them all via ASoC, in this case
just skip patch 120.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--wmfdfku4klvnpved
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmQS5okACgkQwfwUeK3K
7Aktvwf+I0ZtehsTb/e5ehn+qIpOAoXDoeJmGynRfus62Jy6U0QfqemEDV8uvZOx
IW9UQ0XzE41bwAtv8oNp3qhOSvPz1AJ221UZmyu6vJnmHXBNSoEZ1dx0r5pl+O8r
z4k97SlPym2gcxzMbmydqLA3caHyhGOC0IotlY3NQuQqmw0nzIVaDmts9JqpwExw
qna8885VWyPViwsb08GYE9VDjKxHgnssK1aS2qGaTk88t1dAf8XVOfBd9SqTsGqC
iEUnJGoLMcFpHfWmvjKsW7wPqYgM6NtT3uBgmU9vKwwKvUu0he9nrI/yHq/KHkT+
sCQLl2r+Fkafvmg3rIzOhndfR3TBsg==
=BE1D
-----END PGP SIGNATURE-----

--wmfdfku4klvnpved--
