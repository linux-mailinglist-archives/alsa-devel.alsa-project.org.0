Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD06741EBDC
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Oct 2021 13:26:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EED016E8;
	Fri,  1 Oct 2021 13:25:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EED016E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633087585;
	bh=qTc4tn4wCVpD/dQ0iQoReEcAw0LtqTeGKSZ6CKmpxSI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RUCZbXgJ86YU9A18Z/mgwEeVZ/Ju38yITNvwO02ApQxD9/NYJSJRsQHDr4NvY+du1
	 3MqIzNtjXHnofuCD3NGLt9iv6yVTsnsd1cws3FwZ4ts2HUBZy5yznC7EKhlNfKCE+q
	 XWi4lBXgr+TWTNGavIXqdrS6tsRxiWOVcqqcHHvg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D70FAF80529;
	Fri,  1 Oct 2021 13:22:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D43EFF8051F; Fri,  1 Oct 2021 13:22:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9529BF8051A
 for <alsa-devel@alsa-project.org>; Fri,  1 Oct 2021 13:22:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9529BF8051A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="K5rIf7LP"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633087366; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=40ApUzuvtbwbH4t5Gb3Ts0gs6DJSioSNyNBn2+OJZQc=;
 b=K5rIf7LP/aQJv0XJkJllhhNP2IZg7mEKm9tgt8rXEWX/tcNaNewzT1gGvmGFJCZ2Vb7sYbOI
 nQOapuAM583cUeUHbS/XWZdsatBJ84qiN3i4g1gcsQVaUJR+8DdH2C02GFXKTIYoTqC10eD1
 ui2pMmqAjqPE3/TIVI6qsCciwr8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 6156ef809ffb4131495874c2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 01 Oct 2021 11:22:40
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 46000C4338F; Fri,  1 Oct 2021 11:22:39 +0000 (UTC)
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0FADBC4338F;
 Fri,  1 Oct 2021 11:22:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 0FADBC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To: agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
 bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
Subject: [PATCH 8/8] ASoc: qcom: lpass: Add suspend and resume for sc7280
 platform
Date: Fri,  1 Oct 2021 16:51:32 +0530
Message-Id: <1633087292-1378-9-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633087292-1378-1-git-send-email-srivasam@codeaurora.org>
References: <1633087292-1378-1-git-send-email-srivasam@codeaurora.org>
Cc: Venkata Prasad Potturu <potturu@codeaurora.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
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

Adds device suspend and resume callbacks for sc7280 platform driver ops.

Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
---
 sound/soc/qcom/lpass-cpu.c    | 22 ++++++++++++++++++++++
 sound/soc/qcom/lpass-sc7280.c |  2 ++
 sound/soc/qcom/lpass.h        |  2 ++
 3 files changed, 26 insertions(+)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index c8dec52..5aa5630 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -1307,6 +1307,28 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 }
 EXPORT_SYMBOL_GPL(asoc_qcom_lpass_cpu_platform_probe);
 
+int asoc_qcom_lpass_cpu_platform_resume(struct platform_device *pdev)
+{
+	struct lpass_data *drvdata = platform_get_drvdata(pdev);
+
+	if (drvdata->variant->init)
+		drvdata->variant->init(pdev);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(asoc_qcom_lpass_cpu_platform_resume);
+
+int asoc_qcom_lpass_cpu_platform_suspend(struct platform_device *pdev, pm_message_t state)
+{
+	struct lpass_data *drvdata = platform_get_drvdata(pdev);
+
+	if (drvdata->variant->exit)
+		drvdata->variant->exit(pdev);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(asoc_qcom_lpass_cpu_platform_suspend);
+
 int asoc_qcom_lpass_cpu_platform_remove(struct platform_device *pdev)
 {
 	struct lpass_data *drvdata = platform_get_drvdata(pdev);
diff --git a/sound/soc/qcom/lpass-sc7280.c b/sound/soc/qcom/lpass-sc7280.c
index 983a61b..6fdf111 100644
--- a/sound/soc/qcom/lpass-sc7280.c
+++ b/sound/soc/qcom/lpass-sc7280.c
@@ -591,6 +591,8 @@ static struct platform_driver sc7280_lpass_cpu_platform_driver = {
 	.probe = asoc_qcom_lpass_cpu_platform_probe,
 	.remove = asoc_qcom_lpass_cpu_platform_remove,
 	.shutdown = asoc_qcom_lpass_cpu_platform_shutdown,
+	.resume = asoc_qcom_lpass_cpu_platform_resume,
+	.suspend = asoc_qcom_lpass_cpu_platform_suspend,
 };
 
 module_platform_driver(sc7280_lpass_cpu_platform_driver);
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index e0ea698..53d9b5d 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -419,5 +419,7 @@ extern const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops;
 int lpass_cpu_pcm_new(struct snd_soc_pcm_runtime *rtd,
 				struct snd_soc_dai *dai);
 extern const struct snd_soc_dai_ops asoc_qcom_lpass_wcd_dai_ops;
+int asoc_qcom_lpass_cpu_platform_suspend(struct platform_device *pdev, pm_message_t state);
+int asoc_qcom_lpass_cpu_platform_resume(struct platform_device *pdev);
 
 #endif /* __LPASS_H__ */
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

