Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 036C6791727
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Sep 2023 14:34:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E156E741;
	Mon,  4 Sep 2023 14:33:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E156E741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693830865;
	bh=Lv5i8bDwM5024pumtjGom67GsMVbITD6+hkXuopCtiA=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=uPltvlYgQWE26PjavsJldeDypEfKMNVVQHS2Cx8qHn26lkRxwIDSbi80S+zu38zPM
	 wSYcEcsH68Duv7tUwI+UK1icnG+Gzcf/0xoGLdt8kpJzRodh7+z8aKjh8M6cYaY83Y
	 f/DMSnKyYDj5t5uhBjwsBGu48mBPjUpKksA3ZGKY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B64CFF8055A; Mon,  4 Sep 2023 14:32:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 249D1F8057F;
	Mon,  4 Sep 2023 14:32:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B175F80158; Thu, 31 Aug 2023 18:21:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5090FF80094
	for <alsa-devel@alsa-project.org>; Thu, 31 Aug 2023 18:20:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5090FF80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=fiSalqjV
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37VF9jT2009857;
	Thu, 31 Aug 2023 11:20:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=v
	9izTZHSJz/cxSDw2DvHeuhuoYs2eAtVfEb4uqYV/I4=; b=fiSalqjVfebRZJ+Tm
	4Y0Z9uCpTwuxZWSdLUF3uEPyUklSXV5nm/nYlLNDvWwo1ixEW+ZIren/5YSCdgr4
	oHpTqWB6o2YYTyYeVVQZl7erD8TVxuu8gaPJygdRSU/E8IZDtvYwM0UKorRtD02J
	bOMHG8gLMTBZUjrXUJEyU58PvkegJ/Dg7sSC/kKYMTOI6crPsav1J+dv+V77IfiX
	OOmJjr9NC/dPUtUlwcgVsLRyEM5/AFq61wiCQtMjFZJuQNgWNZHJ/C8abg91fN45
	edVbIATSvDcOQ1406feXEsXjyw+1KuaEYcV4ojE0nfG6JembbwwW9ZaFxISjcP6m
	0P20w==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sqesyep1p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Aug 2023 11:20:56 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Thu, 31 Aug
 2023 17:20:54 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Thu, 31 Aug 2023 17:20:54 +0100
Received: from vkarpovich-ThinkStation-P620.crystal.cirrus.com
 (vkarpovich-ThinkStation-P620.ad.cirrus.com [141.131.145.49])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9937111D6;
	Thu, 31 Aug 2023 16:20:52 +0000 (UTC)
From: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
To: James Schulman <james.schulman@cirrus.com>,
        David Rhodes
	<david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring
	<robh+dt@kernel.org>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Ricardo
 Rivera-Matos" <rriveram@opensource.cirrus.com>,
        Vlad Karpovich
	<vkarpovi@opensource.cirrus.com>
Subject: [PATCH v3 1/4] ASoC: cs35l45: Checks index of cs35l45_irqs[]
Date: Thu, 31 Aug 2023 11:20:39 -0500
Message-ID: <20230831162042.471801-1-vkarpovi@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: sM0T7B4ftU-mp34Q5K-zrbgE_n38BaiR
X-Proofpoint-GUID: sM0T7B4ftU-mp34Q5K-zrbgE_n38BaiR
X-Proofpoint-Spam-Reason: safe
X-MailFrom: prvs=4607c60d60=vkarpovi@opensource.cirrus.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: JXUKZCQJNHJDAB564C2MMMBZTAIL5FKT
X-Message-ID-Hash: JXUKZCQJNHJDAB564C2MMMBZTAIL5FKT
X-Mailman-Approved-At: Mon, 04 Sep 2023 12:32:36 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JXUKZCQJNHJDAB564C2MMMBZTAIL5FKT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>

Checks the index computed by the virq offset before printing the
error condition in cs35l45_spk_safe_err() handler.

Signed-off-by: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
Signed-off-by: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l45.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
index 2ac4612402eb..02b1172d2647 100644
--- a/sound/soc/codecs/cs35l45.c
+++ b/sound/soc/codecs/cs35l45.c
@@ -1023,7 +1023,10 @@ static irqreturn_t cs35l45_spk_safe_err(int irq, void *data)
 
 	i = irq - regmap_irq_get_virq(cs35l45->irq_data, 0);
 
-	dev_err(cs35l45->dev, "%s condition detected!\n", cs35l45_irqs[i].name);
+	if (i < 0 || i >= ARRAY_SIZE(cs35l45_irqs))
+		dev_err(cs35l45->dev, "Unspecified global error condition (%d) detected!\n", irq);
+	else
+		dev_err(cs35l45->dev, "%s condition detected!\n", cs35l45_irqs[i].name);
 
 	return IRQ_HANDLED;
 }
-- 
2.25.1

