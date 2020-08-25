Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B51254B32
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Aug 2020 18:53:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF9B51807;
	Thu, 27 Aug 2020 18:52:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF9B51807
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598547195;
	bh=L88pFTpchMsVubaA+VBmq2hT5ntYTwzZElsg/EdPKlk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I5gMP8GVf9A6P/FAk+oCGidEPagzhItsJOOlaOQJTd1gE5SzUUsIgAELEqTnyo5d5
	 ZLML3RxZN+Cw8/6bTJtrQyHDhdOY/lu2w2HzYeFGjx2q3a5xdQ/mGqYDRAWt1HtHma
	 FQS6oO62LH0VmFtko4lPKdGZl+ksOlaWRxgDPkrY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BD51F80269;
	Thu, 27 Aug 2020 18:50:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 101D1F80260; Tue, 25 Aug 2020 14:06:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30BE8F800EB
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 14:06:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30BE8F800EB
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 3DA6F8EFAF073BB64FFC;
 Tue, 25 Aug 2020 20:06:00 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Tue, 25 Aug 2020
 20:05:53 +0800
From: Yu Kuai <yukuai3@huawei.com>
To: <timur@kernel.org>, <nicoleotsuka@gmail.com>, <Xiubo.Lee@gmail.com>,
 <festevam@gmail.com>, <shengjiu.wang@gmail.com>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <shawnguo@kernel.org>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
 <linux-imx@nxp.com>, <xobs@kosagi.com>
Subject: [PATCH 2/2] ASoC: fsl: imx-es8328: add missing put_device() call in
 imx_es8328_probe()
Date: Tue, 25 Aug 2020 20:05:31 +0800
Message-ID: <20200825120531.1479304-3-yukuai3@huawei.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200825120531.1479304-1-yukuai3@huawei.com>
References: <20200825120531.1479304-1-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 27 Aug 2020 18:50:46 +0200
Cc: alsa-devel@alsa-project.org, yi.zhang@huawei.com,
 linux-kernel@vger.kernel.org, yukuai@huawei.com, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
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

if of_find_device_by_node() succeed, imx_es8328_probe() doesn't have
a corresponding put_device(). Thus add a jump target to fix the exception
handling for this function implementation.

Fixes: 7e7292dba215 ("ASoC: fsl: add imx-es8328 machine driver")
Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 sound/soc/fsl/imx-es8328.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-es8328.c b/sound/soc/fsl/imx-es8328.c
index 8f71ed3a6f75..a3f121939a83 100644
--- a/sound/soc/fsl/imx-es8328.c
+++ b/sound/soc/fsl/imx-es8328.c
@@ -145,7 +145,7 @@ static int imx_es8328_probe(struct platform_device *pdev)
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data) {
 		ret = -ENOMEM;
-		goto fail;
+		goto put_device;
 	}
 
 	comp = devm_kzalloc(dev, 3 * sizeof(*comp), GFP_KERNEL);
@@ -204,6 +204,8 @@ static int imx_es8328_probe(struct platform_device *pdev)
 	kfree(comp);
 free_data:
 	kfree(data);
+put_device:
+	put_device(&ssi_pdev->dev);
 fail:
 	of_node_put(ssi_np);
 	of_node_put(codec_np);
-- 
2.25.4

