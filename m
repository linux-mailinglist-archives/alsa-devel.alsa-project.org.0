Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B68B1840B7E
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jan 2024 17:31:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BC6583E;
	Mon, 29 Jan 2024 17:31:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BC6583E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706545895;
	bh=iSzhA3JrzRMsulGlvr7cg4RdMLMlNOjtRT6xe6yJDns=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FLrTkYdvssY1lsViYoskNEcYMVfWKHTu/ej6ebfoZVLS3XgeClioA8xnIz1GZ1s70
	 kRQYHe0ybKqWvmKTZ5Zf15KNiGkNk3XSuU8JCsWanMBFpnJrXS30c/IuuoO862Ehy0
	 WBwrd3yWNgKjBjm98BxRNm3XjSjQAM/eiHAUf7Oc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 580DAF8074B; Mon, 29 Jan 2024 17:28:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EC34F80768;
	Mon, 29 Jan 2024 17:28:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02517F805BA; Mon, 29 Jan 2024 17:28:27 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 3807AF80588
	for <alsa-devel@alsa-project.org>; Mon, 29 Jan 2024 17:27:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3807AF80588
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=IoVGstZ9
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40T5fM0I006968;
	Mon, 29 Jan 2024 10:27:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=JOCmxyosFFenj0dlq8WFGlARIYiWw78ly3nw8gUSm9c=; b=
	IoVGstZ9cg2+mJKWoUM/BUXndzMAilt7Ai0fnHEZsfOKXBcUV+ZFjfJiVIndF2OK
	X67Kb2H4CP2YAMiC3GX+U5UXZawTUNQDC/B5HVgnBPr3tdJX3NRW6OAUFBemslEu
	9JPJJbPc9SfVODOxUmyaRvNSFk3CEZf73z0rrlKpTXGeCy/zPbs12mSqCKwZMl2m
	Y5BH5qWZv4DBw+ajZWrVPxA/c+XDJEdSiE5wehsMZYfiR7XIWKbuNTCBBQTVPkfd
	/U0m4d5cxivuAnuDW7Khqu4QYZwgNd+bRm+626LG+cq7Mlnyaf6s5EchgTuWEbOP
	M98BSbnr7DUkbpSURKdigQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3vvy4nta8n-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 10:27:55 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 29 Jan
 2024 16:27:46 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Mon, 29 Jan 2024 16:27:46 +0000
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.64.204])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 432DE82024A;
	Mon, 29 Jan 2024 16:27:46 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>
Subject: [PATCH 14/18] ASoC: cs35l56: Allow more time for firmware to boot
Date: Mon, 29 Jan 2024 16:27:33 +0000
Message-ID: <20240129162737.497-15-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240129162737.497-1-rf@opensource.cirrus.com>
References: <20240129162737.497-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: iGGh7-3BJYiH3wWj9EE_jgdJchl-ROK_
X-Proofpoint-GUID: iGGh7-3BJYiH3wWj9EE_jgdJchl-ROK_
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: O3A332JRHP5QHDG4ATYPR3OBUMLRTMDR
X-Message-ID-Hash: O3A332JRHP5QHDG4ATYPR3OBUMLRTMDR
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The original 50ms timeout for firmware boot is not long enough for
worst-case time to reboot after a firmware download. Increase the
timeout to 250ms.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: e49611252900 ("ASoC: cs35l56: Add driver for Cirrus Logic CS35L56")
---
 include/sound/cs35l56.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sound/cs35l56.h b/include/sound/cs35l56.h
index 23da6298ab37..b24716ab2750 100644
--- a/include/sound/cs35l56.h
+++ b/include/sound/cs35l56.h
@@ -242,7 +242,7 @@
 
 #define CS35L56_CONTROL_PORT_READY_US			2200
 #define CS35L56_HALO_STATE_POLL_US			1000
-#define CS35L56_HALO_STATE_TIMEOUT_US			50000
+#define CS35L56_HALO_STATE_TIMEOUT_US			250000
 #define CS35L56_RESET_PULSE_MIN_US			1100
 #define CS35L56_WAKE_HOLD_TIME_US			1000
 
-- 
2.39.2

