Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 225344557AC
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 10:04:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC0A618B9;
	Thu, 18 Nov 2021 10:03:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC0A618B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637226246;
	bh=ko4fDejAcbn+nISFuyjsH/Pjhd0WP523x8orYQUhdYs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tLtlu7ZW3CaZg3cNirkWBuJ0bkbwNp5gmeyz6eS2iKVghd0MrysyxJb8Z1sjYc3NX
	 uSpd5E/of8C0Wp5aGvDlnAvSZauNybPgy6oofbFDZReBUpvwWSyQ3Jd8xoWv0TBbP6
	 A/5TXv/2b9T0ICnvGwIE0w0leMEoPlS6Dv6owSb4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00980F804F2;
	Thu, 18 Nov 2021 10:01:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE3D4F804F1; Thu, 18 Nov 2021 10:01:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8659F802C4
 for <alsa-devel@alsa-project.org>; Thu, 18 Nov 2021 10:01:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8659F802C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com
 header.b="ZRiI8D0U"
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AI7gMBW008365;
 Thu, 18 Nov 2021 10:01:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=cdPo19iAbIaC83Fonb3k8U/daSH+wXTAWbWwLOIFhls=;
 b=ZRiI8D0UivOYUfFBdX5npzKIgoB6ouPBIjwGddKd8rMha9M2BoiSaxp4La10XI3dCLUl
 Dfqcrs2Bu8CSl/9Rc7QzkwFFUkqmZozlbHTxNgYkazEh0cCiYlN/aj+h68vuO+1aeEsF
 yyySjCk+24OqsylEHPm0CGpyxDIgTdOUMdkALI5EqmD7ddBWri4eXjRNqhODzsfo6hnN
 ZeqYHJboW1OyAhc205iBZokKVKJYvTl0zuXn8aEpjXz6WxM+7f8tgM4bW42KPIKDEdq6
 jS5uPF4YI8SwJA9Eu7Oh3q/LMhBpEcbJIYOIZEsijJww+h8Mj2K2KXMCfznJB0JiKiXv ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cdjp68gry-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Nov 2021 10:01:28 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 303C8100038;
 Thu, 18 Nov 2021 10:01:28 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 263A721A234;
 Thu, 18 Nov 2021 10:01:28 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 18 Nov 2021 10:01:27
 +0100
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>, Jaroslav Kysela <perex@perex.cz>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Olivier Moysan
 <olivier.moysan@foss.st.com>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 2/3] ASoC: stm32: dfsdm: add pm_runtime support for audio
Date: Thu, 18 Nov 2021 10:00:34 +0100
Message-ID: <20211118090035.5331-3-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211118090035.5331-1-olivier.moysan@foss.st.com>
References: <20211118090035.5331-1-olivier.moysan@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-18_04,2021-11-17_01,2020-04-07_01
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
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

Enable support of pm_runtime on STM32 DFSDM audio driver
to allow power state monitoring.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 sound/soc/stm/stm32_adfsdm.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/soc/stm/stm32_adfsdm.c b/sound/soc/stm/stm32_adfsdm.c
index e6078f50e508..534f96af97c5 100644
--- a/sound/soc/stm/stm32_adfsdm.c
+++ b/sound/soc/stm/stm32_adfsdm.c
@@ -12,7 +12,7 @@
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
-
+#include <linux/pm_runtime.h>
 #include <linux/iio/iio.h>
 #include <linux/iio/consumer.h>
 #include <linux/iio/adc/stm32-dfsdm-adc.h>
@@ -363,15 +363,20 @@ static int stm32_adfsdm_probe(struct platform_device *pdev)
 #endif
 
 	ret = snd_soc_add_component(component, NULL, 0);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(&pdev->dev, "%s: Failed to register PCM platform\n",
 			__func__);
+		return ret;
+	}
 
-	return ret;
+	pm_runtime_enable(&pdev->dev);
+
+	return 0;
 }
 
 static int stm32_adfsdm_remove(struct platform_device *pdev)
 {
+	pm_runtime_disable(&pdev->dev);
 	snd_soc_unregister_component(&pdev->dev);
 
 	return 0;
-- 
2.17.1

