Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D30B91DCFA
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 12:46:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFFAA2353;
	Mon,  1 Jul 2024 12:46:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFFAA2353
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719830787;
	bh=BMvTx/i6/pvRrx1c1537z5y7Td9l0JjjLCHRnCzvzbw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AW8gy6+UNux0GWF9Vm68b7k9XjsWhXVUuldpBXhi5u3dASq35SV/ulDSS9U444AI8
	 ued52gLP34zZifVFnPZqnrrkMxtBW6zyzUj/ieWpwn8HMIkHJTk7eys1QSNfwMLNYh
	 hxvDp3rKPXRebDuzsVHZguAOlI8V9oHWJgD00iGw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0753CF8061C; Mon,  1 Jul 2024 12:45:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D17EF80612;
	Mon,  1 Jul 2024 12:45:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71AD8F805E9; Mon,  1 Jul 2024 12:45:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 00425F8028B
	for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2024 12:44:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00425F8028B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=i2rhbVvK
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4617Qrbv017780;
	Mon, 1 Jul 2024 05:44:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=HCJm1/O8+VK/k/WKyNPdRMmVNy6vBC1EQk0Zr5Z9P2c=; b=
	i2rhbVvKbEkE3ASSUA9aUisWrrXsDDxTJYDrqPdNTyyioWlPv+xwXnlUWAfg29ZD
	QY6hDFa+k1JG7VaZ6WWiGHx6dohccVW/JEIluz/BwLNaqjJHTL+M1L5Z3KuwyGJM
	wsPLz/fBeAkEYE8j4cG3/IkEylRJ9BmPs/T68+BubeJIPo4H9OAcIss8RtifApD1
	JCH01ra5NHfUQZR9EihuN3YugPD72mRCZn0K151rCzD5LumwamA39FZHvLmx771V
	x65kTf/fN+QCVYKCQMoa6w+lxsJqo2cg7YjOtP8JxJFX5Uxo4DTNB4X2dKYDv5dM
	LrEaFdJsdrrSdx8cnvgqfQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 402fnxa3x0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 05:44:47 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 1 Jul 2024
 11:44:44 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 1 Jul 2024 11:44:44 +0100
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 9FE8A82024D;
	Mon,  1 Jul 2024 10:44:44 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>
Subject: [PATCH 1/3] ASoC: cs35l56: Revert support for dual-ownership of ASP
 registers
Date: Mon, 1 Jul 2024 11:44:42 +0100
Message-ID: <20240701104444.172556-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240701104444.172556-1-rf@opensource.cirrus.com>
References: <20240701104444.172556-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: vEIB8zUQmljk-V0u7FTlmaIv4Y1s7dRf
X-Proofpoint-ORIG-GUID: vEIB8zUQmljk-V0u7FTlmaIv4Y1s7dRf
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: SP5NPSDHWIO6FGX6LPMXFTK67QQEBRNU
X-Message-ID-Hash: SP5NPSDHWIO6FGX6LPMXFTK67QQEBRNU
X-MailFrom: prvs=4912873e61=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SP5NPSDHWIO6FGX6LPMXFTK67QQEBRNU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch reverts a series of commits that allowed for the ASP
registers to be owned by either the driver or the firmware. Nothing
currently depends on the functionality that is being reverted, so
it is safe to remove.

The commits being reverted are (last 3 are bugfixes to the first 2):
commit 72a77d7631c6
("ASoC: cs35l56: Fix to ensure ASP1 registers match cache")
commit 07f7d6e7a124
("ASoC: cs35l56: Fix for initializing ASP1 mixer registers")
commit 4703b014f28b
("ASoC: cs35l56: fix reversed if statement in cs35l56_dspwait_asp1tx_put()")
commit c14f09f010cc
("ASoC: cs35l56: Fix deadlock in ASP1 mixer register initialization")
commit dfd2ffb37399
("ASoC: cs35l56: Prevent overwriting firmware ASP config")

These reverts have been squashed into a single commit because there
would be no reason to revert only some of them (which would just
reintroduce bugs).

The changes introduced by the commits were well-intentioned but
somewhat misguided. ACPI does not provide any information about how
audio hardware is linked together, so that information has to be
hardcoded into drivers. On Windows the firmware is customized to
statically setup appropriate configuration of the audio links,
and the intent of the commits was to re-use this information if the
Linux host drivers aren't taking control of the ASP. This would
avoid having to hardcode the ASP config into the machine driver on
some systems.

However, this added complexity and race conditions into the driver.
It also complicates implementation of new code.

The only case where the ASP is used but the host is not taking
ownership is when CS35L56 is used in SoundWire mode with the ASP
as a reference audio interconnect. But even in that case it's not
necessarily required even if the firmware initialized it. Typically
it is used to avoid the host SDCA drivers having to be capable of
aggregating capture paths from multiple SoundWire peripherals. But
the SOF SoundWire support is capable of doing that aggregation.

Reverting all these commits significantly simplifies the driver.
Let's just use the normal Linux mechanisms of the machine driver and
ALSA controls to set things up instead of trying to use the firmware
to do use-case setup.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 include/sound/cs35l56.h           |   9 +-
 sound/soc/codecs/cs35l56-shared.c | 101 ++++-----------
 sound/soc/codecs/cs35l56.c        | 205 ++----------------------------
 sound/soc/codecs/cs35l56.h        |   1 -
 4 files changed, 43 insertions(+), 273 deletions(-)

diff --git a/include/sound/cs35l56.h b/include/sound/cs35l56.h
index 1a3c6f66f620..2e19722989f7 100644
--- a/include/sound/cs35l56.h
+++ b/include/sound/cs35l56.h
@@ -267,13 +267,18 @@ struct cs35l56_base {
 	bool fw_patched;
 	bool secured;
 	bool can_hibernate;
-	bool fw_owns_asp1;
 	bool cal_data_valid;
 	s8 cal_index;
 	struct cirrus_amp_cal_data cal_data;
 	struct gpio_desc *reset_gpio;
 };
 
+/* Temporary to avoid a build break with the HDA driver */
+static inline int cs35l56_force_sync_asp1_registers_from_cache(struct cs35l56_base *cs35l56_base)
+{
+	return 0;
+}
+
 extern struct regmap_config cs35l56_regmap_i2c;
 extern struct regmap_config cs35l56_regmap_spi;
 extern struct regmap_config cs35l56_regmap_sdw;
@@ -284,8 +289,6 @@ extern const char * const cs35l56_tx_input_texts[CS35L56_NUM_INPUT_SRC];
 extern const unsigned int cs35l56_tx_input_values[CS35L56_NUM_INPUT_SRC];
 
 int cs35l56_set_patch(struct cs35l56_base *cs35l56_base);
-int cs35l56_init_asp1_regs_for_driver_control(struct cs35l56_base *cs35l56_base);
-int cs35l56_force_sync_asp1_registers_from_cache(struct cs35l56_base *cs35l56_base);
 int cs35l56_mbox_send(struct cs35l56_base *cs35l56_base, unsigned int command);
 int cs35l56_firmware_shutdown(struct cs35l56_base *cs35l56_base);
 int cs35l56_wait_for_firmware_boot(struct cs35l56_base *cs35l56_base);
diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index 880228f89baf..035d7c3c4683 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -20,6 +20,18 @@ static const struct reg_sequence cs35l56_patch[] = {
 	 * Firmware can change these to non-defaults to satisfy SDCA.
 	 * Ensure that they are at known defaults.
 	 */
+	{ CS35L56_ASP1_ENABLES1,		0x00000000 },
+	{ CS35L56_ASP1_CONTROL1,		0x00000028 },
+	{ CS35L56_ASP1_CONTROL2,		0x18180200 },
+	{ CS35L56_ASP1_CONTROL3,		0x00000002 },
+	{ CS35L56_ASP1_FRAME_CONTROL1,		0x03020100 },
+	{ CS35L56_ASP1_FRAME_CONTROL5,		0x00020100 },
+	{ CS35L56_ASP1_DATA_CONTROL1,		0x00000018 },
+	{ CS35L56_ASP1_DATA_CONTROL5,		0x00000018 },
+	{ CS35L56_ASP1TX1_INPUT,		0x00000000 },
+	{ CS35L56_ASP1TX2_INPUT,		0x00000000 },
+	{ CS35L56_ASP1TX3_INPUT,		0x00000000 },
+	{ CS35L56_ASP1TX4_INPUT,		0x00000000 },
 	{ CS35L56_SWIRE_DP3_CH1_INPUT,		0x00000018 },
 	{ CS35L56_SWIRE_DP3_CH2_INPUT,		0x00000019 },
 	{ CS35L56_SWIRE_DP3_CH3_INPUT,		0x00000029 },
@@ -41,12 +53,18 @@ EXPORT_SYMBOL_NS_GPL(cs35l56_set_patch, SND_SOC_CS35L56_SHARED);
 static const struct reg_default cs35l56_reg_defaults[] = {
 	/* no defaults for OTP_MEM - first read populates cache */
 
-	/*
-	 * No defaults for ASP1 control or ASP1TX mixer. See
-	 * cs35l56_populate_asp1_register_defaults() and
-	 * cs35l56_sync_asp1_mixer_widgets_with_firmware().
-	 */
-
+	{ CS35L56_ASP1_ENABLES1,		0x00000000 },
+	{ CS35L56_ASP1_CONTROL1,		0x00000028 },
+	{ CS35L56_ASP1_CONTROL2,		0x18180200 },
+	{ CS35L56_ASP1_CONTROL3,		0x00000002 },
+	{ CS35L56_ASP1_FRAME_CONTROL1,		0x03020100 },
+	{ CS35L56_ASP1_FRAME_CONTROL5,		0x00020100 },
+	{ CS35L56_ASP1_DATA_CONTROL1,		0x00000018 },
+	{ CS35L56_ASP1_DATA_CONTROL5,		0x00000018 },
+	{ CS35L56_ASP1TX1_INPUT,		0x00000000 },
+	{ CS35L56_ASP1TX2_INPUT,		0x00000000 },
+	{ CS35L56_ASP1TX3_INPUT,		0x00000000 },
+	{ CS35L56_ASP1TX4_INPUT,		0x00000000 },
 	{ CS35L56_SWIRE_DP3_CH1_INPUT,		0x00000018 },
 	{ CS35L56_SWIRE_DP3_CH2_INPUT,		0x00000019 },
 	{ CS35L56_SWIRE_DP3_CH3_INPUT,		0x00000029 },
@@ -206,77 +224,6 @@ static bool cs35l56_volatile_reg(struct device *dev, unsigned int reg)
 	}
 }
 
-static const struct reg_sequence cs35l56_asp1_defaults[] = {
-	REG_SEQ0(CS35L56_ASP1_ENABLES1,		0x00000000),
-	REG_SEQ0(CS35L56_ASP1_CONTROL1,		0x00000028),
-	REG_SEQ0(CS35L56_ASP1_CONTROL2,		0x18180200),
-	REG_SEQ0(CS35L56_ASP1_CONTROL3,		0x00000002),
-	REG_SEQ0(CS35L56_ASP1_FRAME_CONTROL1,	0x03020100),
-	REG_SEQ0(CS35L56_ASP1_FRAME_CONTROL5,	0x00020100),
-	REG_SEQ0(CS35L56_ASP1_DATA_CONTROL1,	0x00000018),
-	REG_SEQ0(CS35L56_ASP1_DATA_CONTROL5,	0x00000018),
-	REG_SEQ0(CS35L56_ASP1TX1_INPUT,		0x00000000),
-	REG_SEQ0(CS35L56_ASP1TX2_INPUT,		0x00000000),
-	REG_SEQ0(CS35L56_ASP1TX3_INPUT,		0x00000000),
-	REG_SEQ0(CS35L56_ASP1TX4_INPUT,		0x00000000),
-};
-
-/*
- * The firmware can have control of the ASP so we don't provide regmap
- * with defaults for these registers, to prevent a regcache_sync() from
- * overwriting the firmware settings. But if the machine driver hooks up
- * the ASP it means the driver is taking control of the ASP, so then the
- * registers are populated with the defaults.
- */
-int cs35l56_init_asp1_regs_for_driver_control(struct cs35l56_base *cs35l56_base)
-{
-	if (!cs35l56_base->fw_owns_asp1)
-		return 0;
-
-	cs35l56_base->fw_owns_asp1 = false;
-
-	return regmap_multi_reg_write(cs35l56_base->regmap, cs35l56_asp1_defaults,
-				      ARRAY_SIZE(cs35l56_asp1_defaults));
-}
-EXPORT_SYMBOL_NS_GPL(cs35l56_init_asp1_regs_for_driver_control, SND_SOC_CS35L56_SHARED);
-
-/*
- * The firmware boot sequence can overwrite the ASP1 config registers so that
- * they don't match regmap's view of their values. Rewrite the values from the
- * regmap cache into the hardware registers.
- */
-int cs35l56_force_sync_asp1_registers_from_cache(struct cs35l56_base *cs35l56_base)
-{
-	struct reg_sequence asp1_regs[ARRAY_SIZE(cs35l56_asp1_defaults)];
-	int i, ret;
-
-	if (cs35l56_base->fw_owns_asp1)
-		return 0;
-
-	memcpy(asp1_regs, cs35l56_asp1_defaults, sizeof(asp1_regs));
-
-	/* Read current values from regmap cache into the write sequence */
-	for (i = 0; i < ARRAY_SIZE(asp1_regs); ++i) {
-		ret = regmap_read(cs35l56_base->regmap, asp1_regs[i].reg, &asp1_regs[i].def);
-		if (ret)
-			goto err;
-	}
-
-	/* Write the values cache-bypassed so that they will be written to silicon */
-	ret = regmap_multi_reg_write_bypassed(cs35l56_base->regmap, asp1_regs,
-					      ARRAY_SIZE(asp1_regs));
-	if (ret)
-		goto err;
-
-	return 0;
-
-err:
-	dev_err(cs35l56_base->dev, "Failed to sync ASP1 registers: %d\n", ret);
-
-	return ret;
-}
-EXPORT_SYMBOL_NS_GPL(cs35l56_force_sync_asp1_registers_from_cache, SND_SOC_CS35L56_SHARED);
-
 int cs35l56_mbox_send(struct cs35l56_base *cs35l56_base, unsigned int command)
 {
 	unsigned int val;
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 758dfdf9d3ea..7cac9812f5b5 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -63,131 +63,6 @@ static int cs35l56_dspwait_put_volsw(struct snd_kcontrol *kcontrol,
 	return snd_soc_put_volsw(kcontrol, ucontrol);
 }
 
-static const unsigned short cs35l56_asp1_mixer_regs[] = {
-	CS35L56_ASP1TX1_INPUT, CS35L56_ASP1TX2_INPUT,
-	CS35L56_ASP1TX3_INPUT, CS35L56_ASP1TX4_INPUT,
-};
-
-static const char * const cs35l56_asp1_mux_control_names[] = {
-	"ASP1 TX1 Source", "ASP1 TX2 Source", "ASP1 TX3 Source", "ASP1 TX4 Source"
-};
-
-static int cs35l56_sync_asp1_mixer_widgets_with_firmware(struct cs35l56_private *cs35l56)
-{
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(cs35l56->component);
-	const char *prefix = cs35l56->component->name_prefix;
-	char full_name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
-	const char *name;
-	struct snd_kcontrol *kcontrol;
-	struct soc_enum *e;
-	unsigned int val[4];
-	int i, item, ret;
-
-	if (cs35l56->asp1_mixer_widgets_initialized)
-		return 0;
-
-	/*
-	 * Resume so we can read the registers from silicon if the regmap
-	 * cache has not yet been populated.
-	 */
-	ret = pm_runtime_resume_and_get(cs35l56->base.dev);
-	if (ret < 0)
-		return ret;
-
-	/* Wait for firmware download and reboot */
-	cs35l56_wait_dsp_ready(cs35l56);
-
-	ret = regmap_bulk_read(cs35l56->base.regmap, CS35L56_ASP1TX1_INPUT,
-			       val, ARRAY_SIZE(val));
-
-	pm_runtime_mark_last_busy(cs35l56->base.dev);
-	pm_runtime_put_autosuspend(cs35l56->base.dev);
-
-	if (ret) {
-		dev_err(cs35l56->base.dev, "Failed to read ASP1 mixer regs: %d\n", ret);
-		return ret;
-	}
-
-	for (i = 0; i < ARRAY_SIZE(cs35l56_asp1_mux_control_names); ++i) {
-		name = cs35l56_asp1_mux_control_names[i];
-
-		if (prefix) {
-			snprintf(full_name, sizeof(full_name), "%s %s", prefix, name);
-			name = full_name;
-		}
-
-		kcontrol = snd_soc_card_get_kcontrol_locked(dapm->card, name);
-		if (!kcontrol) {
-			dev_warn(cs35l56->base.dev, "Could not find control %s\n", name);
-			continue;
-		}
-
-		e = (struct soc_enum *)kcontrol->private_value;
-		item = snd_soc_enum_val_to_item(e, val[i] & CS35L56_ASP_TXn_SRC_MASK);
-		snd_soc_dapm_mux_update_power(dapm, kcontrol, item, e, NULL);
-	}
-
-	cs35l56->asp1_mixer_widgets_initialized = true;
-
-	return 0;
-}
-
-static int cs35l56_dspwait_asp1tx_get(struct snd_kcontrol *kcontrol,
-				      struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component = snd_soc_dapm_kcontrol_component(kcontrol);
-	struct cs35l56_private *cs35l56 = snd_soc_component_get_drvdata(component);
-	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
-	int index = e->shift_l;
-	unsigned int addr, val;
-	int ret;
-
-	ret = cs35l56_sync_asp1_mixer_widgets_with_firmware(cs35l56);
-	if (ret)
-		return ret;
-
-	addr = cs35l56_asp1_mixer_regs[index];
-	ret = regmap_read(cs35l56->base.regmap, addr, &val);
-	if (ret)
-		return ret;
-
-	val &= CS35L56_ASP_TXn_SRC_MASK;
-	ucontrol->value.enumerated.item[0] = snd_soc_enum_val_to_item(e, val);
-
-	return 0;
-}
-
-static int cs35l56_dspwait_asp1tx_put(struct snd_kcontrol *kcontrol,
-				      struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component = snd_soc_dapm_kcontrol_component(kcontrol);
-	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
-	struct cs35l56_private *cs35l56 = snd_soc_component_get_drvdata(component);
-	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
-	int item = ucontrol->value.enumerated.item[0];
-	int index = e->shift_l;
-	unsigned int addr, val;
-	bool changed;
-	int ret;
-
-	ret = cs35l56_sync_asp1_mixer_widgets_with_firmware(cs35l56);
-	if (ret)
-		return ret;
-
-	addr = cs35l56_asp1_mixer_regs[index];
-	val = snd_soc_enum_item_to_val(e, item);
-
-	ret = regmap_update_bits_check(cs35l56->base.regmap, addr,
-				       CS35L56_ASP_TXn_SRC_MASK, val, &changed);
-	if (ret)
-		return ret;
-
-	if (changed)
-		snd_soc_dapm_mux_update_power(dapm, kcontrol, item, e, NULL);
-
-	return changed;
-}
-
 static DECLARE_TLV_DB_SCALE(vol_tlv, -10000, 25, 0);
 
 static const struct snd_kcontrol_new cs35l56_controls[] = {
@@ -206,44 +81,40 @@ static const struct snd_kcontrol_new cs35l56_controls[] = {
 };
 
 static SOC_VALUE_ENUM_SINGLE_DECL(cs35l56_asp1tx1_enum,
-				  SND_SOC_NOPM,
-				  0, 0,
+				  CS35L56_ASP1TX1_INPUT,
+				  0, CS35L56_ASP_TXn_SRC_MASK,
 				  cs35l56_tx_input_texts,
 				  cs35l56_tx_input_values);
 
 static const struct snd_kcontrol_new asp1_tx1_mux =
-	SOC_DAPM_ENUM_EXT("ASP1TX1 SRC", cs35l56_asp1tx1_enum,
-			  cs35l56_dspwait_asp1tx_get, cs35l56_dspwait_asp1tx_put);
+	SOC_DAPM_ENUM("ASP1TX1 SRC", cs35l56_asp1tx1_enum);
 
 static SOC_VALUE_ENUM_SINGLE_DECL(cs35l56_asp1tx2_enum,
-				  SND_SOC_NOPM,
-				  1, 0,
+				  CS35L56_ASP1TX2_INPUT,
+				  0, CS35L56_ASP_TXn_SRC_MASK,
 				  cs35l56_tx_input_texts,
 				  cs35l56_tx_input_values);
 
 static const struct snd_kcontrol_new asp1_tx2_mux =
-	SOC_DAPM_ENUM_EXT("ASP1TX2 SRC", cs35l56_asp1tx2_enum,
-			  cs35l56_dspwait_asp1tx_get, cs35l56_dspwait_asp1tx_put);
+	SOC_DAPM_ENUM("ASP1TX2 SRC", cs35l56_asp1tx2_enum);
 
 static SOC_VALUE_ENUM_SINGLE_DECL(cs35l56_asp1tx3_enum,
-				  SND_SOC_NOPM,
-				  2, 0,
+				  CS35L56_ASP1TX3_INPUT,
+				  0, CS35L56_ASP_TXn_SRC_MASK,
 				  cs35l56_tx_input_texts,
 				  cs35l56_tx_input_values);
 
 static const struct snd_kcontrol_new asp1_tx3_mux =
-	SOC_DAPM_ENUM_EXT("ASP1TX3 SRC", cs35l56_asp1tx3_enum,
-			  cs35l56_dspwait_asp1tx_get, cs35l56_dspwait_asp1tx_put);
+	SOC_DAPM_ENUM("ASP1TX3 SRC", cs35l56_asp1tx3_enum);
 
 static SOC_VALUE_ENUM_SINGLE_DECL(cs35l56_asp1tx4_enum,
-				  SND_SOC_NOPM,
-				  3, 0,
+				  CS35L56_ASP1TX4_INPUT,
+				  0, CS35L56_ASP_TXn_SRC_MASK,
 				  cs35l56_tx_input_texts,
 				  cs35l56_tx_input_values);
 
 static const struct snd_kcontrol_new asp1_tx4_mux =
-	SOC_DAPM_ENUM_EXT("ASP1TX4 SRC", cs35l56_asp1tx4_enum,
-			  cs35l56_dspwait_asp1tx_get, cs35l56_dspwait_asp1tx_put);
+	SOC_DAPM_ENUM("ASP1TX4 SRC", cs35l56_asp1tx4_enum);
 
 static SOC_VALUE_ENUM_SINGLE_DECL(cs35l56_sdw1tx1_enum,
 				CS35L56_SWIRE_DP3_CH1_INPUT,
@@ -281,21 +152,6 @@ static SOC_VALUE_ENUM_SINGLE_DECL(cs35l56_sdw1tx4_enum,
 static const struct snd_kcontrol_new sdw1_tx4_mux =
 	SOC_DAPM_ENUM("SDW1TX4 SRC", cs35l56_sdw1tx4_enum);
 
-static int cs35l56_asp1_cfg_event(struct snd_soc_dapm_widget *w,
-				  struct snd_kcontrol *kcontrol, int event)
-{
-	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
-	struct cs35l56_private *cs35l56 = snd_soc_component_get_drvdata(component);
-
-	switch (event) {
-	case SND_SOC_DAPM_PRE_PMU:
-		/* Override register values set by firmware boot */
-		return cs35l56_force_sync_asp1_registers_from_cache(&cs35l56->base);
-	default:
-		return 0;
-	}
-}
-
 static int cs35l56_play_event(struct snd_soc_dapm_widget *w,
 			      struct snd_kcontrol *kcontrol, int event)
 {
@@ -332,9 +188,6 @@ static const struct snd_soc_dapm_widget cs35l56_dapm_widgets[] = {
 	SND_SOC_DAPM_REGULATOR_SUPPLY("VDD_B", 0, 0),
 	SND_SOC_DAPM_REGULATOR_SUPPLY("VDD_AMP", 0, 0),
 
-	SND_SOC_DAPM_SUPPLY("ASP1 CFG", SND_SOC_NOPM, 0, 0, cs35l56_asp1_cfg_event,
-			    SND_SOC_DAPM_PRE_PMU),
-
 	SND_SOC_DAPM_SUPPLY("PLAY", SND_SOC_NOPM, 0, 0, cs35l56_play_event,
 			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
 
@@ -402,9 +255,6 @@ static const struct snd_soc_dapm_route cs35l56_audio_map[] = {
 	{ "AMP", NULL, "VDD_B" },
 	{ "AMP", NULL, "VDD_AMP" },
 
-	{ "ASP1 Playback", NULL, "ASP1 CFG" },
-	{ "ASP1 Capture", NULL, "ASP1 CFG" },
-
 	{ "ASP1 Playback", NULL, "PLAY" },
 	{ "SDW1 Playback", NULL, "PLAY" },
 
@@ -455,14 +305,9 @@ static int cs35l56_asp_dai_set_fmt(struct snd_soc_dai *codec_dai, unsigned int f
 {
 	struct cs35l56_private *cs35l56 = snd_soc_component_get_drvdata(codec_dai->component);
 	unsigned int val;
-	int ret;
 
 	dev_dbg(cs35l56->base.dev, "%s: %#x\n", __func__, fmt);
 
-	ret = cs35l56_init_asp1_regs_for_driver_control(&cs35l56->base);
-	if (ret)
-		return ret;
-
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
 	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
@@ -536,11 +381,6 @@ static int cs35l56_asp_dai_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx
 					unsigned int rx_mask, int slots, int slot_width)
 {
 	struct cs35l56_private *cs35l56 = snd_soc_component_get_drvdata(dai->component);
-	int ret;
-
-	ret = cs35l56_init_asp1_regs_for_driver_control(&cs35l56->base);
-	if (ret)
-		return ret;
 
 	if ((slots == 0) || (slot_width == 0)) {
 		dev_dbg(cs35l56->base.dev, "tdm config cleared\n");
@@ -589,11 +429,6 @@ static int cs35l56_asp_dai_hw_params(struct snd_pcm_substream *substream,
 	struct cs35l56_private *cs35l56 = snd_soc_component_get_drvdata(dai->component);
 	unsigned int rate = params_rate(params);
 	u8 asp_width, asp_wl;
-	int ret;
-
-	ret = cs35l56_init_asp1_regs_for_driver_control(&cs35l56->base);
-	if (ret)
-		return ret;
 
 	asp_wl = params_width(params);
 	if (cs35l56->asp_slot_width)
@@ -650,11 +485,7 @@ static int cs35l56_asp_dai_set_sysclk(struct snd_soc_dai *dai,
 				      int clk_id, unsigned int freq, int dir)
 {
 	struct cs35l56_private *cs35l56 = snd_soc_component_get_drvdata(dai->component);
-	int freq_id, ret;
-
-	ret = cs35l56_init_asp1_regs_for_driver_control(&cs35l56->base);
-	if (ret)
-		return ret;
+	int freq_id;
 
 	if (freq == 0) {
 		cs35l56->sysclk_set = false;
@@ -1035,13 +866,6 @@ static int cs35l56_component_probe(struct snd_soc_component *component)
 	debugfs_create_bool("can_hibernate", 0444, debugfs_root, &cs35l56->base.can_hibernate);
 	debugfs_create_bool("fw_patched", 0444, debugfs_root, &cs35l56->base.fw_patched);
 
-	/*
-	 * The widgets for the ASP1TX mixer can't be initialized
-	 * until the firmware has been downloaded and rebooted.
-	 */
-	regcache_drop_region(cs35l56->base.regmap, CS35L56_ASP1TX1_INPUT, CS35L56_ASP1TX4_INPUT);
-	cs35l56->asp1_mixer_widgets_initialized = false;
-
 	queue_work(cs35l56->dsp_wq, &cs35l56->dsp_work);
 
 	return 0;
@@ -1432,9 +1256,6 @@ int cs35l56_common_probe(struct cs35l56_private *cs35l56)
 	cs35l56->base.cal_index = -1;
 	cs35l56->speaker_id = -ENOENT;
 
-	/* Assume that the firmware owns ASP1 until we know different */
-	cs35l56->base.fw_owns_asp1 = true;
-
 	dev_set_drvdata(cs35l56->base.dev, cs35l56);
 
 	cs35l56_fill_supply_names(cs35l56->supplies);
diff --git a/sound/soc/codecs/cs35l56.h b/sound/soc/codecs/cs35l56.h
index b000e7365e40..200f695efca3 100644
--- a/sound/soc/codecs/cs35l56.h
+++ b/sound/soc/codecs/cs35l56.h
@@ -51,7 +51,6 @@ struct cs35l56_private {
 	u8 asp_slot_count;
 	bool tdm_mode;
 	bool sysclk_set;
-	bool asp1_mixer_widgets_initialized;
 	u8 old_sdw_clock_scale;
 };
 
-- 
2.39.2

