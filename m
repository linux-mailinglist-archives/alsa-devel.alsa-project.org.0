Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AE01D3601
	for <lists+alsa-devel@lfdr.de>; Thu, 14 May 2020 18:08:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51763166D;
	Thu, 14 May 2020 18:07:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51763166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589472495;
	bh=c1n1PNRe/ADzkMciyizD/mgAJvyMVoIOMCISJvvnRgk=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GdgFQ5X0mq1+Jtd+/J6rxyE9kcPxd2VWb/pUW10R7ENe7rOi/sAEXnZ3seqylhq7o
	 78y05Cxr23hbtSYz3BGhkVWndFYl4cxp1yiU1/RYsYLK313iXJ+qAQ01QpG/cP8NXc
	 b5EhHxDb4WZCXCsjbHSWbWOMoBrNCW/lMkI1ZHp8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F737F8014C;
	Thu, 14 May 2020 18:06:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5104F80158; Thu, 14 May 2020 18:05:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D7BEF800BD
 for <alsa-devel@alsa-project.org>; Thu, 14 May 2020 18:05:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D7BEF800BD
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 94240AF3E
 for <alsa-devel@alsa-project.org>; Thu, 14 May 2020 16:05:38 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/realtek - Limit int mic boost for Thinkpad T530
Date: Thu, 14 May 2020 18:05:33 +0200
Message-Id: <20200514160533.10337-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
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

Lenovo Thinkpad T530 seems to have a sensitive internal mic capture
that needs to limit the mic boost like a few other Thinkpad models.
Although we may change the quirk for ALC269_FIXUP_LENOVO_DOCK, this
hits way too many other laptop models, so let's add a new fixup model
that limits the internal mic boost on top of the existing quirk and
apply to only T530.

BugLink: https://bugzilla.suse.com/show_bug.cgi?id=1171293
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_realtek.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 4080b492ecc0..dc2302171a71 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -5969,6 +5969,7 @@ enum {
 	ALC269_FIXUP_HP_LINE1_MIC1_LED,
 	ALC269_FIXUP_INV_DMIC,
 	ALC269_FIXUP_LENOVO_DOCK,
+	ALC269_FIXUP_LENOVO_DOCK_LIMIT_BOOST,
 	ALC269_FIXUP_NO_SHUTUP,
 	ALC286_FIXUP_SONY_MIC_NO_PRESENCE,
 	ALC269_FIXUP_PINCFG_NO_HP_TO_LINEOUT,
@@ -6293,6 +6294,12 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC269_FIXUP_PINCFG_NO_HP_TO_LINEOUT
 	},
+	[ALC269_FIXUP_LENOVO_DOCK_LIMIT_BOOST] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc269_fixup_limit_int_mic_boost,
+		.chained = true,
+		.chain_id = ALC269_FIXUP_LENOVO_DOCK,
+	},
 	[ALC269_FIXUP_PINCFG_NO_HP_TO_LINEOUT] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc269_fixup_pincfg_no_hp_to_lineout,
@@ -7476,7 +7483,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x21b8, "Thinkpad Edge 14", ALC269_FIXUP_SKU_IGNORE),
 	SND_PCI_QUIRK(0x17aa, 0x21ca, "Thinkpad L412", ALC269_FIXUP_SKU_IGNORE),
 	SND_PCI_QUIRK(0x17aa, 0x21e9, "Thinkpad Edge 15", ALC269_FIXUP_SKU_IGNORE),
-	SND_PCI_QUIRK(0x17aa, 0x21f6, "Thinkpad T530", ALC269_FIXUP_LENOVO_DOCK),
+	SND_PCI_QUIRK(0x17aa, 0x21f6, "Thinkpad T530", ALC269_FIXUP_LENOVO_DOCK_LIMIT_BOOST),
 	SND_PCI_QUIRK(0x17aa, 0x21fa, "Thinkpad X230", ALC269_FIXUP_LENOVO_DOCK),
 	SND_PCI_QUIRK(0x17aa, 0x21f3, "Thinkpad T430", ALC269_FIXUP_LENOVO_DOCK),
 	SND_PCI_QUIRK(0x17aa, 0x21fb, "Thinkpad T430s", ALC269_FIXUP_LENOVO_DOCK),
@@ -7615,6 +7622,7 @@ static const struct hda_model_fixup alc269_fixup_models[] = {
 	{.id = ALC269_FIXUP_HEADSET_MODE, .name = "headset-mode"},
 	{.id = ALC269_FIXUP_HEADSET_MODE_NO_HP_MIC, .name = "headset-mode-no-hp-mic"},
 	{.id = ALC269_FIXUP_LENOVO_DOCK, .name = "lenovo-dock"},
+	{.id = ALC269_FIXUP_LENOVO_DOCK_LIMIT_BOOST, .name = "lenovo-dock-limit-boost"},
 	{.id = ALC269_FIXUP_HP_GPIO_LED, .name = "hp-gpio-led"},
 	{.id = ALC269_FIXUP_HP_DOCK_GPIO_MIC1_LED, .name = "hp-dock-gpio-mic1-led"},
 	{.id = ALC269_FIXUP_DELL1_MIC_NO_PRESENCE, .name = "dell-headset-multi"},
-- 
2.16.4

