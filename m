Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A553971A337
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jun 2023 17:51:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 323F5844;
	Thu,  1 Jun 2023 17:50:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 323F5844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685634698;
	bh=oZJRfYwqs8dJv7xI4UyT8Q1KVj8TeENHxSH8IclzyYc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qPxPIqBdwqDPfhd87hmUWsyNtmUR29uwtpr1wQ82mxxol71mnfJJxVcIFUr/esVYr
	 B6UwOXatMg3XkokjaANeeYLs5TwUAU4yRC99Jpo5Fp28WDT6OhLTQr/jlIVKpwNBzF
	 mcq9pT3QZN7GSR+vgoXnW64D4V5cvibfQyjKxbzE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 346C6F805F0; Thu,  1 Jun 2023 17:48:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C425F805EE;
	Thu,  1 Jun 2023 17:48:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73920F8057B; Thu,  1 Jun 2023 17:47:52 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id CD658F80527
	for <alsa-devel@alsa-project.org>; Thu,  1 Jun 2023 17:47:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD658F80527
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=YKyY5SMW
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 351CPISa014930;
	Thu, 1 Jun 2023 10:47:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=wDdvlmDx29OCEneIJclNYyri5To40eVp0Qx8f+kWVlo=;
 b=YKyY5SMWFZsTf5v9oml+Jg+yZmQASKVOYfiQ3nc2nM8+Li3vf3rawBu2E0V8tJdRGYUd
 1ESCkkcr3tLOwf5NuuSXrMA3Z+IQar8HRugBYTbfhtKNyZvwLWkF2hdYTlYhRl8gkbp7
 hiBDYNBnZWajLj6PRHVA/1BrdZusD6c234tX+lfAEye5z7VsqgzGnt3wn0mvDTLfJkse
 grI7mDFfxdTPamU8qIULZwdboshO14dXSOrUS+H6v1F9Q7/ixVVb4NcdVra+X98lbJ4q
 kdPH/Wei/HRO9Kgu8ki7YMLTRgRsT2TSkzhAj/Id8iWBgPzYGkQTu3vup5VRh4rqG8uU 4Q==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3quf90x42d-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Jun 2023 10:47:38 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Thu, 1 Jun
 2023 16:47:31 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Thu, 1 Jun 2023 16:47:31 +0100
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id CB317475;
	Thu,  1 Jun 2023 15:47:31 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <tiwai@suse.com>, <perex@perex.cz>, <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Simon Trimmer
	<simont@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH v4 09/12] ASoC: cs35l56: Make a common function to shutdown
 the DSP
Date: Thu, 1 Jun 2023 16:47:28 +0100
Message-ID: <20230601154731.3210572-10-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230601154731.3210572-1-rf@opensource.cirrus.com>
References: <20230601154731.3210572-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: guvSZNY5oGpfeChBSyxY80MFq6psn8UQ
X-Proofpoint-ORIG-GUID: guvSZNY5oGpfeChBSyxY80MFq6psn8UQ
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: FPHRG4GSD7EPMLQHJARHX6IKKF5NDYNG
X-Message-ID-Hash: FPHRG4GSD7EPMLQHJARHX6IKKF5NDYNG
X-MailFrom: prvs=151698faa0=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FPHRG4GSD7EPMLQHJARHX6IKKF5NDYNG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Simon Trimmer <simont@opensource.cirrus.com>

Move issuing of a CS35L56_MBOX_CMD_SHUTDOWN command and then waiting for
the DSP to reach CS35L56_HALO_STATE_SHUTDOWN in the register appropriate
for the hardware revision into a common function.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Acked-by: Mark Brown <broonie@kernel.org>
---
 include/sound/cs35l56.h           |  1 +
 sound/soc/codecs/cs35l56-shared.c | 26 ++++++++++++++++++++++++++
 sound/soc/codecs/cs35l56.c        | 17 +----------------
 3 files changed, 28 insertions(+), 16 deletions(-)

diff --git a/include/sound/cs35l56.h b/include/sound/cs35l56.h
index ae9e8f55962a..5b32aa7468cb 100644
--- a/include/sound/cs35l56.h
+++ b/include/sound/cs35l56.h
@@ -274,6 +274,7 @@ extern const unsigned int cs35l56_tx_input_values[CS35L56_NUM_INPUT_SRC];
 
 void cs35l56_reread_firmware_registers(struct cs35l56_base *cs35l56_base);
 int cs35l56_mbox_send(struct cs35l56_base *cs35l56_base, unsigned int command);
+int cs35l56_firmware_shutdown(struct cs35l56_base *cs35l56_base);
 int cs35l56_wait_for_firmware_boot(struct cs35l56_base *cs35l56_base);
 void cs35l56_wait_control_port_ready(void);
 void cs35l56_wait_min_reset_pulse(void);
diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index 7e02d023338c..95ef71c7b8f1 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -218,6 +218,32 @@ int cs35l56_mbox_send(struct cs35l56_base *cs35l56_base, unsigned int command)
 }
 EXPORT_SYMBOL_NS_GPL(cs35l56_mbox_send, SND_SOC_CS35L56_SHARED);
 
+int cs35l56_firmware_shutdown(struct cs35l56_base *cs35l56_base)
+{
+	int ret;
+	unsigned int reg;
+	unsigned int val;
+
+	ret = cs35l56_mbox_send(cs35l56_base, CS35L56_MBOX_CMD_SHUTDOWN);
+	if (ret)
+		return ret;
+
+	if (cs35l56_base->rev < CS35L56_REVID_B0)
+		reg = CS35L56_DSP1_PM_CUR_STATE_A1;
+	else
+		reg = CS35L56_DSP1_PM_CUR_STATE;
+
+	ret = regmap_read_poll_timeout(cs35l56_base->regmap,  reg,
+				       val, (val == CS35L56_HALO_STATE_SHUTDOWN),
+				       CS35L56_HALO_STATE_POLL_US,
+				       CS35L56_HALO_STATE_TIMEOUT_US);
+	if (ret < 0)
+		dev_err(cs35l56_base->dev, "Failed to poll PM_CUR_STATE to 1 is %d (ret %d)\n",
+			val, ret);
+	return ret;
+}
+EXPORT_SYMBOL_NS_GPL(cs35l56_firmware_shutdown, SND_SOC_CS35L56_SHARED);
+
 int cs35l56_wait_for_firmware_boot(struct cs35l56_base *cs35l56_base)
 {
 	unsigned int reg;
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 65c8ec14f635..67173160923d 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -673,8 +673,6 @@ static void cs35l56_secure_patch(struct cs35l56_private *cs35l56)
 
 static void cs35l56_patch(struct cs35l56_private *cs35l56)
 {
-	unsigned int reg;
-	unsigned int val;
 	int ret;
 
 	/*
@@ -691,23 +689,10 @@ static void cs35l56_patch(struct cs35l56_private *cs35l56)
 		flush_work(&cs35l56->sdw_irq_work);
 	}
 
-	ret = cs35l56_mbox_send(&cs35l56->base, CS35L56_MBOX_CMD_SHUTDOWN);
+	ret = cs35l56_firmware_shutdown(&cs35l56->base);
 	if (ret)
 		goto err;
 
-	if (cs35l56->base.rev < CS35L56_REVID_B0)
-		reg = CS35L56_DSP1_PM_CUR_STATE_A1;
-	else
-		reg = CS35L56_DSP1_PM_CUR_STATE;
-
-	ret = regmap_read_poll_timeout(cs35l56->base.regmap, reg,
-				       val, (val == CS35L56_HALO_STATE_SHUTDOWN),
-				       CS35L56_HALO_STATE_POLL_US,
-				       CS35L56_HALO_STATE_TIMEOUT_US);
-	if (ret < 0)
-		dev_err(cs35l56->base.dev, "Failed to poll PM_CUR_STATE to 1 is %d (ret %d)\n",
-			val, ret);
-
 	/* Use wm_adsp to load and apply the firmware patch and coefficient files */
 	ret = wm_adsp_power_up(&cs35l56->dsp);
 	if (ret) {
-- 
2.30.2

