Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A17C07A7D7
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2019 14:11:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 208B117BB;
	Tue, 30 Jul 2019 14:11:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 208B117BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564488715;
	bh=g7NGJhmYGFzjsLFqSpZTagwSE+ki0sw4c7jrIej8jtM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SEn5JWBrDigfRjP9+YYBrNtjCNNRdWp1qXAo+ddettaQ46LC/FVH3cAQyMiLvuIPZ
	 w6sWdN9Ms1JIvtIDgNQh7LKL3UB8nqw9fc1u/XzVBTkz2bLTdrtAWLE+dakEvT/UYg
	 NtWB0kkDaD9Xpwui+j/Y1r4oYkNCSczcpu30p/UI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B84FF804CA;
	Tue, 30 Jul 2019 14:10:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54914F80482; Tue, 30 Jul 2019 14:10:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1AFC2F800BF
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 14:10:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AFC2F800BF
Received: from [167.98.27.226] (helo=ct-lt-1124.office.codethink.co.uk)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1hsQwr-0003E4-LE; Tue, 30 Jul 2019 13:09:45 +0100
From: Thomas Preston <thomas.preston@codethink.co.uk>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Paul Cercueil <paul@crapouillou.net>,
 Kirill Marinushkin <kmarinushkin@birdec.tech>,
 Cheng-Yi Chiang <cychiang@chromium.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Vinod Koul <vkoul@kernel.org>, Annaliese McDermond <nh6z@nh6z.net>,
 Thomas Preston <thomas.preston@codethink.co.uk>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Tue, 30 Jul 2019 13:09:37 +0100
Message-Id: <20190730120937.16271-4-thomas.preston@codethink.co.uk>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190730120937.16271-1-thomas.preston@codethink.co.uk>
References: <20190730120937.16271-1-thomas.preston@codethink.co.uk>
MIME-Version: 1.0
Subject: [alsa-devel] [PATCH v2 3/3] ASoC: TDA7802: Add turn-on diagnostic
	routine
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add a debugfs device node which initiates the turn-on diagnostic routine
feature of the TDA7802 amplifier. The four status registers (one per
channel) are returned.

Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
Changes since v1:
- Rename speaker-test to (turn-on) diagnostics
- Move turn-on diagnostic to debugfs as there is no standard ALSA
  interface for this kind of routine.

 sound/soc/codecs/tda7802.c | 186 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 185 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tda7802.c b/sound/soc/codecs/tda7802.c
index 0f82a88bc1a4..74436212241d 100644
--- a/sound/soc/codecs/tda7802.c
+++ b/sound/soc/codecs/tda7802.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2016-2019 Tesla Motors, Inc.
  */
 
+#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
@@ -26,6 +27,7 @@
 #define TDA7802_IB5			0x05
 
 #define TDA7802_DB0			0x10
+#define TDA7802_DB1			0x11
 #define TDA7802_DB5			0x15
 
 #define IB2_DIGITAL_MUTE_DISABLED	(1 << 2)
@@ -47,6 +49,17 @@
 #define IB3_FORMAT_TDM16_DEV3		(6 << IB3_FORMAT_SHIFT)
 #define IB3_FORMAT_TDM16_DEV4		(7 << IB3_FORMAT_SHIFT)
 
+#define IB4_DIAG_MODE_ENABLE		(1 << 0)
+
+#define IB5_AMPLIFIER_ON		(1 << 0)
+
+#define DB0_STARTUP_DIAG_STATUS		(1 << 6)
+
+#define DIAGNOSTIC_POLL_PERIOD_US	5000
+#define DIAGNOSTIC_TIMEOUT_US		5000000
+#define DIAGNOSTIC_SETTLE_MS		20
+#define NUM_IB				6
+
 enum tda7802_type {
 	tda7802_base,
 };
@@ -55,6 +68,12 @@ struct tda7802_priv {
 	struct i2c_client *i2c;
 	struct regmap *regmap;
 	struct regulator *enable_reg;
+	struct dentry *debugfs;
+	struct mutex diagnostic_mutex;
+};
+
+struct reg_update {
+	unsigned int reg, mask, val;
 };
 
 static const struct reg_default tda7802_reg[] = {
@@ -113,6 +132,19 @@ static const struct regmap_config tda7802_regmap_config = {
 	.cache_type = REGCACHE_RBTREE,
 };
 
+/* The following bits need to be updated before diagnostics mode is set. */
+static const struct reg_update diagnostic_state[NUM_IB] = {
+	{ TDA7802_IB0, 0, 0 },
+	{ TDA7802_IB1, 0, 0 },
+	{ TDA7802_IB2,
+		IB2_CH13_UNMUTED | IB2_CH24_UNMUTED | IB2_DIGITAL_MUTE_DISABLED,
+		IB2_CH13_UNMUTED | IB2_CH24_UNMUTED | IB2_DIGITAL_MUTE_DISABLED,
+	},
+	{ TDA7802_IB3, 0, 0 },
+	{ TDA7802_IB4, IB4_DIAG_MODE_ENABLE, 0 },
+	{ TDA7802_IB5, IB5_AMPLIFIER_ON, 0 },
+};
+
 static int tda7802_digital_mute(struct snd_soc_dai *dai, int mute)
 {
 	const u8 mute_disabled = mute ? 0 : IB2_DIGITAL_MUTE_DISABLED;
@@ -414,7 +446,6 @@ static const struct snd_kcontrol_new tda7802_snd_controls[] = {
 	SOC_SINGLE("AC diag enable", TDA7802_IB4, 3, 1, 0),
 	SOC_ENUM("Diag mode channels 1 & 3", diag_mode_ch13),
 	SOC_ENUM("Diag mode channels 2 & 4", diag_mode_ch24),
-	SOC_SINGLE("Diag mode enable", TDA7802_IB4, 0, 1, 0),
 
 	SOC_ENUM("Clipping detect channels 1 & 3", clip_detect_ch13),
 	SOC_ENUM("Clipping detect channels 2 & 4", clip_detect_ch24),
@@ -432,7 +463,160 @@ static const struct snd_soc_dapm_route tda7802_dapm_routes[] = {
 	{ "SPK", NULL, "DAC" },
 };
 
+static int tda7802_bulk_update(struct regmap *map, struct reg_update *update,
+		size_t update_count)
+{
+	int i, err;
+
+	for (i = 0; i < update_count; i++) {
+		err = regmap_update_bits(map, update[i].reg, update[i].mask,
+				update[i].val);
+		if (err < 0)
+			return err;
+	}
+
+	return i;
+}
+
+static int run_turn_on_diagnostic(struct tda7802_priv *tda7802, u8 *status)
+{
+	struct device *dev = &tda7802->i2c->dev;
+	int err_status, err;
+	unsigned int val;
+	u8 state[NUM_IB];
+
+	dev_dbg(dev, "%s\n", __func__);
+
+	/* Save state and prepare for diagnostic */
+	err = regmap_bulk_read(tda7802->regmap, TDA7802_IB0, state,
+			ARRAY_SIZE(state));
+	if (err < 0) {
+		dev_err(dev, "Could not save device state, %d\n", err);
+		return err;
+	}
+
+	err = tda7802_bulk_update(tda7802->regmap, diagnostic_state,
+			ARRAY_SIZE(diagnostic_state));
+	if (err < 0) {
+		dev_err(dev, "Could not prepare for diagnostics, %d\n", err);
+		goto diagnostic_restore;
+	}
+
+	/* We must wait 20ms for device to settle, otherwise diagnostics will
+	 * not start and regmap poll will timeout.
+	 */
+	msleep(DIAGNOSTIC_SETTLE_MS);
+
+	/* Turn on diagnostic */
+	err = regmap_update_bits(tda7802->regmap, TDA7802_IB4,
+			IB4_DIAG_MODE_ENABLE, IB4_DIAG_MODE_ENABLE);
+	if (err < 0) {
+		dev_err(dev, "Could not enable diagnostic mode, %d\n", err);
+		goto diagnostic_restore;
+	}
+
+	/* Wait until DB0_STARTUP_DIAG_STATUS is set, then read status */
+	err_status = regmap_read_poll_timeout(tda7802->regmap, TDA7802_DB0, val,
+			val & DB0_STARTUP_DIAG_STATUS,
+			DIAGNOSTIC_POLL_PERIOD_US,
+			DIAGNOSTIC_TIMEOUT_US);
+	if (err_status < 0) {
+		dev_err(dev, "Diagnostic did not complete, err %d, reg %x",
+				err_status, val);
+		goto diagnostic_restore;
+	}
+
+	err = regmap_bulk_read(tda7802->regmap, TDA7802_DB1, status, 4);
+	if (err < 0) {
+		dev_err(dev, "Could not read channel status, %d\n", err);
+		goto diagnostic_restore;
+	}
+
+diagnostic_restore:
+	err = regmap_bulk_write(tda7802->regmap, TDA7802_IB0, state,
+			ARRAY_SIZE(state));
+	if (err < 0)
+		dev_err(dev, "Could not restore state, %d\n", err);
+
+	if (err_status < 0)
+		return err_status;
+	else
+		return err;
+}
+
+static int tda7802_diagnostic_show(struct seq_file *f, void *p)
+{
+	char *buf = kmalloc(PAGE_SIZE, GFP_KERNEL);
+	struct tda7802_priv *tda7802 = f->private;
+	u8 status[4] = { 0 };
+	int i, err;
+
+	mutex_lock(&tda7802->diagnostic_mutex);
+	err = run_turn_on_diagnostic(tda7802, status);
+	mutex_unlock(&tda7802->diagnostic_mutex);
+	if (err < 0)
+		return err;
+
+	for (i = 0; i < ARRAY_SIZE(status); i++)
+		seq_printf(f, "%02x: %02x\n", TDA7802_DB1+i, status[i]);
+
+	return 0;
+}
+
+static int tda7802_diagnostic_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, tda7802_diagnostic_show, inode->i_private);
+}
+
+static const struct file_operations tda7802_diagnostic_fops = {
+	.open = tda7802_diagnostic_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
+};
+
+static int tda7802_probe(struct snd_soc_component *component)
+{
+	struct tda7802_priv *tda7802 = snd_soc_component_get_drvdata(component);
+	struct device *dev = &tda7802->i2c->dev;
+	int err;
+
+	tda7802->debugfs = debugfs_create_dir(dev_name(dev), NULL);
+	if (IS_ERR_OR_NULL(tda7802->debugfs)) {
+		dev_info(dev,
+			"Failed to create debugfs node, err %ld\n",
+			PTR_ERR(tda7802->debugfs));
+		return 0;
+	}
+
+	mutex_init(&tda7802->diagnostic_mutex);
+	err = debugfs_create_file("diagnostic", 0444, tda7802->debugfs, tda7802,
+			&tda7802_diagnostic_fops);
+	if (err < 0) {
+		dev_err(dev,
+			"debugfs: Failed to create diagnostic node, err %d\n",
+			err);
+		goto cleanup_diagnostic;
+	}
+
+	return 0;
+
+cleanup_diagnostic:
+	mutex_destroy(&tda7802->diagnostic_mutex);
+	return err;
+}
+
+static void tda7802_remove(struct snd_soc_component *component)
+{
+	struct tda7802_priv *tda7802 = snd_soc_component_get_drvdata(component);
+
+	debugfs_remove_recursive(tda7802->debugfs);
+	mutex_destroy(&tda7802->diagnostic_mutex);
+}
+
 static const struct snd_soc_component_driver tda7802_component_driver = {
+	.probe = tda7802_probe,
+	.remove = tda7802_remove,
 	.set_bias_level = tda7802_set_bias_level,
 	.idle_bias_on = 1,
 	.suspend_bias_off = 1,
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
