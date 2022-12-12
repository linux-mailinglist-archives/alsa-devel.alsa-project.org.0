Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB3764A95A
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Dec 2022 22:14:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F0EE21EB;
	Mon, 12 Dec 2022 22:13:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F0EE21EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670879640;
	bh=1VLKUgyRFbn/6epVxyfeviW2OfK8gPEmTHcUA0AV+NU=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=nG+fzuDg93LnGmspxIpCN7/q5SxJ6Snfd6C+xlUGH6rgjtc10/6xvOO9qUojPG1y0
	 ljSSKmd8JHSN2XJXh6wOg/0TOFlULH2wqAhkBw40xctLOjuU9VPhNB1PkLiDVU5t/N
	 znFObC5ifiIFam6wIB50W0wOqSztNxagt3H/HcTw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7EAEF80141;
	Mon, 12 Dec 2022 22:13:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85519F8042F; Mon, 12 Dec 2022 22:13:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=RCVD_IN_DNSWL_LOW,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2302BF800F8
 for <alsa-devel@alsa-project.org>; Mon, 12 Dec 2022 22:12:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2302BF800F8
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1p4q6c-0005I4-J5; Mon, 12 Dec 2022 22:12:58 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p4q6a-004692-Lf; Mon, 12 Dec 2022 22:12:57 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p4q6a-004bDG-KK; Mon, 12 Dec 2022 22:12:56 +0100
Date: Mon, 12 Dec 2022 22:12:56 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH] ASoC: pxa: Drop empty platform remove function
Message-ID: <20221212211256.dbmawjyllu6abjdb@pengutronix.de>
References: <20221212174737.3740223-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ao3i6ewcx7qnx35i"
Content-Disposition: inline
In-Reply-To: <20221212174737.3740223-1-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 kernel@pengutronix.de
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--ao3i6ewcx7qnx35i
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Dec 12, 2022 at 06:47:37PM +0100, Uwe Kleine-K=F6nig wrote:
> A remove callback just returning 0 is equivalent to no remove callback
> at all. So drop the useless function.

huh, I sent this out twice by mistake. I suggest you ignore this one and
pick up the other one that is part of a series. (i.e.
https://lore.kernel.org/alsa-devel/20221212205406.3771071-2-u.kleine-koenig=
@pengutronix.de/).

Sorry for the duplicate,
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ao3i6ewcx7qnx35i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmOXmVUACgkQwfwUeK3K
7AlNNwf/X9nDZKLBBfk5OJoex5EViZBLurIwNueWnmLBk3r/+LWtlQO+awf8BjqF
j83sNhyqFzLRgcs+cd6EF0AN58ufn/alonXuu/tr3RKzv7fz4ZI7UI9auJjmDyQg
WeSArEdYRQKbETFCAtlPYiqhvOiYJ09HqRfqEXjTvCVzem/iKt8Euatu07yR4Ifa
6h05h15CKD0z/YbhJeM+gsWuaz/yLf/RmzRxfPLA7HkVzI2XqybvTXXyRs9VnrJ9
ZkuhPJgAemByvwifICqLD3LDbGiqLCP+sTrbEHBLRS6Cxmege/mVFQ+144j5qb51
hO+7KzaCcLJzCPcya2nQFbU/gZigpQ==
=be9V
-----END PGP SIGNATURE-----

--ao3i6ewcx7qnx35i--
