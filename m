Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E923E3444
	for <lists+alsa-devel@lfdr.de>; Sat,  7 Aug 2021 11:13:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F1B816BD;
	Sat,  7 Aug 2021 11:12:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F1B816BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628327614;
	bh=ikpsLutgp6BXiDzVg4RIjjiWPxH8jwqrccuR0FmzR1Q=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UpRQA3C2iC7ZslaR82ek2BRTIzw9fX8ixeHx7Wl27tDkBVch+fx8+GEVSMTp+CgZj
	 3UmmW+zzeKU3rekKnnxq8d35Y1A/nTv+e01eX+7mEWF46im9bgwSqMZ9YDUj22UhZt
	 PU3W0How05JJq2SdD/6K8ujuLVEmhuwY7cRHRFD0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDE93F80108;
	Sat,  7 Aug 2021 11:12:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A41A9F8027C; Sat,  7 Aug 2021 11:12:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93113F8014B
 for <alsa-devel@alsa-project.org>; Sat,  7 Aug 2021 11:11:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93113F8014B
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mCIMv-00079k-AT; Sat, 07 Aug 2021 11:11:49 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mCIMp-0007S4-8u; Sat, 07 Aug 2021 11:11:43 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mCIMp-00079k-7J; Sat, 07 Aug 2021 11:11:43 +0200
Date: Sat, 7 Aug 2021 11:11:35 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Corey Minyard <minyard@acm.org>
Subject: Re: [PATCH] parisc: Make struct parisc_driver::remove() return void
Message-ID: <20210807091135.xgenctifq3wgn3ro@pengutronix.de>
References: <20210806093938.1950990-1-u.kleine-koenig@pengutronix.de>
 <20210806174927.GJ3406@minyard.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="45vk6qaqgnzlimcx"
Content-Disposition: inline
In-Reply-To: <20210806174927.GJ3406@minyard.net>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: linux-input@vger.kernel.org, alsa-devel@alsa-project.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-parisc@vger.kernel.org, linux-serial@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 netdev@vger.kernel.org, kernel@pengutronix.de, linux-scsi@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, openipmi-developer@lists.sourceforge.net,
 Jiri Slaby <jirislaby@kernel.org>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
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


--45vk6qaqgnzlimcx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Aug 06, 2021 at 12:49:27PM -0500, Corey Minyard wrote:
> On Fri, Aug 06, 2021 at 11:39:38AM +0200, Uwe Kleine-K=F6nig wrote:
> > -int ipmi_si_remove_by_dev(struct device *dev)
> > +void ipmi_si_remove_by_dev(struct device *dev)
>=20
> This function is also used by ipmi_si_platform.c, so you can't change
> this.

Did you see that I adapted ipmi_si_platform.c below? That is an instance
of "Make [ipmi_si_remove_by_dev] return void, too, as for all other
callers the value is ignored, too." (In ipmi_si_platform.c the return
value is used in a struct platform_driver::remove function. The value
returned there is ignored, see commit
e5e1c209788138f33ca6558bf9f572f6904f486d.)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--45vk6qaqgnzlimcx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmEOTkQACgkQwfwUeK3K
7Alj/wf+K39kaQNGHDkIhb/MnReZtTqJ7A4TTKfWOCggUIlF0kf2wXSKnlTK2HPV
BPYqMYRAi5ZeO6n1X4beQCN8FSCnnD+s52mCB1nRELRizA8xhnIdK0uD8tqGR43c
iRUEonO4k6ZppBtRgK5uABKENDAaDRQvylQZ9PAzunPbORpMEJJ9U9uaL7fUDtSz
wwjGdfUTeuKFdZN8Ac+OfR7pgHkixcvH9/ECq/VzrsclVCB5DMtP9hckr0LPn5u1
9mtgbkWMsFcj+FfkPo8KZgKoPA+NuTmhK6X17hUR5m7eNrPDt05uVH+MiBmmsY+s
p6siiJxoVX8l60PKy7apKloWP9Ku8w==
=Hx8e
-----END PGP SIGNATURE-----

--45vk6qaqgnzlimcx--
