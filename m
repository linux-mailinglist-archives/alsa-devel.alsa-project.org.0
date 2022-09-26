Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6595E9D0E
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Sep 2022 11:12:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79AC1822;
	Mon, 26 Sep 2022 11:11:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79AC1822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664183536;
	bh=1LuyQQrZZAL2GiIruwXb/bvMePECuinaGh+hji1jscg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kybV2Qd+36bjyxgkTK3pHtM246r0XilgyRTJvgESDHr8pN0qoqXvo4OUFHaVq5ygS
	 ouU0nHJoEQrya4GeRTVtcqAHfsf50HN1MJJCBZgduwgcY5TbRDRrtCXH4t9ueJnRRK
	 78nvdd6P1VJafnXsC5TUnPVMcGXO8etx/IkDV4rw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71866F802BE;
	Mon, 26 Sep 2022 11:11:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7A4CF8027D; Mon, 26 Sep 2022 11:11:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AEF23F80134
 for <alsa-devel@alsa-project.org>; Mon, 26 Sep 2022 11:11:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEF23F80134
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MbcMb0h3NzWh51;
 Mon, 26 Sep 2022 17:07:07 +0800 (CST)
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 26 Sep 2022 17:11:10 +0800
Received: from huawei.com (10.90.53.225) by kwepemm600014.china.huawei.com
 (7.193.23.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 26 Sep
 2022 17:11:09 +0800
From: Zhang Qilong <zhangqilong3@huawei.com>
To: <olivier.moysan@foss.st.com>, <arnaud.pouliquen@foss.st.com>,
 <perex@perex.cz>, <tiwai@suse.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>
Subject: [PATCH -next] ASoC: stm: Fix PM disable depth imbalance in
 stm32_i2s_probe
Date: Mon, 26 Sep 2022 17:14:39 +0800
Message-ID: <20220926091439.103839-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
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
keep it balanced according to context.

Fixes:efc162cbd480f ("ASoC: stm: Use dev_err_probe() helper")
Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 sound/soc/stm/stm32_i2s.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
index 6aafe793eec4..5a717443b105 100644
--- a/sound/soc/stm/stm32_i2s.c
+++ b/sound/soc/stm/stm32_i2s.c
@@ -1139,12 +1139,15 @@ static int stm32_i2s_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	ret = snd_dmaengine_pcm_register(&pdev->dev, &stm32_i2s_pcm_config, 0);
-	if (ret)
+	if (ret) {
+		pm_runtime_disable(&pdev->dev);
 		return dev_err_probe(&pdev->dev, ret, "PCM DMA register error\n");
+	}
 
 	ret = snd_soc_register_component(&pdev->dev, &stm32_i2s_component,
 					 i2s->dai_drv, 1);
 	if (ret) {
+		pm_runtime_disable(&pdev->dev);
 		snd_dmaengine_pcm_unregister(&pdev->dev);
 		return ret;
 	}
-- 
2.25.1

