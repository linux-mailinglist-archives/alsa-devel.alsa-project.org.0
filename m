Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 078BD704981
	for <lists+alsa-devel@lfdr.de>; Tue, 16 May 2023 11:40:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94ED511C;
	Tue, 16 May 2023 11:39:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94ED511C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684230025;
	bh=1VswoF9UeCG/IoYha8dC8SrgKNzBeL1lUyTEeJmc4JM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=riitoBXendJ3jO5yxHmXHySPfs0mu87ypaBIQmsJAJn+yWP5vIpO4NcdMZ+GK+TDt
	 xSYqaPkaNZ0AEGpSxskrJp1AxkOo5bAJ81uqhxLQmxkr1QcPMiKFqJtppbiacBmLGY
	 DWEYLBX3A8Bug1/B3jR5+FUwXVvyb1fwBX+jc95M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A674EF8016D; Tue, 16 May 2023 11:37:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C8C1AF8055A;
	Tue, 16 May 2023 11:37:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D5A7F805EE; Tue, 16 May 2023 11:36:56 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D7715F80558
	for <alsa-devel@alsa-project.org>; Tue, 16 May 2023 11:36:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7715F80558
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 2FE0E2429A;
	Tue, 16 May 2023 05:36:13 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pyr6K-q1R-00; Tue, 16 May 2023 11:36:12 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 07/10] ALSA: emu10k1: make E-MU mixer control creation more
 data-driven
Date: Tue, 16 May 2023 11:36:09 +0200
Message-Id: <20230516093612.3536508-8-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230516093612.3536508-1-oswald.buddenhagen@gmx.de>
References: <20230516093612.3536508-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: N3DMGWT6CMDJOQ3BSJ5GXYI75CEI56LM
X-Message-ID-Hash: N3DMGWT6CMDJOQ3BSJ5GXYI75CEI56LM
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The more card models are handled separately, the more code duplication
this saves.

add_emu1010_source_mixers() is factored out the save duplication in a
later commit.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emumixer.c | 108 +++++++++++++++++------------------
 1 file changed, 53 insertions(+), 55 deletions(-)

diff --git a/sound/pci/emu10k1/emumixer.c b/sound/pci/emu10k1/emumixer.c
index 26e060361949..9a59e439a533 100644
--- a/sound/pci/emu10k1/emumixer.c
+++ b/sound/pci/emu10k1/emumixer.c
@@ -368,6 +368,7 @@ static_assert(ARRAY_SIZE(emu1010_input_dflt) == ARRAY_SIZE(emu1010_input_dst));
 
 struct snd_emu1010_routing_info {
 	const char * const *src_texts;
+	const char * const *out_texts;
 	const unsigned short *src_regs;
 	const unsigned short *out_regs;
 	const unsigned short *in_regs;
@@ -386,6 +387,7 @@ const struct snd_emu1010_routing_info emu1010_routing_info[] = {
 
 		.out_dflts = emu1010_output_dflt,
 		.out_regs = emu1010_output_dst,
+		.out_texts = emu1010_output_texts,
 		.n_outs = ARRAY_SIZE(emu1010_output_dst),
 
 		.in_dflts = emu1010_input_dflt,
@@ -400,6 +402,7 @@ const struct snd_emu1010_routing_info emu1010_routing_info[] = {
 
 		.out_dflts = emu1616_output_dflt,
 		.out_regs = emu1616_output_dst,
+		.out_texts = snd_emu1616_output_texts,
 		.n_outs = ARRAY_SIZE(emu1616_output_dst),
 
 		.in_dflts = emu1010_input_dflt,
@@ -556,6 +559,21 @@ static const struct snd_kcontrol_new emu1010_input_source_ctl = {
 	.put = snd_emu1010_input_source_put
 };
 
+static int add_emu1010_source_mixers(struct snd_emu10k1 *emu)
+{
+	const struct snd_emu1010_routing_info *emu_ri =
+		&emu1010_routing_info[emu1010_idx(emu)];
+	int err;
+
+	err = add_ctls(emu, &emu1010_output_source_ctl,
+		       emu_ri->out_texts, emu_ri->n_outs);
+	if (err < 0)
+		return err;
+	err = add_ctls(emu, &emu1010_input_source_ctl,
+		       emu1010_input_texts, emu_ri->n_ins);
+	return err;
+}
+
 
 static const char * const snd_emu1010_adc_pads[] = {
 	"ADC1 14dB PAD Audio Dock Capture Switch",
@@ -668,6 +686,29 @@ static const struct snd_kcontrol_new emu1010_dac_pads_ctl = {
 };
 
 
+struct snd_emu1010_pads_info {
+	const char * const *adc_ctls, * const *dac_ctls;
+	unsigned n_adc_ctls, n_dac_ctls;
+};
+
+const struct snd_emu1010_pads_info emu1010_pads_info[] = {
+	{
+		/* all other e-mu cards for now */
+		.adc_ctls = snd_emu1010_adc_pads,
+		.n_adc_ctls = ARRAY_SIZE(snd_emu1010_adc_pads),
+		.dac_ctls = snd_emu1010_dac_pads,
+		.n_dac_ctls = ARRAY_SIZE(snd_emu1010_dac_pads),
+	},
+	{
+		/* 1616(m) cardbus */
+		.adc_ctls = snd_emu1010_adc_pads,
+		.n_adc_ctls = ARRAY_SIZE(snd_emu1010_adc_pads) - 2,
+		.dac_ctls = snd_emu1010_dac_pads,
+		.n_dac_ctls = ARRAY_SIZE(snd_emu1010_dac_pads) - 2,
+	},
+};
+
+
 static int snd_emu1010_internal_clock_info(struct snd_kcontrol *kcontrol,
 					  struct snd_ctl_elem_info *uinfo)
 {
@@ -2111,83 +2152,40 @@ int snd_emu10k1_mixer(struct snd_emu10k1 *emu,
 		unsigned i, emu_idx = emu1010_idx(emu);
 		const struct snd_emu1010_routing_info *emu_ri =
 			&emu1010_routing_info[emu_idx];
+		const struct snd_emu1010_pads_info *emu_pi = &emu1010_pads_info[emu_idx];
 
 		for (i = 0; i < emu_ri->n_ins; i++)
 			emu->emu1010.input_source[i] =
 				emu1010_map_source(emu_ri, emu_ri->in_dflts[i]);
 		for (i = 0; i < emu_ri->n_outs; i++)
 			emu->emu1010.output_source[i] =
 				emu1010_map_source(emu_ri, emu_ri->out_dflts[i]);
 		snd_emu1010_apply_sources(emu);
-	}
 
-	if (emu->card_capabilities->emu_model == EMU_MODEL_EMU1616) {
-		/* 1616(m) cardbus */
-		err = add_ctls(emu, &emu1010_output_source_ctl,
-			       snd_emu1616_output_texts,
-			       ARRAY_SIZE(snd_emu1616_output_texts));
-		if (err < 0)
-			return err;
-		err = add_ctls(emu, &emu1010_input_source_ctl,
-			       emu1010_input_texts,
-			       ARRAY_SIZE(emu1010_input_texts));
-		if (err < 0)
-			return err;
-		err = add_ctls(emu, &emu1010_adc_pads_ctl,
-			       snd_emu1010_adc_pads,
-			       ARRAY_SIZE(snd_emu1010_adc_pads) - 2);
-		if (err < 0)
-			return err;
-		err = add_ctls(emu, &emu1010_dac_pads_ctl,
-			       snd_emu1010_dac_pads,
-			       ARRAY_SIZE(snd_emu1010_dac_pads) - 2);
-		if (err < 0)
-			return err;
 		err = snd_ctl_add(card,
 			snd_ctl_new1(&snd_emu1010_internal_clock, emu));
 		if (err < 0)
 			return err;
+
+		err = add_ctls(emu, &emu1010_adc_pads_ctl,
+			       emu_pi->adc_ctls, emu_pi->n_adc_ctls);
+		if (err < 0)
+			return err;
+		err = add_ctls(emu, &emu1010_dac_pads_ctl,
+			       emu_pi->dac_ctls, emu_pi->n_dac_ctls);
+		if (err < 0)
+			return err;
+
 		err = snd_ctl_add(card,
 			snd_ctl_new1(&snd_emu1010_optical_out, emu));
 		if (err < 0)
 			return err;
 		err = snd_ctl_add(card,
 			snd_ctl_new1(&snd_emu1010_optical_in, emu));
 		if (err < 0)
 			return err;
 
-	} else if (emu->card_capabilities->emu_model) {
-		/* all other e-mu cards for now */
-		err = add_ctls(emu, &emu1010_output_source_ctl,
-			       emu1010_output_texts,
-			       ARRAY_SIZE(emu1010_output_texts));
-		if (err < 0)
-			return err;
-		err = add_ctls(emu, &emu1010_input_source_ctl,
-			       emu1010_input_texts,
-			       ARRAY_SIZE(emu1010_input_texts));
-		if (err < 0)
-			return err;
-		err = add_ctls(emu, &emu1010_adc_pads_ctl,
-			       snd_emu1010_adc_pads,
-			       ARRAY_SIZE(snd_emu1010_adc_pads));
-		if (err < 0)
-			return err;
-		err = add_ctls(emu, &emu1010_dac_pads_ctl,
-			       snd_emu1010_dac_pads,
-			       ARRAY_SIZE(snd_emu1010_dac_pads));
-		if (err < 0)
-			return err;
-		err = snd_ctl_add(card,
-			snd_ctl_new1(&snd_emu1010_internal_clock, emu));
-		if (err < 0)
-			return err;
-		err = snd_ctl_add(card,
-			snd_ctl_new1(&snd_emu1010_optical_out, emu));
-		if (err < 0)
-			return err;
-		err = snd_ctl_add(card,
-			snd_ctl_new1(&snd_emu1010_optical_in, emu));
+		err = add_emu1010_source_mixers(emu);
 		if (err < 0)
 			return err;
 	}
-- 
2.40.0.152.g15d061e6df

