Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A323B265B4C
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Sep 2020 10:17:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FA8B167A;
	Fri, 11 Sep 2020 10:16:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FA8B167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599812222;
	bh=FsRDknh9pz2A7bLV+gVdGVBIG0mYveftSB2pX/3K6P4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uXXnqIfaIRZgUcrbI7dclKSB2c/DFOSaHMdl6Ut6CO7AreoKFo8/YZ7WFHEHGtQsI
	 pZtT6RUa1MRRChYu/oahZhljTM+GJojx0VmBT8b9n215Jrg6Kd1x5S/+tzVMy/0Ur+
	 S4lYPFvVQX8mWjfzYiNprUyifDSsf7ZUjOGDH8jU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38800F800E9;
	Fri, 11 Sep 2020 10:15:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9759F80227; Fri, 11 Sep 2020 10:15:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4977FF80115
 for <alsa-devel@alsa-project.org>; Fri, 11 Sep 2020 10:15:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4977FF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="ebqbjyKT"
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08B87lQR003143; Fri, 11 Sep 2020 10:15:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=tIOlnbAKWQu2aJOslivWEU73AEic3d7q5RRGup+Q4RA=;
 b=ebqbjyKTK35dpUhKhRfw0A4aX24JhezA4xX5kLmgnbb9yjSTiIIbRh3tMV5lA3ouWqJA
 ftqQKc7gJ0rXVsu/Yr42sBlp+yxWsXNPJmABNeynOaDv1JGi/HUrrlTxgslPEaJmRAm4
 v98tTM2OR66tlbAb++E+Q2/sm3a74CNZcZBPnLLQv0OXeRjg5xCfF+zSxuHlOcdCzQ31
 chPAnA+7RnfdniITyrdiAcse5LNypec/Ykxsoiv7tsU+N62zyorNrU32DskQH/wbcZFA
 FppEieofoPPzpMhQPjwYL3V3PZcI0oT+zNbVhXtXItrF0mj3xQoVxop1C0yVTsxKNyH7 MQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33c1jfg8ue-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Sep 2020 10:15:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7B1DA10002A;
 Fri, 11 Sep 2020 10:15:10 +0200 (CEST)
Received: from Webmail-eu.st.com (gpxdag6node5.st.com [10.75.127.81])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1F58A21E254;
 Fri, 11 Sep 2020 10:15:10 +0200 (CEST)
Received: from localhost (10.75.127.46) by GPXDAG6NODE5.st.com (10.75.127.81)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 11 Sep 2020 10:15:09 +0200
From: Olivier Moysan <olivier.moysan@st.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <alexandre.torgue@st.com>, <olivier.moysan@st.com>,
 <arnaud.pouliquen@st.com>
Subject: [PATCH] ASoC: stm32: sai: add pm_runtime support
Date: Fri, 11 Sep 2020 10:15:07 +0200
Message-ID: <20200911081507.7276-1-olivier.moysan@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To GPXDAG6NODE5.st.com
 (10.75.127.81)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-11_02:2020-09-10,
 2020-09-11 signatures=0
Cc: alsa-devel@alsa-project.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

Enable support of pm_runtime on STM32 SAI driver to allow
SAI power state monitoring.
pm_runtime_put_autosuspend() is called from ASoC framework
on pcm device close.
The pmdown_time delay is available in runtime context, and may be set
in SAI driver to take into account shutdown delay on playback.
However, this shutdown delay is already handled in the DAPMs
of the audio codec linked to SAI CPU DAI.
So, the choice is made, not to support this delay on CPU DAI side.

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
 sound/soc/stm/stm32_sai_sub.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index 3fb9513cedb2..3aa1cf262402 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <sound/asoundef.h>
@@ -1559,10 +1560,14 @@ static int stm32_sai_sub_probe(struct platform_device *pdev)
 
 	ret = snd_soc_register_component(&pdev->dev, &stm32_component,
 					 &sai->cpu_dai_drv, 1);
-	if (ret)
+	if (ret) {
 		snd_dmaengine_pcm_unregister(&pdev->dev);
+		return ret;
+	}
 
-	return ret;
+	pm_runtime_enable(&pdev->dev);
+
+	return 0;
 }
 
 static int stm32_sai_sub_remove(struct platform_device *pdev)
@@ -1572,6 +1577,7 @@ static int stm32_sai_sub_remove(struct platform_device *pdev)
 	clk_unprepare(sai->pdata->pclk);
 	snd_dmaengine_pcm_unregister(&pdev->dev);
 	snd_soc_unregister_component(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
 
 	return 0;
 }
-- 
2.17.1

