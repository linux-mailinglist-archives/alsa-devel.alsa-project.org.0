Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E49342C6AB0
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Nov 2020 18:36:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DE76185D;
	Fri, 27 Nov 2020 18:35:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DE76185D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606498601;
	bh=GXrNEq+mpKTb8Ynu2BrRfzQt0flqEwQ86s85M6Hlzns=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X6+6ybv2STvSg01fNk8wwoqU7ZD3M25+pSc+xzTD6lYxT8O7CI0c5t1qDVQ65wZL2
	 G4YhLDiC/aawQ1S6wKMdyYf5E7nacR9GSRfopPSZRoFdOndHF4kdbf557blJLCKjNa
	 Ju9HW0fXDG+V5yL26jVBEIFmucEM24aSJkplw6HQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05D53F800E0;
	Fri, 27 Nov 2020 18:35:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70787F8019D; Fri, 27 Nov 2020 18:35:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EBBD0F800EA
 for <alsa-devel@alsa-project.org>; Fri, 27 Nov 2020 18:34:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBBD0F800EA
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1kihdj-0007Oz-Uy; Fri, 27 Nov 2020 18:34:35 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1kihdg-00033s-JD; Fri, 27 Nov 2020 18:34:32 +0100
Date: Fri, 27 Nov 2020 18:34:30 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Leonard Goehrs <l.goehrs@pengutronix.de>
Subject: Re: [PATCH] ALSA: ppc: remove redundant checks in PS3 driver probe
Message-ID: <20201127173430.cdfufayj3cbytdx7@pengutronix.de>
References: <20201127094547.4zcyeycfrriitkqx@pengutronix.de>
 <20201127152259.1470079-1-l.goehrs@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="x2xoi2yg7vw2oj4d"
Content-Disposition: inline
In-Reply-To: <20201127152259.1470079-1-l.goehrs@pengutronix.de>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: alsa-devel@alsa-project.org, geoff@infradead.org, mpe@ellerman.id.au,
 tiwai@suse.com, paulus@samba.org, kernel@pengutronix.de,
 benh@kernel.crashing.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linuxppc-dev@lists.ozlabs.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--x2xoi2yg7vw2oj4d
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hallo Leonard,

On Fri, Nov 27, 2020 at 04:22:59PM +0100, Leonard Goehrs wrote:
> The check for the FW_FEATURE_PS3_LV1 firmware feature is already performed
> in ps3_system_bus_init() before registering the driver. So if the probe
> function is actually used, this feature is already known to be available.
>=20
> The check for the match id is also superfluous; the condition is always
> true because the bus' match function (ps3_system_bus_match()) only
> considers this driver for devices having:
> dev->match_id =3D=3D snd_ps3_bus_driver_info.match_id.
>=20
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Leonard Goehrs <l.goehrs@pengutronix.de>

Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Thanks for picking this up.

Best regards and have a nice week-end,
Uwe Kleine-K=F6nig

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--x2xoi2yg7vw2oj4d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl/BOKMACgkQwfwUeK3K
7AmJhwf+OJGfgynfv6pDuxi0y6ZDfmonepwmPvArhPNxed/UewGad/XtUkRxuh+S
axBDPcdEC8mxvW+ZyO+DMQY0zzQql63e+Ao1/g5SnP1MxuxWIndeMC/94SQy0IaJ
URI1y9N7cabNRalVvc6WMf7mNl8yfWU5SJBQt8DRh7VB+YlbywCWMfSc/bXC1nV6
GkgVRpAEeMs6tX8/9U1zvwzjMzXdm78Hy3Ptcz6E+PtcAXjs1QIXgsjWrKlBXr7b
kjc8Z6uIRjvIKOrDAQuiP4Zplq359Zy0FDPUoM0U6e2llQ5GT1EEW7nKwvcd9/Ri
1bhMMe4KNa+o8mDqBWVq0V9OQvDAlA==
=/9Ch
-----END PGP SIGNATURE-----

--x2xoi2yg7vw2oj4d--
