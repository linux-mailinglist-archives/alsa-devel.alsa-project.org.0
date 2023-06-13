Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5153472DB40
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 09:42:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F275826;
	Tue, 13 Jun 2023 09:41:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F275826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686642120;
	bh=pRStDLhdFflzmHpDcnkbuByk76a3KnlKQSmH5SnE93k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q3bYz4Uku5X0Hhf5QS/UCMB9LOO7HYoXdaqAjiTImhKCfREGcWWA9f/wNC33vbW1o
	 +EenA+kuv7DXEYoBa/VNUxOSr7ro+LZTDutLJadYmIlLqIz9a6y0H9zQhNnE/dU1P2
	 d0D9dvKwMEydDywaFUcfNiDIpVTJ8uCxBNVJcxJw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE669F805C5; Tue, 13 Jun 2023 09:40:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 01255F80130;
	Tue, 13 Jun 2023 09:40:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FB8EF80553; Tue, 13 Jun 2023 09:40:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EE8C2F80246
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 09:38:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE8C2F80246
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 7E34A241F9;
	Tue, 13 Jun 2023 03:38:22 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1q8ybe-dRX-00; Tue, 13 Jun 2023 09:38:22 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 2/8] ALSA: emu10k1: improve mixer control naming in E-MU
 D.A.S. mode
Date: Tue, 13 Jun 2023 09:38:16 +0200
Message-Id: <20230613073822.1343234-3-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230613073822.1343234-1-oswald.buddenhagen@gmx.de>
References: <20230613073822.1343234-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LDGHLIQWXIGZ2SJUVBBM4DYMKHAKUEVP
X-Message-ID-Hash: LDGHLIQWXIGZ2SJUVBBM4DYMKHAKUEVP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LDGHLIQWXIGZ2SJUVBBM4DYMKHAKUEVP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use the clearer "PbChn <n>" instead of "DSP <n>" for the source names.
In particular, this is much less confusing in the capture source
selection - "DSP 0" having the source "DSP 0" really didn't help.
I didn't use "Playback Channel <n>", because that would be a tad too
long to be sensibly displayed in alsamixer.

The capture enums also get a "DSP" => "CpChn" replacement.

I used zero-padded decimals, so the capture elements are properly sorted
in alsamixer. I found hex too confusing.

Note that unlike in the legacy mixer, we define enum values only for
actually "wired" channels.

I'm leaving the legacy mixer alone, as I don't want to completely
invalidate saved mixer states. This introduces some bloat, but it seems
bearable.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emumixer.c | 108 ++++++++++++++++++++++++++---------
 1 file changed, 81 insertions(+), 27 deletions(-)

diff --git a/sound/pci/emu10k1/emumixer.c b/sound/pci/emu10k1/emumixer.c
index a9358d9c08b9..8878b660ba94 100644
--- a/sound/pci/emu10k1/emumixer.c
+++ b/sound/pci/emu10k1/emumixer.c
@@ -106,6 +106,12 @@ static int snd_emu10k1_spdif_get_mask(struct snd_kcontrol *kcontrol,
 	"DSP 16", "DSP 17", "DSP 18", "DSP 19", "DSP 20", "DSP 21", "DSP 22", "DSP 23", \
 	"DSP 24", "DSP 25", "DSP 26", "DSP 27", "DSP 28", "DSP 29", "DSP 30", "DSP 31"
 
+#define PB_TEXTS \
+	"PbChn 00", "PbChn 01", "PbChn 02", "PbChn 03", \
+	"PbChn 04", "PbChn 05", "PbChn 06", "PbChn 07", \
+	"PbChn 08", "PbChn 09", "PbChn 10", "PbChn 11", \
+	"PbChn 12", "PbChn 13", "PbChn 14", "PbChn 15"
+
 #define PAIR_TEXTS(base, one, two) PAIR_PS(base, one, two, "")
 #define LR_TEXTS(base) LR_PS(base, "")
 #define ADAT_TEXTS(pfx) ADAT_PS(pfx, "")
@@ -161,6 +167,11 @@ static const char * const emu1010_src_texts[] = {
 	DSP_TEXTS,
 };
 
+static const char * const emu1010_das_src_texts[] = {
+	EMU1010_COMMON_TEXTS,
+	PB_TEXTS,
+};
+
 static const unsigned short emu1010_src_regs[] = {
 	EMU_SRC_SILENCE,
 	PAIR_REGS(EMU_SRC_DOCK_MIC, _A, _B),
@@ -192,6 +203,11 @@ static const char * const emu1010b_src_texts[] = {
 	DSP_TEXTS,
 };
 
+static const char * const emu1010b_das_src_texts[] = {
+	EMU1010b_COMMON_TEXTS,
+	PB_TEXTS,
+};
+
 static const unsigned short emu1010b_src_regs[] = {
 	EMU_SRC_SILENCE,
 	PAIR_REGS(EMU_SRC_DOCK_MIC, _A, _B),
@@ -221,6 +237,11 @@ static const char * const emu1616_src_texts[] = {
 	DSP_TEXTS,
 };
 
+static const char * const emu1616_das_src_texts[] = {
+	EMU1616_COMMON_TEXTS,
+	PB_TEXTS,
+};
+
 static const unsigned short emu1616_src_regs[] = {
 	EMU_SRC_SILENCE,
 	PAIR_REGS(EMU_SRC_DOCK_MIC, _A, _B),
@@ -244,6 +265,11 @@ static const char * const emu0404_src_texts[] = {
 	DSP_TEXTS,
 };
 
+static const char * const emu0404_das_src_texts[] = {
+	EMU0404_COMMON_TEXTS,
+	PB_TEXTS,
+};
+
 static const unsigned short emu0404_src_regs[] = {
 	EMU_SRC_SILENCE,
 	LR_REGS(EMU_SRC_HAMOA_ADC),
@@ -427,6 +453,25 @@ static const char * const emu1010_input_texts[] = {
 };
 static_assert(ARRAY_SIZE(emu1010_input_texts) <= NUM_INPUT_DESTS);
 
+static const char * const emu1010_das_input_texts[] = {
+	"CpChn 00 Capture Enum",
+	"CpChn 01 Capture Enum",
+	"CpChn 02 Capture Enum",
+	"CpChn 03 Capture Enum",
+	"CpChn 04 Capture Enum",
+	"CpChn 05 Capture Enum",
+	"CpChn 06 Capture Enum",
+	"CpChn 07 Capture Enum",
+	"CpChn 08 Capture Enum",
+	"CpChn 09 Capture Enum",
+	"CpChn 10 Capture Enum",
+	"CpChn 11 Capture Enum",
+	"CpChn 12 Capture Enum",
+	"CpChn 13 Capture Enum",
+	"CpChn 14 Capture Enum",
+	"CpChn 15 Capture Enum",
+};
+
 static const unsigned short emu1010_input_dst[] = {
 	EMU_DST_ALICE2_EMU32_0,
 	EMU_DST_ALICE2_EMU32_1,
@@ -504,78 +549,78 @@ static const unsigned short emu0404_input_dflt[] = {
 };
 
 struct snd_emu1010_routing_info {
-	const char * const *src_texts;
+	const char * const *src_texts[2];
 	const char * const *out_texts;
 	const unsigned short *src_regs;
 	const unsigned short *out_regs;
 	const unsigned short *in_regs;
 	const unsigned short *out_dflts;
 	const unsigned short *in_dflts;
-	unsigned n_srcs;
+	unsigned n_srcs[2];
 	unsigned n_outs;
-	unsigned n_ins;
+	unsigned n_ins[2];
 };
 
 static const struct snd_emu1010_routing_info emu1010_routing_info[] = {
 	{
 		/* rev1 1010 */
 		.src_regs = emu1010_src_regs,
-		.src_texts = emu1010_src_texts,
-		.n_srcs = ARRAY_SIZE(emu1010_src_texts),
+		.src_texts = { emu1010_src_texts, emu1010_das_src_texts },
+		.n_srcs = { ARRAY_SIZE(emu1010_src_texts), ARRAY_SIZE(emu1010_das_src_texts) },
 
 		.out_dflts = emu1010_output_dflt,
 		.out_regs = emu1010_output_dst,
 		.out_texts = emu1010_output_texts,
 		.n_outs = ARRAY_SIZE(emu1010_output_dst),
 
 		.in_dflts = emu1010_input_dflt,
 		.in_regs = emu1010_input_dst,
-		.n_ins = ARRAY_SIZE(emu1010_input_dst),
+		.n_ins = { ARRAY_SIZE(emu1010_input_dst), 16 },
 	},
 	{
 		/* rev2 1010 */
 		.src_regs = emu1010b_src_regs,
-		.src_texts = emu1010b_src_texts,
-		.n_srcs = ARRAY_SIZE(emu1010b_src_texts),
+		.src_texts = { emu1010b_src_texts, emu1010b_das_src_texts },
+		.n_srcs = { ARRAY_SIZE(emu1010b_src_texts), ARRAY_SIZE(emu1010b_das_src_texts) },
 
 		.out_dflts = emu1010b_output_dflt,
 		.out_regs = emu1010b_output_dst,
 		.out_texts = snd_emu1010b_output_texts,
 		.n_outs = ARRAY_SIZE(emu1010b_output_dst),
 
 		.in_dflts = emu1010_input_dflt,
 		.in_regs = emu1010_input_dst,
-		.n_ins = ARRAY_SIZE(emu1010_input_dst) - 6,
+		.n_ins = { ARRAY_SIZE(emu1010_input_dst) - 6, 16 },
 	},
 	{
 		/* 1616(m) cardbus */
 		.src_regs = emu1616_src_regs,
-		.src_texts = emu1616_src_texts,
-		.n_srcs = ARRAY_SIZE(emu1616_src_texts),
+		.src_texts = { emu1616_src_texts, emu1616_das_src_texts },
+		.n_srcs = { ARRAY_SIZE(emu1616_src_texts), ARRAY_SIZE(emu1616_das_src_texts) },
 
 		.out_dflts = emu1616_output_dflt,
 		.out_regs = emu1616_output_dst,
 		.out_texts = snd_emu1616_output_texts,
 		.n_outs = ARRAY_SIZE(emu1616_output_dst),
 
 		.in_dflts = emu1010_input_dflt,
 		.in_regs = emu1010_input_dst,
-		.n_ins = ARRAY_SIZE(emu1010_input_dst) - 6,
+		.n_ins = { ARRAY_SIZE(emu1010_input_dst) - 6, 16 },
 	},
 	{
 		/* 0404 */
 		.src_regs = emu0404_src_regs,
-		.src_texts = emu0404_src_texts,
-		.n_srcs = ARRAY_SIZE(emu0404_src_texts),
+		.src_texts = { emu0404_src_texts, emu0404_das_src_texts },
+		.n_srcs = { ARRAY_SIZE(emu0404_src_texts), ARRAY_SIZE(emu0404_das_src_texts) },
 
 		.out_dflts = emu0404_output_dflt,
 		.out_regs = emu0404_output_dst,
 		.out_texts = snd_emu0404_output_texts,
 		.n_outs = ARRAY_SIZE(emu0404_output_dflt),
 
 		.in_dflts = emu0404_input_dflt,
 		.in_regs = emu1010_input_dst,
-		.n_ins = ARRAY_SIZE(emu1010_input_dst) - 6,
+		.n_ins = { ARRAY_SIZE(emu1010_input_dst) - 6, 16 },
 	},
 };
 
@@ -608,32 +653,34 @@ static void snd_emu1010_apply_sources(struct snd_emu10k1 *emu)
 {
 	const struct snd_emu1010_routing_info *emu_ri =
 		&emu1010_routing_info[emu1010_idx(emu)];
+	unsigned iidx = emu->das_mode;
 
 	for (unsigned i = 0; i < emu_ri->n_outs; i++)
 		snd_emu1010_output_source_apply(
 			emu, i, emu->emu1010.output_source[i]);
-	for (unsigned i = 0; i < emu_ri->n_ins; i++)
+	for (unsigned i = 0; i < emu_ri->n_ins[iidx]; i++)
 		snd_emu1010_input_source_apply(
 			emu, i, emu->emu1010.input_source[i]);
 }
 
 static u8 emu1010_map_source(const struct snd_emu1010_routing_info *emu_ri,
-			     unsigned val)
+			     unsigned das_mode, unsigned val)
 {
-	for (unsigned i = 0; i < emu_ri->n_srcs; i++)
+	for (unsigned i = 0; i < emu_ri->n_srcs[das_mode]; i++)
 		if (val == emu_ri->src_regs[i])
 			return i;
 	return 0;
 }
 
 static int snd_emu1010_input_output_source_info(struct snd_kcontrol *kcontrol,
 						struct snd_ctl_elem_info *uinfo)
 {
 	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
 	const struct snd_emu1010_routing_info *emu_ri =
 		&emu1010_routing_info[emu1010_idx(emu)];
+	unsigned iidx = emu->das_mode;
 
-	return snd_ctl_enum_info(uinfo, 1, emu_ri->n_srcs, emu_ri->src_texts);
+	return snd_ctl_enum_info(uinfo, 1, emu_ri->n_srcs[iidx], emu_ri->src_texts[iidx]);
 }
 
 static int snd_emu1010_output_source_get(struct snd_kcontrol *kcontrol,
@@ -656,11 +703,12 @@ static int snd_emu1010_output_source_put(struct snd_kcontrol *kcontrol,
 	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
 	const struct snd_emu1010_routing_info *emu_ri =
 		&emu1010_routing_info[emu1010_idx(emu)];
+	unsigned iidx = emu->das_mode;
 	unsigned val = ucontrol->value.enumerated.item[0];
 	unsigned channel = kcontrol->private_value;
 	int change;
 
-	if (val >= emu_ri->n_srcs)
+	if (val >= emu_ri->n_srcs[iidx])
 		return -EINVAL;
 	if (channel >= emu_ri->n_outs)
 		return -EINVAL;
@@ -686,27 +734,29 @@ static int snd_emu1010_input_source_get(struct snd_kcontrol *kcontrol,
 	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
 	const struct snd_emu1010_routing_info *emu_ri =
 		&emu1010_routing_info[emu1010_idx(emu)];
+	unsigned iidx = emu->das_mode;
 	unsigned channel = kcontrol->private_value;
 
-	if (channel >= emu_ri->n_ins)
+	if (channel >= emu_ri->n_ins[iidx])
 		return -EINVAL;
 	ucontrol->value.enumerated.item[0] = emu->emu1010.input_source[channel];
 	return 0;
 }
 
 static int snd_emu1010_input_source_put(struct snd_kcontrol *kcontrol,
                                  struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
 	const struct snd_emu1010_routing_info *emu_ri =
 		&emu1010_routing_info[emu1010_idx(emu)];
+	unsigned iidx = emu->das_mode;
 	unsigned val = ucontrol->value.enumerated.item[0];
 	unsigned channel = kcontrol->private_value;
 	int change;
 
-	if (val >= emu_ri->n_srcs)
+	if (val >= emu_ri->n_srcs[iidx])
 		return -EINVAL;
-	if (channel >= emu_ri->n_ins)
+	if (channel >= emu_ri->n_ins[iidx])
 		return -EINVAL;
 	change = (emu->emu1010.input_source[channel] != val);
 	if (change) {
@@ -728,14 +778,17 @@ static int add_emu1010_source_mixers(struct snd_emu10k1 *emu)
 {
 	const struct snd_emu1010_routing_info *emu_ri =
 		&emu1010_routing_info[emu1010_idx(emu)];
+	unsigned iidx = emu->das_mode;
 	int err;
 
 	err = add_ctls(emu, &emu1010_output_source_ctl,
 		       emu_ri->out_texts, emu_ri->n_outs);
 	if (err < 0)
 		return err;
 	err = add_ctls(emu, &emu1010_input_source_ctl,
-		       emu1010_input_texts, emu_ri->n_ins);
+		       iidx ? emu1010_das_input_texts :
+			      emu1010_input_texts,
+		       emu_ri->n_ins[iidx]);
 	return err;
 }
 
@@ -2338,13 +2391,14 @@ int snd_emu10k1_mixer(struct snd_emu10k1 *emu,
 		const struct snd_emu1010_routing_info *emu_ri =
 			&emu1010_routing_info[emu_idx];
 		const struct snd_emu1010_pads_info *emu_pi = &emu1010_pads_info[emu_idx];
+		int midx = emu->das_mode;
 
-		for (i = 0; i < emu_ri->n_ins; i++)
+		for (i = 0; i < emu_ri->n_ins[midx]; i++)
 			emu->emu1010.input_source[i] =
-				emu1010_map_source(emu_ri, emu_ri->in_dflts[i]);
+				emu1010_map_source(emu_ri, midx, emu_ri->in_dflts[i]);
 		for (i = 0; i < emu_ri->n_outs; i++)
 			emu->emu1010.output_source[i] =
-				emu1010_map_source(emu_ri, emu_ri->out_dflts[i]);
+				emu1010_map_source(emu_ri, midx, emu_ri->out_dflts[i]);
 		snd_emu1010_apply_sources(emu);
 
 		err = snd_ctl_add(card,
-- 
2.40.0.152.g15d061e6df

