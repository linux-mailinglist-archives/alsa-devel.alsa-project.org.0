Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3FE90B4E3
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2024 17:44:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 784A1E76;
	Mon, 17 Jun 2024 17:44:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 784A1E76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718639067;
	bh=dBdSO9xyTf1e173RJESuxB4z7eLKS8teMbtaS+nQG6M=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=msuqaxR94XeV4C380dfOnt7HSfdantReMe06QeR17c0yMBu+o65hbK8JwU8vEz7l3
	 fVbE63ERLIwWUKlOxCjHDO6Qfu1xKUXCFvXU4IC6admjjqzgFoiGwIiW1qQtHhy7u2
	 pE0p0QVf9ixjaQT+m3KJ4D9omgkRACzTN0z6H0eY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC05DF805DF; Mon, 17 Jun 2024 17:43:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B4A3F805AF;
	Mon, 17 Jun 2024 17:43:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43926F804D6; Mon, 17 Jun 2024 17:43:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B5B6EF801EB
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 17:43:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5B6EF801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Ol/dQQqF
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 45HFYStn018866;
	Mon, 17 Jun 2024 10:42:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=8uEr/B2Rm0pRE+fErYLr0mGNRxGp8UGgcNa0liYDmsU=; b=
	Ol/dQQqFJle96FAxFQ2FxBRBItjFaCmFuHzPayA6QN4r8E/oUUsv3kjmDjScPVgv
	JmkWnm2fP3yE8Rc3/SzSyqg9vs173qOFfPZhQWcDzjsFmr8GJD0Y5FupFWEbl1z1
	gS+psky5r7oRux1c/LYtCYbH3wWegRlBZSv1jTds3ljt58muGLbnuY6MUybAgM9b
	4QQOFnF2OCdQfVuXQrOPUOTnRHBmTp70pRzgvFlYVYiZCtNdxz7UspDUooaLfrvl
	9MkteLk1vdbK3DXL46djEGf2OhJ/s6E9A2XlFLS50HYuNyknL07qVjSJKC/64ueT
	FI/L/695QFtlybsvCXahhw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ys8by1vv8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 10:42:59 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 17 Jun
 2024 16:42:56 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 17 Jun 2024 16:42:56 +0100
Received: from EDIN6ZZ2FY3.ad.cirrus.com (EDIN6ZZ2FY3.ad.cirrus.com
 [198.61.65.31])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id A3CA0820248;
	Mon, 17 Jun 2024 15:42:55 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <soyer@irl.hu>, <shenghao-ding@ti.com>, <kevin-lu@ti.com>,
        <baojun.xu@ti.com>, Simon Trimmer <simont@opensource.cirrus.com>
Subject: [PATCH 2/4] ALSA: hda: hda_component: Change codecs to use component
 parent structure
Date: Mon, 17 Jun 2024 16:41:03 +0100
Message-ID: <20240617154105.108635-3-simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240617154105.108635-1-simont@opensource.cirrus.com>
References: <20240617154105.108635-1-simont@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: lo0TOHdgbaCTocS_TtrrD5VV8b5svz1_
X-Proofpoint-GUID: lo0TOHdgbaCTocS_TtrrD5VV8b5svz1_
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 5GU5Q3VNIXGYRXUWP4AJXBCUZOLMTIML
X-Message-ID-Hash: 5GU5Q3VNIXGYRXUWP4AJXBCUZOLMTIML
X-MailFrom: prvs=389839efd0=simont@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5GU5Q3VNIXGYRXUWP4AJXBCUZOLMTIML/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Change the hda_component binding APIs to pass the hds_component_parent
as the parameter so the array of components can be abstracted.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda.c     | 42 +++++++++++++++++++--------------
 sound/pci/hda/cs35l56_hda.c     | 25 +++++++++++---------
 sound/pci/hda/hda_component.c   |  2 +-
 sound/pci/hda/hda_component.h   |  2 +-
 sound/pci/hda/tas2781_hda_i2c.c | 33 +++++++++++++-------------
 5 files changed, 57 insertions(+), 47 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index d54d4d60b03e..32c9d95150ba 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -1419,27 +1419,28 @@ static void cs35l41_acpi_device_notify(acpi_handle handle, u32 event, struct dev
 static int cs35l41_hda_bind(struct device *dev, struct device *master, void *master_data)
 {
 	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
-	struct hda_component *comps = master_data;
+	struct hda_component_parent *parent = master_data;
+	struct hda_component *comp;
 	unsigned int sleep_flags;
 	int ret = 0;
 
-	if (!comps || cs35l41->index < 0 || cs35l41->index >= HDA_MAX_COMPONENTS)
+	comp = hda_component_from_index(parent, cs35l41->index);
+	if (!comp)
 		return -EINVAL;
 
-	comps = &comps[cs35l41->index];
-	if (comps->dev)
+	if (comp->dev)
 		return -EBUSY;
 
 	pm_runtime_get_sync(dev);
 
 	mutex_lock(&cs35l41->fw_mutex);
 
-	comps->dev = dev;
+	comp->dev = dev;
 	if (!cs35l41->acpi_subsystem_id)
 		cs35l41->acpi_subsystem_id = kasprintf(GFP_KERNEL, "%.8x",
-						       comps->codec->core.subsystem_id);
-	cs35l41->codec = comps->codec;
-	strscpy(comps->name, dev_name(dev), sizeof(comps->name));
+						       comp->codec->core.subsystem_id);
+	cs35l41->codec = comp->codec;
+	strscpy(comp->name, dev_name(dev), sizeof(comp->name));
 
 	cs35l41->firmware_type = HDA_CS_DSP_FW_SPK_PROT;
 
@@ -1454,13 +1455,13 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
 
 	ret = cs35l41_create_controls(cs35l41);
 
-	comps->playback_hook = cs35l41_hda_playback_hook;
-	comps->pre_playback_hook = cs35l41_hda_pre_playback_hook;
-	comps->post_playback_hook = cs35l41_hda_post_playback_hook;
-	comps->acpi_notify = cs35l41_acpi_device_notify;
-	comps->adev = cs35l41->dacpi;
+	comp->playback_hook = cs35l41_hda_playback_hook;
+	comp->pre_playback_hook = cs35l41_hda_pre_playback_hook;
+	comp->post_playback_hook = cs35l41_hda_post_playback_hook;
+	comp->acpi_notify = cs35l41_acpi_device_notify;
+	comp->adev = cs35l41->dacpi;
 
-	comps->acpi_notifications_supported = cs35l41_dsm_supported(acpi_device_handle(comps->adev),
+	comp->acpi_notifications_supported = cs35l41_dsm_supported(acpi_device_handle(comp->adev),
 		CS35L41_DSM_GET_MUTE);
 
 	cs35l41->mute_override = cs35l41_get_acpi_mute_state(cs35l41,
@@ -1469,7 +1470,7 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
 	mutex_unlock(&cs35l41->fw_mutex);
 
 	sleep_flags = lock_system_sleep();
-	if (!device_link_add(&comps->codec->core.dev, cs35l41->dev, DL_FLAG_STATELESS))
+	if (!device_link_add(&comp->codec->core.dev, cs35l41->dev, DL_FLAG_STATELESS))
 		dev_warn(dev, "Unable to create device link\n");
 	unlock_system_sleep(sleep_flags);
 
@@ -1489,14 +1490,19 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
 static void cs35l41_hda_unbind(struct device *dev, struct device *master, void *master_data)
 {
 	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
-	struct hda_component *comps = master_data;
+	struct hda_component_parent *parent = master_data;
+	struct hda_component *comp;
 	unsigned int sleep_flags;
 
-	if (comps[cs35l41->index].dev == dev) {
-		memset(&comps[cs35l41->index], 0, sizeof(*comps));
+	comp = hda_component_from_index(parent, cs35l41->index);
+	if (!comp)
+		return;
+
+	if (comp->dev == dev) {
 		sleep_flags = lock_system_sleep();
 		device_link_remove(&cs35l41->codec->core.dev, cs35l41->dev);
 		unlock_system_sleep(sleep_flags);
+		memset(comp, 0, sizeof(*comp));
 	}
 }
 
diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
index 0923e2589f5f..abe415795d90 100644
--- a/sound/pci/hda/cs35l56_hda.c
+++ b/sound/pci/hda/cs35l56_hda.c
@@ -685,20 +685,21 @@ static int cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
 static int cs35l56_hda_bind(struct device *dev, struct device *master, void *master_data)
 {
 	struct cs35l56_hda *cs35l56 = dev_get_drvdata(dev);
-	struct hda_component *comps = master_data;
+	struct hda_component_parent *parent = master_data;
+	struct hda_component *comp;
 	int ret;
 
-	if (!comps || cs35l56->index < 0 || cs35l56->index >= HDA_MAX_COMPONENTS)
+	comp = hda_component_from_index(parent, cs35l56->index);
+	if (!comp)
 		return -EINVAL;
 
-	comps = &comps[cs35l56->index];
-	if (comps->dev)
+	if (comp->dev)
 		return -EBUSY;
 
-	comps->dev = dev;
-	cs35l56->codec = comps->codec;
-	strscpy(comps->name, dev_name(dev), sizeof(comps->name));
-	comps->playback_hook = cs35l56_hda_playback_hook;
+	comp->dev = dev;
+	cs35l56->codec = comp->codec;
+	strscpy(comp->name, dev_name(dev), sizeof(comp->name));
+	comp->playback_hook = cs35l56_hda_playback_hook;
 
 	ret = cs35l56_hda_fw_load(cs35l56);
 	if (ret)
@@ -720,7 +721,8 @@ static int cs35l56_hda_bind(struct device *dev, struct device *master, void *mas
 static void cs35l56_hda_unbind(struct device *dev, struct device *master, void *master_data)
 {
 	struct cs35l56_hda *cs35l56 = dev_get_drvdata(dev);
-	struct hda_component *comps = master_data;
+	struct hda_component_parent *parent = master_data;
+	struct hda_component *comp;
 
 	cs35l56_hda_remove_controls(cs35l56);
 
@@ -732,8 +734,9 @@ static void cs35l56_hda_unbind(struct device *dev, struct device *master, void *
 	if (cs35l56->base.fw_patched)
 		cs_dsp_power_down(&cs35l56->cs_dsp);
 
-	if (comps[cs35l56->index].dev == dev)
-		memset(&comps[cs35l56->index], 0, sizeof(*comps));
+	comp = hda_component_from_index(parent, cs35l56->index);
+	if (comp && (comp->dev == dev))
+		memset(comp, 0, sizeof(*comp));
 
 	cs35l56->codec = NULL;
 
diff --git a/sound/pci/hda/hda_component.c b/sound/pci/hda/hda_component.c
index b05a0b87d32a..8c11c8b37799 100644
--- a/sound/pci/hda/hda_component.c
+++ b/sound/pci/hda/hda_component.c
@@ -141,7 +141,7 @@ int hda_component_manager_bind(struct hda_codec *cdc,
 	for (i = 0; i < ARRAY_SIZE(parent->comps); i++)
 		parent->comps[i].codec = cdc;
 
-	return component_bind_all(hda_codec_dev(cdc), &parent->comps);
+	return component_bind_all(hda_codec_dev(cdc), parent);
 }
 EXPORT_SYMBOL_NS_GPL(hda_component_manager_bind, SND_HDA_SCODEC_COMPONENT);
 
diff --git a/sound/pci/hda/hda_component.h b/sound/pci/hda/hda_component.h
index a016f1b942a2..e547e1f1e674 100644
--- a/sound/pci/hda/hda_component.h
+++ b/sound/pci/hda/hda_component.h
@@ -93,7 +93,7 @@ static inline struct hda_component *hda_component_from_index(struct hda_componen
 static inline void hda_component_manager_unbind(struct hda_codec *cdc,
 						struct hda_component_parent *parent)
 {
-	component_unbind_all(hda_codec_dev(cdc), &parent->comps);
+	component_unbind_all(hda_codec_dev(cdc), parent);
 }
 
 #endif /* ifndef __HDA_COMPONENT_H__ */
diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index 75f7674c66ee..2794acd4c9ab 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -706,20 +706,20 @@ static int tas2781_hda_bind(struct device *dev, struct device *master,
 	void *master_data)
 {
 	struct tas2781_hda *tas_hda = dev_get_drvdata(dev);
-	struct hda_component *comps = master_data;
+	struct hda_component_parent *parent = master_data;
+	struct hda_component *comp;
 	struct hda_codec *codec;
 	unsigned int subid;
 	int ret;
 
-	if (!comps || tas_hda->priv->index < 0 ||
-		tas_hda->priv->index >= HDA_MAX_COMPONENTS)
+	comp = hda_component_from_index(parent, tas_hda->priv->index);
+	if (!comp)
 		return -EINVAL;
 
-	comps = &comps[tas_hda->priv->index];
-	if (comps->dev)
+	if (comp->dev)
 		return -EBUSY;
 
-	codec = comps->codec;
+	codec = comp->codec;
 	subid = codec->core.subsystem_id >> 16;
 
 	switch (subid) {
@@ -733,13 +733,13 @@ static int tas2781_hda_bind(struct device *dev, struct device *master,
 
 	pm_runtime_get_sync(dev);
 
-	comps->dev = dev;
+	comp->dev = dev;
 
-	strscpy(comps->name, dev_name(dev), sizeof(comps->name));
+	strscpy(comp->name, dev_name(dev), sizeof(comp->name));
 
 	ret = tascodec_init(tas_hda->priv, codec, THIS_MODULE, tasdev_fw_ready);
 	if (!ret)
-		comps->playback_hook = tas2781_hda_playback_hook;
+		comp->playback_hook = tas2781_hda_playback_hook;
 
 	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
@@ -751,13 +751,14 @@ static void tas2781_hda_unbind(struct device *dev,
 	struct device *master, void *master_data)
 {
 	struct tas2781_hda *tas_hda = dev_get_drvdata(dev);
-	struct hda_component *comps = master_data;
-	comps = &comps[tas_hda->priv->index];
-
-	if (comps->dev == dev) {
-		comps->dev = NULL;
-		memset(comps->name, 0, sizeof(comps->name));
-		comps->playback_hook = NULL;
+	struct hda_component_parent *parent = master_data;
+	struct hda_component *comp;
+
+	comp = hda_component_from_index(parent, tas_hda->priv->index);
+	if (comp && (comp->dev == dev)) {
+		comp->dev = NULL;
+		memset(comp->name, 0, sizeof(comp->name));
+		comp->playback_hook = NULL;
 	}
 
 	tas2781_hda_remove_controls(tas_hda);
-- 
2.34.1

