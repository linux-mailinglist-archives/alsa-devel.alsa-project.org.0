Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFA82A3DFF
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 08:49:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFF4A177B;
	Tue,  3 Nov 2020 08:48:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFF4A177B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604389771;
	bh=hF/i5UPRGabjbFb2dKiCUCQ167JW1v+uYkoyrMCxntI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HErTiHnC3ZcZ/UCHCecDN/kZJ1MAKC3ipEQ5Mk5c6VfDe02ypCSsGQi/yy9PvACEu
	 jivBqqJehOtjdBkTcutqwpBlAvSzWYJ9j7c9Pv3+GEpWbcvw1L39gTkGKuCin2HvOs
	 UKNI00EsyA4GNS+BSbwt6jj2Za0Dk8ZL8+RkdT5Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C75D8F804E7;
	Tue,  3 Nov 2020 08:45:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0170EF80232; Mon,  2 Nov 2020 11:24:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22AD0F8012B
 for <alsa-devel@alsa-project.org>; Mon,  2 Nov 2020 11:23:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22AD0F8012B
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CPpst6qy1zLqtF;
 Mon,  2 Nov 2020 18:23:46 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Mon, 2 Nov 2020
 18:23:44 +0800
From: Zhang Qilong <zhangqilong3@huawei.com>
To: <peter.ujfalusi@ti.com>, <perex@perex.cz>, <tiwai@suse.com>
Subject: [PATCH] ASoC: ti: davinci-mcasp: remove always zero of
 davinci_mcasp_get_dt_params
Date: Mon, 2 Nov 2020 18:34:28 +0800
Message-ID: <20201102103428.32678-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:45:21 +0100
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, lgirdwood@gmail.com
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

davinci_mcasp_get_dt_params alway return zero, and its return value
could be ignored by the caller. So make it 'void' type to avoid the
check its return value.

Fixes: 764958f2b5239 ("ASoC: ti: davinci-mcasp: Support for auxclk-fs-ratio")
Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 sound/soc/ti/davinci-mcasp.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index 4b46dd827f3f..63c492862383 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -2112,20 +2112,18 @@ static inline int davinci_mcasp_init_gpiochip(struct davinci_mcasp *mcasp)
 }
 #endif /* CONFIG_GPIOLIB */
 
-static int davinci_mcasp_get_dt_params(struct davinci_mcasp *mcasp)
+static void davinci_mcasp_get_dt_params(struct davinci_mcasp *mcasp)
 {
 	struct device_node *np = mcasp->dev->of_node;
 	int ret;
 	u32 val;
 
 	if (!np)
-		return 0;
+		return;
 
 	ret = of_property_read_u32(np, "auxclk-fs-ratio", &val);
 	if (ret >= 0)
 		mcasp->auxclk_fs_ratio = val;
-
-	return 0;
 }
 
 static int davinci_mcasp_probe(struct platform_device *pdev)
@@ -2361,9 +2359,7 @@ static int davinci_mcasp_probe(struct platform_device *pdev)
 	if (ret)
 		goto err;
 
-	ret = davinci_mcasp_get_dt_params(mcasp);
-	if (ret)
-		return -EINVAL;
+	davinci_mcasp_get_dt_params(mcasp);
 
 	ret = devm_snd_soc_register_component(&pdev->dev,
 					&davinci_mcasp_component,
-- 
2.17.1

