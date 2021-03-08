Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC00331FA7
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Mar 2021 08:04:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDCED17E5;
	Tue,  9 Mar 2021 08:03:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDCED17E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615273464;
	bh=KZOctmIZsl7lvXk2shny2Smy1YinZIVG1Ks/6xHN1hI=;
	h=Subject:From:To:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NrM7PUYrSFxKu1fU/+6LhUq2/J2wqbjAyBUmV4skSM/LqhZKzrsrZ21sgcPn8qT1u
	 MWYscR24iWo2WhuBPLhIw80/iGmnkzF51j9jN77VPQqY2QEJZbVLz2rZ+aI8M0KhGW
	 qR9BCkjOsGOVXtD3CrOPWNiMG9tm2iphDMd550pE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51DDFF800D0;
	Tue,  9 Mar 2021 08:02:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F718F801D8; Mon,  8 Mar 2021 19:48:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2B04F800ED
 for <alsa-devel@alsa-project.org>; Mon,  8 Mar 2021 19:48:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2B04F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="olN5qTom"
Received: by mail-ed1-x52a.google.com with SMTP id bd6so16226577edb.10
 for <alsa-devel@alsa-project.org>; Mon, 08 Mar 2021 10:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:user-agent:mime-version;
 bh=KZOctmIZsl7lvXk2shny2Smy1YinZIVG1Ks/6xHN1hI=;
 b=olN5qTom8+8/xNiBqIDj4CAUipIrlzH9JKHxgG3l5yJ5Md1HYiG4wi1Vm9+UMhQjDZ
 6A8IcijoJroaje+A193WTUA+NLxBXFNrzsHOHmYCVNzk9l7jnlUTBvCnhBZsVbIGKeSq
 5KkcBv/bQwYuu8SMFmtCeWX20rfCk+HHdjGJR/ehMJQNX56cOqGUnNwgNhAzRKsDXld0
 lu1uFNylMhHQ7kV8f6LTvVOW+CdGkc+rKwGvPvMaR/6HdrmYDiVGUcTW07ZQPNiKMEy+
 9U+EISH43TYtjoV6YOxmtqvjzmFMzvnwBX+X8RFfYCcgvgUKPGoAiAzjMXx+pTKvOqUP
 Kl+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:user-agent
 :mime-version;
 bh=KZOctmIZsl7lvXk2shny2Smy1YinZIVG1Ks/6xHN1hI=;
 b=fx0CLWwGp/Tdm7u4pEZnzV12pe2ciZKERvO6A9uzpPummb/wkEfRCF3HwLTiwUqnDU
 ffkGQgBG6XEyiktIZhLAs9J6kcE7Dj/z/ZfSHV1z8aGyOkr0WZZBnL/IVG6rcd8l+qvC
 0t+7ZkgRohC1PucOfNktRrk/NsmDYDLTBKZ8fWda9MjVFM3HQWOjRyv7CqJIfFJH+Hmz
 cWz7zXClO7ReFluRfGdA7aLnv7bO3JxhyHXXeE0ZdGVqjGQ5pttuy/QT2K+z/XXRh79v
 GTB/yVzcffHR+Im01LZ+xvtKgnh49zzjJOTT/Q23CROwvmxW4/qX9vJi16Tu2zraIRBV
 CYag==
X-Gm-Message-State: AOAM530vPounM7Iqb4/YmhQXcLZw80Y2Rfpy9w6PcteNtKbgy0NlLig6
 jKt3SAgMydkh2eSQj1IFaMo=
X-Google-Smtp-Source: ABdhPJxG0r0+VERGDChlwVhbaPYrbrkDz3rYfhKYdwEa12oydZ/OoGymn/2RPjBWsgcxnc8UYw00cg==
X-Received: by 2002:a05:6402:31a7:: with SMTP id
 dj7mr23735249edb.33.1615229327146; 
 Mon, 08 Mar 2021 10:48:47 -0800 (PST)
Received: from [192.168.1.140] ([87.121.147.51])
 by smtp.gmail.com with ESMTPSA id t12sm1889064edy.56.2021.03.08.10.48.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 10:48:46 -0800 (PST)
Message-ID: <998cafbe10b648f724ee33570553f2d780a38963.camel@gmail.com>
Subject: [PATCH] SOUND: pci: hda: Add Sound BlasterX AE-5 Plus support
From: Simeon Simeonoff <sim.simeonoff@gmail.com>
To: perex@perex.cz
Date: Mon, 08 Mar 2021 20:48:35 +0200
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-6B1Qh9fG6JNfosKRK9le"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 09 Mar 2021 08:02:00 +0100
Cc: conmanx360@gmail.com, tiwai@suse.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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


--=-6B1Qh9fG6JNfosKRK9le
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


The new AE-5 Plus model has a different Subsystem ID compared to the
non-plus model. Adding the new id to the list of quirks.

Signed-off-by: Simeon Simeonoff <sim.simeonoff@gmail.com>
---
=C2=A0sound/pci/hda/patch_ca0132.c | 1 +
=C2=A01 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index c966f49fa942..b2b620f6c832 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -1309,6 +1309,7 @@ static const struct snd_pci_quirk ca0132_quirks[] =3D=
 {
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SND_PCI_QUIRK(0x1102, 0x001=
3, "Recon3D", QUIRK_R3D),
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SND_PCI_QUIRK(0x1102, 0x001=
8, "Recon3D", QUIRK_R3D),
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SND_PCI_QUIRK(0x1102, 0x005=
1, "Sound Blaster AE-5", QUIRK_AE5),
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SND_PCI_QUIRK(0x1102, 0x0191, "S=
ound Blaster AE-5 Plus", QUIRK_AE5),
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SND_PCI_QUIRK(0x1102, 0x008=
1, "Sound Blaster AE-7", QUIRK_AE7),
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{}
=C2=A0};
--=20
2.27.0



--=-6B1Qh9fG6JNfosKRK9le
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQFMBAABCgA2FiEEXD0JRrvVJxP9wPdu90R3V3oC/y8FAmBGcYMYHHNpbS5zaW1l
b25vZmZAZ21haWwuY29tAAoJEPdEd1d6Av8vjk0H/0x7MonpUW+lrbspfgwyNr4q
Ige3BGBjmzrPxGyePDrSaT3SpI/0E13Td6fssN3UYLRkw8mpHY3ukj87cmZ+G+gC
y+g/SQuHIgGstWnmX0wtuXYEvQQEHE5mF6gkYWynhD8FIX8lzyEBARVuRcfuY4jf
EZOrxx6PKMLdsFf+lDkq6tlFlk+GUxVxBeKNJL4RVH43kplxCYfsJnCZHTd7piH8
AxSJy8ilRbPqx2v9q8l7Tc2qNHH8jHwj9Tkm4XFV3EK/WQx8sum4CFih5S4oRgz7
XzZWvesIKvKFiRh4mZ2E5kPHg10KJsqTNVhYzlP02lEsnxbTqyPEuNswxtUbp6c=
=L7IC
-----END PGP SIGNATURE-----

--=-6B1Qh9fG6JNfosKRK9le--

