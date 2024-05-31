Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 903CF8D6591
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2024 17:17:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E51083B;
	Fri, 31 May 2024 17:17:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E51083B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717168638;
	bh=h+yeLeD4NB8lPt5p6/ITed7wqGWEby2/Mtdr3zEE45U=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bPgrtKE4kfcewY8jq/8lqbPGBIOsLzWp31ym+fkuRXRFiRdIPxQMo/m1mgEB3yRju
	 Uj7hlCkC4fpxAE9Tihs62EUIzk21/HdrCzdbQKgr2MhFvAzFKo++pzXdGUxGLxhc4G
	 NHEBduxYCXyM77sKUlbOEc5bqWIpF7Y1oopliaPg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91DD3F8067C; Fri, 31 May 2024 17:15:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 17480F80678;
	Fri, 31 May 2024 17:15:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8AD1F80630; Fri, 31 May 2024 17:15:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B7D86F80494
	for <alsa-devel@alsa-project.org>; Fri, 31 May 2024 17:15:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7D86F80494
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=EnL0Zo1R
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 44VB0WSu017940;
	Fri, 31 May 2024 10:15:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=KReWh5Z93xDzo9NNT8iuZLQ2MLgTZwtS5z4ER9TXNAo=; b=
	EnL0Zo1R05R2ukeykg+sIewuJ4MI39ZycfFIdasD/TGnl95oLXNH52UVYqt6Rvup
	GhN8PYhaCU3ZXmQlqJxjwcL4U68S8HJ+LJicHOUP0TVEFVnspN9LKfJnDAN+i8tH
	suVhDX/Q3+tBck3R0Qtoe4kSsGhtW8hlVWHc0q+8/rIC9sonih5poUEGjDk/pfMU
	xzHh4Dejj/dLnrUNodrxK3KQiQOeMvorRz/xPR3cArOedj8FFgf3qCOppuf5qBsR
	ZbLExz8QSZxDKO8l/k1+Z5RyPHPq1pcSeDiT9/DaMjRZcMad/BcSZ6fDt5e8VrhC
	PbP1JMGGpB0JT9H0x3DSVg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ybcdhe0a3-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 10:15:13 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 31 May
 2024 16:15:11 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Fri, 31 May 2024 16:15:11 +0100
Received: from EDIN6ZZ2FY3.ad.cirrus.com (EDIN6ZZ2FY3.ad.cirrus.com
 [198.61.65.72])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id EE675820244;
	Fri, 31 May 2024 15:15:10 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <soyer@irl.hu>, <shenghao-ding@ti.com>, <kevin-lu@ti.com>,
        <baojun.xu@ti.com>, <kailang@realtek.com>,
        Simon Trimmer
	<simont@opensource.cirrus.com>
Subject: [PATCH 4/7] ALSA: hda: hda_component: Introduce component parent
 structure
Date: Fri, 31 May 2024 16:14:06 +0100
Message-ID: <20240531151409.80284-5-simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240531151409.80284-1-simont@opensource.cirrus.com>
References: <20240531151409.80284-1-simont@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: mi85hSI4PmPPfFzbqUlATawl_6H-9VIn
X-Proofpoint-ORIG-GUID: mi85hSI4PmPPfFzbqUlATawl_6H-9VIn
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: IQIHW3AJC6NYGVAULJWF4O2JSBUU3XSN
X-Message-ID-Hash: IQIHW3AJC6NYGVAULJWF4O2JSBUU3XSN
X-MailFrom: prvs=3881dca93d=simont@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IQIHW3AJC6NYGVAULJWF4O2JSBUU3XSN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In preparation for moving duplicated members from the hda_component
structure introduce a parent structure that wraps the array of
components. This also allows us to confine the knowledge of the maximum
number of entries to the hda_component files and eliminate passing that
redundant information around and making direct accesses to the array.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
---
 sound/pci/hda/hda_component.c | 65 +++++++++++++++++++----------------
 sound/pci/hda/hda_component.h | 42 ++++++++++++++--------
 sound/pci/hda/patch_realtek.c | 17 +++++----
 3 files changed, 71 insertions(+), 53 deletions(-)

diff --git a/sound/pci/hda/hda_component.c b/sound/pci/hda/hda_component.c
index d02589014a3f..d8b9d406676b 100644
--- a/sound/pci/hda/hda_component.c
+++ b/sound/pci/hda/hda_component.c
@@ -15,35 +15,39 @@
 #include "hda_local.h"
 
 #ifdef CONFIG_ACPI
-void hda_component_acpi_device_notify(struct hda_component *comps, int num_comps,
+void hda_component_acpi_device_notify(struct hda_component_parent *parent,
 				      acpi_handle handle, u32 event, void *data)
 {
+	struct hda_component *comp;
 	int i;
 
-	for (i = 0; i < num_comps; i++) {
-		if (comps[i].dev && comps[i].acpi_notify)
-			comps[i].acpi_notify(acpi_device_handle(comps[i].adev), event,
-					     comps[i].dev);
+	for (i = 0; i < ARRAY_SIZE(parent->comps); i++) {
+		comp = hda_component_from_index(parent, i);
+		if (comp->dev && comp->acpi_notify)
+			comp->acpi_notify(acpi_device_handle(comp->adev), event, comp->dev);
 	}
 }
 EXPORT_SYMBOL_NS_GPL(hda_component_acpi_device_notify, SND_HDA_SCODEC_COMPONENT);
 
 int hda_component_manager_bind_acpi_notifications(struct hda_codec *cdc,
-						  struct hda_component *comps, int num_comps,
+						  struct hda_component_parent *parent,
 						  acpi_notify_handler handler, void *data)
 {
 	bool support_notifications = false;
 	struct acpi_device *adev;
+	struct hda_component *comp;
 	int ret;
 	int i;
 
-	adev = comps[0].adev;
+	adev = parent->comps[0].adev;
 	if (!acpi_device_handle(adev))
 		return 0;
 
-	for (i = 0; i < num_comps; i++)
+	for (i = 0; i < ARRAY_SIZE(parent->comps); i++) {
+		comp = hda_component_from_index(parent, i);
 		support_notifications = support_notifications ||
-			comps[i].acpi_notifications_supported;
+			comp->acpi_notifications_supported;
+	}
 
 	if (support_notifications) {
 		ret = acpi_install_notify_handler(adev->handle, ACPI_DEVICE_NOTIFY,
@@ -61,13 +65,13 @@ int hda_component_manager_bind_acpi_notifications(struct hda_codec *cdc,
 EXPORT_SYMBOL_NS_GPL(hda_component_manager_bind_acpi_notifications, SND_HDA_SCODEC_COMPONENT);
 
 void hda_component_manager_unbind_acpi_notifications(struct hda_codec *cdc,
-						     struct hda_component *comps,
+						     struct hda_component_parent *parent,
 						     acpi_notify_handler handler)
 {
 	struct acpi_device *adev;
 	int ret;
 
-	adev = comps[0].adev;
+	adev = parent->comps[0].adev;
 	if (!acpi_device_handle(adev))
 		return;
 
@@ -78,21 +82,25 @@ void hda_component_manager_unbind_acpi_notifications(struct hda_codec *cdc,
 EXPORT_SYMBOL_NS_GPL(hda_component_manager_unbind_acpi_notifications, SND_HDA_SCODEC_COMPONENT);
 #endif /* ifdef CONFIG_ACPI */
 
-void hda_component_manager_playback_hook(struct hda_component *comps, int num_comps, int action)
+void hda_component_manager_playback_hook(struct hda_component_parent *parent, int action)
 {
+	struct hda_component *comp;
 	int i;
 
-	for (i = 0; i < num_comps; i++) {
-		if (comps[i].dev && comps[i].pre_playback_hook)
-			comps[i].pre_playback_hook(comps[i].dev, action);
+	for (i = 0; i < ARRAY_SIZE(parent->comps); i++) {
+		comp = hda_component_from_index(parent, i);
+		if (comp->dev && comp->pre_playback_hook)
+			comp->pre_playback_hook(comp->dev, action);
 	}
-	for (i = 0; i < num_comps; i++) {
-		if (comps[i].dev && comps[i].playback_hook)
-			comps[i].playback_hook(comps[i].dev, action);
+	for (i = 0; i < ARRAY_SIZE(parent->comps); i++) {
+		comp = hda_component_from_index(parent, i);
+		if (comp->dev && comp->playback_hook)
+			comp->playback_hook(comp->dev, action);
 	}
-	for (i = 0; i < num_comps; i++) {
-		if (comps[i].dev && comps[i].post_playback_hook)
-			comps[i].post_playback_hook(comps[i].dev, action);
+	for (i = 0; i < ARRAY_SIZE(parent->comps); i++) {
+		comp = hda_component_from_index(parent, i);
+		if (comp->dev && comp->post_playback_hook)
+			comp->post_playback_hook(comp->dev, action);
 	}
 }
 EXPORT_SYMBOL_NS_GPL(hda_component_manager_playback_hook, SND_HDA_SCODEC_COMPONENT);
@@ -124,22 +132,21 @@ static int hda_comp_match_dev_name(struct device *dev, void *data)
 }
 
 int hda_component_manager_bind(struct hda_codec *cdc,
-			       struct hda_component *comps, int count)
+			       struct hda_component_parent *parent)
 {
 	int i;
 
-	/* Init shared data */
-	for (i = 0; i < count; ++i) {
-		memset(&comps[i], 0, sizeof(comps[i]));
-		comps[i].codec = cdc;
-	}
+	/* Init shared and component specific data */
+	memset(parent, 0, sizeof(parent));
+	for (i = 0; i < ARRAY_SIZE(parent->comps); i++)
+		parent->comps[i].codec = cdc;
 
-	return component_bind_all(hda_codec_dev(cdc), comps);
+	return component_bind_all(hda_codec_dev(cdc), &parent->comps);
 }
 EXPORT_SYMBOL_NS_GPL(hda_component_manager_bind, SND_HDA_SCODEC_COMPONENT);
 
 int hda_component_manager_init(struct hda_codec *cdc,
-			       struct hda_component *comps, int count,
+			       struct hda_component_parent *parent, int count,
 			       const char *bus, const char *hid,
 			       const char *match_str,
 			       const struct component_master_ops *ops)
diff --git a/sound/pci/hda/hda_component.h b/sound/pci/hda/hda_component.h
index c70b3de68ab2..a016f1b942a2 100644
--- a/sound/pci/hda/hda_component.h
+++ b/sound/pci/hda/hda_component.h
@@ -28,18 +28,21 @@ struct hda_component {
 	void (*post_playback_hook)(struct device *dev, int action);
 };
 
+struct hda_component_parent {
+	struct hda_component comps[HDA_MAX_COMPONENTS];
+};
+
 #ifdef CONFIG_ACPI
-void hda_component_acpi_device_notify(struct hda_component *comps, int num_comps,
+void hda_component_acpi_device_notify(struct hda_component_parent *parent,
 				      acpi_handle handle, u32 event, void *data);
 int hda_component_manager_bind_acpi_notifications(struct hda_codec *cdc,
-						  struct hda_component *comps, int num_comps,
+						  struct hda_component_parent *parent,
 						  acpi_notify_handler handler, void *data);
 void hda_component_manager_unbind_acpi_notifications(struct hda_codec *cdc,
-						     struct hda_component *comps,
+						     struct hda_component_parent *parent,
 						     acpi_notify_handler handler);
 #else
-static inline void hda_component_acpi_device_notify(struct hda_component *comps,
-						    int num_comps,
+static inline void hda_component_acpi_device_notify(struct hda_component_parent *parent,
 						    acpi_handle handle,
 						    u32 event,
 						    void *data)
@@ -47,8 +50,7 @@ static inline void hda_component_acpi_device_notify(struct hda_component *comps,
 }
 
 static inline int hda_component_manager_bind_acpi_notifications(struct hda_codec *cdc,
-								struct hda_component *comps,
-								int num_comps,
+								struct hda_component_parent *parent,
 								acpi_notify_handler handler,
 								void *data)
 
@@ -57,17 +59,16 @@ static inline int hda_component_manager_bind_acpi_notifications(struct hda_codec
 }
 
 static inline void hda_component_manager_unbind_acpi_notifications(struct hda_codec *cdc,
-								   struct hda_component *comps,
+								   struct hda_component_parent *parent,
 								   acpi_notify_handler handler)
 {
 }
 #endif /* ifdef CONFIG_ACPI */
 
-void hda_component_manager_playback_hook(struct hda_component *comps, int num_comps,
-					 int action);
+void hda_component_manager_playback_hook(struct hda_component_parent *parent, int action);
 
 int hda_component_manager_init(struct hda_codec *cdc,
-			       struct hda_component *comps, int count,
+			       struct hda_component_parent *parent, int count,
 			       const char *bus, const char *hid,
 			       const char *match_str,
 			       const struct component_master_ops *ops);
@@ -75,13 +76,24 @@ int hda_component_manager_init(struct hda_codec *cdc,
 void hda_component_manager_free(struct hda_codec *cdc,
 				const struct component_master_ops *ops);
 
-int hda_component_manager_bind(struct hda_codec *cdc,
-			       struct hda_component *comps, int count);
+int hda_component_manager_bind(struct hda_codec *cdc, struct hda_component_parent *parent);
+
+static inline struct hda_component *hda_component_from_index(struct hda_component_parent *parent,
+							     int index)
+{
+	if (!parent)
+		return NULL;
+
+	if (index < 0 || index >= ARRAY_SIZE(parent->comps))
+		return NULL;
+
+	return &parent->comps[index];
+}
 
 static inline void hda_component_manager_unbind(struct hda_codec *cdc,
-					       struct hda_component *comps)
+						struct hda_component_parent *parent)
 {
-	component_unbind_all(hda_codec_dev(cdc), comps);
+	component_unbind_all(hda_codec_dev(cdc), &parent->comps);
 }
 
 #endif /* ifndef __HDA_COMPONENT_H__ */
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index aa76d1c88589..ab9d13e7dcaa 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -131,7 +131,7 @@ struct alc_spec {
 	u8 alc_mute_keycode_map[1];
 
 	/* component binding */
-	struct hda_component comps[HDA_MAX_COMPONENTS];
+	struct hda_component_parent comps;
 };
 
 /*
@@ -6789,8 +6789,7 @@ static void comp_acpi_device_notify(acpi_handle handle, u32 event, void *data)
 
 	codec_info(cdc, "ACPI Notification %d\n", event);
 
-	hda_component_acpi_device_notify(spec->comps, ARRAY_SIZE(spec->comps),
-					 handle, event, data);
+	hda_component_acpi_device_notify(&spec->comps, handle, event, data);
 }
 
 static int comp_bind(struct device *dev)
@@ -6799,12 +6798,12 @@ static int comp_bind(struct device *dev)
 	struct alc_spec *spec = cdc->spec;
 	int ret;
 
-	ret = hda_component_manager_bind(cdc, spec->comps, ARRAY_SIZE(spec->comps));
+	ret = hda_component_manager_bind(cdc, &spec->comps);
 	if (ret)
 		return ret;
 
 	return hda_component_manager_bind_acpi_notifications(cdc,
-							     spec->comps, ARRAY_SIZE(spec->comps),
+							     &spec->comps,
 							     comp_acpi_device_notify, cdc);
 }
 
@@ -6813,8 +6812,8 @@ static void comp_unbind(struct device *dev)
 	struct hda_codec *cdc = dev_to_hda_codec(dev);
 	struct alc_spec *spec = cdc->spec;
 
-	hda_component_manager_unbind_acpi_notifications(cdc, spec->comps, comp_acpi_device_notify);
-	hda_component_manager_unbind(cdc, spec->comps);
+	hda_component_manager_unbind_acpi_notifications(cdc, &spec->comps, comp_acpi_device_notify);
+	hda_component_manager_unbind(cdc, &spec->comps);
 }
 
 static const struct component_master_ops comp_master_ops = {
@@ -6827,7 +6826,7 @@ static void comp_generic_playback_hook(struct hda_pcm_stream *hinfo, struct hda_
 {
 	struct alc_spec *spec = cdc->spec;
 
-	hda_component_manager_playback_hook(spec->comps, ARRAY_SIZE(spec->comps), action);
+	hda_component_manager_playback_hook(&spec->comps, action);
 }
 
 static void comp_generic_fixup(struct hda_codec *cdc, int action, const char *bus,
@@ -6838,7 +6837,7 @@ static void comp_generic_fixup(struct hda_codec *cdc, int action, const char *bu
 
 	switch (action) {
 	case HDA_FIXUP_ACT_PRE_PROBE:
-		ret = hda_component_manager_init(cdc, spec->comps, count, bus, hid,
+		ret = hda_component_manager_init(cdc, &spec->comps, count, bus, hid,
 						 match_str, &comp_master_ops);
 		if (ret)
 			return;
-- 
2.34.1

