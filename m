Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3107A92577A
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2024 11:56:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A30B81D7;
	Wed,  3 Jul 2024 11:56:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A30B81D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720000572;
	bh=K6avlmTj3HXl3IF6sXdRJdTatC9czwwt3hrIqh+w2HI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iQe/ABicSu0ezpQc4JfFGmyNEjoWzNRoJY7hokl0b3UrEHBA1yREigZDTrzWXGByD
	 Pm4m/1hmOkuKbTX1xdYe4uB9lIuF/Fmy+Yrb/AiVDLoj592sc14RpIIg6m2lres/PW
	 7viVhCihx6ruTAIGq4nRlN32xRk1lyBFYHbPH6/I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F876F805C8; Wed,  3 Jul 2024 11:55:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 65893F805D8;
	Wed,  3 Jul 2024 11:55:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9F92F80272; Wed,  3 Jul 2024 11:55:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 56A00F800F8
	for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2024 11:55:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56A00F800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Ujd4dAyD
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4637xDTS029630;
	Wed, 3 Jul 2024 04:55:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=xLpfh/EOvOaZoS9SdFgCbMXsXkOpWChOWYb38JS95bs=; b=
	Ujd4dAyDI9H+3Y8Db+2hORYUGz1hd/ZEpKnrvR5G/3YxJt/Qljt4FwvyVuXsGvRc
	8VncN2naq8Fv7kW3WUy5VP3gpQiq5Zbzexrn9pD+cEuia+STmAyJroFfuZy1Bk6R
	yxX1m6jQbnf1Wiql5RQCvpIXVuQqVM3OlSME7nzeQjq+6cjh/0rhpBW7TitllbRj
	HLO74ow6P2XKsaS/8mZ+ADa87Wbop/7fm3JNaN9srPhqcFeEVJRaQ+vRWTL9Ys0k
	W4WMBH/3UQDlFRCz4InQa+yLB54sXLWkBa/aIBtoHlJHZ7C5wA2WWeS062dvQ5AE
	0Ikj8LvNEOrJCEwGnh+vdQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 402fnxcq1c-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Jul 2024 04:55:21 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 3 Jul 2024
 10:55:18 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 3 Jul 2024 10:55:18 +0100
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 0F55E820257;
	Wed,  3 Jul 2024 09:55:18 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>
Subject: [PATCH 2/2] ASoC: cs35l56: Limit Speaker Volume to +12dB maximum
Date: Wed, 3 Jul 2024 10:55:17 +0100
Message-ID: <20240703095517.208077-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240703095517.208077-1-rf@opensource.cirrus.com>
References: <20240703095517.208077-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: w2kT3kpPaJmcpFSN0gZf-kdSIybRhFLH
X-Proofpoint-ORIG-GUID: w2kT3kpPaJmcpFSN0gZf-kdSIybRhFLH
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: PWPOIJFAKD27B45VWGFYQXVV536YF6HO
X-Message-ID-Hash: PWPOIJFAKD27B45VWGFYQXVV536YF6HO
X-MailFrom: prvs=4914b47104=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PWPOIJFAKD27B45VWGFYQXVV536YF6HO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Change CS35L56_MAIN_RENDER_USER_VOLUME_MAX to 48, to limit the maximum
value of the Speaker Volume control to +12dB. The minimum value is
unchanged so that the default 0dB has the same integer control value.

The original maximum of 400 (+100dB) was the largest value that can be
mathematically handled by the DSP. The actual maximum amplification is
+12dB.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 include/sound/cs35l56.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sound/cs35l56.h b/include/sound/cs35l56.h
index 642ef690ebc2..a6aa112e5741 100644
--- a/include/sound/cs35l56.h
+++ b/include/sound/cs35l56.h
@@ -207,7 +207,7 @@
 
 /* CS35L56_MAIN_RENDER_USER_VOLUME */
 #define CS35L56_MAIN_RENDER_USER_VOLUME_MIN		-400
-#define CS35L56_MAIN_RENDER_USER_VOLUME_MAX		400
+#define CS35L56_MAIN_RENDER_USER_VOLUME_MAX		48
 #define CS35L56_MAIN_RENDER_USER_VOLUME_MASK		0x0000FFC0
 #define CS35L56_MAIN_RENDER_USER_VOLUME_SHIFT		6
 #define CS35L56_MAIN_RENDER_USER_VOLUME_SIGNBIT		9
-- 
2.39.2

