Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D14642FFDC1
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 09:00:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74C941AB4;
	Fri, 22 Jan 2021 08:59:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74C941AB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611302400;
	bh=iQBwKuf02CUUK5pCOSJVex1HUviKlbm6Cq0uNqhGtxM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q9jOYokz92DwN9Mxaw08TwCUlzdPOIlOWUFsAL6hrGMMJMZ4fboDfJg+RRpBrDTtp
	 2mp4j6r3KSW8tmpSfjqz+RovuQwECs20/Am8dKKcnHdRIyFWNsGVkiVvstrgPBHg8N
	 JDVWgqwIx2WXRkxfyA5lcDbYQmRwbYI63aPWqzQM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57D0DF80524;
	Fri, 22 Jan 2021 08:55:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0844DF80166; Fri, 22 Jan 2021 08:34:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E84ECF8015B
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 08:34:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E84ECF8015B
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=bjornoya.blackshift.org)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>)
 id 1l2qxq-0007E4-Mh; Fri, 22 Jan 2021 08:34:38 +0100
Received: from hardanger.blackshift.org (unknown
 [IPv6:2a03:f580:87bc:d400:aed1:e241:8b32:9cc0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 (Authenticated sender: mkl-all@blackshift.org)
 by smtp.blackshift.org (Postfix) with ESMTPSA id 9F94B5CA50A;
 Fri, 22 Jan 2021 07:34:32 +0000 (UTC)
Date: Fri, 22 Jan 2021 08:34:31 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH v1 2/2] isa: Make the remove callback for isa drivers
 return void
Message-ID: <20210122073431.a3igyqh3rucmiy5y@hardanger.blackshift.org>
References: <20210121204812.402589-1-uwe@kleine-koenig.org>
 <20210121204812.402589-3-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zjvnr6y4kfwj4bce"
Content-Disposition: inline
In-Reply-To: <20210121204812.402589-3-uwe@kleine-koenig.org>
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Fri, 22 Jan 2021 08:54:42 +0100
Cc: alsa-devel@alsa-project.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-i2c@vger.kernel.org, Hannes Reinecke <hare@suse.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-scsi@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Matthew Wilcox <willy@infradead.org>,
 linux-input@vger.kernel.org, Pau Oliva Fora <pof@eslack.org>,
 Jakub Kicinski <kuba@kernel.org>, Wolfgang Grandegger <wg@grandegger.com>,
 linux-media@vger.kernel.org, linux-watchdog@vger.kernel.org,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>, linux-can@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Finn Thain <fthain@telegraphics.com.au>,
 Michael Schmitz <schmitzmic@gmail.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, netdev@vger.kernel.org,
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


--zjvnr6y4kfwj4bce
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 21, 2021 at 09:48:12PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> The driver core ignores the return value of the remove callback, so
> don't give isa drivers the chance to provide a value.
>=20
> Adapt all isa_drivers with a remove callbacks accordingly; they all
> return 0 unconditionally anyhow.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.org>
> ---
>  drivers/net/can/sja1000/tscan1.c     | 4 +---

For the can driver:

Acked-by: Marc Kleine-Budde <mkl@pengutronix.de>

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |

--zjvnr6y4kfwj4bce
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEK3kIWJt9yTYMP3ehqclaivrt76kFAmAKgAUACgkQqclaivrt
76nKFwf/Qh+ytJZ22nqfhmCPbPHzMEovze0rf40PzuBbydukQ2E77J1a91Ol+M6I
1ETmnULm8kVPDDxAcJDMCpVjyMJxgwLzxAFUbO/AXMpj94QvNurQZQfJvFSuDDIi
b8bMue+b3+Bir9bDAQW+GAfmyMa6ARm5kpQFvnnMvLOerD9r3iPfMvMFmAM3tlpJ
QBlvhC3avamtLNyYuNZUDq4Mq8AqsJOHy+0GHptbO7JGN6TS7tkuUo4blKU4XI2j
JizmoGti3M6q+jHuUDOnLpHh6JDaetW68A+M4ggQIhoFVEvbS93ROd8v7exaUwrK
f/iFuhnPc/++doJnCc4XvQg1N02pYA==
=HgrA
-----END PGP SIGNATURE-----

--zjvnr6y4kfwj4bce--
