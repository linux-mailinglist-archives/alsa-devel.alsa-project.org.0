Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 429387110FB
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 18:29:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7071284A;
	Thu, 25 May 2023 18:28:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7071284A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685032156;
	bh=vuaho6mz05+ogUaWAKEchTWZKYGPfVJvOXzSiU4qlsk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IiHl7XqfNJvAH3mwmIJUd0eyrmflsvhd2KdBNIvlDMDFcAF5dVV7jSPq82+Bsjk+u
	 XQHqIWC03J5h2pXqV1WvQmS+ORX0GMIb+CCnRnBc3exoa8imZaTKmUfskHUh9kaSlK
	 aVfCqhuXECdPtZ661Y98nv/VmyWn8uUAXVhH6kCA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73832F8055A; Thu, 25 May 2023 18:27:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D4964F805B2;
	Thu, 25 May 2023 18:27:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 216D6F805A8; Thu, 25 May 2023 18:26:57 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 9F9F9F8026A
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 18:26:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F9F9F8026A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=nWmz/1Al
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34PEDsKf007206;
	Thu, 25 May 2023 11:26:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=gjvF9y3c82RzHTgs5t2qAQVubD+R1HPBW6x2ID+7JwQ=;
 b=nWmz/1AlP/l6OEXkNA9zrHY9wulgH0lkBmtUkMqFU+KF6u3u6cA/uFGyUyDiA315DTFA
 309BZdEgkLDdP6C/YeN7UHhMC1e2RsHehVg5aGLHxEbgawwViNQfBKTi5uGYbAEKE3E8
 6hif9UERpppEIghkvzl4+7OZ8L6dEjvyqONQdhG3eGK1rgUFRL4SMnABWHyyNMWYLVxB
 r9fE51UQ4OBpiDsRFDw4cLLdvDMw1Q18LAYrg5EHLLz+OsQUNWv69HLyVpDRomkD8uUQ
 Y3LXCUb5x0QqrKuVQQKfW3WiM1Q0K8ZBu3tQ4xYrNO432UVVy/9rzlB4ilXHumkh2gOK Jw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3qsde8j0yh-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 May 2023 11:26:26 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Thu, 25 May
 2023 11:26:23 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 25 May 2023 11:26:23 -0500
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.65.166])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id EE3EF45;
	Thu, 25 May 2023 16:26:22 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <tiwai@suse.com>, <broonie@kernel.org>, <perex@perex.cz>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Simon Trimmer
	<simont@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH v2 02/12] ASoC: cs35l56: Make cs35l56_system_reset() code more
 generic
Date: Thu, 25 May 2023 17:26:08 +0100
Message-ID: <20230525162618.20146-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230525162618.20146-1-rf@opensource.cirrus.com>
References: <20230525162618.20146-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: nXz9l52WywA_HN2ZERFCO4tI_cNZtKt5
X-Proofpoint-GUID: nXz9l52WywA_HN2ZERFCO4tI_cNZtKt5
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: GZ3EUX6ETAWQXSOYV4XEX3GRC4SMVLNU
X-Message-ID-Hash: GZ3EUX6ETAWQXSOYV4XEX3GRC4SMVLNU
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Simon Trimmer <simont@opensource.cirrus.com>

The function can be more easily reused in HDA if the tracking of whether
a soft reset is being performed and whether the device is connected to a
SoundWire bus is moved out of the function.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Acked-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs35l56.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 4d41c4b040a4..76cc9110d4e0 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -805,10 +805,8 @@ static const struct reg_sequence cs35l56_system_reset_seq[] = {
 	REG_SEQ0(CS35L56_DSP_VIRTUAL1_MBOX_1, CS35L56_MBOX_CMD_SYSTEM_RESET),
 };
 
-static void cs35l56_system_reset(struct cs35l56_private *cs35l56)
+static void cs35l56_system_reset(struct cs35l56_private *cs35l56, bool is_soundwire)
 {
-	cs35l56->soft_resetting = true;
-
 	/*
 	 * Must enter cache-only first so there can't be any more register
 	 * accesses other than the controlled system reset sequence below.
@@ -819,7 +817,7 @@ static void cs35l56_system_reset(struct cs35l56_private *cs35l56)
 					ARRAY_SIZE(cs35l56_system_reset_seq));
 
 	/* On SoundWire the registers won't be accessible until it re-enumerates. */
-	if (cs35l56->sdw_peripheral)
+	if (is_soundwire)
 		return;
 
 	usleep_range(CS35L56_CONTROL_PORT_READY_US, CS35L56_CONTROL_PORT_READY_US + 400);
@@ -886,7 +884,8 @@ static void cs35l56_patch(struct cs35l56_private *cs35l56)
 
 	init_completion(&cs35l56->init_completion);
 
-	cs35l56_system_reset(cs35l56);
+	cs35l56->soft_resetting = true;
+	cs35l56_system_reset(cs35l56, !!cs35l56->sdw_peripheral);
 
 	if (cs35l56->sdw_peripheral) {
 		/*
@@ -1550,7 +1549,8 @@ int cs35l56_init(struct cs35l56_private *cs35l56)
 
 	if (!cs35l56->base.reset_gpio) {
 		dev_dbg(cs35l56->base.dev, "No reset gpio: using soft reset\n");
-		cs35l56_system_reset(cs35l56);
+		cs35l56->soft_resetting = true;
+		cs35l56_system_reset(cs35l56, !!cs35l56->sdw_peripheral);
 		if (cs35l56->sdw_peripheral) {
 			/* Keep alive while we wait for re-enumeration */
 			pm_runtime_get_noresume(cs35l56->base.dev);
-- 
2.30.2

