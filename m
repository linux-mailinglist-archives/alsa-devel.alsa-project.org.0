Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 172132C6261
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Nov 2020 10:58:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DD8C183E;
	Fri, 27 Nov 2020 10:57:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DD8C183E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606471110;
	bh=dD2dFxT1bHFi1JYa3JIxITE0CpwvM22h/WW6Olftr4k=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Gelmuc/PNWYGSUAZ461K/Pg3YGwolE7SgpSC2IG+lY95k5p2eerU/kiOYU06XfDy1
	 QLpGk/9l789nIukcsl5CKauUAjCxQ2itJ0ogDjWQqu3gHOKgE2jDcEba4srVWcksL0
	 Eq7UeTpvWifEyfYueBex6+IXn79/wKV0plkcZ/NU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02305F800EA;
	Fri, 27 Nov 2020 10:56:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0B48F8019D; Fri, 27 Nov 2020 10:56:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44439F800EA
 for <alsa-devel@alsa-project.org>; Fri, 27 Nov 2020 10:56:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44439F800EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="XuPw0WjB"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1606471008; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=uh97Z0sQ4kcYvO9iLWdWG4UvbvTzslMqDnQZy4L6frI=;
 b=XuPw0WjBYE7rKB6ClQ77vZcQZW/0yMt6M2nNVC6lwJax1SyIcC7LO61hKw7ID5Qlvwi6D3ud
 AxhIP7A33xLIzbLOMP+Bv3qrGI5DganNnvUnjhH//eaoQT6CEqTQWLudG3zSmwo7eI6PqfN7
 RJFKMYjHbBXvEFBNHJlxDUJ92KM=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5fc0cd5ea5c560669c7e659b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 27 Nov 2020 09:56:46
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6899FC43469; Fri, 27 Nov 2020 09:56:45 +0000 (UTC)
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 860B9C4346A;
 Fri, 27 Nov 2020 09:56:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 860B9C4346A
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
Subject: [PATCH v3] ASoC: qcom: Fix playback recover problem in suspend resume
Date: Fri, 27 Nov 2020 15:26:28 +0530
Message-Id: <1606470988-26965-1-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Cc: V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
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

To support playback continuation after hard suspend(bypass powerd)
 and resume:
Prepare device in  platform trigger callback.
Make I2s and DMA control registers as non volatile.

Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
---
Changes Since v1 and v2:
  -- Subject lines changed

 sound/soc/qcom/lpass-cpu.c      | 8 ++------
 sound/soc/qcom/lpass-platform.c | 5 +++--
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index af684fd..c99be03 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -454,20 +454,16 @@ static bool lpass_cpu_regmap_volatile(struct device *dev, unsigned int reg)
 	struct lpass_variant *v = drvdata->variant;
 	int i;
 
-	for (i = 0; i < v->i2s_ports; ++i)
-		if (reg == LPAIF_I2SCTL_REG(v, i))
-			return true;
 	for (i = 0; i < v->irq_ports; ++i)
 		if (reg == LPAIF_IRQSTAT_REG(v, i))
 			return true;
 
 	for (i = 0; i < v->rdma_channels; ++i)
-		if (reg == LPAIF_RDMACURR_REG(v, i) || reg == LPAIF_RDMACTL_REG(v, i))
+		if (reg == LPAIF_RDMACURR_REG(v, i))
 			return true;
 
 	for (i = 0; i < v->wrdma_channels; ++i)
-		if (reg == LPAIF_WRDMACURR_REG(v, i + v->wrdma_channel_start) ||
-			reg == LPAIF_WRDMACTL_REG(v, i + v->wrdma_channel_start))
+		if (reg == LPAIF_WRDMACURR_REG(v, i + v->wrdma_channel_start))
 			return true;
 
 	return false;
diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index 80b09de..2b0a7c1 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -481,8 +481,9 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
 		return -ENOTRECOVERABLE;
 	}
 	switch (cmd) {
-	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
+		lpass_platform_pcmops_prepare(component, substream);
+	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		ret = regmap_fields_write(dmactl->enable, id,
 						 LPAIF_DMACTL_ENABLE_ON);
@@ -592,7 +593,7 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static snd_pcm_uframes_t lpass_platform_pcmops_pointer(
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

