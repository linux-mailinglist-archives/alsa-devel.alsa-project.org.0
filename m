Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4196041DC31
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Sep 2021 16:23:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B083716A5;
	Thu, 30 Sep 2021 16:22:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B083716A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633011783;
	bh=rpRrCTsvJZWUPBothfZniF5w62kiEM22Kex5xSyX404=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=d0AfNiSCZi2cxFTbIe5PkxKonCnItmZKypqj8DCfUwhahssE2JanvMCjrHMHAYvsz
	 KkX/tsQey5bfqnpOzSRyw3uBRHJ+BshyFyeCCFEk32vAKAie6xNYJWmLzFdB27Aw2N
	 Hiq/5r2VRW8iP2gthpZt8J2SFz6W06RvbUym7DY0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46C04F804BC;
	Thu, 30 Sep 2021 16:21:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B3F7F804AD; Thu, 30 Sep 2021 16:21:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23B29F800F3
 for <alsa-devel@alsa-project.org>; Thu, 30 Sep 2021 16:21:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23B29F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Qdbg6Xlm"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18U4txao008227; 
 Thu, 30 Sep 2021 09:21:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=9T7IUXssVAtD3OmN01m5KXu7rIz2dffdsLsJeMQpJUg=;
 b=Qdbg6XlmTsV2iMxFU9PV3LQl2ZjZpB485GsrR7/luMWUBVJsfJTooljw8kQ0ruN7Ec15
 Ar3CF0joOa5Tkn25tRDTGnaIowxY0265xDzZBXqyn9FhOlwHqPsunaEM5Dttd34U5shE
 dUyzOYVo4OUC+VQ03/7xuzDpfZyi7Sx4oOwsrql8qKXmJ5EU5F3CyaAJvijCujbd2vXW
 RzA3ZZo8IH7VudvSmRzcPjz85CnXy9a0Xttl05QQngv/Qy+CVCqXC04D8wcHffrR3/yG
 S6Fl8ojVnzB1vxj+lRlCj6iFh0GLSaAFdykjrlXMMBn3lKrsdptQDf3deQiR6mLek8AW zQ== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3bcxjx92xu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 30 Sep 2021 09:21:30 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Thu, 30 Sep
 2021 15:21:28 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Thu, 30 Sep 2021 15:21:28 +0100
Received: from simont-vb.lan?044ad.cirrus.com (unknown [198.90.238.180])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1FD59B13;
 Thu, 30 Sep 2021 14:21:28 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH] ASoC: soc-component: Remove conditional definition of debugfs
 data members
Date: Thu, 30 Sep 2021 15:21:16 +0100
Message-ID: <20210930142116.528878-1-simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: o0TTWUg_feZu5rcDiKtsMydRci6C9M4Q
X-Proofpoint-ORIG-GUID: o0TTWUg_feZu5rcDiKtsMydRci6C9M4Q
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Simon Trimmer <simont@opensource.cirrus.com>, linux-kernel@vger.kernel.org
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

This simplification allows the use of the standard kernel pattern of
static inline dummy functions for debugfs code. Most systems will only
have a small number of snd_soc_components so the memory impact is
minimal.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Suggested-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc-component.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index e09a2d108e8c..3a35d149e92f 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -227,10 +227,8 @@ struct snd_soc_component {
 	struct snd_compr_stream  *mark_compr_open;
 	void *mark_pm;
 
-#ifdef CONFIG_DEBUG_FS
 	struct dentry *debugfs_root;
 	const char *debugfs_prefix;
-#endif
 };
 
 #define for_each_component_dais(component, dai)\
-- 
2.33.0

