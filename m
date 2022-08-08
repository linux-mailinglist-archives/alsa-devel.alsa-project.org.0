Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A04A758C409
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Aug 2022 09:35:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 300CD82C;
	Mon,  8 Aug 2022 09:34:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 300CD82C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659944131;
	bh=PEmI6xaiusAwa146senH8JAUXUaD66alhz/aXJUWk9c=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hQmP/FTmZQMig/isFrwEG5JgoPFLlRZompuWarx9rNhFLRE0lepZryfmW2ryfLuc6
	 2UN2F30k1cjcwZvcl1kNP8jHScmolQx89mqvNkhwl6PALXKyAvAojzKUmf0bmaattR
	 AB1VBmhWmjpK3yTjBBfg/fNq8OwKlKq+T3ZAu9HI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7C16F804B1;
	Mon,  8 Aug 2022 09:34:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70938F8049C; Mon,  8 Aug 2022 09:34:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=NO_DNS_FOR_FROM,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4B51F800E8
 for <alsa-devel@alsa-project.org>; Mon,  8 Aug 2022 09:34:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4B51F800E8
X-QQ-mid: bizesmtp73t1659944055tdl8yyno
Received: from localhost.localdomain ( [58.240.82.166])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 08 Aug 2022 15:34:09 +0800 (CST)
X-QQ-SSF: 01400000002000G0U000B00A0000000
X-QQ-FEAT: 3M0okmaRx3j9ek3mc9H7YxaHgeT7KxPegPx6HQ9LRbj12W87UcJm61TFOtxz5
 55PM7tObXUTp4SjlfvV04eZ9y9spypxUpndWt/0IefueZZ0mJ4C7nM/9/tuFTrwJopemMM0
 eTwHgigbwv2a+IKBLo2Bqd1tsH7zZXzHodpePR8jYotUyYNlBoEAg8BYlUN/ySg/GvyK3Mg
 ovg0t6fdwBwn92m7LHcGdo91CXs7gL+d08j4mUeIS+XIguX1k53lCToFurxh9lEHtfB1ubG
 RCjl2aEbMmZeVrkU8IvS+402ivj49EyCyCiVD5Kex3zECw2h5a253HnpKJIh05lPvxG3ZXt
 lriPUtl125bjRSt+PDhjsIkc9+BcgqjIht2lqzaFPgIgMzOHECKsfNlr6nj6UK/fpZDlWk7
 PQWlS1IEUV0=
X-QQ-GoodBg: 2
From: Meng Tang <tangmeng@uniontech.com>
To: perex@perex.cz,
	tiwai@suse.com,
	bo.liu@senarytech.com
Subject: [PATCH] ALSA: hda/conexant: Add quirk for LENOVO 20149 Notebook model
Date: Mon,  8 Aug 2022 15:34:06 +0800
Message-Id: <20220808073406.19460-1-tangmeng@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvr:qybglogicsvr7
Cc: Meng Tang <tangmeng@uniontech.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

There is another LENOVO 20149 (Type1Sku0) Notebook model with
CX20590, the device PCI SSID is 17aa:3977, which headphones are
not responding, that requires the quirk CXT_PINCFG_LENOVO_NOTEBOOK.
Add the corresponding entry to the quirk table.

Signed-off-by: Meng Tang <tangmeng@uniontech.com>
---
 sound/pci/hda/patch_conexant.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_conexant.c b/sound/pci/hda/patch_conexant.c
index 83ae21a01bbf..7b1a30a551f6 100644
--- a/sound/pci/hda/patch_conexant.c
+++ b/sound/pci/hda/patch_conexant.c
@@ -222,6 +222,7 @@ enum {
 	CXT_PINCFG_LEMOTE_A1205,
 	CXT_PINCFG_COMPAQ_CQ60,
 	CXT_FIXUP_STEREO_DMIC,
+	CXT_PINCFG_LENOVO_NOTEBOOK,
 	CXT_FIXUP_INC_MIC_BOOST,
 	CXT_FIXUP_HEADPHONE_MIC_PIN,
 	CXT_FIXUP_HEADPHONE_MIC,
@@ -772,6 +773,14 @@ static const struct hda_fixup cxt_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = cxt_fixup_stereo_dmic,
 	},
+	[CXT_PINCFG_LENOVO_NOTEBOOK] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x1a, 0x05d71030 },
+			{ }
+		},
+		.chain_id = CXT_FIXUP_STEREO_DMIC,
+	},
 	[CXT_FIXUP_INC_MIC_BOOST] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = cxt5066_increase_mic_boost,
@@ -971,7 +980,7 @@ static const struct snd_pci_quirk cxt5066_fixups[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3905, "Lenovo G50-30", CXT_FIXUP_STEREO_DMIC),
 	SND_PCI_QUIRK(0x17aa, 0x390b, "Lenovo G50-80", CXT_FIXUP_STEREO_DMIC),
 	SND_PCI_QUIRK(0x17aa, 0x3975, "Lenovo U300s", CXT_FIXUP_STEREO_DMIC),
-	SND_PCI_QUIRK(0x17aa, 0x3977, "Lenovo IdeaPad U310", CXT_FIXUP_STEREO_DMIC),
+	SND_PCI_QUIRK(0x17aa, 0x3977, "Lenovo IdeaPad U310", CXT_PINCFG_LENOVO_NOTEBOOK),
 	SND_PCI_QUIRK(0x17aa, 0x3978, "Lenovo G50-70", CXT_FIXUP_STEREO_DMIC),
 	SND_PCI_QUIRK(0x17aa, 0x397b, "Lenovo S205", CXT_FIXUP_STEREO_DMIC),
 	SND_PCI_QUIRK_VENDOR(0x17aa, "Thinkpad", CXT_FIXUP_THINKPAD_ACPI),
-- 
2.20.1

