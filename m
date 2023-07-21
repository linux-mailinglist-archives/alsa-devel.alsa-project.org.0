Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 790F175CB8B
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 17:22:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9A32844;
	Fri, 21 Jul 2023 17:21:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9A32844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689952943;
	bh=a4DfggC+aA+beBDflOX2B/PfmAwi2kVp+F54iqBIrkg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aVAhjTmGm+OqLpKi+10VoB+ohCkQuJPTEkCqc/JGz1Vr3ArhE5u4cweikR6bHgNLN
	 PUSKqYdfEgaL9Epf0b9cw76F6bQK1o+Lk5MCzicr9J9QHyL0kvqIgDw1UsLMrZUqVk
	 99kJqkooWAIAhftRAiIV052GXZg4LRcKSbsvQbMc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9A8DF8053B; Fri, 21 Jul 2023 17:20:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3535CF80494;
	Fri, 21 Jul 2023 17:20:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81550F80494; Fri, 21 Jul 2023 17:20:13 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id F2941F80520
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 17:18:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2941F80520
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=ZKmCigc7
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36LDppwl011284;
	Fri, 21 Jul 2023 10:18:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=VPgIFBsUn3H5pnKrozNRp6S6xNZJzvk/yj1GdWeV/2w=; b=
	ZKmCigc7FhfyzYcrvwcajY32aAvQMV5HGMcbMUFjPYqMqnwGkGQ110ytI74UFs2U
	7PSmiUjr1CidrEWFWf+/Y8fiZdY19kKOOr2qp9sggsgc6S2E865WANx3a/UGQmaq
	Eu+JzLm2yHfuuinZRbsEcaeNAimy6wL1B/wCyokVkAzKLnodVoClWJIdKTTCAFyW
	qwrsol8T/qTst1sZnhtLnoYsSGiOktnLvtXnCaG4wIb3XXV0hjQJbehCmLlv7Qyr
	eod8iRD3yIg3Z3CXJ9HNOWHrdi31HYVOiWhxv5hOZw2j12RmvcFm9cwnxYM9bSUB
	SCXuqZiC6vwqsaibw7+rLA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3rus62y8g5-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jul 2023 10:18:31 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 21 Jul
 2023 16:18:26 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.30 via Frontend
 Transport; Fri, 21 Jul 2023 16:18:26 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.219])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id ACFE33560;
	Fri, 21 Jul 2023 15:18:26 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi
 Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Stefan Binding
	<sbinding@opensource.cirrus.com>
Subject: [PATCH v2 05/11] ALSA: hda: cs35l41: Ensure we pass up any errors
 during system suspend.
Date: Fri, 21 Jul 2023 16:18:10 +0100
Message-ID: <20230721151816.2080453-6-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230721151816.2080453-1-sbinding@opensource.cirrus.com>
References: <20230721151816.2080453-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: j4bellYsHj3HXBjwmM23TvP8QmmmQ3V4
X-Proofpoint-ORIG-GUID: j4bellYsHj3HXBjwmM23TvP8QmmmQ3V4
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: NHX7BHYQEJCJVZA6BNTZVFINZSO33E2I
X-Message-ID-Hash: NHX7BHYQEJCJVZA6BNTZVFINZSO33E2I
X-MailFrom: prvs=2566513517=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NHX7BHYQEJCJVZA6BNTZVFINZSO33E2I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There are several steps required to put the system into system suspend.
Some of these steps may fail, so the driver should pass up the errors
if they occur.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index f42457147ce47..d4a11f7b5dbd1 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -626,17 +626,22 @@ static int cs35l41_system_suspend(struct device *dev)
 	}
 
 	ret = pm_runtime_force_suspend(dev);
-	if (ret)
+	if (ret) {
+		dev_err(dev, "System Suspend Failed, unable to runtime suspend: %d\n", ret);
 		return ret;
+	}
 
 	/* Shutdown DSP before system suspend */
-	cs35l41_ready_for_reset(cs35l41);
+	ret = cs35l41_ready_for_reset(cs35l41);
+
+	if (ret)
+		dev_err(dev, "System Suspend Failed, not ready for Reset: %d\n", ret);
 
 	/*
 	 * Reset GPIO may be shared, so cannot reset here.
 	 * However beyond this point, amps may be powered down.
 	 */
-	return 0;
+	return ret;
 }
 
 static int cs35l41_system_resume(struct device *dev)
@@ -659,9 +664,13 @@ static int cs35l41_system_resume(struct device *dev)
 	usleep_range(2000, 2100);
 
 	ret = pm_runtime_force_resume(dev);
+	if (ret) {
+		dev_err(dev, "System Resume Failed: Unable to runtime resume: %d\n", ret);
+		return ret;
+	}
 
 	mutex_lock(&cs35l41->fw_mutex);
-	if (!ret && cs35l41->request_fw_load && !cs35l41->fw_request_ongoing) {
+	if (cs35l41->request_fw_load && !cs35l41->fw_request_ongoing) {
 		cs35l41->fw_request_ongoing = true;
 		schedule_work(&cs35l41->fw_load_work);
 	}
-- 
2.34.1

