Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80960840B74
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jan 2024 17:30:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE27E85D;
	Mon, 29 Jan 2024 17:30:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE27E85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706545823;
	bh=Swu1L1Cn783DMdkZFh+9JpM4v2AC76QqJymHwYw/bN0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZFRACuU8x6VvjD8PivYqGnUH5rJgTzL6cYLXojggWJlVfGsDrIK/YU0OnTtC2JjmB
	 VBkobKQYUS/HyIzK2PzMUFut233gNmsWe9ZY484QNJOqi4x8lI8C7mypUeTcjdBOj9
	 TxPU6a13HHGanpTJ+LYmxsnZa1SvJjwSg4nUrhLI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57E40F8057B; Mon, 29 Jan 2024 17:28:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 09B24F806B0;
	Mon, 29 Jan 2024 17:28:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88A1CF805C6; Mon, 29 Jan 2024 17:28:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1061CF80580
	for <alsa-devel@alsa-project.org>; Mon, 29 Jan 2024 17:27:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1061CF80580
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=T80kB7TM
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40T5fM0F006968;
	Mon, 29 Jan 2024 10:27:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=aC6ZyauHCUjrBt24NljiwgVZd+pvmCzsqS/E5+3JjT4=; b=
	T80kB7TMsJFHkirn/tbi6oAOIe+EVvlKcS+uoRIGLVesRHysSh3uFfmzhd7nmHry
	VgOl2fb/DnEL/KjsfSv1kcsFpXAcnLTVSDHQVMV2u4hZ9uesRRsScUHuQoJ9dhjm
	2phU2b7aPCWtABH+9eteBmv6cdTWl4aWzV7XGtePXIWVKc/4SxnN5nW2EJjveN9y
	V9/ELFX8BTu8MlXVYxygC0iHYX4VzXO16+u8ObZLZmkAzMCZ14gb4IvOQNnwjowT
	veYHHAm5hIiQ1TxH+zrhNjV8z6GyrdBj6kasLgZbVmh6/lKHKyWmWM6e4lLr9gkU
	oSYqCjkIzlExbRgaZ8RpIw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3vvy4nta8p-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 10:27:54 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 29 Jan
 2024 16:27:43 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Mon, 29 Jan 2024 16:27:43 +0000
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.64.204])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 7585E820242;
	Mon, 29 Jan 2024 16:27:43 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>
Subject: [PATCH 06/18] ASoC: cs35l56: Remove buggy checks from
 cs35l56_is_fw_reload_needed()
Date: Mon, 29 Jan 2024 16:27:25 +0000
Message-ID: <20240129162737.497-7-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240129162737.497-1-rf@opensource.cirrus.com>
References: <20240129162737.497-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: bWtfPBqWyiJgLzXe8bT_v_QwQOJFqq0r
X-Proofpoint-GUID: bWtfPBqWyiJgLzXe8bT_v_QwQOJFqq0r
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: ZI2RRLLLOW3U5JPPL6GBVGXCX6GPR6DL
X-Message-ID-Hash: ZI2RRLLLOW3U5JPPL6GBVGXCX6GPR6DL
X-MailFrom: prvs=97580788b4=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZI2RRLLLOW3U5JPPL6GBVGXCX6GPR6DL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Remove the check of fw_patched from cs35l56_is_fw_reload_needed().
Also remove the redundant check for control of the reset GPIO.

The fw_patched flag is set when cs35l56_dsp_work() has completed its
steps to download firmware and power-up wm_adsp. There was a check in
cs35l56_is_fw_reload_needed() to make a quick exit of 'false' if
!fw_patched. The original idea was that the system might be suspended
before the driver has ever made any attempt to download firmware, and
in that case the driver doesn't need to return to a patched state
because it was never in a patched state.

This check of fw_patched is buggy because it prevented ever recovering
from a failed patch. If a previous attempt to patch and reboot the
silicon had failed it would leave fw_patched==false. This would mean
the driver never attempted another download even though the fault may
have been cleared (by a hard reset, for example).

It is also a redundant check because the calling code already makes
a quick exit if cs35l56_component_probe() has not been called, which
deals with the original intent of this check but in a safer way.

The check for reset GPIO is redundant: if the silicon was hard-reset
the FIRMWARE_MISSING flag will be 1. But this check created an
expectation that the suspend/resume code toggles reset. This can't
easily be protected against accidental code breakage. The only reason
for the check was to skip runtime-resuming the driver to read the
PROTECTION_STATUS register when it already knows it reset the silicon.
But in that case the driver will have to be runtime-resumed to do
the firmware download. So it created an assumption for no benefit.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: 8a731fd37f8b ("ASoC: cs35l56: Move utility functions to shared file")
---
 sound/soc/codecs/cs35l56-shared.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index 953ba066bab1..0cd572de73a9 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -400,17 +400,6 @@ int cs35l56_is_fw_reload_needed(struct cs35l56_base *cs35l56_base)
 	unsigned int val;
 	int ret;
 
-	/* Nothing to re-patch if we haven't done any patching yet. */
-	if (!cs35l56_base->fw_patched)
-		return false;
-
-	/*
-	 * If we have control of RESET we will have asserted it so the firmware
-	 * will need re-patching.
-	 */
-	if (cs35l56_base->reset_gpio)
-		return true;
-
 	/*
 	 * In secure mode FIRMWARE_MISSING is cleared by the BIOS loader so
 	 * can't be used here to test for memory retention.
-- 
2.39.2

