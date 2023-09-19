Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 819EC7A668C
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 16:23:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F2A3DE5;
	Tue, 19 Sep 2023 16:23:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F2A3DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695133438;
	bh=q85NjDGE8H5sp8kjghvddaFNUYe/7ouoClOaTkHO34M=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Dq4vdxmu9n/nM+HisILc5mR7SFfajuK72wdA88HIkJpGSJGyMaQ+rt7ntBrJN2kzq
	 m99U1ciDfoYAf1LCyrmhbfMT/yM9HXd4SZdj9/UB5vfPzA1rB4zO3AnNjorIWx6ozu
	 kKlOb5Udvyw95iiZi3l1t7kbD9Fw4tWuJi6LCE2w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38DC8F80558; Tue, 19 Sep 2023 16:23:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AEEBAF8047D;
	Tue, 19 Sep 2023 16:23:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 458CBF8047D; Tue, 19 Sep 2023 16:23:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7A46FF800F4
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 16:22:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A46FF800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=RHmIsV84
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38JASjjF009787;
	Tue, 19 Sep 2023 09:22:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=Z6eJauh/Q4qfOq4V2ivIkDYuNOdx0/fXlZSC27W0hFI=; b=
	RHmIsV84uHWjKmI09yjioS9+HoumH/ysQ0n9tW7uWcUmDBByqrKi+PR5l0kKjszj
	RubgtVzN2FQDApjNoWUaHQ8ylxVhWF3BY62rgMlYkYJeE2CJuHhs/JPWN3dQOArA
	TeohWotQv5TbG+aWxGAKMZlBmqcW7VM+kBQljKjbcf0LtB9nb1+DrR0QpRKVGz3u
	/OuH6xIaqLIpTqSkhDZXcmHZjvF8ZcTTeKqSN8DdznYIT8YuSZcB3alMTVFfIXqK
	NalZEYThvdohwkXX9162CRyttgAwPbaWYSnrYbzDtGfS5o6odeoDplfHRZAtKLGk
	/Fa1jflcmbCDAveyo0z4/A==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3t58shu592-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Sep 2023 09:22:52 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Tue, 19 Sep
 2023 15:22:50 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Tue, 19 Sep 2023 15:22:50 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.135])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id EE47111AA;
	Tue, 19 Sep 2023 14:22:49 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Vitaly Rodionov
	<vitalyr@opensource.cirrus.com>,
        Stefan Binding
	<sbinding@opensource.cirrus.com>
Subject: [PATCH v3 1/2] ALSA: hda: cs35l41: Support mute notifications for
 CS35L41 HDA
Date: Tue, 19 Sep 2023 15:22:39 +0100
Message-ID: <20230919142240.467682-2-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230919142240.467682-1-sbinding@opensource.cirrus.com>
References: <20230919142240.467682-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: MAOmCWWIEhkk_p7SU0MArWNbLwFqO4hy
X-Proofpoint-ORIG-GUID: MAOmCWWIEhkk_p7SU0MArWNbLwFqO4hy
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 27XV27FPQDKIHE25JC3M2MO4JPLBL45Z
X-Message-ID-Hash: 27XV27FPQDKIHE25JC3M2MO4JPLBL45Z
X-MailFrom: prvs=4626bb6a22=sbinding@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/27XV27FPQDKIHE25JC3M2MO4JPLBL45Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>

Some laptops require a hardware based mute system, where when a hotkey
is pressed, it forces the amp to be muted.

For CS35L41, when the hotkey is pressed, an acpi notification is sent
to the CS35L41 Device Node. The driver needs to handle this notification
and call a _DSM function to retrieve the mute state.

Since the amp is only muted during playback, the driver will only mute
or unmute if playback is occurring, otherwise it will save the mute
state for when playback starts.

Only one handler can be registered for the acpi notification, but all
amps need to receive that notification, we can register a single handler
inside the Realtek HDA driver, so that it can then notify through the
component framework.

Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda.c   | 104 +++++++++++++++++++++++++++++-----
 sound/pci/hda/cs35l41_hda.h   |   3 +
 sound/pci/hda/hda_component.h |   4 ++
 sound/pci/hda/patch_realtek.c |  85 ++++++++++++++++++++++++++-
 4 files changed, 182 insertions(+), 14 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index c74faa2ff46c..7b56bceea9e8 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -33,6 +33,9 @@
 #define CAL_AMBIENT_DSP_CTL_NAME	"CAL_AMBIENT"
 #define CAL_DSP_CTL_TYPE		5
 #define CAL_DSP_CTL_ALG			205
+#define CS35L41_UUID			"50d90cdc-3de4-4f18-b528-c7fe3b71f40d"
+#define CS35L41_DSM_GET_MUTE		5
+#define CS35L41_NOTIFY_EVENT		0x91
 
 static bool firmware_autostart = 1;
 module_param(firmware_autostart, bool, 0444);
@@ -520,6 +523,31 @@ static void cs35l41_hda_play_start(struct device *dev)
 
 }
 
+static void cs35l41_mute(struct device *dev, bool mute)
+{
+	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
+	struct regmap *reg = cs35l41->regmap;
+
+	dev_dbg(dev, "Mute(%d:%d) Playback Started: %d\n", mute, cs35l41->mute_override,
+		cs35l41->playback_started);
+
+	if (cs35l41->playback_started) {
+		if (mute || cs35l41->mute_override) {
+			dev_dbg(dev, "Muting\n");
+			regmap_multi_reg_write(reg, cs35l41_hda_mute, ARRAY_SIZE(cs35l41_hda_mute));
+		} else {
+			dev_dbg(dev, "Unmuting\n");
+			if (cs35l41->firmware_running) {
+				regmap_multi_reg_write(reg, cs35l41_hda_unmute_dsp,
+						ARRAY_SIZE(cs35l41_hda_unmute_dsp));
+			} else {
+				regmap_multi_reg_write(reg, cs35l41_hda_unmute,
+						ARRAY_SIZE(cs35l41_hda_unmute));
+			}
+		}
+	}
+}
+
 static void cs35l41_hda_play_done(struct device *dev)
 {
 	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
@@ -529,13 +557,7 @@ static void cs35l41_hda_play_done(struct device *dev)
 
 	cs35l41_global_enable(dev, reg, cs35l41->hw_cfg.bst_type, 1,
 			      cs35l41->firmware_running);
-	if (cs35l41->firmware_running) {
-		regmap_multi_reg_write(reg, cs35l41_hda_unmute_dsp,
-				       ARRAY_SIZE(cs35l41_hda_unmute_dsp));
-	} else {
-		regmap_multi_reg_write(reg, cs35l41_hda_unmute,
-				       ARRAY_SIZE(cs35l41_hda_unmute));
-	}
+	cs35l41_mute(dev, false);
 }
 
 static void cs35l41_hda_pause_start(struct device *dev)
@@ -545,7 +567,7 @@ static void cs35l41_hda_pause_start(struct device *dev)
 
 	dev_dbg(dev, "Pause (Start)\n");
 
-	regmap_multi_reg_write(reg, cs35l41_hda_mute, ARRAY_SIZE(cs35l41_hda_mute));
+	cs35l41_mute(dev, true);
 	cs35l41_global_enable(dev, reg, cs35l41->hw_cfg.bst_type, 0,
 			      cs35l41->firmware_running);
 }
@@ -1073,6 +1095,53 @@ static int cs35l41_create_controls(struct cs35l41_hda *cs35l41)
 	return 0;
 }
 
+static bool cs35l41_dsm_supported(acpi_handle handle, unsigned int commands)
+{
+	guid_t guid;
+
+	guid_parse(CS35L41_UUID, &guid);
+
+	return acpi_check_dsm(handle, &guid, 0, BIT(commands));
+}
+
+static int cs35l41_get_acpi_mute_state(struct cs35l41_hda *cs35l41, acpi_handle handle)
+{
+	guid_t guid;
+	union acpi_object *ret;
+	int mute = -ENODEV;
+
+	guid_parse(CS35L41_UUID, &guid);
+
+	if (cs35l41_dsm_supported(handle, CS35L41_DSM_GET_MUTE)) {
+		ret = acpi_evaluate_dsm(handle, &guid, 0, CS35L41_DSM_GET_MUTE, NULL);
+		mute = *ret->buffer.pointer;
+		dev_dbg(cs35l41->dev, "CS35L41_DSM_GET_MUTE: %d\n", mute);
+	}
+
+	dev_dbg(cs35l41->dev, "%s: %d\n", __func__, mute);
+
+	return mute;
+}
+
+static void cs35l41_acpi_device_notify(acpi_handle handle, u32 event, struct device *dev)
+{
+	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
+	int mute;
+
+	if (event != CS35L41_NOTIFY_EVENT)
+		return;
+
+	mute = cs35l41_get_acpi_mute_state(cs35l41, handle);
+	if (mute < 0) {
+		dev_warn(cs35l41->dev, "Unable to retrieve mute state: %d\n", mute);
+		return;
+	}
+
+	dev_dbg(cs35l41->dev, "Requesting mute value: %d\n", mute);
+	cs35l41->mute_override = (mute > 0);
+	cs35l41_mute(cs35l41->dev, cs35l41->mute_override);
+}
+
 static int cs35l41_hda_bind(struct device *dev, struct device *master, void *master_data)
 {
 	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
@@ -1114,6 +1183,14 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
 	comps->playback_hook = cs35l41_hda_playback_hook;
 	comps->pre_playback_hook = cs35l41_hda_pre_playback_hook;
 	comps->post_playback_hook = cs35l41_hda_post_playback_hook;
+	comps->acpi_notify = cs35l41_acpi_device_notify;
+	comps->adev = cs35l41->dacpi;
+
+	comps->acpi_notifications_supported = cs35l41_dsm_supported(acpi_device_handle(comps->adev),
+		CS35L41_DSM_GET_MUTE);
+
+	cs35l41->mute_override = cs35l41_get_acpi_mute_state(cs35l41,
+						acpi_device_handle(cs35l41->dacpi)) > 0;
 
 	mutex_unlock(&cs35l41->fw_mutex);
 
@@ -1387,8 +1464,8 @@ static int cs35l41_hda_read_acpi(struct cs35l41_hda *cs35l41, const char *hid, i
 		return -ENODEV;
 	}
 
+	cs35l41->dacpi = adev;
 	physdev = get_device(acpi_get_first_physical_node(adev));
-	acpi_dev_put(adev);
 
 	sub = acpi_get_subsystem_id(ACPI_HANDLE(physdev));
 	if (IS_ERR(sub))
@@ -1498,6 +1575,7 @@ static int cs35l41_hda_read_acpi(struct cs35l41_hda *cs35l41, const char *hid, i
 	hw_cfg->valid = false;
 	hw_cfg->gpio1.valid = false;
 	hw_cfg->gpio2.valid = false;
+	acpi_dev_put(cs35l41->dacpi);
 put_physdev:
 	put_device(physdev);
 
@@ -1601,10 +1679,7 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
 	if (ret)
 		goto err;
 
-	ret = regmap_multi_reg_write(cs35l41->regmap, cs35l41_hda_mute,
-				     ARRAY_SIZE(cs35l41_hda_mute));
-	if (ret)
-		goto err;
+	cs35l41_mute(cs35l41->dev, true);
 
 	INIT_WORK(&cs35l41->fw_load_work, cs35l41_fw_load_work);
 	mutex_init(&cs35l41->fw_mutex);
@@ -1641,6 +1716,7 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
 	if (cs35l41_safe_reset(cs35l41->regmap, cs35l41->hw_cfg.bst_type))
 		gpiod_set_value_cansleep(cs35l41->reset_gpio, 0);
 	gpiod_put(cs35l41->reset_gpio);
+	acpi_dev_put(cs35l41->dacpi);
 	kfree(cs35l41->acpi_subsystem_id);
 
 	return ret;
@@ -1660,6 +1736,8 @@ void cs35l41_hda_remove(struct device *dev)
 
 	component_del(cs35l41->dev, &cs35l41_hda_comp_ops);
 
+	acpi_dev_put(cs35l41->dacpi);
+
 	pm_runtime_put_noidle(cs35l41->dev);
 
 	if (cs35l41_safe_reset(cs35l41->regmap, cs35l41->hw_cfg.bst_type))
diff --git a/sound/pci/hda/cs35l41_hda.h b/sound/pci/hda/cs35l41_hda.h
index b93bf762976e..ce3f2bb6ffd0 100644
--- a/sound/pci/hda/cs35l41_hda.h
+++ b/sound/pci/hda/cs35l41_hda.h
@@ -10,6 +10,7 @@
 #ifndef __CS35L41_HDA_H__
 #define __CS35L41_HDA_H__
 
+#include <linux/acpi.h>
 #include <linux/efi.h>
 #include <linux/regulator/consumer.h>
 #include <linux/gpio/consumer.h>
@@ -70,6 +71,8 @@ struct cs35l41_hda {
 	bool halo_initialized;
 	bool playback_started;
 	struct cs_dsp cs_dsp;
+	struct acpi_device *dacpi;
+	bool mute_override;
 };
 
 enum halo_state {
diff --git a/sound/pci/hda/hda_component.h b/sound/pci/hda/hda_component.h
index f170aec967c1..bbd6f0ed16c1 100644
--- a/sound/pci/hda/hda_component.h
+++ b/sound/pci/hda/hda_component.h
@@ -6,6 +6,7 @@
  *                    Cirrus Logic International Semiconductor Ltd.
  */
 
+#include <linux/acpi.h>
 #include <linux/component.h>
 
 #define HDA_MAX_COMPONENTS	4
@@ -15,6 +16,9 @@ struct hda_component {
 	struct device *dev;
 	char name[HDA_MAX_NAME_SIZE];
 	struct hda_codec *codec;
+	struct acpi_device *adev;
+	bool acpi_notifications_supported;
+	void (*acpi_notify)(acpi_handle handle, u32 event, struct device *dev);
 	void (*pre_playback_hook)(struct device *dev, int action);
 	void (*playback_hook)(struct device *dev, int action);
 	void (*post_playback_hook)(struct device *dev, int action);
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 883a7e865bc5..7f5dab1dece4 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10,6 +10,7 @@
  *                    Jonathan Woithe <jwoithe@just42.net>
  */
 
+#include <linux/acpi.h>
 #include <linux/init.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
@@ -6704,19 +6705,101 @@ static void alc287_fixup_legion_15imhg05_speakers(struct hda_codec *codec,
 	}
 }
 
+static void comp_acpi_device_notify(acpi_handle handle, u32 event, void *data)
+{
+	struct hda_codec *cdc = data;
+	struct alc_spec *spec = cdc->spec;
+	int i;
+
+	codec_info(cdc, "ACPI Notification %d\n", event);
+
+	for (i = 0; i < HDA_MAX_COMPONENTS; i++) {
+		if (spec->comps[i].dev && spec->comps[i].acpi_notify)
+			spec->comps[i].acpi_notify(acpi_device_handle(spec->comps[i].adev), event,
+						   spec->comps[i].dev);
+	}
+}
+
+#ifdef CONFIG_ACPI
+static int comp_bind_acpi(struct device *dev)
+{
+	struct hda_codec *cdc = dev_to_hda_codec(dev);
+	struct alc_spec *spec = cdc->spec;
+	bool support_notifications = false;
+	struct acpi_device *adev;
+	int ret;
+	int i;
+
+	adev = spec->comps[0].adev;
+	if (!acpi_device_handle(adev))
+		return 0;
+
+	for (i = 0; i < HDA_MAX_COMPONENTS; i++)
+		support_notifications = support_notifications ||
+			spec->comps[i].acpi_notifications_supported;
+
+	if (support_notifications) {
+		ret = acpi_install_notify_handler(adev->handle, ACPI_DEVICE_NOTIFY,
+						comp_acpi_device_notify, cdc);
+		if (ret < 0) {
+			codec_warn(cdc, "Failed to install notify handler: %d\n", ret);
+			return 0;
+		}
+
+		codec_dbg(cdc, "Notify handler installed\n");
+	}
+
+	return 0;
+}
+#else
+static int comp_bind_acpi(struct device *dev)
+{
+	return 0;
+}
+#endif
+
 static int comp_bind(struct device *dev)
 {
 	struct hda_codec *cdc = dev_to_hda_codec(dev);
 	struct alc_spec *spec = cdc->spec;
+	int ret;
 
-	return component_bind_all(dev, spec->comps);
+	ret = component_bind_all(dev, spec->comps);
+	if (ret)
+		return ret;
+
+	return comp_bind_acpi(dev);
 }
 
+#ifdef CONFIG_ACPI
+static void comp_unbind_acpi(struct device *dev)
+{
+	struct hda_codec *cdc = dev_to_hda_codec(dev);
+	struct alc_spec *spec = cdc->spec;
+	struct acpi_device *adev;
+	int ret;
+
+	adev = spec->comps[0].adev;
+	if (!acpi_device_handle(adev))
+		return;
+
+	ret = acpi_remove_notify_handler(adev->handle, ACPI_DEVICE_NOTIFY,
+					 comp_acpi_device_notify);
+	if (ret < 0)
+		codec_warn(cdc, "Failed to uninstall notify handler: %d\n", ret);
+}
+#else
+static void comp_unbind_acpi(struct device *dev)
+{
+}
+#endif
+
 static void comp_unbind(struct device *dev)
 {
 	struct hda_codec *cdc = dev_to_hda_codec(dev);
 	struct alc_spec *spec = cdc->spec;
 
+	comp_unbind_acpi(dev);
 	component_unbind_all(dev, spec->comps);
 }
 
-- 
2.34.1

