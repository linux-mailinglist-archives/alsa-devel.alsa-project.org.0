Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B00A674B7
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Mar 2025 14:16:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68F3B60385;
	Tue, 18 Mar 2025 14:16:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68F3B60385
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1742303783;
	bh=hIZWXYMKWTfTI4Ku8ZKFYn+onVLQdLgszEGMeUHIaNo=;
	h=Date:To:From:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=or3fvvtMj9yhz3hY4yxCJ06RDfxmggXBHXSTMmMSx7ac3APmEDVSEQW1qg9HOZ2RC
	 2VmbEy4j4DiAWKdN+Iz61b1jCkd0ZeBKcALQ2UD+8lcCd4u99gn3lOgbSqQUzG6+E+
	 cztq21rT3dsZ29MZi998Gz3wLn9rdc/INENII+vY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02634F80608; Tue, 18 Mar 2025 14:15:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CD1CBF805FD;
	Tue, 18 Mar 2025 14:15:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A27ADF8055B; Mon, 17 Mar 2025 09:34:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-40140.protonmail.ch (mail-40140.protonmail.ch
 [185.70.40.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B84B8F80073
	for <alsa-devel@alsa-project.org>; Mon, 17 Mar 2025 09:34:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B84B8F80073
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256
 header.s=protonmail header.b=ObN1J4iZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1742200439; x=1742459639;
	bh=hIZWXYMKWTfTI4Ku8ZKFYn+onVLQdLgszEGMeUHIaNo=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=ObN1J4iZjKY+SVVzINBq2bMZS53GY3ak8Xitew7BsJZMdYfyZkRz8J5eGWKWiRtHT
	 ffp0GrA5sKzQfy8ivB63leTpL0zmot94xekDO6y4PzVf24MXZMuGQVGg/Btq/dYFLA
	 GGyx9rbhNgl2kEO6Eb4EK4cz1a+FKJ7pI6pxR/eeK55Az+GguXu9D4EEwoCrJ1ATWE
	 zMmKUfkgPFBIqbQsxd9IpuUNhpPY3Ul7rbQQrlO9lkaM5nQqfTyLYESvvL9bGDjQTF
	 J1KPI9TVscKrmUWtLuIvR/XwWF9gAeMHppepb/1OY/apctpQAKwlJH28NGFzWZ7FfO
	 +8CFRtdjlfU2g==
Date: Mon, 17 Mar 2025 08:33:53 +0000
To: tiwai@suse.com
From: Dhruv Deshpande <dhrv.d@proton.me>
Cc: alsa-devel@alsa-project.org, stable@vger.kernel.org,
 Dhruv Deshpande <dhrv.d@proton.me>
Subject: [PATCH] ALSA: hda/realtek: Support mute LED on HP Laptop 15s-du3xxx
 The mute LED on this HP laptop uses ALC236 and requires a quirk to function.
 This patch enables the existing quirk for the device.
Message-ID: <20250317083319.42195-1-dhrv.d@proton.me>
Feedback-ID: 76774272:user:proton
X-Pm-Message-ID: 2d5d4fb9449516412bcce8dadefd406d8b054991
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-MailFrom: dhrv.d@proton.me
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: GGB4VMP5EUHGXF56CPZZCJGWYXBKSZ5W
X-Message-ID-Hash: GGB4VMP5EUHGXF56CPZZCJGWYXBKSZ5W
X-Mailman-Approved-At: Tue, 18 Mar 2025 13:15:09 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GGB4VMP5EUHGXF56CPZZCJGWYXBKSZ5W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Signed-off-by: Dhruv Deshpande <dhrv.d@proton.me>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index a84857a3c2bf..c0b97c29bf89 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10519,6 +10519,7 @@ static const struct hda_quirk alc269_fixup_tbl[] =
=3D {
 =09SND_PCI_QUIRK(0x103c, 0x8811, "HP Spectre x360 15-eb1xxx", ALC285_FIXUP=
_HP_SPECTRE_X360_EB1),
 =09SND_PCI_QUIRK(0x103c, 0x8812, "HP Spectre x360 15-eb1xxx", ALC285_FIXUP=
_HP_SPECTRE_X360_EB1),
 =09SND_PCI_QUIRK(0x103c, 0x881d, "HP 250 G8 Notebook PC", ALC236_FIXUP_HP_=
MUTE_LED_COEFBIT2),
+=09SND_PCI_QUIRK(0x103c, 0x881e, "HP Laptop 15s-du3xxx", ALC236_FIXUP_HP_M=
UTE_LED_COEFBIT2),
 =09SND_PCI_QUIRK(0x103c, 0x8846, "HP EliteBook 850 G8 Notebook PC", ALC285=
_FIXUP_HP_GPIO_LED),
 =09SND_PCI_QUIRK(0x103c, 0x8847, "HP EliteBook x360 830 G8 Notebook PC", A=
LC285_FIXUP_HP_GPIO_LED),
 =09SND_PCI_QUIRK(0x103c, 0x884b, "HP EliteBook 840 Aero G8 Notebook PC", A=
LC285_FIXUP_HP_GPIO_LED),
--=20
2.48.1


