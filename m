Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABAC2CFB43
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Dec 2020 13:21:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 980BD1834;
	Sat,  5 Dec 2020 13:20:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 980BD1834
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607170886;
	bh=NKdU4LZ7LZnj0qamHN65i0GB6rVa0Ega4I2aCQSivn0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SYGFobDgt4cuXQYaj4alXjW+JAq014hM3yVKQCFXKP6pEdCmg5BD3xBKuaKzXm1uZ
	 Bg8yxvNP1GJZE4NdPB1xZeSfgYVP3T+BpYMbtIEgwQv74gx1mkXb2+pmH/ORboVwmw
	 UpJvoc3tU94xvIT2nWLDKzUuMQE3Ds+0pIxJueL4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82D2CF80254;
	Sat,  5 Dec 2020 13:19:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D22DBF8016D; Sat,  5 Dec 2020 13:19:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9CE7F800E2
 for <alsa-devel@alsa-project.org>; Sat,  5 Dec 2020 13:19:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9CE7F800E2
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cp7sj1wgqz15JTv;
 Sat,  5 Dec 2020 20:19:05 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Sat, 5 Dec 2020
 20:19:29 +0800
From: Zhang Qilong <zhangqilong3@huawei.com>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>,
 <srinivas.kandagatla@linaro.org>
Subject: [PATCH] slimbus: qcom-ngd-ctrl: Fix error handling to keep reference
 balanced
Date: Sat, 5 Dec 2020 20:22:45 +0800
Message-ID: <20201205122245.2108188-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org
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

In the error branch, we should call pm_runtime_put_noidle and
pm_runtime_disable to decrease usage counter and increase the
power disable depth to avoid reference leaks.

Fixes: 917809e2280bb ("slimbus: ngd: Add qcom SLIMBus NGD driver")
Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index c054e83ab636..a9b4a1d95045 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1483,7 +1483,7 @@ static int qcom_slim_ngd_probe(struct platform_device *pdev)
 	ret = qcom_slim_ngd_qmi_svc_event_init(ctrl);
 	if (ret) {
 		dev_err(&pdev->dev, "QMI service registration failed:%d", ret);
-		return ret;
+		goto pm_err;
 	}
 
 	INIT_WORK(&ctrl->m_work, qcom_slim_ngd_master_worker);
@@ -1500,6 +1500,9 @@ static int qcom_slim_ngd_probe(struct platform_device *pdev)
 	qcom_slim_ngd_qmi_svc_event_deinit(&ctrl->qmi);
 	if (ctrl->mwq)
 		destroy_workqueue(ctrl->mwq);
+pm_err:
+	pm_runtime_put_noidle(dev);
+	pm_runtime_disable(dev);
 
 	return ret;
 }
-- 
2.25.4

