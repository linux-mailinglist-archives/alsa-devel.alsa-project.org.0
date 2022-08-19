Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D839D599C44
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Aug 2022 14:55:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 811941684;
	Fri, 19 Aug 2022 14:54:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 811941684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660913747;
	bh=D1kHjFDGWR55eI090Igh4yS/xGLuhWZKvwKl3OC4GGM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DNuJCWO4pJTBGgWQpZvMpR9VAyF0FAbECal73zi4rkuOyRg/Ysw5aEV3pNlDjGnh4
	 kUxMxtVS95nZUoTIy8pZ/UMhcRLVIw8QIqveNBNY/nnba3rR4xUYAzd4z9xC+LAo2A
	 0npuxJ41SECQ0A4hqSm4+KOgUUHWKwUJczYCJQnM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BFE4F8055C;
	Fri, 19 Aug 2022 14:53:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8FF39F802A0; Fri, 19 Aug 2022 14:52:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42E91F80217
 for <alsa-devel@alsa-project.org>; Fri, 19 Aug 2022 14:52:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42E91F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="q1RjZTQ0"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27J5opPq018534;
 Fri, 19 Aug 2022 07:52:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=+gFYFK2eJJEQkMu7BpUm9DSh8dHugunj12u4pVcE2IU=;
 b=q1RjZTQ0Aj4+EjAcAmUALLbzXX90u9GIl0PJHfGOFyOVsY1x3avmgAmKQSb3tm1blv+1
 87eZdoh5gDN1/q7hvHJhdRl55Mcc9IukYNFloeGcMlKV5oY1RDUFIx+8G9WFvFiPD0Fl
 cIxL5ruScTpCWo7515dAyUxWyHZAIZvwzNTPqxfN0ZW4xyXUhdBf1VgPcz5nlFtN7U7P
 e/0ZQtoI4xNHLuFVq9voRB+vtDeo9BLvdHcShrg6aiFpoRpTxl/zaaMUAL6DIU8H0Vum
 upEOiwoUnLLQifGYKj3UgGKz3eABAEiOMyF6LumJw6NBVev6bAtL0WsFlLNRwiRh7o3X UA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3hx9c1yrtp-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Aug 2022 07:52:38 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Fri, 19 Aug
 2022 07:52:34 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.9 via Frontend
 Transport; Fri, 19 Aug 2022 07:52:34 -0500
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.95])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D1AB57C;
 Fri, 19 Aug 2022 12:52:34 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 07/12] ASoC: cs42l42: Split cs42l42_resume into two functions
Date: Fri, 19 Aug 2022 13:52:25 +0100
Message-ID: <20220819125230.42731-8-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220819125230.42731-1-rf@opensource.cirrus.com>
References: <20220819125230.42731-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: JJqG-086Y1AL889Nmp1m-P6S33t_WIV-
X-Proofpoint-GUID: JJqG-086Y1AL889Nmp1m-P6S33t_WIV-
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

On Soundwire the system resume cannot restore registers until the
host controller has re-enumerated the peripheral.

This patch splits cs42l42_resume() into two functions, one to
power up and the other to restore registers, ready for adding
Soundwire support.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 8c5909a43df6..54fe92b3d4da 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -2199,6 +2199,15 @@ static int __maybe_unused cs42l42_resume(struct device *dev)
 	gpiod_set_value_cansleep(cs42l42->reset_gpio, 1);
 	usleep_range(CS42L42_BOOT_TIME_US, CS42L42_BOOT_TIME_US * 2);
 
+	dev_dbg(dev, "System resume powered up\n");
+
+	return 0;
+}
+
+static void __maybe_unused cs42l42_resume_restore(struct device *dev)
+{
+	struct cs42l42_private *cs42l42 = dev_get_drvdata(dev);
+
 	regcache_cache_only(cs42l42->regmap, false);
 	regcache_mark_dirty(cs42l42->regmap);
 
@@ -2211,6 +2220,17 @@ static int __maybe_unused cs42l42_resume(struct device *dev)
 	mutex_unlock(&cs42l42->irq_lock);
 
 	dev_dbg(dev, "System resumed\n");
+}
+
+static int __maybe_unused cs42l42_i2c_resume(struct device *dev)
+{
+	int ret;
+
+	ret = cs42l42_resume(dev);
+	if (ret)
+		return ret;
+
+	cs42l42_resume_restore(dev);
 
 	return 0;
 }
@@ -2428,7 +2448,7 @@ static int cs42l42_i2c_remove(struct i2c_client *i2c_client)
 }
 
 static const struct dev_pm_ops cs42l42_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(cs42l42_suspend, cs42l42_resume)
+	SET_SYSTEM_SLEEP_PM_OPS(cs42l42_suspend, cs42l42_i2c_resume)
 };
 
 #ifdef CONFIG_OF
-- 
2.30.2

