Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AE851D1BA
	for <lists+alsa-devel@lfdr.de>; Fri,  6 May 2022 08:56:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2138E1749;
	Fri,  6 May 2022 08:55:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2138E1749
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651820188;
	bh=6XPvu8eu/MGLbFd/78Oy2npbD8iNL8BK81pJa3mmCYs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i4fgMT6IQFuDR6F3xzezzX49hKUvX24erixaqKFGJc/aSqHbrCUK59JZqZXmouqrI
	 thz3/TDMD4IrpyQ66+4jvhAPrtZX7mEvzJn9Qceoh7U4w3ySMZ1bV7XpoAegUtOgM4
	 UmFyM1COrXLx/fD9m3SCO1yl/AQCW/RgJj1/NXjg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 845CDF80171;
	Fri,  6 May 2022 08:55:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3AA8DF800F0; Fri,  6 May 2022 08:55:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E2B3F800F0
 for <alsa-devel@alsa-project.org>; Fri,  6 May 2022 08:55:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E2B3F800F0
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nmrmX-0000sR-Qk; Fri, 06 May 2022 08:49:41 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nmrmO-000egL-IQ; Fri, 06 May 2022 08:49:31 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nmrmM-007tsw-Dy; Fri, 06 May 2022 08:49:30 +0200
Date: Fri, 6 May 2022 08:49:27 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: lizhe <sensor1010@163.com>
Subject: Re: [PATCH] kernel/drivers: Remove redundant driver match function
Message-ID: <20220506064927.7y7a422jqbse22fr@pengutronix.de>
References: <20220506045952.136290-1-sensor1010@163.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="o5fzikc3dnjeidfk"
Content-Disposition: inline
In-Reply-To: <20220506045952.136290-1-sensor1010@163.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: alsa-devel@alsa-project.org, target-devel@vger.kernel.org,
 srinivas.kandagatla@linaro.org, zbr@ioremap.net, agordeev@linux.ibm.com,
 lee.jones@linaro.org, linux-s390@vger.kernel.org, bvanassche@acm.org,
 linux-scsi@vger.kernel.org, pasic@linux.ibm.com, wens@csie.org,
 borntraeger@linux.ibm.com, jejb@linux.ibm.com, jjherne@linux.ibm.com,
 gor@linux.ibm.com, hca@linux.ibm.com, linux-m68k@lists.linux-m68k.org,
 freude@linux.ibm.com, hare@suse.de, dan.j.williams@intel.com,
 akrowiak@linux.ibm.com, martin.petersen@oracle.com, fthain@linux-m68k.org,
 tiwai@suse.com, linux-kernel@vger.kernel.org, svens@linux.ibm.com,
 colin.king@intel.com
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


--o5fzikc3dnjeidfk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, May 05, 2022 at 09:59:52PM -0700, lizhe wrote:
> If there is no driver match function, the driver core assumes that each
> candidate pair (driver, device) matches, see driver_match_device().
>=20
> Signed-off-by: lizhe <sensor1010@163.com>

Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig.org>

Side note: While looking through this patch I was surprised to see there
are two different busses for ac97: sound/ac97/bus.c + sound/ac97_bus.c .
It seems the duplication exists since 2017.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--o5fzikc3dnjeidfk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmJ0xPQACgkQwfwUeK3K
7Ak9lwf+LvgkLmWcst9CMzoJ2w5AdNZjtnWS36MvuyEFgHUH2e6lrfReaAAj9LGp
1EPinO6S6UBPvzVTbTVcduAlnaWER3O6XDIiS1b0Z2NOchX6AHUfHjQzckmL7ZU6
6W3P8jmVsNgbwmD2NXh98qjpmKMnmw56AjbBfYKSM1jWGookg2NUKkvN5175wSnQ
FNAIVdMaTspMZKRJU8bhkXSCARu9oAYn88U3QFUsgfzRK4KZu3UfqU75+QZjAzE3
q7A4nOBFl0GHZUE/kQMPWdYm1OgPbvxaDYz2DmWN+7Dqc+0HkUUYYeATdYs8OUO0
SBdhfXzll9P8xFZvdeusA+8B6DgGYg==
=nsQs
-----END PGP SIGNATURE-----

--o5fzikc3dnjeidfk--
