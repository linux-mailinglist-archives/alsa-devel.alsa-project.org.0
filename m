Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CAB5A394C
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Aug 2022 19:48:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 820DD84C;
	Sat, 27 Aug 2022 19:47:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 820DD84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661622493;
	bh=RiSYK1Dw4vql3EHMcFqT+u9ylOflThvplpsSK1vq6W4=;
	h=Date:To:From:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=Pv04TAWuxDe4CwxGO67Ton4QketfRVdywa4GibeiQhBy4nOj21GSyWR4giwsmgxzv
	 KQyjR9kPzE7ftcYV1cfitk2XULBu1b1iaquY/QF4gfiE/ZZOL6Bfx3H2um1kHn2TBl
	 WSVfrPmajq0gZjlfilJFnkSsBxqo4J4n7z/jf3fI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D256BF8021D;
	Sat, 27 Aug 2022 19:47:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89661F80132; Sat, 27 Aug 2022 19:47:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CF6BF800AA
 for <alsa-devel@alsa-project.org>; Sat, 27 Aug 2022 19:47:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CF6BF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=vanalboom.org header.i=@vanalboom.org
 header.b="aH/FwTjQ"
Date: Sat, 27 Aug 2022 17:46:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vanalboom.org;
 s=protonmail3; t=1661622425; x=1661881625;
 bh=RiSYK1Dw4vql3EHMcFqT+u9ylOflThvplpsSK1vq6W4=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=aH/FwTjQ4FlUVJMTcUW3c5rbAxN57DEG74TRcnDb5Vllz0ab6ECuGSqX5ZC0swgjX
 L9ceUhCSTHAbOOFR91HdW5/uuxPuS+DIGWCmmawAThxS4kSzs9q2nNWzJVwAVGJOMh
 X3oFYxnrGvR99vuhHAakLhLpgV+O1k1+J7VLmI9XXbCAk6KjEoOehWxbtteSCFDIwu
 016wffQX8PtypkP2Ine7Wy+5ou6InUsW6JhMIG2XyTh/YrHDwGrAmCwFDZrYsI1fNi
 HIHrjGgPQt5M+mt4TkEuHmyfafIOX5R4qYeW8il9dWj5IpvgEA1ch0WcXLpNZSrfNF
 indHECUv0SZ7w==
To: Takashi Iwai <tiwai@suse.de>
From: Lennert Van Alboom <lennert@vanalboom.org>
Subject: Re: [PATCH] USB DAC broken since commit
 bf6313a0ff766925462e97b4e733d5952de02367 (5.10.0-rc5)
Message-ID: <qDHiVfeJP8qJJZP_LhkCjZGco01sirYEyvLea-RzheCucD5Bnq1EsgcRLIAy0LmZ7q-YOHipw-Er5PoIBB5JD2gtjqduHIRN1lYCQ2gMKIc=@vanalboom.org>
In-Reply-To: <87r113jal3.wl-tiwai@suse.de>
References: <T3VPXtCc4uFws9Gfh2RjX6OdwM1RqfC6VqQr--_LMDyB2x5N3p9_q6AtPna17IXhHwBtcJVdXuS80ZZSCMjh_BafIbnzJPhbrkmhmWS6DlI=@vanalboom.org>
 <874jy0mvwv.wl-tiwai@suse.de>
 <JGbq2exwKdQ4T8GQCI5YWzGredZVbYtBOxlnBN0ROtba40PvCdEKfz2mKzClqejgZMck374nGQyEIwzjiBi6sKYYNnJgKp26n1-_j6GT3hw=@vanalboom.org>
 <87bks7leun.wl-tiwai@suse.de>
 <m8XpaeWJS23wth20p7EgE-Cxwi-5ZwWl0InTEc-wsDGOwh8Nw5RViGXqM_yP92eOmX0Kxfs2hcizPwZaEce80T3OH1rLQ3ph555M1iTCmFc=@vanalboom.org>
 <87r113jal3.wl-tiwai@suse.de>
Feedback-ID: 20549952:user:proton
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg=pgp-sha512;
 boundary="------24092c6edb78f17f3fdab3bb726c2d2ec8ba756a317b971e98e4fb3a85fd1f84";
 charset=utf-8
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "ls.yoyo.m@gmail.com" <ls.yoyo.m@gmail.com>, Takashi Iwai <tiwai@suse.com>
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
--------24092c6edb78f17f3fdab3bb726c2d2ec8ba756a317b971e98e4fb3a85fd1f84
Content-Type: multipart/mixed;boundary=---------------------99c36f68860d5294bec4ba584f8ec9f8

-----------------------99c36f68860d5294bec4ba584f8ec9f8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8


------- Original Message -------
On Friday, August 26th, 2022 at 17:20, Takashi Iwai <tiwai@suse.de> wrote:

> Good to hear. Will you submit the fix patch for the merge, or shall I
> do it in my side?

If you could do it I'd be most grateful - my git-fu is painfully weak. =




Thanks!


Lennert
-----------------------99c36f68860d5294bec4ba584f8ec9f8
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
-----------------------99c36f68860d5294bec4ba584f8ec9f8--

--------24092c6edb78f17f3fdab3bb726c2d2ec8ba756a317b971e98e4fb3a85fd1f84
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wnUEARYKAAYFAmMKWH4AIQkQftCXc/iSmm4WIQQDIMiGf8zUXWpveld+0Jdz
+JKabqOmAQCbji7j8sGC7ky/Qpj+xzJ+hQNjS+0BRh/1+Y92mRXCBgD/WPvv
GCz87isGQgOU47CTLlTA5fPj1DPckE4FJnMbcQg=
=2Jf9
-----END PGP SIGNATURE-----


--------24092c6edb78f17f3fdab3bb726c2d2ec8ba756a317b971e98e4fb3a85fd1f84--

