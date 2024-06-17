Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF6B90B4E6
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2024 17:44:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 721DBE68;
	Mon, 17 Jun 2024 17:44:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 721DBE68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718639090;
	bh=AF7oJy0aZTCp3wlzMVsWa6hAadJ85VbNoWfPEaIsx98=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VxHS38lEfcOJNziaFKXQcMgUjrAyAE/a2YvrUsV5omXv0qm+bjYpFgYtWTYMifgxf
	 TDJFsCfhmh6oZ395IkOdSABFwGsTeJLVaHX6a5S+xEqyC8kLLK1MUv7ldc5By7bhBZ
	 xNYVMdk/kebFoht3mO6Zix2R3cFvtvm9e6K3W5rI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 307B4F805EB; Mon, 17 Jun 2024 17:43:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B8805F805FF;
	Mon, 17 Jun 2024 17:43:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F4A5F80269; Mon, 17 Jun 2024 17:43:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 14622F800ED
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 17:43:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14622F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=HkVcsvYw
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 45HFYSto018866;
	Mon, 17 Jun 2024 10:43:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=AbrUVgHW0M6XqFMkM9GyFEaeZh4wuvWncgNTUKIvFmM=; b=
	HkVcsvYwb6C2kVwhGDGFB9+IaFJZiCJVb/R0dpeE1IsGC1N0eGd+BtxNdSOAAvwi
	hzEuwwqMgpSWrp9twhx3D1RKuyNezAXVYUZj3jpx06Pwk2HvNRtEc9eVaxOUw1BI
	ITHPFeiPgQwC0O8l/cQo+XXHS6Zy+7vqfAe5zXnUY0ayD0by5D9pf3uMBpqCLoy8
	evbRuItwNuDDZJSMU1+2eSObIDf/4rID+Yc/SYETedavp8l4w/97WHpSh7LFcR2T
	i9nsIvJB+rOkFeY8rtRXe0SahRReHWRmlkKRqYJJw1dbHNL8+2L2oz1Z3FzwNWbY
	84tF5mBSzq8OA1HN6+TtUQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ys8by1vv8-3
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
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 0C1C182024D;
	Mon, 17 Jun 2024 15:42:56 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <soyer@irl.hu>, <shenghao-ding@ti.com>, <kevin-lu@ti.com>,
        <baojun.xu@ti.com>, Simon Trimmer <simont@opensource.cirrus.com>
Subject: [PATCH 3/4] ALSA: hda: hda_component: Move codec field into the
 parent
Date: Mon, 17 Jun 2024 16:41:04 +0100
Message-ID: <20240617154105.108635-4-simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240617154105.108635-1-simont@opensource.cirrus.com>
References: <20240617154105.108635-1-simont@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: sQoPquq4dJYzD_1O8xc3Gtgx4_QLCGuk
X-Proofpoint-GUID: sQoPquq4dJYzD_1O8xc3Gtgx4_QLCGuk
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: OD6J6GGQVSHDBXZQ4P3LXD2IJRARB3IZ
X-Message-ID-Hash: OD6J6GGQVSHDBXZQ4P3LXD2IJRARB3IZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OD6J6GGQVSHDBXZQ4P3LXD2IJRARB3IZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There is one codec shared across all of the bound HDA components and a
copy is usually stashed in the amp driver so it doesn't need to be in
every hda_component.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda.c     | 7 ++++---
 sound/pci/hda/cs35l56_hda.c     | 2 +-
 sound/pci/hda/hda_component.c   | 5 +----
 sound/pci/hda/hda_component.h   | 2 +-
 sound/pci/hda/tas2781_hda_i2c.c | 2 +-
 5 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index 32c9d95150ba..9c45d5953c80 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -1436,10 +1436,11 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
 	mutex_lock(&cs35l41->fw_mutex);
 
 	comp->dev = dev;
+	cs35l41->codec = parent->codec;
 	if (!cs35l41->acpi_subsystem_id)
 		cs35l41->acpi_subsystem_id = kasprintf(GFP_KERNEL, "%.8x",
-						       comp->codec->core.subsystem_id);
-	cs35l41->codec = comp->codec;
+						       cs35l41->codec->core.subsystem_id);
+
 	strscpy(comp->name, dev_name(dev), sizeof(comp->name));
 
 	cs35l41->firmware_type = HDA_CS_DSP_FW_SPK_PROT;
@@ -1470,7 +1471,7 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
 	mutex_unlock(&cs35l41->fw_mutex);
 
 	sleep_flags = lock_system_sleep();
-	if (!device_link_add(&comp->codec->core.dev, cs35l41->dev, DL_FLAG_STATELESS))
+	if (!device_link_add(&cs35l41->codec->core.dev, cs35l41->dev, DL_FLAG_STATELESS))
 		dev_warn(dev, "Unable to create device link\n");
 	unlock_system_sleep(sleep_flags);
 
diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
index abe415795d90..53dee0286ee1 100644
--- a/sound/pci/hda/cs35l56_hda.c
+++ b/sound/pci/hda/cs35l56_hda.c
@@ -697,7 +697,7 @@ static int cs35l56_hda_bind(struct device *dev, struct device *master, void *mas
 		return -EBUSY;
 
 	comp->dev = dev;
-	cs35l56->codec = comp->codec;
+	cs35l56->codec = parent->codec;
 	strscpy(comp->name, dev_name(dev), sizeof(comp->name));
 	comp->playback_hook = cs35l56_hda_playback_hook;
 
diff --git a/sound/pci/hda/hda_component.c b/sound/pci/hda/hda_component.c
index 8c11c8b37799..1a9950b76866 100644
--- a/sound/pci/hda/hda_component.c
+++ b/sound/pci/hda/hda_component.c
@@ -134,12 +134,9 @@ static int hda_comp_match_dev_name(struct device *dev, void *data)
 int hda_component_manager_bind(struct hda_codec *cdc,
 			       struct hda_component_parent *parent)
 {
-	int i;
-
 	/* Init shared and component specific data */
 	memset(parent, 0, sizeof(*parent));
-	for (i = 0; i < ARRAY_SIZE(parent->comps); i++)
-		parent->comps[i].codec = cdc;
+	parent->codec = cdc;
 
 	return component_bind_all(hda_codec_dev(cdc), parent);
 }
diff --git a/sound/pci/hda/hda_component.h b/sound/pci/hda/hda_component.h
index e547e1f1e674..dd4dabeae9ee 100644
--- a/sound/pci/hda/hda_component.h
+++ b/sound/pci/hda/hda_component.h
@@ -19,7 +19,6 @@
 struct hda_component {
 	struct device *dev;
 	char name[HDA_MAX_NAME_SIZE];
-	struct hda_codec *codec;
 	struct acpi_device *adev;
 	bool acpi_notifications_supported;
 	void (*acpi_notify)(acpi_handle handle, u32 event, struct device *dev);
@@ -29,6 +28,7 @@ struct hda_component {
 };
 
 struct hda_component_parent {
+	struct hda_codec *codec;
 	struct hda_component comps[HDA_MAX_COMPONENTS];
 };
 
diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index 2794acd4c9ab..7fab19f85968 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -719,7 +719,7 @@ static int tas2781_hda_bind(struct device *dev, struct device *master,
 	if (comp->dev)
 		return -EBUSY;
 
-	codec = comp->codec;
+	codec = parent->codec;
 	subid = codec->core.subsystem_id >> 16;
 
 	switch (subid) {
-- 
2.34.1

