Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BBD840B8E
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jan 2024 17:33:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78C53A4D;
	Mon, 29 Jan 2024 17:33:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78C53A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706546011;
	bh=BkYUj9J0S9uZC6cARe/4MnNL8VlDnXU3fcAQ1S2UeUk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IbzSSK7pB8L58mziirZDevswEUIYuiN1qFl3rRUFmgc5HmqnsVwhB6mduqqKlHCsn
	 AVSCHnvdG0019efoP1Cwiv+BOwXaaFR7ITPJ7KNjw7Hz2t4FPgoJkVfrx0Mfhd9DVA
	 xHjXCdGkEocubnMEvyv7k2rm3sxohG2+C+KJIVjg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1771F80C8D; Mon, 29 Jan 2024 17:29:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C4B86F80C96;
	Mon, 29 Jan 2024 17:29:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CEEC2F80578; Mon, 29 Jan 2024 17:28:51 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B07A0F80578
	for <alsa-devel@alsa-project.org>; Mon, 29 Jan 2024 17:28:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B07A0F80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=VAq83DXf
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40T5fM0R006968;
	Mon, 29 Jan 2024 10:28:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=wpM0IEXUU+L0htJrBM+q7AUNIjabpxsqMat65cQAX8Q=; b=
	VAq83DXfWvQdH58ZCz7hzM0HWUjNbSF+rGcNY8Awbk4CkgMhjCvuUKQktnzyU8/o
	ZAqs9avwZfJDsSNfs0Kyd6F2Mu8hW8SF+QO1pskAxcWmkSOxQggFa0U9xVUBbXO+
	bVdi20W9YxOMfTdw+e4PqIQECeNv9yN/GyO3O1q2ZSSVnlKxMV2bEolGfBNzjyg+
	f+yHIReq3BETUBvNhUHjXH2olYf6+abx4NTNDhe+8D2Lyk4eTNz+4k6R/J9PFDhG
	Z+pZhbb/Nxijyx9MLXbjmO/EJ0ZWaumZ41QwgK1q6SOORF+fDcToyxeWTRR733iv
	G6HLZGHY9q+d/RI0/+jpRA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3vvy4nta8p-11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 10:28:00 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 29 Jan
 2024 16:27:47 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Mon, 29 Jan 2024 16:27:47 +0000
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.64.204])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 9B198820247;
	Mon, 29 Jan 2024 16:27:47 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>
Subject: [PATCH 18/18] ALSA: hda: cs35l56: Remove unused test stub function
Date: Mon, 29 Jan 2024 16:27:37 +0000
Message-ID: <20240129162737.497-19-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240129162737.497-1-rf@opensource.cirrus.com>
References: <20240129162737.497-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: ThVYG6jeUEf0DAB4fk-r0FgbZvgPRDcg
X-Proofpoint-GUID: ThVYG6jeUEf0DAB4fk-r0FgbZvgPRDcg
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: MANH45R2I3GZOU7FUCGY6DJJ7L76J7TD
X-Message-ID-Hash: MANH45R2I3GZOU7FUCGY6DJJ7L76J7TD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MANH45R2I3GZOU7FUCGY6DJJ7L76J7TD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Remove an unused stub function that calls a non-existant function.

This function was accidentally added as part of commit
2144833e7b41 ("ALSA: hda: cirrus_scodec: Add KUnit test"). It was
a relic of an earlier version of the test that should have been
removed.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: 2144833e7b41 ("ALSA: hda: cirrus_scodec: Add KUnit test")
---
 sound/pci/hda/cs35l56_hda.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
index 32736d3e45ba..75a14ba54fcd 100644
--- a/sound/pci/hda/cs35l56_hda.c
+++ b/sound/pci/hda/cs35l56_hda.c
@@ -1063,16 +1063,6 @@ const struct dev_pm_ops cs35l56_hda_pm_ops = {
 };
 EXPORT_SYMBOL_NS_GPL(cs35l56_hda_pm_ops, SND_HDA_SCODEC_CS35L56);
 
-#if IS_ENABLED(CONFIG_SND_HDA_SCODEC_CS35L56_KUNIT_TEST)
-/* Hooks to export static function to KUnit test */
-
-int cs35l56_hda_test_hook_get_speaker_id(struct device *dev, int amp_index, int num_amps)
-{
-	return cs35l56_hda_get_speaker_id(dev, amp_index, num_amps);
-}
-EXPORT_SYMBOL_NS_GPL(cs35l56_hda_test_hook_get_speaker_id, SND_HDA_SCODEC_CS35L56);
-#endif
-
 MODULE_DESCRIPTION("CS35L56 HDA Driver");
 MODULE_IMPORT_NS(SND_HDA_CIRRUS_SCODEC);
 MODULE_IMPORT_NS(SND_HDA_CS_DSP_CONTROLS);
-- 
2.39.2

