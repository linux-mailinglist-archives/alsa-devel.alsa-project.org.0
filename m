Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4775A23BD
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Aug 2022 11:09:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 848341633;
	Fri, 26 Aug 2022 11:08:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 848341633
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661504951;
	bh=ByKVkoqsfzF79ZB/ZvV56IfLMAx4fDHQRnFU1vkPCkM=;
	h=Date:To:From:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=nTpKI48JGH+Sg3HwYjOGOK6Hctj/BQUmpMSEX78l26fILb8QY1JLhrgdmOamjKbeQ
	 mYoyMK8SRMFkoba13gt9C+kn3/SqCfG8po5X16vhYnx4Uah6HhWq6XH10tnxWA3atm
	 9UM/6SVzJXYJ/k/MPjOuZwiBV+FxkHTNmRHpDMSc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFEB8F8032D;
	Fri, 26 Aug 2022 11:08:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0892F80238; Fri, 26 Aug 2022 11:08:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_APP_ATTACH,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BCAEF80105
 for <alsa-devel@alsa-project.org>; Fri, 26 Aug 2022 11:08:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BCAEF80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=vanalboom.org header.i=@vanalboom.org
 header.b="TtE6RWLw"
Date: Fri, 26 Aug 2022 09:07:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vanalboom.org;
 s=protonmail3; t=1661504880; x=1661764080;
 bh=n+rpQXQC2wMZM690xvnClwo6nWn5j50ssFsl+8Si1bw=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=TtE6RWLw7iNHbOO4DQ22V8yTQ1nclLKDoGOZmiclGYqR0B2GFH2HWTKeOsfGkaxVK
 Y59RRE3F3irhGsFtxjyJPIAkFl41ujHsatPkc3jbPkC8m4qyHGukZ4i1+1kSUU2qfd
 Zulolfip3tZqYmfw2ouZriRsCmrfGcCsETOA1GWNIt9BNBmbcd5wWIaN/QZ0SJpiIx
 70TkuMQk6B3Eonpbrh/hRqwJVd0hP5f76HAaqROxHS08HWptgo33LaH2X0oxttvSfx
 0f4X/zJIxgZZLeA82/g3C1WwsCqiW7rCtXgDBa1gdP6BTtgDfZhTkHap6sWpQ6/EOu
 VqtkqgaPEC+FA==
To: Takashi Iwai <tiwai@suse.de>
From: Lennert Van Alboom <lennert@vanalboom.org>
Subject: Re: [PATCH] USB DAC broken since commit
 bf6313a0ff766925462e97b4e733d5952de02367 (5.10.0-rc5)
Message-ID: <m8XpaeWJS23wth20p7EgE-Cxwi-5ZwWl0InTEc-wsDGOwh8Nw5RViGXqM_yP92eOmX0Kxfs2hcizPwZaEce80T3OH1rLQ3ph555M1iTCmFc=@vanalboom.org>
In-Reply-To: <87bks7leun.wl-tiwai@suse.de>
References: <T3VPXtCc4uFws9Gfh2RjX6OdwM1RqfC6VqQr--_LMDyB2x5N3p9_q6AtPna17IXhHwBtcJVdXuS80ZZSCMjh_BafIbnzJPhbrkmhmWS6DlI=@vanalboom.org>
 <874jy0mvwv.wl-tiwai@suse.de>
 <JGbq2exwKdQ4T8GQCI5YWzGredZVbYtBOxlnBN0ROtba40PvCdEKfz2mKzClqejgZMck374nGQyEIwzjiBi6sKYYNnJgKp26n1-_j6GT3hw=@vanalboom.org>
 <87bks7leun.wl-tiwai@suse.de>
Feedback-ID: 20549952:user:proton
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg=pgp-sha512;
 boundary="------ef761aa875a8d72b3eb13d1a059424a33f71dcc57218a91d14c54f84ab374302";
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
--------ef761aa875a8d72b3eb13d1a059424a33f71dcc57218a91d14c54f84ab374302
Content-Type: multipart/mixed;boundary=---------------------8b892d9366ef34166f40132dbe860f52

-----------------------8b892d9366ef34166f40132dbe860f52
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

------- Original Message -------
On Friday, August 26th, 2022 at 08:05, Takashi Iwai <tiwai@suse.de> wrote:
> =


> This option is passed per card instance, as the driver may hold
> multiple cards. Check your /proc/asound/cards. The first argument of
> quirk_flags is applied to the first USB-audio card, the second to the
> second USB audio device, and so on.
> =


> At best, give alsa-info.sh output before and after applying the
> quirk. Run the script with --no-upload option and attach the
> outputs.
> =


> And, as a reference, you can see the existing quirk tables in
> sound/usb/quirks.c.
> =


> =


> Takashi


Not sure why it failed before (didn't look further then, so possibly PEBKA=
C) but as you suggested, this works now (tested on debian's 5.19 kernel):

# modprobe snd_usb_audio vid=3D0x2522 pid=3D0x0007 quirk_flags=3D0x10000


Confirmed that setting a quirk_alias also works: =



# grep -A 1 "0x054c, 0x0b8c" linux/sound/usb/quirks.c =


	DEVICE_FLG(0x054c, 0x0b8c, /* Sony WALKMAN NW-A45 DAC */
		   QUIRK_FLAG_SET_IFACE_FIRST),
# modprobe snd_usb_audio quirk_alias=3D25220007:054c0b8c


I've added a patch for quirks.c to make this default behaviour for this de=
vice. Looking at the Arch bug report at https://bugs.archlinux.org/task/70=
636, it's likely similar behaviour may be needed for pid=3D0009 (LH Labs G=
eek Pulse X 1V5) but I have no way of testing this. Added the reporter in =
CC.


Thanks,


Lennert


-----------------------8b892d9366ef34166f40132dbe860f52
Content-Type: application/octet-stream; filename="patch"; name="patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="patch"; name="patch"

LS0tIGxpbnV4L3NvdW5kL3VzYi9xdWlya3MuYy5vcmlnCTIwMjItMDgtMjYgMDg6NDk6NDIuNzQ5
MjQwNDMyICswMDAwCisrKyBsaW51eC9zb3VuZC91c2IvcXVpcmtzLmMJMjAyMi0wOC0yNiAwODo0
OTozNC4wMTcxMzgwNDIgKzAwMDAKQEAgLTE5MjMsNiArMTkyMyw4IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgdXNiX2F1ZGlvX3F1aXJrX2ZsYWcKIAkJICAgUVVJUktfRkxBR19HRU5FUklDX0lNUExJ
Q0lUX0ZCKSwKIAlERVZJQ0VfRkxHKDB4MmI1MywgMHgwMDMxLCAvKiBGaWVybyBTQy0wMSAoZmly
bXdhcmUgdjEuMS4wKSAqLwogCQkgICBRVUlSS19GTEFHX0dFTkVSSUNfSU1QTElDSVRfRkIpLAor
CURFVklDRV9GTEcoMHgyNTIyLCAweDAwMDcsIC8qIExIIExhYnMgR2VlayBPdXQgSEQgQXVkaW8g
MVY1ICovCisJCSAgIFFVSVJLX0ZMQUdfU0VUX0lGQUNFX0ZJUlNUKSwKIAogCS8qIFZlbmRvciBt
YXRjaGVzICovCiAJVkVORE9SX0ZMRygweDA0NWUsIC8qIE1TIExpZmVjYW0gKi8K
-----------------------8b892d9366ef34166f40132dbe860f52
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
-----------------------8b892d9366ef34166f40132dbe860f52--

--------ef761aa875a8d72b3eb13d1a059424a33f71dcc57218a91d14c54f84ab374302
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wnUEARYKAAYFAmMIjVUAIQkQftCXc/iSmm4WIQQDIMiGf8zUXWpveld+0Jdz
+JKabmKgAP4hkH2QQWqbUzCWRV4OJkkNUXa/I2ZZ0ZLPTdx1vxV2BAD9Ff1V
W0vO4lniRGQiw7BOv9iRFJvCsXmQrT7lDTxbwAE=
=ND+y
-----END PGP SIGNATURE-----


--------ef761aa875a8d72b3eb13d1a059424a33f71dcc57218a91d14c54f84ab374302--

