Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 657EB32F15E
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Mar 2021 18:37:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AE1F1867;
	Fri,  5 Mar 2021 18:36:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AE1F1867
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614965851;
	bh=MCUGKN/GL8yfP1sD1MD3QUALoWYK1ui4K3clJNNz6WQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uVKfvxVZxwCOHHACT43DLAivH0Dezaop5hCNTTVlxQW9XVZPGqeDWvQr3wk84qYWM
	 0JNYOetHNjHmqgV8MDNVKYDloixRGr0eRQWW9gdpxTYFs0xgskwUfj9HhUtPyAUMcb
	 YPz3jfnDMJl831bb0YQvoyNe20fKJmTGz39On6Yo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DAD79F804A9;
	Fri,  5 Mar 2021 18:35:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A333F8025E; Fri,  5 Mar 2021 18:35:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,TVD_SUBJ_WIPE_DEBT,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13A71F800ED
 for <alsa-devel@alsa-project.org>; Fri,  5 Mar 2021 18:34:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13A71F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="lXCUJmoB"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 125HUg0j001824; Fri, 5 Mar 2021 11:34:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=11rGUtyJmP7HKLy3D23ZZDv+qF7JzV2QzjUhD9/jmAM=;
 b=lXCUJmoBcjWM0s+Q8Zc9QPXRs8K35BAoqPefGpHbuu5vNgALFRZlD8/4YjRMX1gOUHcT
 Ew0Urp/R7riigbQ4NsDcwyFayg6MGVzpvDFp6JVZQ3xtVuDilsze81GzdQ9fgA4dV/BK
 YJTncXxMHogVGtaKZ0z9THrLgR08omyn10OyT5xfkXo+VAipJ0LItQ3hXWz+YbVSrBL6
 kYsU4HvkluEeeVsklFSTies7WjwMYhfRbGYePpa1HsPoEbpBol2v2VuKzn6cURXlwDqx
 O5FVm3uL1NASG4KafPsWnnCsZh+soCxKy5vVtgB3X01cQbeQKBUkK2DIv0pyXk3l38s9 yQ== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 36ykctraxk-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 05 Mar 2021 11:34:48 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 5 Mar 2021
 17:34:47 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Fri, 5 Mar 2021 17:34:47 +0000
Received: from mail1.cirrus.com (unknown [198.61.64.35])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id CB87011D7;
 Fri,  5 Mar 2021 17:34:46 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: James Schulman <james.schulman@cirrus.com>, David Rhodes
 <david.rhodes@cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>
Subject: [PATCH v2 06/15] ASoC: cs42l42: Remove power if the driver is being
 removed
Date: Fri, 5 Mar 2021 17:34:33 +0000
Message-ID: <20210305173442.195740-7-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210305173442.195740-1-tanureal@opensource.cirrus.com>
References: <20210305173442.195740-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0
 mlxscore=0 impostorscore=0 mlxlogscore=842 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103050090
Cc: patches@opensource.cirrus.com,
 Richard Fitzgerald <rf@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 Lucas Tanure <tanureal@opensource.cirrus.com>, linux-kernel@vger.kernel.org
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

Ensure the power supplies are turned off when removing the driver

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---
Changes in v2:
- Use PM functions to shutdown the codec
- Disable IRQ before pm_suspend

 sound/soc/codecs/cs42l42.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 811b7b1c9732e..78274537a22af 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -25,6 +25,7 @@
 #include <linux/of.h>
 #include <linux/of_gpio.h>
 #include <linux/of_device.h>
+#include <linux/pm_runtime.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
@@ -1840,10 +1841,9 @@ static int cs42l42_i2c_probe(struct i2c_client *i2c_client,

 static int cs42l42_i2c_remove(struct i2c_client *i2c_client)
 {
-	struct cs42l42_private *cs42l42 = i2c_get_clientdata(i2c_client);
-
-	/* Hold down reset */
-	gpiod_set_value_cansleep(cs42l42->reset_gpio, 0);
+	disable_irq(i2c_client->irq);
+	pm_runtime_suspend(&i2c_client->dev);
+	pm_runtime_disable(&i2c_client->dev);

 	return 0;
 }
--
2.30.1

