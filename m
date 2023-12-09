Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97ECA80B4F6
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Dec 2023 15:47:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC424836;
	Sat,  9 Dec 2023 15:47:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC424836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702133268;
	bh=2PgZSFy0XUjNwcWsfPAjscNmrXoAPS4a1iiCHMMo5X4=;
	h=To:Cc:From:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=MxvgSo9SPzn37kPkP5uOyCSZwin8tsxhJaZJ2jdJxFp2WIOPkkbeXZLk5zKrJmCfU
	 BhHg6Bnw5SbmhJpLP4/hj1jr5oHF3mH41xx8yWCs85xym/tQZSS+Agn6vcK46I8bLQ
	 1DJ2XK9xuFOZab89f52P4TtvlmOs0EBveXMWQsI0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4AEBF805AF; Sat,  9 Dec 2023 15:47:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E333F80570;
	Sat,  9 Dec 2023 15:47:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 168D5F8024E; Sat,  9 Dec 2023 15:47:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AC665F800E4
	for <alsa-devel@alsa-project.org>; Sat,  9 Dec 2023 15:47:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC665F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=knaack.h@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=afX6mZ/7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1702133227; x=1702738027; i=knaack.h@gmx.de;
	bh=2PgZSFy0XUjNwcWsfPAjscNmrXoAPS4a1iiCHMMo5X4=;
	h=X-UI-Sender-Class:To:Cc:From:Subject:Date;
	b=afX6mZ/7VcPHZUM2upM9ibP4yXKICwwnOIuqQbmDREPq4JwP8x2bDS+azHpxjobZ
	 clkL/oSuRatu46HdQMVQQKuE3XH4gH3pFd4Hv1oOU9H0cw0tcQ7qK/mBKBntkuufI
	 LqsejGJUB92PXNRcWridPHkkkB4IWZZ/bEuYESO8539X8O+41KpwAbZVJ1q/3ZfzY
	 UGugbw9OqqHfgwoDU59xh0Lyecpo37BzwKIZHPKn5DrwOLCXGy58cRQfvnxfMaupm
	 M2FS7HF0L01CxkE9SJJWH3kKYRAS7vwHh1yAwfx4zJ1oNrsIibGLRD58L7y7w4+0U
	 ZFC0APZe+/fMo6otQA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from base.mbs ([91.55.163.97]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MGQjH-1r05R82vtN-00Grt5; Sat, 09
 Dec 2023 15:47:07 +0100
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>, Luka Guzenko <l.guzenko@web.de>
From: Hartmut Knaack <knaack.h@gmx.de>
Subject: [PATCH] ALSA: hda/realtek: Apply mute LED quirk for HP15-db
Openpgp: preference=signencrypt
Autocrypt: addr=knaack.h@gmx.de; prefer-encrypt=mutual; keydata=
 mQINBGCunykBEADebuuMARwASsPJ3HiQC4r8n+wgCr5+txuAgk3j4E0EIUunXUu/IwUTVLVw
 +rpKpC/r2tBtot6HZ4JhCJqdG7tB1hcTFjGk8kzV97Dp5WxoqzOUvY2nOvhDaUII8Msl/vTf
 CXSVzdHG8x7sjR2+HptBoL7ZqfJejNUJtc8CfyIeY24wioIwwzdbEkghz25TFRQzpHc/y1l9
 wOPen4uyjnS3CK7F89a3Yr2Wny1pyaViZ39zkMUEq5CKzVW0BRdmb11SvullMkJAJOLqxuA1
 opoyuoW+khqNU43eNCMRL70BOi2QeUJMv44C/Kt1yOuXfB1oxKV+OyKvgZwm2QrY/KuYjHFs
 0tgU/d35KtkBdkbdZRmWLAhMNFwOUu7/FBsRM8btDd50AS7+idV4ozs+mFAx7HyG/vjQzxUa
 ixF0J4CLlUJfkFKrWjRLkoAYO0lSQGemZJ8Fa2F6Eru3tSf1e/Wqjf9ia8EH5s1TaYugGKET
 IsdQILza8avOX9Mib3uvVHjQVweLjR3QFoOQLHtuAngJqwCakkcMouowZRGkr/zlo+wslACq
 h7FcOFBaP2sxYbTBlOi7qzuJvy4iTRjY1RrvB25YVE/4qghFzLwv5TJYUds1pQ/yCkv1MKSz
 VQp6XLOcGqAupv+43Mna8jobFk4PC5vNHZrAzWgXOudZLD4vdwARAQABtCBIYXJ0bXV0IEtu
 YWFjayA8a25hYWNrLmhAZ214LmRlPokCVAQTAQgAPhYhBMJitsPHdMAC5/1SAPRms7sUr1FQ
 BQJgrp8pAhsjBQkJZgGABQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEPRms7sUr1FQOVEQ
 ALNDjF745wW4fJzAAauQgTP818EtgxKSsnOPjK9YFuzKitwGYeorbY9tdvuFhBa2pzR6uASv
 ny/7CYa/CQf5R1ZdAB9/kJi1axa5F473MC9qSetl9s+uVNDWxunBJ6PD/gpyQaTTt/TVvH1p
 rb2Ad1vkAUJiHC0m3GcRjC1rMD4aAj0qFAR7fxIOTWsNYvm7VSn9oVAtI7KPB2IlQ66CcVEC
 gtYo/mlw76sayyYqWbA14FVah0ySt+vJeTsY0SlmDoymIigLy53MniITJM9q/E6W8sFj8YMm
 UsPvL++pOLoiStl5JdCMfQITxFAT2WY8Y8o76OeSO8Xa2HYiPQdnfa/W5rhXpLLFbUlZLq9d
 ZHKq/sbDowaamcI9Ug8YiKSlmudwXC6Jh1BZVHhJ1TSMhQXaRwdO8S47JKUjXe7OJEizm3R3
 Qx1xgVKwQRJlUtUa7To2qgxuAolaRH60eGcjk+iRxtEfmzDBJ8zIx29LB9Zblk5S5s3xLB/T
 HhF1rGbxSvXvtU0WXYtvL6BwSxqqvnedp9R/adt9Y0yEp7Tv+mjpFfX4KjbTaLm/iZ0ptcPg
 4DiXsllsXMC1lO+HkleQBGYYFwgIgaIYZfWvomioTdOHZlrawy1I8xcNs3mIy8/moe51Pdei
 /pkYnA2yei1R86x2ctL6QAjdSylfVy6/EJFwuQINBGCunykBEADr9V+k+gODslwjYndCRVyf
 aWI8firD+yOcyLs0jzHg6zhxwUC0ITTywZBr4lZ/XdrOpZENzCtUKvJsW90t+myVS1a1X++L
 qj7AS6U3F6J5kuO5CxgM9/JPElW8WM0zPTRhV8uobnI4xlT9bvHwv4+IPB+X5S6PrIJRENjw
 FhVmNHYd/cz6fIH4OLuRd8QZev4ErIskG9WTlCn2uPotIc8lQIpQ+3f8H+Kqpj4ZVdQUUABv
 sS0ckEzwq+tXpyDmsCrydMtRF4wI+21G74oJ+DIPYI6mnZSBsn2h1aDjZ40ikwb/6guqYKgd
 JYt56VBDKU6VX8/RIw7TOwVqM8o0xIGhHnF7yJuSY1vRxhxdBGdVn1gj5SvwqH2Uh4+RDpy0
 bX2qZDZ32QZwfXCrsBUdLm47GhEDqYk3OtkjY+g46BtG41wbqhQw6fECKNXFtUGQ4yABa7Dl
 ujTGZAsYJjVVkDv830mY1EGtQPgNNQddwCyvYtbeUuAAPo4fV6cOR6D5RXXZ8F9wgCby32fX
 aU9N7J85q2FFdbfPM+P2uEd5brze0BRsu4t9QDz5Zj574vwOlTNgkizZmCqwJxYVuq5oFmRG
 DfhZ2sjwLhanyW6LRedLofLUb7AMoNZGBkLQDqKhIGMuOdajKOq3SVaC7bIjlLCVQcaX4hjJ
 Pf0lp9UHohf41wARAQABiQI8BBgBCAAmFiEEwmK2w8d0wALn/VIA9GazuxSvUVAFAmCunykC
 GwwFCQlmAYAACgkQ9GazuxSvUVAu7Q/8DrV4xxXx+CRcQbnGXMHp/gYwhMf9LUbfwYX1lIkr
 fHBslANGQyh+mPQVze6Y0XPa0E7BVWOGIyNbiRSaS/yTGQY/TBwT0RnAU/pN7ldAOHJd5Dax
 xd3boxe6R3ug5npLCYc94/tbrfj+YieuSooHqmJx9rMWI1U9CJGhPafqyDL+z0HL5F1SCSno
 YorbzxFgiQF1Do9q94C3OxgQKq6chs+dg+yCGSGAMDDLhHdXE2tVGij+kn98bpbioODAAWBH
 R5auIwN/7LK4SF59p84nZOfnxHJiPnzeb7hNhNP5ToJ1coX5KaT+ZPC5EibOo4IRhUwoNRLJ
 syt6GFP1SMelxbqHERECtKNA9cxCrYP771FE1YvH21Zf0SLwnpDdxlIIZdCcUykrl6nXZyP5
 sBSYmvxsTcjLQQNVVHm3/nOS7DKMFoLVRoiKEJaFlsgofpAzldU4z0IFrL4RqeorlQkBDPiX
 t6mDzfpu6rgjyAOCj5527yAYiTAbqt3RTM5e4Z3FqrocjxAQLYqEuJGdJhmuEJpK3H3gPMIm
 QAPEAwKaU+mwVMMUqj3tGu//F3HiLBGnsV4PuYQIALvu7dOsUreSvq4sKvArQ55wmd4OuIaZ
 H4eHk9+2MT8unT79cF/6z9Zwd96YCVs7Eod7LGcbxjwVm240fpxeFuqlh38sz2QvW30=
Message-ID: <e61815d0-f1c7-b164-e49d-6ca84771476a@gmx.de>
Date: Sat, 9 Dec 2023 15:47:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 SeaMonkey/2.53.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4fQsW37Wjf8Pycqx/Nd+I5bYlT7hyHKC9CrijG++4zhbICAu3hI
 RaWPqODsSkdVv13xJ2M8U/2jrzd9ItJqKV0WP8874dUC8hoOWGARoSGuOkRnYMKtmNC/dmU
 fFZlX3cHLrk9zT5BlnXenOeGiDwWxMhE1FuIGmeDQxdBthXGxSN6T6Nq29kCSzb0SoDS/LT
 d1xrY5KgxrAHN6OkvQu9Q==
UI-OutboundReport: notjunk:1;M01:P0:fNtvpuXoeaI=;/hFBm3Xcu87rSkxONIp0hl1SPHm
 gZTq10rIoyGruuD0iwmP5bSgkcu/lG4tq0HPAcNOec/hx2/DX7Izj5ISOYmXy/awkwGfpOAMG
 7dYtlz8M7YFHCvW6A/DIo14IOmKgZFoen07DHNawm+abwLXIv957M+pZap4Zb5Eg+WgW5seGx
 61BY9j7J9Pf9AxrBBjCoIkilhFtRp3xnWFBCiQV20UzY3sDFu7xQ1pLl2HfXRjPoLVCZQwrOG
 ozXM9UewZAmg7QpOP5dQOkFEs5Vn7lHZpfqhPjZ8KxIIZUUO9EgAmmvN0iWhMrepmWcAZyQRn
 k0+yFNqkpMW3QAb5gMR2HRS5IojafMVLjHnDuSBZNmfAiWM7Rdyds0ybfvS6o50mYDZHX0+an
 iJX4osf8KFNp6YZEj+OXn6s6j4i7iZSAGc2n9T92KvOfd/5a04JINJdq3M6RVwjztVulBVC8b
 bROqMmh5KnGRTzNks9DjdVX/V5mKNbbWwQj9bOfhL6ES9Svtq4btVmiPZ27kRbN3xaDaXlVAI
 Gd/rsjRUuoJMN3qDPP2PMghdpRnn9lthvXStG9hNvv9d2y2gm9X8zrw4qlvwnhCGbV7RWCcqO
 PyIrhMZ7tWG/S718GljyBAh6UbLFyPiPlMjRAbqCea+91zEb69Txp0dtm32GBNnkUTlYEaBlK
 ImX6uI0/wHOmvvyYkZfnW37sOar3553jK6bYlwTauToNkgHoYbt3cE5k197ORM+QcNDifYOwO
 ARvFhUjAKl/X1XF9C8YYLmT7cM881ts6A08fA+pCTlTNu4OpgOcwW7ZR762wDFCL3JMaPslzi
 WiOzeEjubCGFuEaf/5Rhl9/9ze+bttTISidrLlUJcnYwGIHz0zlgSPEo+Zn3B3xvE3FMbJV0p
 VAF7q9J+11S0hfAjAVyKzU139zZprKLzGYmbypF5vVqfVJ0qCYeCsyQ2f6yefdwFqB97OoqV0
 h9UJQiaNbCwrtvJ+t8PqG92gSOE=
Message-ID-Hash: SLAQRZR4EP2SKE2G6HAQMECAZ345XG4M
X-Message-ID-Hash: SLAQRZR4EP2SKE2G6HAQMECAZ345XG4M
X-MailFrom: knaack.h@gmx.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SLAQRZR4EP2SKE2G6HAQMECAZ345XG4M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The HP laptop 15-db0403ng uses the ALC236 codec and controls the mute
LED using COEF 0x07 index 1.
Sound card subsystem: Hewlett-Packard Company Device [103c:84ae]

Use the existing quirk for this model.

Signed-off-by: Hartmut Knaack <knaack.h@gmx.de>
=2D--
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 0377912e9264..e45d4c405f8f 100644
=2D-- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9795,6 +9795,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[]=
 =3D {
 	SND_PCI_QUIRK(0x103c, 0x83b9, "HP Spectre x360", ALC269_FIXUP_HP_MUTE_LE=
D_MIC3),
 	SND_PCI_QUIRK(0x103c, 0x841c, "HP Pavilion 15-CK0xx", ALC269_FIXUP_HP_MU=
TE_LED_MIC3),
 	SND_PCI_QUIRK(0x103c, 0x8497, "HP Envy x360", ALC269_FIXUP_HP_MUTE_LED_M=
IC3),
+	SND_PCI_QUIRK(0x103c, 0x84ae, "HP 15-db0403ng", ALC236_FIXUP_HP_MUTE_LED=
_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x84da, "HP OMEN dc0019-ur", ALC295_FIXUP_HP_OMEN)=
,
 	SND_PCI_QUIRK(0x103c, 0x84e7, "HP Pavilion 15", ALC269_FIXUP_HP_MUTE_LED=
_MIC3),
 	SND_PCI_QUIRK(0x103c, 0x8519, "HP Spectre x360 15-df0xxx", ALC285_FIXUP_=
HP_SPECTRE_X360),
=2D-
2.42.0

