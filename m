Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 773058221B0
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jan 2024 20:03:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 092D5E91;
	Tue,  2 Jan 2024 20:03:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 092D5E91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704222202;
	bh=6+MtR4asyxDAUCF9aP81CDkZXi9TZxgyfv80pOSvl40=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sfC/JwFaWVrZh45BYTo5EvX8ilq3VuB+11EnQ3niipcsBEQWXWtn5uG75upoxV98h
	 FwdDJxSCCQw2yqxvn48SsdAPnEpcwIO5pmz0y4qRkUpcyy/UxIBJvV3vCXUE8mIxUN
	 rmCvh6Ccn625ScbZwZwsH/JbWX8LCpjZuX7o4i98=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10A46F805AC; Tue,  2 Jan 2024 20:02:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 08C57F80551;
	Tue,  2 Jan 2024 20:02:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18B5EF8065A; Tue,  2 Jan 2024 19:59:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id E9E5CF80679
	for <alsa-devel@alsa-project.org>; Tue,  2 Jan 2024 19:54:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9E5CF80679
Received: from fedori.lan (51b6838a.dsl.pool.telekom.hu
 [::ffff:81.182.131.138])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000071EE1.00000000658F5FCF.0014D495;
 Sat, 30 Dec 2023 01:09:50 +0100
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
  Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
  alsa-devel@alsa-project.org, Gergo Koteles <soyer@irl.hu>
Subject: [PATCH v2 1/4] ALSA: hda/tas2781: add ptrs to calibration functions
Date: Sat, 30 Dec 2023 01:09:42 +0100
Message-ID: 
 <5859c77ffef752b8a9784713b412d815d7e2688c.1703891777.git.soyer@irl.hu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1703891777.git.soyer@irl.hu>
References: <cover.1703891777.git.soyer@irl.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
Message-ID-Hash: E2CC74QF6UJK5JNDA44WXUWZWCZTTU2R
X-Message-ID-Hash: E2CC74QF6UJK5JNDA44WXUWZWCZTTU2R
X-MailFrom: soyer@irl.hu
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Make calibration functions configurable to support different calibration
data storage modes.

Signed-off-by: Gergo Koteles <soyer@irl.hu>
---
 include/sound/tas2781.h           |  5 +++++
 sound/pci/hda/tas2781_hda_i2c.c   | 25 +++++++++++--------------
 sound/soc/codecs/tas2781-comlib.c | 15 +++++++++++++++
 3 files changed, 31 insertions(+), 14 deletions(-)

diff --git a/include/sound/tas2781.h b/include/sound/tas2781.h
index a6c808b22318..e17ceab4fead 100644
--- a/include/sound/tas2781.h
+++ b/include/sound/tas2781.h
@@ -131,6 +131,9 @@ struct tasdevice_priv {
 		const struct firmware *fmw, int offset);
 	int (*tasdevice_load_block)(struct tasdevice_priv *tas_priv,
 		struct tasdev_blk *block);
+
+	int (*save_calibration)(struct tasdevice_priv *tas_priv);
+	void (*apply_calibration)(struct tasdevice_priv *tas_priv);
 };
 
 void tas2781_reset(struct tasdevice_priv *tas_dev);
@@ -139,6 +142,8 @@ int tascodec_init(struct tasdevice_priv *tas_priv, void *codec,
 struct tasdevice_priv *tasdevice_kzalloc(struct i2c_client *i2c);
 int tasdevice_init(struct tasdevice_priv *tas_priv);
 void tasdevice_remove(struct tasdevice_priv *tas_priv);
+int tasdevice_save_calibration(struct tasdevice_priv *tas_priv);
+void tasdevice_apply_calibration(struct tasdevice_priv *tas_priv);
 int tasdevice_dev_read(struct tasdevice_priv *tas_priv,
 	unsigned short chn, unsigned int reg, unsigned int *value);
 int tasdevice_dev_write(struct tasdevice_priv *tas_priv,
diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index dfe281b57aa6..0f8d5f947f54 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -479,7 +479,7 @@ static int tas2781_save_calibration(struct tasdevice_priv *tas_priv)
 		dev_dbg(tas_priv->dev, "%4ld-%2d-%2d, %2d:%2d:%2d\n",
 			tm->tm_year, tm->tm_mon, tm->tm_mday,
 			tm->tm_hour, tm->tm_min, tm->tm_sec);
-		tas2781_apply_calib(tas_priv);
+		tasdevice_apply_calibration(tas_priv);
 	} else
 		tas_priv->cali_data.total_sz = 0;
 
@@ -582,7 +582,7 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
 	/* If calibrated data occurs error, dsp will still works with default
 	 * calibrated data inside algo.
 	 */
-	tas2781_save_calibration(tas_priv);
+	tasdevice_save_calibration(tas_priv);
 
 out:
 	mutex_unlock(&tas_hda->priv->codec_lock);
@@ -683,10 +683,6 @@ static int tas2781_hda_i2c_probe(struct i2c_client *clt)
 	const char *device_name;
 	int ret;
 
-	if (strstr(dev_name(&clt->dev), "TIAS2781"))
-		device_name = "TIAS2781";
-	else
-		return -ENODEV;
 
 	tas_hda = devm_kzalloc(&clt->dev, sizeof(*tas_hda), GFP_KERNEL);
 	if (!tas_hda)
@@ -699,6 +695,13 @@ static int tas2781_hda_i2c_probe(struct i2c_client *clt)
 	if (!tas_hda->priv)
 		return -ENOMEM;
 
+	if (strstr(dev_name(&clt->dev), "TIAS2781")) {
+		device_name = "TIAS2781";
+		tas_hda->priv->save_calibration = tas2781_save_calibration;
+		tas_hda->priv->apply_calibration = tas2781_apply_calib;
+	} else
+		return -ENODEV;
+
 	tas_hda->priv->irq_info.irq = clt->irq;
 	ret = tas2781_read_acpi(tas_hda->priv, device_name);
 	if (ret)
@@ -765,8 +768,6 @@ static int tas2781_runtime_suspend(struct device *dev)
 static int tas2781_runtime_resume(struct device *dev)
 {
 	struct tas2781_hda *tas_hda = dev_get_drvdata(dev);
-	unsigned long calib_data_sz =
-		tas_hda->priv->ndev * TASDEVICE_SPEAKER_CALIBRATION_SIZE;
 
 	dev_dbg(tas_hda->dev, "Runtime Resume\n");
 
@@ -777,8 +778,7 @@ static int tas2781_runtime_resume(struct device *dev)
 	/* If calibrated data occurs error, dsp will still works with default
 	 * calibrated data inside algo.
 	 */
-	if (tas_hda->priv->cali_data.total_sz > calib_data_sz)
-		tas2781_apply_calib(tas_hda->priv);
+	tasdevice_apply_calibration(tas_hda->priv);
 
 	mutex_unlock(&tas_hda->priv->codec_lock);
 
@@ -809,8 +809,6 @@ static int tas2781_system_suspend(struct device *dev)
 static int tas2781_system_resume(struct device *dev)
 {
 	struct tas2781_hda *tas_hda = dev_get_drvdata(dev);
-	unsigned long calib_data_sz =
-		tas_hda->priv->ndev * TASDEVICE_SPEAKER_CALIBRATION_SIZE;
 	int i, ret;
 
 	dev_info(tas_hda->priv->dev, "System Resume\n");
@@ -832,8 +830,7 @@ static int tas2781_system_resume(struct device *dev)
 	/* If calibrated data occurs error, dsp will still work with default
 	 * calibrated data inside algo.
 	 */
-	if (tas_hda->priv->cali_data.total_sz > calib_data_sz)
-		tas2781_apply_calib(tas_hda->priv);
+	tasdevice_apply_calibration(tas_hda->priv);
 	mutex_unlock(&tas_hda->priv->codec_lock);
 
 	return 0;
diff --git a/sound/soc/codecs/tas2781-comlib.c b/sound/soc/codecs/tas2781-comlib.c
index 00e35169ae49..b7e56ceb1acf 100644
--- a/sound/soc/codecs/tas2781-comlib.c
+++ b/sound/soc/codecs/tas2781-comlib.c
@@ -412,6 +412,21 @@ void tasdevice_remove(struct tasdevice_priv *tas_priv)
 }
 EXPORT_SYMBOL_GPL(tasdevice_remove);
 
+int tasdevice_save_calibration(struct tasdevice_priv *tas_priv)
+{
+	if (tas_priv->save_calibration)
+		return tas_priv->save_calibration(tas_priv);
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(tasdevice_save_calibration);
+
+void tasdevice_apply_calibration(struct tasdevice_priv *tas_priv)
+{
+	if (tas_priv->apply_calibration && tas_priv->cali_data.total_sz)
+		tas_priv->apply_calibration(tas_priv);
+}
+EXPORT_SYMBOL_GPL(tasdevice_apply_calibration);
+
 static int tasdevice_clamp(int val, int max, unsigned int invert)
 {
 	if (val > max)
-- 
2.43.0

