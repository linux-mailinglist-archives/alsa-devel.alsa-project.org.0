Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BB6704977
	for <lists+alsa-devel@lfdr.de>; Tue, 16 May 2023 11:39:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1FCE823;
	Tue, 16 May 2023 11:38:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1FCE823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684229939;
	bh=O+w6coujstOtG72Lusd2JiP98ttE9kcVovx7dscbtz0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RARvhCBjB2ESqEyI2z7Neaj8qYWUFR55G2S2ih7SX4jbvT62SzAIfwNcQ7nnZzT27
	 ssYDUXqGdlKLdKTpWLNkpiQ2EbVvDmgB3hEwVVfFgZXxUo/dtLmy+ggC29hZBrj4pb
	 j2GKgidX9oVuAT0rC8PdG7ZYA3nR8p2pKaHkX/Io=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E12BF805C3; Tue, 16 May 2023 11:36:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 85926F805BB;
	Tue, 16 May 2023 11:36:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8EB96F80579; Tue, 16 May 2023 11:36:35 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 1041FF80548
	for <alsa-devel@alsa-project.org>; Tue, 16 May 2023 11:36:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1041FF80548
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 20DC524297;
	Tue, 16 May 2023 05:36:13 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pyr6K-q19-00; Tue, 16 May 2023 11:36:12 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 04/10] ALSA: emu10k1: un-hardcode E-MU mixer control callbacks
 somewhat
Date: Tue, 16 May 2023 11:36:06 +0200
Message-Id: <20230516093612.3536508-5-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230516093612.3536508-1-oswald.buddenhagen@gmx.de>
References: <20230516093612.3536508-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XKLQGVLUTXFEID5MRKT6H6NLMYMQBQQP
X-Message-ID-Hash: XKLQGVLUTXFEID5MRKT6H6NLMYMQBQQP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XKLQGVLUTXFEID5MRKT6H6NLMYMQBQQP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Instead of hard-coding the card-specific arrays and their sizes in each
function, use a more data-driven approach.

As a drive-by, also hide the unavailable I2S input destinations on the
1616 cardbus card.

Also as a drive-by, use more assignments at variable declaration for
brevity. This also removes the pointless masking of kctl.private_value.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emumixer.c | 155 +++++++++++++++++++++++------------
 1 file changed, 101 insertions(+), 54 deletions(-)

diff --git a/sound/pci/emu10k1/emumixer.c b/sound/pci/emu10k1/emumixer.c
index 8d4b7c30d931..1a606695eda7 100644
--- a/sound/pci/emu10k1/emumixer.c
+++ b/sound/pci/emu10k1/emumixer.c
@@ -311,61 +311,114 @@ static const unsigned short emu1010_input_dst[] = {
 };
 static_assert(ARRAY_SIZE(emu1010_input_dst) == ARRAY_SIZE(emu1010_input_texts));
 
+struct snd_emu1010_routing_info {
+	const char * const *src_texts;
+	const unsigned short *src_regs;
+	const unsigned short *out_regs;
+	const unsigned short *in_regs;
+	unsigned n_srcs;
+	unsigned n_outs;
+	unsigned n_ins;
+};
+
+const struct snd_emu1010_routing_info emu1010_routing_info[] = {
+	{
+		.src_regs = emu1010_src_regs,
+		.src_texts = emu1010_src_texts,
+		.n_srcs = ARRAY_SIZE(emu1010_src_texts),
+
+		.out_regs = emu1010_output_dst,
+		.n_outs = ARRAY_SIZE(emu1010_output_dst),
+
+		.in_regs = emu1010_input_dst,
+		.n_ins = ARRAY_SIZE(emu1010_input_dst),
+	},
+	{
+		/* 1616(m) cardbus */
+		.src_regs = emu1616_src_regs,
+		.src_texts = emu1616_src_texts,
+		.n_srcs = ARRAY_SIZE(emu1616_src_texts),
+
+		.out_regs = emu1616_output_dst,
+		.n_outs = ARRAY_SIZE(emu1616_output_dst),
+
+		.in_regs = emu1010_input_dst,
+		.n_ins = ARRAY_SIZE(emu1010_input_dst) - 6,
+	},
+};
+
+static unsigned emu1010_idx(struct snd_emu10k1 *emu)
+{
+	if (emu->card_capabilities->emu_model == EMU_MODEL_EMU1616)
+		return 1;
+	else
+		return 0;
+}
+
+static void snd_emu1010_output_source_apply(struct snd_emu10k1 *emu,
+					    int channel, int src)
+{
+	const struct snd_emu1010_routing_info *emu_ri =
+		&emu1010_routing_info[emu1010_idx(emu)];
+
+	snd_emu1010_fpga_link_dst_src_write(emu,
+		emu_ri->out_regs[channel], emu_ri->src_regs[src]);
+}
+
+static void snd_emu1010_input_source_apply(struct snd_emu10k1 *emu,
+					   int channel, int src)
+{
+	const struct snd_emu1010_routing_info *emu_ri =
+		&emu1010_routing_info[emu1010_idx(emu)];
+
+	snd_emu1010_fpga_link_dst_src_write(emu,
+		emu_ri->in_regs[channel], emu_ri->src_regs[src]);
+}
+
 static int snd_emu1010_input_output_source_info(struct snd_kcontrol *kcontrol,
 						struct snd_ctl_elem_info *uinfo)
 {
 	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
+	const struct snd_emu1010_routing_info *emu_ri =
+		&emu1010_routing_info[emu1010_idx(emu)];
 
-	if (emu->card_capabilities->emu_model == EMU_MODEL_EMU1616)
-		return snd_ctl_enum_info(uinfo, 1, 49, emu1616_src_texts);
-	else
-		return snd_ctl_enum_info(uinfo, 1, 53, emu1010_src_texts);
+	return snd_ctl_enum_info(uinfo, 1, emu_ri->n_srcs, emu_ri->src_texts);
 }
 
 static int snd_emu1010_output_source_get(struct snd_kcontrol *kcontrol,
                                  struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
-	unsigned int channel;
+	const struct snd_emu1010_routing_info *emu_ri =
+		&emu1010_routing_info[emu1010_idx(emu)];
+	unsigned channel = kcontrol->private_value;
 
-	channel = (kcontrol->private_value) & 0xff;
-	/* Limit: emu1010_output_dst, emu->emu1010.output_source */
-	if (channel >= 24 ||
-	    (emu->card_capabilities->emu_model == EMU_MODEL_EMU1616 &&
-	     channel >= 18))
+	if (channel >= emu_ri->n_outs)
 		return -EINVAL;
 	ucontrol->value.enumerated.item[0] = emu->emu1010.output_source[channel];
 	return 0;
 }
 
 static int snd_emu1010_output_source_put(struct snd_kcontrol *kcontrol,
                                  struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
-	unsigned int val;
-	unsigned int channel;
+	const struct snd_emu1010_routing_info *emu_ri =
+		&emu1010_routing_info[emu1010_idx(emu)];
+	unsigned val = ucontrol->value.enumerated.item[0];
+	unsigned channel = kcontrol->private_value;
+	int change;
 
-	val = ucontrol->value.enumerated.item[0];
-	if (val >= 53 ||
-	    (emu->card_capabilities->emu_model == EMU_MODEL_EMU1616 &&
-	     val >= 49))
+	if (val >= emu_ri->n_srcs)
 		return -EINVAL;
-	channel = (kcontrol->private_value) & 0xff;
-	/* Limit: emu1010_output_dst, emu->emu1010.output_source */
-	if (channel >= 24 ||
-	    (emu->card_capabilities->emu_model == EMU_MODEL_EMU1616 &&
-	     channel >= 18))
+	if (channel >= emu_ri->n_outs)
 		return -EINVAL;
-	if (emu->emu1010.output_source[channel] == val)
-		return 0;
-	emu->emu1010.output_source[channel] = val;
-	if (emu->card_capabilities->emu_model == EMU_MODEL_EMU1616)
-		snd_emu1010_fpga_link_dst_src_write(emu,
-			emu1616_output_dst[channel], emu1616_src_regs[val]);
-	else
-		snd_emu1010_fpga_link_dst_src_write(emu,
-			emu1010_output_dst[channel], emu1010_src_regs[val]);
-	return 1;
+	change = (emu->emu1010.output_source[channel] != val);
+	if (change) {
+		emu->emu1010.output_source[channel] = val;
+		snd_emu1010_output_source_apply(emu, channel, val);
+	}
+	return change;
 }
 
 static const struct snd_kcontrol_new emu1010_output_source_ctl = {
@@ -380,42 +433,36 @@ static int snd_emu1010_input_source_get(struct snd_kcontrol *kcontrol,
                                  struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
-	unsigned int channel;
+	const struct snd_emu1010_routing_info *emu_ri =
+		&emu1010_routing_info[emu1010_idx(emu)];
+	unsigned channel = kcontrol->private_value;
 
-	channel = (kcontrol->private_value) & 0xff;
-	/* Limit: emu1010_input_dst, emu->emu1010.input_source */
-	if (channel >= 22)
+	if (channel >= emu_ri->n_ins)
 		return -EINVAL;
 	ucontrol->value.enumerated.item[0] = emu->emu1010.input_source[channel];
 	return 0;
 }
 
 static int snd_emu1010_input_source_put(struct snd_kcontrol *kcontrol,
                                  struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
-	unsigned int val;
-	unsigned int channel;
+	const struct snd_emu1010_routing_info *emu_ri =
+		&emu1010_routing_info[emu1010_idx(emu)];
+	unsigned val = ucontrol->value.enumerated.item[0];
+	unsigned channel = kcontrol->private_value;
+	int change;
 
-	val = ucontrol->value.enumerated.item[0];
-	if (val >= 53 ||
-	    (emu->card_capabilities->emu_model == EMU_MODEL_EMU1616 &&
-	     val >= 49))
+	if (val >= emu_ri->n_srcs)
 		return -EINVAL;
-	channel = (kcontrol->private_value) & 0xff;
-	/* Limit: emu1010_input_dst, emu->emu1010.input_source */
-	if (channel >= 22)
+	if (channel >= emu_ri->n_ins)
 		return -EINVAL;
-	if (emu->emu1010.input_source[channel] == val)
-		return 0;
-	emu->emu1010.input_source[channel] = val;
-	if (emu->card_capabilities->emu_model == EMU_MODEL_EMU1616)
-		snd_emu1010_fpga_link_dst_src_write(emu,
-			emu1010_input_dst[channel], emu1616_src_regs[val]);
-	else
-		snd_emu1010_fpga_link_dst_src_write(emu,
-			emu1010_input_dst[channel], emu1010_src_regs[val]);
-	return 1;
+	change = (emu->emu1010.input_source[channel] != val);
+	if (change) {
+		emu->emu1010.input_source[channel] = val;
+		snd_emu1010_input_source_apply(emu, channel, val);
+	}
+	return change;
 }
 
 static const struct snd_kcontrol_new emu1010_input_source_ctl = {
-- 
2.40.0.152.g15d061e6df

