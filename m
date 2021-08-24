Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 172BB3F5BD4
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Aug 2021 12:17:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52E1D85D;
	Tue, 24 Aug 2021 12:16:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52E1D85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629800247;
	bh=H0LItyPk9LEsAp/Tanf+/XUqUyyh6zucifMAHZvH7H0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=POw0W20HrildrnUdnEE223zG2Y+inDsV+Z5tIJotEJGlF/BAGIZe1y0MjczJwYrT3
	 634w3QO232SHjHtJ0MezO5Lg15tZgkr+BWWbeumvS4lJsI5hexOouomipIBNtFukJQ
	 pT0/T1HQueB1mCd9gJIsC8PMO27xM9+FEF6fjt4A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A131EF80224;
	Tue, 24 Aug 2021 12:16:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 956C0F801D8; Tue, 24 Aug 2021 12:16:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0EFDF80171
 for <alsa-devel@alsa-project.org>; Tue, 24 Aug 2021 12:15:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0EFDF80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="fHLJnLvE"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17O6MZk2032663; 
 Tue, 24 Aug 2021 05:15:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type;
 s=PODMain02222019; bh=xSC65HmKSBZDAJvJYPSUX91O+JDxFh+3P079yFw65x0=;
 b=fHLJnLvEExxucaRTGx7jzLrrN5+GY1f/U4H6zk7lb4sdEW1vXKMxYP+6gV+MP51NlHvv
 VrWfKutZnd62V4bcC2VaL5QSmpF6fMQI11YCH7Aj98y8kTZVCkud2PV8B1WmqPXqnRKb
 oi7FHwULg5YreNw+JWXEEVr7p/A7tqk791cZl/L4CXX+kuQlqTtllt1VcRDK7W1oqk8U
 nUBL0j4YcyPOQYpAn5E55zSUN0Dd43fAxPOawI3w3CjPWlqAPEaCa/7uLfijt62PKxAR
 wk3qVUkHDLEE0Nx3TAmQSw+5gFGRXrNUqvaHByN6qZmOMHSkQTZ8TBEDcP3TKuITqVpK 1Q== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3amjmq8vsu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 24 Aug 2021 05:15:55 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Tue, 24 Aug
 2021 11:15:53 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Tue, 24 Aug 2021 11:15:53 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6F5BC2BA;
 Tue, 24 Aug 2021 10:15:52 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH] ASoC: wm_adsp: Put debugfs_remove_recursive back in
Date: Tue, 24 Aug 2021 11:15:52 +0100
Message-ID: <20210824101552.1119-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: tf2sOYtTEhj6U6-4-Y6COiWJI6voqc1p
X-Proofpoint-GUID: tf2sOYtTEhj6U6-4-Y6COiWJI6voqc1p
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, tanureal@opensource.cirrus.com
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

This patch reverts commit acbf58e53041 ("ASoC: wm_adsp: Let
soc_cleanup_component_debugfs remove debugfs"), and adds an
alternate solution to the issue. That patch removes the call to
debugfs_remove_recursive, which cleans up the DSPs debugfs. The
intention was to avoid an unbinding issue on an out of tree
driver/platform.

The issue with the patch is it means the driver no longer cleans up
its own debugfs, instead relying on ASoC to remove recurive on the
parent debugfs node. This is conceptually rather unclean, but also it
would prevent DSPs being added/removed independently of ASoC and soon
we are going to be upstreaming some non-audio parts with these DSPs,
which will require this.

Finally, it seems the issue on the platform is a result of the
wm_adsp2_cleanup_debugfs getting called twice. This is very likely a
problem on the platform side and will be resolved there. But in the mean
time make the code a little more robust to such issues, and again
conceptually a bit nicer, but clearing the debugfs_root variable in the
DSP structure when the debugfs is removed.

Fixes: acbf58e53041 ("ASoC: wm_adsp: Let soc_cleanup_component_debugfs remove debugfs"
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index bbe27ab3b1fc3..f7c800927cb2f 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -747,6 +747,8 @@ static void wm_adsp2_init_debugfs(struct wm_adsp *dsp,
 static void wm_adsp2_cleanup_debugfs(struct wm_adsp *dsp)
 {
 	wm_adsp_debugfs_clear(dsp);
+	debugfs_remove_recursive(dsp->debugfs_root);
+	dsp->debugfs_root = NULL;
 }
 #else
 static inline void wm_adsp2_init_debugfs(struct wm_adsp *dsp,
-- 
2.11.0

