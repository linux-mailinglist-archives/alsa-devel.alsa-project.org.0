Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9F670497C
	for <lists+alsa-devel@lfdr.de>; Tue, 16 May 2023 11:39:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BF981E2;
	Tue, 16 May 2023 11:38:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BF981E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684229988;
	bh=fH1mkF/cp5z7piX8HluxNx4CP7r1XmPdr2Cip6yaO+k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vM/WLiQrO2lyxtlV/BYNVits4HBEVLZk+tqpZ2CVEopc+PtnzvU3zVLN5doF8O2mi
	 GMJ3Q3S+w0d66mTxneFfOJ3fansEz6ap5QOOJ1qVI0zbL/cBcsnHG3I39KU2C97d/d
	 l+t/NpRuwDCU/Zg7lfJTTL/3SlWatBtqG8U8Wf0s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0B3DF805E4; Tue, 16 May 2023 11:36:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 900F1F80272;
	Tue, 16 May 2023 11:36:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 731F1F805D3; Tue, 16 May 2023 11:36:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 673DFF80552
	for <alsa-devel@alsa-project.org>; Tue, 16 May 2023 11:36:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 673DFF80552
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 167D224295;
	Tue, 16 May 2023 05:36:13 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pyr6K-q0x-00; Tue, 16 May 2023 11:36:12 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 02/10] ALSA: emu10k1: compactize E-MU routing source arrays
Date: Tue, 16 May 2023 11:36:04 +0200
Message-Id: <20230516093612.3536508-3-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230516093612.3536508-1-oswald.buddenhagen@gmx.de>
References: <20230516093612.3536508-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BBLCLDJLLYQRP3LKNYQSQOLNJFSHL6DP
X-Message-ID-Hash: BBLCLDJLLYQRP3LKNYQSQOLNJFSHL6DP
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BBLCLDJLLYQRP3LKNYQSQOLNJFSHL6DP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use macros to avoid duplication. Arguably, this is somewhat less
legible, but future additions would grow this part of the file to
completely unmanageable dimensions.
The EMU*_COMMON_TEXTS macros will save duplication in a future commit;
I pulled them ahead to reduce churn.

While rewriting the tables anyway, rearrange them such that each card's
strings and registers are adjacent.

Also, add some static asserts to verify that the array sizes match.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emumixer.c | 317 ++++++++++++-----------------------
 1 file changed, 104 insertions(+), 213 deletions(-)

diff --git a/sound/pci/emu10k1/emumixer.c b/sound/pci/emu10k1/emumixer.c
index 92bada196f54..e2f70e8911f4 100644
--- a/sound/pci/emu10k1/emumixer.c
+++ b/sound/pci/emu10k1/emumixer.c
@@ -62,232 +62,123 @@ static int snd_emu10k1_spdif_get_mask(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
-/*
- * Items labels in enum mixer controls assigning source data to
- * each destination
- */
-static const char * const emu1010_src_texts[] = {
-	"Silence",
-	"Dock Mic A",
-	"Dock Mic B",
-	"Dock ADC1 Left",
-	"Dock ADC1 Right",
-	"Dock ADC2 Left",
-	"Dock ADC2 Right",
-	"Dock ADC3 Left",
-	"Dock ADC3 Right",
-	"0202 ADC Left",
-	"0202 ADC Right",
-	"1010 SPDIF Left",
-	"1010 SPDIF Right",
-	"1010 ADAT 0",
-	"1010 ADAT 1",
-	"1010 ADAT 2",
-	"1010 ADAT 3",
-	"1010 ADAT 4",
-	"1010 ADAT 5",
-	"1010 ADAT 6",
-	"1010 ADAT 7",
-	"DSP 0",
-	"DSP 1",
-	"DSP 2",
-	"DSP 3",
-	"DSP 4",
-	"DSP 5",
-	"DSP 6",
-	"DSP 7",
-	"DSP 8",
-	"DSP 9",
-	"DSP 10",
-	"DSP 11",
-	"DSP 12",
-	"DSP 13",
-	"DSP 14",
-	"DSP 15",
-	"DSP 16",
-	"DSP 17",
-	"DSP 18",
-	"DSP 19",
-	"DSP 20",
-	"DSP 21",
-	"DSP 22",
-	"DSP 23",
-	"DSP 24",
-	"DSP 25",
-	"DSP 26",
-	"DSP 27",
-	"DSP 28",
-	"DSP 29",
-	"DSP 30",
-	"DSP 31",
-};
+#define PAIR_PS(base, one, two, sfx) base " " one sfx, base " " two sfx
+#define LR_PS(base, sfx) PAIR_PS(base, "Left", "Right", sfx)
 
-/* 1616(m) cardbus */
+#define ADAT_PS(pfx, sfx) \
+	pfx "ADAT 0" sfx, pfx "ADAT 1" sfx, pfx "ADAT 2" sfx, pfx "ADAT 3" sfx, \
+	pfx "ADAT 4" sfx, pfx "ADAT 5" sfx, pfx "ADAT 6" sfx, pfx "ADAT 7" sfx
 
-static const char * const emu1616_src_texts[] = {
-	"Silence",
-	"Mic A",
-	"Mic B",
-	"ADC1 Left",
-	"ADC1 Right",
-	"ADC2 Left",
-	"ADC2 Right",
-	"SPDIF Left",
-	"SPDIF Right",
-	"ADAT 0",
-	"ADAT 1",
-	"ADAT 2",
-	"ADAT 3",
-	"ADAT 4",
-	"ADAT 5",
-	"ADAT 6",
-	"ADAT 7",
-	"DSP 0",
-	"DSP 1",
-	"DSP 2",
-	"DSP 3",
-	"DSP 4",
-	"DSP 5",
-	"DSP 6",
-	"DSP 7",
-	"DSP 8",
-	"DSP 9",
-	"DSP 10",
-	"DSP 11",
-	"DSP 12",
-	"DSP 13",
-	"DSP 14",
-	"DSP 15",
-	"DSP 16",
-	"DSP 17",
-	"DSP 18",
-	"DSP 19",
-	"DSP 20",
-	"DSP 21",
-	"DSP 22",
-	"DSP 23",
-	"DSP 24",
-	"DSP 25",
-	"DSP 26",
-	"DSP 27",
-	"DSP 28",
-	"DSP 29",
-	"DSP 30",
-	"DSP 31",
-};
+#define PAIR_REGS(base, one, two) \
+	base ## one ## 1, \
+	base ## two ## 1
 
+#define LR_REGS(base) PAIR_REGS(base, _LEFT, _RIGHT)
+
+#define ADAT_REGS(base) \
+	base+0, base+1, base+2, base+3, base+4, base+5, base+6, base+7
 
 /*
  * List of data sources available for each destination
  */
-static const unsigned short emu1010_src_regs[] = {
-	EMU_SRC_SILENCE,/* 0 */
-	EMU_SRC_DOCK_MIC_A1, /* 1 */
-	EMU_SRC_DOCK_MIC_B1, /* 2 */
-	EMU_SRC_DOCK_ADC1_LEFT1, /* 3 */
-	EMU_SRC_DOCK_ADC1_RIGHT1, /* 4 */
-	EMU_SRC_DOCK_ADC2_LEFT1, /* 5 */
-	EMU_SRC_DOCK_ADC2_RIGHT1, /* 6 */
-	EMU_SRC_DOCK_ADC3_LEFT1, /* 7 */
-	EMU_SRC_DOCK_ADC3_RIGHT1, /* 8 */
-	EMU_SRC_HAMOA_ADC_LEFT1, /* 9 */
-	EMU_SRC_HAMOA_ADC_RIGHT1, /* 10 */
-	EMU_SRC_HANA_SPDIF_LEFT1, /* 11 */
-	EMU_SRC_HANA_SPDIF_RIGHT1, /* 12 */
-	EMU_SRC_HANA_ADAT, /* 13 */
-	EMU_SRC_HANA_ADAT+1, /* 14 */
-	EMU_SRC_HANA_ADAT+2, /* 15 */
-	EMU_SRC_HANA_ADAT+3, /* 16 */
-	EMU_SRC_HANA_ADAT+4, /* 17 */
-	EMU_SRC_HANA_ADAT+5, /* 18 */
-	EMU_SRC_HANA_ADAT+6, /* 19 */
-	EMU_SRC_HANA_ADAT+7, /* 20 */
-	EMU_SRC_ALICE_EMU32A, /* 21 */
-	EMU_SRC_ALICE_EMU32A+1, /* 22 */
-	EMU_SRC_ALICE_EMU32A+2, /* 23 */
-	EMU_SRC_ALICE_EMU32A+3, /* 24 */
-	EMU_SRC_ALICE_EMU32A+4, /* 25 */
-	EMU_SRC_ALICE_EMU32A+5, /* 26 */
-	EMU_SRC_ALICE_EMU32A+6, /* 27 */
-	EMU_SRC_ALICE_EMU32A+7, /* 28 */
-	EMU_SRC_ALICE_EMU32A+8, /* 29 */
-	EMU_SRC_ALICE_EMU32A+9, /* 30 */
-	EMU_SRC_ALICE_EMU32A+0xa, /* 31 */
-	EMU_SRC_ALICE_EMU32A+0xb, /* 32 */
-	EMU_SRC_ALICE_EMU32A+0xc, /* 33 */
-	EMU_SRC_ALICE_EMU32A+0xd, /* 34 */
-	EMU_SRC_ALICE_EMU32A+0xe, /* 35 */
-	EMU_SRC_ALICE_EMU32A+0xf, /* 36 */
-	EMU_SRC_ALICE_EMU32B, /* 37 */
-	EMU_SRC_ALICE_EMU32B+1, /* 38 */
-	EMU_SRC_ALICE_EMU32B+2, /* 39 */
-	EMU_SRC_ALICE_EMU32B+3, /* 40 */
-	EMU_SRC_ALICE_EMU32B+4, /* 41 */
-	EMU_SRC_ALICE_EMU32B+5, /* 42 */
-	EMU_SRC_ALICE_EMU32B+6, /* 43 */
-	EMU_SRC_ALICE_EMU32B+7, /* 44 */
-	EMU_SRC_ALICE_EMU32B+8, /* 45 */
-	EMU_SRC_ALICE_EMU32B+9, /* 46 */
-	EMU_SRC_ALICE_EMU32B+0xa, /* 47 */
-	EMU_SRC_ALICE_EMU32B+0xb, /* 48 */
-	EMU_SRC_ALICE_EMU32B+0xc, /* 49 */
-	EMU_SRC_ALICE_EMU32B+0xd, /* 50 */
-	EMU_SRC_ALICE_EMU32B+0xe, /* 51 */
-	EMU_SRC_ALICE_EMU32B+0xf, /* 52 */
+
+#define DSP_TEXTS \
+	"DSP 0", "DSP 1", "DSP 2", "DSP 3", "DSP 4", "DSP 5", "DSP 6", "DSP 7", \
+	"DSP 8", "DSP 9", "DSP 10", "DSP 11", "DSP 12", "DSP 13", "DSP 14", "DSP 15", \
+	"DSP 16", "DSP 17", "DSP 18", "DSP 19", "DSP 20", "DSP 21", "DSP 22", "DSP 23", \
+	"DSP 24", "DSP 25", "DSP 26", "DSP 27", "DSP 28", "DSP 29", "DSP 30", "DSP 31"
+
+#define PAIR_TEXTS(base, one, two) PAIR_PS(base, one, two, "")
+#define LR_TEXTS(base) LR_PS(base, "")
+#define ADAT_TEXTS(pfx) ADAT_PS(pfx, "")
+
+#define EMU32_SRC_REGS \
+	EMU_SRC_ALICE_EMU32A, \
+	EMU_SRC_ALICE_EMU32A+1, \
+	EMU_SRC_ALICE_EMU32A+2, \
+	EMU_SRC_ALICE_EMU32A+3, \
+	EMU_SRC_ALICE_EMU32A+4, \
+	EMU_SRC_ALICE_EMU32A+5, \
+	EMU_SRC_ALICE_EMU32A+6, \
+	EMU_SRC_ALICE_EMU32A+7, \
+	EMU_SRC_ALICE_EMU32A+8, \
+	EMU_SRC_ALICE_EMU32A+9, \
+	EMU_SRC_ALICE_EMU32A+0xa, \
+	EMU_SRC_ALICE_EMU32A+0xb, \
+	EMU_SRC_ALICE_EMU32A+0xc, \
+	EMU_SRC_ALICE_EMU32A+0xd, \
+	EMU_SRC_ALICE_EMU32A+0xe, \
+	EMU_SRC_ALICE_EMU32A+0xf, \
+	EMU_SRC_ALICE_EMU32B, \
+	EMU_SRC_ALICE_EMU32B+1, \
+	EMU_SRC_ALICE_EMU32B+2, \
+	EMU_SRC_ALICE_EMU32B+3, \
+	EMU_SRC_ALICE_EMU32B+4, \
+	EMU_SRC_ALICE_EMU32B+5, \
+	EMU_SRC_ALICE_EMU32B+6, \
+	EMU_SRC_ALICE_EMU32B+7, \
+	EMU_SRC_ALICE_EMU32B+8, \
+	EMU_SRC_ALICE_EMU32B+9, \
+	EMU_SRC_ALICE_EMU32B+0xa, \
+	EMU_SRC_ALICE_EMU32B+0xb, \
+	EMU_SRC_ALICE_EMU32B+0xc, \
+	EMU_SRC_ALICE_EMU32B+0xd, \
+	EMU_SRC_ALICE_EMU32B+0xe, \
+	EMU_SRC_ALICE_EMU32B+0xf
+
+#define EMU1010_COMMON_TEXTS \
+	"Silence", \
+	PAIR_TEXTS("Dock Mic", "A", "B"), \
+	LR_TEXTS("Dock ADC1"), \
+	LR_TEXTS("Dock ADC2"), \
+	LR_TEXTS("Dock ADC3"), \
+	LR_TEXTS("0202 ADC"), \
+	LR_TEXTS("1010 SPDIF"), \
+	ADAT_TEXTS("1010 ")
+
+static const char * const emu1010_src_texts[] = {
+	EMU1010_COMMON_TEXTS,
+	DSP_TEXTS,
 };
 
+static const unsigned short emu1010_src_regs[] = {
+	EMU_SRC_SILENCE,
+	PAIR_REGS(EMU_SRC_DOCK_MIC, _A, _B),
+	LR_REGS(EMU_SRC_DOCK_ADC1),
+	LR_REGS(EMU_SRC_DOCK_ADC2),
+	LR_REGS(EMU_SRC_DOCK_ADC3),
+	LR_REGS(EMU_SRC_HAMOA_ADC),
+	LR_REGS(EMU_SRC_HANA_SPDIF),
+	ADAT_REGS(EMU_SRC_HANA_ADAT),
+	EMU32_SRC_REGS,
+};
+static_assert(ARRAY_SIZE(emu1010_src_regs) == ARRAY_SIZE(emu1010_src_texts));
+
 /* 1616(m) cardbus */
+
+#define EMU1616_COMMON_TEXTS \
+	"Silence", \
+	PAIR_TEXTS("Mic", "A", "B"), \
+	LR_TEXTS("ADC1"), \
+	LR_TEXTS("ADC2"), \
+	LR_TEXTS("SPDIF"), \
+	ADAT_TEXTS("")
+
+static const char * const emu1616_src_texts[] = {
+	EMU1616_COMMON_TEXTS,
+	DSP_TEXTS,
+};
+
 static const unsigned short emu1616_src_regs[] = {
 	EMU_SRC_SILENCE,
-	EMU_SRC_DOCK_MIC_A1,
-	EMU_SRC_DOCK_MIC_B1,
-	EMU_SRC_DOCK_ADC1_LEFT1,
-	EMU_SRC_DOCK_ADC1_RIGHT1,
-	EMU_SRC_DOCK_ADC2_LEFT1,
-	EMU_SRC_DOCK_ADC2_RIGHT1,
-	EMU_SRC_MDOCK_SPDIF_LEFT1,
-	EMU_SRC_MDOCK_SPDIF_RIGHT1,
-	EMU_SRC_MDOCK_ADAT,
-	EMU_SRC_MDOCK_ADAT+1,
-	EMU_SRC_MDOCK_ADAT+2,
-	EMU_SRC_MDOCK_ADAT+3,
-	EMU_SRC_MDOCK_ADAT+4,
-	EMU_SRC_MDOCK_ADAT+5,
-	EMU_SRC_MDOCK_ADAT+6,
-	EMU_SRC_MDOCK_ADAT+7,
-	EMU_SRC_ALICE_EMU32A,
-	EMU_SRC_ALICE_EMU32A+1,
-	EMU_SRC_ALICE_EMU32A+2,
-	EMU_SRC_ALICE_EMU32A+3,
-	EMU_SRC_ALICE_EMU32A+4,
-	EMU_SRC_ALICE_EMU32A+5,
-	EMU_SRC_ALICE_EMU32A+6,
-	EMU_SRC_ALICE_EMU32A+7,
-	EMU_SRC_ALICE_EMU32A+8,
-	EMU_SRC_ALICE_EMU32A+9,
-	EMU_SRC_ALICE_EMU32A+0xa,
-	EMU_SRC_ALICE_EMU32A+0xb,
-	EMU_SRC_ALICE_EMU32A+0xc,
-	EMU_SRC_ALICE_EMU32A+0xd,
-	EMU_SRC_ALICE_EMU32A+0xe,
-	EMU_SRC_ALICE_EMU32A+0xf,
-	EMU_SRC_ALICE_EMU32B,
-	EMU_SRC_ALICE_EMU32B+1,
-	EMU_SRC_ALICE_EMU32B+2,
-	EMU_SRC_ALICE_EMU32B+3,
-	EMU_SRC_ALICE_EMU32B+4,
-	EMU_SRC_ALICE_EMU32B+5,
-	EMU_SRC_ALICE_EMU32B+6,
-	EMU_SRC_ALICE_EMU32B+7,
-	EMU_SRC_ALICE_EMU32B+8,
-	EMU_SRC_ALICE_EMU32B+9,
-	EMU_SRC_ALICE_EMU32B+0xa,
-	EMU_SRC_ALICE_EMU32B+0xb,
-	EMU_SRC_ALICE_EMU32B+0xc,
-	EMU_SRC_ALICE_EMU32B+0xd,
-	EMU_SRC_ALICE_EMU32B+0xe,
-	EMU_SRC_ALICE_EMU32B+0xf,
+	PAIR_REGS(EMU_SRC_DOCK_MIC, _A, _B),
+	LR_REGS(EMU_SRC_DOCK_ADC1),
+	LR_REGS(EMU_SRC_DOCK_ADC2),
+	LR_REGS(EMU_SRC_MDOCK_SPDIF),
+	ADAT_REGS(EMU_SRC_MDOCK_ADAT),
+	EMU32_SRC_REGS,
 };
+static_assert(ARRAY_SIZE(emu1616_src_regs) == ARRAY_SIZE(emu1616_src_texts));
 
 /*
  * Data destinations - physical EMU outputs.
-- 
2.40.0.152.g15d061e6df

