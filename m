Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CECA67E9B77
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Nov 2023 12:53:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42FC7DE5;
	Mon, 13 Nov 2023 12:52:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42FC7DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699876405;
	bh=NO6iBNKNfNUugqsYw00HHj0Pi/Qh12m9Ysv3bf3ht74=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gvML+c1QD/rMD9qYXlzfeZlAjOn1s59jw4wkIjrIMDJtinYjTqcPnsA/UazBH9qeB
	 nkf0ll0my+Z/jz7Ys9lpi4sFL9FkqtL5CwZA6Vt318F0WV14zKO/ujofT+dYAAQzgx
	 IAQ+XIQ3HB23GXoTckefzmH3uqOdsIOHxddrSlRg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF096F805A8; Mon, 13 Nov 2023 12:51:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B4682F80580;
	Mon, 13 Nov 2023 12:51:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 465B9F801D5; Sun, 12 Nov 2023 17:22:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail.malych.org (gateway.malych.org [185.150.1.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 79ED7F80166
	for <alsa-devel@alsa-project.org>; Sun, 12 Nov 2023 17:22:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79ED7F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=malych.org header.i=@malych.org header.a=rsa-sha256
 header.s=dkim header.b=Phh/Vnfa
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 26600AA8CD6;
	Sun, 12 Nov 2023 17:22:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=malych.org; s=dkim;
	t=1699806140; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=GCMcwORUQRqnOz5c+Ffs4hnmtdMXVgc71+oi7qf57u4=;
	b=Phh/Vnfayf2BhHSEnRVnm4+0OyCygXAyK2uaqmb853MmN8UKBvHHd/N6g97QHlXE9xYJYL
	CT7+ptW5z9wBmHsAe4coPnZe8Tp8jchI7p2VGSFsQS3mq5RPI7TyA/DAoEY4Y1wRdszYVp
	4Ypq63caFwGIEXQwtyolY+9TmnG33d80nN8zd5I48KbwByqLrnoqUbHXQL5SAtVCE1fJKO
	FckDRaIAVhTgPHLOYl43uapCudbpdxfjnBsOQuTGOFJJBaYEuZ6e4TkDnuMzsTQWpYLYzj
	ENjZS9WZkbxHiM2nYTrGeM1Mt4hbVyz0cnG/6u/S6G4P+p3/agf+cJJzt1TTmA==
From: Matus Malych <matus@malych.org>
To: tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Matus Malych <matus@malych.org>
Subject: [PATCH] ALSA: hda/realtek: Enable Mute LED on HP 255 G10
Date: Sun, 12 Nov 2023 17:18:22 +0100
Message-Id: <20231112161821.6754-1-matus@malych.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-MailFrom: matus@malych.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: YCBFO7M2X2UMEZXKXUSHHRIA47VSVL5F
X-Message-ID-Hash: YCBFO7M2X2UMEZXKXUSHHRIA47VSVL5F
X-Mailman-Approved-At: Mon, 13 Nov 2023 11:51:20 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YCBFO7M2X2UMEZXKXUSHHRIA47VSVL5F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

HP 255 G10 has a mute LED that can be made to work using quirk
ALC236_FIXUP_HP_MUTE_LED_COEFBIT2. Enable already existing quirk.

Signed-off-by: Matus Malych <matus@malych.org>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index cdd808e02b44..bda4e9cb8f98 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9833,6 +9833,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x88d0, "HP Pavilion 15-eh1xxx (mainboard 88D0)", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8902, "HP OMEN 16", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x890e, "HP 255 G8 Notebook PC", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
+	SND_PCI_QUIRK(0x103c, 0x8b2f, "HP 255 15.6 inch G10 Notebook PC", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x8919, "HP Pavilion Aero Laptop 13-be0xxx", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x896d, "HP ZBook Firefly 16 G9", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x896e, "HP EliteBook x360 830 G9", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
-- 
2.34.1

