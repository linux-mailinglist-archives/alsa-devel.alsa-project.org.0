Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FD3840B6A
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jan 2024 17:29:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D084A82C;
	Mon, 29 Jan 2024 17:29:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D084A82C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706545775;
	bh=kDFWAW+zEb3sLd+G9xWayloOQteRsgnLXToSAxt3wKc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XKo/mi2D8+9PXkzzrN9A7yTyV3HYuhgfnEZXjaYer829xSK6FWApKbLTP3R2detl/
	 IVeEYrfsbeO3iHETOQS2A5jykb6zjQosYTSWUpDbSIPTxgReyezLxQ5UNgB3Cr/NxY
	 huqNm90st9WvfqJKxxrgSOR/xL/Dd+IZBVHyxXIk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14AA4F80612; Mon, 29 Jan 2024 17:28:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EA845F80674;
	Mon, 29 Jan 2024 17:28:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8BA00F805D3; Mon, 29 Jan 2024 17:28:12 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 6EB43F80548
	for <alsa-devel@alsa-project.org>; Mon, 29 Jan 2024 17:27:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EB43F80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=h+y1F0cK
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40T5fM0D006968;
	Mon, 29 Jan 2024 10:27:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=aDJwWaBdkWaUuW6yxzuAslRbUrkyn9OuWCePyIRoL3s=; b=
	h+y1F0cKb/iRnggpfI2NP5R5LaarPfyihZNgZofav9IKLAM50eJAo4uXCLQRzYsc
	leKTG+XE6QrraHKyQ0nUzcLLxSpdBrSTGtXlE4yIdrAwqx9gIk64mpY0g6UH2lUy
	JEZuRWjHlu+9ewWLqwMbnu8CLyD345zgXAKNO/ax5MWzC7lglFsJgpRhosfPYww7
	LMy4+VMx3KaW/G9we3F590SjI12oPDf/AFuejtnA5CDCJc428ah0Aj3t/FEl/m15
	Xt5qlY+4CSrvI0dbwApjEhuoJUXN/Jvhf5Eq9pSv/gWOrYE1AtRvV/9PGjS6Bmoe
	Y4YksYeVVFq6R4c2CVtsDw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3vvy4nta8n-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 10:27:53 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 29 Jan
 2024 16:27:44 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Mon, 29 Jan 2024 16:27:44 +0000
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.64.204])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 2A4E4820242;
	Mon, 29 Jan 2024 16:27:44 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>
Subject: [PATCH 08/18] ASoC: cs35l56: Fix default SDW TX mixer registers
Date: Mon, 29 Jan 2024 16:27:27 +0000
Message-ID: <20240129162737.497-9-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240129162737.497-1-rf@opensource.cirrus.com>
References: <20240129162737.497-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: iSNVIfx41Bj--QEaepYM2YM6kp4WAUg8
X-Proofpoint-GUID: iSNVIfx41Bj--QEaepYM2YM6kp4WAUg8
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: XNIJKTACUS2TSOW64Z2UJF5ZRWNYTRJL
X-Message-ID-Hash: XNIJKTACUS2TSOW64Z2UJF5ZRWNYTRJL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XNIJKTACUS2TSOW64Z2UJF5ZRWNYTRJL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Patch the SDW TX mixer registers to silicon defaults.

CS35L56 is designed for SDCA and a generic SDCA driver would
know nothing about these chip-specific registers. So the
firmware sets up the SDW TX mixer registers to whatever audio
is relevant on a specific system.

This means that the driver cannot assume the initial values
of these registers. But Linux has ALSA controls to configure
routing, so the registers can be patched to silicon default and
the ALSA controls used to select what audio to feed back to the
host capture path.

Backport note:
This won't apply to kernels older than v6.6.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: e49611252900 ("ASoC: cs35l56: Add driver for Cirrus Logic CS35L56")
---
 sound/soc/codecs/cs35l56-shared.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index 35789ffc63af..a812abf90836 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -12,6 +12,15 @@
 #include "cs35l56.h"
 
 static const struct reg_sequence cs35l56_patch[] = {
+	/*
+	 * Firmware can change these to non-defaults to satisfy SDCA.
+	 * Ensure that they are at known defaults.
+	 */
+	{ CS35L56_SWIRE_DP3_CH1_INPUT,		0x00000018 },
+	{ CS35L56_SWIRE_DP3_CH2_INPUT,		0x00000019 },
+	{ CS35L56_SWIRE_DP3_CH3_INPUT,		0x00000029 },
+	{ CS35L56_SWIRE_DP3_CH4_INPUT,		0x00000028 },
+
 	/* These are not reset by a soft-reset, so patch to defaults. */
 	{ CS35L56_MAIN_RENDER_USER_MUTE,	0x00000000 },
 	{ CS35L56_MAIN_RENDER_USER_VOLUME,	0x00000000 },
-- 
2.39.2

