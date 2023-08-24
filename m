Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AA878A058
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Aug 2023 19:04:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C64779F6;
	Sun, 27 Aug 2023 19:03:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C64779F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693155856;
	bh=RT7eORIGDS51z5VQrfIGY53XxOeoP9GdM5TIkqrnUYo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QtCrqYE/lC3nnplWihMMPQ18CmaJqK3AbxhjB9WfRR5rfVDIOFrLlJBcL2yEE1EGg
	 fXov2zESvdWn+deXB6CWiPifep06fYxbqi+AmY97eSXWAhXjpow+3SyK3vl+pA0no2
	 WwS7BzVVAWaA7T2dKhYeimjQf51Xy54u55/zZz/U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8F50F805A9; Sun, 27 Aug 2023 19:01:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D437AF80589;
	Sun, 27 Aug 2023 19:01:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83163F80158; Thu, 24 Aug 2023 20:40:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 58832F80074
	for <alsa-devel@alsa-project.org>; Thu, 24 Aug 2023 20:40:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58832F80074
Received: from fabians-envy.localnet ([84.177.92.38]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Mk178-1ptHjU2ibI-00kOg3; Thu, 24 Aug 2023 20:40:08 +0200
From: Fabian Vogt <fabian@ritter-vogt.de>
To: SungHwan Jung <onenowy@gmail.com>, Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, perex@perex.cz
Subject: 
 [PATCH v2] ALSA: hda/realtek: Add quirk for mute LEDs on HP ENVY x360
 15-eu0xxx
Date: Thu, 24 Aug 2023 20:39:48 +0200
Message-ID: <2693091.mvXUDI8C0e@fabians-envy>
In-Reply-To: <87r0ns8hej.wl-tiwai@suse.de>
References: 
 <4504056.LvFx2qVVIh@fabians-envy> <20230824173718.7992-1-onenowy@gmail.com>
 <87r0ns8hej.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:W7blxS3c6dpEQm6rYd4+kSQFGJle9djrEhphObjfCnhDatm1j4j
 02Ie9OO9hnZGp/mXZ4FN106ydEqaAa9z80N74EuL/9xUtM9q6TTcWCa3YcleUP2tkBupi+R
 VI3qLKrseMXEgcjaw8vyY1Ibb/l1j5hqoS6W0tDok3P2CDVG9SmV+vLn8PkKxDLoxEQ6qeC
 sbRXy5YBgFu2fkZZjVgCA==
UI-OutboundReport: notjunk:1;M01:P0:pQ3ElwUF68g=;ru8XSV0NIDe7i6IoljC8Y27GxyW
 EwOaJXwlumBXcqL5Tf11L9IsGjnjR398xIHuBGh+UDVh2iBKTgHzLgZeCzdNhpb42asOU867s
 neRpnSPL2kgp3PYIqbQPulGBdx6eNpkkcs95to2mTKa/s0YPXgaFm+amD52j2jCqmL3y3vT/d
 oOt2PY9E4ec1fWEMbBqdvUGtwfEf5YSiUYCjNaOU3y9FI3NKGYVB1FfzJ7GXDGJHPkJ04ypEI
 F7aXNU0e28L6bY6zpasOMAUnPn3Fb5ZD+IO+aAwqNXCCsMN2YPVXqoPQ5AlGwNquk9iKbLCw8
 yHC4k81H0WixkBU//w91bE9AdP5VGFmf+zGvtbmuf7KnOh4JCWd7hixQuytjr72Fhmpi8pn3j
 Hq3zM0V7BpxB5++M0k2qNH72+PpzDHjSUUnh+zUKRsZFCHo0HWC7eo74mV8gd0IVAPymeKtK5
 MWRmiiVnwQpxK8TWDL/9bLL6LJy2VFWGP+Gd2/o1Yn2HmfOad2RAdQakqJ7aea6TBkliew/pj
 rp8Vgkxb5dXlBWLB4Z7zKcLRxzbmKRkUnBbN2/AYpzhxfYvowuKmTwarfYIp3KGVJsLODzwds
 cEzLz9SRkQz7/NSY20Fvl+D8Y/q2BVH/Gmfs7unsdONmnPk4CV6GhylNBew6PmVzXBTsHUbYZ
 fjkM/CXzcS53wvN6EAKecI21zDXZhVcweeFExf03uC9bf1YZwewgS28YKTPBy2pqLeoPB3KQy
 iQx3u0kG8iJS9qJfDnRiQeV0nSwozxbB33wV4Rg1SL1rBddBXMaNRFYCSR21pnaiGzw2yHTKs
 xPiL1BFyuzbctK68EJ1Y2BU9u1tF3qk5Kb2zqvzNuxJVDMGhlK1ofE/1QbWIXmO4MERlcEio2
 vH9NW/8Fb6b/daw==
X-MailFrom: fabian@ritter-vogt.de
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: EZQPZOX6LPI3RGVDRTTJCC2XFFFNYCKF
X-Message-ID-Hash: EZQPZOX6LPI3RGVDRTTJCC2XFFFNYCKF
X-Mailman-Approved-At: Sun, 27 Aug 2023 17:01:44 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EZQPZOX6LPI3RGVDRTTJCC2XFFFNYCKF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The LED for the mic mute button is controlled by GPIO2.
The mute button LED is slightly more complex, it's controlled by two bits
in coeff 0x0b.

Signed-off-by: Fabian Vogt <fabian@ritter-vogt.de>
---
Changes since v1:
Rebased on 03b0563c2f35. I've got this laptop for almost two years now and
two days ago decided to dig into the issue with mute LEDs. What amazing timing
that someone else made the exact same fixup for a different model just hours
before I submit...
Renamed quirk to ..._LEDS to distinguish it from the similar quirk which
handles only one of the mute LEDs.

 sound/pci/hda/patch_realtek.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index afc63d367fd5..a07df6f92960 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7318,6 +7318,7 @@ enum {
 	ALC287_FIXUP_CS35L41_I2C_2_THINKPAD_ACPI,
 	ALC287_FIXUP_TAS2781_I2C,
 	ALC245_FIXUP_HP_MUTE_LED_COEFBIT,
+	ALC245_FIXUP_HP_X360_MUTE_LEDS,
 };
 
 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -9406,6 +9407,12 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc245_fixup_hp_mute_led_coefbit,
 	},
+	[ALC245_FIXUP_HP_X360_MUTE_LEDS] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc245_fixup_hp_mute_led_coefbit,
+		.chained = true,
+		.chain_id = ALC245_FIXUP_HP_GPIO_LED
+	},
 };
 
 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -9648,6 +9655,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8870, "HP ZBook Fury 15.6 Inch G8 Mobile Workstation PC", ALC285_FIXUP_HP_GPIO_AMP_INIT),
 	SND_PCI_QUIRK(0x103c, 0x8873, "HP ZBook Studio 15.6 Inch G8 Mobile Workstation PC", ALC285_FIXUP_HP_GPIO_AMP_INIT),
 	SND_PCI_QUIRK(0x103c, 0x887a, "HP Laptop 15s-eq2xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
+	SND_PCI_QUIRK(0x103c, 0x888a, "HP ENVY x360 Convertible 15-eu0xxx", ALC245_FIXUP_HP_X360_MUTE_LEDS),
 	SND_PCI_QUIRK(0x103c, 0x888d, "HP ZBook Power 15.6 inch G8 Mobile Workstation PC", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8895, "HP EliteBook 855 G8 Notebook PC", ALC285_FIXUP_HP_SPEAKERS_MICMUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8896, "HP EliteBook 855 G8 Notebook PC", ALC285_FIXUP_HP_MUTE_LED),
-- 
2.41.0




