Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A296D37F71E
	for <lists+alsa-devel@lfdr.de>; Thu, 13 May 2021 13:47:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21FBB1791;
	Thu, 13 May 2021 13:46:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21FBB1791
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620906456;
	bh=gYazNowh2F4xxqVX5ytPjvUW3I+Tw3BEo5K98kcB71E=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sKru3YBVr23GZPrZp4gm23eBA+BqYe/uOyzsmqduBcve3K9O6BOeKgtsPLlbTeL2a
	 85AMfaEsUIIRgnZfBzldWb5sL6gFlaTdDRAjTrYgG5hU3VsaRUBkSsDuIkUq+7oxoU
	 Btz6DXIaVpL0jXfDHO/0TbaHerg+cSXe64B1DsRk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97440F8016B;
	Thu, 13 May 2021 13:46:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 134E4F80163; Thu, 13 May 2021 13:46:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9920CF8012E
 for <alsa-devel@alsa-project.org>; Thu, 13 May 2021 13:46:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9920CF8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="IbfPabNJ"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1620906361; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=R3PRA2rUnS5fig4+xW1jrQHWFtxLg10TUka5lgODj/c=;
 b=IbfPabNJCwU5fX/0rXqWQo4oO3qxYWummwXHgw8IVOMjBAtVMHqPxKN8wEZvgkMsaPZ1RJl1
 lumHKgzB3KBhmniAswNPg6LvT1RVFOGvS8Y1YTPDOPrhPd3tcm86I7grnfDlSNUoDtYdonEo
 5+jdA8aLmWk8ndq9y0B5hXsjjTY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 609d11737bf557a01239caf8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 13 May 2021 11:45:55
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 64472C43460; Thu, 13 May 2021 11:45:55 +0000 (UTC)
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1220EC433F1;
 Thu, 13 May 2021 11:45:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1220EC433F1
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
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
Subject: [PATCH] ASoC: qcom: lpass-cpu: Fix pop noise during audio capture
 begin
Date: Thu, 13 May 2021 17:15:39 +0530
Message-Id: <20210513114539.4813-1-srivasam@codeaurora.org>
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

This patch fixes PoP noise of around 15ms observed during audio capture begin.
Enables BCLK and LRCLK in snd_soc_dai_ops startup call for introducing some delay
before capture start and clock enable.

Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
---
 sound/soc/qcom/lpass-cpu.c | 37 +++++++++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index c62d2612e8f5..3dcfc2f115a7 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -73,14 +73,28 @@ static int lpass_cpu_daiops_startup(struct snd_pcm_substream *substream,
 		struct snd_soc_dai *dai)
 {
 	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
-	int ret;
+	struct lpaif_i2sctl *i2sctl = drvdata->i2sctl;
+	unsigned int id = dai->driver->id;
+	int ret = -EINVAL;
 
 	ret = clk_prepare_enable(drvdata->mi2s_osr_clk[dai->driver->id]);
 	if (ret) {
 		dev_err(dai->dev, "error in enabling mi2s osr clk: %d\n", ret);
 		return ret;
 	}
-	ret = clk_prepare(drvdata->mi2s_bit_clk[dai->driver->id]);
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		ret = regmap_fields_write(i2sctl->spken, id,
+						 LPAIF_I2SCTL_SPKEN_ENABLE);
+	} else  {
+		ret = regmap_fields_write(i2sctl->micen, id,
+						 LPAIF_I2SCTL_MICEN_ENABLE);
+	}
+	if (ret)
+		dev_err(dai->dev, "error writing to i2sctl reg: %d\n",
+			ret);
+
+	ret = clk_prepare_enable(drvdata->mi2s_bit_clk[dai->driver->id]);
 	if (ret) {
 		dev_err(dai->dev, "error in enabling mi2s bit clk: %d\n", ret);
 		clk_disable_unprepare(drvdata->mi2s_osr_clk[dai->driver->id]);
@@ -93,9 +107,23 @@ static void lpass_cpu_daiops_shutdown(struct snd_pcm_substream *substream,
 		struct snd_soc_dai *dai)
 {
 	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	struct lpaif_i2sctl *i2sctl = drvdata->i2sctl;
+	unsigned int id = dai->driver->id;
+	int ret = -EINVAL;
 
 	clk_disable_unprepare(drvdata->mi2s_osr_clk[dai->driver->id]);
-	clk_unprepare(drvdata->mi2s_bit_clk[dai->driver->id]);
+	clk_disable_unprepare(drvdata->mi2s_bit_clk[dai->driver->id]);
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		ret = regmap_fields_write(i2sctl->spken, id,
+					 LPAIF_I2SCTL_SPKEN_DISABLE);
+	} else  {
+		ret = regmap_fields_write(i2sctl->micen, id,
+					 LPAIF_I2SCTL_MICEN_DISABLE);
+	}
+	if (ret)
+		dev_err(dai->dev, "error writing to i2sctl reg: %d\n",
+				ret);
 }
 
 static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
@@ -308,7 +336,8 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
 				ret);
 
 		clk_disable(drvdata->mi2s_bit_clk[dai->driver->id]);
-
+		break;
+	default:
 		break;
 	}
 
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

