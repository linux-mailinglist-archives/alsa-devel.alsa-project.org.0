Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DFB42040
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 11:07:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDA8C1759;
	Wed, 12 Jun 2019 11:06:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDA8C1759
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560330464;
	bh=XfI1WGy7GJ782s/lAUNkbQ0M//Wql8DCOBH7jsroVd8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GIk8Jg2FJstlTdyQHsQh97LHu6+vQezKcp01v2HoDYyBoCKKCCdKbpweGosiYOK1A
	 ONYizCjwRgKLjwfqYmm8MlFhVaP+mwqG3M7Edc07meMddMpdMQPbH6P7Ylb1TWdDPk
	 y53L+9XK5a86krrUQXLIeOEE28f+IzzSuxDUX4Ok=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 027B5F89734;
	Wed, 12 Jun 2019 11:04:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D745F8970F; Tue, 11 Jun 2019 19:49:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2AE7EF80791
 for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2019 19:49:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AE7EF80791
Received: from [167.98.27.226] (helo=ct-lt-1124.office.codethink.co.uk)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1haktf-0001PN-FW; Tue, 11 Jun 2019 18:49:23 +0100
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
Date: Tue, 11 Jun 2019 18:49:08 +0100
Message-Id: <20190611174909.12162-4-thomas.preston@codethink.co.uk>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190611174909.12162-1-thomas.preston@codethink.co.uk>
References: <20190611174909.12162-1-thomas.preston@codethink.co.uk>
X-Mailman-Approved-At: Wed, 12 Jun 2019 11:04:31 +0200
Subject: [alsa-devel] [PATCH v1 3/4] ASoC: tda7802: Add enable device
	attribute
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

Add a device attribute to control the enable regulator. Write 1 to
enable, 0 to disable (ref-count minus one), or -1 to force disable the
physical pin.

To disable a set of amplifiers wired to the same enable gpio, each
device must be disabled. For example:

	echo 0 > /sys/devices/.../device:00/enable
	echo 0 > /sys/devices/.../device:01/enable

In an emergency, we can force disable from any device:

	echo -1 > /sys/devices/.../device:00/enable

Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
Cc: Patrick Glaser <pglaser@tesla.com>
Cc: Rob Duncan <rduncan@tesla.com>
Cc: Nate Case <ncase@tesla.com>
---
 sound/soc/codecs/tda7802.c | 65 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 64 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tda7802.c b/sound/soc/codecs/tda7802.c
index 38ca52de85f0..62aae011d9f1 100644
--- a/sound/soc/codecs/tda7802.c
+++ b/sound/soc/codecs/tda7802.c
@@ -458,6 +458,42 @@ static struct snd_soc_dai_driver tda7802_dai_driver = {
 	.ops = &tda7802_dai_ops,
 };
 
+static ssize_t enable_show(struct device *dev, struct device_attribute *attr,
+		char *buf)
+{
+	struct tda7802_priv *tda7802 = dev_get_drvdata(dev);
+	int enabled = regulator_is_enabled(tda7802->enable_reg) ? 1 : 0;
+
+	return scnprintf(buf, PAGE_SIZE, "%d\n", enabled);
+}
+
+static ssize_t enable_store(struct device *dev, struct device_attribute *attr,
+		const char *buf, size_t count)
+{
+	struct tda7802_priv *tda7802 = dev_get_drvdata(dev);
+	int err;
+
+	if (sysfs_streq(buf, "1")) {
+		err = regulator_enable(tda7802->enable_reg);
+		if (err < 0)
+			dev_err(dev, "Could not enable (sysfs)\n");
+	} else if (sysfs_streq(buf, "0")) {
+		err = regulator_disable(tda7802->enable_reg);
+		if (err < 0)
+			dev_err(dev, "Could not disable (sysfs)\n");
+	} else if (sysfs_streq(buf, "-1")) {
+		err = regulator_force_disable(tda7802->enable_reg);
+		if (err < 0)
+			dev_err(dev, "Could not force disable (sysfs)\n");
+	} else {
+		return -EINVAL;
+	}
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(enable);
+
 /* read device tree or ACPI properties from device */
 static int tda7802_read_properties(struct tda7802_priv *tda7802)
 {
@@ -493,7 +529,34 @@ static int tda7802_read_properties(struct tda7802_priv *tda7802)
 	return err;
 }
 
-static const struct snd_soc_component_driver tda7802_component_driver;
+static int tda7802_probe(struct snd_soc_component *component)
+{
+	struct tda7802_priv *tda7802 = snd_soc_component_get_drvdata(component);
+	struct device *dev = &tda7802->i2c->dev;
+	int err;
+
+	dev_dbg(dev, "%s\n", __func__);
+
+	err = device_create_file(dev, &dev_attr_enable);
+	if (err < 0) {
+		dev_err(dev, "Could not create enable attr\n");
+		return err;
+	}
+
+	return err;
+}
+
+static void tda7802_remove(struct snd_soc_component *component)
+{
+	struct tda7802_priv *tda7802 = snd_soc_component_get_drvdata(component);
+
+	device_remove_file(&tda7802->i2c->dev, &dev_attr_enable);
+}
+
+static const struct snd_soc_component_driver tda7802_component_driver = {
+	.probe = tda7802_probe,
+	.remove = tda7802_remove,
+};
 
 static int tda7802_i2c_probe(struct i2c_client *i2c,
 			     const struct i2c_device_id *id)
-- 
2.11.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
