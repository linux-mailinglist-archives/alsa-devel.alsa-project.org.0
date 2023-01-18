Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BB267227C
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Jan 2023 17:06:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17EE05AF6;
	Wed, 18 Jan 2023 17:06:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17EE05AF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674058012;
	bh=F0MvsUPn9M+H9XbUc7/+LH1kqrdwkHJ6HCoGY/XW1Z0=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=MKHTjDukq4rOEVhcH1Vdjv6WwlwRKYcX/1rTV8dST+Mgls/RKMWiMBXVq1kXV7MVg
	 wQKlWlFPNAabWOaKFb2UXs3w5J5w3fdRwmUBYF9gTSrlYaRcJq/X5vXpWtX5NykIkQ
	 51J8v7kzcxfV5BV7i7rmQRBnZykTMvcenuMkIMjI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FD1CF80551;
	Wed, 18 Jan 2023 17:05:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89DB4F80548; Wed, 18 Jan 2023 17:05:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74211F8026D
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 17:05:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74211F8026D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=SoRyZtEW
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30IEEjlB023722; Wed, 18 Jan 2023 10:05:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=4DC3FmrYnv3q+s9o9tP2DW9U1wOvwrAGTeF6A0jvBHQ=;
 b=SoRyZtEWS0ZMCaGg/MbazhydcTToCQHnCi7BeNte9Dd5nEPp9FoRk1I1GjIm0ph4AEvf
 7mE7JIM2JYkMkwRvBTeEQttvDyUeaJCZACz39yzJHInM9sRlF7CuUZQWvSGhJ9zPGNXt
 iAy5QLIJnSrFC7Gnl8X9HqkhmJ8gNvG/orTs0ymCic3D1CJno3nWn4m+c/K7cdXRA+xm
 wy8cfNVxZkjLapoHGEr9O+Z4QDSSH9bjY7c5StuipDFnzVClxucUjAlHrR42oWlAb5Lf
 pF99rI61ds6Dw3Ko4hj8czopOjiUHAbydhs4ZjlxrZNkTGHx+e73EYZaJaO1uTvQR+ph Zg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3n3spx6vk8-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Jan 2023 10:05:04 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.21; Wed, 18 Jan
 2023 10:04:58 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.21 via
 Frontend Transport; Wed, 18 Jan 2023 10:04:58 -0600
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.202.160])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1A430B12;
 Wed, 18 Jan 2023 16:04:58 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH v2 8/8] ASoC: cs42l42: Wait for debounce interval after resume
Date: Wed, 18 Jan 2023 16:04:52 +0000
Message-ID: <20230118160452.2385494-9-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230118160452.2385494-1-sbinding@opensource.cirrus.com>
References: <20230118160452.2385494-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: WuLPwJpdk5cA3HpxRI6bjl3uXaEa2-Gz
X-Proofpoint-ORIG-GUID: WuLPwJpdk5cA3HpxRI6bjl3uXaEa2-Gz
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
index 67800b275e422..27653ea0f947c 100644
--- a/sound/soc/codecs/cs42l42-sdw.c
+++ b/sound/soc/codecs/cs42l42-sdw.c
@@ -451,14 +451,22 @@ static int __maybe_unused cs42l42_sdw_handle_unattach(struct cs42l42_private *cs
 
 static int __maybe_unused cs42l42_sdw_runtime_resume(struct device *dev)
 {
+	static const unsigned int ts_dbnce_ms[] = { 0, 125, 250, 500, 750, 1000, 1250, 1500};
 	struct cs42l42_private *cs42l42 = dev_get_drvdata(dev);
+	unsigned int dbnce;
 	int ret;
 
 	dev_dbg(dev, "Runtime resume\n");
 
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

