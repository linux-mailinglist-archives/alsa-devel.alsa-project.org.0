Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7CD2C6231
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Nov 2020 10:48:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AA17183C;
	Fri, 27 Nov 2020 10:48:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AA17183C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606470534;
	bh=tprdCQD5Y8i/C/vepKcDcXbny+Nvw18X2JVDNBtroJU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NELtN9ijo+XpnKyPAI61N/9byuQHDeabko5Yp032KmjTFy1ot8111XmtBdb3uo7O6
	 uSxo934zA2f0woe4jAYEbLnExzYp14pyxjpk8cs1f9n0li5v7JHzfTGUjvp8LGRjKT
	 h7qgpGdMO52WoQ0zr/KCOU9Vov37gk903hyjcZ58=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A4EAF80218;
	Fri, 27 Nov 2020 10:47:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 050C1F8019D; Fri, 27 Nov 2020 10:47:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C63BDF800EA
 for <alsa-devel@alsa-project.org>; Fri, 27 Nov 2020 10:47:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C63BDF800EA
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1kiaKC-0005UC-C7; Fri, 27 Nov 2020 10:45:56 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1kiaK4-0002Ad-OH; Fri, 27 Nov 2020 10:45:48 +0100
Date: Fri, 27 Nov 2020 10:45:47 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/2] ALSA: ppc: drop if block with always false condition
Message-ID: <20201127094547.4zcyeycfrriitkqx@pengutronix.de>
References: <20201126165950.2554997-1-u.kleine-koenig@pengutronix.de>
 <CAMuHMdUbfT7ax4BhjMT_DBweab8TDm5e=xMv5f61t9QpQJt1mw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="taccm5e5wyznne4d"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUbfT7ax4BhjMT_DBweab8TDm5e=xMv5f61t9QpQJt1mw@mail.gmail.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Paul Mackerras <paulus@samba.org>, scsi <linux-scsi@vger.kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Alan Stern <stern@rowland.harvard.edu>,
 Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, linux-block@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Geoff Levand <geoff@infradead.org>, netdev <netdev@vger.kernel.org>,
 USB list <linux-usb@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Jim Paris <jim@jtan.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
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


--taccm5e5wyznne4d
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2020 at 09:35:39AM +0100, Geert Uytterhoeven wrote:
> Hi Uwe,
>=20
> On Thu, Nov 26, 2020 at 6:03 PM Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> > The remove callback is only called for devices that were probed
> > successfully before. As the matching probe function cannot complete
> > without error if dev->match_id !=3D PS3_MATCH_ID_SOUND, we don't have to
> > check this here.
> >
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> Thanks for your patch!
>=20
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
>=20
> Note that there are similar checks in snd_ps3_driver_probe(), which
> can be removed, too:
>=20
>         if (WARN_ON(!firmware_has_feature(FW_FEATURE_PS3_LV1)))
>                 return -ENODEV;
>         if (WARN_ON(dev->match_id !=3D PS3_MATCH_ID_SOUND))
>                 return -ENODEV;

I had to invest some brain cycles here. For the first:

Assuming firmware_has_feature(FW_FEATURE_PS3_LV1) always returns the
same value, snd_ps3_driver_probe is only used after this check succeeds
because the driver is registered only after this check in
snd_ps3_init().

The second is superflous because ps3_system_bus_match() yields false if
this doesn't match the driver's match_id.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--taccm5e5wyznne4d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl/AyscACgkQwfwUeK3K
7AmVbAf/fRHKZiIEMqPckqCjNor4UCILZvO1NJYHzctpPGBT8dETRjBW1ZmWu6MS
qxv4y7aGSfc8pP5G0LU1rJJYOf7x8PpHEbm5uNM1UOIxzSIniALG7VIeoFIBrGoQ
QuMcTv73n6ypzsNu87ynqrILEVYNrubD+Sb6B2xZEfPbIcvvwKfUvr8+lBEkabHX
LbBbYbLL/ivRvUFm/YKvY3vcnTTAj88lURLp6V8EPT+8/TDr7Bfuy5LyjFsKAYsq
QXNTBRLT8unlG99XvN4urWFVs9NMPKKWgV/e14LGumeL+mM8EQi+UPCnMTPOErWb
F4a+SZgp6g00Syvd8mJVlWUKEkQUOg==
=P7Le
-----END PGP SIGNATURE-----

--taccm5e5wyznne4d--
