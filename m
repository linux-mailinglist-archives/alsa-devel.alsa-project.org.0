Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C015552F9C
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jun 2022 12:22:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB84A2015;
	Tue, 21 Jun 2022 12:21:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB84A2015
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655806957;
	bh=GBCxH+bK9wmVyOKCOK+iwHCktIPrGpVkdEP/zPhhvUc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kY0o3BwvrJmISv4JqQC+iyG5EKvlOUwfU4Y20bDkgiU+UqnhORQsD2hLMjckDzyEE
	 eOkOpSw4UpjHjFQO08tnNAm+DVcKGlv5jC3QekxqYDCkyQcWt2e7MArjp0/LZ/Q8Co
	 NDhxff7il0sHmkqcfiyj2NmClFVweop5OtB7RNHk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCA87F80536;
	Tue, 21 Jun 2022 12:21:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C29DEF804E2; Tue, 21 Jun 2022 12:20:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67AF7F80104
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 12:20:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67AF7F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="bN+0DqAi"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25L7wQ91011194;
 Tue, 21 Jun 2022 05:20:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=2mwJv9rwDuzZlDeF4gMWLOnhM+pmeWicS1501ixazNo=;
 b=bN+0DqAiRkRtSrCCmKIBrG4hUMuipP+Os6qXUIdc99aK0iP0Nqm/BLOMpAscP+V2e0cD
 hoWMC7VCiQL8sce2s14P3LYEPhvzWPhaaz+427PZZ0Vi6EbCd2kWsJye3wZNJq8IYAth
 5/gh7xVeU9L1a0c9h81gIyR7J1xkxMtPkv2V5Ucblq9GfNZcN7ur/VWvIfdRwZ4813BT
 DL4VvVF+NJtwefE5jo9+Q1GLcdBwC1CdRtWBwbI4SBiA7eg45rfvS/eQC6iv2fucTaa4
 jHg0hMhbh4mlwYXZbGcJKTuZH4MjbqxlxyW6DP1nYNGQ8gvE3kq6YLxPAqRCPKlapq3g 3w== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gsc41bcxp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 21 Jun 2022 05:20:44 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 21 Jun
 2022 11:20:42 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Tue, 21 Jun 2022 11:20:42 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id F30CB468;
 Tue, 21 Jun 2022 10:20:41 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 1/4] ASoC: wm_adsp: Fix event for preloader
Date: Tue, 21 Jun 2022 11:20:38 +0100
Message-ID: <20220621102041.1713504-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: yVUhF6T4VUVGuObReVv-rz9jW_aiEL8P
X-Proofpoint-ORIG-GUID: yVUhF6T4VUVGuObReVv-rz9jW_aiEL8P
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, david.rhodes@cirrus.com, james.schulman@cirrus.com,
 linux-kernel@vger.kernel.org
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

The preloader controls on ADSP should return a value of 1 if the
preloader value was changed, update to correct this.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 6d7fd88243aa8..a7784ac15dde6 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -997,7 +997,7 @@ int wm_adsp2_preloader_put(struct snd_kcontrol *kcontrol,
 		snd_soc_dapm_sync(dapm);
 	}
 
-	return 0;
+	return 1;
 }
 EXPORT_SYMBOL_GPL(wm_adsp2_preloader_put);
 
-- 
2.30.2

