Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B9B533DB7
	for <lists+alsa-devel@lfdr.de>; Wed, 25 May 2022 15:21:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91E6916D7;
	Wed, 25 May 2022 15:20:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91E6916D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653484891;
	bh=ssmM6cAa3ESbEkcHVwSbauludCxZClzzf7wXGKtOFiI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jgRwfTx4QwcckhLWYPQmutOg0DTorV+5h3BUyWCAmJzehNxq8TkzuUEHGS3Uq+CJe
	 3MdvsdYDhfnW+BwtHkQbV2skvLvJgyiU9hLOfQr9/BWX03fU/9sN7qg5wNVUcTml3r
	 SIZSHQzvU94GaZn32V42IQ47r49SdTnuJ2qZy2Hc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2117F80578;
	Wed, 25 May 2022 15:17:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CA65F80544; Wed, 25 May 2022 15:17:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7FC5AF800D0
 for <alsa-devel@alsa-project.org>; Wed, 25 May 2022 15:16:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FC5AF800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ZddpSmtV"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24PCRmjK022096;
 Wed, 25 May 2022 08:16:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=x6uQoyctrHPlWbuzGaH2qzzAbxTQ0aD3UXrmL74s7YY=;
 b=ZddpSmtVhBv7aKGOzcot4OinWyp6whoxl8GNe/Dbq5xjlwMUuBThBpDWz5ttSFepcRXv
 KDB+kmrcFva8FUHuC0eh9N93mPtyPxDmUZ3mQa+8XUXJksnA845YbsCmfFFUp8JPat9E
 Wcdrqh2kYeqsL/rM5dhygfrRJPCoiQol5A/5yLctOg4AAkc0UzGHjY00t8D4CetIHyDI
 DQjQ2zdseXYyo25/GkNobZg6wUk4ec+VMKClLYDvZ+oyQ1j+lBnQf7Siakzzb4TIKCPB
 vcujh9RgDzI/AeiLb3Tj0q9gGxH3Z10EBuZ6Lt6CnjyuV2RwrG0AHZGUADratqrcn7y1 Sw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3g93u20we6-10
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 25 May 2022 08:16:48 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 25 May
 2022 14:16:44 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 25 May 2022 14:16:44 +0100
Received: from vitaly-Legion-7-16ACHg6.ad.cirrus.com (unknown [198.90.238.233])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 495F511D1;
 Wed, 25 May 2022 13:16:44 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Mark
 Brown <broonie@kernel.org>
Subject: [PATCH v4 12/17] ALSA: hda: cs35l41: Support Hibernation during
 Suspend
Date: Wed, 25 May 2022 14:16:33 +0100
Message-ID: <20220525131638.5512-13-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220525131638.5512-1-vitalyr@opensource.cirrus.com>
References: <20220525131638.5512-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: LhCULscjGxo92_th9vUrPZFCohOJ_4Mg
X-Proofpoint-GUID: LhCULscjGxo92_th9vUrPZFCohOJ_4Mg
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

CS35L41 supports hibernation during suspend when using
DSP firmware.
When the driver suspends it will hibernate the part, if
firmware is running, and resume will wake from hibernation.
CS35L41 driver will suspend/resume when requested by
hda driver.
Note that suspend/resume and hibernation is only supported
when firmware is running.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---

Changes since v2:
 - No change
 
 sound/pci/hda/cs35l41_hda.c     | 109 +++++++++++++++++++++++++++++++-
 sound/pci/hda/cs35l41_hda.h     |   2 +
 sound/pci/hda/cs35l41_hda_i2c.c |   1 +
 sound/pci/hda/cs35l41_hda_spi.c |   1 +
 sound/pci/hda/hda_component.h   |   2 +
 sound/pci/hda/patch_realtek.c   |  25 +++++++-
 6 files changed, 136 insertions(+), 4 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index 1d62a41fbc75..9c622104bf01 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 #include <sound/hda_codec.h>
 #include <sound/soc.h>
+#include <linux/pm_runtime.h>
 #include "hda_local.h"
 #include "hda_auto_parser.h"
 #include "hda_jack.h"
@@ -425,6 +426,75 @@ static int cs35l41_hda_channel_map(struct device *dev, unsigned int tx_num, unsi
 				    rx_slot);
 }
 
+static int cs35l41_runtime_suspend(struct device *dev)
+{
+	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
+
+	dev_dbg(cs35l41->dev, "Suspend\n");
+
+	if (!cs35l41->firmware_running)
+		return 0;
+
+	if (cs35l41_enter_hibernate(cs35l41->dev, cs35l41->regmap, cs35l41->hw_cfg.bst_type) < 0)
+		return 0;
+
+	regcache_cache_only(cs35l41->regmap, true);
+	regcache_mark_dirty(cs35l41->regmap);
+
+	return 0;
+}
+
+static int cs35l41_runtime_resume(struct device *dev)
+{
+	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
+	int ret;
+
+	dev_dbg(cs35l41->dev, "Resume.\n");
+
+	if (cs35l41->hw_cfg.bst_type == CS35L41_EXT_BOOST_NO_VSPK_SWITCH) {
+		dev_dbg(cs35l41->dev, "System does not support Resume\n");
+		return 0;
+	}
+
+	if (!cs35l41->firmware_running)
+		return 0;
+
+	regcache_cache_only(cs35l41->regmap, false);
+
+	ret = cs35l41_exit_hibernate(cs35l41->dev, cs35l41->regmap);
+	if (ret) {
+		regcache_cache_only(cs35l41->regmap, true);
+		return ret;
+	}
+
+	/* Test key needs to be unlocked to allow the OTP settings to re-apply */
+	cs35l41_test_key_unlock(cs35l41->dev, cs35l41->regmap);
+	ret = regcache_sync(cs35l41->regmap);
+	cs35l41_test_key_lock(cs35l41->dev, cs35l41->regmap);
+	if (ret) {
+		dev_err(cs35l41->dev, "Failed to restore register cache: %d\n", ret);
+		return ret;
+	}
+
+	if (cs35l41->hw_cfg.bst_type == CS35L41_EXT_BOOST)
+		cs35l41_init_boost(cs35l41->dev, cs35l41->regmap, &cs35l41->hw_cfg);
+
+	return 0;
+}
+
+static int cs35l41_hda_suspend_hook(struct device *dev)
+{
+	dev_dbg(dev, "Request Suspend\n");
+	pm_runtime_mark_last_busy(dev);
+	return pm_runtime_put_autosuspend(dev);
+}
+
+static int cs35l41_hda_resume_hook(struct device *dev)
+{
+	dev_dbg(dev, "Request Resume\n");
+	return pm_runtime_get_sync(dev);
+}
+
 static int cs35l41_smart_amp(struct cs35l41_hda *cs35l41)
 {
 	int halo_sts;
@@ -482,17 +552,25 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
 	if (comps->dev)
 		return -EBUSY;
 
+	pm_runtime_get_sync(dev);
+
 	comps->dev = dev;
 	if (!cs35l41->acpi_subsystem_id)
 		cs35l41->acpi_subsystem_id = devm_kasprintf(dev, GFP_KERNEL,
 							    "%.8x", comps->subsystem_id);
 	cs35l41->codec = comps->codec;
 	strscpy(comps->name, dev_name(dev), sizeof(comps->name));
-	comps->playback_hook = cs35l41_hda_playback_hook;
 
 	if (cs35l41_smart_amp(cs35l41) < 0)
 		dev_warn(cs35l41->dev, "Cannot Run Firmware, reverting to dsp bypass...\n");
 
+	comps->playback_hook = cs35l41_hda_playback_hook;
+	comps->suspend_hook = cs35l41_hda_suspend_hook;
+	comps->resume_hook = cs35l41_hda_resume_hook;
+
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
 	return 0;
 }
 
@@ -588,7 +666,7 @@ static const struct regmap_irq cs35l41_reg_irqs[] = {
 	CS35L41_REG_IRQ(IRQ1_STATUS1, AMP_SHORT_ERR),
 };
 
-static const struct regmap_irq_chip cs35l41_regmap_irq_chip = {
+static struct regmap_irq_chip cs35l41_regmap_irq_chip = {
 	.name = "cs35l41 IRQ1 Controller",
 	.status_base = CS35L41_IRQ1_STATUS1,
 	.mask_base = CS35L41_IRQ1_MASK1,
@@ -596,6 +674,7 @@ static const struct regmap_irq_chip cs35l41_regmap_irq_chip = {
 	.num_regs = 4,
 	.irqs = cs35l41_reg_irqs,
 	.num_irqs = ARRAY_SIZE(cs35l41_reg_irqs),
+	.runtime_pm = true,
 };
 
 static int cs35l41_hda_apply_properties(struct cs35l41_hda *cs35l41)
@@ -1003,13 +1082,23 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
 	if (ret)
 		goto err;
 
+	pm_runtime_set_autosuspend_delay(cs35l41->dev, 3000);
+	pm_runtime_use_autosuspend(cs35l41->dev);
+	pm_runtime_mark_last_busy(cs35l41->dev);
+	pm_runtime_set_active(cs35l41->dev);
+	pm_runtime_get_noresume(cs35l41->dev);
+	pm_runtime_enable(cs35l41->dev);
+
 	ret = cs35l41_hda_apply_properties(cs35l41);
 	if (ret)
-		goto err;
+		goto err_pm;
+
+	pm_runtime_put_autosuspend(cs35l41->dev);
 
 	ret = component_add(cs35l41->dev, &cs35l41_hda_comp_ops);
 	if (ret) {
 		dev_err(cs35l41->dev, "Register component failed: %d\n", ret);
+		pm_runtime_disable(cs35l41->dev);
 		goto err;
 	}
 
@@ -1017,6 +1106,10 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
 
 	return 0;
 
+err_pm:
+	pm_runtime_disable(cs35l41->dev);
+	pm_runtime_put_noidle(cs35l41->dev);
+
 err:
 	if (cs35l41_safe_reset(cs35l41->regmap, cs35l41->hw_cfg.bst_type))
 		gpiod_set_value_cansleep(cs35l41->reset_gpio, 0);
@@ -1030,17 +1123,27 @@ void cs35l41_hda_remove(struct device *dev)
 {
 	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
 
+	pm_runtime_get_sync(cs35l41->dev);
+	pm_runtime_disable(cs35l41->dev);
+
 	if (cs35l41->firmware_running)
 		cs35l41_remove_dsp(cs35l41);
 
 	component_del(cs35l41->dev, &cs35l41_hda_comp_ops);
 
+	pm_runtime_put_noidle(cs35l41->dev);
+
 	if (cs35l41_safe_reset(cs35l41->regmap, cs35l41->hw_cfg.bst_type))
 		gpiod_set_value_cansleep(cs35l41->reset_gpio, 0);
 	gpiod_put(cs35l41->reset_gpio);
 }
 EXPORT_SYMBOL_NS_GPL(cs35l41_hda_remove, SND_HDA_SCODEC_CS35L41);
 
+const struct dev_pm_ops cs35l41_hda_pm_ops = {
+	SET_RUNTIME_PM_OPS(cs35l41_runtime_suspend, cs35l41_runtime_resume, NULL)
+};
+EXPORT_SYMBOL_NS_GPL(cs35l41_hda_pm_ops, SND_HDA_SCODEC_CS35L41);
+
 MODULE_DESCRIPTION("CS35L41 HDA Driver");
 MODULE_IMPORT_NS(SND_HDA_CS_DSP_CONTROLS);
 MODULE_AUTHOR("Lucas Tanure, Cirrus Logic Inc, <tanureal@opensource.cirrus.com>");
diff --git a/sound/pci/hda/cs35l41_hda.h b/sound/pci/hda/cs35l41_hda.h
index 717b30a2e33b..54521a013e78 100644
--- a/sound/pci/hda/cs35l41_hda.h
+++ b/sound/pci/hda/cs35l41_hda.h
@@ -56,6 +56,8 @@ enum halo_state {
 	HALO_STATE_CODE_RUN
 };
 
+extern const struct dev_pm_ops cs35l41_hda_pm_ops;
+
 int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int irq,
 		      struct regmap *regmap);
 void cs35l41_hda_remove(struct device *dev);
diff --git a/sound/pci/hda/cs35l41_hda_i2c.c b/sound/pci/hda/cs35l41_hda_i2c.c
index e810b278fb91..a669090a18e8 100644
--- a/sound/pci/hda/cs35l41_hda_i2c.c
+++ b/sound/pci/hda/cs35l41_hda_i2c.c
@@ -55,6 +55,7 @@ static struct i2c_driver cs35l41_i2c_driver = {
 	.driver = {
 		.name		= "cs35l41-hda",
 		.acpi_match_table = ACPI_PTR(cs35l41_acpi_hda_match),
+		.pm		= &cs35l41_hda_pm_ops,
 	},
 	.id_table	= cs35l41_hda_i2c_id,
 	.probe		= cs35l41_hda_i2c_probe,
diff --git a/sound/pci/hda/cs35l41_hda_spi.c b/sound/pci/hda/cs35l41_hda_spi.c
index 22e088f28438..d7f15e2abe66 100644
--- a/sound/pci/hda/cs35l41_hda_spi.c
+++ b/sound/pci/hda/cs35l41_hda_spi.c
@@ -50,6 +50,7 @@ static struct spi_driver cs35l41_spi_driver = {
 	.driver = {
 		.name		= "cs35l41-hda",
 		.acpi_match_table = ACPI_PTR(cs35l41_acpi_hda_match),
+		.pm		= &cs35l41_hda_pm_ops,
 	},
 	.id_table	= cs35l41_hda_spi_id,
 	.probe		= cs35l41_hda_spi_probe,
diff --git a/sound/pci/hda/hda_component.h b/sound/pci/hda/hda_component.h
index fa6df52e7855..72ec0d865a28 100644
--- a/sound/pci/hda/hda_component.h
+++ b/sound/pci/hda/hda_component.h
@@ -17,4 +17,6 @@ struct hda_component {
 	int subsystem_id;
 	struct hda_codec *codec;
 	void (*playback_hook)(struct device *dev, int action);
+	int (*suspend_hook)(struct device *dev);
+	int (*resume_hook)(struct device *dev);
 };
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index b8249c4dcb1d..fc2467d03b8a 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -4006,15 +4006,22 @@ static void alc5505_dsp_init(struct hda_codec *codec)
 static int alc269_suspend(struct hda_codec *codec)
 {
 	struct alc_spec *spec = codec->spec;
+	int i;
 
 	if (spec->has_alc5505_dsp)
 		alc5505_dsp_suspend(codec);
+
+	for (i = 0; i < HDA_MAX_COMPONENTS; i++)
+		if (spec->comps[i].suspend_hook)
+			spec->comps[i].suspend_hook(spec->comps[i].dev);
+
 	return alc_suspend(codec);
 }
 
 static int alc269_resume(struct hda_codec *codec)
 {
 	struct alc_spec *spec = codec->spec;
+	int i;
 
 	if (spec->codec_variant == ALC269_TYPE_ALC269VB)
 		alc269vb_toggle_power_output(codec, 0);
@@ -4045,6 +4052,10 @@ static int alc269_resume(struct hda_codec *codec)
 	if (spec->has_alc5505_dsp)
 		alc5505_dsp_resume(codec);
 
+	for (i = 0; i < HDA_MAX_COMPONENTS; i++)
+		if (spec->comps[i].resume_hook)
+			spec->comps[i].resume_hook(spec->comps[i].dev);
+
 	return 0;
 }
 #endif /* CONFIG_PM */
@@ -6587,8 +6598,20 @@ static int comp_bind(struct device *dev)
 {
 	struct hda_codec *cdc = dev_to_hda_codec(dev);
 	struct alc_spec *spec = cdc->spec;
+	int ret, i;
+
+	ret = component_bind_all(dev, spec->comps);
+	if (ret)
+		return ret;
 
-	return component_bind_all(dev, spec->comps);
+	if (snd_hdac_is_power_on(&cdc->core)) {
+		codec_dbg(cdc, "Resuming after bind.\n");
+		for (i = 0; i < HDA_MAX_COMPONENTS; i++)
+			if (spec->comps[i].resume_hook)
+				spec->comps[i].resume_hook(spec->comps[i].dev);
+	}
+
+	return 0;
 }
 
 static void comp_unbind(struct device *dev)
-- 
2.34.1

