Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC506902E4
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 10:09:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 548F7843;
	Thu,  9 Feb 2023 10:08:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 548F7843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675933741;
	bh=VgHU7rBJD/3tlIXi88+gfTJYsOVjFNN5yiiAIKXKgJo=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SNyU5mLsbqtoIzylhTsbZ7Y4dq6yh48iEj8P946nV/RtRNZswGO02OUftJoex6ln2
	 0rBXIv0WwIskGps7S0SKiyzbyLmWihq8PwzmmS+T0TBotTyAXcMAixpYdi7lYei2TZ
	 1ThKRPndc9EPVrAIcQPGEKgfDZ2EppXV8UP74u9M=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FE1BF800B8;
	Thu,  9 Feb 2023 10:08:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04A5AF800E4; Thu,  9 Feb 2023 10:08:06 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C2EABF80094
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 10:07:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2EABF80094
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pQ2uJ-0006Y8-H3; Thu, 09 Feb 2023 10:07:55 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pQ2uE-003hbb-AD; Thu, 09 Feb 2023 10:07:51 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pQ2uE-0025Jv-Et; Thu, 09 Feb 2023 10:07:50 +0100
Date: Thu, 9 Feb 2023 10:07:50 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: ppc: fix unused function local variable
Message-ID: <20230209090750.ex7jh65fhbuluqkz@pengutronix.de>
References: <20230209002548.94496-1-o-takashi@sakamocchi.jp>
 <87bkm3xqs9.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3gu23t2xjpqeqkg7"
Content-Disposition: inline
In-Reply-To: <87bkm3xqs9.wl-tiwai@suse.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: U6NGGLWUS6POVKODWO732SUFUGTVXML5
X-Message-ID-Hash: U6NGGLWUS6POVKODWO732SUFUGTVXML5
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, Stephen Rothwell <sfr@canb.auug.org.au>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U6NGGLWUS6POVKODWO732SUFUGTVXML5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--3gu23t2xjpqeqkg7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 09, 2023 at 08:05:10AM +0100, Takashi Iwai wrote:
> On Thu, 09 Feb 2023 01:25:48 +0100,
> Takashi Sakamoto wrote:
> >=20
> > The function local variable is not used anymore, while it is left.
> >=20
> > This commit deletes it.
> >=20
> > Fixes: 25a5a77ae0bc ("ALSA: core: Make snd_card_free() return void")
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Link: https://lore.kernel.org/r/20230209104823.45899e76@canb.auug.org.a=
u/
> > Cc: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
>=20
> Thanks, applied.

Thanks for cleaning up after me. The patch looks fine.

Maybe already to late, but for completeness:

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--3gu23t2xjpqeqkg7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmPkt+MACgkQwfwUeK3K
7AmGNgf/fTDfPMzdZSpAXSXt2gCEJJvKpqdfWOzDhsq4gpI8croeh5kz5vHHmbkh
ISXBU7zwDW7VZuK78ppDBYgLyNbQCKMP9Sq1iv/pmcmGZ25LKOiNdXl86cNTlOpD
Mrk0XBSiYttgrrDgOZANri2d+rYtKoft71HeGZb8KZOTfgUcHOdN9Z+4fuGDXoia
zumWDKVBPF8gru0YJ5fP/snAt27N+w+SvddDo6AKEjTzhL8V4tPaJjBheOWrC4d1
ATw66s2n0mMrdmeIKXY7p4I3+LtIIt9aemlUM84z7c26DSGPEj0Rb615ZDT4K8bd
v02SkBEBGHQGqFAnazAUpnwfsUpPPg==
=5fDu
-----END PGP SIGNATURE-----

--3gu23t2xjpqeqkg7--
