Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD94F75CB89
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 17:22:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0DF4208;
	Fri, 21 Jul 2023 17:21:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0DF4208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689952927;
	bh=eoZWR569YA0i76IYg/gBaUZ5W1EO/sHnPxAuKFSgpDM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=t6Q1FcuNNSWB9qvWNlFQAmMyfkYl35y2sBc/8Qq9f0nP0TDV7VJajF62GqQk4cmOI
	 rhdS+AIWj1uoLEEFagVkGEucfi2D73SZW4ZvVHu1dsF3QGpkL4K8VZGxYm3WDdVJel
	 D9WJEFnJHOWL/ciOGcxP/KNA5Ox4rn7bOQ+U9dUU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21349F805E0; Fri, 21 Jul 2023 17:19:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 39BB3F805D7;
	Fri, 21 Jul 2023 17:19:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38947F80587; Fri, 21 Jul 2023 17:18:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2D535F80549
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 17:18:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D535F80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=RnmQn6Uw
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36LDppwp011284;
	Fri, 21 Jul 2023 10:18:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=i4r8F+GfmuK4opOrNQVX10rqTiZBZAw0XXyfo15gL98=; b=
	RnmQn6UwreuFUS3mFpIgcKInDkaG7ukDHSTXdVvi6QGQkPQn7dyhRAlrq2HbIXsy
	Wq7ggZUNq5grjjOcQ7554BAUy5Rx8XqaxxOsRObEZQZYIsz/nzDy3J6ao8vyA7sm
	wJi9CAwaSJ7GNqgwEvXscVwlKUbQr0JfOzHB429U1+MjEDKopioA5wpupD8VD3Zt
	OJx0x/1KBjiqKOou7ZRkIbneqxm3WgUFnZMaJebRiHZvjn9Qe3VmUCC9OQ32DoBe
	zrFeTUzoaby/cjS3PzxN0DwQYLyx1jRs3S4Jt3bn+pOgYSTULJmf/HCAFQghHlui
	8FuVO12pFJDXeeD9Y8xK2w==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3rus62y8g5-9
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jul 2023 10:18:34 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 21 Jul
 2023 16:18:27 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.30 via Frontend Transport; Fri, 21 Jul 2023 16:18:27 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.219])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7782115B6;
	Fri, 21 Jul 2023 15:18:27 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi
 Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Stefan Binding
	<sbinding@opensource.cirrus.com>
Subject: [PATCH v2 08/11] ALSA: hda: cs35l41: Use pre and post playback hooks
Date: Fri, 21 Jul 2023 16:18:13 +0100
Message-ID: <20230721151816.2080453-9-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230721151816.2080453-1-sbinding@opensource.cirrus.com>
References: <20230721151816.2080453-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: EoXYisXqvUCPkV3532gJ0WdvWA_U_WYK
X-Proofpoint-ORIG-GUID: EoXYisXqvUCPkV3532gJ0WdvWA_U_WYK
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: CRL2TUYMQA3B2IZGYOICLZRNOGWIWDCB
X-Message-ID-Hash: CRL2TUYMQA3B2IZGYOICLZRNOGWIWDCB
X-MailFrom: prvs=2566513517=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CRL2TUYMQA3B2IZGYOICLZRNOGWIWDCB/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use new hooks to ensure separation between play/pause actions,
as required by external boost.

External Boost on CS35L41 requires the amp to go through a
particular sequence of steps. One of these steps involes
the setting of a GPIO. This GPIO is connected to one or
more of the amps, and it may control the boost for all of
the amps. To ensure that the GPIO is set when it is safe
to do so, and to ensure that boost is ready for the rest of
the sequence to be able to continue, we must ensure that
the each part of the sequence is executed for each amp
before moving on to the next part of the sequence.

Some of the Play and Pause actions have moved from Open to
Prepare. This is because Open is not guaranteed to be called
again on system resume, whereas Prepare should.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda.c | 53 ++++++++++++++++++++++++++++++-------
 1 file changed, 43 insertions(+), 10 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index f77583b46b6b0..a482d4752b3f8 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -556,37 +556,68 @@ static void cs35l41_hda_pause_done(struct device *dev)
 	cs35l41->playback_started = false;
 }
 
+static void cs35l41_hda_pre_playback_hook(struct device *dev, int action)
+{
+	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
+
+	switch (action) {
+	case HDA_GEN_PCM_ACT_CLEANUP:
+		mutex_lock(&cs35l41->fw_mutex);
+		cs35l41_hda_pause_start(dev);
+		mutex_unlock(&cs35l41->fw_mutex);
+		break;
+	default:
+		break;
+	}
+}
 static void cs35l41_hda_playback_hook(struct device *dev, int action)
 {
 	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
 
 	switch (action) {
 	case HDA_GEN_PCM_ACT_OPEN:
+		/*
+		 * All amps must be resumed before we can start playing back.
+		 * This ensures, for external boost, that all amps are in AMP_SAFE mode.
+		 * Do this in HDA_GEN_PCM_ACT_OPEN, since this is run prior to any of the
+		 * other actions.
+		 */
 		pm_runtime_get_sync(dev);
-		mutex_lock(&cs35l41->fw_mutex);
-		cs35l41_hda_play_start(dev);
-		mutex_unlock(&cs35l41->fw_mutex);
 		break;
 	case HDA_GEN_PCM_ACT_PREPARE:
 		mutex_lock(&cs35l41->fw_mutex);
-		cs35l41_hda_play_done(dev);
+		cs35l41_hda_play_start(dev);
 		mutex_unlock(&cs35l41->fw_mutex);
 		break;
 	case HDA_GEN_PCM_ACT_CLEANUP:
 		mutex_lock(&cs35l41->fw_mutex);
-		cs35l41_hda_pause_start(dev);
+		cs35l41_hda_pause_done(dev);
 		mutex_unlock(&cs35l41->fw_mutex);
 		break;
 	case HDA_GEN_PCM_ACT_CLOSE:
-		mutex_lock(&cs35l41->fw_mutex);
-		cs35l41_hda_pause_done(dev);
-		mutex_unlock(&cs35l41->fw_mutex);
-
+		/*
+		 * Playback must be finished for all amps before we start runtime suspend.
+		 * This ensures no amps are playing back when we start putting them to sleep.
+		 */
 		pm_runtime_mark_last_busy(dev);
 		pm_runtime_put_autosuspend(dev);
 		break;
 	default:
-		dev_warn(cs35l41->dev, "Playback action not supported: %d\n", action);
+		break;
+	}
+}
+
+static void cs35l41_hda_post_playback_hook(struct device *dev, int action)
+{
+	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
+
+	switch (action) {
+	case HDA_GEN_PCM_ACT_PREPARE:
+		mutex_lock(&cs35l41->fw_mutex);
+		cs35l41_hda_play_done(dev);
+		mutex_unlock(&cs35l41->fw_mutex);
+		break;
+	default:
 		break;
 	}
 }
@@ -1037,6 +1068,8 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
 	ret = cs35l41_create_controls(cs35l41);
 
 	comps->playback_hook = cs35l41_hda_playback_hook;
+	comps->pre_playback_hook = cs35l41_hda_pre_playback_hook;
+	comps->post_playback_hook = cs35l41_hda_post_playback_hook;
 
 	mutex_unlock(&cs35l41->fw_mutex);
 
-- 
2.34.1

