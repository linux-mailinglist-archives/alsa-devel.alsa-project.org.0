Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BAD704982
	for <lists+alsa-devel@lfdr.de>; Tue, 16 May 2023 11:40:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9A5174C;
	Tue, 16 May 2023 11:39:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9A5174C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684230044;
	bh=Dq/Mv1eZ1SANWhmEV+Z5M6dOfGKezumJGsuse5jE9eQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EaVpnzZa9Vi7Kbf1ONkCGzKSZiVgcBv7paBr6jyL6bDw7nUQeaT3ALEnVWPVHyt8X
	 SAYq7WBN+CXY/cHLjFn1xMAdMgj3dhXPzG5AZIDdGU5BTD6Ps4qF5Da8OTg8Xy4Sws
	 BKiTRHdoDdmrLehHv1HFNvXU45L0rtqDlaXjZERc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66E2FF805F9; Tue, 16 May 2023 11:37:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 63940F8055A;
	Tue, 16 May 2023 11:37:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E982F805F3; Tue, 16 May 2023 11:37:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F20F1F8016D
	for <alsa-devel@alsa-project.org>; Tue, 16 May 2023 11:36:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F20F1F8016D
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 3856B2429D;
	Tue, 16 May 2023 05:36:13 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pyr6K-q1d-00; Tue, 16 May 2023 11:36:12 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 09/10] ALSA: emu10k1: add explicit support for E-MU 0404
Date: Tue, 16 May 2023 11:36:11 +0200
Message-Id: <20230516093612.3536508-10-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230516093612.3536508-1-oswald.buddenhagen@gmx.de>
References: <20230516093612.3536508-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FVSXUEOMIRXUCK7MTYWEOCXMORDEPUIL
X-Message-ID-Hash: FVSXUEOMIRXUCK7MTYWEOCXMORDEPUIL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FVSXUEOMIRXUCK7MTYWEOCXMORDEPUIL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Unlike the other models, this is actually a distinct card, rather than
an E-MU 1010 with different "dongles". It is stereo only, and supports
no ADAT (there is no trace of ADAT in the manual, switching the output
mode to ADAT has no effect, and switching the input mode to ADAT just
breaks input (presumably ... my only ADAT source is the card's output)).

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 include/sound/emu10k1.h          |   2 +
 sound/pci/emu10k1/emu10k1_main.c |  20 ++++--
 sound/pci/emu10k1/emumixer.c     | 112 ++++++++++++++++++++++++++-----
 sound/pci/emu10k1/emuproc.c      |  18 ++---
 4 files changed, 123 insertions(+), 29 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 19215cfe2671..c6f1d17a797f 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -1610,7 +1610,9 @@ struct snd_emu_chip_details {
 	unsigned int ca0108_chip:1;	/* Audigy 2 Value */
 	unsigned int ca_cardbus_chip:1;	/* Audigy 2 ZS Notebook */
 	unsigned int ca0151_chip:1;	/* P16V */
+	unsigned int spk20:1;		/* Stereo only */
 	unsigned int spk71:1;		/* Has 7.1 speakers */
+	unsigned int no_adat:1;		/* Has no ADAT, only SPDIF */
 	unsigned int sblive51:1;	/* SBLive! 5.1 - extout 0x11 -> center, 0x12 -> lfe */
 	unsigned int spdif_bug:1;	/* Has Spdif phasing bug */
 	unsigned int ac97_chip:2;	/* Has an AC97 chip: 1 = mandatory, 2 = optional */
diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_main.c
index c18ec08cf1e8..1de1a11e5697 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -854,9 +854,14 @@ static int snd_emu10k1_emu1010_init(struct snd_emu10k1 *emu)
 
 	snd_emu1010_fpga_read(emu, EMU_HANA_OPTION_CARDS, &reg);
 	dev_info(emu->card->dev, "emu1010: Card options = 0x%x\n", reg);
-	/* Optical -> ADAT I/O  */
-	emu->emu1010.optical_in = 1; /* IN_ADAT */
-	emu->emu1010.optical_out = 1; /* OUT_ADAT */
+	if (emu->card_capabilities->no_adat) {
+		emu->emu1010.optical_in = 0; /* IN_SPDIF */
+		emu->emu1010.optical_out = 0; /* OUT_SPDIF */
+	} else {
+		/* Optical -> ADAT I/O  */
+		emu->emu1010.optical_in = 1; /* IN_ADAT */
+		emu->emu1010.optical_out = 1; /* OUT_ADAT */
+	}
 	tmp = (emu->emu1010.optical_in ? EMU_HANA_OPTICAL_IN_ADAT : EMU_HANA_OPTICAL_IN_SPDIF) |
 		(emu->emu1010.optical_out ? EMU_HANA_OPTICAL_OUT_ADAT : EMU_HANA_OPTICAL_OUT_SPDIF);
 	snd_emu1010_fpga_write(emu, EMU_HANA_OPTICAL_TYPE, tmp);
@@ -1119,26 +1124,29 @@ static const struct snd_emu_chip_details emu_chip_details[] = {
 	 .id = "EMU0404",
 	 .emu10k2_chip = 1,
 	 .ca0108_chip = 1,
-	 .spk71 = 1,
+	 .spk20 = 1,
+	 .no_adat = 1,
 	 .emu_model = EMU_MODEL_EMU0404}, /* EMU 0404 new revision */
 	/* This is MAEM8850 "HanaLite" */
 	/* Supports sync daughter card. */
 	/* Tested by James@superbug.co.uk 20-3-2007. */
 	{.vendor = 0x1102, .device = 0x0004, .subsystem = 0x40021102,
 	 .driver = "Audigy2", .name = "E-MU 0404 [MAEM8850]",
 	 .id = "EMU0404",
 	 .emu10k2_chip = 1,
 	 .ca0102_chip = 1,
-	 .spk71 = 1,
+	 .spk20 = 1,
+	 .no_adat = 1,
 	 .emu_model = EMU_MODEL_EMU0404}, /* EMU 0404 */
 	/* EMU0404 PCIe */
 	/* Does NOT support sync daughter card. */
 	{.vendor = 0x1102, .device = 0x0008, .subsystem = 0x40051102,
 	 .driver = "Audigy2", .name = "E-MU 0404 PCIe [MAEM8984]",
 	 .id = "EMU0404",
 	 .emu10k2_chip = 1,
 	 .ca0108_chip = 1,
-	 .spk71 = 1,
+	 .spk20 = 1,
+	 .no_adat = 1,
 	 .emu_model = EMU_MODEL_EMU0404}, /* EMU 0404 PCIe ver_03 */
 	{.vendor = 0x1102, .device = 0x0008,
 	 .driver = "Audigy2", .name = "SB Audigy 2 Value [Unknown]",
diff --git a/sound/pci/emu10k1/emumixer.c b/sound/pci/emu10k1/emumixer.c
index 395c2b2d96dd..16970bb0012b 100644
--- a/sound/pci/emu10k1/emumixer.c
+++ b/sound/pci/emu10k1/emumixer.c
@@ -144,6 +144,8 @@ static int snd_emu10k1_spdif_get_mask(struct snd_kcontrol *kcontrol,
 	EMU_SRC_ALICE_EMU32B+0xe, \
 	EMU_SRC_ALICE_EMU32B+0xf
 
+/* 1010 rev1 */
+
 #define EMU1010_COMMON_TEXTS \
 	"Silence", \
 	PAIR_TEXTS("Dock Mic", "A", "B"), \
@@ -230,14 +232,36 @@ static const unsigned short emu1616_src_regs[] = {
 };
 static_assert(ARRAY_SIZE(emu1616_src_regs) == ARRAY_SIZE(emu1616_src_texts));
 
+/* 0404 rev1 & rev2 */
+
+#define EMU0404_COMMON_TEXTS \
+	"Silence", \
+	LR_TEXTS("ADC"), \
+	LR_TEXTS("SPDIF")
+
+static const char * const emu0404_src_texts[] = {
+	EMU0404_COMMON_TEXTS,
+	DSP_TEXTS,
+};
+
+static const unsigned short emu0404_src_regs[] = {
+	EMU_SRC_SILENCE,
+	LR_REGS(EMU_SRC_HAMOA_ADC),
+	LR_REGS(EMU_SRC_HANA_SPDIF),
+	EMU32_SRC_REGS,
+};
+static_assert(ARRAY_SIZE(emu0404_src_regs) == ARRAY_SIZE(emu0404_src_texts));
+
 /*
  * Data destinations - physical EMU outputs.
  * Each destination has an enum mixer control to choose a data source
  */
 
 #define LR_CTLS(base) LR_PS(base, " Playback Enum")
 #define ADAT_CTLS(pfx) ADAT_PS(pfx, " Playback Enum")
 
+/* 1010 rev1 */
+
 static const char * const emu1010_output_texts[] = {
 	LR_CTLS("Dock DAC1"),
 	LR_CTLS("Dock DAC2"),
@@ -347,6 +371,25 @@ static const unsigned short emu1616_output_dflt[] = {
 };
 static_assert(ARRAY_SIZE(emu1616_output_dflt) == ARRAY_SIZE(emu1616_output_dst));
 
+/* 0404 rev1 & rev2 */
+
+static const char * const snd_emu0404_output_texts[] = {
+	LR_CTLS("DAC"),
+	LR_CTLS("SPDIF"),
+};
+
+static const unsigned short emu0404_output_dst[] = {
+	LR_REGS(EMU_DST_HAMOA_DAC),
+	LR_REGS(EMU_DST_HANA_SPDIF),
+};
+static_assert(ARRAY_SIZE(emu0404_output_dst) == ARRAY_SIZE(snd_emu0404_output_texts));
+
+static const unsigned short emu0404_output_dflt[] = {
+	EMU_SRC_ALICE_EMU32A+0, EMU_SRC_ALICE_EMU32A+1,
+	EMU_SRC_ALICE_EMU32A+0, EMU_SRC_ALICE_EMU32A+1,
+};
+static_assert(ARRAY_SIZE(emu0404_output_dflt) == ARRAY_SIZE(emu0404_output_dst));
+
 /*
  * Data destinations - FPGA outputs going to Alice2 (Audigy) for
  *   capture (EMU32 + I2S links)
@@ -436,6 +479,25 @@ static const unsigned short emu1010_input_dflt[] = {
 };
 static_assert(ARRAY_SIZE(emu1010_input_dflt) == ARRAY_SIZE(emu1010_input_dst));
 
+static const unsigned short emu0404_input_dflt[] = {
+	EMU_SRC_HAMOA_ADC_LEFT1,
+	EMU_SRC_HAMOA_ADC_RIGHT1,
+	EMU_SRC_SILENCE,
+	EMU_SRC_SILENCE,
+	EMU_SRC_SILENCE,
+	EMU_SRC_SILENCE,
+	EMU_SRC_SILENCE,
+	EMU_SRC_SILENCE,
+	EMU_SRC_HANA_SPDIF_LEFT1,
+	EMU_SRC_HANA_SPDIF_RIGHT1,
+	EMU_SRC_SILENCE,
+	EMU_SRC_SILENCE,
+	EMU_SRC_SILENCE,
+	EMU_SRC_SILENCE,
+	EMU_SRC_SILENCE,
+	EMU_SRC_SILENCE,
+};
+
 struct snd_emu1010_routing_info {
 	const char * const *src_texts;
 	const char * const *out_texts;
@@ -451,6 +513,7 @@ struct snd_emu1010_routing_info {
 
 const struct snd_emu1010_routing_info emu1010_routing_info[] = {
 	{
+		/* rev1 1010 */
 		.src_regs = emu1010_src_regs,
 		.src_texts = emu1010_src_texts,
 		.n_srcs = ARRAY_SIZE(emu1010_src_texts),
@@ -494,16 +557,26 @@ const struct snd_emu1010_routing_info emu1010_routing_info[] = {
 		.in_regs = emu1010_input_dst,
 		.n_ins = ARRAY_SIZE(emu1010_input_dst) - 6,
 	},
+	{
+		/* 0404 */
+		.src_regs = emu0404_src_regs,
+		.src_texts = emu0404_src_texts,
+		.n_srcs = ARRAY_SIZE(emu0404_src_texts),
+
+		.out_dflts = emu0404_output_dflt,
+		.out_regs = emu0404_output_dst,
+		.out_texts = snd_emu0404_output_texts,
+		.n_outs = ARRAY_SIZE(emu0404_output_dflt),
+
+		.in_dflts = emu0404_input_dflt,
+		.in_regs = emu1010_input_dst,
+		.n_ins = ARRAY_SIZE(emu1010_input_dst) - 6,
+	},
 };
 
 static unsigned emu1010_idx(struct snd_emu10k1 *emu)
 {
-	if (emu->card_capabilities->emu_model == EMU_MODEL_EMU1616)
-		return 2;
-	else if (emu->card_capabilities->emu_model == EMU_MODEL_EMU1010B)
-		return 1;
-	else
-		return 0;
+	return emu->card_capabilities->emu_model - 1;
 }
 
 static void snd_emu1010_output_source_apply(struct snd_emu10k1 *emu,
@@ -780,7 +853,7 @@ struct snd_emu1010_pads_info {
 
 const struct snd_emu1010_pads_info emu1010_pads_info[] = {
 	{
-		/* all other e-mu cards for now */
+		/* rev1 1010 */
 		.adc_ctls = snd_emu1010_adc_pads,
 		.n_adc_ctls = ARRAY_SIZE(snd_emu1010_adc_pads),
 		.dac_ctls = snd_emu1010_dac_pads,
@@ -800,6 +873,13 @@ const struct snd_emu1010_pads_info emu1010_pads_info[] = {
 		.dac_ctls = snd_emu1010_dac_pads + 1,
 		.n_dac_ctls = ARRAY_SIZE(snd_emu1010_dac_pads) - 2,
 	},
+	{
+		/* 0404 */
+		.adc_ctls = NULL,
+		.n_adc_ctls = 0,
+		.dac_ctls = NULL,
+		.n_dac_ctls = 0,
+	},
 };
 
 
@@ -2270,14 +2350,16 @@ int snd_emu10k1_mixer(struct snd_emu10k1 *emu,
 		if (err < 0)
 			return err;
 
-		err = snd_ctl_add(card,
-			snd_ctl_new1(&snd_emu1010_optical_out, emu));
-		if (err < 0)
-			return err;
-		err = snd_ctl_add(card,
-			snd_ctl_new1(&snd_emu1010_optical_in, emu));
-		if (err < 0)
-			return err;
+		if (!emu->card_capabilities->no_adat) {
+			err = snd_ctl_add(card,
+				snd_ctl_new1(&snd_emu1010_optical_out, emu));
+			if (err < 0)
+				return err;
+			err = snd_ctl_add(card,
+				snd_ctl_new1(&snd_emu1010_optical_in, emu));
+			if (err < 0)
+				return err;
+		}
 
 		err = add_emu1010_source_mixers(emu);
 		if (err < 0)
diff --git a/sound/pci/emu10k1/emuproc.c b/sound/pci/emu10k1/emuproc.c
index c92253de881e..708aff6cf09a 100644
--- a/sound/pci/emu10k1/emuproc.c
+++ b/sound/pci/emu10k1/emuproc.c
@@ -229,14 +229,16 @@ static void snd_emu10k1_proc_spdif_read(struct snd_info_entry *entry,
 	u32 rate;
 
 	if (emu->card_capabilities->emu_model) {
-		snd_emu1010_fpga_read(emu, 0x38, &value);
-		if ((value & 0x1) == 0) {
-			snd_emu1010_fpga_read(emu, 0x2a, &value);
-			snd_emu1010_fpga_read(emu, 0x2b, &value2);
-			rate = 0x1770000 / (((value << 5) | value2)+1);	
-			snd_iprintf(buffer, "ADAT Locked : %u\n", rate);
-		} else {
-			snd_iprintf(buffer, "ADAT Unlocked\n");
+		if (!emu->card_capabilities->no_adat) {
+			snd_emu1010_fpga_read(emu, 0x38, &value);
+			if ((value & 0x1) == 0) {
+				snd_emu1010_fpga_read(emu, 0x2a, &value);
+				snd_emu1010_fpga_read(emu, 0x2b, &value2);
+				rate = 0x1770000 / (((value << 5) | value2)+1);
+				snd_iprintf(buffer, "ADAT Locked : %u\n", rate);
+			} else {
+				snd_iprintf(buffer, "ADAT Unlocked\n");
+			}
 		}
 		snd_emu1010_fpga_read(emu, 0x20, &value);
 		if ((value & 0x4) == 0) {
-- 
2.40.0.152.g15d061e6df

