Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E77ED710F2C
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 17:10:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D2CF208;
	Thu, 25 May 2023 17:09:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D2CF208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685027400;
	bh=rf8+TH9mOV/CknRRHQF9/Dy+yHx75uIq6s7cNdnrJU0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vl0TQ7FU+LGU+IdSo0j62j3beI4W9arACW6W6ehwzPa37JVsoi+FT103Jn33VlXIW
	 cmnoESwkuCTVZG4sdYK38/OGd288bbPKyv98g/TjKva907o47v2HFgfotB+mjsv/2C
	 r7+Gn9ktFW7ZFzGsr8CG1WWT1Zk4wyDYq9UWKhHs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E48D0F805BB; Thu, 25 May 2023 17:07:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 36AFEF805BA;
	Thu, 25 May 2023 17:07:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2DE7F80542; Thu, 25 May 2023 17:07:37 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 00CB2F8024E
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 17:07:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00CB2F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=G2d/4qW+
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34PEE1BF025344;
	Thu, 25 May 2023 10:07:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=4066OmlgR6CGnPEQXICe/2yZT+5D98Kq/PddSEJSVfo=;
 b=G2d/4qW+ByLMuHHZNI8L/gkDpaxfYeQ+89k4AgZwW4pQVX/fUWS6rB6J2wOtPdqb3JY5
 o73qCchU4E/rDUYuCyJ8lj9y3Um3wthKPFZvuzgEvbdtHymipwl3T6k6eQ/aPNYJVlMS
 pS3F0H+cTvi7s0Ld22CVzMEoC67ZdYHll68CAa5NLbNMwyqZBLxcllR78DWMasWrRfGC
 zITGAEPAOKOCaIRQBvQmbmZ5A2VF5aKm5eACmZDmp4FPfYgHEluGbOw+LKuRabpVeqb3
 RPgi3yKJ6ZImYJ9G4fzPcRGlzCJOmueJIbiCHVHeuDqQRdrh74EkmjLEtgKqhqoGJ6/t Cw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3qptmm70m7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 May 2023 10:07:04 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Thu, 25 May
 2023 10:07:02 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Thu, 25 May 2023 10:07:02 -0500
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.65.166])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4E94145;
	Thu, 25 May 2023 15:07:02 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <tiwai@suse.com>, <broonie@kernel.org>, <perex@perex.cz>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Simon Trimmer
	<simont@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH 03/13] ASoC: cs35l56: Convert utility functions to use common
 data structure
Date: Thu, 25 May 2023 16:06:49 +0100
Message-ID: <20230525150659.25409-4-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230525150659.25409-1-rf@opensource.cirrus.com>
References: <20230525150659.25409-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: hGPgXKmn1hdbPnXJ-46SISnOx_i7IXTq
X-Proofpoint-GUID: hGPgXKmn1hdbPnXJ-46SISnOx_i7IXTq
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 7GTOUDQKULW6OQJTQI672JP6BMTSY47O
X-Message-ID-Hash: 7GTOUDQKULW6OQJTQI672JP6BMTSY47O
X-MailFrom: prvs=050971c6a2=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7GTOUDQKULW6OQJTQI672JP6BMTSY47O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Simon Trimmer <simont@opensource.cirrus.com>

Use the new cs35l56_base struct for utility functions.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 76cc9110d4e0..48e856583477 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -805,14 +805,14 @@ static const struct reg_sequence cs35l56_system_reset_seq[] = {
 	REG_SEQ0(CS35L56_DSP_VIRTUAL1_MBOX_1, CS35L56_MBOX_CMD_SYSTEM_RESET),
 };
 
-static void cs35l56_system_reset(struct cs35l56_private *cs35l56, bool is_soundwire)
+static void cs35l56_system_reset(struct cs35l56_base *cs35l56_base, bool is_soundwire)
 {
 	/*
 	 * Must enter cache-only first so there can't be any more register
 	 * accesses other than the controlled system reset sequence below.
 	 */
-	regcache_cache_only(cs35l56->base.regmap, true);
-	regmap_multi_reg_write_bypassed(cs35l56->base.regmap,
+	regcache_cache_only(cs35l56_base->regmap, true);
+	regmap_multi_reg_write_bypassed(cs35l56_base->regmap,
 					cs35l56_system_reset_seq,
 					ARRAY_SIZE(cs35l56_system_reset_seq));
 
@@ -821,7 +821,7 @@ static void cs35l56_system_reset(struct cs35l56_private *cs35l56, bool is_soundw
 		return;
 
 	usleep_range(CS35L56_CONTROL_PORT_READY_US, CS35L56_CONTROL_PORT_READY_US + 400);
-	regcache_cache_only(cs35l56->base.regmap, false);
+	regcache_cache_only(cs35l56_base->regmap, false);
 }
 
 static void cs35l56_secure_patch(struct cs35l56_private *cs35l56)
@@ -885,7 +885,7 @@ static void cs35l56_patch(struct cs35l56_private *cs35l56)
 	init_completion(&cs35l56->init_completion);
 
 	cs35l56->soft_resetting = true;
-	cs35l56_system_reset(cs35l56, !!cs35l56->sdw_peripheral);
+	cs35l56_system_reset(&cs35l56->base, !!cs35l56->sdw_peripheral);
 
 	if (cs35l56->sdw_peripheral) {
 		/*
@@ -1140,20 +1140,20 @@ int cs35l56_runtime_resume_common(struct cs35l56_private *cs35l56)
 }
 EXPORT_SYMBOL_NS_GPL(cs35l56_runtime_resume_common, SND_SOC_CS35L56_CORE);
 
-static int cs35l56_is_fw_reload_needed(struct cs35l56_private *cs35l56)
+static int cs35l56_is_fw_reload_needed(struct cs35l56_base *cs35l56_base)
 {
 	unsigned int val;
 	int ret;
 
 	/* Nothing to re-patch if we haven't done any patching yet. */
-	if (!cs35l56->base.fw_patched)
+	if (!cs35l56_base->fw_patched)
 		return false;
 
 	/*
 	 * If we have control of RESET we will have asserted it so the firmware
 	 * will need re-patching.
 	 */
-	if (cs35l56->base.reset_gpio)
+	if (cs35l56_base->reset_gpio)
 		return true;
 
 	/*
@@ -1161,22 +1161,22 @@ static int cs35l56_is_fw_reload_needed(struct cs35l56_private *cs35l56)
 	 * can't be used here to test for memory retention.
 	 * Assume that tuning must be re-loaded.
 	 */
-	if (cs35l56->base.secured)
+	if (cs35l56_base->secured)
 		return true;
 
-	ret = pm_runtime_resume_and_get(cs35l56->base.dev);
+	ret = pm_runtime_resume_and_get(cs35l56_base->dev);
 	if (ret) {
-		dev_err(cs35l56->base.dev, "Failed to runtime_get: %d\n", ret);
+		dev_err(cs35l56_base->dev, "Failed to runtime_get: %d\n", ret);
 		return ret;
 	}
 
-	ret = regmap_read(cs35l56->base.regmap, CS35L56_PROTECTION_STATUS, &val);
+	ret = regmap_read(cs35l56_base->regmap, CS35L56_PROTECTION_STATUS, &val);
 	if (ret)
-		dev_err(cs35l56->base.dev, "Failed to read PROTECTION_STATUS: %d\n", ret);
+		dev_err(cs35l56_base->dev, "Failed to read PROTECTION_STATUS: %d\n", ret);
 	else
 		ret = !!(val & CS35L56_FIRMWARE_MISSING);
 
-	pm_runtime_put_autosuspend(cs35l56->base.dev);
+	pm_runtime_put_autosuspend(cs35l56_base->dev);
 
 	return ret;
 }
@@ -1305,7 +1305,7 @@ int cs35l56_system_resume(struct device *dev)
 	if (!cs35l56->component)
 		return 0;
 
-	ret = cs35l56_is_fw_reload_needed(cs35l56);
+	ret = cs35l56_is_fw_reload_needed(&cs35l56->base);
 	dev_dbg(cs35l56->base.dev, "fw_reload_needed: %d\n", ret);
 	if (ret < 1)
 		return ret;
@@ -1550,7 +1550,7 @@ int cs35l56_init(struct cs35l56_private *cs35l56)
 	if (!cs35l56->base.reset_gpio) {
 		dev_dbg(cs35l56->base.dev, "No reset gpio: using soft reset\n");
 		cs35l56->soft_resetting = true;
-		cs35l56_system_reset(cs35l56, !!cs35l56->sdw_peripheral);
+		cs35l56_system_reset(&cs35l56->base, !!cs35l56->sdw_peripheral);
 		if (cs35l56->sdw_peripheral) {
 			/* Keep alive while we wait for re-enumeration */
 			pm_runtime_get_noresume(cs35l56->base.dev);
-- 
2.30.2

