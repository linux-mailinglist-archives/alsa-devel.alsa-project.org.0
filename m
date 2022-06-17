Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBC954FA6A
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 17:37:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCA15183B;
	Fri, 17 Jun 2022 17:36:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCA15183B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655480250;
	bh=imnmkG4Muc40XrKY1lzzej/YLR5eL5nBmg2CKTADtHI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=V80DpzFVsN1buNArFYgPifHZCB6v34ylDbnYlb/tqGz7GVOluw9rojMHjUt2YCOrH
	 VVPDJK5kzBm7y/NyQArz6kf7NinSAwW4YzcavjUHBVs9DJ9gEHhkJGM2h1cdzrBMTA
	 WGGD5zhKl4sdfOWkXi5DQeCdiwyGo/G2nXxwoS+c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4801BF8028B;
	Fri, 17 Jun 2022 17:36:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9414FF80527; Fri, 17 Jun 2022 17:36:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E471F804BC
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 17:36:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E471F804BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Y7JVKM5m"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25HBlIRM021568;
 Fri, 17 Jun 2022 10:36:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=qRtpFnwnINqdEI0cM/6TIAgTA8r6U9dSoQLRjJoptkw=;
 b=Y7JVKM5msmCoD9jA1SosE6mgf2hyZUWA/Sbmd4jneaOJNOp85CcNFM+Ld14irX8l0sJn
 k6wPvZ5993MDhYSYAx83WT7UzQwp6j5hLAKRGa25II4sKhzkSZtqPeVN+zoWbGOX2rTo
 bL+4lPzC0lHyX+tew+oGfZtP87FM1QIyuL89oithp9/Q/p9dNlWzCI3NRfYiFL3Fkmju
 DBmyUXEzKJRDg2YnA2maIisYE7oiT7X4OS0p4IWQYhFnB5jmnBroE0NNE/Ptn0G2vzkT
 PrXtJVr6ADm8z+vzIGUYKnabL/6UG2g3UastH1JphFED0iu1+M9ZWhS0Xp67/SfUx/tf Pw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gmqfq79b5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 17 Jun 2022 10:36:20 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 17 Jun
 2022 16:36:19 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Fri, 17 Jun 2022 16:36:19 +0100
Received: from sbinding-cirrus-dsktp.ad.cirrus.com (unknown [198.90.238.121])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6F861468;
 Fri, 17 Jun 2022 15:36:18 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v1] ASoC: ops: Fix integer detection for when max possible
 values > 1
Date: Fri, 17 Jun 2022 16:36:06 +0100
Message-ID: <20220617153606.2619457-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: mqnC9nlbYucMZ7Ouujo0btYo4FKfBKEA
X-Proofpoint-GUID: mqnC9nlbYucMZ7Ouujo0btYo4FKfBKEA
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Stefan Binding <sbinding@opensource.cirrus.com>
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

The standard snd_soc_info_volsw() allows a two value control to be
defined as an integer control only if the control name ends in
"Volume". It achieves this by creating a substring if it contains
" Volume", and ensuring this exists at the end of the name. The
volume substring is then used to decide whether the type is a
SNDRV_CTL_ELEM_TYPE_INTEGER or SNDRV_CTL_ELEM_TYPE_BOOLEAN.
However this volume substring is only computed for a two value
control.
This means for controls where there are more than two possible
values, the substring is never created, so in this case the
substring remains NULL, and the condition yields
SNDRV_CTL_ELEM_TYPE_BOOLEAN, even though there are more than 2
possible values.
If there are more than 2 possible values for the control,
then it should always be an integer control.

Fixes: aa2a4b897132 ("ASoC: ops: Fix boolean/integer detection for simple controls")

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/soc/soc-ops.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 0267e39de2a8..1970bda074d8 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -183,17 +183,16 @@ int snd_soc_info_volsw(struct snd_kcontrol *kcontrol,
 	if (mc->platform_max && mc->platform_max < max)
 		max = mc->platform_max;
 
-	/* Even two value controls ending in Volume should always be integer */
 	if (max == 1) {
+		/* Even two value controls ending in Volume should always be integer */
 		vol_string = strstr(kcontrol->id.name, " Volume");
-		if (vol_string && strcmp(vol_string, " Volume"))
-			vol_string = NULL;
-	}
-
-	if (!vol_string)
-		uinfo->type = SNDRV_CTL_ELEM_TYPE_BOOLEAN;
-	else
+		if (vol_string && !strcmp(vol_string, " Volume"))
+			uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+		else
+			uinfo->type = SNDRV_CTL_ELEM_TYPE_BOOLEAN;
+	} else {
 		uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	}
 
 	uinfo->count = snd_soc_volsw_is_stereo(mc) ? 2 : 1;
 	uinfo->value.integer.min = 0;
-- 
2.25.1

