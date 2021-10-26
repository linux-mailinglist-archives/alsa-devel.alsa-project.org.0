Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF11943B2CD
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Oct 2021 14:59:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A5381723;
	Tue, 26 Oct 2021 14:58:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A5381723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635253174;
	bh=3BOO4ZJjmE2qxOFTZvErAZ7TfBjRYqtRjWkFJdDhwyw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=goLHq1qucAXc7dTyJxH+kZE4PXjpUMTGYZtEDmvytsk7D9n0BHM/Hhkqhu9qlPGj3
	 BBG83SEEZPgp5jWiH9bMR+0s/tYJTqYqu8ap931q59fT2Y1qGvuBzENmeXzeW4w0M5
	 1c6t60ofxWOoo58CQnG12GqZQ+F6My2kfltQs2to=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB4B5F802E7;
	Tue, 26 Oct 2021 14:57:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7ED3EF802E7; Tue, 26 Oct 2021 14:57:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0C0AF802E7
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 14:57:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0C0AF802E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Wgs78cGV"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19Q8sshc024219; 
 Tue, 26 Oct 2021 07:57:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=D/NsoehfT+y2ksi5yUQ330zicOFqX9TpEDxQN+UK6KQ=;
 b=Wgs78cGVYCcOSOtN2GVa7EOvju901nPVec8Kd58Ynt2a7xmtjiaqCGs6q/p/qVxkdT+2
 1+RtK/2dtFbHFrMXeQHLURN48mOezFGYKQHlj8GOPWV58e/6xOQ59kTTFV+fb1nA4vpx
 swTVvnShjwde9x9qMOaylxB8BZeUy9AKRfJ5REhDqBN2PjRdNvPZ7weMKpgk/6R6E9mw
 KOPvPN5hkJz1vYooVz8QfV/tHYMqkeIGY+tW8djINv8QYyLm+7IUWJuaJOa0ANpiCKPV
 Ct5wMxJARe+/v+ibgd/OVLz/gt3LeqAuhNSyAIiCmVH/+T+PHWr+DheASQC9qJ786Ltv hQ== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3bx4fx0rf2-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 26 Oct 2021 07:57:28 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Tue, 26 Oct
 2021 13:57:25 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Tue, 26 Oct 2021 13:57:25 +0100
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.65.32])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 71C2F11DB;
 Tue, 26 Oct 2021 12:57:25 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 2/2] ASoC: cs42l42: free_irq() before powering-down on probe()
 fail
Date: Tue, 26 Oct 2021 13:57:22 +0100
Message-ID: <20211026125722.10220-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211026125722.10220-1-rf@opensource.cirrus.com>
References: <20211026125722.10220-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: KHOYPb8xBrFSvRJKrnF6sMjDydp0e0rA
X-Proofpoint-ORIG-GUID: KHOYPb8xBrFSvRJKrnF6sMjDydp0e0rA
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

Relying on devm to free the irq handler on probe failure leaves a
small window of opportunity for an interrupt to become pending and
then the handler to run after the chip has been reset and powered
off.

For safety cs42l42_probe() should free the irq in the error path.
As the irq is now disabled by the driver in probe() and remove()
there is no point allocating it as a devres-managed item, so
convert to plain non-devres.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index dc12842ee6e1..1029f6b3eb48 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -2078,17 +2078,16 @@ static int cs42l42_i2c_probe(struct i2c_client *i2c_client,
 
 	/* Request IRQ if one was specified */
 	if (i2c_client->irq) {
-		ret = devm_request_threaded_irq(&i2c_client->dev,
-						i2c_client->irq,
-						NULL, cs42l42_irq_thread,
-						IRQF_ONESHOT | IRQF_TRIGGER_LOW,
-						"cs42l42", cs42l42);
+		ret = request_threaded_irq(i2c_client->irq,
+					   NULL, cs42l42_irq_thread,
+					   IRQF_ONESHOT | IRQF_TRIGGER_LOW,
+					   "cs42l42", cs42l42);
 		if (ret == -EPROBE_DEFER) {
-			goto err_disable;
+			goto err_disable_noirq;
 		} else if (ret != 0) {
 			dev_err(&i2c_client->dev,
 				"Failed to request IRQ: %d\n", ret);
-			goto err_disable;
+			goto err_disable_noirq;
 		}
 	}
 
@@ -2158,6 +2157,10 @@ static int cs42l42_i2c_probe(struct i2c_client *i2c_client,
 	regmap_write(cs42l42->regmap, CS42L42_PWR_CTL1, 0xff);
 
 err_disable:
+	if (i2c_client->irq)
+		free_irq(i2c_client->irq, cs42l42);
+
+err_disable_noirq:
 	gpiod_set_value_cansleep(cs42l42->reset_gpio, 0);
 err_disable_noreset:
 	regulator_bulk_disable(ARRAY_SIZE(cs42l42->supplies),
@@ -2170,7 +2173,7 @@ static int cs42l42_i2c_remove(struct i2c_client *i2c_client)
 	struct cs42l42_private *cs42l42 = i2c_get_clientdata(i2c_client);
 
 	if (i2c_client->irq)
-		devm_free_irq(&i2c_client->dev, i2c_client->irq, cs42l42);
+		free_irq(i2c_client->irq, cs42l42);
 
 	/*
 	 * The driver might not have control of reset and power supplies,
-- 
2.11.0

