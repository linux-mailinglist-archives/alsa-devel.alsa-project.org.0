Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCE5426C8C
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Oct 2021 16:11:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 275D81697;
	Fri,  8 Oct 2021 16:10:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 275D81697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633702304;
	bh=KSZPEiBGc45wkMGrx9c/kvDk+tNWfX6hksyIskJL1Es=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r5xwRokoKE4ghDipmSYqdXahwE4EfWODmJoPRx0nWn1qaU5t0bN2EkiI2IFFAWqk6
	 Lmo2xDY8MG5EhgeM7HsTr15+GCINXuDEF9r4bYCuxIUYL3RkqG4vNBxnIMfh782iTF
	 rbUeRfG+dSL+CZibhwXy2lBj+I2Opobbfy7mzm1A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10CC5F804F1;
	Fri,  8 Oct 2021 16:10:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73D0BF804F2; Fri,  8 Oct 2021 16:09:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79785F804CA
 for <alsa-devel@alsa-project.org>; Fri,  8 Oct 2021 16:09:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79785F804CA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="vcEfmTOo"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633702197; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=vLv8zXSfldkZsIV7umGX9K3bK/WOCeeVAW9XzgPbEcs=;
 b=vcEfmTOonhGqlP/kY880J8SmLiiAY6Wsz+oPIY5xziQZp544CjuiiwMrs7XD8VW4ngWPkXIw
 rwAludSLGqzQfsK4xjbZ+E7QRT9s28fJtFwTOsSO+Zb7nX0nEbh54EzNs2kdUWNsY2IV0vsK
 vkPr7Oahrv2KKQe+XtV9WYvEGss=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 61605131a45ca75307a623c2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 08 Oct 2021 14:09:53
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8BF53C4363B; Fri,  8 Oct 2021 14:09:52 +0000 (UTC)
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id F1FC3C4360D;
 Fri,  8 Oct 2021 14:09:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org F1FC3C4360D
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
Subject: [PATCH v3 5/5] ASoC: codecs: Change bulk clock voting to optional
 voting in digital codecs
Date: Fri,  8 Oct 2021 19:39:04 +0530
Message-Id: <1633702144-19017-6-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633702144-19017-1-git-send-email-srivasam@codeaurora.org>
References: <1633702144-19017-1-git-send-email-srivasam@codeaurora.org>
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

Change bulk clock frequency voting to optional bulk voting in va, rx and tx macros
to accommodate both ADSP and ADSP bypass based lpass architectures.

Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 2 +-
 sound/soc/codecs/lpass-tx-macro.c | 2 +-
 sound/soc/codecs/lpass-va-macro.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index c2b9333..2bed5cf 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3531,7 +3531,7 @@ static int rx_macro_probe(struct platform_device *pdev)
 	rx->clks[3].id = "npl";
 	rx->clks[4].id = "fsgen";
 
-	ret = devm_clk_bulk_get(dev, RX_NUM_CLKS_MAX, rx->clks);
+	ret = devm_clk_bulk_get_optional(dev, RX_NUM_CLKS_MAX, rx->clks);
 	if (ret) {
 		dev_err(dev, "Error getting RX Clocks (%d)\n", ret);
 		return ret;
diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index 6742405..a4c0a15 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -1796,7 +1796,7 @@ static int tx_macro_probe(struct platform_device *pdev)
 	tx->clks[3].id = "npl";
 	tx->clks[4].id = "fsgen";
 
-	ret = devm_clk_bulk_get(dev, TX_NUM_CLKS_MAX, tx->clks);
+	ret = devm_clk_bulk_get_optional(dev, TX_NUM_CLKS_MAX, tx->clks);
 	if (ret) {
 		dev_err(dev, "Error getting RX Clocks (%d)\n", ret);
 		return ret;
diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 70f09b4..11147e3 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -1408,7 +1408,7 @@ static int va_macro_probe(struct platform_device *pdev)
 	va->clks[1].id = "dcodec";
 	va->clks[2].id = "mclk";
 
-	ret = devm_clk_bulk_get(dev, VA_NUM_CLKS_MAX, va->clks);
+	ret = devm_clk_bulk_get_optional(dev, VA_NUM_CLKS_MAX, va->clks);
 	if (ret) {
 		dev_err(dev, "Error getting VA Clocks (%d)\n", ret);
 		return ret;
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

