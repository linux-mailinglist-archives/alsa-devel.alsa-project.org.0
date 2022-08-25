Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4565A1A97
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Aug 2022 22:53:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE086850;
	Thu, 25 Aug 2022 22:52:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE086850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661460796;
	bh=n7LQAGiY5NM03/JZWggg58dlXKvE1IQG0IRk2kHR7KI=;
	h=Date:To:From:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=SMJKAnApA/cCYk1DQA5t6NgpwJVQMHdfQLxpyxNHCwjGlufjPuVvBdtUUl6TTJ/4o
	 nFdzNV3xHkwoW90ZQOmmFXiUXJ+qvQMFNZxL4KsFOZrSMh4RmDa3lruupgm0k6s2II
	 i71yZ5ZEz+upV2aWN9mNZMl2wamK34L2RHgA2vD4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2199CF80271;
	Thu, 25 Aug 2022 22:52:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13654F8025A; Thu, 25 Aug 2022 22:52:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0DA4F8014B
 for <alsa-devel@alsa-project.org>; Thu, 25 Aug 2022 22:52:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0DA4F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=vanalboom.org header.i=@vanalboom.org
 header.b="oh21KNba"
Date: Thu, 25 Aug 2022 20:52:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vanalboom.org;
 s=protonmail3; t=1661460726; x=1661719926;
 bh=n7LQAGiY5NM03/JZWggg58dlXKvE1IQG0IRk2kHR7KI=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=oh21KNbaEb/ZLC9XkncbOn1FUdzkagOftobyIaSzXQqbICSbktgqR81PXZhSeILGp
 XLd7QE+BjJTgkD78rW+yDLMxynADiLwCeKBXskzABOlzu5J9//U0h93lZ/oPWCfpKv
 M/mFxjoy57viFzKFb2ISVVpv3IiGNxayVcXVYup3pD2xob+dSuyXpWsgrZgdwCilTl
 TxOAG8+EUJ4IRTv/9Sf/XlZq0DfNG14z3KHHcKw4DbGhQquVIc86EQ0yhMrvIUmSfe
 +sh07MJo1wNeVmOXrOA8ROzWBVXTounV5U1224uzywmFT4a8Tuntdhes/F1Fl55gUq
 TA/PsQAouhpFg==
To: Takashi Iwai <tiwai@suse.de>
From: Lennert Van Alboom <lennert@vanalboom.org>
Subject: Re: USB DAC broken since commit
 bf6313a0ff766925462e97b4e733d5952de02367 (5.10.0-rc5)
Message-ID: <JGbq2exwKdQ4T8GQCI5YWzGredZVbYtBOxlnBN0ROtba40PvCdEKfz2mKzClqejgZMck374nGQyEIwzjiBi6sKYYNnJgKp26n1-_j6GT3hw=@vanalboom.org>
In-Reply-To: <874jy0mvwv.wl-tiwai@suse.de>
References: <T3VPXtCc4uFws9Gfh2RjX6OdwM1RqfC6VqQr--_LMDyB2x5N3p9_q6AtPna17IXhHwBtcJVdXuS80ZZSCMjh_BafIbnzJPhbrkmhmWS6DlI=@vanalboom.org>
 <874jy0mvwv.wl-tiwai@suse.de>
Feedback-ID: 20549952:user:proton
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg=pgp-sha512;
 boundary="------4335f303f65c68eca3e0f08532a8b61bb7072bbe4d5a915d252d9d9d70b44e24";
 charset=utf-8
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>
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
Reply-To: Lennert Van Alboom <lennert@vanalboom.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------4335f303f65c68eca3e0f08532a8b61bb7072bbe4d5a915d252d9d9d70b44e24
Content-Type: multipart/mixed;boundary=---------------------76f807876e088460dc4f4074efee6b26

-----------------------76f807876e088460dc4f4074efee6b26
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

------- Original Message -------
On Thursday, August 25th, 2022 at 12:58, Takashi Iwai <tiwai@suse.de> wrot=
e:
> =


> There are lots of workarounds for the buggy USB audio firmware, and
> the latest kernel allows to enable the quirks via quirk_flags module
> option of snd-usb-audio driver. See
> Documentation/sound/alsa-configuration.rst.
> You can try the bit 16 at first, for example.
> =


> =


> Takashi


Thanks. I tried fiddling around with it for a bit but so far limited succe=
ss. I wasn't sure about the arguments or counting order of quirk_flags (so=
me tidbits show it as hex, others as an array of booleans (?)) so tried a =
few different things. I have no other USB audio devices so didn't see a ne=
ed to specify vendor or product ID while testing. =



# modprobe snd_usb_audio quirk_flags=3D0x10000
# modprobe snd_usb_audio quirk_flags=3D0x1
# modprobe snd_usb_audio quirk_flags=3D0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1

No success with any, so far. Is there a way to make the process more verbo=
se? I can see from the lights on the DAC that the initialisation works dif=
ferently if I mess with the different quirks but that's not visible in sys=
log or outcome.


Thanks,


Lennert

-----------------------76f807876e088460dc4f4074efee6b26
Content-Type: application/pgp-keys; filename="publickey - lennert@vanalboom.org - 0x0320C886.asc"; name="publickey - lennert@vanalboom.org - 0x0320C886.asc"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="publickey - lennert@vanalboom.org - 0x0320C886.asc"; name="publickey - lennert@vanalboom.org - 0x0320C886.asc"

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tCgp4ak1FWHBHZWNoWUpLd1lCQkFI
YVJ3OEJBUWRBSFBRaWM5VER0TURQaDgwclllNFlDRHh5aEFTdkhMcUcKb1NTQWMwRGNaVGJOTFd4
bGJtNWxjblJBZG1GdVlXeGliMjl0TG05eVp5QThiR1Z1Ym1WeWRFQjJZVzVoCmJHSnZiMjB1YjNK
blBzSjRCQkFXQ2dBZ0JRSmVrWjV5QmdzSkJ3Z0RBZ1FWQ0FvQ0JCWUNBUUFDR1FFQwpHd01DSGdF
QUNna1FmdENYYy9pU21tNE5IZ0QrTUdVQ2hkZHdRckw4R3hGZVlmVFRLSVJiQ2huVTgvK1MKVU8z
SE1ZdmlnUDRBLzFFdVRhU1RQMU5jVUJkRllvU2pqU2gzQWE2Zis3dFRISXN2TWl0TGF5NEx6amdF
ClhwR2VjaElLS3dZQkJBR1hWUUVGQVFFSFFOTlR3dG11TGpqOXJNZnhOaUtUZ0JyWVNmY3lEVDRX
U1grdQpZY1l3RWdCQUF3RUlCOEpoQkJnV0NBQUpCUUpla1o1eUFoc01BQW9KRUg3UWwzUDRrcHB1
TUlJQkFLMEQKc2g3alVsUHBWTUlzTVdZRDZETkhmaVFEZXcwQVh1WjJhd0JvWEtjRkFQOWJZZkpR
M29ENTNpelNLYkpFCmlLQkh1Y2pDOWJmRzlOcjdsdFA3OHNZN0NnPT0KPXpraXYKLS0tLS1FTkQg
UEdQIFBVQkxJQyBLRVkgQkxPQ0stLS0tLQo=
-----------------------76f807876e088460dc4f4074efee6b26--

--------4335f303f65c68eca3e0f08532a8b61bb7072bbe4d5a915d252d9d9d70b44e24
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wnUEARYKAAYFAmMH4OAAIQkQftCXc/iSmm4WIQQDIMiGf8zUXWpveld+0Jdz
+JKabvDxAQDPhEi0uDbGJTno+jrqi3mOn+iklUu/d9KA82FlfgXGOAD8Cz4E
k1lNOeUqKKyDbVkZ9tzHSJZVlGpWsV4slXQkHwY=
=D4ie
-----END PGP SIGNATURE-----


--------4335f303f65c68eca3e0f08532a8b61bb7072bbe4d5a915d252d9d9d70b44e24--

