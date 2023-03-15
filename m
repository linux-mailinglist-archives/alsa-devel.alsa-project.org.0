Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D756BB9A8
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 17:27:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2B51134D;
	Wed, 15 Mar 2023 17:26:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2B51134D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678897622;
	bh=CwSs/CpgMYsyT7tBqe4pATuLM71TcCTlLaVbFhCxu9Y=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kRu0S6tibmWPTFt2V5lwINvRPi61bsPtP7zHykQRRtPMCY1c34OWyCt8FDzmEE91a
	 KRBL2ieJs4GWAFKa2MAJ8kOqdMkuQxc95GhZ/F8v6C/NsIzS8zn8O1ZfzN/OIbRlvA
	 THhYGD9X0CTCK3fbLGO5llcyfdm41BaJBr8pKLsI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 00797F8032D;
	Wed, 15 Mar 2023 17:26:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B8BCF80423; Wed, 15 Mar 2023 17:26:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 174D2F80093
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 17:26:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 174D2F80093
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcTwp-0005Mq-1t; Wed, 15 Mar 2023 17:25:55 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcTwl-004LiI-Ql; Wed, 15 Mar 2023 17:25:51 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcTwk-005933-TO; Wed, 15 Mar 2023 17:25:50 +0100
Date: Wed, 15 Mar 2023 17:25:47 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
Subject: Re: [PATCH 120/173] ASoC: rockchip: rockchip_i2s_tdm: Convert to
 platform remove callback returning void
Message-ID: <20230315162547.5ccghwu5kblefcao@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
 <20230315150745.67084-121-u.kleine-koenig@pengutronix.de>
 <3717794.rJMogTuNcH@archbook>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bfjtlbmpqubgku6t"
Content-Disposition: inline
In-Reply-To: <3717794.rJMogTuNcH@archbook>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: GW2VA5CT2ADCIHJORDD775DO7RW4QWNV
X-Message-ID-Hash: GW2VA5CT2ADCIHJORDD775DO7RW4QWNV
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>,
 linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GW2VA5CT2ADCIHJORDD775DO7RW4QWNV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--bfjtlbmpqubgku6t
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 15, 2023 at 05:00:49PM +0100, Nicolas Frattaroli wrote:
> On Mittwoch, 15. M=E4rz 2023 16:06:52 CET Uwe Kleine-K=F6nig wrote:
> > The .remove() callback for a platform driver returns an int which makes
> > many driver authors wrongly assume it's possible to do error handling by
> > returning an error code. However the value returned is (mostly) ignored
> > and this typically results in resource leaks. To improve here there is a
> > quest to make the remove callback return void. In the first step of this
> > quest all drivers are converted to .remove_new() which already returns
> > void.
> >=20
> > Trivially convert this driver from always returning zero in the remove
> > callback to the void returning variant.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> Hello,
>=20
> this looks fine, but the commit prefix should either be
> "ASoC: rockchip: i2s_tdm:" or "ASoC: rockchip: i2s-tdm" to align
> with previous commits. We've already broken convention once before,
> hence the two names, and I'd rather not have this convention broken
> again.

I fixed that in my tree. I assume Mark will skip this patch when
applying and when I come around cleaning up the fall-out I will resend
this one with the subject fixed. (I picked the variant with _ now as
this seems to be the more recent one.)

Thanks for the feedback
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--bfjtlbmpqubgku6t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmQR8YgACgkQwfwUeK3K
7AlK/Af+NWFZfi8QLk2cKG4X0JaQKjI1gcIExYzIW+fzuj91q5eOaqZn8o7Cwr0w
iCShZRaieuefb5do5+AhU5OFC1kG8mL8gXoq9vOp0yFhgdFssknREzIFuAqQQ+fs
ICwyeJ6M0VNd12hvpYf9uWR6yk/E53ktvYi4ybhW1dflOE108bMsjmZ3NIDpouML
vULhI+Lh1ik18b3tpBUzb2umC0hLo41X7GuAtYPv3U+quntBkNuTGyJCe6VgFoR2
h/m8YZXTBf311MDJ6MmGQW430q47F6C/DBBYBO+5vom0iVU0lmMS4Khs77kn4PXp
kHuDcRfRLfyIT8CFSSLlogvxz+NTMg==
=G6QF
-----END PGP SIGNATURE-----

--bfjtlbmpqubgku6t--
