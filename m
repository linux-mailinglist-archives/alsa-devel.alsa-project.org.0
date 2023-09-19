Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C687A5C3E
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 10:15:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D181FE85;
	Tue, 19 Sep 2023 10:14:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D181FE85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695111302;
	bh=s+w29d+a7aelr52mJO3hvu+Y8Foh6yczjzPAz+AnKBA=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=WYgYq22aX3uwNeIcAfnZtiEdlrCYESMClAXoOsLBXOpzTtaQilf1WNC+x/LdafGVe
	 PLswYRvugGaDwy5TNTCvdN2AIOh7cxl+TKogIOMvZvPREXyR6Cvb5EFa8NQWE/sDTU
	 2k++APTEqPxgV5YYfgXxPjRghqH5Hi0A6SP+aEOg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 804BAF8025A; Tue, 19 Sep 2023 10:12:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AB7BF8025A;
	Tue, 19 Sep 2023 10:12:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 539E6F8047D; Tue, 19 Sep 2023 10:12:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 19846F800F4
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 10:12:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19846F800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=YUWvgRNV
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38J4d85s014465;
	Tue, 19 Sep 2023 03:12:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=A
	g2GXYyDdeYDs+7O7yJ7LYA8JwJg0eO6pVS18lspYAU=; b=YUWvgRNV8x1bEdT5Z
	p0ETV6VIfSiCWsRhXq1Iyul33MRSy2/nP2wSzdUvYywBYpVX5NzENdqQbG5Cbwx+
	OYLrKO4G2ZhKfZ8kgduQw7ys/Ykny2DGBnOcCcz3nJOcI12EcRhazw9e8kTbpwo3
	gTJmoT5+vlTWvbcODXj+mOjkzUnnOjgXf8cjS6UyhQZCX4TNu5SxTAnt65nzCU+S
	J+4R+lbeuDvt9pzyUA9jkfPDn5U3TeyYWgbPUxpk/H3TO+nO7TvZRJorj8R5txSs
	sWrIfTZ6vTias6cweUbbWBeakDIarA/G2bVnEtFf2zLX6SeLB+T+QTtPvmrS8usC
	h+tvg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3t59ry3hb2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Sep 2023 03:12:00 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Tue, 19 Sep
 2023 09:11:57 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Tue, 19 Sep 2023 09:11:57 +0100
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.64.21])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D536B11AB;
	Tue, 19 Sep 2023 08:11:56 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH] ALSA: hda: cs35l56: Use the new RUNTIME_PM_OPS() macro
Date: Tue, 19 Sep 2023 09:11:53 +0100
Message-ID: <20230919081153.19793-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: bNnQAanUo07wYwhJY3ooL2_nUDSL2mii
X-Proofpoint-ORIG-GUID: bNnQAanUo07wYwhJY3ooL2_nUDSL2mii
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 4BYM4OUF2MG3Z7UK3FI5K2VAKDLCNZ5U
X-Message-ID-Hash: 4BYM4OUF2MG3Z7UK3FI5K2VAKDLCNZ5U
X-MailFrom: prvs=462624de38=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4BYM4OUF2MG3Z7UK3FI5K2VAKDLCNZ5U/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use RUNTIME_PM_OPS() instead of the old SET_RUNTIME_PM_OPS().
This means we don't need  __maybe_unused on the functions.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/pci/hda/cs35l56_hda.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
index d3cfdad7dd76..b61e1de8c4bf 100644
--- a/sound/pci/hda/cs35l56_hda.c
+++ b/sound/pci/hda/cs35l56_hda.c
@@ -106,7 +106,7 @@ static void cs35l56_hda_playback_hook(struct device *dev, int action)
 	}
 }
 
-static int __maybe_unused cs35l56_hda_runtime_suspend(struct device *dev)
+static int cs35l56_hda_runtime_suspend(struct device *dev)
 {
 	struct cs35l56_hda *cs35l56 = dev_get_drvdata(dev);
 
@@ -116,7 +116,7 @@ static int __maybe_unused cs35l56_hda_runtime_suspend(struct device *dev)
 	return cs35l56_runtime_suspend_common(&cs35l56->base);
 }
 
-static int __maybe_unused cs35l56_hda_runtime_resume(struct device *dev)
+static int cs35l56_hda_runtime_resume(struct device *dev)
 {
 	struct cs35l56_hda *cs35l56 = dev_get_drvdata(dev);
 	int ret;
@@ -1026,7 +1026,7 @@ void cs35l56_hda_remove(struct device *dev)
 EXPORT_SYMBOL_NS_GPL(cs35l56_hda_remove, SND_HDA_SCODEC_CS35L56);
 
 const struct dev_pm_ops cs35l56_hda_pm_ops = {
-	SET_RUNTIME_PM_OPS(cs35l56_hda_runtime_suspend, cs35l56_hda_runtime_resume, NULL)
+	RUNTIME_PM_OPS(cs35l56_hda_runtime_suspend, cs35l56_hda_runtime_resume, NULL)
 	SYSTEM_SLEEP_PM_OPS(cs35l56_hda_system_suspend, cs35l56_hda_system_resume)
 	LATE_SYSTEM_SLEEP_PM_OPS(cs35l56_hda_system_suspend_late,
 				 cs35l56_hda_system_resume_early)
-- 
2.30.2

