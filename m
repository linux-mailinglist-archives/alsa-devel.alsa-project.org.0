Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC86C599C47
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Aug 2022 14:56:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83D35165D;
	Fri, 19 Aug 2022 14:55:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83D35165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660913773;
	bh=S54zb0JN0Lmqd8fVYMmqNAQVJMBNAOd7QFj3BaAkkHs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KB8X6jNJWJJxB+0Emr6vjDl2SaU/UA2m//KhFnMa1kgFe6RIzF6SwifP3fDY0zn55
	 Cr0QS1Ebw/Q8Xc6sgDuFCzseP6tbr15qbBaQPmPQWZuRni6Ca1FHW23o6sdfg18q+b
	 OIGVhX6/bQhMDk2WfNH/SaOSYi7CYHOxmMWdyrDU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FE99F80579;
	Fri, 19 Aug 2022 14:53:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 371BFF80548; Fri, 19 Aug 2022 14:52:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2864DF8051F
 for <alsa-devel@alsa-project.org>; Fri, 19 Aug 2022 14:52:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2864DF8051F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="FQBCrOln"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27J5opPr018534;
 Fri, 19 Aug 2022 07:52:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=JrQz8U2kQSkG9W2JP8isxUQBimIOKpbs46CPxYXbzho=;
 b=FQBCrOlnyPFf2KyUBBjEriKswsGXkve1OAk30YFwF4lGe8zTIjB/h+nwGK5bBKHUdVjQ
 U84NRqvPVHoiM+9zPXcDo5b9OxJBQ1wa7K9Ci6PPnDuNo5ZTAYo1oABPI8t/NC8JeeFB
 9XVtN6jEUdsIDMqcKzune/JIEM6+F2u2F7Mq6HtRUovLqsOJkkchhD/Gfh7PvsY+CP2C
 7m7t1zzcFt/OTjX2k8oaSxX+GVja62bFDyUVTsXIA8mMXEXlSY/HN5Nm9Tsfnptn9Ax+
 rKnK3nWXVqTVHmOI+B3Y9pujRS3LJPpOMzeOhOmvxrHhCYYvTFKqwnvb6nqvWrulv/IO 6Q== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3hx9c1yrtp-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Aug 2022 07:52:39 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Fri, 19 Aug
 2022 07:52:34 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.9 via Frontend
 Transport; Fri, 19 Aug 2022 07:52:34 -0500
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.95])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id DF35EB0E;
 Fri, 19 Aug 2022 12:52:34 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 08/12] ASoC: cs42l42: Pass component and dai defs into common
 probe
Date: Fri, 19 Aug 2022 13:52:26 +0100
Message-ID: <20220819125230.42731-9-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220819125230.42731-1-rf@opensource.cirrus.com>
References: <20220819125230.42731-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Etj4c4q5FLOqg6QqrN5hFOQ0UtwdLEhA
X-Proofpoint-GUID: Etj4c4q5FLOqg6QqrN5hFOQ0UtwdLEhA
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

Pass pointers to snd_soc_component_driver and snd_soc_dai_driver
objects into cs42l42_common_probe().

This is in preparation for adding Soundwire support.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 54fe92b3d4da..a98b4e6a1f05 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -581,7 +581,7 @@ static int cs42l42_set_jack(struct snd_soc_component *component, struct snd_soc_
 	return 0;
 }
 
-static const struct snd_soc_component_driver soc_component_dev_cs42l42 = {
+static const struct snd_soc_component_driver cs42l42_soc_component = {
 	.set_jack		= cs42l42_set_jack,
 	.dapm_widgets		= cs42l42_dapm_widgets,
 	.num_dapm_widgets	= ARRAY_SIZE(cs42l42_dapm_widgets),
@@ -2235,7 +2235,9 @@ static int __maybe_unused cs42l42_i2c_resume(struct device *dev)
 	return 0;
 }
 
-static int cs42l42_common_probe(struct cs42l42_private *cs42l42)
+static int cs42l42_common_probe(struct cs42l42_private *cs42l42,
+				const struct snd_soc_component_driver *component_drv,
+				struct snd_soc_dai_driver *dai)
 {
 	int ret, i;
 
@@ -2293,9 +2295,7 @@ static int cs42l42_common_probe(struct cs42l42_private *cs42l42)
 	}
 
 	/* Register codec now so it can EPROBE_DEFER */
-	ret = devm_snd_soc_register_component(cs42l42->dev,
-					      &soc_component_dev_cs42l42,
-					      &cs42l42_dai, 1);
+	ret = devm_snd_soc_register_component(cs42l42->dev, component_drv, dai, 1);
 	if (ret < 0)
 		goto err;
 
@@ -2431,7 +2431,7 @@ static int cs42l42_i2c_probe(struct i2c_client *i2c_client)
 	cs42l42->regmap = regmap;
 	cs42l42->irq = i2c_client->irq;
 
-	ret = cs42l42_common_probe(cs42l42);
+	ret = cs42l42_common_probe(cs42l42, &cs42l42_soc_component, &cs42l42_dai);
 	if (ret)
 		return ret;
 
-- 
2.30.2

