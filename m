Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E25229656
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jul 2020 12:37:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B4F31665;
	Wed, 22 Jul 2020 12:36:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B4F31665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595414254;
	bh=ZbGEzPh2RvD01Otwnqk0MJWARRFyOJFpRnGK3eUUSbw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BbDqnMX/CzZup9jk/6q9IcFKZyXYiL0QM2tmZiXXn0RHKJg5WxNS8thvzLaFy8u5T
	 N3+RDilxS/Suf/lQNTEGeaKNUH77HaIJJt3r+TpTLoh93CfQyUKqA6mvdCq2sRBCTt
	 WuvGo/lyZc4i29IYFWF5CQF7NwEpyPLLPtgSeax0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 130CBF802DF;
	Wed, 22 Jul 2020 12:33:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 615C3F802F9; Wed, 22 Jul 2020 12:33:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3A9DF802DF
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 12:33:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3A9DF802DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="MxFKVhin"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1595413990; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=FnbOm2jqw8cOBeff5oky4tXaNraD8764cRfiH89/4tY=;
 b=MxFKVhinwOiglSRNKkzzyTkJPAC9fClLmvsNMQ/T9dGBkDFudjyHIRrYb2lryqYo90fPO0xW
 bZTUMZB3Fica1E2N+oSZldkyZyFgiKKQ2IadrUITxa06A2yY4HvGy2+tuCM4gJIAdGHubt+J
 v2f4v5HliQI2WagcoRUSZQANWhQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n20.prod.us-east-1.postgun.com with SMTP id
 5f1815e57c8ca473a8f1de78 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 22 Jul 2020 10:33:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B30D5C433A0; Wed, 22 Jul 2020 10:33:08 +0000 (UTC)
Received: from rohkumar-linux.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: rohitkr)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9F553C433A0;
 Wed, 22 Jul 2020 10:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9F553C433A0
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=rohitkr@codeaurora.org
From: Rohit kumar <rohitkr@codeaurora.org>
To: agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
 bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 06/12] ASoC: qcom: lpass-cpu: fix concurrency issue
Date: Wed, 22 Jul 2020 16:01:49 +0530
Message-Id: <1595413915-17867-7-git-send-email-rohitkr@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595413915-17867-1-git-send-email-rohitkr@codeaurora.org>
References: <1595413915-17867-1-git-send-email-rohitkr@codeaurora.org>
Cc: Rohit kumar <rohitkr@codeaurora.org>
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

i2sctl register value is set to 0 during hw_free(). This
impacts any ongoing concurrent session on the same i2s
port. As trigger() stop already resets enable bit to 0,
there is no need of explicit hw_free. Removing it to
fix the issue.

Fixes: 80beab8e1d86 ("ASoC: qcom: Add LPASS CPU DAI driver")
Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
---
 sound/soc/qcom/lpass-cpu.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 6b86f16..5d84f63 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -266,21 +266,6 @@ static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int lpass_cpu_daiops_hw_free(struct snd_pcm_substream *substream,
-		struct snd_soc_dai *dai)
-{
-	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
-	int ret;
-
-	ret = regmap_write(drvdata->lpaif_map,
-			   LPAIF_I2SCTL_REG(drvdata->variant, dai->driver->id),
-			   0);
-	if (ret)
-		dev_err(dai->dev, "error writing to i2sctl reg: %d\n", ret);
-
-	return ret;
-}
-
 static int lpass_cpu_daiops_prepare(struct snd_pcm_substream *substream,
 		struct snd_soc_dai *dai)
 {
@@ -350,7 +335,6 @@ const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops = {
 	.startup	= lpass_cpu_daiops_startup,
 	.shutdown	= lpass_cpu_daiops_shutdown,
 	.hw_params	= lpass_cpu_daiops_hw_params,
-	.hw_free	= lpass_cpu_daiops_hw_free,
 	.prepare	= lpass_cpu_daiops_prepare,
 	.trigger	= lpass_cpu_daiops_trigger,
 };
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

