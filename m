Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EDF7BB615
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Oct 2023 13:13:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56E8BDE5;
	Fri,  6 Oct 2023 13:12:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56E8BDE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696590800;
	bh=uQXQSepVaQWeFBI6iPnh1Rk1V4cPYfKm5n09moTc3ME=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=M5FyjcrN+cr+aFJWBZKdWlZ+DkLRV5+lreZplI4HTW4/kPTWzLgxVVX0R9VuHkdKS
	 Lx7hAlAvxsZHHBh8GBeTwQIVs5ut1qdUKdVfLkAAy8IEYkSimQ3eBnPa94Bzf8mrS2
	 TqJJ3PKBXeKCO4nzDmxrXIgRBNkYFW7jgO280N28=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 381C8F805AE; Fri,  6 Oct 2023 13:11:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AF40DF805A0;
	Fri,  6 Oct 2023 13:11:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF3E8F805A0; Fri,  6 Oct 2023 13:11:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1BD3AF80551
	for <alsa-devel@alsa-project.org>; Fri,  6 Oct 2023 13:10:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BD3AF80551
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=QPOi9KeQ
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3965fxce025983;
	Fri, 6 Oct 2023 06:10:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=RlyXKyITjmeNbb6voK2kiPtwUMgBnTpkOA+RxMPoLIg=; b=
	QPOi9KeQqQpZRQU+r2xbZi+XuvNxhBp7qpe46+J1LFQhcf0/TUgjngZ5WnC1dnW2
	gYhQ9YcSo4/Lj6Y2CNNPiLvyLgp9tksCwUT7n2UHjSwcCk7B8jvZQvOrN+jAuAmB
	mkDOMtxjmgHBp1/gPqjLCDucE+6LtoPA4bRyVzLcU1map4KgGMGOQe6x5UZ+XUq9
	b5hk5qlUyPjs1Xrp5MRUW8y8yMEZCiPLlGJLrCSdMm30r0ftzWsDAO/Si20qGmW1
	+JbzZHVcbOTPWMfXfIjlqOud9ngfcf2ITJdHQgORXlHAR60lE26Rc8JiLgtpPzFn
	JDNBkwUumvXylA4ki2IZLQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3th2dtbmxb-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Oct 2023 06:10:45 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Fri, 6 Oct
 2023 12:10:42 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Fri, 6 Oct 2023 12:10:42 +0100
Received: from work-debian.ad.cirrus.com (unknown [198.61.64.45])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A1CEA11AA;
	Fri,  6 Oct 2023 11:10:42 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Simon Trimmer
	<simont@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH 2/4] ASoC: cs35l56: Wake transactions need to be issued twice
Date: Fri, 6 Oct 2023 12:10:37 +0100
Message-ID: <20231006111039.101914-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231006111039.101914-1-rf@opensource.cirrus.com>
References: <20231006111039.101914-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: vfrFDBZ8iX4B25Cg-1VZgT8UXHnE1qt4
X-Proofpoint-GUID: vfrFDBZ8iX4B25Cg-1VZgT8UXHnE1qt4
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: LO3R3OEN2ENVIJIMOYKJKFXI44BHJAZ6
X-Message-ID-Hash: LO3R3OEN2ENVIJIMOYKJKFXI44BHJAZ6
X-MailFrom: prvs=5643372036=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LO3R3OEN2ENVIJIMOYKJKFXI44BHJAZ6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Simon Trimmer <simont@opensource.cirrus.com>

As the dummy wake is a toggling signal (either I2C or SPI activity) it
is not guaranteed to meet the minimum asserted hold time for a wake
signal. In this case the wake must guarantee rising edges separated by
at least the minimum hold time.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 include/sound/cs35l56.h           |  1 +
 sound/soc/codecs/cs35l56-shared.c | 51 +++++++++++++++++++++----------
 2 files changed, 36 insertions(+), 16 deletions(-)

diff --git a/include/sound/cs35l56.h b/include/sound/cs35l56.h
index 762b96b29211..8c18e8b6d27d 100644
--- a/include/sound/cs35l56.h
+++ b/include/sound/cs35l56.h
@@ -243,6 +243,7 @@
 #define CS35L56_HALO_STATE_POLL_US			1000
 #define CS35L56_HALO_STATE_TIMEOUT_US			50000
 #define CS35L56_RESET_PULSE_MIN_US			1100
+#define CS35L56_WAKE_HOLD_TIME_US			1000
 
 #define CS35L56_SDW1_PLAYBACK_PORT			1
 #define CS35L56_SDW1_CAPTURE_PORT			3
diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index 68dc93b82789..953ba066bab1 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -446,6 +446,32 @@ static const struct reg_sequence cs35l56_hibernate_wake_seq[] = {
 	REG_SEQ0(CS35L56_DSP_VIRTUAL1_MBOX_1, CS35L56_MBOX_CMD_WAKEUP),
 };
 
+static void cs35l56_issue_wake_event(struct cs35l56_base *cs35l56_base)
+{
+	/*
+	 * Dummy transactions to trigger I2C/SPI auto-wake. Issue two
+	 * transactions to meet the minimum required time from the rising edge
+	 * to the last falling edge of wake.
+	 *
+	 * It uses bypassed write because we must wake the chip before
+	 * disabling regmap cache-only.
+	 *
+	 * This can NAK on I2C which will terminate the write sequence so the
+	 * single-write sequence is issued twice.
+	 */
+	regmap_multi_reg_write_bypassed(cs35l56_base->regmap,
+					cs35l56_hibernate_wake_seq,
+					ARRAY_SIZE(cs35l56_hibernate_wake_seq));
+
+	usleep_range(CS35L56_WAKE_HOLD_TIME_US, 2 * CS35L56_WAKE_HOLD_TIME_US);
+
+	regmap_multi_reg_write_bypassed(cs35l56_base->regmap,
+					cs35l56_hibernate_wake_seq,
+					ARRAY_SIZE(cs35l56_hibernate_wake_seq));
+
+	cs35l56_wait_control_port_ready();
+}
+
 int cs35l56_runtime_suspend_common(struct cs35l56_base *cs35l56_base)
 {
 	unsigned int val;
@@ -500,17 +526,9 @@ int cs35l56_runtime_resume_common(struct cs35l56_base *cs35l56_base, bool is_sou
 	if (!cs35l56_base->can_hibernate)
 		goto out_sync;
 
-	if (!is_soundwire) {
-		/*
-		 * Dummy transaction to trigger I2C/SPI auto-wake. This will NAK on I2C.
-		 * Must be done before releasing cache-only.
-		 */
-		regmap_multi_reg_write_bypassed(cs35l56_base->regmap,
-						cs35l56_hibernate_wake_seq,
-						ARRAY_SIZE(cs35l56_hibernate_wake_seq));
-
-		cs35l56_wait_control_port_ready();
-	}
+	/* Must be done before releasing cache-only */
+	if (!is_soundwire)
+		cs35l56_issue_wake_event(cs35l56_base);
 
 out_sync:
 	regcache_cache_only(cs35l56_base->regmap, false);
@@ -578,13 +596,14 @@ int cs35l56_hw_init(struct cs35l56_base *cs35l56_base)
 	unsigned int devid, revid, otpid, secured;
 
 	/*
-	 * If the system is not using a reset_gpio then issue a
-	 * dummy read to force a wakeup.
+	 * When the system is not using a reset_gpio ensure the device is
+	 * awake, otherwise the device has just been released from reset and
+	 * the driver must wait for the control port to become usable.
 	 */
 	if (!cs35l56_base->reset_gpio)
-		regmap_read(cs35l56_base->regmap, CS35L56_DSP_VIRTUAL1_MBOX_1, &devid);
-
-	cs35l56_wait_control_port_ready();
+		cs35l56_issue_wake_event(cs35l56_base);
+	else
+		cs35l56_wait_control_port_ready();
 
 	/*
 	 * The HALO_STATE register is in different locations on Ax and B0
-- 
2.30.2

