Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5B16E2472
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Apr 2023 15:40:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C51B4E9C;
	Fri, 14 Apr 2023 15:40:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C51B4E9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681479650;
	bh=/byzNSYxKRXyOZIq7bLF40wz4o0h5+fvOTj+mIMWuVo=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=hMz9ppt1Q1j0mWQWJJfAqhXWlnaVS4XwQkKsXsgQYnbOfP4emPiP7aBBioUZUqrOP
	 CdRZ8coLnSAn5a9arkDXgMn0OT8PU+itCBNmHdeATU/+qxFB/nYUWNymlqZQ/DqTsk
	 ST6nwxKml4f2/1nbrDjDPWW6AhdSxjwMtk5kbDBw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5295BF8055C;
	Fri, 14 Apr 2023 15:38:21 +0200 (CEST)
To: <broonie@kernel.org>
Subject: [PATCH 4/5] ASoC: cs35l56: Remove redundant dsp_ready_completion
Date: Fri, 14 Apr 2023 14:37:52 +0100
In-Reply-To: <20230414133753.653139-1-rf@opensource.cirrus.com>
References: <20230414133753.653139-1-rf@opensource.cirrus.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7DRRIXI2GS4KJZENZOGRSBSII7EXJVYA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168147950068.26.5733669374245435324@mailman-core.alsa-project.org>
From: Richard Fitzgerald via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Simon Trimmer <simont@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F368F80542; Fri, 14 Apr 2023 15:38:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D21F7F8023A
	for <alsa-devel@alsa-project.org>; Fri, 14 Apr 2023 15:37:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D21F7F8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=oZbe0fAx
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33EDVEAP030487;
	Fri, 14 Apr 2023 08:37:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=M4vN88raz5FwiHWCJYSwPELYbjFsKCYh3cDqmQYIcFw=;
 b=oZbe0fAxIDJFVzp98emKrCyoysdKS9G8uB9FILweaHRFipTd8tViM2pmKYu7Jis733oy
 /kSAHo4HTHm7KoSzeUVYawmYnYdweg3vWlVP9CxRveA8SMV4Am6jvVgUJ4E36U0wbtQt
 S5UqjR018Wtk8UwY3t8XHwf18B0K5vqoJoI+x1IjLlPw3uJ9anZB2oS1bM/+xttW0yPK
 Ku5rWU7ANRFY9T/i+IAAI7nVguDloX1cH1ub1oQoEF/WieoSme4LAvHZePa11VBdO+bX
 bwwqlaJ/OAMq3hWDbcjNld7EYIecBeuawiWi8mi3OFMOA4eJHrPbk5pf1X3N3HEv2/qx WQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3pu5p3sey0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Apr 2023 08:37:57 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Fri, 14 Apr
 2023 08:37:54 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Fri, 14 Apr 2023 08:37:54 -0500
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2AE0115B6;
	Fri, 14 Apr 2023 13:37:54 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 4/5] ASoC: cs35l56: Remove redundant dsp_ready_completion
Date: Fri, 14 Apr 2023 14:37:52 +0100
Message-ID: <20230414133753.653139-5-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230414133753.653139-1-rf@opensource.cirrus.com>
References: <20230414133753.653139-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: YQw3RR8ZO05iA8w6PqnXX6BaXZ7EBY7o
X-Proofpoint-GUID: YQw3RR8ZO05iA8w6PqnXX6BaXZ7EBY7o
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 7DRRIXI2GS4KJZENZOGRSBSII7EXJVYA
X-Message-ID-Hash: 7DRRIXI2GS4KJZENZOGRSBSII7EXJVYA
X-MailFrom: prvs=94685c4d78=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Simon Trimmer <simont@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7DRRIXI2GS4KJZENZOGRSBSII7EXJVYA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Simon Trimmer <simont@opensource.cirrus.com>

dsp_ready_completion is redundant and can be replaced by a call
flush_work() to wait for cs35l56_dsp_work() to complete.

As the dsp_work is queued by component_probe() it must run before other
ASoC component callbacks and therefore there is no risk of calling
flush_work() before the dsp_work() has been queued.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56.c | 41 +++++++++-----------------------------
 sound/soc/codecs/cs35l56.h |  1 -
 2 files changed, 9 insertions(+), 33 deletions(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index ab2e663af6c2..5f66a8e20b2d 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -51,21 +51,10 @@ static int cs35l56_mbox_send(struct cs35l56_private *cs35l56, unsigned int comma
 	return 0;
 }
 
-static int cs35l56_wait_dsp_ready(struct cs35l56_private *cs35l56)
+static void cs35l56_wait_dsp_ready(struct cs35l56_private *cs35l56)
 {
-	int ret;
-
-	if (!cs35l56->fw_patched) {
-		/* block until firmware download completes */
-		ret = wait_for_completion_timeout(&cs35l56->dsp_ready_completion,
-						  msecs_to_jiffies(25000));
-		if (!ret) {
-			dev_err(cs35l56->dev, "dsp_ready_completion timeout\n");
-			return -ETIMEDOUT;
-		}
-	}
-
-	return 0;
+	/* Wait for patching to complete */
+	flush_work(&cs35l56->dsp_work);
 }
 
 static int cs35l56_dspwait_get_volsw(struct snd_kcontrol *kcontrol,
@@ -73,11 +62,8 @@ static int cs35l56_dspwait_get_volsw(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct cs35l56_private *cs35l56 = snd_soc_component_get_drvdata(component);
-	int ret = cs35l56_wait_dsp_ready(cs35l56);
-
-	if (ret)
-		return ret;
 
+	cs35l56_wait_dsp_ready(cs35l56);
 	return snd_soc_get_volsw(kcontrol, ucontrol);
 }
 
@@ -86,11 +72,8 @@ static int cs35l56_dspwait_put_volsw(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct cs35l56_private *cs35l56 = snd_soc_component_get_drvdata(component);
-	int ret = cs35l56_wait_dsp_ready(cs35l56);
-
-	if (ret)
-		return ret;
 
+	cs35l56_wait_dsp_ready(cs35l56);
 	return snd_soc_put_volsw(kcontrol, ucontrol);
 }
 
@@ -876,13 +859,13 @@ static void cs35l56_dsp_work(struct work_struct *work)
 	int ret = 0;
 
 	if (!cs35l56->init_done)
-		goto complete;
+		return;
 
 	cs35l56->dsp.part = devm_kasprintf(cs35l56->dev, GFP_KERNEL, "cs35l56%s-%02x",
 					   cs35l56->secured ? "s" : "", cs35l56->rev);
 
 	if (!cs35l56->dsp.part)
-		goto complete;
+		return;
 
 	pm_runtime_get_sync(cs35l56->dev);
 
@@ -961,9 +944,6 @@ static void cs35l56_dsp_work(struct work_struct *work)
 		sdw_write_no_pm(cs35l56->sdw_peripheral, CS35L56_SDW_GEN_INT_MASK_1,
 				CS35L56_SDW_INT_MASK_CODEC_IRQ);
 	}
-
-complete:
-	complete_all(&cs35l56->dsp_ready_completion);
 }
 
 static int cs35l56_component_probe(struct snd_soc_component *component)
@@ -1002,7 +982,6 @@ static int cs35l56_set_bias_level(struct snd_soc_component *component,
 				  enum snd_soc_bias_level level)
 {
 	struct cs35l56_private *cs35l56 = snd_soc_component_get_drvdata(component);
-	int ret = 0;
 
 	switch (level) {
 	case SND_SOC_BIAS_STANDBY:
@@ -1011,14 +990,14 @@ static int cs35l56_set_bias_level(struct snd_soc_component *component,
 		 * BIAS_OFF to BIAS_STANDBY
 		 */
 		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF)
-			ret = cs35l56_wait_dsp_ready(cs35l56);
+			cs35l56_wait_dsp_ready(cs35l56);
 
 		break;
 	default:
 		break;
 	}
 
-	return ret;
+	return 0;
 }
 
 static const struct snd_soc_component_driver soc_component_dev_cs35l56 = {
@@ -1336,7 +1315,6 @@ int cs35l56_system_resume(struct device *dev)
 		return ret;
 
 	cs35l56->fw_patched = false;
-	init_completion(&cs35l56->dsp_ready_completion);
 	queue_work(cs35l56->dsp_wq, &cs35l56->dsp_work);
 
 	/*
@@ -1358,7 +1336,6 @@ static int cs35l56_dsp_init(struct cs35l56_private *cs35l56)
 		return -ENOMEM;
 
 	INIT_WORK(&cs35l56->dsp_work, cs35l56_dsp_work);
-	init_completion(&cs35l56->dsp_ready_completion);
 
 	dsp = &cs35l56->dsp;
 	dsp->part = "cs35l56";
diff --git a/sound/soc/codecs/cs35l56.h b/sound/soc/codecs/cs35l56.h
index ac2e9237c27d..09762e70ce81 100644
--- a/sound/soc/codecs/cs35l56.h
+++ b/sound/soc/codecs/cs35l56.h
@@ -34,7 +34,6 @@ struct cs35l56_private {
 	struct wm_adsp dsp; /* must be first member */
 	struct work_struct dsp_work;
 	struct workqueue_struct *dsp_wq;
-	struct completion dsp_ready_completion;
 	struct mutex irq_lock;
 	struct snd_soc_component *component;
 	struct device *dev;
-- 
2.30.2

