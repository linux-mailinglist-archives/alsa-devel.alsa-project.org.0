Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3497704985
	for <lists+alsa-devel@lfdr.de>; Tue, 16 May 2023 11:41:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EE251DA;
	Tue, 16 May 2023 11:40:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EE251DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684230064;
	bh=feeJ6IDYRSyrOx32tPsHuCqh8d4DGxNlKEcmKiWJmsY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i+I8DQ/lATopKavx4SBNqrYckvViIb/nYxVXu862mMIr+t5zL4lfXRnKG4f2U3jKN
	 badPCKuhh+ldHnGalAGFy1vnK+3Rs/bPs2oH0NOvdWu4i8mrGfkHAIFEuQvoS1V0+m
	 cwO8y1wcDKackrf8Ek5qmmvCM2j2/3n4RcMORyfE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7B8DF8060F; Tue, 16 May 2023 11:37:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 09CE3F80609;
	Tue, 16 May 2023 11:37:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE66DF805F4; Tue, 16 May 2023 11:37:01 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 04940F8055A
	for <alsa-devel@alsa-project.org>; Tue, 16 May 2023 11:36:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04940F8055A
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 350B92429B;
	Tue, 16 May 2023 05:36:13 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pyr6K-q1X-00; Tue, 16 May 2023 11:36:12 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 08/10] ALSA: emu10k1: improve mixer controls for E-MU 1010
 rev2 card
Date: Tue, 16 May 2023 11:36:10 +0200
Message-Id: <20230516093612.3536508-9-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230516093612.3536508-1-oswald.buddenhagen@gmx.de>
References: <20230516093612.3536508-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7N36MCUKS7TZOVJVEBLARRUH5TXHNSTZ
X-Message-ID-Hash: 7N36MCUKS7TZOVJVEBLARRUH5TXHNSTZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7N36MCUKS7TZOVJVEBLARRUH5TXHNSTZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This card has rather different inputs/outputs due to switching from the
AudioDock to the MicroDock.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emumixer.c | 106 +++++++++++++++++++++++++++++++++--
 1 file changed, 100 insertions(+), 6 deletions(-)

diff --git a/sound/pci/emu10k1/emumixer.c b/sound/pci/emu10k1/emumixer.c
index 9a59e439a533..395c2b2d96dd 100644
--- a/sound/pci/emu10k1/emumixer.c
+++ b/sound/pci/emu10k1/emumixer.c
@@ -172,6 +172,38 @@ static const unsigned short emu1010_src_regs[] = {
 };
 static_assert(ARRAY_SIZE(emu1010_src_regs) == ARRAY_SIZE(emu1010_src_texts));
 
+/* 1010 rev2 */
+
+#define EMU1010b_COMMON_TEXTS \
+	"Silence", \
+	PAIR_TEXTS("Dock Mic", "A", "B"), \
+	LR_TEXTS("Dock ADC1"), \
+	LR_TEXTS("Dock ADC2"), \
+	LR_TEXTS("0202 ADC"), \
+	LR_TEXTS("Dock SPDIF"), \
+	LR_TEXTS("1010 SPDIF"), \
+	ADAT_TEXTS("Dock "), \
+	ADAT_TEXTS("1010 ")
+
+static const char * const emu1010b_src_texts[] = {
+	EMU1010b_COMMON_TEXTS,
+	DSP_TEXTS,
+};
+
+static const unsigned short emu1010b_src_regs[] = {
+	EMU_SRC_SILENCE,
+	PAIR_REGS(EMU_SRC_DOCK_MIC, _A, _B),
+	LR_REGS(EMU_SRC_DOCK_ADC1),
+	LR_REGS(EMU_SRC_DOCK_ADC2),
+	LR_REGS(EMU_SRC_HAMOA_ADC),
+	LR_REGS(EMU_SRC_MDOCK_SPDIF),
+	LR_REGS(EMU_SRC_HANA_SPDIF),
+	ADAT_REGS(EMU_SRC_MDOCK_ADAT),
+	ADAT_REGS(EMU_SRC_HANA_ADAT),
+	EMU32_SRC_REGS,
+};
+static_assert(ARRAY_SIZE(emu1010b_src_regs) == ARRAY_SIZE(emu1010b_src_texts));
+
 /* 1616(m) cardbus */
 
 #define EMU1616_COMMON_TEXTS \
@@ -245,6 +277,44 @@ static const unsigned short emu1010_output_dflt[] = {
 };
 static_assert(ARRAY_SIZE(emu1010_output_dflt) == ARRAY_SIZE(emu1010_output_dst));
 
+/* 1010 rev2 */
+
+static const char * const snd_emu1010b_output_texts[] = {
+	LR_CTLS("Dock DAC1"),
+	LR_CTLS("Dock DAC2"),
+	LR_CTLS("Dock DAC3"),
+	LR_CTLS("Dock SPDIF"),
+	ADAT_CTLS("Dock "),
+	LR_CTLS("0202 DAC"),
+	LR_CTLS("1010 SPDIF"),
+	ADAT_CTLS("1010 "),
+};
+
+static const unsigned short emu1010b_output_dst[] = {
+	LR_REGS(EMU_DST_DOCK_DAC1),
+	LR_REGS(EMU_DST_DOCK_DAC2),
+	LR_REGS(EMU_DST_DOCK_DAC3),
+	LR_REGS(EMU_DST_MDOCK_SPDIF),
+	ADAT_REGS(EMU_DST_MDOCK_ADAT),
+	LR_REGS(EMU_DST_HAMOA_DAC),
+	LR_REGS(EMU_DST_HANA_SPDIF),
+	ADAT_REGS(EMU_DST_HANA_ADAT),
+};
+static_assert(ARRAY_SIZE(emu1010b_output_dst) == ARRAY_SIZE(snd_emu1010b_output_texts));
+
+static const unsigned short emu1010b_output_dflt[] = {
+	EMU_SRC_ALICE_EMU32A+0, EMU_SRC_ALICE_EMU32A+1,
+	EMU_SRC_ALICE_EMU32A+2, EMU_SRC_ALICE_EMU32A+3,
+	EMU_SRC_ALICE_EMU32A+4, EMU_SRC_ALICE_EMU32A+5,
+	EMU_SRC_ALICE_EMU32A+0, EMU_SRC_ALICE_EMU32A+1,
+	EMU_SRC_ALICE_EMU32A+0, EMU_SRC_ALICE_EMU32A+1, EMU_SRC_ALICE_EMU32A+2, EMU_SRC_ALICE_EMU32A+3,
+	EMU_SRC_ALICE_EMU32A+4, EMU_SRC_ALICE_EMU32A+5, EMU_SRC_ALICE_EMU32A+6, EMU_SRC_ALICE_EMU32A+7,
+	EMU_SRC_ALICE_EMU32A+0, EMU_SRC_ALICE_EMU32A+1,
+	EMU_SRC_ALICE_EMU32A+0, EMU_SRC_ALICE_EMU32A+1,
+	EMU_SRC_ALICE_EMU32A+0, EMU_SRC_ALICE_EMU32A+1, EMU_SRC_ALICE_EMU32A+2, EMU_SRC_ALICE_EMU32A+3,
+	EMU_SRC_ALICE_EMU32A+4, EMU_SRC_ALICE_EMU32A+5, EMU_SRC_ALICE_EMU32A+6, EMU_SRC_ALICE_EMU32A+7,
+};
+
 /* 1616(m) cardbus */
 
 static const char * const snd_emu1616_output_texts[] = {
@@ -394,6 +464,21 @@ const struct snd_emu1010_routing_info emu1010_routing_info[] = {
 		.in_regs = emu1010_input_dst,
 		.n_ins = ARRAY_SIZE(emu1010_input_dst),
 	},
+	{
+		/* rev2 1010 */
+		.src_regs = emu1010b_src_regs,
+		.src_texts = emu1010b_src_texts,
+		.n_srcs = ARRAY_SIZE(emu1010b_src_texts),
+
+		.out_dflts = emu1010b_output_dflt,
+		.out_regs = emu1010b_output_dst,
+		.out_texts = snd_emu1010b_output_texts,
+		.n_outs = ARRAY_SIZE(emu1010b_output_dst),
+
+		.in_dflts = emu1010_input_dflt,
+		.in_regs = emu1010_input_dst,
+		.n_ins = ARRAY_SIZE(emu1010_input_dst) - 6,
+	},
 	{
 		/* 1616(m) cardbus */
 		.src_regs = emu1616_src_regs,
@@ -414,6 +499,8 @@ const struct snd_emu1010_routing_info emu1010_routing_info[] = {
 static unsigned emu1010_idx(struct snd_emu10k1 *emu)
 {
 	if (emu->card_capabilities->emu_model == EMU_MODEL_EMU1616)
+		return 2;
+	else if (emu->card_capabilities->emu_model == EMU_MODEL_EMU1010B)
 		return 1;
 	else
 		return 0;
@@ -576,17 +663,17 @@ static int add_emu1010_source_mixers(struct snd_emu10k1 *emu)
 
 
 static const char * const snd_emu1010_adc_pads[] = {
+	"ADC1 14dB PAD 0202 Capture Switch",
 	"ADC1 14dB PAD Audio Dock Capture Switch",
 	"ADC2 14dB PAD Audio Dock Capture Switch",
 	"ADC3 14dB PAD Audio Dock Capture Switch",
-	"ADC1 14dB PAD 0202 Capture Switch",
 };
 
 static const unsigned short snd_emu1010_adc_pad_regs[] = {
+	EMU_HANA_0202_ADC_PAD1,
 	EMU_HANA_DOCK_ADC_PAD1,
 	EMU_HANA_DOCK_ADC_PAD2,
 	EMU_HANA_DOCK_ADC_PAD3,
-	EMU_HANA_0202_ADC_PAD1,
 };
 
 #define snd_emu1010_adc_pads_info	snd_ctl_boolean_mono_info
@@ -629,19 +716,19 @@ static const struct snd_kcontrol_new emu1010_adc_pads_ctl = {
 
 
 static const char * const snd_emu1010_dac_pads[] = {
+	"DAC1 0202 14dB PAD Playback Switch",
 	"DAC1 Audio Dock 14dB PAD Playback Switch",
 	"DAC2 Audio Dock 14dB PAD Playback Switch",
 	"DAC3 Audio Dock 14dB PAD Playback Switch",
 	"DAC4 Audio Dock 14dB PAD Playback Switch",
-	"DAC1 0202 14dB PAD Playback Switch",
 };
 
 static const unsigned short snd_emu1010_dac_regs[] = {
+	EMU_HANA_0202_DAC_PAD1,
 	EMU_HANA_DOCK_DAC_PAD1,
 	EMU_HANA_DOCK_DAC_PAD2,
 	EMU_HANA_DOCK_DAC_PAD3,
 	EMU_HANA_DOCK_DAC_PAD4,
-	EMU_HANA_0202_DAC_PAD1,
 };
 
 #define snd_emu1010_dac_pads_info	snd_ctl_boolean_mono_info
@@ -700,10 +787,17 @@ const struct snd_emu1010_pads_info emu1010_pads_info[] = {
 		.n_dac_ctls = ARRAY_SIZE(snd_emu1010_dac_pads),
 	},
 	{
-		/* 1616(m) cardbus */
+		/* rev2 1010 */
 		.adc_ctls = snd_emu1010_adc_pads,
-		.n_adc_ctls = ARRAY_SIZE(snd_emu1010_adc_pads) - 2,
+		.n_adc_ctls = ARRAY_SIZE(snd_emu1010_adc_pads) - 1,
 		.dac_ctls = snd_emu1010_dac_pads,
+		.n_dac_ctls = ARRAY_SIZE(snd_emu1010_dac_pads) - 1,
+	},
+	{
+		/* 1616(m) cardbus */
+		.adc_ctls = snd_emu1010_adc_pads + 1,
+		.n_adc_ctls = ARRAY_SIZE(snd_emu1010_adc_pads) - 2,
+		.dac_ctls = snd_emu1010_dac_pads + 1,
 		.n_dac_ctls = ARRAY_SIZE(snd_emu1010_dac_pads) - 2,
 	},
 };
-- 
2.40.0.152.g15d061e6df

