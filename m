Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65387511BB9
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 17:14:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC9D11722;
	Wed, 27 Apr 2022 17:13:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC9D11722
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651072447;
	bh=BQK8a75cv99zblUknmXpXLbbqnHzP2Ra4H83sevmVMg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xl56tvXbiedXz/pp4pFzqwUe80BVKemE/ZYrD4caTV4GxSnt304eUeRjIuMMg2MPb
	 XfuXBv8IsEKUTUGr8MFBfxUmcxjTSxl8kWpozXzZw/WJ2xablylEKWZhPnUA9UNMts
	 XIOzzXqhk7EbsGbNCRrSBf7IhcfLg+ER+KuDwgv0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E27C8F805C6;
	Wed, 27 Apr 2022 17:08:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1508DF80558; Wed, 27 Apr 2022 17:08:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18C91F80534
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 17:07:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18C91F80534
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="LwwZEGfY"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23R6M8vs014103;
 Wed, 27 Apr 2022 10:07:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=s9Xowg3u5EX+ScIxTaHHAeum8QYR584iP/mzxsD0Hy8=;
 b=LwwZEGfYciA0yakUZHiBzEOpckbIzaPrrqjYEHmIr0qiIr2dD6B7R+p9OBdKinm4q5Pc
 My32LF2oY6WTT75Ov41lpeIu5BuXGDUNECqBL1PHVOZFsutpESfp4SpAKovcasRDXSIc
 SxmQOutXv9d6CTdEBYJLoVXmMydVdPB6IM36xSjpbNbEkiKEXcxwsOa3wameM+QVBILE
 6lK59Dh2R65dT0tUG4z2r2qYcP1tH7UgQCfHmebLZBJmqTBLYoygi7AmBRAVlsvmbXCi
 cV/7WOo9+5vnsSAaSLCLm3S+7IUcZZywNIuBwaqbhmHNco7ywE5AYUsb18DD5k1tQ01J Ew== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fprt60xth-12
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 27 Apr 2022 10:07:40 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 27 Apr
 2022 16:07:33 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 27 Apr 2022 16:07:33 +0100
Received: from vitaly-Legion-7-16ACHg6.ad.cirrus.com (unknown [198.90.238.170])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6F22F11D1;
 Wed, 27 Apr 2022 15:07:33 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Mark
 Brown <broonie@kernel.org>
Subject: [PATCH 25/26] ALSA: hda: cs35l41: Support Firmware switching and
 reloading
Date: Wed, 27 Apr 2022 16:07:19 +0100
Message-ID: <20220427150720.9194-26-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220427150720.9194-1-vitalyr@opensource.cirrus.com>
References: <20220427150720.9194-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: sYzse2ZD3z4KWORfQkIw7b7pQ7ETOVV3
X-Proofpoint-ORIG-GUID: sYzse2ZD3z4KWORfQkIw7b7pQ7ETOVV3
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Stefan Binding <sbinding@opensource.cirrus.com>
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

From: Stefan Binding <sbinding@opensource.cirrus.com>

This is required to support CS35L41 calibration.

By default, speaker protection firmware will be loaded, if
available. However, different firmware is required to run
the calibration sequence, so it is necessary to add support
to be able to unload, switch and reload firmware.

This patch adds 2 ALSA Controls for each amp:
"DSP1 Firmware Load"
"DSP1 Firmware Type"

"DSP1 Firmware Load" can be used to unload and
load the firmware.
"DSP1 Firmware Type"  can be used to switch the
target firmware to be loaded by "DSP1 Firmware Load"

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda.c | 163 ++++++++++++++++++++++++++++++++++--
 sound/pci/hda/cs35l41_hda.h |   5 ++
 2 files changed, 161 insertions(+), 7 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index 0eca85f3c80e..70e5354e3950 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -94,7 +94,7 @@ static int cs35l41_control_add(struct cs_dsp_coeff_ctl *cs_ctl)
 	struct hda_cs_dsp_ctl_info info;
 
 	info.amp_name = cs35l41->amp_name;
-	info.fw_type = HDA_CS_DSP_FW_SPK_PROT;
+	info.fw_type = cs35l41->firmware_type;
 	info.card = cs35l41->codec->card;
 
 	return hda_cs_dsp_control_add(cs_ctl, &info);
@@ -116,20 +116,24 @@ static int cs35l41_request_firmware_file(struct cs35l41_hda *cs35l41,
 
 	if (spkid > -1 && ssid && amp_name)
 		*filename = kasprintf(GFP_KERNEL, "%s%s-%s-%s-%s-spkid%d-%s.%s", dir, CS35L41_PART,
-				      dsp_name, "spk-prot", ssid, spkid, amp_name, filetype);
+				      dsp_name, hda_cs_dsp_fw_ids[cs35l41->firmware_type],
+				      ssid, spkid, amp_name, filetype);
 	else if (spkid > -1 && ssid)
 		*filename = kasprintf(GFP_KERNEL, "%s%s-%s-%s-%s-spkid%d.%s", dir, CS35L41_PART,
-				      dsp_name, "spk-prot", ssid, spkid, filetype);
+				      dsp_name, hda_cs_dsp_fw_ids[cs35l41->firmware_type],
+				      ssid, spkid, filetype);
 	else if (ssid && amp_name)
 		*filename = kasprintf(GFP_KERNEL, "%s%s-%s-%s-%s-%s.%s", dir, CS35L41_PART,
-				      dsp_name, "spk-prot", ssid, amp_name,
-				      filetype);
+				      dsp_name, hda_cs_dsp_fw_ids[cs35l41->firmware_type],
+				      ssid, amp_name, filetype);
 	else if (ssid)
 		*filename = kasprintf(GFP_KERNEL, "%s%s-%s-%s-%s.%s", dir, CS35L41_PART,
-				      dsp_name, "spk-prot", ssid, filetype);
+				      dsp_name, hda_cs_dsp_fw_ids[cs35l41->firmware_type],
+				      ssid, filetype);
 	else
 		*filename = kasprintf(GFP_KERNEL, "%s%s-%s-%s.%s", dir, CS35L41_PART,
-				      dsp_name, "spk-prot", filetype);
+				      dsp_name, hda_cs_dsp_fw_ids[cs35l41->firmware_type],
+				      filetype);
 
 	if (*filename == NULL)
 		return -ENOMEM;
@@ -427,8 +431,11 @@ static void cs35l41_hda_playback_hook(struct device *dev, int action)
 	struct regmap *reg = cs35l41->regmap;
 	int ret = 0;
 
+	mutex_lock(&cs35l41->fw_mutex);
+
 	switch (action) {
 	case HDA_GEN_PCM_ACT_OPEN:
+		cs35l41->playback_started = true;
 		if (cs35l41->firmware_running) {
 			regmap_multi_reg_write(reg, cs35l41_hda_config_dsp,
 					       ARRAY_SIZE(cs35l41_hda_config_dsp));
@@ -466,12 +473,15 @@ static void cs35l41_hda_playback_hook(struct device *dev, int action)
 					   0 << CS35L41_VMON_EN_SHIFT | 0 << CS35L41_IMON_EN_SHIFT);
 		}
 		cs35l41_irq_release(cs35l41);
+		cs35l41->playback_started = false;
 		break;
 	default:
 		dev_warn(cs35l41->dev, "Playback action not supported: %d\n", action);
 		break;
 	}
 
+	mutex_unlock(&cs35l41->fw_mutex);
+
 	if (ret)
 		dev_err(cs35l41->dev, "Regmap access fail: %d\n", ret);
 }
@@ -610,6 +620,136 @@ static int cs35l41_smart_amp(struct cs35l41_hda *cs35l41)
 	return ret;
 }
 
+static void cs35l41_load_firmware(struct cs35l41_hda *cs35l41, bool load)
+{
+	pm_runtime_get_sync(cs35l41->dev);
+
+	if (cs35l41->firmware_running && !load) {
+		dev_dbg(cs35l41->dev, "Unloading Firmware\n");
+		cs35l41_remove_dsp(cs35l41);
+	} else if (!cs35l41->firmware_running && load) {
+		dev_dbg(cs35l41->dev, "Loading Firmware\n");
+		cs35l41_smart_amp(cs35l41);
+	} else {
+		dev_dbg(cs35l41->dev, "Unable to Load firmware.\n");
+	}
+
+	pm_runtime_mark_last_busy(cs35l41->dev);
+	pm_runtime_put_autosuspend(cs35l41->dev);
+}
+
+static int cs35l41_fw_load_ctl_get(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct cs35l41_hda *cs35l41 = snd_kcontrol_chip(kcontrol);
+
+	ucontrol->value.integer.value[0] = cs35l41->request_fw_load;
+	return 0;
+}
+
+static int cs35l41_fw_load_ctl_put(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct cs35l41_hda *cs35l41 = snd_kcontrol_chip(kcontrol);
+	int ret = 0;
+
+	mutex_lock(&cs35l41->fw_mutex);
+	if (cs35l41->request_fw_load != ucontrol->value.integer.value[0]) {
+		if (cs35l41->playback_started) {
+			dev_err(cs35l41->dev, "Cannot Load/Unload firmware during Playback\n");
+			ret = -EBUSY;
+		} else {
+			cs35l41->request_fw_load = ucontrol->value.integer.value[0];
+			cs35l41_load_firmware(cs35l41, ucontrol->value.integer.value[0]);
+		}
+	}
+
+	mutex_unlock(&cs35l41->fw_mutex);
+
+	return ret;
+}
+
+static int cs35l41_fw_type_ctl_get(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct cs35l41_hda *cs35l41 = snd_kcontrol_chip(kcontrol);
+
+	ucontrol->value.enumerated.item[0] = cs35l41->firmware_type;
+
+	return 0;
+}
+
+static int cs35l41_fw_type_ctl_put(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct cs35l41_hda *cs35l41 = snd_kcontrol_chip(kcontrol);
+
+	if (ucontrol->value.enumerated.item[0] < HDA_CS_DSP_NUM_FW) {
+		cs35l41->firmware_type = ucontrol->value.enumerated.item[0];
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int cs35l41_fw_type_ctl_info(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_info *uinfo)
+{
+	return snd_ctl_enum_info(uinfo, 1, ARRAY_SIZE(hda_cs_dsp_fw_ids), hda_cs_dsp_fw_ids);
+}
+
+static int cs35l41_create_controls(struct cs35l41_hda *cs35l41)
+{
+	struct snd_kcontrol_new fw_type_ctl = {
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+		.info = cs35l41_fw_type_ctl_info,
+		.get = cs35l41_fw_type_ctl_get,
+		.put = cs35l41_fw_type_ctl_put,
+	};
+	struct snd_kcontrol_new fw_load_ctl = {
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+		.info = snd_ctl_boolean_mono_info,
+		.get = cs35l41_fw_load_ctl_get,
+		.put = cs35l41_fw_load_ctl_put,
+	};
+	int ret = 0;
+
+	fw_load_ctl.name = kasprintf(GFP_KERNEL, "%s DSP1 Firmware Load", cs35l41->amp_name);
+	if (!fw_load_ctl.name) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	fw_type_ctl.name = kasprintf(GFP_KERNEL, "%s DSP1 Firmware Type", cs35l41->amp_name);
+	if (!fw_type_ctl.name) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	if (snd_ctl_add(cs35l41->codec->card, snd_ctl_new1(&fw_type_ctl, cs35l41))) {
+		ret = -ENODEV;
+		dev_err(cs35l41->dev, "Failed to add KControl: %s\n", fw_type_ctl.name);
+		goto err;
+	}
+
+	dev_dbg(cs35l41->dev, "Added Control %s\n", fw_type_ctl.name);
+
+	if (snd_ctl_add(cs35l41->codec->card, snd_ctl_new1(&fw_load_ctl, cs35l41))) {
+		ret = -ENODEV;
+		dev_err(cs35l41->dev, "Failed to add KControl: %s, removing all controls\n",
+			fw_load_ctl.name);
+		hda_cs_dsp_remove_kcontrol(cs35l41->codec->card, fw_type_ctl.name);
+		goto err;
+	}
+
+	dev_dbg(cs35l41->dev, "Added Control %s\n", fw_load_ctl.name);
+
+err:
+	kfree(fw_load_ctl.name);
+	kfree(fw_type_ctl.name);
+
+	return ret;
+}
+
 static int cs35l41_hda_bind(struct device *dev, struct device *master, void *master_data)
 {
 	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
@@ -631,8 +771,15 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
 	cs35l41->codec = comps->codec;
 	strscpy(comps->name, dev_name(dev), sizeof(comps->name));
 
+	cs35l41->firmware_type = HDA_CS_DSP_FW_SPK_PROT;
+
+	cs35l41->request_fw_load = true;
+	mutex_lock(&cs35l41->fw_mutex);
 	if (cs35l41_smart_amp(cs35l41) < 0)
 		dev_warn(cs35l41->dev, "Cannot Run Firmware, reverting to dsp bypass...\n");
+	mutex_unlock(&cs35l41->fw_mutex);
+
+	cs35l41_create_controls(cs35l41);
 
 	comps->playback_hook = cs35l41_hda_playback_hook;
 	comps->suspend_hook = cs35l41_hda_suspend_hook;
@@ -1152,6 +1299,8 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
 	if (ret)
 		goto err;
 
+	mutex_init(&cs35l41->fw_mutex);
+
 	pm_runtime_set_autosuspend_delay(cs35l41->dev, 3000);
 	pm_runtime_use_autosuspend(cs35l41->dev);
 	pm_runtime_mark_last_busy(cs35l41->dev);
diff --git a/sound/pci/hda/cs35l41_hda.h b/sound/pci/hda/cs35l41_hda.h
index 3cf9871fbed2..19f0585d12db 100644
--- a/sound/pci/hda/cs35l41_hda.h
+++ b/sound/pci/hda/cs35l41_hda.h
@@ -58,10 +58,15 @@ struct cs35l41_hda {
 	unsigned volatile long irq_errors;
 	const char *amp_name;
 	const char *acpi_subsystem_id;
+	int firmware_type;
 	int speaker_id;
+	struct mutex fw_mutex;
+
 	struct regmap_irq_chip_data *irq_data;
 	bool firmware_running;
+	bool request_fw_load;
 	bool halo_initialized;
+	bool playback_started;
 	struct cs_dsp cs_dsp;
 };
 
-- 
2.32.0

