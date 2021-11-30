Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E8F463102
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Nov 2021 11:30:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B74401F0B;
	Tue, 30 Nov 2021 11:29:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B74401F0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638268217;
	bh=ZZEFpGkpqCZ0sO4T/Ry8XBjQAd1HweLakI8+fCpqY2Q=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RgPF686zXlZunVLuleg2FccUEOXKJNyIuvu+53DAlQFoSYZhuSHugKenK28lkkMbv
	 vNyMaXgWh/zNWn62r5TmsH9io/IkBcxQQZlqrYmEVIMzoVFubqxOGmjMfcUGpgwEcg
	 uD7O+sAlMgj3uTO3z2ymaov4jqv0jZ7DpWHmUEJw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFF33F802A0;
	Tue, 30 Nov 2021 11:29:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84124F80290; Tue, 30 Nov 2021 11:28:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29FA7F80113
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 11:28:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29FA7F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Gpkj7jM1"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AU5vsTx023847;
 Tue, 30 Nov 2021 04:28:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type;
 s=PODMain02222019; bh=JJ1tmyfHUkXd3NAET0F0ORATVkVqhTi2furg5xv8UUI=;
 b=Gpkj7jM1sGDsJTHvjvwdyCtNgV8PJ6GEkLqUib2LtVSOfYiMo8kp2oeEgF/bmCKkGu13
 r3xXsZnvIFe8C1GQR1HN9/BL6QFGWjy5JiCAps1amLpNLENRYC/A2H7L0x8v8TNgBUdj
 +GEJN+ppDe1WveQp3SW481fRfuF+XPDwZNkFNqL5crBIByk4z5bC9JgvJBNfyD62EPR/
 mOMmf4Wp/2/sy3etETkgD9GszhHAYcgzlbu6rO8tzd2rbFhwCALFm2kyhx9FLceoZImH
 EUiR7i/GhLALisuBNWEPKPveN9U5+cSMiavMgj3lJa6IYhBRNS6vJD0eq7hC3CfYyp0u LA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3cmv5u1e37-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 30 Nov 2021 04:28:44 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 30 Nov
 2021 10:28:42 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Tue, 30 Nov 2021 10:28:42 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B81972A9;
 Tue, 30 Nov 2021 10:28:42 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH] firmware: cs_dsp: Move lockdep asserts to avoid potential
 null pointer
Date: Tue, 30 Nov 2021 10:28:42 +0000
Message-ID: <20211130102842.26410-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: 6kzClnTwx6vwFpPSZTvSPSPSI-9pE1oJ
X-Proofpoint-ORIG-GUID: 6kzClnTwx6vwFpPSZTvSPSPSI-9pE1oJ
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com
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

Move the lockdep asserts until after the ctl pointer has been checked
for NULL, to avoid potentially NULL pointer dereferences.

Fixes: fb2f364fb5b9 ("firmware: cs_dsp: Add lockdep asserts to interface functions")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/firmware/cirrus/cs_dsp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index 3814cbba0a544..5af8171d6cedf 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -759,11 +759,11 @@ int cs_dsp_coeff_write_ctrl(struct cs_dsp_coeff_ctl *ctl,
 {
 	int ret = 0;
 
-	lockdep_assert_held(&ctl->dsp->pwr_lock);
-
 	if (!ctl)
 		return -ENOENT;
 
+	lockdep_assert_held(&ctl->dsp->pwr_lock);
+
 	if (len + off * sizeof(u32) > ctl->len)
 		return -EINVAL;
 
@@ -827,11 +827,11 @@ int cs_dsp_coeff_read_ctrl(struct cs_dsp_coeff_ctl *ctl,
 {
 	int ret = 0;
 
-	lockdep_assert_held(&ctl->dsp->pwr_lock);
-
 	if (!ctl)
 		return -ENOENT;
 
+	lockdep_assert_held(&ctl->dsp->pwr_lock);
+
 	if (len + off * sizeof(u32) > ctl->len)
 		return -EINVAL;
 
-- 
2.11.0

