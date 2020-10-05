Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FCE282FDF
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 06:52:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D5C21854;
	Mon,  5 Oct 2020 06:51:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D5C21854
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601873538;
	bh=BO2LwOtQEsjvixMjt5Dl+puWakpnM4hE7T+glldQvJQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lOTwcsaFZA8bKYnA9m8Y2N1OOTKjKvRxdYBVQmV8iJoIdnx+3Z48ob/1Ceu11BASQ
	 8jr/mIJuva71SlTdGbIT8xZDhO8AiQEsNKres98vjXdJcnAuYKznbCkpQxj1oRF3Ig
	 FBtq/+kO2VHmeU7K78B/1UNTFcqjWJvFYspBl4zI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3478BF802E1;
	Mon,  5 Oct 2020 06:49:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10E2FF80291; Mon,  5 Oct 2020 06:49:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C13CCF8027B
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 06:49:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C13CCF8027B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="JlrrYcg5"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1601873345; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=kxK9LtfCElRb3WIXIcnYrmIbewkkXrexPQfvtxTLWR8=;
 b=JlrrYcg5qksORAubr2VjRZMSeiLnYN71taOD2VukzEGKghmw2rDjdUdLPO5GYhzIFyuAT1i4
 ejXJYCjOSTnLpVd9rGcoY2lTl18BhTXJvolFg7SjUbfL1uv6hF3IyH7+BWB/0bT9SdXZXtWU
 ScdXe2+1Hw0/wkxTTdiJDh/GiTw=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f7aa5c106d81bc48db4e991 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 05 Oct 2020 04:49:05
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id DD092C43385; Mon,  5 Oct 2020 04:49:04 +0000 (UTC)
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1E3A3C433FE;
 Mon,  5 Oct 2020 04:48:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1E3A3C433FE
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=srivasam@codeaurora.org
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To: agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
 bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 3/7] Asoc:qcom:lpass-cpu:Update dts property read API
Date: Mon,  5 Oct 2020 10:18:26 +0530
Message-Id: <1601873310-1894-4-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601873310-1894-1-git-send-email-srivasam@codeaurora.org>
References: <1601873310-1894-1-git-send-email-srivasam@codeaurora.org>
Cc: V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
 Srinivasa Rao <srivasam@codeaurora.org>
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

From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>

Update dts property read API call with platform get property
by name, as it make code more readable and avoid conflicts
when array of properties to be used.

Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Srinivasa Rao <srivasam@codeaurora.org>
---
 sound/soc/qcom/lpass-cpu.c      | 2 +-
 sound/soc/qcom/lpass-platform.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 0718a0f..12950d2 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -575,7 +575,7 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 
 	of_lpass_cpu_parse_dai_data(dev, drvdata);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-lpaif");
 
 	drvdata->lpaif = devm_ioremap_resource(dev, res);
 	if (IS_ERR((void const __force *)drvdata->lpaif)) {
diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index 7ac2629..e7cf4e5 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -621,7 +621,7 @@ int asoc_qcom_lpass_platform_register(struct platform_device *pdev)
 	struct lpass_variant *v = drvdata->variant;
 	int ret;
 
-	drvdata->lpaif_irq = platform_get_irq(pdev, 0);
+	drvdata->lpaif_irq = platform_get_irq_byname(pdev, "lpass-irq-lpaif");
 	if (drvdata->lpaif_irq < 0)
 		return -ENODEV;
 
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

