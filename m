Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5B16F8366
	for <lists+alsa-devel@lfdr.de>; Fri,  5 May 2023 15:01:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BA6F2CB0;
	Fri,  5 May 2023 15:00:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BA6F2CB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683291674;
	bh=Q7plKiQLB2fe8xDuLSzFDJ3c2CvcwSmte3+xNw0KNHk=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ccwVLydsdD5ck4095P6CCleIteHeT+WoUKTMTZvLAf7ez8wre+R0J92erGazwfOw0
	 14zo4n2jvav0L0J4hBe7oX/7yS0FLx+kE4G/CQylDditfocbkTtG0T7JXT0n434Dz2
	 JbFa2hlLyZSizZbgdaqynwOt2R8wEa2UXSIm/+gk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9099DF80529;
	Fri,  5 May 2023 15:00:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB251F8052D; Fri,  5 May 2023 15:00:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6FCC7F80087
	for <alsa-devel@alsa-project.org>; Fri,  5 May 2023 15:00:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FCC7F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=VmmdZsSY
Received: from localhost.localdomain (unknown [10.101.196.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 1F09241FF9;
	Fri,  5 May 2023 13:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1683291614;
	bh=tj/QGQNbz6EyoFCEKhkJa41CXGI8IfJ0W1/aZihL5xc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=VmmdZsSYheN4I3KNspDPeCjlAZX4zkMTZHMJHXhtjErq2DA0enrtfsuYcPz5DoO2I
	 DJZv0T/0EO3gebC29UOdKTCL5aduHEiUMtBXqxV+x7gjn8e+/YOCCkfNra5LCiecl2
	 EPRQCmrg52uo7VNVmD1V/dNJ15Je5xcGWHVRong+2vTzw66RmVQNCne5BL0TMfGntD
	 WWHqSbXwVwtijgHxy0ACecc4dsjt2yleGDlvoadxTW8V1XzdoP8qVnYzyna9sneTU3
	 skVj9BlBYGqr1qxbkTY2EDudofWgR+sJV72NqsgwRSccjZFi3LRdYmwAHOENwQiDDV
	 uE+ZEkVsaPvLA==
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: tiwai@suse.com
Subject: [PATCH] ALSA: hda/realtek: Fix mute and micmute LEDs for an HP laptop
Date: Fri,  5 May 2023 14:59:23 +0200
Message-Id: <20230505125925.543601-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CZSVYQE47BWM5BHLYLWKZEGG65NYSUC5
X-Message-ID-Hash: CZSVYQE47BWM5BHLYLWKZEGG65NYSUC5
X-MailFrom: kai.heng.feng@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Stefan Binding <sbinding@opensource.cirrus.com>,
 Andy Chi <andy.chi@canonical.com>, Tim Crawford <tcrawford@system76.com>,
 Meng Tang <tangmeng@uniontech.com>, "Luke D. Jones" <luke@ljones.dev>,
 Philipp Jungkamp <p.jungkamp@gmx.net>,
 =?UTF-8?q?Kacper=20Michaj=C5=82ow?= <kasper93@gmail.com>,
 Gabriele Mazzotta <gabriele.mzt@gmail.com>,
 Yuchi Yang <yangyuchi66@gmail.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CZSVYQE47BWM5BHLYLWKZEGG65NYSUC5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There's another laptop that needs the fixup to enable mute and micmute
LEDs. So do it accordingly.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index f70d6a33421d..afc562a8afbb 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9478,6 +9478,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8b8d, "HP", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8b8f, "HP", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8b92, "HP", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8b96, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8bf0, "HP", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x1043, 0x103e, "ASUS X540SA", ALC256_FIXUP_ASUS_MIC),
 	SND_PCI_QUIRK(0x1043, 0x103f, "ASUS TX300", ALC282_FIXUP_ASUS_TX300),
-- 
2.34.1

