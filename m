Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BF75B81FC
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Sep 2022 09:24:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 054A817F5;
	Wed, 14 Sep 2022 09:23:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 054A817F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663140289;
	bh=Wlngx2yzJG1DJ87jEfS3VcpDR2sftdKQUXaCQ4umGdw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sMUwP+re1cUZiP4MfIYgNfPnmivxR8WytwmW8P/0HzEaXfub1pQAd4xTJTeOWJ7w7
	 6vlRJI2jMbVYliPnn6+5albERMK6BLV9l+9jScASQctqzcWjsML4KMQRFqHPaxGVdd
	 9/bIb0et+LDXjOrUABZq53ffij491tNrgBqrtVig=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 610FFF8016E;
	Wed, 14 Sep 2022 09:23:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BA3FF8014E; Wed, 14 Sep 2022 05:23:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9EDF5F8008E
 for <alsa-devel@alsa-project.org>; Wed, 14 Sep 2022 05:23:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9EDF5F8008E
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MS5DJ70R9zcmyZ;
 Wed, 14 Sep 2022 11:19:44 +0800 (CST)
Received: from dggpeml500010.china.huawei.com (7.185.36.155) by
 dggpeml500024.china.huawei.com (7.185.36.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 14 Sep 2022 11:23:29 +0800
Received: from huawei.com (10.67.175.33) by dggpeml500010.china.huawei.com
 (7.185.36.155) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 14 Sep
 2022 11:23:29 +0800
From: Lin Yujun <linyujun809@huawei.com>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>,
 <konrad.dybcio@somainline.org>, <srinivas.kandagatla@linaro.org>,
 <gregkh@linuxfoundation.org>, <vkoul@kernel.org>
Subject: [PATCH -next] slimbus: qcom-ngd: Add error handling in
 of_qcom_slim_ngd_register
Date: Wed, 14 Sep 2022 11:19:53 +0800
Message-ID: <20220914031953.94061-1-linyujun809@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.175.33]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500010.china.huawei.com (7.185.36.155)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 14 Sep 2022 09:23:48 +0200
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

No error handling is performed when platform_device_add()
return fails. Refer to the error handling of driver_set_override(),
add error handling for platform_device_add().

Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
Signed-off-by: Lin Yujun <linyujun809@huawei.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 0aa8408464ad..fb591990ddad 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1470,7 +1470,13 @@ static int of_qcom_slim_ngd_register(struct device *parent,
 		ngd->pdev->dev.of_node = node;
 		ctrl->ngd = ngd;
 
-		platform_device_add(ngd->pdev);
+		ret = platform_device_add(ngd->pdev);
+		if (ret) {
+			platform_device_put(ngd->pdev);
+			kfree(ngd);
+			of_node_put(node);
+			return ret;
+		}
 		ngd->base = ctrl->base + ngd->id * data->offset +
 					(ngd->id - 1) * data->size;
 
-- 
2.17.1

