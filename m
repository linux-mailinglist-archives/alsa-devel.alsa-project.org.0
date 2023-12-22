Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7341381C25F
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Dec 2023 01:37:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7D5BE10;
	Fri, 22 Dec 2023 01:37:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7D5BE10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703205443;
	bh=ZN3OVXpouXLA/VQdJJHkX8Iuv0wr7Uu58/focd/9Tko=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CGqpOMgU8KgJZbln+SHdfyLHngCtk9v7tcxVemFhrw2+gtRV0DQqpA6DKvGv7jsQS
	 +BHYO16UNXFs22+ZCxnVnF3L5b0bJaFqubJS2RNbbnCPFYTek3G+yey9EtuIBcuz/P
	 +QKrfMQyGH0+qygsDKgFcYeHO64hp9xy/UvDv1iM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A91CF805C1; Fri, 22 Dec 2023 01:36:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CCA4DF805BA;
	Fri, 22 Dec 2023 01:36:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98994F8058C; Fri, 22 Dec 2023 01:36:40 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id 73002F800D2
	for <alsa-devel@alsa-project.org>; Fri, 22 Dec 2023 01:36:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73002F800D2
Received: from fedori.lan (51b681e3.dsl.pool.telekom.hu
 [::ffff:81.182.129.227])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000071EE8.000000006584DA0A.0013B20E;
 Fri, 22 Dec 2023 01:36:23 +0100
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
  Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
  alsa-devel@alsa-project.org, Gergo Koteles <soyer@irl.hu>,
  stable@vger.kernel.org
Subject: [PATCH 2/2] ALSA: hda/tas2781: remove sound controls in unbind
Date: Fri, 22 Dec 2023 01:34:48 +0100
Message-ID: 
 <362aa3e2f81b9259a3e5222f576bec5debfc5e88.1703204848.git.soyer@irl.hu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: 
 <1398bd8bf3e935b1595a99128320e4a1913e210a.1703204848.git.soyer@irl.hu>
References: 
 <1398bd8bf3e935b1595a99128320e4a1913e210a.1703204848.git.soyer@irl.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
Message-ID-Hash: P7IIBTCD6H3PICELLYG62GDTAYT5GCEE
X-Message-ID-Hash: P7IIBTCD6H3PICELLYG62GDTAYT5GCEE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P7IIBTCD6H3PICELLYG62GDTAYT5GCEE/>
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

This patch depends on patch:
ALSA: hda/tas2781: do not use regcache

Fixes: 5be27f1e3ec9 ("ALSA: hda/tas2781: Add tas2781 HDA driver")
CC: stable@vger.kernel.org
Signed-off-by: Gergo Koteles <soyer@irl.hu>
---
 sound/pci/hda/tas2781_hda_i2c.c | 223 +++++++++++++++++++-------------
 1 file changed, 130 insertions(+), 93 deletions(-)

diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index 769604375745..731664fc8b21 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -65,6 +65,15 @@ enum calib_data {
 	CALIB_MAX
 };
 
+struct tas2781_hda {
+	struct device *dev;
+	struct tasdevice_priv *priv;
+	struct snd_kcontrol *dsp_prog_ctl;
+	struct snd_kcontrol *dsp_conf_ctl;
+	struct snd_kcontrol *prof_ctl;
+	struct snd_kcontrol *snd_ctls[3];
+};
+
 static int tas2781_get_i2c_res(struct acpi_resource *ares, void *data)
 {
 	struct tasdevice_priv *tas_priv = data;
@@ -125,26 +134,26 @@ static int tas2781_read_acpi(struct tasdevice_priv *p, const char *hid)
 
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
@@ -477,9 +486,28 @@ static int tas2781_save_calibration(struct tasdevice_priv *tas_priv)
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
 
@@ -490,8 +518,8 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
 	if (ret)
 		goto out;
 
-	ret = snd_ctl_add(codec->card,
-		snd_ctl_new1(&tas2781_prof_ctrl, tas_priv));
+	tas_hda->prof_ctl = snd_ctl_new1(&tas2781_prof_ctrl, tas_priv);
+	ret = snd_ctl_add(codec->card, tas_hda->prof_ctl);
 	if (ret) {
 		dev_err(tas_priv->dev,
 			"Failed to add KControl %s = %d\n",
@@ -500,8 +528,9 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
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
@@ -523,8 +552,9 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
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
@@ -532,8 +562,9 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
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
@@ -554,27 +585,27 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
 	tas2781_save_calibration(tas_priv);
 
 out:
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
 
@@ -583,10 +614,10 @@ static int tas2781_hda_bind(struct device *dev, struct device *master,
 
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
 
@@ -596,7 +627,7 @@ static int tas2781_hda_bind(struct device *dev, struct device *master,
 
 	strscpy(comps->name, dev_name(dev), sizeof(comps->name));
 
-	ret = tascodec_init(tas_priv, codec, tasdev_fw_ready);
+	ret = tascodec_init(tas_hda->priv, codec, tasdev_fw_ready);
 	if (!ret)
 		comps->playback_hook = tas2781_hda_playback_hook;
 
@@ -609,9 +640,9 @@ static int tas2781_hda_bind(struct device *dev, struct device *master,
 static void tas2781_hda_unbind(struct device *dev,
 	struct device *master, void *master_data)
 {
-	struct tasdevice_priv *tas_priv = dev_get_drvdata(dev);
+	struct tas2781_hda *tas_hda = dev_get_drvdata(dev);
 	struct hda_component *comps = master_data;
-	comps = &comps[tas_priv->index];
+	comps = &comps[tas_hda->priv->index];
 
 	if (comps->dev == dev) {
 		comps->dev = NULL;
@@ -619,10 +650,12 @@ static void tas2781_hda_unbind(struct device *dev,
 		comps->playback_hook = NULL;
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
@@ -632,21 +665,21 @@ static const struct component_ops tas2781_hda_comp_ops = {
 
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
 
@@ -655,37 +688,42 @@ static int tas2781_hda_i2c_probe(struct i2c_client *clt)
 	else
 		return -ENODEV;
 
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
 
-	tas2781_reset(tas_priv);
+	tas2781_reset(tas_hda->priv);
 
-	ret = component_add(tas_priv->dev, &tas2781_hda_comp_ops);
+	ret = component_add(tas_hda->dev, &tas2781_hda_comp_ops);
 	if (ret) {
-		dev_err(tas_priv->dev, "Register component failed: %d\n", ret);
-		pm_runtime_disable(tas_priv->dev);
+		dev_err(tas_hda->dev, "Register component failed: %d\n", ret);
+		pm_runtime_disable(tas_hda->dev);
 	}
 
 err:
@@ -701,66 +739,65 @@ static void tas2781_hda_i2c_remove(struct i2c_client *clt)
 
 static int tas2781_runtime_suspend(struct device *dev)
 {
-	struct tasdevice_priv *tas_priv = dev_get_drvdata(dev);
+	struct tas2781_hda *tas_hda = dev_get_drvdata(dev);
 	int i;
 
-	dev_dbg(tas_priv->dev, "Runtime Suspend\n");
+	dev_dbg(tas_hda->dev, "Runtime Suspend\n");
 
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
 
-
-	mutex_unlock(&tas_priv->codec_lock);
+	mutex_unlock(&tas_hda->priv->codec_lock);
 
 	return 0;
 }
 
 static int tas2781_runtime_resume(struct device *dev)
 {
-	struct tasdevice_priv *tas_priv = dev_get_drvdata(dev);
+	struct tas2781_hda *tas_hda = dev_get_drvdata(dev);
 	unsigned long calib_data_sz =
-		tas_priv->ndev * TASDEVICE_SPEAKER_CALIBRATION_SIZE;
+		tas_hda->priv->ndev * TASDEVICE_SPEAKER_CALIBRATION_SIZE;
 
-	dev_dbg(tas_priv->dev, "Runtime Resume\n");
+	dev_dbg(tas_hda->dev, "Runtime Resume\n");
 
-	mutex_lock(&tas_priv->codec_lock);
+	mutex_lock(&tas_hda->priv->codec_lock);
 
-	tasdevice_prmg_load(tas_priv, tas_priv->cur_prog);
+	tasdevice_prmg_load(tas_hda->priv, tas_hda->priv->cur_prog);
 
 	/* If calibrated data occurs error, dsp will still works with default
 	 * calibrated data inside algo.
 	 */
-	if (tas_priv->cali_data.total_sz > calib_data_sz)
-		tas2781_apply_calib(tas_priv);
+	if (tas_hda->priv->cali_data.total_sz > calib_data_sz)
+		tas2781_apply_calib(tas_hda->priv);
 
-	mutex_unlock(&tas_priv->codec_lock);
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
@@ -771,33 +808,33 @@ static int tas2781_system_suspend(struct device *dev)
 
 static int tas2781_system_resume(struct device *dev)
 {
-	struct tasdevice_priv *tas_priv = dev_get_drvdata(dev);
+	struct tas2781_hda *tas_hda = dev_get_drvdata(dev);
 	unsigned long calib_data_sz =
-		tas_priv->ndev * TASDEVICE_SPEAKER_CALIBRATION_SIZE;
+		tas_hda->priv->ndev * TASDEVICE_SPEAKER_CALIBRATION_SIZE;
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
-	if (tas_priv->cali_data.total_sz > calib_data_sz)
-		tas2781_apply_calib(tas_priv);
-	mutex_unlock(&tas_priv->codec_lock);
+	if (tas_hda->priv->cali_data.total_sz > calib_data_sz)
+		tas2781_apply_calib(tas_hda->priv);
+	mutex_unlock(&tas_hda->priv->codec_lock);
 
 	return 0;
 }
-- 
2.43.0

