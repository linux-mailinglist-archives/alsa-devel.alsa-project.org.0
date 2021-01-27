Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B4A305F62
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jan 2021 16:20:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 433B91709;
	Wed, 27 Jan 2021 16:19:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 433B91709
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611760824;
	bh=6gtY4KhUNUFxzkbSNQazRnfNOPpdbyKoSjb81y+VK1U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=azF2y52AuTLsIoh8fR1tbdao1M2FuYPOrxy+SnSdJ4cx+NbG8Q1VBB/5nsee/9DBu
	 Eng1rUpbHvfdy/ibse0ilOIa7dGjzBGcoXM9SglKiSkXVC+e4vUsM5g1FdzjVdEDXJ
	 nMqUr81suI8NGg0lsi0xAEw5b8/MnrEa9QBmdpGg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52AEEF8025F;
	Wed, 27 Jan 2021 16:18:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 136BBF80259; Wed, 27 Jan 2021 16:18:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m42-8.mailgun.net (m42-8.mailgun.net [69.72.42.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DBF2FF800E9
 for <alsa-devel@alsa-project.org>; Wed, 27 Jan 2021 16:18:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBF2FF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="EZIDZ4DM"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1611760727; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=FiCUTpUrxAWVMK/SZ+r7dBcDFEIkz30ww9kPsaUFmTg=;
 b=EZIDZ4DMmKW7IAVbBpBZgr/YnzjVBmGvcoALNydGx8hTKYGEbeCQSx8/a5qq7m07/C50vJlM
 k3OMc5g6s01AXQIL27/KYC/YpudkMLhX77+ub48Pq9Umh58MX7LB/oQIw1RYhIiKaM/1y11B
 3xIgsx+k9RKUNB++hE2pulS+xkY=
X-Mailgun-Sending-Ip: 69.72.42.8
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 601184516287154b87cba9e5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 27 Jan 2021 15:18:41
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id ECC8AC43461; Wed, 27 Jan 2021 15:18:40 +0000 (UTC)
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D6E85C433ED;
 Wed, 27 Jan 2021 15:18:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D6E85C433ED
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
Subject: [PATCH v2] ASoC: qcom: lpass-cpu: Remove bit clock state check
Date: Wed, 27 Jan 2021 20:48:24 +0530
Message-Id: <20210127151824.8929-1-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
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

No need of BCLK state maintenance from driver side as
clock_enable and clk_disable API's maintaing state counter.

One of the major issue was spotted when Headset jack inserted
while playback continues, due to same PCM device node opens twice
for playaback/capture and closes once for capture and playback continues.

It can resolve the errors in such scenarios.

Fixes: b1824968221c ("ASoC: qcom: Fix enabling BCLK and LRCLK in LPAIF invalid state")

Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
---
Changes since v1: 
   -- Commit message changed

 sound/soc/qcom/lpass-cpu.c       | 22 ++++++++--------------
 sound/soc/qcom/lpass-lpaif-reg.h |  3 ---
 sound/soc/qcom/lpass.h           |  1 -
 3 files changed, 8 insertions(+), 18 deletions(-)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index ae8efbc89af2..a669202e0001 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -286,16 +286,12 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
 			dev_err(dai->dev, "error writing to i2sctl reg: %d\n",
 				ret);
 
-		if (drvdata->bit_clk_state[id] == LPAIF_BIT_CLK_DISABLE) {
-			ret = clk_enable(drvdata->mi2s_bit_clk[id]);
-			if (ret) {
-				dev_err(dai->dev, "error in enabling mi2s bit clk: %d\n", ret);
-				clk_disable(drvdata->mi2s_osr_clk[id]);
-				return ret;
-			}
-			drvdata->bit_clk_state[id] = LPAIF_BIT_CLK_ENABLE;
+		ret = clk_enable(drvdata->mi2s_bit_clk[id]);
+		if (ret) {
+			dev_err(dai->dev, "error in enabling mi2s bit clk: %d\n", ret);
+			clk_disable(drvdata->mi2s_osr_clk[id]);
+			return ret;
 		}
-
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
@@ -310,10 +306,9 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
 		if (ret)
 			dev_err(dai->dev, "error writing to i2sctl reg: %d\n",
 				ret);
-		if (drvdata->bit_clk_state[id] == LPAIF_BIT_CLK_ENABLE) {
-			clk_disable(drvdata->mi2s_bit_clk[dai->driver->id]);
-			drvdata->bit_clk_state[id] = LPAIF_BIT_CLK_DISABLE;
-		}
+
+		clk_disable(drvdata->mi2s_bit_clk[dai->driver->id]);
+
 		break;
 	}
 
@@ -861,7 +856,6 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 				PTR_ERR(drvdata->mi2s_bit_clk[dai_id]));
 			return PTR_ERR(drvdata->mi2s_bit_clk[dai_id]);
 		}
-		drvdata->bit_clk_state[dai_id] = LPAIF_BIT_CLK_DISABLE;
 	}
 
 	/* Allocation for i2sctl regmap fields */
diff --git a/sound/soc/qcom/lpass-lpaif-reg.h b/sound/soc/qcom/lpass-lpaif-reg.h
index 405542832e99..c8e1d75340b2 100644
--- a/sound/soc/qcom/lpass-lpaif-reg.h
+++ b/sound/soc/qcom/lpass-lpaif-reg.h
@@ -60,9 +60,6 @@
 #define LPAIF_I2SCTL_BITWIDTH_24	1
 #define LPAIF_I2SCTL_BITWIDTH_32	2
 
-#define LPAIF_BIT_CLK_DISABLE		0
-#define LPAIF_BIT_CLK_ENABLE		1
-
 #define LPAIF_I2SCTL_RESET_STATE	0x003C0004
 #define LPAIF_DMACTL_RESET_STATE	0x00200000
 
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index 2d68af0da34d..83b2e08ade06 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -68,7 +68,6 @@ struct lpass_data {
 	unsigned int mi2s_playback_sd_mode[LPASS_MAX_MI2S_PORTS];
 	unsigned int mi2s_capture_sd_mode[LPASS_MAX_MI2S_PORTS];
 	int hdmi_port_enable;
-	int bit_clk_state[LPASS_MAX_MI2S_PORTS];
 
 	/* low-power audio interface (LPAIF) registers */
 	void __iomem *lpaif;
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

