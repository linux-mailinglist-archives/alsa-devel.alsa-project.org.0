Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9704204B
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 11:10:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8242177E;
	Wed, 12 Jun 2019 11:09:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8242177E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560330611;
	bh=KgOQZyVXfeqURwd29EJjwzvjm/F2b1iPYX11EcPVHlY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ggsAOtuj/c2qAardKD0jwyiUvey+wJR2qPEdgWpsXH+uzmEWXXvYzTJBDQkNoBdiG
	 R1jN0lnlvVMnUn9he5hW9Vq8OyvKSQbm4ObSCvJMGZzBwgbSlPCWS4eCZ/g9OxI5uv
	 lyCsHZuBUM98cUp1Vvn6V+k4OJJunAOvo6ncHaEA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC747F89747;
	Wed, 12 Jun 2019 11:04:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 744C4F89711; Tue, 11 Jun 2019 19:49:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6733F896F1
 for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2019 19:49:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6733F896F1
Received: from [167.98.27.226] (helo=ct-lt-1124.office.codethink.co.uk)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1haktg-0001PN-4P; Tue, 11 Jun 2019 18:49:24 +0100
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
Date: Tue, 11 Jun 2019 18:49:09 +0100
Message-Id: <20190611174909.12162-5-thomas.preston@codethink.co.uk>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190611174909.12162-1-thomas.preston@codethink.co.uk>
References: <20190611174909.12162-1-thomas.preston@codethink.co.uk>
X-Mailman-Approved-At: Wed, 12 Jun 2019 11:04:31 +0200
Subject: [alsa-devel] [PATCH v1 4/4] ASoC: tda7802: Add speaker-test sysfs
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add speaker_test device attribute. When the speaker-test node is read
the hardware speaker test is started.

	$ cat /sys/devices/.../device:00/speaker_test
	04 04 04 04

Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
Cc: Patrick Glaser <pglaser@tesla.com>
Cc: Rob Duncan <rduncan@tesla.com>
Cc: Nate Case <ncase@tesla.com>
---
 sound/soc/codecs/tda7802.c | 172 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 172 insertions(+)

diff --git a/sound/soc/codecs/tda7802.c b/sound/soc/codecs/tda7802.c
index 62aae011d9f1..edfa752c0c9f 100644
--- a/sound/soc/codecs/tda7802.c
+++ b/sound/soc/codecs/tda7802.c
@@ -157,6 +157,7 @@ static const u8 IB3_FORMAT[4][4] = {
 #define DUMP_NUM_REGS			   (DUMP_NUM_BLOCK * 2)
 
 struct tda7802_priv {
+	struct mutex mutex;
 	struct i2c_client *i2c;
 	struct regmap *regmap;
 	struct regulator *enable_reg;
@@ -458,6 +459,159 @@ static struct snd_soc_dai_driver tda7802_dai_driver = {
 	.ops = &tda7802_dai_ops,
 };
 
+/* The speaker test is triggered by reading a sysfs attribute file attached to
+ * the I2C device. The user space thread that's doing the reading is blocked
+ * until the test completes (or times out). We only permit one test to be in
+ * progress at a time.
+ */
+
+static int speaker_test_start(struct regmap *regmap)
+{
+	int err;
+
+	err = regmap_update_bits(regmap, TDA7802_IB5, IB5_AMPLIFIER_ON, 0);
+	if (err < 0) {
+		dev_err(regmap_get_device(regmap),
+			"Cannot disable amp for speaker test (%d)\n", err);
+		return err;
+	}
+
+	err = regmap_update_bits(regmap, TDA7802_IB4, IB4_DIAG_MODE_ENABLE, 0);
+	if (err < 0) {
+		dev_err(regmap_get_device(regmap),
+			"Cannot disable diag mode before speaker test (%d)\n",
+			err);
+		return err;
+	}
+
+	/* Seem to need at least a 15 ms delay here before the rising
+	 * edge. Otherwise the diagnostics never complete (perhaps
+	 * they never start).
+	 */
+	msleep(20);
+
+	err = regmap_update_bits(regmap, TDA7802_IB4,
+				 IB4_DIAG_MODE_ENABLE, IB4_DIAG_MODE_ENABLE);
+	if (err < 0) {
+		dev_err(regmap_get_device(regmap),
+			"Cannot enable diag mode for speaker test (%d)\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
+static int speaker_test_stop(struct regmap *regmap)
+{
+	int err;
+
+	err = regmap_update_bits(regmap, TDA7802_IB4, IB4_DIAG_MODE_ENABLE, 0);
+	if (err < 0)
+		dev_err(regmap_get_device(regmap),
+			"Cannot disable diag mode after speaker test (%d)\n",
+			err);
+	return err;
+}
+
+/* We poll the test completion bit, letting the current thread sleep
+ * until we're done. These values are not critical.
+ */
+#define SPEAKER_TEST_DONE_POLL_PERIOD_US 5000
+#define SPEAKER_TEST_DONE_TIMEOUT_US	 5000000
+
+static int speaker_test_check(struct tda7802_priv *tda7802,
+		unsigned int *status)
+{
+	struct regmap *regmap = tda7802->regmap;
+	struct device *dev = &tda7802->i2c->dev;
+	int reg_err = 0, err = 0, i, amp_on;
+	unsigned int val;
+
+	reg_err = regulator_enable(tda7802->enable_reg);
+	if (reg_err < 0) {
+		dev_err(dev, "Could not enable (speaker-test).\n");
+		return reg_err;
+	}
+	msleep(ENABLE_DELAY_MS);
+
+	/* we should return amp on state when speaker-test is done */
+	err = regmap_read(regmap, TDA7802_IB5, &amp_on);
+	if (err < 0) {
+		dev_err(dev, "Could not read amp on state (speaker-test)\n");
+		goto speaker_test_disable;
+	}
+
+	for (i = 0; i < CHANNELS_PER_AMP; ++i)
+		status[i] = 0xff;
+
+	err = speaker_test_start(regmap);
+	if (err < 0)
+		goto speaker_test_restore;
+
+	/* Wait until DB0_STARTUP_DIAG_STATUS is set */
+	err = regmap_read_poll_timeout(regmap, TDA7802_DB0, val,
+			val & DB0_STARTUP_DIAG_STATUS,
+			SPEAKER_TEST_DONE_POLL_PERIOD_US,
+			SPEAKER_TEST_DONE_TIMEOUT_US);
+	if (err < 0) {
+		if (err == -ENODATA)
+			dev_err(dev,
+				"Speaker diagnostic test did not complete\n");
+		speaker_test_stop(regmap);
+		goto speaker_test_restore;
+	}
+
+	err = speaker_test_stop(regmap);
+	if (err < 0)
+		goto speaker_test_restore;
+
+	for (i = 0; i < CHANNELS_PER_AMP; ++i) {
+		err = regmap_read(regmap, TDA7802_DB1 + i, status + i);
+		if (err < 0) {
+			dev_err(dev,
+				"Cannot get speaker %d status (%d)\n", i, err);
+			goto speaker_test_restore;
+		}
+	}
+
+speaker_test_restore:
+	err = regmap_update_bits(regmap, TDA7802_IB5, IB5_AMPLIFIER_ON,
+			amp_on);
+	if (err < 0)
+		dev_err(dev, "Could not restore amp on state (speaker-test)\n");
+
+speaker_test_disable:
+	reg_err = regulator_disable(tda7802->enable_reg);
+	if (reg_err < 0) {
+		dev_err(dev, "Could not disable (speaker-test).\n");
+		return reg_err;
+	}
+	return err;
+}
+
+static ssize_t speaker_test_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct tda7802_priv *tda7802 = dev_get_drvdata(dev);
+	unsigned int channel_status[CHANNELS_PER_AMP];
+	char *str = buf;
+	int ret, i;
+
+	mutex_lock(&tda7802->mutex);
+	ret = speaker_test_check(tda7802, channel_status);
+	mutex_unlock(&tda7802->mutex);
+	if (ret < 0)
+		return ret;
+
+	for (i = 0; i < CHANNELS_PER_AMP; i++)
+		str += sprintf(str, "%02x ", channel_status[i]);
+	str += sprintf(str, "\n");
+
+	return str - buf;
+}
+
+static DEVICE_ATTR_RO(speaker_test);
+
 static ssize_t enable_show(struct device *dev, struct device_attribute *attr,
 		char *buf)
 {
@@ -537,12 +691,28 @@ static int tda7802_probe(struct snd_soc_component *component)
 
 	dev_dbg(dev, "%s\n", __func__);
 
+	/* Device is ready, now we should create sysfs attributes.
+	 * Rememer to cleanup
+	 */
 	err = device_create_file(dev, &dev_attr_enable);
 	if (err < 0) {
 		dev_err(dev, "Could not create enable attr\n");
 		return err;
 	}
 
+	mutex_init(&tda7802->mutex);
+	err = device_create_file(dev, &dev_attr_speaker_test);
+	if (err < 0) {
+		dev_err(dev, "Could not create speaker_test attr\n");
+		goto cleanup_speaker_test;
+	}
+
+	return 0;
+
+cleanup_speaker_test:
+	mutex_destroy(&tda7802->mutex);
+	device_remove_file(&tda7802->i2c->dev, &dev_attr_enable);
+
 	return err;
 }
 
@@ -550,6 +720,8 @@ static void tda7802_remove(struct snd_soc_component *component)
 {
 	struct tda7802_priv *tda7802 = snd_soc_component_get_drvdata(component);
 
+	device_remove_file(&tda7802->i2c->dev, &dev_attr_speaker_test);
+	mutex_destroy(&tda7802->mutex);
 	device_remove_file(&tda7802->i2c->dev, &dev_attr_enable);
 }
 
-- 
2.11.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
