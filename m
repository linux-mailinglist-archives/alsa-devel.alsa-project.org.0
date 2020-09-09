Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8280A2624B8
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Sep 2020 04:03:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98EC6171C;
	Wed,  9 Sep 2020 04:02:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98EC6171C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599617003;
	bh=YFtJAILOKQ218J1vypQsXxauO96OlwqcXC9fFqt64i8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=L3kz+hXeVS57WzJGCx46IdMa5GmApKS87p4YtJUMHmssKXZwMlvTEOVKnfpGJqBRy
	 t1fmTQ0BsY3MOu5ILkhrLwOKhBq447EySUmUjsxPFKf03vcXNciSnro4Ho+/OqW7r9
	 eWpwIxMTewtJqiLVkcEzcMS5bnMBOlX9WRT1JtMg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BEDC2F80240;
	Wed,  9 Sep 2020 04:01:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7F3FF80227; Wed,  9 Sep 2020 04:01:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDF6AF800FD
 for <alsa-devel@alsa-project.org>; Wed,  9 Sep 2020 04:01:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDF6AF800FD
Received: from [123.114.44.221] (helo=localhost.localdomain)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1kFpQR-0001uy-88; Wed, 09 Sep 2020 02:01:32 +0000
From: Hui Wang <hui.wang@canonical.com>
To: tiwai@suse.de,
	alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/realtek - The Mic on a RedmiBook doesn't work
Date: Wed,  9 Sep 2020 10:00:41 +0800
Message-Id: <20200909020041.8967-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kailang@realtek.com, stable@vger.kernel.org
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

The Mic connects to the Nid 0x19, but the configuration of Nid 0x19
is not defined to Mic, and also need to set the coeff to enable the
auto detection on the Nid 0x19. After this change, the Mic plugging
in or plugging out could be detected and could record the sound from
the Mic.

And the coeff value is suggested by Kailang of Realtek.

Cc: Kailang Yang <kailang@realtek.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index abfc602c3b92..85e207173f5d 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6228,6 +6228,7 @@ enum {
 	ALC269_FIXUP_LEMOTE_A1802,
 	ALC269_FIXUP_LEMOTE_A190X,
 	ALC256_FIXUP_INTEL_NUC8_RUGGED,
+	ALC255_FIXUP_XIAOMI_HEADSET_MIC,
 };
 
 static const struct hda_fixup alc269_fixups[] = {
@@ -7591,6 +7592,16 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC269_FIXUP_HEADSET_MODE
 	},
+	[ALC255_FIXUP_XIAOMI_HEADSET_MIC] = {
+		.type = HDA_FIXUP_VERBS,
+		.v.verbs = (const struct hda_verb[]) {
+			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x45 },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0x5089 },
+			{ }
+		},
+		.chained = true,
+		.chain_id = ALC289_FIXUP_ASUS_GA401
+	},
 };
 
 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -7888,6 +7899,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1b35, 0x1236, "CZC TMI", ALC269_FIXUP_CZC_TMI),
 	SND_PCI_QUIRK(0x1b35, 0x1237, "CZC L101", ALC269_FIXUP_CZC_L101),
 	SND_PCI_QUIRK(0x1b7d, 0xa831, "Ordissimo EVE2 ", ALC269VB_FIXUP_ORDISSIMO_EVE2), /* Also known as Malata PC-B1303 */
+	SND_PCI_QUIRK(0x1d72, 0x1602, "RedmiBook", ALC255_FIXUP_XIAOMI_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1d72, 0x1901, "RedmiBook 14", ALC256_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x10ec, 0x118c, "Medion EE4254 MD62100", ALC256_FIXUP_MEDION_HEADSET_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1c06, 0x2013, "Lemote A1802", ALC269_FIXUP_LEMOTE_A1802),
@@ -8065,6 +8077,7 @@ static const struct hda_model_fixup alc269_fixup_models[] = {
 	{.id = ALC298_FIXUP_HUAWEI_MBX_STEREO, .name = "huawei-mbx-stereo"},
 	{.id = ALC256_FIXUP_MEDION_HEADSET_NO_PRESENCE, .name = "alc256-medion-headset"},
 	{.id = ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET, .name = "alc298-samsung-headphone"},
+	{.id = ALC255_FIXUP_XIAOMI_HEADSET_MIC, .name = "alc255-xiaomi-headset"},
 	{}
 };
 #define ALC225_STANDARD_PINS \
-- 
2.25.1

