Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7887051A140
	for <lists+alsa-devel@lfdr.de>; Wed,  4 May 2022 15:46:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06F94868;
	Wed,  4 May 2022 15:45:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06F94868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651671991;
	bh=CZQc/0yyhrJzGFjg69rjPB+L86QiM/wRJm5XFtu1Xrw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rOtyYVE/2caLq+aHrZOSvHtdsJ/TtKimxpfFafJrdR+jUksDsaCeUxeZLHm/mJAky
	 BYRzqRzzMECQDnil5/0CAtVJR79KQM/lkns1nbERj92kONqtexkzW4vFVQDt21Y2Hy
	 3HFVGLv893xzduqd8dnBOxGoRExGw2Q9KHZBqAEU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FAEDF800BF;
	Wed,  4 May 2022 15:45:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CAF0F80163; Wed,  4 May 2022 15:45:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 208ECF800D3
 for <alsa-devel@alsa-project.org>; Wed,  4 May 2022 15:45:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 208ECF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="RJsc4oRl"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2446Xnu6007611;
 Wed, 4 May 2022 08:45:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=MN5TT9CQ8+yVmb53jcb5CFCZCHuh7HK/uEBXED7+fWk=;
 b=RJsc4oRl+DUWdor/CxpIqFEOP/a/Q9f9sv0WL7opgGvqMgNowrlQZMpfHessAeLFW0Yl
 LUGWE3g+/IT2f+3+aIuZHTPHvEmj7vihBTk9aDelwIIOqQUOcuqB65xRdRXsrQYt2vi3
 5a/3t92BLmZlZaAmXO3/bKa60LFi+gd7N433k8ppA83tK8kehMiT+QKHunHesWtr+vAC
 Gqwo5WTUGTZNzuUOCAeRlzCvDCwoc4UNiNGDzHbgFQzadX339DMIXyQgr68t4p7Dqvuh
 MJMISOsaoa4Svw17YLeispmfi1tO7CUpdbG5vCYwEB4ciPszckmJDfeJ/mXa6MMcTqwI ew== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3fs2h2d0m2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 04 May 2022 08:45:19 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 14:45:17 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 4 May 2022 14:45:17 +0100
Received: from debianA11184.ad.cirrus.com (debianA11184.ad.cirrus.com
 [198.90.251.83])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9770E459;
 Wed,  4 May 2022 13:45:17 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH] ASoC: cs35l45: Enable BOOST
Date: Wed, 4 May 2022 14:44:58 +0100
Message-ID: <20220504134458.283780-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 8C-RSCtKC9PVrPRpfHsO7bFrFnx844U2
X-Proofpoint-GUID: 8C-RSCtKC9PVrPRpfHsO7bFrFnx844U2
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Do not disable the boost converter during probe. The silicon
contains functional default tunings so the boost converter can
be left at the chip default enabled state.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l45.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
index 86daa2574388..2367c1a4c10e 100644
--- a/sound/soc/codecs/cs35l45.c
+++ b/sound/soc/codecs/cs35l45.c
@@ -587,10 +587,6 @@ static int cs35l45_initialize(struct cs35l45_private *cs35l45)
 		return ret;
 	}
 
-	/* Default to boost bypass */
-	regmap_update_bits(cs35l45->regmap, CS35L45_BLOCK_ENABLES, CS35L45_BST_EN_MASK,
-			   CS35L45_BST_DISABLE_FET_ON << CS35L45_BST_EN_SHIFT);
-
 	ret = cs35l45_apply_property_config(cs35l45);
 	if (ret < 0)
 		return ret;
-- 
2.30.2

