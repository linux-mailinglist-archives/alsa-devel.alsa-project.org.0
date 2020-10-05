Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3E0282F64
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 06:19:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EF661855;
	Mon,  5 Oct 2020 06:18:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EF661855
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601871582;
	bh=kNeRtafXRU90Mz5oAqGThc0vhADhH9u0iZF4YQ1JDN8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EWLmG6geV79KIlpne3p/qxbk3wL767cIDWWke+BKNW9e0UAD5RtknkWDnDCLBpovK
	 kI/lQE7KhJc9WqWd+8VUuGPbxgLG96dT0wvMFo1Qn6d6iFrQosBvD81voOhysAecp4
	 0aJkfBheWPI6RJO1wSHJhuz86ygoVJApmsty1VwA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98A16F80322;
	Mon,  5 Oct 2020 06:14:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 292D9F80321; Mon,  5 Oct 2020 06:14:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DF5AF80308
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 06:14:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DF5AF80308
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="qca4rlG1"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1601871289; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=OyZzbSCMZvuV3yEOZsiya4LXwpjTPN3Uu7YR7mN2EKQ=;
 b=qca4rlG1RP8ZqOO1sZ75fb+9pTe3W6gVAdkUP2UeyVgn/Z17j9TdEs+omfrnO8e12UPykIak
 3K1WA8AuhMUlfxzAjKhnxTWLcdKWv6QLnrqlabAGnzwOut/diP69igSSnB91NTaTYfWK1pfV
 hSDe9yugk9YuR4Aub7/nPpIEkfE=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f7a9d9806d81bc48dadb90e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 05 Oct 2020 04:14:16
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C887DC43387; Mon,  5 Oct 2020 04:14:16 +0000 (UTC)
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 35A85C433CB;
 Mon,  5 Oct 2020 04:14:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 35A85C433CB
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
Subject: [PATCH v9 4/7] Asoc: qcom: lpass:Update lpaif_dmactl members order
Date: Mon,  5 Oct 2020 09:43:32 +0530
Message-Id: <1601871215-26200-5-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601871215-26200-1-git-send-email-srivasam@codeaurora.org>
References: <1601871215-26200-1-git-send-email-srivasam@codeaurora.org>
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

Update the lpaif_dmactl struct members order to match
HDMI reg map members sequence. Separate Interface reg map
as it is used for I2S control but not for HDMI control,
to make use of bulk API, which makes code more readable.

Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Srinivasa Rao <srivasam@codeaurora.org>
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

