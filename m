Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2546534804
	for <lists+alsa-devel@lfdr.de>; Thu, 26 May 2022 03:19:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 747DD169B;
	Thu, 26 May 2022 03:18:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 747DD169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653527954;
	bh=4RewC3rxKO8odOfe84p93/6VPHXzhQLtySzWjoZkp0A=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DOLTMQX5jWZ4bSYe32ZdpzW1e85WqqVL6q8NhI8TnMv02BubKma/3rPT0DkNP2Pdq
	 DU4zRJKivb6ydczKf53rRrEYGd0RsXLp44jVRsSI4Vm8FJ8M6xq4F80spSeZq83wEv
	 qH1EzBJKdPSRJVbFUHJOUGiibT/T/UF7RX7T2c7U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2B45F801EC;
	Thu, 26 May 2022 03:18:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83B2BF8016D; Thu, 26 May 2022 03:18:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F012F80169
 for <alsa-devel@alsa-project.org>; Thu, 26 May 2022 03:18:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F012F80169
Received: from kwepemi500007.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4L7qn06fjHzDqPh;
 Thu, 26 May 2022 09:17:56 +0800 (CST)
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 kwepemi500007.china.huawei.com (7.221.188.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 26 May 2022 09:18:01 +0800
Received: from huawei.com (10.90.53.225) by kwepemm600014.china.huawei.com
 (7.193.23.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 26 May
 2022 09:18:00 +0800
From: zhangqilong <zhangqilong3@huawei.com>
To: <shengjiu.wang@gmail.com>, <Xiubo.Lee@gmail.com>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH] ASoC: fsl_xcvr:Fix unbalanced pm_runtime_enable in
 fsl_xcvr_probe
Date: Thu, 26 May 2022 09:19:58 +0800
Message-ID: <20220526011958.139391-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
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

Add missing pm_runtime_disable() when probe error out. It could
avoid pm_runtime implementation complains when removing and probing
again the driver.

Fix:c590fa80b3928 ("ASoC: fsl_xcvr: register platform component before registering cpu dai")
Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 sound/soc/fsl/fsl_xcvr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index d0556c79fdb1..907435efe121 100644
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
-- 
2.31.1

