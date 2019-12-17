Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E224122926
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Dec 2019 11:48:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20045165E;
	Tue, 17 Dec 2019 11:47:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20045165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576579690;
	bh=zzdn5hvSr2Mehrv/oyTYOaxFsRqKc4Vk4wxVKywYOt8=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nmGV8T0EKr6fJ6/qm4Cxu9ilpFkIOyE2y03b67fY5T9aJfiSlbiVivUClS5ypjvrm
	 ePS/pRF3J8cWN8gsbiORS5/e4LBp44Xflm8IGkJNDOhPSDJoM4GIS+eyrqYhgrPn5w
	 SoT1gDHm61yKE3h1jLTumQygux6GuowXXIZ41mNI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64B25F80218;
	Tue, 17 Dec 2019 11:46:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52114F80234; Tue, 17 Dec 2019 11:46:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A60C2F80088
 for <alsa-devel@alsa-project.org>; Tue, 17 Dec 2019 11:46:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A60C2F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="svc2K7Ls"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBHAkH2o116257;
 Tue, 17 Dec 2019 04:46:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1576579577;
 bh=lrWG52vZJWUbatvnVA4RbMRIojZou2X56dG4oPSNdq4=;
 h=From:To:CC:Subject:Date;
 b=svc2K7Ls2jHkrBMO5OIDGFMZV/G6C6mycJe44tRkxAc2wPm2Mo8d5lvvKfx++yMKH
 N8juaqVcv8RXUeOmcx4e8uep9TJuwn1x/HUawjw3qAQEc1iAA1ejeLcxg3hM2J7hyd
 kh0JTidg1DCndxyZFUFmZTaNkQZ3sso7NQN0y/hw=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBHAkHgL008715
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 17 Dec 2019 04:46:17 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 17
 Dec 2019 04:46:16 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 17 Dec 2019 04:46:16 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBHAkEcg037743;
 Tue, 17 Dec 2019 04:46:15 -0600
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>,
 <srinivas.kandagatla@linaro.org>
Date: Tue, 17 Dec 2019 12:46:29 +0200
Message-ID: <20191217104629.24590-1-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: linux-arm-msm@vger.kernel.org, vkoul@kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] slimbus: qcom-ngd-ctrl: Use dma_request_chan()
	instead dma_request_slave_channel()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

dma_request_slave_channel() is a wrapper on top of dma_request_chan()
eating up the error code.

By using dma_request_chan() directly the driver can support deferred
probing against DMA.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 29fbab55c3b3..e3f5ebc0c05e 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -666,10 +666,12 @@ static int qcom_slim_ngd_init_rx_msgq(struct qcom_slim_ngd_ctrl *ctrl)
 	struct device *dev = ctrl->dev;
 	int ret, size;
 
-	ctrl->dma_rx_channel = dma_request_slave_channel(dev, "rx");
-	if (!ctrl->dma_rx_channel) {
-		dev_err(dev, "Failed to request dma channels");
-		return -EINVAL;
+	ctrl->dma_rx_channel = dma_request_chan(dev, "rx");
+	if (IS_ERR(ctrl->dma_rx_channel)) {
+		dev_err(dev, "Failed to request RX dma channel");
+		ret = PTR_ERR(ctrl->dma_rx_channel);
+		ctrl->dma_rx_channel = NULL;
+		return ret;
 	}
 
 	size = QCOM_SLIM_NGD_DESC_NUM * SLIM_MSGQ_BUF_LEN;
@@ -703,10 +705,12 @@ static int qcom_slim_ngd_init_tx_msgq(struct qcom_slim_ngd_ctrl *ctrl)
 	int ret = 0;
 	int size;
 
-	ctrl->dma_tx_channel = dma_request_slave_channel(dev, "tx");
-	if (!ctrl->dma_tx_channel) {
-		dev_err(dev, "Failed to request dma channels");
-		return -EINVAL;
+	ctrl->dma_tx_channel = dma_request_chan(dev, "tx");
+	if (IS_ERR(ctrl->dma_tx_channel)) {
+		dev_err(dev, "Failed to request TX dma channel");
+		ret = PTR_ERR(ctrl->dma_tx_channel);
+		ctrl->dma_tx_channel = NULL;
+		return ret;
 	}
 
 	size = ((QCOM_SLIM_NGD_DESC_NUM + 1) * SLIM_MSGQ_BUF_LEN);
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
