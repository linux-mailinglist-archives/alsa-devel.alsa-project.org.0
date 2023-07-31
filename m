Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F90A769D7D
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 19:01:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95BEC84A;
	Mon, 31 Jul 2023 19:00:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95BEC84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690822867;
	bh=HvFBGCFP+p8mCT+m3rY5jD+yRPApp9InbENtx358KpQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SBX8JqtAGqhEVt1KNeI/JwZgZ0ac7BG5RIl73xTeBYzTqWXKz4t46QSlGIvu8a+x5
	 fntEhunS2mweJbzB4A+c0lt/d6ReOkWWpempC6GgE/taP5A9k/qdlsAeqq0BAOMxvC
	 NA6xYYPaMMIVE2b3ZzikhmT6jTw3q9xhK/iVZdQQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E815FF805D5; Mon, 31 Jul 2023 18:58:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 75503F80425;
	Mon, 31 Jul 2023 18:58:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21222F805D4; Mon, 31 Jul 2023 18:58:26 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id F0D9CF80149
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 18:57:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0D9CF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=GXj7G97G
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36V5lNJO017071;
	Mon, 31 Jul 2023 11:57:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=DFQy9O4rVl1fkUzjYQguq6VsjkwR+stb5618BZFSP9g=; b=
	GXj7G97GLpBXmDuPdeCnNCloJ7nG4k+fnNYQtwHw8TdnH2/uXLD9hsZHSGB53SWa
	fR20aHMQoV6yrS4l7oJD9HnPlSGGOngmjg8p1rOfmBadxWBLxvFizVqBR4UzHQYF
	qC5CEAYz+0AuMSMwfKmTjnKAxk2aJpUSeog8CFY1NUC97OLnHzA0hgNjQqSz4WjQ
	nvzlcMcEMZHyXiQvEzuup0ypYx8SfBFdy9mQmBYQqWoMdd6sK6Q3IB1LVI90WJdI
	hJjUmLYAM1dtaPYyzgMZw5vd8Oe/m4LQgDmU6IdcL4NmPuCFcoaqoqwZWNVENpm1
	xLh/DA8ZTOWNl5/uLIWXag==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3s5gk1sg45-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Jul 2023 11:57:36 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 31 Jul
 2023 17:57:32 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.30 via Frontend Transport; Mon, 31 Jul 2023 17:57:32 +0100
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.64.107])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 3C28C475;
	Mon, 31 Jul 2023 16:57:32 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <perex@perex.cz>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        Richard
 Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH 7/9] ALSA: hda/cs35l56: Do not download firmware over existing
 RAM firmware
Date: Mon, 31 Jul 2023 17:57:24 +0100
Message-ID: <20230731165726.7940-8-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230731165726.7940-1-rf@opensource.cirrus.com>
References: <20230731165726.7940-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: VQTKml7zteD00oUvbI_K6i472yRGO6xo
X-Proofpoint-ORIG-GUID: VQTKml7zteD00oUvbI_K6i472yRGO6xo
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 4MTVB4ASC5IHNLUDSYRECCTZJVDHNN4I
X-Message-ID-Hash: 4MTVB4ASC5IHNLUDSYRECCTZJVDHNN4I
X-MailFrom: prvs=3576b45159=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4MTVB4ASC5IHNLUDSYRECCTZJVDHNN4I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

A RAM firmware can only be downloaded if the CS35L56 is currently
running from ROM firmware. The driver must not try to overwrite
the RAM if the CS35L56 is already running from that RAM.

Firmware can be downloaded in these two cases:

- The BIOS has already patched the firmware (secured mode).
  In this case the firmware files will only contain tunings that
  are safe to overwrite.

- The CS35L56 is running the built-in ROM firmware.

After a RAM firmware has been downloaded it can only be cleared by
hard resetting CS35L56. Some systems only hard-reset during
power-on and do not give the driver control of hard reset.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/pci/hda/cs35l56_hda.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
index 803fa2da9ea4..8f1665d38c92 100644
--- a/sound/pci/hda/cs35l56_hda.c
+++ b/sound/pci/hda/cs35l56_hda.c
@@ -525,6 +525,7 @@ static int cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
 	const struct firmware *wmfw_firmware = NULL;
 	char *coeff_filename = NULL;
 	char *wmfw_filename = NULL;
+	unsigned int firmware_missing;
 	int ret = 0;
 
 	/* Prepare for a new DSP power-up */
@@ -533,11 +534,28 @@ static int cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
 
 	cs35l56->base.fw_patched = false;
 
-	cs35l56_hda_request_firmware_files(cs35l56, &wmfw_firmware, &wmfw_filename,
-					   &coeff_firmware, &coeff_filename);
+	pm_runtime_get_sync(cs35l56->base.dev);
+
+	ret = regmap_read(cs35l56->base.regmap, CS35L56_PROTECTION_STATUS, &firmware_missing);
+	if (ret) {
+		dev_err(cs35l56->base.dev, "Failed to read PROTECTION_STATUS: %d\n", ret);
+		goto err_pm_put;
+	}
+
+	firmware_missing &= CS35L56_FIRMWARE_MISSING;
+
+	/*
+	 * Firmware can only be downloaded if the CS35L56 is secured or is
+	 * running from the built-in ROM. If it is secured the BIOS will have
+	 * downloaded firmware, and the wmfw/bin files will only contain
+	 * tunings that are safe to download with the firmware running.
+	 */
+	if (cs35l56->base.secured || firmware_missing) {
+		cs35l56_hda_request_firmware_files(cs35l56, &wmfw_firmware, &wmfw_filename,
+						   &coeff_firmware, &coeff_filename);
+	}
 
 	mutex_lock(&cs35l56->base.irq_lock);
-	pm_runtime_get_sync(cs35l56->base.dev);
 
 	/*
 	 * When the device is running in secure mode the firmware files can
@@ -596,11 +614,12 @@ static int cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
 	if (!cs35l56->base.fw_patched)
 		cs_dsp_power_down(&cs35l56->cs_dsp);
 err:
-	pm_runtime_put(cs35l56->base.dev);
 	mutex_unlock(&cs35l56->base.irq_lock);
 
 	cs35l56_hda_release_firmware_files(wmfw_firmware, wmfw_filename,
 					   coeff_firmware, coeff_filename);
+err_pm_put:
+	pm_runtime_put(cs35l56->base.dev);
 
 	return ret;
 }
-- 
2.30.2

