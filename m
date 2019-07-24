Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D0772F8A
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jul 2019 15:08:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98403178C;
	Wed, 24 Jul 2019 15:07:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98403178C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563973682;
	bh=3pubYyT8cTcnK4Y5msSBi4K0l/s2mpTy7QqHXu3381o=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kSx27ymPumqrUdUWL1t6y37I0Y2wzm1BeFf1y3rCqhYmEfSWpW9N/JRGaHOWkliOv
	 DbZ1OcHAQdUE+a6ODFJpuDeu3mtFtlpM/xY7yu+pIN7WL1aIomBbjfXVwiu6WBXZKH
	 5nJ/XBPi6ONQdHjbSDZGPSa7WOGNeksMuZAY/Jtg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14CDEF8048F;
	Wed, 24 Jul 2019 15:05:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F0C8F803D1; Wed, 24 Jul 2019 11:52:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from atrey.karlin.mff.cuni.cz (atrey.karlin.mff.cuni.cz
 [195.113.26.193])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B01EF800E8
 for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2019 11:52:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B01EF800E8
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
 id AADEF802C3; Wed, 24 Jul 2019 11:52:43 +0200 (CEST)
Date: Wed, 24 Jul 2019 11:52:54 +0200
From: Pavel Machek <pavel@denx.de>
To: perex@perex.cz, tiwai@suse.com, gregkh@linuxfoundation.org,
 allison@lohutok.net, tglx@linutronix.de,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Message-ID: <20190724095254.GA6727@amd>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Mailman-Approved-At: Wed, 24 Jul 2019 15:05:55 +0200
Subject: [alsa-devel] [PATCH] sound: line6: sizeof (byte) is always 1,
	use that fact.
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
Content-Type: multipart/mixed; boundary="===============8765294162847604418=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8765294162847604418==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MGYHOYXEY6WxJCY8"
Content-Disposition: inline


--MGYHOYXEY6WxJCY8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


sizeof (byte) is always 1, use that fact and make interesting code explicit.

Signed-off-by: Pavel Machek <pavel@denx.de>

diff --git a/sound/usb/line6/driver.c b/sound/usb/line6/driver.c
index ab2ec89..387c5c2 100644
--- a/sound/usb/line6/driver.c
+++ b/sound/usb/line6/driver.c
@@ -342,7 +342,7 @@ int line6_read_data(struct usb_line6 *line6, unsigned a=
ddress, void *data,
 	if (address > 0xffff || datalen > 0xff)
 		return -EINVAL;
=20
-	len =3D kmalloc(sizeof(*len), GFP_KERNEL);
+	len =3D kmalloc(1, GFP_KERNEL);
 	if (!len)
 		return -ENOMEM;
=20
@@ -418,7 +421,7 @@ int line6_write_data(struct usb_line6 *line6, unsigned =
address, void *data,
 	if (address > 0xffff || datalen > 0xffff)
 		return -EINVAL;
=20
-	status =3D kmalloc(sizeof(*status), GFP_KERNEL);
+	status =3D kmalloc(1, GFP_KERNEL);
 	if (!status)
 		return -ENOMEM;
=20

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--MGYHOYXEY6WxJCY8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl04KnYACgkQMOfwapXb+vIvPgCdEcgRySTDEvncHuH1EgY1sF2N
rwMAoMGO7UVMzt/J19H3d1Huf9YsVeSF
=2Y4Y
-----END PGP SIGNATURE-----

--MGYHOYXEY6WxJCY8--

--===============8765294162847604418==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8765294162847604418==--
