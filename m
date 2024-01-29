Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAA4840B88
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jan 2024 17:32:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD4D8210;
	Mon, 29 Jan 2024 17:32:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD4D8210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706545949;
	bh=IheahSJ5pZDyJHeh2vQaF9QieXomQ/EZmA8SfLYgLlM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Zf9JfVdHFTi14op1zYkMpB0c88TEzI/BY2D0ti+UPTCP4tLI6gn9e8tck6QljLZb9
	 Vx7W/Fi5W0yzNblQ1yqLIGfKGVzCJetjvK8PozQvLysYK5SZoXlgZs/BYej4/YLAXm
	 J0z5mqWBP40vUvAAhEKJ0RkbZ/RsKxlMYdcVcjJc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A61DF80856; Mon, 29 Jan 2024 17:29:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F41B7F808C4;
	Mon, 29 Jan 2024 17:29:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 752DFF806B5; Mon, 29 Jan 2024 17:28:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5203AF8059F
	for <alsa-devel@alsa-project.org>; Mon, 29 Jan 2024 17:27:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5203AF8059F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=pGfC5qfH
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40T5fM0H006968;
	Mon, 29 Jan 2024 10:27:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=lC1UKIEVkahfF2TN2WxdAFipqWeA28oaULEu5J51mKw=; b=
	pGfC5qfHgPLsge+lAwAHe8EeWQ/ECpHTh1VLZJWr+lISmMi1DpCCB8ntjHt/GLB+
	pQ8ykJ6sleszUk6AqxY7wg5CV85uPc7/cPp2Sr2knY6KespqilNkjJC8LOgHkj7g
	nm2JYrflf/meJCxIbXEO0NNUBAAa4AObgeXxcIwQBtP3XFzoTF5whsutJirYaHne
	0qtBUe58nCmBjGzNTy/UQ7pucyjr2qEcRbD9jLRcuP8GsC6X1UPxg1ZStzJS2QhH
	59Cla/r7A70xR4BTtY9j/cppPDsgV700mLk5SRAJVAVf9nan3myESbNOLZIQa8Br
	5XQPD5FXG95Y1lE42Q6inA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3vvy4nta8p-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 10:27:55 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 29 Jan
 2024 16:27:44 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Mon, 29 Jan 2024 16:27:44 +0000
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.64.204])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id CAFF5820247;
	Mon, 29 Jan 2024 16:27:43 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>
Subject: [PATCH 07/18] ASoC: cs35l56: Fix to ensure ASP1 registers match cache
Date: Mon, 29 Jan 2024 16:27:26 +0000
Message-ID: <20240129162737.497-8-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240129162737.497-1-rf@opensource.cirrus.com>
References: <20240129162737.497-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: EnTpuE158EIT4QMYhyeE2EKHy7Y19WqZ
X-Proofpoint-GUID: EnTpuE158EIT4QMYhyeE2EKHy7Y19WqZ
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: MGGHZG3B3THNXUHB2VN2MYGWC45H6VYJ
X-Message-ID-Hash: MGGHZG3B3THNXUHB2VN2MYGWC45H6VYJ
X-MailFrom: prvs=97580788b4=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MGGHZG3B3THNXUHB2VN2MYGWC45H6VYJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a dummy SUPPLY widget connected to the ASP that forces the
chip registers to match the regmap cache when the ASP is
powered-up.

On a SoundWire system the ASP is free for use as a chip-to-chip
interconnect. This can be either for the firmware on multiple
CS35L56 to share reference audio; or as a bridge to another
device. If it is a firmware interconnect it is owned by the
firmware and the Linux driver should avoid writing the registers.
However. If it is a bridge then Linux may take over and handle
it as a normal codec-to-codec link.

CS35L56 is designed for SDCA and a generic SDCA driver would
know nothing about these chip-specific registers. So if the
ASP is being used on a SoundWire system the firmware sets up the
ASP registers. This means that we can't assume the default
state of the ASP registers. But we don't know the initial state
that the firmware set them to until after the firmware has been
downloaded and booted, which can take several seconds when
downloading multiple amps.

To avoid blocking probe() for several seconds waiting for the
firmware, the silicon defaults are assumed. This allows the machine
driver to setup the ASP configuration during probe() without being
blocked. If the ASP is hooked up and used, the SUPPLY widget
ensures that the chip registers match what was configured in the
regmap cache.

If the machine driver does not hook up the ASP, it is assumed that
it won't call any functions to configure the ASP DAI. Therefore
the regmap cache will be clean for these registers so a
regcache_sync() will not overwrite the chip registers. If the
DAI is not hooked up, the dummy SUPPLY widget will not be
invoked so it will never force-overwrite the chip registers.

Backport note:
This won't apply cleanly to kernels older than v6.6.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: e49611252900 ("ASoC: cs35l56: Add driver for Cirrus Logic CS35L56")
---
 include/sound/cs35l56.h           |  1 +
 sound/soc/codecs/cs35l56-shared.c | 41 +++++++++++++++++++++++++++++++
 sound/soc/codecs/cs35l56.c        | 21 ++++++++++++++++
 3 files changed, 63 insertions(+)

diff --git a/include/sound/cs35l56.h b/include/sound/cs35l56.h
index 8c18e8b6d27d..4db36c893d9d 100644
--- a/include/sound/cs35l56.h
+++ b/include/sound/cs35l56.h
@@ -272,6 +272,7 @@ extern const char * const cs35l56_tx_input_texts[CS35L56_NUM_INPUT_SRC];
 extern const unsigned int cs35l56_tx_input_values[CS35L56_NUM_INPUT_SRC];
 
 int cs35l56_set_patch(struct cs35l56_base *cs35l56_base);
+int cs35l56_force_sync_asp1_registers_from_cache(struct cs35l56_base *cs35l56_base);
 int cs35l56_mbox_send(struct cs35l56_base *cs35l56_base, unsigned int command);
 int cs35l56_firmware_shutdown(struct cs35l56_base *cs35l56_base);
 int cs35l56_wait_for_firmware_boot(struct cs35l56_base *cs35l56_base);
diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index 0cd572de73a9..35789ffc63af 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -195,6 +195,47 @@ static bool cs35l56_volatile_reg(struct device *dev, unsigned int reg)
 	}
 }
 
+/*
+ * The firmware boot sequence can overwrite the ASP1 config registers so that
+ * they don't match regmap's view of their values. Rewrite the values from the
+ * regmap cache into the hardware registers.
+ */
+int cs35l56_force_sync_asp1_registers_from_cache(struct cs35l56_base *cs35l56_base)
+{
+	struct reg_sequence asp1_regs[] = {
+		{ .reg = CS35L56_ASP1_ENABLES1 },
+		{ .reg = CS35L56_ASP1_CONTROL1 },
+		{ .reg = CS35L56_ASP1_CONTROL2 },
+		{ .reg = CS35L56_ASP1_CONTROL3 },
+		{ .reg = CS35L56_ASP1_FRAME_CONTROL1 },
+		{ .reg = CS35L56_ASP1_FRAME_CONTROL5 },
+		{ .reg = CS35L56_ASP1_DATA_CONTROL1 },
+		{ .reg = CS35L56_ASP1_DATA_CONTROL5 },
+	};
+	int i, ret;
+
+	/* Read values from regmap cache into a write sequence */
+	for (i = 0; i < ARRAY_SIZE(asp1_regs); ++i) {
+		ret = regmap_read(cs35l56_base->regmap, asp1_regs[i].reg, &asp1_regs[i].def);
+		if (ret)
+			goto err;
+	}
+
+	/* Write the values cache-bypassed so that they will be written to silicon */
+	ret = regmap_multi_reg_write_bypassed(cs35l56_base->regmap, asp1_regs,
+					      ARRAY_SIZE(asp1_regs));
+	if (ret)
+		goto err;
+
+	return 0;
+
+err:
+	dev_err(cs35l56_base->dev, "Failed to sync ASP1 registers: %d\n", ret);
+
+	return ret;
+}
+EXPORT_SYMBOL_NS_GPL(cs35l56_force_sync_asp1_registers_from_cache, SND_SOC_CS35L56_SHARED);
+
 int cs35l56_mbox_send(struct cs35l56_base *cs35l56_base, unsigned int command)
 {
 	unsigned int val;
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index ea5d2b2eb82a..41aa79848b15 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -148,6 +148,21 @@ static SOC_VALUE_ENUM_SINGLE_DECL(cs35l56_sdw1tx4_enum,
 static const struct snd_kcontrol_new sdw1_tx4_mux =
 	SOC_DAPM_ENUM("SDW1TX4 SRC", cs35l56_sdw1tx4_enum);
 
+static int cs35l56_asp1_cfg_event(struct snd_soc_dapm_widget *w,
+				  struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct cs35l56_private *cs35l56 = snd_soc_component_get_drvdata(component);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		/* Override register values set by firmware boot */
+		return cs35l56_force_sync_asp1_registers_from_cache(&cs35l56->base);
+	default:
+		return 0;
+	}
+}
+
 static int cs35l56_play_event(struct snd_soc_dapm_widget *w,
 			      struct snd_kcontrol *kcontrol, int event)
 {
@@ -184,6 +199,9 @@ static const struct snd_soc_dapm_widget cs35l56_dapm_widgets[] = {
 	SND_SOC_DAPM_REGULATOR_SUPPLY("VDD_B", 0, 0),
 	SND_SOC_DAPM_REGULATOR_SUPPLY("VDD_AMP", 0, 0),
 
+	SND_SOC_DAPM_SUPPLY("ASP1 CFG", SND_SOC_NOPM, 0, 0, cs35l56_asp1_cfg_event,
+			    SND_SOC_DAPM_PRE_PMU),
+
 	SND_SOC_DAPM_SUPPLY("PLAY", SND_SOC_NOPM, 0, 0, cs35l56_play_event,
 			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
 
@@ -251,6 +269,9 @@ static const struct snd_soc_dapm_route cs35l56_audio_map[] = {
 	{ "AMP", NULL, "VDD_B" },
 	{ "AMP", NULL, "VDD_AMP" },
 
+	{ "ASP1 Playback", NULL, "ASP1 CFG" },
+	{ "ASP1 Capture", NULL, "ASP1 CFG" },
+
 	{ "ASP1 Playback", NULL, "PLAY" },
 	{ "SDW1 Playback", NULL, "PLAY" },
 
-- 
2.39.2

