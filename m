Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C3275CB8E
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 17:22:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2295A204;
	Fri, 21 Jul 2023 17:22:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2295A204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689952977;
	bh=23M1U+9FJKtF5qg48nEfTBHunMBf5Bc3x0qH17D1urw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bVUzKmaXiJn/wXZRk9iZe8xuLUtgUUZsgdObpY4fPV9+clakI3EDEcN4ntn9Taq9b
	 UJPi1cM0I2rpe+Vu6vcRJ46v3H+aH0YPxkxmJLUPlwiBmJcpmJqZ5fwR7M0hMrP3Nz
	 oRy/15TIa3o9cnVEHsrxhR4/1MTzPAAXUPeGFZWg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 674F7F8057C; Fri, 21 Jul 2023 17:20:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 98927F80564;
	Fri, 21 Jul 2023 17:20:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB01FF80494; Fri, 21 Jul 2023 17:20:16 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 00EBEF804DA
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 17:18:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00EBEF804DA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=FxrRorTa
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36LDls9h007648;
	Fri, 21 Jul 2023 10:18:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=JqcxCQdId6GERpPzL031OjgEbu9ZZ+nMWXjwJ4Papww=; b=
	FxrRorTa5JQoZzhPi37nwFjoQu9jPxHar5pTpLxqZuhEaNREG6b97Ou3V4TxsmAX
	zfQLVrkR/NrcZza2akvJZgDh9ArDxbGdmSfdRKNiEVMdms3QgeykZ3cJgMfOGp99
	USV+nBeH1lBNtidgqe8BzZMMJ5qkqZJrunn2i9AjArMRhCBjbLdhxcwx5rkeUDiw
	FZWapHZixvZTgbKE1BOrmdvtZCC6PY+CJr+3ox8xFQurr1x4ECPH4aTxfuUxjAiV
	4Sf3woh/o38hh+cx55v1TBApLqe7vcEDhYNDyjev2tKQVbM6cykCeVKO48jrmxPq
	JtufpWkuTG+4qQ5D88+TBA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3rus62y8g9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jul 2023 10:18:30 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 21 Jul
 2023 16:18:28 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.30 via Frontend
 Transport; Fri, 21 Jul 2023 16:18:27 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.219])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B8506356C;
	Fri, 21 Jul 2023 15:18:27 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi
 Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Stefan Binding
	<sbinding@opensource.cirrus.com>
Subject: [PATCH v2 09/11] ALSA: hda: cs35l41: Rework System Suspend to ensure
 correct call separation
Date: Fri, 21 Jul 2023 16:18:14 +0100
Message-ID: <20230721151816.2080453-10-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230721151816.2080453-1-sbinding@opensource.cirrus.com>
References: <20230721151816.2080453-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 5ljoq-ymjV2Rku04-0r5YW4IfO0MXVlU
X-Proofpoint-ORIG-GUID: 5ljoq-ymjV2Rku04-0r5YW4IfO0MXVlU
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 3HZD6OYVDS4XIK2PAJSGSEGGKAXTNCHB
X-Message-ID-Hash: 3HZD6OYVDS4XIK2PAJSGSEGGKAXTNCHB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3HZD6OYVDS4XIK2PAJSGSEGGKAXTNCHB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In order to correctly pause audio on suspend, amps using external boost
require parts of the pause sequence to be called for all amps before moving
on to the next steps.
For example, as part of pausing the audio, the VSPK GPIO must be disabled,
but since this GPIO is controlled by one amp, but controls the boost for
all amps, it is required to separate the calls.
During playback this is achieved by using the pre and post playback hooks,
however during system suspend, this is not possible, so to separate the
calls, we use both the .prepare and .suspend calls to pause the audio.

Currently, for this reason, we do not restart audio on system resume.
However, we can support this by relying on the playback hook to resume
playback after system suspend.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda.c | 40 ++++++++++++++++++++++++++++++++-----
 1 file changed, 35 insertions(+), 5 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index a482d4752b3f8..70aa819cfbd64 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -595,6 +595,15 @@ static void cs35l41_hda_playback_hook(struct device *dev, int action)
 		mutex_unlock(&cs35l41->fw_mutex);
 		break;
 	case HDA_GEN_PCM_ACT_CLOSE:
+		mutex_lock(&cs35l41->fw_mutex);
+		if (!cs35l41->firmware_running && cs35l41->request_fw_load &&
+		    !cs35l41->fw_request_ongoing) {
+			dev_info(dev, "Requesting Firmware Load after HDA_GEN_PCM_ACT_CLOSE\n");
+			cs35l41->fw_request_ongoing = true;
+			schedule_work(&cs35l41->fw_load_work);
+		}
+		mutex_unlock(&cs35l41->fw_mutex);
+
 		/*
 		 * Playback must be finished for all amps before we start runtime suspend.
 		 * This ensures no amps are playing back when we start putting them to sleep.
@@ -681,6 +690,25 @@ static int cs35l41_ready_for_reset(struct cs35l41_hda *cs35l41)
 	return ret;
 }
 
+static int cs35l41_system_suspend_prep(struct device *dev)
+{
+	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
+
+	dev_dbg(cs35l41->dev, "System Suspend Prepare\n");
+
+	if (cs35l41->hw_cfg.bst_type == CS35L41_EXT_BOOST_NO_VSPK_SWITCH) {
+		dev_err_once(cs35l41->dev, "System Suspend not supported\n");
+		return 0; /* don't block the whole system suspend */
+	}
+
+	mutex_lock(&cs35l41->fw_mutex);
+	if (cs35l41->playback_started)
+		cs35l41_hda_pause_start(dev);
+	mutex_unlock(&cs35l41->fw_mutex);
+
+	return 0;
+}
+
 static int cs35l41_system_suspend(struct device *dev)
 {
 	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
@@ -693,6 +721,11 @@ static int cs35l41_system_suspend(struct device *dev)
 		return 0; /* don't block the whole system suspend */
 	}
 
+	mutex_lock(&cs35l41->fw_mutex);
+	if (cs35l41->playback_started)
+		cs35l41_hda_pause_done(dev);
+	mutex_unlock(&cs35l41->fw_mutex);
+
 	ret = pm_runtime_force_suspend(dev);
 	if (ret) {
 		dev_err(dev, "System Suspend Failed, unable to runtime suspend: %d\n", ret);
@@ -738,6 +771,7 @@ static int cs35l41_system_resume(struct device *dev)
 	}
 
 	mutex_lock(&cs35l41->fw_mutex);
+
 	if (cs35l41->request_fw_load && !cs35l41->fw_request_ongoing) {
 		cs35l41->fw_request_ongoing = true;
 		schedule_work(&cs35l41->fw_load_work);
@@ -770,11 +804,6 @@ static int cs35l41_runtime_suspend(struct device *dev)
 
 	mutex_lock(&cs35l41->fw_mutex);
 
-	if (cs35l41->playback_started) {
-		cs35l41_hda_pause_start(dev);
-		cs35l41_hda_pause_done(dev);
-	}
-
 	if (cs35l41->firmware_running) {
 		ret = cs35l41_enter_hibernate(cs35l41->dev, cs35l41->regmap,
 					      cs35l41->hw_cfg.bst_type);
@@ -1641,6 +1670,7 @@ EXPORT_SYMBOL_NS_GPL(cs35l41_hda_remove, SND_HDA_SCODEC_CS35L41);
 const struct dev_pm_ops cs35l41_hda_pm_ops = {
 	RUNTIME_PM_OPS(cs35l41_runtime_suspend, cs35l41_runtime_resume,
 		       cs35l41_runtime_idle)
+	.prepare = cs35l41_system_suspend_prep,
 	SYSTEM_SLEEP_PM_OPS(cs35l41_system_suspend, cs35l41_system_resume)
 };
 EXPORT_SYMBOL_NS_GPL(cs35l41_hda_pm_ops, SND_HDA_SCODEC_CS35L41);
-- 
2.34.1

