Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E09913729FA
	for <lists+alsa-devel@lfdr.de>; Tue,  4 May 2021 14:20:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65CBD169A;
	Tue,  4 May 2021 14:19:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65CBD169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620130816;
	bh=J2rbUqtGpKX6XUBmE8i7R7QKfzAYhk8H+PHzbbU5fHU=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XjIHGIA2jVFNxev5c9rgOhfJAOsQP6FJ+kYK7M2oGUq6ihr5P/R9/KxX2ZJzLf7C3
	 +3Je2xZXgpsyyW7NpGeO9M02rwtc93t/G5TuY5E5pbVAkLOvmW1f9NCwe/p6pf3ri8
	 AKZoTZ7hVhv21LNrjCkr57/2WnYPtFyRBs4WA4fM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BAE02F80108;
	Tue,  4 May 2021 14:18:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD00DF8021C; Tue,  4 May 2021 14:18:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5DE13F80108
 for <alsa-devel@alsa-project.org>; Tue,  4 May 2021 14:18:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DE13F80108
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C2818AE1C
 for <alsa-devel@alsa-project.org>; Tue,  4 May 2021 12:18:35 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/realtek: Add fixup for HP OMEN laptop
Date: Tue,  4 May 2021 14:18:32 +0200
Message-Id: <20210504121832.4558-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

HP OMEN dc0019-ur with codec SSID 103c:84da requires the pin config
overrides and the existing mic/mute LED setup.  This patch implements
those in the fixup table.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=212733
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_realtek.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index ee2841dd0c6d..6d58f24c9702 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6506,6 +6506,7 @@ enum {
 	ALC285_FIXUP_IDEAPAD_S740_COEF,
 	ALC285_FIXUP_HP_LIMIT_INT_MIC_BOOST,
 	ALC295_FIXUP_ASUS_DACS,
+	ALC295_FIXUP_HP_OMEN,
 };
 
 static const struct hda_fixup alc269_fixups[] = {
@@ -8014,6 +8015,26 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc295_fixup_asus_dacs,
 	},
+	[ALC295_FIXUP_HP_OMEN] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x12, 0xb7a60130 },
+			{ 0x13, 0x40000000 },
+			{ 0x14, 0x411111f0 },
+			{ 0x16, 0x411111f0 },
+			{ 0x17, 0x90170110 },
+			{ 0x18, 0x411111f0 },
+			{ 0x19, 0x02a11030 },
+			{ 0x1a, 0x411111f0 },
+			{ 0x1b, 0x04a19030 },
+			{ 0x1d, 0x40600001 },
+			{ 0x1e, 0x411111f0 },
+			{ 0x21, 0x03211020 },
+			{}
+		},
+		.chained = true,
+		.chain_id = ALC269_FIXUP_HP_LINE1_MIC1_LED,
+	},
 };
 
 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -8172,6 +8193,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x82c0, "HP G3 mini premium", ALC221_FIXUP_HP_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x103c, 0x83b9, "HP Spectre x360", ALC269_FIXUP_HP_MUTE_LED_MIC3),
 	SND_PCI_QUIRK(0x103c, 0x8497, "HP Envy x360", ALC269_FIXUP_HP_MUTE_LED_MIC3),
+	SND_PCI_QUIRK(0x103c, 0x84da, "HP OMEN dc0019-ur", ALC295_FIXUP_HP_OMEN),
 	SND_PCI_QUIRK(0x103c, 0x84e7, "HP Pavilion 15", ALC269_FIXUP_HP_MUTE_LED_MIC3),
 	SND_PCI_QUIRK(0x103c, 0x869d, "HP", ALC236_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x86c7, "HP Envy AiO 32", ALC274_FIXUP_HP_ENVY_GPIO),
@@ -8577,6 +8599,7 @@ static const struct hda_model_fixup alc269_fixup_models[] = {
 	{.id = ALC255_FIXUP_XIAOMI_HEADSET_MIC, .name = "alc255-xiaomi-headset"},
 	{.id = ALC274_FIXUP_HP_MIC, .name = "alc274-hp-mic-detect"},
 	{.id = ALC245_FIXUP_HP_X360_AMP, .name = "alc245-hp-x360-amp"},
+	{.id = ALC295_FIXUP_HP_OMEN, .name = "alc295-hp-omen"},
 	{}
 };
 #define ALC225_STANDARD_PINS \
-- 
2.26.2

