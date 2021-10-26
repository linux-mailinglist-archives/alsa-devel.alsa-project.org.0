Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E4943AD7F
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Oct 2021 09:46:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E972916F0;
	Tue, 26 Oct 2021 09:45:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E972916F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635234380;
	bh=795ps4P4FFU0VIVfhuJBeeOnth1l5EKFxLpxS5ySk8k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ddvuf/Ge5Emb4Uc/iRvbpm1/r2kv5Fr+GRb+Ffufll9hiJxPxiu6XzBGhjmDonV/z
	 83VED1eIY/pWqMxlV/rvaQeTxVlAmx8ja5sROavaLsPoDv0BWCqLw/FcJ2EBs/o8GB
	 XpHXkDH8jXbyCrnwSrTMyt1eiR0Qy1Lp+dUh6NnM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BFBAF804F3;
	Tue, 26 Oct 2021 09:44:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5CD40F804F1; Tue, 26 Oct 2021 09:44:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7F2DF804E2
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 09:43:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7F2DF804E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="wLIpKOJc"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1635234241; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=BOMh+4VdrRQoVapnfn25fcCYKN01T4UssNLI0xClgb0=;
 b=wLIpKOJcdQaqwJbXuKSvsMYzENSbC+h05EPQvPiBFXnpnSIzuuOzj4HQSpbcn1G5DpER5Lq5
 31p+PrYfym6lRaNR9hn8kPoh1xV1zcBzDR+qr/g9U7ncS64RUE6DzFC04jahIHIDntYQiQqw
 SrI04VYwqglrezIkMXlq0OOQFcw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 6177b1b4fd91319f0f4e3750 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 26 Oct 2021 07:43:48
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0B834C43617; Tue, 26 Oct 2021 07:43:48 +0000 (UTC)
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 622B7C43460;
 Tue, 26 Oct 2021 07:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 622B7C43460
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
Subject: [PATCH v4 4/5] ASoC: codecs: tx-macro: Update tx default values
Date: Tue, 26 Oct 2021 13:13:07 +0530
Message-Id: <1635234188-7746-5-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635234188-7746-1-git-send-email-srivasam@codeaurora.org>
References: <1635234188-7746-1-git-send-email-srivasam@codeaurora.org>
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

Update mic control register default values to hardware reset values
lpass sc7280.

Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
---
 sound/soc/codecs/lpass-tx-macro.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index d472af1..6742405 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -272,7 +272,7 @@ struct tx_macro {
 
 static const DECLARE_TLV_DB_SCALE(digital_gain, -8400, 100, -8400);
 
-static const struct reg_default tx_defaults[] = {
+static struct reg_default tx_defaults[] = {
 	/* TX Macro */
 	{ CDC_TX_CLK_RST_CTRL_MCLK_CONTROL, 0x00 },
 	{ CDC_TX_CLK_RST_CTRL_FS_CNT_CONTROL, 0x00 },
@@ -1781,9 +1781,10 @@ static const struct snd_soc_component_driver tx_macro_component_drv = {
 static int tx_macro_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
 	struct tx_macro *tx;
 	void __iomem *base;
-	int ret;
+	int ret, reg;
 
 	tx = devm_kzalloc(dev, sizeof(*tx), GFP_KERNEL);
 	if (!tx)
@@ -1805,6 +1806,20 @@ static int tx_macro_probe(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
+	/* Update defaults for lpass sc7280 */
+	if (of_device_is_compatible(np, "qcom,sc7280-lpass-tx-macro")) {
+		for (reg = 0; reg < ARRAY_SIZE(tx_defaults); reg++) {
+			switch (tx_defaults[reg].reg) {
+			case CDC_TX_TOP_CSR_SWR_AMIC0_CTL:
+			case CDC_TX_TOP_CSR_SWR_AMIC1_CTL:
+				tx_defaults[reg].def = 0x0E;
+				break;
+			default:
+				break;
+			}
+		}
+	}
+
 	tx->regmap = devm_regmap_init_mmio(dev, base, &tx_regmap_config);
 
 	dev_set_drvdata(dev, tx);
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

