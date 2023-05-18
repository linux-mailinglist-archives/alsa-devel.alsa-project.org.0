Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45383708496
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 17:05:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 516C6206;
	Thu, 18 May 2023 17:04:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 516C6206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684422308;
	bh=ziJ6fK5xKCWmSOaqgMNufdY1/tOLco89X22UsmUfUPg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ud+c1vDE1331EjTB3HLl/juqL0NcvHSOTl+RiGUHzRga5p3ay5C/1ZotPuHGISp2C
	 cyPDpWyBhvxhs17XC/8oBndzNZWic6+ohma3kw+IRbU8jUoLQiezVu/b05O3Sum0b5
	 Xo6YJ48jVEC33g0aF6UOhJYsXI3D4Unv8V7HuB20=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9BD97F80571; Thu, 18 May 2023 17:03:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 10807F80571;
	Thu, 18 May 2023 17:03:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D82B2F80552; Thu, 18 May 2023 17:03:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 78B4DF8016D
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 17:02:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78B4DF8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=fMuF/p+i
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34IBl9Gn018534;
	Thu, 18 May 2023 10:02:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=if4MXmKxN3SfnqhLmxf1Quq7P4ZDofQ6rP+3VpvG0WQ=;
 b=fMuF/p+iARjNTSTcJNbumJrZX4/Bo/+ubBbiypjCMgeGgxZ+rFGbbG94Jzbb03IjUDBe
 h8EXrmKyfb54gTQl9le+5vihXtCUhACMUNuQAwVLpMCdL1xS08Bzb/QVisj+SQPxjtdI
 QRuwhhD7icwuRG+YjDtcZXKIBo4YIs+XEoy9xW8rK4s/VRIQ//FOvkbMoMWgILRH5Tqb
 eQelmCR1urApm/eGpmO7fqN9yYuZZNQmZw6pfzMjqjA4XG3zj/2KFRQ3bhTe9Qho5yhp
 uJiCTTVyOeUXNKbbLcKOxJoXVE5dTrp0AID9GfPO13uK7UnQiOVCqoPMJc5HNVDKLtKL qQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3qngq1ghum-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 May 2023 10:02:53 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Thu, 18 May
 2023 10:02:50 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 18 May 2023 10:02:50 -0500
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 460DD15B7;
	Thu, 18 May 2023 15:02:50 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Simon Trimmer
	<simont@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH 3/3] ASoC: cs35l56: In secure mode skip SHUTDOWN and RESET
 around fw download
Date: Thu, 18 May 2023 16:02:50 +0100
Message-ID: <20230518150250.1121006-4-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230518150250.1121006-1-rf@opensource.cirrus.com>
References: <20230518150250.1121006-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: jvAwPQdb-Y1Fr8jO6yD6teUP0pedceX6
X-Proofpoint-ORIG-GUID: jvAwPQdb-Y1Fr8jO6yD6teUP0pedceX6
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: ZKIQSAHQDXVUIDT4K6SBR7SDGH3DNTAA
X-Message-ID-Hash: ZKIQSAHQDXVUIDT4K6SBR7SDGH3DNTAA
X-MailFrom: prvs=05023014f4=rf@opensource.cirrus.com
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Simon Trimmer <simont@opensource.cirrus.com>

If the device is in secure mode it's unnecessary to send a SHUTDOWN and
SYSTEM_RESET around the firmware download. It could only be patching
insecure tunings. A tuning patch doesn't need a SHUTDOWN and only needs
a REINIT afterwards. This will reduce the overhead of exiting system
suspend in secure mode.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 include/sound/cs35l56.h    |  1 +
 sound/soc/codecs/cs35l56.c | 47 ++++++++++++++++++++++++++++++--------
 2 files changed, 38 insertions(+), 10 deletions(-)

diff --git a/include/sound/cs35l56.h b/include/sound/cs35l56.h
index 002042b1c73c..1f9713d7ca76 100644
--- a/include/sound/cs35l56.h
+++ b/include/sound/cs35l56.h
@@ -223,6 +223,7 @@
 
 #define CS35L56_MBOX_CMD_AUDIO_PLAY			0x0B000001
 #define CS35L56_MBOX_CMD_AUDIO_PAUSE			0x0B000002
+#define CS35L56_MBOX_CMD_AUDIO_REINIT			0x0B000003
 #define CS35L56_MBOX_CMD_HIBERNATE_NOW			0x02000001
 #define CS35L56_MBOX_CMD_WAKEUP				0x02000002
 #define CS35L56_MBOX_CMD_PREVENT_AUTO_HIBERNATE		0x02000003
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 255c442308f2..3c07bd1e959e 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -825,19 +825,23 @@ static void cs35l56_system_reset(struct cs35l56_private *cs35l56)
 	regcache_cache_only(cs35l56->regmap, false);
 }
 
-static void cs35l56_dsp_work(struct work_struct *work)
+static void cs35l56_secure_patch(struct cs35l56_private *cs35l56)
+{
+	int ret;
+
+	/* Use wm_adsp to load and apply the firmware patch and coefficient files */
+	ret = wm_adsp_power_up(&cs35l56->dsp);
+	if (ret)
+		dev_dbg(cs35l56->dev, "%s: wm_adsp_power_up ret %d\n", __func__, ret);
+	else
+		cs35l56_mbox_send(cs35l56, CS35L56_MBOX_CMD_AUDIO_REINIT);
+}
+
+static void cs35l56_patch(struct cs35l56_private *cs35l56)
 {
-	struct cs35l56_private *cs35l56 = container_of(work,
-						       struct cs35l56_private,
-						       dsp_work);
 	unsigned int reg;
 	unsigned int val;
-	int ret = 0;
-
-	if (!cs35l56->init_done)
-		return;
-
-	pm_runtime_get_sync(cs35l56->dev);
+	int ret;
 
 	/*
 	 * Disable SoundWire interrupts to prevent race with IRQ work.
@@ -910,6 +914,29 @@ static void cs35l56_dsp_work(struct work_struct *work)
 		sdw_write_no_pm(cs35l56->sdw_peripheral, CS35L56_SDW_GEN_INT_MASK_1,
 				CS35L56_SDW_INT_MASK_CODEC_IRQ);
 	}
+}
+
+static void cs35l56_dsp_work(struct work_struct *work)
+{
+	struct cs35l56_private *cs35l56 = container_of(work,
+						       struct cs35l56_private,
+						       dsp_work);
+
+	if (!cs35l56->init_done)
+		return;
+
+	pm_runtime_get_sync(cs35l56->dev);
+
+	/*
+	 * When the device is running in secure mode the firmware files can
+	 * only contain insecure tunings and therefore we do not need to
+	 * shutdown the firmware to apply them and can use the lower cost
+	 * reinit sequence instead.
+	 */
+	if (cs35l56->secured)
+		cs35l56_secure_patch(cs35l56);
+	else
+		cs35l56_patch(cs35l56);
 
 	pm_runtime_mark_last_busy(cs35l56->dev);
 	pm_runtime_put_autosuspend(cs35l56->dev);
-- 
2.30.2

