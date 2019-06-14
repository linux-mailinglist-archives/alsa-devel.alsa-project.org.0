Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E07457D1
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jun 2019 10:46:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79AD7185F;
	Fri, 14 Jun 2019 10:45:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79AD7185F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560501978;
	bh=n7lu97A2aBcYNjk+QS//ffs6UMtCYaYSJAG9i9YaxDI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OdDN5x2NjtvOQWKT3FFRXkaUjomXwcRuxTxb+f5JqlXUfEQvqPsvy/i1DOE9ERDSY
	 Fl5CNbrVftrkvQIhYzeUus/KMGRMKUSCPRyBrir+xGhMbXdtj6ELsfK1R+OMl3iyDR
	 Lx3h94Vs3q8I/yhRRllWWYIIxO13g7mp1FFOeE60=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BF16F896CE;
	Fri, 14 Jun 2019 10:44:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A12F6F896CE; Fri, 14 Jun 2019 10:44:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A488F896CE
 for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2019 10:44:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A488F896CE
Received: from [222.130.132.197] (helo=localhost.localdomain)
 by youngberry.canonical.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <hui.wang@canonical.com>)
 id 1hbhoy-0008JJ-6D; Fri, 14 Jun 2019 08:44:28 +0000
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Date: Fri, 14 Jun 2019 16:44:12 +0800
Message-Id: <20190614084412.9834-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.17.1
Cc: stable@vger.kernel.org
Subject: [alsa-devel] [PATCH] Revert "ALSA: hda/realtek - Improve the
	headset mic for Acer Aspire laptops"
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This reverts commit 9cb40eb184c4220d244a532bd940c6345ad9dbd9.

This patch introduces noise and headphone playback issue after
rebooting or suspending/resuming. Let us revert it.

https://bugzilla.kernel.org/show_bug.cgi?id=203831
Cc: <stable@vger.kernel.org>
Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 1afb268f3da0..179e4be1f747 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6268,15 +6268,13 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chain_id = ALC269_FIXUP_THINKPAD_ACPI,
 	},
 	[ALC255_FIXUP_ACER_MIC_NO_PRESENCE] = {
-		.type = HDA_FIXUP_VERBS,
-		.v.verbs = (const struct hda_verb[]) {
-			/* Enable the Mic */
-			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x45 },
-			{ 0x20, AC_VERB_SET_PROC_COEF, 0x5089 },
-			{}
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x19, 0x01a1913c }, /* use as headset mic, without its own jack detect */
+			{ }
 		},
 		.chained = true,
-		.chain_id = ALC269_FIXUP_LIFEBOOK_EXTMIC
+		.chain_id = ALC255_FIXUP_HEADSET_MODE
 	},
 	[ALC255_FIXUP_ASUS_MIC_NO_PRESENCE] = {
 		.type = HDA_FIXUP_PINS,
@@ -7320,10 +7318,6 @@ static const struct snd_hda_pin_quirk alc269_pin_fixup_tbl[] = {
 		{0x18, 0x02a11030},
 		{0x19, 0x0181303F},
 		{0x21, 0x0221102f}),
-	SND_HDA_PIN_QUIRK(0x10ec0255, 0x1025, "Acer", ALC255_FIXUP_ACER_MIC_NO_PRESENCE,
-		{0x12, 0x90a60140},
-		{0x14, 0x90170120},
-		{0x21, 0x02211030}),
 	SND_HDA_PIN_QUIRK(0x10ec0255, 0x1025, "Acer", ALC255_FIXUP_ACER_MIC_NO_PRESENCE,
 		{0x12, 0x90a601c0},
 		{0x14, 0x90171120},
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
