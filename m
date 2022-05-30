Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C4153768A
	for <lists+alsa-devel@lfdr.de>; Mon, 30 May 2022 10:34:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45E20190C;
	Mon, 30 May 2022 10:33:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45E20190C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653899688;
	bh=C4zO2QlO4SIEBGVM7LoZle0u842hhkSCreblw5Z7sxw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Y2lns5GwTMmmzcxv1ppvbLJArY5/BedJBIUJdujzO+CG+KMu+Im4lohM9vVooClBx
	 leYewi3B+VY7vecUqgBq9afwOa0W6ALW+iZncjH2g6B5qHDiWYH4OHGH6qLl957DdN
	 qJ/vmaB62ldXZ7fWkl+QqPGbRA2HojgteU0jRliY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D026CF801F5;
	Mon, 30 May 2022 10:33:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02C81F8019D; Mon, 30 May 2022 10:33:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28B8DF80124
 for <alsa-devel@alsa-project.org>; Mon, 30 May 2022 10:33:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28B8DF80124
Received: from kwepemi100002.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4LBTD0012Jz1JCSR;
 Mon, 30 May 2022 16:31:59 +0800 (CST)
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 kwepemi100002.china.huawei.com (7.221.188.188) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 30 May 2022 16:33:36 +0800
Received: from huawei.com (10.90.53.225) by kwepemm600014.china.huawei.com
 (7.193.23.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 30 May
 2022 16:33:36 +0800
From: zhangqilong <zhangqilong3@huawei.com>
To: <shengjiu.wang@gmail.com>, <Xiubo.Lee@gmail.com>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH V2] ASoC: fsl_xcvr:Fix unbalanced pm_runtime_enable in
 fsl_xcvr_probe
Date: Mon, 30 May 2022 16:35:33 +0800
Message-ID: <20220530083533.52254-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600014.china.huawei.com (7.193.23.54)
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, festevam@gmail.com, lgirdwood@gmail.com,
 nicoleotsuka@gmail.com, broonie@kernel.org, linuxppc-dev@lists.ozlabs.org
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

a) Add missing pm_runtime_disable() when probe error out. It could
avoid pm_runtime implementation complains when removing and probing
again the driver.
b) Add remove for missing pm_runtime_disable().

v2: add remove to put PM usage counter.

Fix:c590fa80b3928 ("ASoC: fsl_xcvr: register platform component before registering cpu dai")
Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 sound/soc/fsl/fsl_xcvr.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index d0556c79fdb1..55e640cba87d 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -1228,6 +1228,7 @@ static int fsl_xcvr_probe(struct platform_device *pdev)
 	 */
 	ret = devm_snd_dmaengine_pcm_register(dev, NULL, 0);
 	if (ret) {
+		pm_runtime_disable(dev);
 		dev_err(dev, "failed to pcm register\n");
 		return ret;
 	}
@@ -1235,6 +1236,7 @@ static int fsl_xcvr_probe(struct platform_device *pdev)
 	ret = devm_snd_soc_register_component(dev, &fsl_xcvr_comp,
 					      &fsl_xcvr_dai, 1);
 	if (ret) {
+		pm_runtime_disable(dev);
 		dev_err(dev, "failed to register component %s\n",
 			fsl_xcvr_comp.name);
 	}
@@ -1242,6 +1244,12 @@ static int fsl_xcvr_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static int fsl_xcvr_remove(struct platform_device *pdev)
+{
+	pm_runtime_disable(&pdev->dev);
+	return 0;
+}
+
 static __maybe_unused int fsl_xcvr_runtime_suspend(struct device *dev)
 {
 	struct fsl_xcvr *xcvr = dev_get_drvdata(dev);
@@ -1370,6 +1378,7 @@ static struct platform_driver fsl_xcvr_driver = {
 		.pm = &fsl_xcvr_pm_ops,
 		.of_match_table = fsl_xcvr_dt_ids,
 	},
+	.remove = fsl_xcvr_remove,
 };
 module_platform_driver(fsl_xcvr_driver);
 
-- 
2.31.1

