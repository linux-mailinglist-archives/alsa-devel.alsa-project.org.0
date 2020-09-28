Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0639A27AB57
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Sep 2020 11:57:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9240D1ADB;
	Mon, 28 Sep 2020 11:56:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9240D1ADB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601287051;
	bh=lH1JfZ5mEUU/wZW8iZLaDwrYac5Pph+2CQsGTIH8J3U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=boOsGohqc0myJFhYeZLmP10lJzWB4OHoDDvJWOkfqoFlHN23GEU6BrvfutuB/jq1S
	 JCD9PfOsLmmTMsQJj1h8YhW76fKpTo+iA4vYr8CWxyRmniAdZFklHumIFflnrrmYKU
	 Z+CIKfbcxyDCe4HftVpNG4OGj7KxnztaRbV/5K+Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FD22F802C3;
	Mon, 28 Sep 2020 11:54:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5449F802E7; Mon, 28 Sep 2020 11:54:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1EA81F802C3
 for <alsa-devel@alsa-project.org>; Mon, 28 Sep 2020 11:54:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EA81F802C3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="BkGnPsxB"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1601286854; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=0IGwxuW6Gsr5JtLe05vuXxpI+onW4OczS/NphW3AC/M=;
 b=BkGnPsxBbd/BJ75LLVgp1xLxaBALLmYbcrpE64XxBRpV1ZSxmDeRz1KZRPV7WFdHgs7G8sFw
 H/H1rmQCeo4JxEf+WsVvtwEXGHLW32fBAg9HpAgY0fjYhGtmsenp9UKOeK822AkRIvw+1bAP
 GrF5Gc0uKfatYDPeXHTP33cYLC4=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f71b2c5ebb17452ba1e0dcb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 28 Sep 2020 09:54:13
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 41A16C433B1; Mon, 28 Sep 2020 09:54:11 +0000 (UTC)
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id F148BC433F1;
 Mon, 28 Sep 2020 09:54:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F148BC433F1
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
Subject: [PATCH v7 4/6] Asoc: qcom: lpass:Update lpaif_dmactl members order
Date: Mon, 28 Sep 2020 15:23:29 +0530
Message-Id: <1601286811-25962-5-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601286811-25962-1-git-send-email-srivasam@codeaurora.org>
References: <1601286811-25962-1-git-send-email-srivasam@codeaurora.org>
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

From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>

Update the lpaif_dmactl struct members order to match
HDMI reg map members sequence. Separate Interface reg map
as it is used for I2S control but not for HDMI control,
to make use of bulk API, which makes code more readable.

Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
---
 sound/soc/qcom/lpass-platform.c | 8 ++++----
 sound/soc/qcom/lpass.h          | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index e7cf4e5..db0d959 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -71,13 +71,13 @@ static int lpass_platform_alloc_dmactl_fields(struct device *dev,
 	rd_dmactl = drvdata->rd_dmactl;
 	wr_dmactl = drvdata->wr_dmactl;
 
-	rval = devm_regmap_field_bulk_alloc(dev, map, &rd_dmactl->bursten,
-					    &v->rdma_bursten, 6);
+	rval = devm_regmap_field_bulk_alloc(dev, map, &rd_dmactl->intf,
+					    &v->rdma_intf, 6);
 	if (rval)
 		return rval;
 
-	return devm_regmap_field_bulk_alloc(dev, map, &wr_dmactl->bursten,
-					    &v->wrdma_bursten, 6);
+	return devm_regmap_field_bulk_alloc(dev, map, &wr_dmactl->intf,
+					    &v->wrdma_intf, 6);
 }
 
 static int lpass_platform_pcmops_open(struct snd_soc_component *component,
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index 51c9991..7089d4c 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -31,9 +31,9 @@ struct lpaif_i2sctl {
 
 
 struct lpaif_dmactl {
+	struct regmap_field *intf;
 	struct regmap_field *bursten;
 	struct regmap_field *wpscnt;
-	struct regmap_field *intf;
 	struct regmap_field *fifowm;
 	struct regmap_field *enable;
 	struct regmap_field *dyncclk;
@@ -110,17 +110,17 @@ struct lpass_variant {
 	struct reg_field bitwidth;
 
 	/* RD_DMA Register fields */
+	struct reg_field rdma_intf;
 	struct reg_field rdma_bursten;
 	struct reg_field rdma_wpscnt;
-	struct reg_field rdma_intf;
 	struct reg_field rdma_fifowm;
 	struct reg_field rdma_enable;
 	struct reg_field rdma_dyncclk;
 
 	/* WR_DMA Register fields */
+	struct reg_field wrdma_intf;
 	struct reg_field wrdma_bursten;
 	struct reg_field wrdma_wpscnt;
-	struct reg_field wrdma_intf;
 	struct reg_field wrdma_fifowm;
 	struct reg_field wrdma_enable;
 	struct reg_field wrdma_dyncclk;
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

