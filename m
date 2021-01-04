Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 643F02E98C2
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jan 2021 16:32:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09B0E167F;
	Mon,  4 Jan 2021 16:31:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09B0E167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609774358;
	bh=RPo9bWZJ/K01sjsKCPCTDFUvTjiCmCLtiaCZe5Cz6n0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=U7DVdNPDMTucsapMxLhd5zMJlluOJAyHA9VAhPQwDOpLbta9xiuKcBqeZTBA3wptO
	 o65MWq/aOnzwbgov+UM8RWC04Hb0Kuy8atFPaWPKeqSKDKfTPuPdsnMv/ILs/GuYoI
	 3IJphh5xJxpepZdU19oyrZKKNbUOT6C3St9A9LcQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BEAAF8012C;
	Mon,  4 Jan 2021 16:31:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FDE9F80166; Mon,  4 Jan 2021 16:31:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02832F8012B
 for <alsa-devel@alsa-project.org>; Mon,  4 Jan 2021 16:30:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02832F8012B
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 38F35B73F;
 Mon,  4 Jan 2021 15:30:51 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/via: Fix runtime PM for Clevo W35xSS
Date: Mon,  4 Jan 2021 16:30:46 +0100
Message-Id: <20210104153046.19993-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Christian Labisch <clnetbox@gmail.com>
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

Clevo W35xSS_370SS with VIA codec has had the runtime PM problem that
looses the power state of some nodes after the runtime resume.  This
was worked around by disabling the default runtime PM via a denylist
entry.  Since 5.10.x made the runtime PM applied (casually) even
though it's disabled in the denylist, this problem was revisited.  The
result was that disabling power_save_node feature suffices for the
runtime PM problem.

This patch implements the disablement of power_save_node feature in
VIA codec for the device.  It also drops the former denylist entry,
too, as the runtime PM should work in the codec side properly now.

Fixes: b529ef2464ad ("ALSA: hda: Add Clevo W35xSS_370SS to the power_save blacklist")
Reported-by: Christian Labisch <clnetbox@gmail.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_intel.c |  2 --
 sound/pci/hda/patch_via.c | 13 +++++++++++++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 6852668f1bcb..770ad25f1907 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2220,8 +2220,6 @@ static const struct snd_pci_quirk power_save_denylist[] = {
 	SND_PCI_QUIRK(0x1849, 0x7662, "Asrock H81M-HDS", 0),
 	/* https://bugzilla.redhat.com/show_bug.cgi?id=1525104 */
 	SND_PCI_QUIRK(0x1043, 0x8733, "Asus Prime X370-Pro", 0),
-	/* https://bugzilla.redhat.com/show_bug.cgi?id=1581607 */
-	SND_PCI_QUIRK(0x1558, 0x3501, "Clevo W35xSS_370SS", 0),
 	/* https://bugzilla.redhat.com/show_bug.cgi?id=1525104 */
 	SND_PCI_QUIRK(0x1558, 0x6504, "Clevo W65_67SB", 0),
 	/* https://bugzilla.redhat.com/show_bug.cgi?id=1525104 */
diff --git a/sound/pci/hda/patch_via.c b/sound/pci/hda/patch_via.c
index 7ef8f3105cdb..0ab40a8a68fb 100644
--- a/sound/pci/hda/patch_via.c
+++ b/sound/pci/hda/patch_via.c
@@ -1002,6 +1002,7 @@ static const struct hda_verb vt1802_init_verbs[] = {
 enum {
 	VIA_FIXUP_INTMIC_BOOST,
 	VIA_FIXUP_ASUS_G75,
+	VIA_FIXUP_POWER_SAVE,
 };
 
 static void via_fixup_intmic_boost(struct hda_codec *codec,
@@ -1011,6 +1012,13 @@ static void via_fixup_intmic_boost(struct hda_codec *codec,
 		override_mic_boost(codec, 0x30, 0, 2, 40);
 }
 
+static void via_fixup_power_save(struct hda_codec *codec,
+				 const struct hda_fixup *fix, int action)
+{
+	if (action == HDA_FIXUP_ACT_PRE_PROBE)
+		codec->power_save_node = 0;
+}
+
 static const struct hda_fixup via_fixups[] = {
 	[VIA_FIXUP_INTMIC_BOOST] = {
 		.type = HDA_FIXUP_FUNC,
@@ -1025,11 +1033,16 @@ static const struct hda_fixup via_fixups[] = {
 			{ }
 		}
 	},
+	[VIA_FIXUP_POWER_SAVE] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = via_fixup_power_save,
+	},
 };
 
 static const struct snd_pci_quirk vt2002p_fixups[] = {
 	SND_PCI_QUIRK(0x1043, 0x1487, "Asus G75", VIA_FIXUP_ASUS_G75),
 	SND_PCI_QUIRK(0x1043, 0x8532, "Asus X202E", VIA_FIXUP_INTMIC_BOOST),
+	SND_PCI_QUIRK(0x1558, 0x3501, "Clevo W35xSS_370SS", VIA_FIXUP_POWER_SAVE),
 	{}
 };
 
-- 
2.26.2

