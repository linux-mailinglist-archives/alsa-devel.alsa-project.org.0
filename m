Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC2B807CC2
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 01:07:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08307E0E;
	Thu,  7 Dec 2023 01:07:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08307E0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701907652;
	bh=Bp/+hO8EFteOrshPlVY+Y8XVfTzdFp2DfPSh0YtwS/Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=d9G5YlfFuZB1w8Xs3dXRFI7BStrshIYKwqopdiwHwsUvfr1xzDyDEyObhFGlddQdE
	 JIASOSCwHwCUKK2wIu7RLCmS9Rc73oWzR2yayGdYN+H0DSMx/W6GRx7TLxnzUKlHRZ
	 A98gvUhtSGkDiza2QKMyvK63JqXAWaDZ9L79WTIs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25115F805C0; Thu,  7 Dec 2023 01:05:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C3A7EF805E5;
	Thu,  7 Dec 2023 01:05:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6234BF800D2; Thu,  7 Dec 2023 01:05:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id A877BF8061A
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 01:04:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A877BF8061A
Received: from fedori.lan (51b690cd.dsl.pool.telekom.hu
 [::ffff:81.182.144.205])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 00000000000716FF.0000000065710C16.001190E2;
 Thu, 07 Dec 2023 01:04:37 +0100
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
  Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
  Gergo Koteles <soyer@irl.hu>
Subject: [PATCH 13/16] ALSA: hda/tas2781: remove sound controls in unbind
Date: Thu,  7 Dec 2023 01:04:29 +0100
Message-ID: 
 <8f16576930682297fd08bba5e063a9a1f3150388.1701906455.git.soyer@irl.hu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1701906455.git.soyer@irl.hu>
References: <cover.1701906455.git.soyer@irl.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
Message-ID-Hash: 4CNZ2T57CJBPVJAFTQKJIGHSNNWLSPPW
X-Message-ID-Hash: 4CNZ2T57CJBPVJAFTQKJIGHSNNWLSPPW
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4CNZ2T57CJBPVJAFTQKJIGHSNNWLSPPW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Remove sound controls in hda_unbind to make
module loadable after module unload.

Add a driver specific struct (tas2781_hda) to store
the controls.

Signed-off-by: Gergo Koteles <soyer@irl.hu>
---
 sound/pci/hda/tas2781_hda_i2c.c | 234 +++++++++++++++++++-------------
 1 file changed, 136 insertions(+), 98 deletions(-)

diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index 290c41194139..0972345c15e5 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -82,6 +82,14 @@ static unsigned int cal_regs[TAS2563_CAL_N] = {
 	TAS2563_CAL_R0_LOW, TAS2563_CAL_TLIM,
 };
 
+struct tas2781_hda {
+	struct device *dev;
+	struct tasdevice_priv *priv;
+	struct snd_kcontrol *dsp_prog_ctl;
+	struct snd_kcontrol *dsp_conf_ctl;
+	struct snd_kcontrol *prof_ctl;
+	struct snd_kcontrol *snd_ctls[3];
+};
 
 static int tas2781_get_i2c_res(struct acpi_resource *ares, void *data)
 {
@@ -143,26 +151,26 @@ static int tas2781_read_acpi(struct tasdevice_priv *p, const char *hid)
 
 static void tas2781_hda_playback_hook(struct device *dev, int action)
 {
-	struct tasdevice_priv *tas_priv = dev_get_drvdata(dev);
+	struct tas2781_hda *tas_hda = dev_get_drvdata(dev);
 
-	dev_dbg(tas_priv->dev, "%s: action = %d\n", __func__, action);
+	dev_dbg(tas_hda->dev, "%s: action = %d\n", __func__, action);
 	switch (action) {
 	case HDA_GEN_PCM_ACT_OPEN:
 		pm_runtime_get_sync(dev);
-		mutex_lock(&tas_priv->codec_lock);
-		tasdevice_tuning_switch(tas_priv, 0);
-		mutex_unlock(&tas_priv->codec_lock);
+		mutex_lock(&tas_hda->priv->codec_lock);
+		tasdevice_tuning_switch(tas_hda->priv, 0);
+		mutex_unlock(&tas_hda->priv->codec_lock);
 		break;
 	case HDA_GEN_PCM_ACT_CLOSE:
-		mutex_lock(&tas_priv->codec_lock);
-		tasdevice_tuning_switch(tas_priv, 1);
-		mutex_unlock(&tas_priv->codec_lock);
+		mutex_lock(&tas_hda->priv->codec_lock);
+		tasdevice_tuning_switch(tas_hda->priv, 1);
+		mutex_unlock(&tas_hda->priv->codec_lock);
 
 		pm_runtime_mark_last_busy(dev);
 		pm_runtime_put_autosuspend(dev);
 		break;
 	default:
-		dev_dbg(tas_priv->dev, "Playback action not supported: %d\n",
+		dev_dbg(tas_hda->dev, "Playback action not supported: %d\n",
 			action);
 		break;
 	}
@@ -556,9 +564,28 @@ static int load_calibration_efi_1(struct tasdevice_priv *tas_priv)
 	return 0;
 }
 
+static void tas2781_hda_remove_controls(struct tas2781_hda *tas_hda)
+{
+	struct hda_codec *codec = tas_hda->priv->codec;
+
+	if (tas_hda->dsp_prog_ctl)
+		snd_ctl_remove(codec->card, tas_hda->dsp_prog_ctl);
+
+	if (tas_hda->dsp_conf_ctl)
+		snd_ctl_remove(codec->card, tas_hda->dsp_conf_ctl);
+
+	for (int i = ARRAY_SIZE(tas_hda->snd_ctls) - 1; i >= 0; i--)
+		if (tas_hda->snd_ctls[i])
+			snd_ctl_remove(codec->card, tas_hda->snd_ctls[i]);
+
+	if (tas_hda->prof_ctl)
+		snd_ctl_remove(codec->card, tas_hda->prof_ctl);
+}
+
 static void tasdev_fw_ready(const struct firmware *fmw, void *context)
 {
 	struct tasdevice_priv *tas_priv = context;
+	struct tas2781_hda *tas_hda = dev_get_drvdata(tas_priv->dev);
 	struct hda_codec *codec = tas_priv->codec;
 	int i, ret;
 
@@ -569,8 +596,8 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
 	if (ret)
 		goto out;
 
-	ret = snd_ctl_add(codec->card,
-		snd_ctl_new1(&tas2781_prof_ctrl, tas_priv));
+	tas_hda->prof_ctl = snd_ctl_new1(&tas2781_prof_ctrl, tas_priv);
+	ret = snd_ctl_add(codec->card, tas_hda->prof_ctl);
 	if (ret) {
 		dev_err(tas_priv->dev,
 			"Failed to add KControl %s = %d\n",
@@ -579,8 +606,9 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
 	}
 
 	for (i = 0; i < ARRAY_SIZE(tas2781_snd_controls); i++) {
-		ret = snd_ctl_add(codec->card,
-			snd_ctl_new1(&tas2781_snd_controls[i], tas_priv));
+		tas_hda->snd_ctls[i] = snd_ctl_new1(&tas2781_snd_controls[i],
+			tas_priv);
+		ret = snd_ctl_add(codec->card, tas_hda->snd_ctls[i]);
 		if (ret) {
 			dev_err(tas_priv->dev,
 				"Failed to add KControl %s = %d\n",
@@ -602,8 +630,9 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
 		goto out;
 	}
 
-	ret = snd_ctl_add(codec->card,
-		snd_ctl_new1(&tas2781_dsp_prog_ctrl, tas_priv));
+	tas_hda->dsp_prog_ctl = snd_ctl_new1(&tas2781_dsp_prog_ctrl,
+		tas_priv);
+	ret = snd_ctl_add(codec->card, tas_hda->dsp_prog_ctl);
 	if (ret) {
 		dev_err(tas_priv->dev,
 			"Failed to add KControl %s = %d\n",
@@ -611,8 +640,9 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
 		goto out;
 	}
 
-	ret = snd_ctl_add(codec->card,
-		snd_ctl_new1(&tas2781_dsp_conf_ctrl, tas_priv));
+	tas_hda->dsp_conf_ctl = snd_ctl_new1(&tas2781_dsp_conf_ctrl,
+		tas_priv);
+	ret = snd_ctl_add(codec->card, tas_hda->dsp_conf_ctl);
 	if (ret) {
 		dev_err(tas_priv->dev,
 			"Failed to add KControl %s = %d\n",
@@ -635,27 +665,27 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
 		tasdevice_config_info_remove(tas_priv);
 		tasdevice_dsp_remove(tas_priv);
 	}
-	mutex_unlock(&tas_priv->codec_lock);
+	mutex_unlock(&tas_hda->priv->codec_lock);
 	if (fmw)
 		release_firmware(fmw);
-	pm_runtime_mark_last_busy(tas_priv->dev);
-	pm_runtime_put_autosuspend(tas_priv->dev);
+	pm_runtime_mark_last_busy(tas_hda->dev);
+	pm_runtime_put_autosuspend(tas_hda->dev);
 }
 
 static int tas2781_hda_bind(struct device *dev, struct device *master,
 	void *master_data)
 {
-	struct tasdevice_priv *tas_priv = dev_get_drvdata(dev);
+	struct tas2781_hda *tas_hda = dev_get_drvdata(dev);
 	struct hda_component *comps = master_data;
 	struct hda_codec *codec;
 	unsigned int subid;
 	int ret;
 
-	if (!comps || tas_priv->index < 0 ||
-		tas_priv->index >= HDA_MAX_COMPONENTS)
+	if (!comps || tas_hda->priv->index < 0 ||
+		tas_hda->priv->index >= HDA_MAX_COMPONENTS)
 		return -EINVAL;
 
-	comps = &comps[tas_priv->index];
+	comps = &comps[tas_hda->priv->index];
 	if (comps->dev)
 		return -EBUSY;
 
@@ -664,10 +694,10 @@ static int tas2781_hda_bind(struct device *dev, struct device *master,
 
 	switch (subid) {
 	case 0x17aa:
-		tas_priv->catlog_id = LENOVO;
+		tas_hda->priv->catlog_id = LENOVO;
 		break;
 	default:
-		tas_priv->catlog_id = OTHERS;
+		tas_hda->priv->catlog_id = OTHERS;
 		break;
 	}
 
@@ -677,7 +707,7 @@ static int tas2781_hda_bind(struct device *dev, struct device *master,
 
 	strscpy(comps->name, dev_name(dev), sizeof(comps->name));
 
-	ret = tascodec_init(tas_priv, codec, tasdev_fw_ready);
+	ret = tascodec_init(tas_hda->priv, codec, tasdev_fw_ready);
 	if (!ret)
 		comps->playback_hook = tas2781_hda_playback_hook;
 
@@ -690,19 +720,21 @@ static int tas2781_hda_bind(struct device *dev, struct device *master,
 static void tas2781_hda_unbind(struct device *dev,
 	struct device *master, void *master_data)
 {
-	struct tasdevice_priv *tas_priv = dev_get_drvdata(dev);
+	struct tas2781_hda *tas_hda = dev_get_drvdata(dev);
 	struct hda_component *comps = master_data;
 
-	if (comps[tas_priv->index].dev == dev) {
-		comps[tas_priv->index].dev = NULL;
+	if (comps[tas_hda->priv->index].dev == dev) {
+		comps[tas_hda->priv->index].dev = NULL;
 		strscpy(comps->name, "", sizeof(comps->name));
-		comps[tas_priv->index].playback_hook = NULL;
+		comps[tas_hda->priv->index].playback_hook = NULL;
 	}
 
-	tasdevice_config_info_remove(tas_priv);
-	tasdevice_dsp_remove(tas_priv);
+	tas2781_hda_remove_controls(tas_hda);
 
-	tas_priv->fw_state = TASDEVICE_DSP_FW_PENDING;
+	tasdevice_config_info_remove(tas_hda->priv);
+	tasdevice_dsp_remove(tas_hda->priv);
+
+	tas_hda->priv->fw_state = TASDEVICE_DSP_FW_PENDING;
 }
 
 static const struct component_ops tas2781_hda_comp_ops = {
@@ -712,70 +744,75 @@ static const struct component_ops tas2781_hda_comp_ops = {
 
 static void tas2781_hda_remove(struct device *dev)
 {
-	struct tasdevice_priv *tas_priv = dev_get_drvdata(dev);
+	struct tas2781_hda *tas_hda = dev_get_drvdata(dev);
 
-	pm_runtime_get_sync(tas_priv->dev);
-	pm_runtime_disable(tas_priv->dev);
+	pm_runtime_get_sync(tas_hda->dev);
+	pm_runtime_disable(tas_hda->dev);
 
-	component_del(tas_priv->dev, &tas2781_hda_comp_ops);
+	component_del(tas_hda->dev, &tas2781_hda_comp_ops);
 
-	pm_runtime_put_noidle(tas_priv->dev);
+	pm_runtime_put_noidle(tas_hda->dev);
 
-	tasdevice_remove(tas_priv);
+	tasdevice_remove(tas_hda->priv);
 }
 
 static int tas2781_hda_i2c_probe(struct i2c_client *clt)
 {
-	struct tasdevice_priv *tas_priv;
+	struct tas2781_hda *tas_hda;
 	const char *device_name;
 	int ret;
 
-	tas_priv = tasdevice_kzalloc(clt);
-	if (!tas_priv)
+	tas_hda = devm_kzalloc(&clt->dev, sizeof(*tas_hda), GFP_KERNEL);
+	if (!tas_hda)
 		return -ENOMEM;
 
-	dev_set_drvdata(&clt->dev, tas_priv);
+	dev_set_drvdata(&clt->dev, tas_hda);
+	tas_hda->dev = &clt->dev;
+
+	tas_hda->priv = tasdevice_kzalloc(clt);
+	if (!tas_hda->priv)
+		return -ENOMEM;
 
-	if (strstr(dev_name(&clt->dev), "TIAS2781")) {
+	if (strstr(dev_name(tas_hda->dev), "TIAS2781")) {
 		device_name = "TIAS2781";
-		tas_priv->load_calibration = load_calibration_efi_1;
-		tas_priv->apply_calibration = tas2781_apply_calibration;
-		tas_priv->global_addr = TAS2781_GLOBAL_ADDR;
-	} else if (strstr(dev_name(&clt->dev), "INT8866")) {
+		tas_hda->priv->load_calibration = load_calibration_efi_1;
+		tas_hda->priv->apply_calibration = tas2781_apply_calibration;
+		tas_hda->priv->global_addr = TAS2781_GLOBAL_ADDR;
+	} else if (strstr(dev_name(tas_hda->dev), "INT8866")) {
 		device_name = "INT8866";
-		tas_priv->load_calibration = load_calibration_efi_2;
-		tas_priv->apply_calibration = tas2563_apply_calibration;
-		tas_priv->global_addr = TAS2563_GLOBAL_ADDR;
+		tas_hda->priv->load_calibration = load_calibration_efi_2;
+		tas_hda->priv->apply_calibration = tas2563_apply_calibration;
+		tas_hda->priv->global_addr = TAS2563_GLOBAL_ADDR;
 	} else
 		return -ENODEV;
 
-	tas_priv->irq_info.irq = clt->irq;
-	ret = tas2781_read_acpi(tas_priv, device_name);
+	tas_hda->priv->irq_info.irq = clt->irq;
+	ret = tas2781_read_acpi(tas_hda->priv, device_name);
 	if (ret)
-		return dev_err_probe(tas_priv->dev, ret,
+		return dev_err_probe(tas_hda->dev, ret,
 			"Platform not supported\n");
 
-	ret = tasdevice_init(tas_priv);
+	ret = tasdevice_init(tas_hda->priv);
 	if (ret)
 		goto err;
 
-	pm_runtime_set_autosuspend_delay(tas_priv->dev, 3000);
-	pm_runtime_use_autosuspend(tas_priv->dev);
-	pm_runtime_mark_last_busy(tas_priv->dev);
-	pm_runtime_set_active(tas_priv->dev);
-	pm_runtime_get_noresume(tas_priv->dev);
-	pm_runtime_enable(tas_priv->dev);
+	pm_runtime_set_autosuspend_delay(tas_hda->dev, 3000);
+	pm_runtime_use_autosuspend(tas_hda->dev);
+	pm_runtime_mark_last_busy(tas_hda->dev);
+	pm_runtime_set_active(tas_hda->dev);
+	pm_runtime_get_noresume(tas_hda->dev);
+	pm_runtime_enable(tas_hda->dev);
 
-	pm_runtime_put_autosuspend(tas_priv->dev);
+	pm_runtime_put_autosuspend(tas_hda->dev);
 
-	ret = component_add(tas_priv->dev, &tas2781_hda_comp_ops);
+	ret = component_add(tas_hda->dev, &tas2781_hda_comp_ops);
 	if (ret) {
-		dev_err(tas_priv->dev, "Register component failed: %d\n", ret);
-		pm_runtime_disable(tas_priv->dev);
+		dev_err(tas_hda->dev, "Register component failed: %d\n", ret);
+		pm_runtime_disable(tas_hda->dev);
 		goto err;
 	}
 
-	tas2781_reset(tas_priv);
+	tas2781_reset(tas_hda->priv);
 err:
 	if (ret)
 		tas2781_hda_remove(&clt->dev);
@@ -789,63 +826,64 @@ static void tas2781_hda_i2c_remove(struct i2c_client *clt)
 
 static int tas2781_runtime_suspend(struct device *dev)
 {
-	struct tasdevice_priv *tas_priv = dev_get_drvdata(dev);
+	struct tas2781_hda *tas_hda = dev_get_drvdata(dev);
 	int i;
 
-	dev_dbg(tas_priv->dev, "Runtime Suspend\n");
+	dev_info(tas_hda->dev, "Runtime Suspend\n");
 
-	mutex_lock(&tas_priv->codec_lock);
+	mutex_lock(&tas_hda->priv->codec_lock);
 
-	if (tas_priv->playback_started) {
-		tasdevice_tuning_switch(tas_priv, 1);
-		tas_priv->playback_started = false;
+	if (tas_hda->priv->playback_started) {
+		tasdevice_tuning_switch(tas_hda->priv, 1);
+		tas_hda->priv->playback_started = false;
 	}
 
-	for (i = 0; i < tas_priv->ndev; i++) {
-		tas_priv->tasdevice[i].cur_book = -1;
-		tas_priv->tasdevice[i].cur_prog = -1;
-		tas_priv->tasdevice[i].cur_conf = -1;
+	for (i = 0; i < tas_hda->priv->ndev; i++) {
+		tas_hda->priv->tasdevice[i].cur_book = -1;
+		tas_hda->priv->tasdevice[i].cur_prog = -1;
+		tas_hda->priv->tasdevice[i].cur_conf = -1;
 	}
 
 
-	mutex_unlock(&tas_priv->codec_lock);
+	mutex_unlock(&tas_hda->priv->codec_lock);
 
 	return 0;
 }
 
 static int tas2781_runtime_resume(struct device *dev)
 {
-	struct tasdevice_priv *tas_priv = dev_get_drvdata(dev);
+	struct tas2781_hda *tas_hda = dev_get_drvdata(dev);
 
-	dev_dbg(tas_priv->dev, "Runtime Resume\n");
+	dev_dbg(tas_hda->dev, "Runtime Resume\n");
 
-	mutex_lock(&tas_priv->codec_lock);
+	mutex_lock(&tas_hda->priv->codec_lock);
 
-	tasdevice_prmg_load(tas_priv, tas_priv->cur_prog);
+	tasdevice_prmg_load(tas_hda->priv, tas_hda->priv->cur_prog);
 
 	/* If calibrated data occurs error, dsp will still works with default
 	 * calibrated data inside algo.
 	 */
-	tasdevice_apply_calibration(tas_priv);
+	tasdevice_apply_calibration(tas_hda->priv);
 
-	mutex_unlock(&tas_priv->codec_lock);
+out:
+	mutex_unlock(&tas_hda->priv->codec_lock);
 
 	return 0;
 }
 
 static int tas2781_system_suspend(struct device *dev)
 {
-	struct tasdevice_priv *tas_priv = dev_get_drvdata(dev);
+	struct tas2781_hda *tas_hda = dev_get_drvdata(dev);
 	int ret;
 
-	dev_dbg(tas_priv->dev, "System Suspend\n");
+	dev_dbg(tas_hda->priv->dev, "System Suspend\n");
 
 	ret = pm_runtime_force_suspend(dev);
 	if (ret)
 		return ret;
 
 	/* Shutdown chip before system suspend */
-	tasdevice_tuning_switch(tas_priv, 1);
+	tasdevice_tuning_switch(tas_hda->priv, 1);
 
 	/*
 	 * Reset GPIO may be shared, so cannot reset here.
@@ -856,30 +894,30 @@ static int tas2781_system_suspend(struct device *dev)
 
 static int tas2781_system_resume(struct device *dev)
 {
-	struct tasdevice_priv *tas_priv = dev_get_drvdata(dev);
+	struct tas2781_hda *tas_hda = dev_get_drvdata(dev);
 	int i, ret;
 
-	dev_dbg(tas_priv->dev, "System Resume\n");
+	dev_info(tas_hda->priv->dev, "System Resume\n");
 
 	ret = pm_runtime_force_resume(dev);
 	if (ret)
 		return ret;
 
-	mutex_lock(&tas_priv->codec_lock);
+	mutex_lock(&tas_hda->priv->codec_lock);
 
-	for (i = 0; i < tas_priv->ndev; i++) {
-		tas_priv->tasdevice[i].cur_book = -1;
-		tas_priv->tasdevice[i].cur_prog = -1;
-		tas_priv->tasdevice[i].cur_conf = -1;
+	for (i = 0; i < tas_hda->priv->ndev; i++) {
+		tas_hda->priv->tasdevice[i].cur_book = -1;
+		tas_hda->priv->tasdevice[i].cur_prog = -1;
+		tas_hda->priv->tasdevice[i].cur_conf = -1;
 	}
-	tas2781_reset(tas_priv);
-	tasdevice_prmg_load(tas_priv, tas_priv->cur_prog);
+	tas2781_reset(tas_hda->priv);
+	tasdevice_prmg_load(tas_hda->priv, tas_hda->priv->cur_prog);
 
 	/* If calibrated data occurs error, dsp will still work with default
 	 * calibrated data inside algo.
 	 */
-	tasdevice_apply_calibration(tas_priv);
-	mutex_unlock(&tas_priv->codec_lock);
+	tasdevice_apply_calibration(tas_hda->priv);
+	mutex_unlock(&tas_hda->priv->codec_lock);
 
 	return 0;
 }
-- 
2.43.0

