Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 311C11FE119
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 03:52:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC3CD171E;
	Thu, 18 Jun 2020 03:51:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC3CD171E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592445167;
	bh=ZwQniGsZaMrpQa0UJdKs4Tf2t9OfA2jff0q6Ie3D2WI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YdGI84QwjwmIl+dTRpbAgJTO5Ww8j038ALR+ybznxie65T8OAZKcj59itp/1syhPM
	 EnhbP8zVaDN4E/EYPn574LlFHjMAjI5hQ8XoIDZffvzhyUlI2FDRKhHdYvVVwQpL/8
	 /czeYj81JK/rrr1MTRi7vxGVI+St7gem29f6yf0w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7F46F80384;
	Thu, 18 Jun 2020 03:24:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 247F9F80524; Thu, 18 Jun 2020 03:23:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47F83F802E7
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 03:23:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47F83F802E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nBHj2fH3"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0923A21927;
 Thu, 18 Jun 2020 01:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592443429;
 bh=ZwQniGsZaMrpQa0UJdKs4Tf2t9OfA2jff0q6Ie3D2WI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nBHj2fH33/VGT/xcF68GADS5wpX5fAAKlH7rWG1TQN33ue4SRXURL0VDwLcv+vSrk
 b2htR8zCTMlbnQvbQqyrFCVm2HlUHIG8C+kCOZ48GqPXuJZRb0h/3HSquloIzaFpJI
 odGE+U+dfPibRFlqHrcnMw15h3BTTausqZzu7fZM=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 069/172] slimbus: ngd: get drvdata from correct
 device
Date: Wed, 17 Jun 2020 21:20:35 -0400
Message-Id: <20200618012218.607130-69-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618012218.607130-1-sashal@kernel.org>
References: <20200618012218.607130-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org
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

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

[ Upstream commit b58c663059b484f7ff547d076a34cf6d7a302e56 ]

Get drvdata directly from parent instead of ngd dev, as ngd
dev can probe defer and previously set drvdata will become null.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Link: https://lore.kernel.org/r/20200417093618.7929-1-srinivas.kandagatla@linaro.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 9221ba7b7863..f40ac8dcb081 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1350,7 +1350,6 @@ static int of_qcom_slim_ngd_register(struct device *parent,
 		ngd->pdev->driver_override = QCOM_SLIM_NGD_DRV_NAME;
 		ngd->pdev->dev.of_node = node;
 		ctrl->ngd = ngd;
-		platform_set_drvdata(ngd->pdev, ctrl);
 
 		platform_device_add(ngd->pdev);
 		ngd->base = ctrl->base + ngd->id * data->offset +
@@ -1365,12 +1364,13 @@ static int of_qcom_slim_ngd_register(struct device *parent,
 
 static int qcom_slim_ngd_probe(struct platform_device *pdev)
 {
-	struct qcom_slim_ngd_ctrl *ctrl = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
+	struct qcom_slim_ngd_ctrl *ctrl = dev_get_drvdata(dev->parent);
 	int ret;
 
 	ctrl->ctrl.dev = dev;
 
+	platform_set_drvdata(pdev, ctrl);
 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_set_autosuspend_delay(dev, QCOM_SLIM_NGD_AUTOSUSPEND);
 	pm_runtime_set_suspended(dev);
-- 
2.25.1

