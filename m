Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 210748D801F
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2024 12:36:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F329883E;
	Mon,  3 Jun 2024 12:36:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F329883E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717411005;
	bh=tyHcTilPJBf1ZtldFADW7DKJj5yP1ToJmKxXcIXtfGI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A54JXElbE/QEsNI27Fb8qMjkDiB1VPPReNiB23l9V1zT1552poXx1AiwNtP7uco3j
	 pEQnwhsA1lrqn+fHIIexMEBN4ADqKV/71f6kYUhRb837/Nz6+brCVobhqaeAaSobX/
	 UzfAs/nTvqZIehnogQ1HKEqhT8+AuHyqdj1ETae4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04918F805FC; Mon,  3 Jun 2024 12:35:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 21540F805E8;
	Mon,  3 Jun 2024 12:35:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D68F5F804E5; Mon,  3 Jun 2024 12:35:38 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B39B6F80496
	for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2024 12:35:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B39B6F80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=HqjbIreP
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4535SpqV028069;
	Mon, 3 Jun 2024 05:35:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=+0kLEE8LRxxWUa9qJB+cByKX7sWs5TP2HYGpu4CAWoU=; b=
	HqjbIrePigF45RLHqnlnRFfAo4N1yaSqaJNKtfIrC+6fR0NaFXnOoUac00Q3M2Zd
	NGAp7gWv6cTAwN80EwoPyW+kOqKEsEakKtclvVBP63MgBwG0CwoNYkeh4WZgIiQE
	OVpZ7++CJyQG+phhQHVm0bR8RHkkqEg9+ijQTvtmDefiDJ5pXo2csp8ArYGuEGkL
	BCIQgf1xN8hVkVLQJluGcgSGazAcCmepMl2LlVRLegqGvsPV+X8n/jzmv1wg/Yo+
	8CWFUNGQG/au7xVh+557ntOOBP5Mhcr6Iz1TZuH1aqYhYwCmwGyEhxuSXDxYXhIF
	Yuihb1i0Rb3MziqxL439cg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3yg11xscbs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 05:35:31 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Jun 2024
 11:35:29 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 3 Jun 2024 11:35:29 +0100
Received: from EDIN6ZZ2FY3.ad.cirrus.com (EDIN6ZZ2FY3.ad.cirrus.com
 [198.61.64.166])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id DBD1982024A;
	Mon,  3 Jun 2024 10:35:28 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <soyer@irl.hu>, <shenghao-ding@ti.com>, <kevin-lu@ti.com>,
        <baojun.xu@ti.com>, <kailang@realtek.com>,
        Simon Trimmer
	<simont@opensource.cirrus.com>
Subject: [PATCH 7/7] ALSA: hda: hda_component: Protect shared data with a
 mutex
Date: Mon, 3 Jun 2024 11:35:24 +0100
Message-ID: <20240603103524.32442-8-simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240603103524.32442-1-simont@opensource.cirrus.com>
References: <20240603103524.32442-1-simont@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 0nwIrSmRf_IfMTA0X0QcMZBbFF3xBT3x
X-Proofpoint-ORIG-GUID: 0nwIrSmRf_IfMTA0X0QcMZBbFF3xBT3x
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: FTYME2WVCJLFUOE5MYDTAEAN74WESDSI
X-Message-ID-Hash: FTYME2WVCJLFUOE5MYDTAEAN74WESDSI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FTYME2WVCJLFUOE5MYDTAEAN74WESDSI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The hda_component contains information shared from the amp drivers to
the codec that can be altered (for example as the driver unloads). Guard
the update and use of these to prevent use of stale data.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
---
 sound/pci/hda/hda_component.c | 13 ++++++++++++-
 sound/pci/hda/hda_component.h |  4 ++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_component.c b/sound/pci/hda/hda_component.c
index 1a9950b76866..7b19cb38b4e0 100644
--- a/sound/pci/hda/hda_component.c
+++ b/sound/pci/hda/hda_component.c
@@ -21,11 +21,13 @@ void hda_component_acpi_device_notify(struct hda_component_parent *parent,
 	struct hda_component *comp;
 	int i;
 
+	mutex_lock(&parent->mutex);
 	for (i = 0; i < ARRAY_SIZE(parent->comps); i++) {
 		comp = hda_component_from_index(parent, i);
 		if (comp->dev && comp->acpi_notify)
 			comp->acpi_notify(acpi_device_handle(comp->adev), event, comp->dev);
 	}
+	mutex_unlock(&parent->mutex);
 }
 EXPORT_SYMBOL_NS_GPL(hda_component_acpi_device_notify, SND_HDA_SCODEC_COMPONENT);
 
@@ -87,6 +89,7 @@ void hda_component_manager_playback_hook(struct hda_component_parent *parent, in
 	struct hda_component *comp;
 	int i;
 
+	mutex_lock(&parent->mutex);
 	for (i = 0; i < ARRAY_SIZE(parent->comps); i++) {
 		comp = hda_component_from_index(parent, i);
 		if (comp->dev && comp->pre_playback_hook)
@@ -102,6 +105,7 @@ void hda_component_manager_playback_hook(struct hda_component_parent *parent, in
 		if (comp->dev && comp->post_playback_hook)
 			comp->post_playback_hook(comp->dev, action);
 	}
+	mutex_unlock(&parent->mutex);
 }
 EXPORT_SYMBOL_NS_GPL(hda_component_manager_playback_hook, SND_HDA_SCODEC_COMPONENT);
 
@@ -134,11 +138,18 @@ static int hda_comp_match_dev_name(struct device *dev, void *data)
 int hda_component_manager_bind(struct hda_codec *cdc,
 			       struct hda_component_parent *parent)
 {
+	int ret;
+
 	/* Init shared and component specific data */
 	memset(parent, 0, sizeof(*parent));
+	mutex_init(&parent->mutex);
 	parent->codec = cdc;
 
-	return component_bind_all(hda_codec_dev(cdc), parent);
+	mutex_lock(&parent->mutex);
+	ret = component_bind_all(hda_codec_dev(cdc), parent);
+	mutex_unlock(&parent->mutex);
+
+	return ret;
 }
 EXPORT_SYMBOL_NS_GPL(hda_component_manager_bind, SND_HDA_SCODEC_COMPONENT);
 
diff --git a/sound/pci/hda/hda_component.h b/sound/pci/hda/hda_component.h
index dd4dabeae9ee..9f786608144c 100644
--- a/sound/pci/hda/hda_component.h
+++ b/sound/pci/hda/hda_component.h
@@ -11,6 +11,7 @@
 
 #include <linux/acpi.h>
 #include <linux/component.h>
+#include <linux/mutex.h>
 #include <sound/hda_codec.h>
 
 #define HDA_MAX_COMPONENTS	4
@@ -28,6 +29,7 @@ struct hda_component {
 };
 
 struct hda_component_parent {
+	struct mutex mutex;
 	struct hda_codec *codec;
 	struct hda_component comps[HDA_MAX_COMPONENTS];
 };
@@ -93,7 +95,9 @@ static inline struct hda_component *hda_component_from_index(struct hda_componen
 static inline void hda_component_manager_unbind(struct hda_codec *cdc,
 						struct hda_component_parent *parent)
 {
+	mutex_lock(&parent->mutex);
 	component_unbind_all(hda_codec_dev(cdc), parent);
+	mutex_unlock(&parent->mutex);
 }
 
 #endif /* ifndef __HDA_COMPONENT_H__ */
-- 
2.34.1

