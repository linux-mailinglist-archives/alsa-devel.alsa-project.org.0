Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 932D68D8026
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2024 12:37:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0E66E64;
	Mon,  3 Jun 2024 12:37:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0E66E64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717411038;
	bh=oUtizzgKM4/3Y9KkrNWL/XebKvCrh4DHO7Gq6YBmIoQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a8qgaQjUirX+3voUILzZLhC6ykjjgwB3Ao8HQO8yfiSqhma8xxk9Lu3+GCJKe7N9v
	 cEMfPkj5L79G3HIGjMw53A3X/l8hcq/wmPs+BeVLaYehsEyeIHXjQ3CRDVl/DLisnf
	 0h2EXDu/Z7w7AVLFhtc5NFDnjO6HCzz7a+KUeIGQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A094F8065A; Mon,  3 Jun 2024 12:35:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C0AFDF8063C;
	Mon,  3 Jun 2024 12:35:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3BB2F805C7; Mon,  3 Jun 2024 12:35:43 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 5534EF804B2
	for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2024 12:35:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5534EF804B2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=KoaRP/Ar
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4535l7pe018316;
	Mon, 3 Jun 2024 05:35:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=HzZ9klruY/Ztssobbt7j7Ac2UZsl8E8kYKbpCSTaTdA=; b=
	KoaRP/Arn34eI38X4XNrs23UxtjOxXaXqHhTstt979gLF5BYDetUofnr9UBgBJU0
	4qZW5XwFDaMOAi40QnaFDZgH5bzT4GJl+GguM3p/IZlToVGmIS9WujDoBpv8NqZz
	42Cd0G/yP7bqNJoM2pMspW4jfRPyQXI+YZy3NJVF15M0wJJzjCa6RGWha4BBNhgb
	vXzXjyfC6+LN+dc/JOtXQazvO5p27qH6zSapadA5ienWao8Z70tLrRe6i1ZAYByf
	H+HPwgwnc1PEn6DO2yUxxXIkcnAztQ6bzK/T3dXO4caW+OAWInbfJzznNGjVgK5v
	2kubmP9aKnE7+APngHNCGQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3yg11xscbq-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 05:35:33 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Jun 2024
 11:35:28 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 3 Jun 2024 11:35:28 +0100
Received: from EDIN6ZZ2FY3.ad.cirrus.com (EDIN6ZZ2FY3.ad.cirrus.com
 [198.61.64.166])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 8205E820249;
	Mon,  3 Jun 2024 10:35:28 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <soyer@irl.hu>, <shenghao-ding@ti.com>, <kevin-lu@ti.com>,
        <baojun.xu@ti.com>, <kailang@realtek.com>,
        Simon Trimmer
	<simont@opensource.cirrus.com>
Subject: [PATCH 6/7] ALSA: hda: hda_component: Move codec field into the
 parent
Date: Mon, 3 Jun 2024 11:35:23 +0100
Message-ID: <20240603103524.32442-7-simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240603103524.32442-1-simont@opensource.cirrus.com>
References: <20240603103524.32442-1-simont@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: znmTngXIww7_pS2_kFgRvYih2P0oyzUO
X-Proofpoint-ORIG-GUID: znmTngXIww7_pS2_kFgRvYih2P0oyzUO
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: HVA5IOK4XAVYSU5SXOCOPDSVD6M3HKJ5
X-Message-ID-Hash: HVA5IOK4XAVYSU5SXOCOPDSVD6M3HKJ5
X-MailFrom: prvs=388426604e=simont@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HVA5IOK4XAVYSU5SXOCOPDSVD6M3HKJ5/>
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
index ceba4f2c85f1..ee9f83b737de 100644
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
index df4498c77171..cc4aa90db1d1 100644
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
index c6c1e8e81972..d7af4fd10714 100644
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

