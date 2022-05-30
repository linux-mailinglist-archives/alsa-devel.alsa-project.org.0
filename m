Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AB453882E
	for <lists+alsa-devel@lfdr.de>; Mon, 30 May 2022 22:21:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A8B11FDD;
	Mon, 30 May 2022 22:20:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A8B11FDD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653942063;
	bh=XbFAPiwcCHikey+nJp8pCVWkW4eoxgwwS1goDUKIfxU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SNJd/PnI+/paT9b7PYWHC1gxr0ZGx6QjGVq25upjUUsvlMUXWvhA5IoxF0Mp/U+Ni
	 1bQFtALLP3/+Z2nwkgX2Q7vB6q0ExotQUORdmTouwvIL+LACsmkcd94K1mt2Q20SdV
	 DmhyKIHXAohoYQaik0HEhxY7JrbWsB57OUfUX7CU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E46D0F8012F;
	Mon, 30 May 2022 22:20:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22674F8019D; Mon, 30 May 2022 22:20:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A06EF800DE
 for <alsa-devel@alsa-project.org>; Mon, 30 May 2022 22:19:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A06EF800DE
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nvlrh-0000Tv-QE; Mon, 30 May 2022 22:19:49 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nvlrg-005W6X-6Y; Mon, 30 May 2022 22:19:46 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nvlre-00DAN1-5k; Mon, 30 May 2022 22:19:46 +0200
Date: Mon, 30 May 2022 22:19:46 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: Intel: avs: Fix build error on arc, m68k and sparc
Message-ID: <20220530201946.4pqljnpcts6ms557@pengutronix.de>
References: <70daa951-4f77-3336-0567-e72e9e5e36c6@intel.com>
 <20220529141250.1979827-1-u.kleine-koenig@pengutronix.de>
 <YpTGzFNeZe+pGM2j@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xwddooe5fwux7a7t"
Content-Disposition: inline
In-Reply-To: <YpTGzFNeZe+pGM2j@sirena.org.uk>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 rad@semihalf.com, alsa-devel@alsa-project.org, tiwai@suse.com,
 hdegoede@redhat.com, lma@semihalf.com, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, Guenter Roeck <linux@roeck-us.net>
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


--xwddooe5fwux7a7t
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Mark,

On Mon, May 30, 2022 at 03:29:48PM +0200, Mark Brown wrote:
> On Sun, May 29, 2022 at 04:12:50PM +0200, Uwe Kleine-K=F6nig wrote:
> > On some platforms (i.e. arc, m68k and sparc) __fls returns an int (while
> > on most platforms it returns an unsigned long). This triggers a format
> > warning on these few platforms as the driver uses %ld to print a warnin=
g.
>=20
> Please don't send new patches in reply to old patches or serieses, this
> makes it harder for both people and tools to understand what is going
> on - it can bury things in mailboxes and make it difficult to keep track
> of what current patches are, both for the new patches and the old ones.

The motivation to do that is that the thread for a patch that broke
something is the canonical place to look if someone already reported (or
even fixed) the problem before.

That b4 seems to fail to extract the patch is indeed unfortunate. For a
MUA I'd expect that it sorts threads after the last received mail, so
that part is only a matter of a sane mail reader configuration.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--xwddooe5fwux7a7t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmKVJt8ACgkQwfwUeK3K
7AlhvggAm5Ly7M1d13iG9kd1lTnlRhMV6Ex4XBjf7Q+x7GkSYV/gbK4OIYPGDLFz
0kckxAzuWHwb/u+5TRtRrTJfq42gZfre1zGkIUcb4eMBGovU0b1cbrcxdMdnDPlm
WyFU3Gn+jYJyZqMy7cRU1fI0vuZZmD0trMKeiwR8wvgZ5VMvVRId5R1+rvXsnnnn
r7r6ImyuCpn4yh/hphvVOt2SyV478s2shFGjUTDloz93ido+/47F9PMMPtMPQUtM
+K/WHqQFbDXBurEwEYmWFG/etpZ1O5z4FHkxpDEpwuCCqM+SHW098lpNUq+w2q3r
7WeuPcvuEkZQKrU4OPhil4f+V2Vbpw==
=YCyv
-----END PGP SIGNATURE-----

--xwddooe5fwux7a7t--
