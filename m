Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A0750B3A1
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 11:11:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F15621724;
	Fri, 22 Apr 2022 11:10:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F15621724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650618681;
	bh=t1u2gPB0QVOL0w6A6XAlLgiA7pXFZ2OC7/ngRGn6a0E=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QeS587xg+R4Kjx3ukaFmTUhNn62VPHla6lsI7bv5kLav3hb0SVXpbFxD/4uGP9MDw
	 PKstEd2ifEslNMuEWr2Yewwna0j1rP9jlg5pfIi2tJBCkhXSst8nnzVT4O/dhKYJdD
	 UpI7JSi+EBl2bH0FpxqTQfBJicTbLJcwozRzkUqo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6321CF80249;
	Fri, 22 Apr 2022 11:10:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5611FF80245; Fri, 22 Apr 2022 11:10:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DC57F80125
 for <alsa-devel@alsa-project.org>; Fri, 22 Apr 2022 11:10:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DC57F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="RYosJOUS"
Received: from localhost.localdomain (unknown [10.101.197.31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 8420A3F837; 
 Fri, 22 Apr 2022 09:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1650618613;
 bh=/E9SGn6QJgH+NHwgtXxPKQshs3hDtmq0c5DDynNF6PQ=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=RYosJOUSpgkcwps8nnJJ575JV7WwPWX3ySczbHKSwZdiQNnHk9NdkkFyLoZVImHWU
 HbV7hzdEYVXdAyT1wuiYk3aQptE+GW4B1DVxtSc/nqy8SXJMBUGDXhyvVxnzhk2V1I
 gsvErOoYbigolruv+KrxwcpfYOVXSPA4UnK6GZMjbb34zeNiVyVbpElR8VNNcbPO52
 YMHDXfDc9v5l5bhLcswWGkpZcVMLFgi4NP9rA1YKz9QnfJKOvDEz+5hVSeWpFqRVXQ
 PgHoukHeMiQ6txjg+Gro712MaoZ340VjypfziP9Fkg/Q9uVHf9fPgeiRRDanTM9yW0
 +sUPw9BEJ0EOg==
From: Andy Chi <andy.chi@canonical.com>
To: 
Subject: [PATCH] ALSA: hda/realtek: Enable mute/micmute LEDs support for HP
 Laptops
Date: Fri, 22 Apr 2022 17:08:43 +0800
Message-Id: <20220422090845.230071-1-andy.chi@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Kailang Yang <kailang@realtek.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Jeremy Szu <jeremy.szu@canonical.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Werner Sembach <wse@tuxedocomputers.com>,
 Hui Wang <hui.wang@canonical.com>, Kai-Heng Feng <kai.heng.feng@canonical.com>,
 andy.chi@canonical.com, Cameron Berkenpas <cam@neo-zeon.de>,
 Sami Loone <sami@loone.fi>
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

On HP Laptops, requires the same ALC285_FIXUP_HP_GPIO_LED quirk to
make its audio LEDs work.

So apply the quirk, and make it the last one since it's an LED quirk.

Signed-off-by: Andy Chi <andy.chi@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 0cba2f19a772..29de8d7959c7 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9023,12 +9023,12 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8896, "HP EliteBook 855 G8 Notebook PC", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8898, "HP EliteBook 845 G8 Notebook PC", ALC285_FIXUP_HP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x103c, 0x88d0, "HP Pavilion 15-eh1xxx (mainboard 88D0)", ALC287_FIXUP_HP_GPIO_LED),
-	SND_PCI_QUIRK(0x103c, 0x896e, "HP EliteBook x360 830 G9", ALC245_FIXUP_CS35L41_SPI_2),
-	SND_PCI_QUIRK(0x103c, 0x8971, "HP EliteBook 830 G9", ALC245_FIXUP_CS35L41_SPI_2),
-	SND_PCI_QUIRK(0x103c, 0x8972, "HP EliteBook 840 G9", ALC245_FIXUP_CS35L41_SPI_2),
-	SND_PCI_QUIRK(0x103c, 0x8973, "HP EliteBook 860 G9", ALC245_FIXUP_CS35L41_SPI_2),
-	SND_PCI_QUIRK(0x103c, 0x8974, "HP EliteBook 840 Aero G9", ALC245_FIXUP_CS35L41_SPI_2),
-	SND_PCI_QUIRK(0x103c, 0x8975, "HP EliteBook x360 840 Aero G9", ALC245_FIXUP_CS35L41_SPI_2),
+	SND_PCI_QUIRK(0x103c, 0x896e, "HP EliteBook x360 830 G9", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8971, "HP EliteBook 830 G9", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8972, "HP EliteBook 840 G9", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8973, "HP EliteBook 860 G9", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8974, "HP EliteBook 840 Aero G9", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8975, "HP EliteBook x360 840 Aero G9", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8981, "HP Elite Dragonfly G3", ALC245_FIXUP_CS35L41_SPI_4),
 	SND_PCI_QUIRK(0x103c, 0x898e, "HP EliteBook 835 G9", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x898f, "HP EliteBook 835 G9", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.25.1

