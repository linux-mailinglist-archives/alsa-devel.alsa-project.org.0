Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D1467EBAD
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 17:54:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3C00EBC;
	Fri, 27 Jan 2023 17:53:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3C00EBC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674838480;
	bh=pRrzuFU0Sdj+BiG397B0vyKGZ1+du5sFUArMrs5a2Mw=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=UDH2QjfWynQQHEVM15TvZ/rw/Oms2mZAOYJnzjq3ZkpFeuDzmUqV/BmKIJy1f/oI+
	 AVCtLjzFowmluZIQuP+y739RTj0KQQcodOq3AzFgaCHzvzitPAYelroWkQSTIrAwkq
	 vTLgfwMLneeWAi3GDYFZmmGw+9gykw1V+krdIuRY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 664ECF8057C;
	Fri, 27 Jan 2023 17:51:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3926F80553; Fri, 27 Jan 2023 17:51:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 953CDF801F7
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 17:51:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 953CDF801F7
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=jFZbsW3f
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30R9k8LV030633; Fri, 27 Jan 2023 10:51:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=U/maz5mq7SDVzaMNMiD4HWoXA0LOACVlnq93oey3UBM=;
 b=jFZbsW3fNWzSXVtTVtqLfUylJ9G7+7ANLZnP8Fy7QfjqoytQ3y4dVLbB2b66TPRQkPCW
 f1vjkw8ho825Slg7jsN0yqcyBu6Pr2Hbe93V+aIFFD+u2xfYgvx9+tKKD7kf4k+n7etV
 k795p3z8r7Ihi2lbJArz/vrKvgaVdp6Kpfi9lE2fexx4+dueuFknxR5rMWPOARPflOdR
 clMQMg9eezpXoYafE+9Q+afJ7KuQP586gVnFgaBkKBxp0JTpvCMhxfszGNNGs7+3zC3G
 VK9WNWEUkAeIJNcAXzyoF2zDwxgyQyummbKogQMUKq9sGp8QvZ3SU8W2uDAUN2o5ZLGr oA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3n8dbsvrd1-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Jan 2023 10:51:33 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.21; Fri, 27 Jan
 2023 10:51:29 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.7 via Frontend Transport; Fri, 27 Jan 2023 10:51:29 -0600
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.202.160])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7E92511DC;
 Fri, 27 Jan 2023 16:51:29 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH v3 8/8] ASoC: cs42l42: Wait for debounce interval after resume
Date: Fri, 27 Jan 2023 16:51:11 +0000
Message-ID: <20230127165111.3010960-9-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127165111.3010960-1-sbinding@opensource.cirrus.com>
References: <20230127165111.3010960-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: aAvAmRBgvSBVNp_iapDEzhgWA-nkGonO
X-Proofpoint-GUID: aAvAmRBgvSBVNp_iapDEzhgWA-nkGonO
X-Proofpoint-Spam-Reason: safe
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Stefan Binding <sbinding@opensource.cirrus.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Since clock stop causes bus reset on Intel controllers, we need
to wait for the debounce interval on resume, to ensure all the
interrupt status registers are set correctly.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42-sdw.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l42-sdw.c b/sound/soc/codecs/cs42l42-sdw.c
index 0de370b40eaf0..79023268d4c1b 100644
--- a/sound/soc/codecs/cs42l42-sdw.c
+++ b/sound/soc/codecs/cs42l42-sdw.c
@@ -447,7 +447,9 @@ static int __maybe_unused cs42l42_sdw_handle_unattach(struct cs42l42_private *cs
 
 static int __maybe_unused cs42l42_sdw_runtime_resume(struct device *dev)
 {
+	static const unsigned int ts_dbnce_ms[] = { 0, 125, 250, 500, 750, 1000, 1250, 1500};
 	struct cs42l42_private *cs42l42 = dev_get_drvdata(dev);
+	unsigned int dbnce;
 	int ret;
 
 	dev_dbg(dev, "Runtime resume\n");
@@ -456,8 +458,14 @@ static int __maybe_unused cs42l42_sdw_runtime_resume(struct device *dev)
 		return 0;
 
 	ret = cs42l42_sdw_handle_unattach(cs42l42);
-	if (ret < 0)
+	if (ret < 0) {
 		return ret;
+	} else if (ret > 0) {
+		dbnce = max(cs42l42->ts_dbnc_rise, cs42l42->ts_dbnc_fall);
+
+		if (dbnce > 0)
+			msleep(ts_dbnce_ms[dbnce]);
+	}
 
 	regcache_cache_only(cs42l42->regmap, false);
 
-- 
2.34.1

