Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3124389FC86
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Apr 2024 18:09:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEAF12235;
	Wed, 10 Apr 2024 18:09:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEAF12235
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712765367;
	bh=uIp+Ly6NhCx68e61qpQZ5cWRk4j7iTO0QltCVLYEnfY=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Qh/GAdvNmSchlZ6y2ToXQ53bEh0kINmBYtPyJNisqBXRXZy79HBA+/Cg5s8PO/y1C
	 lOGCqx25xEx2Dwe6+Ya8KnYkvGzG9UuWm9kQLo91s9fVZw2HKTXwyCj6mLgD6ceZ4p
	 mqY1e3TfBe5BuQPjjb8jrjFsiVqEOnrE7FlyV3Ms=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B3A5F80423; Wed, 10 Apr 2024 18:08:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 767A7F8059F;
	Wed, 10 Apr 2024 18:08:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B64FF8026D; Wed, 10 Apr 2024 18:08:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C8C39F8013D
	for <alsa-devel@alsa-project.org>; Wed, 10 Apr 2024 18:08:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8C39F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=WH8YFB8k
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 43AAVPBH003230;
	Wed, 10 Apr 2024 11:08:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=O
	CzWokGvgPVgqbKJreriPnsCx85RwRyagqB/QJQ8/vI=; b=WH8YFB8kpbw2FOPVK
	wqKtZfOfJwamIjjmbrH78vmjCngoOQmuH9js5Z3KcCr5tjkWdbrTYM7wbYG8TfwJ
	FngR/S+2R7ag6YQuKiJlHccKktGxSGNtZbofUgJoW+s2pLjPZW0l4D7F8Cv1j81b
	1IjP7PQzMNl7dy3mEMk+/NpIE8+/cFvOB4HgXSRuwxLBwOaBeF5QrVsJ/3gVtjf7
	2r8Ta6n/L+HDjsXJIiIgAJPGwJVpFBkNtFcj5MeFk4qvD9MuOeO/pMcXJoeF8sq2
	Nh1/Bp+8r+J4DNM0P8Pbhsp19/u9uw/qNqYimfgBDtm/SH9RgTVEttfe5Hkl+3sE
	JI95w==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3xb3sxn7k0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 11:08:39 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 10 Apr
 2024 17:08:37 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9
 via Frontend Transport; Wed, 10 Apr 2024 17:08:37 +0100
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.64.213])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id C104682024A;
	Wed, 10 Apr 2024 16:08:36 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>
Subject: [PATCH] ASoC: cs35l56: Include array_size.h
Date: Wed, 10 Apr 2024 17:08:33 +0100
Message-ID: <20240410160833.20837-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Itkn7BXLBpQp6x6Z1s9Jn7mBqLTJXMsw
X-Proofpoint-GUID: Itkn7BXLBpQp6x6Z1s9Jn7mBqLTJXMsw
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: MWPZTGMV3FWMXCEBLGKNHZYKRYWGVLFZ
X-Message-ID-Hash: MWPZTGMV3FWMXCEBLGKNHZYKRYWGVLFZ
X-MailFrom: prvs=1830ba3822=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MWPZTGMV3FWMXCEBLGKNHZYKRYWGVLFZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Explicitly #include array_size.h for the source files that use
ARRAY_SIZE().

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-shared.c | 1 +
 sound/soc/codecs/cs35l56.c        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index ec1d95e57061..3aa39f5923eb 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -5,6 +5,7 @@
 // Copyright (C) 2023 Cirrus Logic, Inc. and
 //                    Cirrus Logic International Semiconductor Ltd.
 
+#include <linux/array_size.h>
 #include <linux/firmware/cirrus/wmfw.h>
 #include <linux/gpio/consumer.h>
 #include <linux/regmap.h>
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 6331b8c6136e..dfd703d9e12f 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -6,6 +6,7 @@
 //                    Cirrus Logic International Semiconductor Ltd.
 
 #include <linux/acpi.h>
+#include <linux/array_size.h>
 #include <linux/completion.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
-- 
2.39.2

