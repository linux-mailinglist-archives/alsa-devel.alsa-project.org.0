Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F83F145378
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jan 2020 12:11:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2B7A16AD;
	Wed, 22 Jan 2020 12:10:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2B7A16AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579691476;
	bh=IGufNBh3hnxcLKa9Y7n2/QD92DIBd0mJX7ZdDeRK9hk=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Y3V+G+dCtXeo0YUrHBoo5Qhhuhjut2963tqH+wymfuvcxiUYR8wmDyloH4qVzSGCU
	 dSwQvXtxl4m6FQjfuBMQBbN2dmv6ApnpU7cWSzDq6K6s3Kk9MQlfDfDLjETh1mBEtv
	 cy7PGl+dnG2vmTjzk/jDQqzwONRFJgxvsavjfi+M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60BC0F8020C;
	Wed, 22 Jan 2020 12:09:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0A03F8020C; Wed, 22 Jan 2020 12:09:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.sleepmap.de (sleepmap.de [85.10.206.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42648F8007E
 for <alsa-devel@alsa-project.org>; Wed, 22 Jan 2020 12:09:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42648F8007E
Date: Wed, 22 Jan 2020 12:09:26 +0100
From: David Runge <dave@sleepmap.de>
To: alsa-devel@alsa-project.org
Message-ID: <20200122110926.GF2784@dvzrv.localdomain>
Mime-Version: 1.0
Subject: [alsa-devel] mixartloader/miXart8.elf lacks full RELRO,
	PIE and is unstripped
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
Content-Type: multipart/mixed; boundary="===============7529893374492611618=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7529893374492611618==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4f28nU6agdXSinmL"
Content-Disposition: inline


--4f28nU6agdXSinmL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: mixartloader/miXart8.elf lacks full RELRO, PIE and is unstripped

Hi!

I'm (currently) packaging alsa-firmware for Arch Linux and ran across
the mixartloader/miXart8.elf, which turns out to be lacking full RELRO
[1], PIE [2] and being unstripped.

Checking the git log it appears, that Jaroslav Kysela added it in 2003.
I wonder whether the blob could be rebuilt with full RELRO and PIE and
be updated.

Additionally, I'd like to point out, that I don't know, how much of a
use-case the Digigram miXart8 cards still are in current times, so maybe
the firmware is also a candidate for being dropped (from the package on
Arch Linux).

Any hints, suggestions or ideas are very welcome!

Best,
David

--=20
https://sleepmap.de

--4f28nU6agdXSinmL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEkb2IFf4AQPp/9daHVMKPT/WhqUkFAl4oLWUACgkQVMKPT/Wh
qUn8iA/+OyFan1jgF4rqb6haO/tfV4VwuMkvmuG1spZWGd1TwZgLc1uVSn0gS6XL
ZhMr0cMOJpz2jwMpfOfN0PuP3/stM2eGJxZ8VOAHQoDOBtWxWcSOqoBxi3+OmydY
ZM6f6+qqL6A0EetAGTZR8pgLhV7YQdRS2ppXTvRo1exwx7Dh8OelS6Tug1DC5NiH
w2YK561UNGH8u8axCcDuUiAAOBNrM87uYtoueC16NKA/G/7h+RA+ve/y2Fi94OEz
d/st3+bITR96q/AaYQE3U6x8FWyo5P9Hn/EBxiKXDXDWRuca3iIi9xSv2D1CX1iL
xVYtGW2fl/7aI0Tk64vr5GQ/tngeOjfyYTOi8nw29X3L+rlGSypUcm63DbT5VuVs
h5kHqKOSEGmrRuuwAY/3ENdgzWcEMND6kuawOOsVeshp+yYWz/nhbvBIfiIO0qoy
VzB6fHN6AnQl8scM0WMTLJKdVxpRiM6bGLSh6sS2swjKA4WDvt0SvljjC4rwcAXR
M3/49GMxhr/1YY1zJGkrEpA+vobcMuYU9nhKTztb8O/SkCxkfbJ+jfkEZ1u89rwP
CIGVM2h56s0duJLJhEOpwRBGc0aca+VscaMUyzoKz2PMvN77DSmveH2UwJA12GaA
zD7U/hT9vzSbmHQJCaKcVp/dR3gCK+pTJ2WjyCQRA9AfnXI166c=
=0GKs
-----END PGP SIGNATURE-----

--4f28nU6agdXSinmL--

--===============7529893374492611618==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7529893374492611618==--
