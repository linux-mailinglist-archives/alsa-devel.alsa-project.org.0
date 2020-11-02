Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C63152A3DF9
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 08:48:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54AB11767;
	Tue,  3 Nov 2020 08:47:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54AB11767
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604389725;
	bh=T+165QLrgXu6NY9kDdOJj9CbzRu3iu81XTbfFCT1plk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZLu3YIgz7jTa1bnvquvOi4Aq9J8HuP7sDJ8Q9waNNU1thM2NBvhsKmczSwqbw+SPW
	 5yKtih+TXMuBByVsoeUVAQ6B6zTjzaj0hEwU89F+bg8UedNKbT3I0SeMTnq6hZhHxt
	 sG6lcC4hsogwIgkd1425esdBriBuPWl/WGSXWgLs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23786F804DF;
	Tue,  3 Nov 2020 08:45:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D947AF80232; Mon,  2 Nov 2020 09:44:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3EB7F80083
 for <alsa-devel@alsa-project.org>; Mon,  2 Nov 2020 09:44:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3EB7F80083
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CPmfh5d72zkddh;
 Mon,  2 Nov 2020 16:43:56 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Mon, 2 Nov 2020
 16:43:53 +0800
From: Zhang Qilong <zhangqilong3@huawei.com>
To: <peter.ujfalusi@ti.com>, <perex@perex.cz>, <tiwai@suse.com>
Subject: [PATCH v2] ASoC: ti: davinci-mcasp: fix error handling in
 davinci_mcasp_probe
Date: Mon, 2 Nov 2020 16:54:36 +0800
Message-ID: <20201102085436.14450-1-zhangqilong3@huawei.com>
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

Forgetting to call pm_runtime_disable if davinci_mcasp_get_dt_params
failed in function davinci_mcasp_probe, and we should go to error
handling branch.

Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
Changelog:
V2
- changed the subject and fixed the description.
---
 sound/soc/ti/davinci-mcasp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index 4b46dd827f3f..ec90c23c9e20 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -2362,8 +2362,10 @@ static int davinci_mcasp_probe(struct platform_device *pdev)
 		goto err;
 
 	ret = davinci_mcasp_get_dt_params(mcasp);
-	if (ret)
-		return -EINVAL;
+	if (ret) {
+		ret = -EINVAL;
+		goto err;
+	}
 
 	ret = devm_snd_soc_register_component(&pdev->dev,
 					&davinci_mcasp_component,
-- 
2.17.1

