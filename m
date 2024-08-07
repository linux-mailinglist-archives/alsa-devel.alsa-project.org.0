Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A6794B07A
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2024 21:32:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E5B01930;
	Wed,  7 Aug 2024 21:32:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E5B01930
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723059140;
	bh=JSlmQu0sMhUSvnb2vx7Z4vXQuFMmDuKF1NXJ4GjBvLc=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=tqMmU1Upor1aFQXm7j07WBYZmvtvA1DR+Uha6+hDAGp7Ui2ng6D31nsWCUv4GqVks
	 uieao5wyrXbvUyLyrjJA7f3A4xAoDa/mWRIVxeEglk82wBPTu7iRgecI0uIzNLiFT6
	 UR+p5WFGe9kAnyK2X3s0QIIjkHTyMOrqCtEqL2w0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A5EBF8059F; Wed,  7 Aug 2024 21:31:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 10618F805AE;
	Wed,  7 Aug 2024 21:31:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4F8AF8023A; Wed,  7 Aug 2024 21:20:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6C29CF802DB
	for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2024 21:18:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C29CF802DB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=W4KPw2mj
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4772aVhV001596;
	Wed, 7 Aug 2024 09:27:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=p0oTbEs7cI+w0AoN
	8oY3G9EIxazKWWurXI38qc2APK0=; b=W4KPw2mj/rKY27c8FmcSANFBkztmg6oQ
	5hfMx1XKDsoTJv3agqLXbW20tnvomZWHu+u0jF4dT+rhLd6Fk/NIgx6GIR80Um6M
	4LjbuwRx6/95/vBV+5D2KIAMYUZ7d/yoRFZJX3OW8yVAGp5rq29Kfad0v6qzQv9u
	fFuDIWIE8s8xePS3mf4pv1+Kq1mv7IqLgzSMMzIOjahERzXo/KxIY9003RJpEA2C
	xD0cT5HRQp73g93kDjC8VkZ5iKzTEhpNqi01HYd98atTja/61ydWHpd6Ic9fhBYV
	D+zixzV88U18unmEmKJoW89C5GVfupMh4ErCQWVb/2mwev6DTWcoYQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 40shxx4hvk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Aug 2024 09:27:20 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 7 Aug 2024
 15:27:18 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 7 Aug 2024 15:27:18 +0100
Received: from lonswws01.ad.cirrus.com (lonswws01.ad.cirrus.com
 [198.90.188.26])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id D875C820244;
	Wed,  7 Aug 2024 14:27:17 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Simon
 Trimmer" <simont@opensource.cirrus.com>
Subject: [PATCH] ASoC: cs35l56: Use regmap_read_bypassed() to wake the device
Date: Wed, 7 Aug 2024 14:27:15 +0000
Message-ID: <20240807142715.47077-1-simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: -z6U3q9v758xXAD3PAczDtYAJn0qULY_
X-Proofpoint-ORIG-GUID: -z6U3q9v758xXAD3PAczDtYAJn0qULY_
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: VIJCJMU2VSBQIQGIH24ZBTYGOLEGEGQL
X-Message-ID-Hash: VIJCJMU2VSBQIQGIH24ZBTYGOLEGEGQL
X-MailFrom: prvs=5949c4a4be=simont@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VIJCJMU2VSBQIQGIH24ZBTYGOLEGEGQL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now that regmap_read_bypassed() has been added to the kernel it is
preferable to wake the device with a read rather than a write as the
utility function can be called at a time before the device has been
identified.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-shared.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index e7e8d617da94..91b3c1c8575c 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -450,32 +450,23 @@ static const struct reg_sequence cs35l56_hibernate_seq[] = {
 	REG_SEQ0(CS35L56_DSP_VIRTUAL1_MBOX_1, CS35L56_MBOX_CMD_ALLOW_AUTO_HIBERNATE),
 };
 
-static const struct reg_sequence cs35l56_hibernate_wake_seq[] = {
-	REG_SEQ0(CS35L56_DSP_VIRTUAL1_MBOX_1, CS35L56_MBOX_CMD_WAKEUP),
-};
-
 static void cs35l56_issue_wake_event(struct cs35l56_base *cs35l56_base)
 {
+	unsigned int val;
+
 	/*
 	 * Dummy transactions to trigger I2C/SPI auto-wake. Issue two
 	 * transactions to meet the minimum required time from the rising edge
 	 * to the last falling edge of wake.
 	 *
-	 * It uses bypassed write because we must wake the chip before
+	 * It uses bypassed read because we must wake the chip before
 	 * disabling regmap cache-only.
-	 *
-	 * This can NAK on I2C which will terminate the write sequence so the
-	 * single-write sequence is issued twice.
 	 */
-	regmap_multi_reg_write_bypassed(cs35l56_base->regmap,
-					cs35l56_hibernate_wake_seq,
-					ARRAY_SIZE(cs35l56_hibernate_wake_seq));
+	regmap_read_bypassed(cs35l56_base->regmap, CS35L56_IRQ1_STATUS, &val);
 
 	usleep_range(CS35L56_WAKE_HOLD_TIME_US, 2 * CS35L56_WAKE_HOLD_TIME_US);
 
-	regmap_multi_reg_write_bypassed(cs35l56_base->regmap,
-					cs35l56_hibernate_wake_seq,
-					ARRAY_SIZE(cs35l56_hibernate_wake_seq));
+	regmap_read_bypassed(cs35l56_base->regmap, CS35L56_IRQ1_STATUS, &val);
 
 	cs35l56_wait_control_port_ready();
 }
-- 
2.43.0

