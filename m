Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11692840B72
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jan 2024 17:30:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 721FB84A;
	Mon, 29 Jan 2024 17:29:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 721FB84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706545801;
	bh=nKzg7ZUZ5PicJ3de2Xnf4E2RszVbiYMky9NH4GS1hSY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l2tLW/iPzsqNZ2G4uoRYoiNYdvcPfLVJM2darc6kqoaJPOI7yQKqnVDBx943ByKNU
	 y1p7bjiPcxUBdbnlUKyAEsRsgam03eQmgn8xomv+HufytBGD3dTNx3i/j4dvLuiDc5
	 MlekohxguaDj0DKjJ65PrR2rHQVt9jQLUPMOW8e4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2057F805AF; Mon, 29 Jan 2024 17:28:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BA5DF80697;
	Mon, 29 Jan 2024 17:28:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CFB07F80571; Mon, 29 Jan 2024 17:28:13 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C03CFF80571
	for <alsa-devel@alsa-project.org>; Mon, 29 Jan 2024 17:27:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C03CFF80571
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=MKOTEDfh
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40T5fM0E006968;
	Mon, 29 Jan 2024 10:27:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=r5QH0UgHuWLq2qxamMiPxt7EwPVsMxTa0U6W9j5X34I=; b=
	MKOTEDfhY5HlWeFWvOuBXKH5HM//LtxGuJP4L3yrZaokL6JdtPXA8uFVsnnl10ZJ
	WbeR2smid4kNNrau0UU4Hz5MREAfdkQDUgCPPEvXCPxSuRtWAxQYcA5903+1zp2s
	i4TasD3mH4hwjZmTX5y8cjHvl+5TPiORlk66dBwpxQ84UFrhZRIMxzzQsvaiueTv
	M28GBiXTcfVf7MDzYWqLZ6BRJL2En1ZsnGfugL7QYiD+IxxqtOwdhZW3ocZRVyAM
	ibjtTZEOq41Gzfh24amx2EM5X1IWcFHWEw3vbVBRrH8D6fsj2BbI65EnixNNMZL0
	1hFJTvVlacxxSPHSEunZaA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3vvy4nta8p-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 10:27:53 -0600 (CST)
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
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id C0BB8820242;
	Mon, 29 Jan 2024 16:27:42 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>
Subject: [PATCH 04/18] ASoC: cs35l56: cs35l56_component_remove() must clean up
 wm_adsp
Date: Mon, 29 Jan 2024 16:27:23 +0000
Message-ID: <20240129162737.497-5-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240129162737.497-1-rf@opensource.cirrus.com>
References: <20240129162737.497-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: U-DzzndOOXzgNtJRrv7Bror1zWg2bbDx
X-Proofpoint-GUID: U-DzzndOOXzgNtJRrv7Bror1zWg2bbDx
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: YQXOKCMVHPLGU4H62RJRIM4TMRMSPOQH
X-Message-ID-Hash: YQXOKCMVHPLGU4H62RJRIM4TMRMSPOQH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YQXOKCMVHPLGU4H62RJRIM4TMRMSPOQH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

cs35l56_component_remove() must call wm_adsp_power_down() and
wm_adsp2_component_remove().

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: e49611252900 ("ASoC: cs35l56: Add driver for Cirrus Logic CS35L56")
---
 sound/soc/codecs/cs35l56.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 09944db4db30..491da77112c3 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -810,6 +810,11 @@ static void cs35l56_component_remove(struct snd_soc_component *component)
 
 	cancel_work_sync(&cs35l56->dsp_work);
 
+	if (cs35l56->dsp.cs_dsp.booted)
+		wm_adsp_power_down(&cs35l56->dsp);
+
+	wm_adsp2_component_remove(&cs35l56->dsp, component);
+
 	cs35l56->component = NULL;
 }
 
-- 
2.39.2

