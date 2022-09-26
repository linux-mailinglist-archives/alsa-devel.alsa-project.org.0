Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB9D5EA805
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Sep 2022 16:09:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2083B15C3;
	Mon, 26 Sep 2022 16:09:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2083B15C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664201398;
	bh=FQOy2n4FfPcZ1x6wxvyrVgCknknHVlwZ3bETY/msl8k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P/W1z4DqSpytCyUnd9NIgn8ES9w5RPZhy5Wu8pRaiupL+88XlZTdJsb7FsM+TmBqW
	 mYdpdhO+3aLwfJrK1DiFgzuONfx40RZahquoNE0wJgvEEKN1oZhQ6JViCMYlsPLyG9
	 qUj4W4ypOhvvsTBRFrwbgpitqOamAAuFNnrqGqDY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23D45F8053A;
	Mon, 26 Sep 2022 16:08:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E959F80539; Mon, 26 Sep 2022 16:08:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12F85F8011C
 for <alsa-devel@alsa-project.org>; Mon, 26 Sep 2022 16:08:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12F85F8011C
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Mbl0C6RLpzHqTS;
 Mon, 26 Sep 2022 22:05:47 +0800 (CST)
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 26 Sep 2022 22:08:02 +0800
Received: from huawei.com (10.90.53.225) by kwepemm600014.china.huawei.com
 (7.193.23.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 26 Sep
 2022 22:08:02 +0800
From: Zhang Qilong <zhangqilong3@huawei.com>
To: <arnaud.pouliquen@foss.st.com>
Subject: [PATCH -next 1/2] ASoC: stm32: dfsdm: Fix PM disable depth imbalance
 in stm32_adfsdm_probe
Date: Mon, 26 Sep 2022 22:11:31 +0800
Message-ID: <20220926141132.124245-2-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
In-Reply-To: <20220926141132.124245-1-zhangqilong3@huawei.com>
References: <20220926141132.124245-1-zhangqilong3@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600014.china.huawei.com (7.193.23.54)
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, linux-stm32@st-md-mailman.stormreply.com
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

The pm_runtime_enable will increase power disable depth. Thus
a pairing decrement is needed on the error handling path to
keep it balanced according to context. We fix it by moving
pm_runtime_enable to the endding of stm32_adfsdm_probe.

Fixes:98e500a12f934 ("ASoC: stm32: dfsdm: add pm_runtime support for audio")
Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 sound/soc/stm/stm32_adfsdm.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/stm/stm32_adfsdm.c b/sound/soc/stm/stm32_adfsdm.c
index 04f2912e1418..643fc8a17018 100644
--- a/sound/soc/stm/stm32_adfsdm.c
+++ b/sound/soc/stm/stm32_adfsdm.c
@@ -335,8 +335,6 @@ static int stm32_adfsdm_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(&pdev->dev, priv);
 
-	pm_runtime_enable(&pdev->dev);
-
 	ret = devm_snd_soc_register_component(&pdev->dev,
 					      &stm32_adfsdm_dai_component,
 					      &priv->dai_drv, 1);
@@ -366,9 +364,13 @@ static int stm32_adfsdm_probe(struct platform_device *pdev)
 #endif
 
 	ret = snd_soc_add_component(component, NULL, 0);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(&pdev->dev, "%s: Failed to register PCM platform\n",
 			__func__);
+		return ret;
+	}
+
+	pm_runtime_enable(&pdev->dev);
 
 	return ret;
 }
-- 
2.25.1

