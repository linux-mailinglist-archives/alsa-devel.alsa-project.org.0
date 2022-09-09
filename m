Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B485B33DF
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Sep 2022 11:31:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75C361676;
	Fri,  9 Sep 2022 11:30:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75C361676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662715876;
	bh=yvQfDK1dvu5EyBNNyDp8FtdnjeT1cbdOmaiEDZG9JA8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IF4VVt0sHHKqDE4cs9t/XT4c4X5RhJF0ngnc/LrE2crv8SaPRZvZN5Xk1jo4Xjn+O
	 YIZ4Vbp7Nwy7tRmpzlkscEP6FojuoLwjh/oSN7dZ8BQsYkDUh4LZmaQXxSOtsEnDDY
	 Lflno314Q65y5ELyhmFN0Cb0znQJffMc5aYNQyas=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD857F8032B;
	Fri,  9 Sep 2022 11:30:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BF6EF8023A; Fri,  9 Sep 2022 11:30:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2FA18F8011C
 for <alsa-devel@alsa-project.org>; Fri,  9 Sep 2022 11:30:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FA18F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="d7DhGrn5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1662715809;
 x=1694251809;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5kDWDLM4dvskJrZT61dQQhMEV6z9clf/KDjy1daE//E=;
 b=d7DhGrn5huY3quK0k546vmxQfjxfCVwdLCXWwJTs+2kX7hVVTGNUgWJL
 +tLXYL60kZevy/Q/op79khhObi3yw10/t0pXvXcPsTNttcEZIVxXpHlx9
 Rpo4h1y0Kx1FzwiyW+ZM3PDpAcyhDR4Ucmuy4jgk77beX1s3NmIIABnGF
 vCSAAKv7iMT9fx0JcMQkkwt9lacKELJ4uh+PacavcP6Tn4t0QTdHaSjgR
 hzMKC/z5X1U7xoxDNeMm4l7Dm2r7BFSAkwc0IDFPCPDF/xCV668yDlpzo
 tCS4YvXD+CyvBK1xR0ECqvBJlQGoa3Mh+GaCRo1RrcBvqlEQE+aN8tflG A==;
From: Astrid Rost <astrid.rost@axis.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: ts3a227e: allow enabling the jack detect in driver
Date: Fri, 9 Sep 2022 11:30:01 +0200
Message-ID: <20220909093001.13110-1-astrid.rost@axis.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alsa-devel-mejlinglistan <alsa-devel@alsa-project.org>, kernel@axis.com,
 Astrid Rost <astrid.rost@axis.com>, linux-kernel@vger.kernel.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

ti,jack-detect enables the jack detection input device

Signed-off-by: Astrid Rost <astrid.rost@axis.com>
---
 sound/soc/codecs/Kconfig    |  2 ++
 sound/soc/codecs/ts3a227e.c | 62 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index d16b4efb88a7..cb86e52cd02f 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1671,6 +1671,8 @@ config SND_SOC_TLV320ADCX140
 config SND_SOC_TS3A227E
 	tristate "TI Headset/Mic detect and keypress chip"
 	depends on I2C
+	select SND_JACK
+	select SND_JACK_INPUT_DEV
 
 config SND_SOC_TSCS42XX
 	tristate "Tempo Semiconductor TSCS42xx CODEC"
diff --git a/sound/soc/codecs/ts3a227e.c b/sound/soc/codecs/ts3a227e.c
index d8ab0810fceb..b5d0d32cafdb 100644
--- a/sound/soc/codecs/ts3a227e.c
+++ b/sound/soc/codecs/ts3a227e.c
@@ -38,6 +38,32 @@ static const int ts3a227e_buttons[] = {
 	SND_JACK_BTN_3,
 };
 
+/* Headphones jack detection DAPM pin */
+static struct snd_soc_jack_pin ts3a227e_jack_pins[] = {
+
+	{
+		.pin = "Headphone Jack",
+		.mask = SND_JACK_HEADPHONE,
+	},
+	{
+		.pin = "Internal Speaker",
+		/* disable speaker when hp jack is inserted */
+		.mask = SND_JACK_HEADPHONE,
+		.invert	= 1,
+	},
+	{
+		.pin = "Headset Mic",
+		.mask = SND_JACK_MICROPHONE,
+	},
+	{
+		.pin = "Internal Mic",
+		/* disable microphone when microphone jack is inserted */
+		.mask = SND_JACK_MICROPHONE,
+		.invert	= 1,
+	},
+
+};
+
 #define TS3A227E_NUM_BUTTONS 4
 #define TS3A227E_JACK_MASK (SND_JACK_HEADPHONE | \
 			    SND_JACK_MICROPHONE | \
@@ -250,7 +276,12 @@ int ts3a227e_enable_jack_detect(struct snd_soc_component *component,
 }
 EXPORT_SYMBOL_GPL(ts3a227e_enable_jack_detect);
 
-static struct snd_soc_component_driver ts3a227e_soc_driver;
+static int ts3a227e_probe(struct snd_soc_component *component);
+
+static const struct snd_soc_component_driver ts3a227e_soc_driver = {
+	.name = "Audio Accessory Detection ts3a227e",
+	.probe = ts3a227e_probe,
+};
 
 static const struct regmap_config ts3a227e_regmap_config = {
 	.val_bits = 8,
@@ -355,6 +386,35 @@ static int ts3a227e_resume(struct device *dev)
 }
 #endif
 
+static int ts3a227e_probe(struct snd_soc_component *component)
+{
+	int ret = 0;
+	bool enable = 0;
+	struct snd_soc_card *card = component->card;
+	struct ts3a227e *ts3a227e = snd_soc_component_get_drvdata(component);
+
+	enable = device_property_read_bool(component->dev, "ti,jack-detect");
+	if (enable) {
+		/* Enable Headset and 4 Buttons Jack detection */
+		ts3a227e->jack = devm_kzalloc(component->dev,
+				sizeof(struct snd_soc_jack), GFP_KERNEL);
+
+		ret = snd_soc_card_jack_new_pins(card, "Headset Jack",
+					    SND_JACK_HEADSET |
+					    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+					    SND_JACK_BTN_2 | SND_JACK_BTN_3,
+					    ts3a227e->jack,
+					    ts3a227e_jack_pins,
+					    ARRAY_SIZE(ts3a227e_jack_pins));
+		if (ret)
+			return ret;
+
+		ret = ts3a227e_enable_jack_detect(component, ts3a227e->jack);
+	}
+
+	return ret;
+}
+
 static const struct dev_pm_ops ts3a227e_pm = {
 	SET_SYSTEM_SLEEP_PM_OPS(ts3a227e_suspend, ts3a227e_resume)
 };
-- 
2.20.1

