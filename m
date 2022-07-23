Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1BC57EEA1
	for <lists+alsa-devel@lfdr.de>; Sat, 23 Jul 2022 12:15:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D87318CB;
	Sat, 23 Jul 2022 12:14:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D87318CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658571348;
	bh=yZLv9MA8x0u79LbzdG5UpbgD7pS5uacoDHFXiyBkbAI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YCDwNzar6IZBMLeJVzYomdx2CXOaJ9IbUyJzEIY4lwMecllCSeYe8OHXqHOcNzziM
	 wrW/Qt/BwXGr5Iqm10oxEofCPC5dC84TDNxi7SUhImhngp0xnoYu3EtRXyZRod/6JX
	 UV4Bu1oKBiNTlFZY975ZYf0eGpFQuMnJsG7a11Cw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C27B6F8054A;
	Sat, 23 Jul 2022 12:13:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A0ABF8019B; Sat, 23 Jul 2022 05:23:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-m975.mail.163.com (mail-m975.mail.163.com [123.126.97.5])
 by alsa1.perex.cz (Postfix) with ESMTP id D4239F800E1
 for <alsa-devel@alsa-project.org>; Sat, 23 Jul 2022 05:23:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4239F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=163.com header.i=@163.com
 header.b="O/nfmU5A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=JiQL3
 v43ih0CKjiymG4BT5ELIGSeW1i9a3/8dRvOgxk=; b=O/nfmU5AT6QRqxMh3N2/1
 jOKCzS/GFksAtNA9TjaBkL9qcWqBfU8K6MSMNQlfUPOvgA7OCosqruRwXJRjBsLi
 JLK4Xk7VijpoZAOf5tPEA3zXzi2oXUoJ0kIkfIljwtqFbv88tmKzCDLuwxE923Mx
 ZFM2UUA4xqZQfT5f+FFEIQ=
Received: from localhost.localdomain (unknown [123.58.221.99])
 by smtp5 (Coremail) with SMTP id HdxpCgBX2jeyadtiKGBKPw--.22880S2;
 Sat, 23 Jul 2022 11:23:32 +0800 (CST)
From: williamsukatube@163.com
To: agross@kernel.org, bjorn.andersson@linaro.org,
 srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH] slimbus: qcom-ngd-ctrl: Add check for platform_driver_register
Date: Sat, 23 Jul 2022 11:23:28 +0800
Message-Id: <20220723032328.2951275-1-williamsukatube@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: HdxpCgBX2jeyadtiKGBKPw--.22880S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jr4DCF47Gry3ZFyDur15urg_yoWkGFgEk3
 48uF9Fqrs5CFnrAFnFqFnrZ34IvFn5ursa9r10qFy3t3y8XF4DWrn0vFs8CFWUCrWrt34U
 J3Z0krZ7CrW3GjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU51wZ7UUUUU==
X-Originating-IP: [123.58.221.99]
X-CM-SenderInfo: xzlozx5dpv3yxdwxuvi6rwjhhfrp/1tbiURRHg2DEOrvjQwAAsE
X-Mailman-Approved-At: Sat, 23 Jul 2022 12:13:48 +0200
Cc: Hacash Robot <hacashRobot@santino.com>,
 William Dean <williamsukatube@gmail.com>, konrad.dybcio@somainline.org
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

From: William Dean <williamsukatube@gmail.com>

As platform_driver_register() could fail, it should be better
to deal with the return value in order to maintain the code
consisitency.

Fixes: 1830dad34c070 ("slimbus: ngd: register ngd driver only once.")
Reported-by: Hacash Robot <hacashRobot@santino.com>
Signed-off-by: William Dean <williamsukatube@gmail.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 0aa8408464ad..a31ec00a37ac 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1585,7 +1585,12 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
 		return PTR_ERR(pds);
 	}
 
-	platform_driver_register(&qcom_slim_ngd_driver);
+	ret = platform_driver_register(&qcom_slim_ngd_driver);
+	if (ret) {
+		dev_err(dev, "platform driver register failed: %d\n", ret);
+		return ret;
+	}
+
 	return of_qcom_slim_ngd_register(dev, ctrl);
 }
 
-- 
2.25.1

