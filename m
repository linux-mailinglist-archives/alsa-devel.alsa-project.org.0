Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E8A560E07
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jun 2022 02:27:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B91E816B1;
	Thu, 30 Jun 2022 02:26:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B91E816B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656548867;
	bh=al2RteQQ4h3mXqIHWI3nDA7fxObu/4xH4Slb+/P7f/Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nBE4dIIZpgiNsTst+0SO9z/pE7j2jCRuQxNVxDPeWwx3g+iIMXdco3k9QR+F/Hd6S
	 a3vQlK64ocmssO+KLJN94asU9VaDzERrmbrcg2MajARG0S8FN4XTsJ9hcAv9nzChE9
	 ZmD6WKRndN3a6ld4fMKD7DSqB+lopejaWJfUVQXM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DDB9F805AB;
	Thu, 30 Jun 2022 02:24:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 100E0F80578; Thu, 30 Jun 2022 02:24:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6CE41F80535
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 02:23:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CE41F80535
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="CNqkpvLN"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25U004kM009594;
 Wed, 29 Jun 2022 19:23:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=AYgLutEBUefq+oNnIzM4nMgXF/RQr4+PyUJ2khc95ww=;
 b=CNqkpvLN9grqlKpE7SSqA5b8lkzJq9Q4t/mGoyKS5iZVXysggAHWYwVBX4NHxpXTBB5Z
 OvthAJJaZIagqOBsUPAZQkme/QF6j4f29kJjzuKr1XP9jSyJi9lv0L/WuD2LdxY/yVw5
 2ymZphzgaOa/zc9h9qfnTGkt6TMHia6WqSDQvvFTtTQ0kJugusMdpXbRDK3Lpc7Fyv2T
 28WQhN+pA4QzHG1jy1FT7dfusQPWWziZM4EllR0ems4A61FtTrQ9DOg4DXqdVpxe1+CN
 YEqAdjncU+yr5txOMMlCVeGySUYQXtfglon5QvXoFHbnh8BD1ORg6QCWxyXRGcUGCaJd Sw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gwys2p9gn-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 29 Jun 2022 19:23:49 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 30 Jun
 2022 01:23:46 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 30 Jun 2022 01:23:46 +0100
Received: from vitaly-Legion-7-16ACHg6.ad.cirrus.com (unknown [198.90.238.125])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B29C32A9;
 Thu, 30 Jun 2022 00:23:46 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Mark
 Brown <broonie@kernel.org>
Subject: [PATCH v8 09/14] ALSA: hda: cs35l41: Support Hibernation during
 Suspend
Date: Thu, 30 Jun 2022 01:23:30 +0100
Message-ID: <20220630002335.366545-10-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220630002335.366545-1-vitalyr@opensource.cirrus.com>
References: <20220630002335.366545-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: LsD8Q42a-BEO4drMDcuUdOD4DWzRTCDR
X-Proofpoint-GUID: LsD8Q42a-BEO4drMDcuUdOD4DWzRTCDR
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
 sound/pci/hda/cs35l41_hda.c     | 109 +++++++++++++++++++++++++++++++-
 sound/pci/hda/cs35l41_hda.h     |   2 +
 sound/pci/hda/cs35l41_hda_i2c.c |   1 +
 sound/pci/hda/cs35l41_hda_spi.c |   1 +
 sound/pci/hda/hda_component.h   |   2 +
 sound/pci/hda/patch_realtek.c   |  25 +++++++-
 6 files changed, 136 insertions(+), 4 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index 8ca571706cd8..4f818229e62e 100644
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
@@ -435,6 +436,75 @@ static int cs35l41_hda_channel_map(struct device *dev, unsigned int tx_num, unsi
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
@@ -492,19 +562,27 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
 	if (comps->dev)
 		return -EBUSY;
 
+	pm_runtime_get_sync(dev);
+
 	comps->dev = dev;
 	if (!cs35l41->acpi_subsystem_id)
 		cs35l41->acpi_subsystem_id = devm_kasprintf(dev, GFP_KERNEL, "%.8x",
 							    comps->codec->core.subsystem_id);
 	cs35l41->codec = comps->codec;
 	strscpy(comps->name, dev_name(dev), sizeof(comps->name));
-	comps->playback_hook = cs35l41_hda_playback_hook;
 
 	mutex_lock(&cs35l41->fw_mutex);
 	if (cs35l41_smart_amp(cs35l41) < 0)
 		dev_warn(cs35l41->dev, "Cannot Run Firmware, reverting to dsp bypass...\n");
 	mutex_unlock(&cs35l41->fw_mutex);
 
+	comps->playback_hook = cs35l41_hda_playback_hook;
+	comps->suspend_hook = cs35l41_hda_suspend_hook;
+	comps->resume_hook = cs35l41_hda_resume_hook;
+
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
 	return 0;
 }
 
@@ -600,7 +678,7 @@ static const struct regmap_irq cs35l41_reg_irqs[] = {
 	CS35L41_REG_IRQ(IRQ1_STATUS1, AMP_SHORT_ERR),
 };
 
-static const struct regmap_irq_chip cs35l41_regmap_irq_chip = {
+static struct regmap_irq_chip cs35l41_regmap_irq_chip = {
 	.name = "cs35l41 IRQ1 Controller",
 	.status_base = CS35L41_IRQ1_STATUS1,
 	.mask_base = CS35L41_IRQ1_MASK1,
@@ -608,6 +686,7 @@ static const struct regmap_irq_chip cs35l41_regmap_irq_chip = {
 	.num_regs = 4,
 	.irqs = cs35l41_reg_irqs,
 	.num_irqs = ARRAY_SIZE(cs35l41_reg_irqs),
+	.runtime_pm = true,
 };
 
 static int cs35l41_hda_apply_properties(struct cs35l41_hda *cs35l41)
@@ -1017,13 +1096,23 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
 
 	mutex_init(&cs35l41->fw_mutex);
 
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
 
@@ -1031,6 +1120,10 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
 
 	return 0;
 
+err_pm:
+	pm_runtime_disable(cs35l41->dev);
+	pm_runtime_put_noidle(cs35l41->dev);
+
 err:
 	if (cs35l41_safe_reset(cs35l41->regmap, cs35l41->hw_cfg.bst_type))
 		gpiod_set_value_cansleep(cs35l41->reset_gpio, 0);
@@ -1044,17 +1137,27 @@ void cs35l41_hda_remove(struct device *dev)
 {
 	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
 
+	pm_runtime_get_sync(cs35l41->dev);
+	pm_runtime_disable(cs35l41->dev);
+
 	if (cs35l41->halo_initialized)
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
index a9dbc1c19248..439c4b705328 100644
--- a/sound/pci/hda/cs35l41_hda.h
+++ b/sound/pci/hda/cs35l41_hda.h
@@ -57,6 +57,8 @@ enum halo_state {
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
index 534e845b9cd1..1223621bd62c 100644
--- a/sound/pci/hda/hda_component.h
+++ b/sound/pci/hda/hda_component.h
@@ -16,4 +16,6 @@ struct hda_component {
 	char name[HDA_MAX_NAME_SIZE];
 	struct hda_codec *codec;
 	void (*playback_hook)(struct device *dev, int action);
+	int (*suspend_hook)(struct device *dev);
+	int (*resume_hook)(struct device *dev);
 };
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 0369e19cd4bd..0060cfc8389e 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -4021,15 +4021,22 @@ static void alc5505_dsp_init(struct hda_codec *codec)
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
@@ -4060,6 +4067,10 @@ static int alc269_resume(struct hda_codec *codec)
 	if (spec->has_alc5505_dsp)
 		alc5505_dsp_resume(codec);
 
+	for (i = 0; i < HDA_MAX_COMPONENTS; i++)
+		if (spec->comps[i].resume_hook)
+			spec->comps[i].resume_hook(spec->comps[i].dev);
+
 	return 0;
 }
 #endif /* CONFIG_PM */
@@ -6610,8 +6621,20 @@ static int comp_bind(struct device *dev)
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

