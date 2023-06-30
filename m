Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD0C743DD5
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jun 2023 16:47:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6524E7F8;
	Fri, 30 Jun 2023 16:47:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6524E7F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688136470;
	bh=dlbRMB1gF9g9SaK2gpIqreRNE9vNQNbSPC3PMRVZqWc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KK8PWbsBP28ntdPtQ7DTSFzG6BGJqHyqJ0nlZ/vsy9RpsQZm2BxHs4bcr/rxKY4JD
	 5mw5AmdrTeM7KxNyF8eS4cJDn1SbSRx+1kgFJjZtvkPGKwq+MPAffA+OYsyLxIfxsS
	 p9GyjBIutxl+eeSrmW5SAZx2EFjdvUWIv9tMQKg8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8DE07F80567; Fri, 30 Jun 2023 16:46:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0112AF80553;
	Fri, 30 Jun 2023 16:46:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D4C0F80544; Fri, 30 Jun 2023 16:46:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C7236F80212
	for <alsa-devel@alsa-project.org>; Fri, 30 Jun 2023 16:45:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7236F80212
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id E771D242EF;
	Fri, 30 Jun 2023 10:45:43 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1qFFNX-mnj-00; Fri, 30 Jun 2023 16:45:43 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH v2 7/8] ALSA: emu10k1: add high-rate capture in E-MU D.A.S.
 mode
Date: Fri, 30 Jun 2023 16:45:41 +0200
Message-Id: <20230630144542.664190-8-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230630144542.664190-1-oswald.buddenhagen@gmx.de>
References: <20230630144542.664190-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JZOWM7DTIQAUEZHY5XEYBHQGKXXLHISY
X-Message-ID-Hash: JZOWM7DTIQAUEZHY5XEYBHQGKXXLHISY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JZOWM7DTIQAUEZHY5XEYBHQGKXXLHISY/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This is tested only with a 0404b card, so it is unclear whether the
EMU_DST_TINA_EMU32B (1010b) & EMU_DST_TINA2_EMU32B (1616m CardBus)
register definitions (derived from comments in the same file) are
correct, and whether they actually lack the one-sample delay
relative to EMU_DST_ALICE2_EMU32_0.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 include/sound/emu10k1.h          |   4 ++
 sound/pci/emu10k1/emu10k1_main.c |   3 +
 sound/pci/emu10k1/emufx.c        |   4 +-
 sound/pci/emu10k1/emumixer.c     | 107 +++++++++++++++++++++++++++----
 sound/pci/emu10k1/emupcm.c       |  40 +++++++++---
 5 files changed, 135 insertions(+), 23 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 1f827290977f..443710e31021 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -1286,6 +1286,9 @@ SUB_REG_NC(A_EHC, A_I2S_CAPTURE_RATE, 0x00000e00)  /* This sets the capture PCM
 #define EMU_DST_HAMOA_DAC_RIGHT4	0x0307	/* Hamoa DAC Right, 4th or 192kHz */
 // In S/MUX mode, the samples of one channel are adjacent.
 #define EMU_DST_HANA_ADAT	0x0400	/* Hana ADAT 8 channel out +0 to +7 */
+/* FIXME: It is not clear whether these are actually enumerated like that. */
+#define EMU_DST_TINA2_EMU32B	0x0400	/* 16 EMU32 channels to Tina2 +0 to +0xf */
+#define EMU_DST_TINA_EMU32B	0x0500	/* 16 EMU32 channels to Tina +0 to +0xf */
 #define EMU_DST_ALICE_I2S0_LEFT		0x0500	/* Alice2 I2S0 Left */
 #define EMU_DST_ALICE_I2S0_RIGHT	0x0501	/* Alice2 I2S0 Right */
 #define EMU_DST_ALICE_I2S1_LEFT		0x0600	/* Alice2 I2S1 Left */
@@ -1648,6 +1651,7 @@ struct snd_emu_chip_details {
 	unsigned int ca0108_chip:1;	/* Audigy 2 Value */
 	unsigned int ca_cardbus_chip:1;	/* Audigy 2 ZS Notebook */
 	unsigned int ca0151_chip:1;	/* P16V */
+	unsigned int emu_in_32:1;	/* EMU32 input has 32 (connected) channels */
 	unsigned int spk20:1;		/* Stereo only */
 	unsigned int spk71:1;		/* Has 7.1 speakers */
 	unsigned int no_adat:1;		/* Has no ADAT, only SPDIF */
diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_main.c
index 13e9200b8fcb..78f71df96312 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -1093,6 +1093,7 @@ static const struct snd_emu_chip_details emu_chip_details[] = {
 	 .emu10k2_chip = 1,
 	 .ca0108_chip = 1,
 	 .ca_cardbus_chip = 1,
+	 .emu_in_32 = 1,
 	 .spk71 = 1 ,
 	 .emu_model = EMU_MODEL_EMU1616},
 	/* Tested by James@superbug.co.uk 4th Nov 2007. */
@@ -1105,6 +1106,7 @@ static const struct snd_emu_chip_details emu_chip_details[] = {
 	 .id = "EMU1010",
 	 .emu10k2_chip = 1,
 	 .ca0108_chip = 1,
+	 .emu_in_32 = 1,
 	 .spk71 = 1,
 	 .emu_model = EMU_MODEL_EMU1010B}, /* EMU 1010 new revision */
 	/* Tested by Maxim Kachur <mcdebugger@duganet.ru> 17th Oct 2012. */
@@ -1119,6 +1121,7 @@ static const struct snd_emu_chip_details emu_chip_details[] = {
 	 .id = "EMU1010",
 	 .emu10k2_chip = 1,
 	 .ca0108_chip = 1,
+	 .emu_in_32 = 1,
 	 .spk71 = 1,
 	 .emu_model = EMU_MODEL_EMU1010B}, /* EMU 1010 PCIe */
 	/* Tested by James@superbug.co.uk 8th July 2005. */
diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
index 103cb35b39e0..62fcc1d27848 100644
--- a/sound/pci/emu10k1/emufx.c
+++ b/sound/pci/emu10k1/emufx.c
@@ -1325,17 +1325,19 @@ static int _snd_emu10k1_das_init_efx(struct snd_emu10k1 *emu)
 	gpr_map[lowword_mask] = 0x0000ffff;
 
 	if (emu->card_capabilities->ca0108_chip) {
+		int num_cap = emu->card_capabilities->emu_in_32 ? 32 : 16;
+
 		for (int z = 0; z < 16; z++) {
 			A_OP(icode, &ptr, iMAC0, A_GPR(tmp), A_C_00000000, A_FXBUS(z * 2), A_C_00010000); // >> 15
 			A_OP(icode, &ptr, iMACINT0, A_GPR(tmp + 1), A_C_00000000, A_FXBUS(z * 2 + 1), A_C_00000002); // << 1
 			A_OP(icode, &ptr, iANDXOR, A3_EMU32OUT(z), A_GPR(tmp), A_GPR(lowword_mask), A_GPR(tmp + 1));
 		}
 
 		snd_emu10k1_audigy_dsp_convert_32_to_2x16(
 			icode, &ptr, tmp, bit_shifter16, A3_EMU32IN(0), A_EXTOUT(0));
 		// A3_EMU32IN(0) is delayed by one sample, so all other A3_EMU32IN channels
 		// need to be delayed as well; we use an auxiliary register for that.
-		for (int z = 1; z < 16; z++) {
+		for (int z = 1; z < num_cap; z++) {
 			snd_emu10k1_audigy_dsp_convert_32_to_2x16(
 				icode, &ptr, tmp, bit_shifter16, A_GPR(gpr), A_EXTOUT(z * 2));
 			A_OP(icode, &ptr, iACC3, A_GPR(gpr), A3_EMU32IN(z), A_C_00000000, A_C_00000000);
diff --git a/sound/pci/emu10k1/emumixer.c b/sound/pci/emu10k1/emumixer.c
index 844ccf3b025c..387a0ad895c3 100644
--- a/sound/pci/emu10k1/emumixer.c
+++ b/sound/pci/emu10k1/emumixer.c
@@ -882,6 +882,90 @@ static const unsigned short emu1010_input_dflt[] = {
 };
 static_assert(ARRAY_SIZE(emu1010_input_dflt) == ARRAY_SIZE(emu1010_input_dst));
 
+static const unsigned short emu1010_2x_input_dst[][2] = {
+	{ EMU_DST_ALICE2_EMU32_0, EMU_DST_ALICE2_EMU32_8 },
+	{ EMU_DST_ALICE2_EMU32_1, EMU_DST_ALICE2_EMU32_9 },
+	{ EMU_DST_ALICE2_EMU32_2, EMU_DST_ALICE2_EMU32_A },
+	{ EMU_DST_ALICE2_EMU32_3, EMU_DST_ALICE2_EMU32_B },
+	{ EMU_DST_ALICE2_EMU32_4, EMU_DST_ALICE2_EMU32_C },
+	{ EMU_DST_ALICE2_EMU32_5, EMU_DST_ALICE2_EMU32_D },
+	{ EMU_DST_ALICE2_EMU32_6, EMU_DST_ALICE2_EMU32_E },
+	{ EMU_DST_ALICE2_EMU32_7, EMU_DST_ALICE2_EMU32_F },
+};
+static_assert(ARRAY_SIZE(emu1010_2x_input_dst) <= NUM_INPUT_DESTS);
+
+static const unsigned short emu1010_4x_input_dst[][4] = {
+	{ EMU_DST_ALICE2_EMU32_0, EMU_DST_ALICE2_EMU32_4, EMU_DST_ALICE2_EMU32_8, EMU_DST_ALICE2_EMU32_C },
+	{ EMU_DST_ALICE2_EMU32_1, EMU_DST_ALICE2_EMU32_5, EMU_DST_ALICE2_EMU32_9, EMU_DST_ALICE2_EMU32_D },
+	{ EMU_DST_ALICE2_EMU32_2, EMU_DST_ALICE2_EMU32_6, EMU_DST_ALICE2_EMU32_A, EMU_DST_ALICE2_EMU32_E },
+	{ EMU_DST_ALICE2_EMU32_3, EMU_DST_ALICE2_EMU32_7, EMU_DST_ALICE2_EMU32_B, EMU_DST_ALICE2_EMU32_F },
+};
+static_assert(ARRAY_SIZE(emu1010_4x_input_dst) <= NUM_INPUT_DESTS);
+
+static const unsigned short emu1010b_2x_input_dst[][2] = {
+	{ EMU_DST_ALICE2_EMU32_0, EMU_DST_TINA_EMU32B+0x0 },
+	{ EMU_DST_ALICE2_EMU32_1, EMU_DST_TINA_EMU32B+0x1 },
+	{ EMU_DST_ALICE2_EMU32_2, EMU_DST_TINA_EMU32B+0x2 },
+	{ EMU_DST_ALICE2_EMU32_3, EMU_DST_TINA_EMU32B+0x3 },
+	{ EMU_DST_ALICE2_EMU32_4, EMU_DST_TINA_EMU32B+0x4 },
+	{ EMU_DST_ALICE2_EMU32_5, EMU_DST_TINA_EMU32B+0x5 },
+	{ EMU_DST_ALICE2_EMU32_6, EMU_DST_TINA_EMU32B+0x6 },
+	{ EMU_DST_ALICE2_EMU32_7, EMU_DST_TINA_EMU32B+0x7 },
+	{ EMU_DST_ALICE2_EMU32_8, EMU_DST_TINA_EMU32B+0x8 },
+	{ EMU_DST_ALICE2_EMU32_9, EMU_DST_TINA_EMU32B+0x9 },
+	{ EMU_DST_ALICE2_EMU32_A, EMU_DST_TINA_EMU32B+0xa },
+	{ EMU_DST_ALICE2_EMU32_B, EMU_DST_TINA_EMU32B+0xb },
+	{ EMU_DST_ALICE2_EMU32_C, EMU_DST_TINA_EMU32B+0xc },
+	{ EMU_DST_ALICE2_EMU32_D, EMU_DST_TINA_EMU32B+0xd },
+	{ EMU_DST_ALICE2_EMU32_E, EMU_DST_TINA_EMU32B+0xe },
+	{ EMU_DST_ALICE2_EMU32_F, EMU_DST_TINA_EMU32B+0xf },
+};
+static_assert(ARRAY_SIZE(emu1010b_2x_input_dst) <= NUM_INPUT_DESTS);
+
+static const unsigned short emu1010b_4x_input_dst[][4] = {
+	{ EMU_DST_ALICE2_EMU32_0, EMU_DST_ALICE2_EMU32_8, EMU_DST_TINA_EMU32B+0x0, EMU_DST_TINA_EMU32B+0x8 },
+	{ EMU_DST_ALICE2_EMU32_1, EMU_DST_ALICE2_EMU32_9, EMU_DST_TINA_EMU32B+0x1, EMU_DST_TINA_EMU32B+0x9 },
+	{ EMU_DST_ALICE2_EMU32_2, EMU_DST_ALICE2_EMU32_A, EMU_DST_TINA_EMU32B+0x2, EMU_DST_TINA_EMU32B+0xa },
+	{ EMU_DST_ALICE2_EMU32_3, EMU_DST_ALICE2_EMU32_B, EMU_DST_TINA_EMU32B+0x3, EMU_DST_TINA_EMU32B+0xb },
+	{ EMU_DST_ALICE2_EMU32_4, EMU_DST_ALICE2_EMU32_C, EMU_DST_TINA_EMU32B+0x4, EMU_DST_TINA_EMU32B+0xc },
+	{ EMU_DST_ALICE2_EMU32_5, EMU_DST_ALICE2_EMU32_D, EMU_DST_TINA_EMU32B+0x5, EMU_DST_TINA_EMU32B+0xd },
+	{ EMU_DST_ALICE2_EMU32_6, EMU_DST_ALICE2_EMU32_E, EMU_DST_TINA_EMU32B+0x6, EMU_DST_TINA_EMU32B+0xe },
+	{ EMU_DST_ALICE2_EMU32_7, EMU_DST_ALICE2_EMU32_F, EMU_DST_TINA_EMU32B+0x7, EMU_DST_TINA_EMU32B+0xf },
+};
+static_assert(ARRAY_SIZE(emu1010b_4x_input_dst) <= NUM_INPUT_DESTS);
+
+static const unsigned short emu1616_2x_input_dst[][2] = {
+	{ EMU_DST_ALICE2_EMU32_0, EMU_DST_TINA2_EMU32B+0x0 },
+	{ EMU_DST_ALICE2_EMU32_1, EMU_DST_TINA2_EMU32B+0x1 },
+	{ EMU_DST_ALICE2_EMU32_2, EMU_DST_TINA2_EMU32B+0x2 },
+	{ EMU_DST_ALICE2_EMU32_3, EMU_DST_TINA2_EMU32B+0x3 },
+	{ EMU_DST_ALICE2_EMU32_4, EMU_DST_TINA2_EMU32B+0x4 },
+	{ EMU_DST_ALICE2_EMU32_5, EMU_DST_TINA2_EMU32B+0x5 },
+	{ EMU_DST_ALICE2_EMU32_6, EMU_DST_TINA2_EMU32B+0x6 },
+	{ EMU_DST_ALICE2_EMU32_7, EMU_DST_TINA2_EMU32B+0x7 },
+	{ EMU_DST_ALICE2_EMU32_8, EMU_DST_TINA2_EMU32B+0x8 },
+	{ EMU_DST_ALICE2_EMU32_9, EMU_DST_TINA2_EMU32B+0x9 },
+	{ EMU_DST_ALICE2_EMU32_A, EMU_DST_TINA2_EMU32B+0xa },
+	{ EMU_DST_ALICE2_EMU32_B, EMU_DST_TINA2_EMU32B+0xb },
+	{ EMU_DST_ALICE2_EMU32_C, EMU_DST_TINA2_EMU32B+0xc },
+	{ EMU_DST_ALICE2_EMU32_D, EMU_DST_TINA2_EMU32B+0xd },
+	{ EMU_DST_ALICE2_EMU32_E, EMU_DST_TINA2_EMU32B+0xe },
+	{ EMU_DST_ALICE2_EMU32_F, EMU_DST_TINA2_EMU32B+0xf },
+};
+static_assert(ARRAY_SIZE(emu1616_2x_input_dst) <= NUM_INPUT_DESTS);
+
+static const unsigned short emu1616_4x_input_dst[][4] = {
+	{ EMU_DST_ALICE2_EMU32_0, EMU_DST_ALICE2_EMU32_8, EMU_DST_TINA2_EMU32B+0x0, EMU_DST_TINA2_EMU32B+0x8 },
+	{ EMU_DST_ALICE2_EMU32_1, EMU_DST_ALICE2_EMU32_9, EMU_DST_TINA2_EMU32B+0x1, EMU_DST_TINA2_EMU32B+0x9 },
+	{ EMU_DST_ALICE2_EMU32_2, EMU_DST_ALICE2_EMU32_A, EMU_DST_TINA2_EMU32B+0x2, EMU_DST_TINA2_EMU32B+0xa },
+	{ EMU_DST_ALICE2_EMU32_3, EMU_DST_ALICE2_EMU32_B, EMU_DST_TINA2_EMU32B+0x3, EMU_DST_TINA2_EMU32B+0xb },
+	{ EMU_DST_ALICE2_EMU32_4, EMU_DST_ALICE2_EMU32_C, EMU_DST_TINA2_EMU32B+0x4, EMU_DST_TINA2_EMU32B+0xc },
+	{ EMU_DST_ALICE2_EMU32_5, EMU_DST_ALICE2_EMU32_D, EMU_DST_TINA2_EMU32B+0x5, EMU_DST_TINA2_EMU32B+0xd },
+	{ EMU_DST_ALICE2_EMU32_6, EMU_DST_ALICE2_EMU32_E, EMU_DST_TINA2_EMU32B+0x6, EMU_DST_TINA2_EMU32B+0xe },
+	{ EMU_DST_ALICE2_EMU32_7, EMU_DST_ALICE2_EMU32_F, EMU_DST_TINA2_EMU32B+0x7, EMU_DST_TINA2_EMU32B+0xf },
+};
+static_assert(ARRAY_SIZE(emu1616_4x_input_dst) <= NUM_INPUT_DESTS);
+
 static const unsigned short emu0404_input_dflt[] = {
 	EMU_SRC_HAMOA_ADC_LEFT1,
 	EMU_SRC_HAMOA_ADC_RIGHT1,
@@ -906,7 +990,7 @@ struct snd_emu1010_routing_info {
 	const char * const *out_texts[3];
 	const unsigned short *src_regs[3];
 	const unsigned short *out_regs[3];
-	const unsigned short *in_regs;
+	const unsigned short *in_regs[3];
 	const unsigned short *out_dflts;
 	const unsigned short *in_dflts;
 	unsigned n_srcs[4];
@@ -931,8 +1015,8 @@ static const struct snd_emu1010_routing_info emu1010_routing_info[] = {
 			    ARRAY_SIZE(emu1010_2x_output_texts), ARRAY_SIZE(emu1010_4x_output_texts) },
 
 		.in_dflts = emu1010_input_dflt,
-		.in_regs = emu1010_input_dst,
-		.n_ins = { ARRAY_SIZE(emu1010_input_dst), 16, 16, 16 },
+		.in_regs = { emu1010_input_dst, emu1010_2x_input_dst[0], emu1010_4x_input_dst[0] },
+		.n_ins = { ARRAY_SIZE(emu1010_input_dst), 16, 8, 4 },
 	},
 	{
 		/* rev2 1010 */
@@ -950,8 +1034,8 @@ static const struct snd_emu1010_routing_info emu1010_routing_info[] = {
 			    ARRAY_SIZE(snd_emu1010b_2x_output_texts), ARRAY_SIZE(snd_emu1010b_4x_output_texts) },
 
 		.in_dflts = emu1010_input_dflt,
-		.in_regs = emu1010_input_dst,
-		.n_ins = { ARRAY_SIZE(emu1010_input_dst) - 6, 16, 16, 16 },
+		.in_regs = { emu1010_input_dst, emu1010b_2x_input_dst[0], emu1010b_4x_input_dst[0] },
+		.n_ins = { ARRAY_SIZE(emu1010_input_dst) - 6, 16, 16, 8 },
 	},
 	{
 		/* 1616(m) cardbus */
@@ -969,8 +1053,8 @@ static const struct snd_emu1010_routing_info emu1010_routing_info[] = {
 			    ARRAY_SIZE(snd_emu1616_2x_output_texts), ARRAY_SIZE(snd_emu1616_4x_output_texts) },
 
 		.in_dflts = emu1010_input_dflt,
-		.in_regs = emu1010_input_dst,
-		.n_ins = { ARRAY_SIZE(emu1010_input_dst) - 6, 16, 16, 16 },
+		.in_regs = { emu1010_input_dst, emu1616_2x_input_dst[0], emu1616_4x_input_dst[0] },
+		.n_ins = { ARRAY_SIZE(emu1010_input_dst) - 6, 16, 16, 8 },
 	},
 	{
 		/* 0404 */
@@ -988,8 +1072,8 @@ static const struct snd_emu1010_routing_info emu1010_routing_info[] = {
 			    ARRAY_SIZE(snd_emu0404_output_texts), ARRAY_SIZE(snd_emu0404_4x_output_texts) },
 
 		.in_dflts = emu0404_input_dflt,
-		.in_regs = emu1010_input_dst,
-		.n_ins = { ARRAY_SIZE(emu1010_input_dst) - 6, 16, 16, 16 },
+		.in_regs = { emu1010_input_dst, emu1010_2x_input_dst[0], emu1010_4x_input_dst[0] },
+		.n_ins = { ARRAY_SIZE(emu1010_input_dst) - 6, 16, 8, 4 },
 	},
 };
 
@@ -1041,11 +1125,10 @@ static void snd_emu1010_input_source_apply(struct snd_emu10k1 *emu,
 	const struct snd_emu1010_routing_info *emu_ri =
 		&emu1010_routing_info[emu1010_idx(emu)];
 	unsigned shift = emu->emu1010.clock_shift;
-	const unsigned short *regs = &emu_ri->in_regs[channel];
+	const unsigned short *regs = &emu_ri->in_regs[shift][channel << shift];
 	const unsigned short *vals = &emu_ri->src_regs[shift][src << shift];
 
-	// Only 1x capture for now
-	snd_emu1010_fpga_link_dst_src_write(emu, regs[0], vals[0]);
+	snd_emu1010_source_apply(emu, shift, regs, vals);
 }
 
 static void snd_emu1010_apply_sources(struct snd_emu10k1 *emu, int active)
diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index 69552d5c9e45..037ca92dee98 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -233,6 +233,16 @@ static void snd_emu1010_constrain_efx_rate(struct snd_emu10k1 *emu,
 	runtime->hw.rates = snd_pcm_rate_to_rate_bit(rate);
 }
 
+static void snd_emu1010_constrain_efx_capture_rate(struct snd_emu10k1 *emu,
+						   struct snd_pcm_runtime *runtime)
+{
+	int rate;
+
+	rate = emu->emu1010.word_clock << emu->emu1010.clock_shift;
+	runtime->hw.rate_min = runtime->hw.rate_max = rate;
+	runtime->hw.rates = snd_pcm_rate_to_rate_bit(rate);
+}
+
 static unsigned int emu10k1_calc_pitch_target(unsigned int rate)
 {
 	unsigned int pitch_target;
@@ -570,8 +580,22 @@ static int snd_emu10k1_capture_prepare(struct snd_pcm_substream *substream)
 		if (emu->card_capabilities->emu_model) {
 			unsigned mask = 0xffffffff >> (32 - runtime->channels * 2);
 			if (emu->das_mode) {
+				unsigned shift = emu->emu1010.clock_shift;
+				if (shift) {
+					if (emu->card_capabilities->emu_in_32) {
+						if (shift == 2)
+							mask |= mask << 16;
+						epcm->capture_cr_val2 = mask;
+					} else {
+						if (shift == 2)
+							mask |= mask << 8;
+						mask |= mask << 16;
+						epcm->capture_cr_val2 = 0;
+					}
+				} else {
+					epcm->capture_cr_val2 = 0;
+				}
 				epcm->capture_cr_val = mask;
-				epcm->capture_cr_val2 = 0;
 			} else {
 				// The upper 32 16-bit capture voices, two for each of the 16 32-bit channels.
 				// The lower voices are occupied by A_EXTOUT_*_CAP*.
@@ -1446,26 +1470,22 @@ static int snd_emu10k1_capture_efx_open(struct snd_pcm_substream *substream)
 	substream->runtime->private_free = snd_emu10k1_pcm_free_substream;
 	runtime->hw = snd_emu10k1_capture_efx;
 	if (emu->card_capabilities->emu_model) {
-		snd_emu1010_constrain_efx_rate(emu, runtime);
+		snd_emu1010_constrain_efx_capture_rate(emu, runtime);
 		/*
 		 * There are 32 mono channels of 16bits each.
 		 * 24bit Audio uses 2x channels over 16bit,
 		 * 96kHz uses 2x channels over 48kHz,
 		 * 192kHz uses 4x channels over 48kHz.
 		 * So, for 48kHz 24bit, one has 16 channels,
 		 * for 96kHz 24bit, one has 8 channels,
 		 * for 192kHz 24bit, one has 4 channels.
 		 * 1010rev2 and 1616(m) cards have double that,
 		 * but we don't exceed 16 channels anyway.
 		 */
-#if 0
-		/* For 96kHz */
-		runtime->hw.channels_min = runtime->hw.channels_max = 4;
-#endif
-#if 0
-		/* For 192kHz */
-		runtime->hw.channels_min = runtime->hw.channels_max = 2;
-#endif
+		if (emu->das_mode)
+			runtime->hw.channels_max =
+				min(16, 32 >> (emu->emu1010.clock_shift +
+					       !emu->card_capabilities->emu_in_32));
 		runtime->hw.formats = SNDRV_PCM_FMTBIT_S32_LE;
 	} else {
 		spin_lock_irq(&emu->reg_lock);
-- 
2.40.0.152.g15d061e6df

