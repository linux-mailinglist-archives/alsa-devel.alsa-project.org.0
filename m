Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB0478C94E
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 18:05:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2E633E8;
	Tue, 29 Aug 2023 18:04:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2E633E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693325138;
	bh=GMcVy19Er93QMtLj+g2Qxjvo0k1B2rhlY+KdJl+TC0c=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=p2GDkbUb0O6wJOKJo1niSe3PxQNEhW2Tumv5fR/vUceWXCKV2B2QClBss4TFo7sbX
	 Wnnd7jUujd12H3DKRBe1xzWLqF2+Ng17PXXM12cv+40c86+L2mFYmyAf8W6pDhVQSD
	 Nh/lH928BTxbLOiml6im6ZmdVtFdI7ajjBjH0u7A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF2ABF8023B; Tue, 29 Aug 2023 18:04:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 50D56F80155;
	Tue, 29 Aug 2023 18:04:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57BE5F80158; Tue, 29 Aug 2023 18:04:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 95863F800D1
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 18:04:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95863F800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=ogn1TMId
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37T5NIS9018221;
	Tue, 29 Aug 2023 11:04:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=I
	ossbza8GwL87hC4l6+2yc0jPbBH11QSTUNCI7BFD/M=; b=ogn1TMIdJhnDHbvi3
	QuyMgWA7yFCHLwSgBYZStYuDnNwC7aRek8bLNQ2cJRM5xNDb4aQHIjJZiTNGz/I5
	jV6/mZ3cs4nK1HKEFdws2QjnwUD2fFQZPEVQwHrZlD1/478lu+1YhAGZseINvsZk
	SOUUq8tGL7Gk+ppbUc3s9+8r9qP2+jRZ4sAKG/R0mF9VtkXUbzdgBPDmPoDg6waI
	tuK+kHiE26c9/l2C7dNgGzCzMgj6sCNaC67O4LFX2HyQYhZKkySqQQuvyST1KFrT
	f9ov9cOBvoohKv0y5So1hKpnb3M3+M7yUsSVxa/TPK4BLrD448iTX+qKapMET95g
	4nBEQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sqesybsuj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Aug 2023 11:04:35 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Tue, 29 Aug
 2023 17:04:33 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Tue, 29 Aug 2023 17:04:33 +0100
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.75])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1DCD711D4;
	Tue, 29 Aug 2023 16:04:33 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>,
        Simon Trimmer <simont@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH] ASoC: cs35l56: Waiting for firmware to boot must be tolerant
 of I/O errors
Date: Tue, 29 Aug 2023 17:04:33 +0100
Message-ID: <20230829160433.2647889-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: im8d37YlNdLDuFNT9NP-dchYbQph1y00
X-Proofpoint-GUID: im8d37YlNdLDuFNT9NP-dchYbQph1y00
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 34EQSNR7C6ERGKH5FYZQ6PHK2NLT6P4X
X-Message-ID-Hash: 34EQSNR7C6ERGKH5FYZQ6PHK2NLT6P4X
X-MailFrom: prvs=4605cb1c1c=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/34EQSNR7C6ERGKH5FYZQ6PHK2NLT6P4X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Simon Trimmer <simont@opensource.cirrus.com>

Ignore failure to read from the cs35l56 when polling as the device will
NAK i2c accesses until it has booted and this would terminate the poll
of regmap_read_poll_timeout().

Fixes: 8a731fd37f8b ("ASoC: cs35l56: Move utility functions to shared file")
Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-shared.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index ae373f335ea8..98b1e63360ae 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -243,26 +243,27 @@ int cs35l56_wait_for_firmware_boot(struct cs35l56_base *cs35l56_base)
 {
 	unsigned int reg;
 	unsigned int val;
-	int ret;
+	int read_ret, poll_ret;
 
 	if (cs35l56_base->rev < CS35L56_REVID_B0)
 		reg = CS35L56_DSP1_HALO_STATE_A1;
 	else
 		reg = CS35L56_DSP1_HALO_STATE;
 
-	ret = regmap_read_poll_timeout(cs35l56_base->regmap, reg,
-				       val,
-				       (val < 0xFFFF) && (val >= CS35L56_HALO_STATE_BOOT_DONE),
-				       CS35L56_HALO_STATE_POLL_US,
-				       CS35L56_HALO_STATE_TIMEOUT_US);
+	/*
+	 * This can't be a regmap_read_poll_timeout() because cs35l56 will NAK
+	 * I2C until it has booted which would terminate the poll
+	 */
+	poll_ret = read_poll_timeout(regmap_read, read_ret,
+				     (val < 0xFFFF) && (val >= CS35L56_HALO_STATE_BOOT_DONE),
+				     CS35L56_HALO_STATE_POLL_US,
+				     CS35L56_HALO_STATE_TIMEOUT_US,
+				     false,
+				     cs35l56_base->regmap, reg, &val);
 
-	if ((ret < 0) && (ret != -ETIMEDOUT)) {
-		dev_err(cs35l56_base->dev, "Failed to read HALO_STATE: %d\n", ret);
-		return ret;
-	}
-
-	if ((ret == -ETIMEDOUT) || (val != CS35L56_HALO_STATE_BOOT_DONE)) {
-		dev_err(cs35l56_base->dev, "Firmware boot fail: HALO_STATE=%#x\n", val);
+	if (poll_ret) {
+		dev_err(cs35l56_base->dev, "Firmware boot timed out(%d): HALO_STATE=%#x\n",
+			read_ret, val);
 		return -EIO;
 	}
 
-- 
2.30.2

