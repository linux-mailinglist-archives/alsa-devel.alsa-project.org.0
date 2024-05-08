Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0818BFA2D
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2024 12:04:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7768184A;
	Wed,  8 May 2024 12:04:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7768184A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715162676;
	bh=b7sv7tVc8GVentelu6AtwkhZfHrMX0YDbML4Ak2DqzI=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=NEnLjKJEloC9C7LYd5W+vFBey7BEHbhiK5QKcQtoPt6DCnv5kSex1K0cZ0gb4KMIB
	 H+GkkyKod2UuBkysFHJo1tlcDQnxkcW4Ch46iyQlTzj2ItNx1dr5dOhe8AyCzHSvds
	 5nhUquAU3+hZISIByeO2J4NmbmkYPXPR7avQB2nc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49BD5F805AE; Wed,  8 May 2024 12:04:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 76F42F805A0;
	Wed,  8 May 2024 12:04:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A33C5F8049C; Wed,  8 May 2024 12:03:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CE572F8003A
	for <alsa-devel@alsa-project.org>; Wed,  8 May 2024 12:03:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE572F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Lg8aAL17
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 448404vq027897;
	Wed, 8 May 2024 05:03:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=G
	Kvhtom7tk2GKHXRZkGd6yzHNjsW5iQAf5Fk9EOWuHk=; b=Lg8aAL17SJwmfrPmH
	OVTEP/yTdcjfDJHyXFT2+w0APxjBk84+MmVU8kKG32Mcy20G2cchZ6AKjfvCyciE
	VddkIIUxHuPD2EHujQBzz5bUe0+NKIfC7LNiNPp2v2aj0h0ODK86J9DKgcTV0A9D
	MkToJWKrzAT7rf7XjrTt7T8lMVgm/DkaJd/aGMlACLuxwHcRo6GkJDHsxUjRbsCW
	P/GAkPIU+Dl/zGQnDfcqnLNHuSd4Ro0FKbmtSHhWCANBJzaxEt7xpX7nuCePMLji
	BsMMdu6TZINFdFYLQPtOdJ5iix0HpZRv0XPUZ75/gvNaGzsjsZ0QD+4X3O8spEFv
	z8Thw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3xysf00pgd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 May 2024 05:03:48 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 May 2024
 11:03:47 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 8 May 2024 11:03:47 +0100
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 44793820244;
	Wed,  8 May 2024 10:03:47 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>
Subject: [PATCH] ALSA: hda: hda_component: Initialize shared data during bind
 callback
Date: Wed, 8 May 2024 11:03:47 +0100
Message-ID: <20240508100347.47283-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: rHX2odkGpVa8TkGwbw7Vw7w1FvVFvt0t
X-Proofpoint-ORIG-GUID: rHX2odkGpVa8TkGwbw7Vw7w1FvVFvt0t
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: WI5PUXY43ZC74OB5DEREE4CDTZXDNW75
X-Message-ID-Hash: WI5PUXY43ZC74OB5DEREE4CDTZXDNW75
X-MailFrom: prvs=2858927d68=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WI5PUXY43ZC74OB5DEREE4CDTZXDNW75/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Move the initialization of the shared struct hda_component array into
hda_component_manager_bind().

The purpose of the manager bind() callback is to allow it to perform
initialization before binding in the component drivers. This is the
correct place to initialize the shared data.

The original implementation initialized the shared data in
hda_component_manager_init(). This is only done once during probe()
of the manager driver. So if the component binding was unbound and
then rebound, the shared data would not be re-initialized.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: fd895a74dc1d ("ALSA: hda: realtek: Move hda_component implementation to module")
---
 sound/pci/hda/hda_component.c | 16 +++++++++++++++-
 sound/pci/hda/hda_component.h |  7 ++-----
 sound/pci/hda/patch_realtek.c |  2 +-
 3 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/sound/pci/hda/hda_component.c b/sound/pci/hda/hda_component.c
index cd299d7d84ba..d02589014a3f 100644
--- a/sound/pci/hda/hda_component.c
+++ b/sound/pci/hda/hda_component.c
@@ -123,6 +123,21 @@ static int hda_comp_match_dev_name(struct device *dev, void *data)
 	return !strcmp(d + n, tmp);
 }
 
+int hda_component_manager_bind(struct hda_codec *cdc,
+			       struct hda_component *comps, int count)
+{
+	int i;
+
+	/* Init shared data */
+	for (i = 0; i < count; ++i) {
+		memset(&comps[i], 0, sizeof(comps[i]));
+		comps[i].codec = cdc;
+	}
+
+	return component_bind_all(hda_codec_dev(cdc), comps);
+}
+EXPORT_SYMBOL_NS_GPL(hda_component_manager_bind, SND_HDA_SCODEC_COMPONENT);
+
 int hda_component_manager_init(struct hda_codec *cdc,
 			       struct hda_component *comps, int count,
 			       const char *bus, const char *hid,
@@ -143,7 +158,6 @@ int hda_component_manager_init(struct hda_codec *cdc,
 		sm->hid = hid;
 		sm->match_str = match_str;
 		sm->index = i;
-		comps[i].codec = cdc;
 		component_match_add(dev, &match, hda_comp_match_dev_name, sm);
 	}
 
diff --git a/sound/pci/hda/hda_component.h b/sound/pci/hda/hda_component.h
index c80a66691b5d..c70b3de68ab2 100644
--- a/sound/pci/hda/hda_component.h
+++ b/sound/pci/hda/hda_component.h
@@ -75,11 +75,8 @@ int hda_component_manager_init(struct hda_codec *cdc,
 void hda_component_manager_free(struct hda_codec *cdc,
 				const struct component_master_ops *ops);
 
-static inline int hda_component_manager_bind(struct hda_codec *cdc,
-					     struct hda_component *comps)
-{
-	return component_bind_all(hda_codec_dev(cdc), comps);
-}
+int hda_component_manager_bind(struct hda_codec *cdc,
+			       struct hda_component *comps, int count);
 
 static inline void hda_component_manager_unbind(struct hda_codec *cdc,
 					       struct hda_component *comps)
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 8c157158f1cb..8c39bbdc6c5e 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6785,7 +6785,7 @@ static int comp_bind(struct device *dev)
 	struct alc_spec *spec = cdc->spec;
 	int ret;
 
-	ret = hda_component_manager_bind(cdc, spec->comps);
+	ret = hda_component_manager_bind(cdc, spec->comps, ARRAY_SIZE(spec->comps));
 	if (ret)
 		return ret;
 
-- 
2.39.2

