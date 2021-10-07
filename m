Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0074254B7
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Oct 2021 15:50:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69A411677;
	Thu,  7 Oct 2021 15:50:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69A411677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633614654;
	bh=U67mEu4o3rUhhgqHCN0dWJHaliUoZ7cpuRBCXszaqm8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qsw5DkcqwwrKfQpUKj+wo1PQrtNcJcBSWP0CpDx97NK9PU1BekxHQ66poSh76J+yZ
	 BLAx4meB4djbKeA0SsD5uyLrHwhkCyi4gG90M+Gc9P+5SFjYwcFDBBpH6S4r2oOkQC
	 4DNZ1zg+hC+cHWcz8DJiYYHCOTkrKWWhDKBEZBdU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 456C3F80259;
	Thu,  7 Oct 2021 15:49:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F08A0F80130; Thu,  7 Oct 2021 15:49:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45D5AF80130
 for <alsa-devel@alsa-project.org>; Thu,  7 Oct 2021 15:49:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45D5AF80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="cpt2fhUM"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633614547; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=2COdjL6MyKrKao9ChAdANYNgR6vT/GglFxDuG5lHGoA=;
 b=cpt2fhUMYLl2HURTbe+0TvUQE1R4oac4uNopPV7TG1CeY19fQGTLAdx6Sk+RCGVaNB2dHdNS
 1rFa1sJe5MuCsmbdng7bAZ/zS+1w7ou/H6OkYlrQ37k8eYeEZAMy0z6aoVI0shgzc+YIUg/N
 /40yNR/L7dt/TD2ELoXGPPtm6Xs=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 615efad1446c6db0cb2860c9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 07 Oct 2021 13:49:05
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1C1FFC4361A; Thu,  7 Oct 2021 13:49:05 +0000 (UTC)
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id BC342C43617;
 Thu,  7 Oct 2021 13:48:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org BC342C43617
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
Subject: [PATCH 1/3] pinctrl: qcom: Update lpass variant independent functions
 as generic
Date: Thu,  7 Oct 2021 19:18:37 +0530
Message-Id: <1633614519-26680-2-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633614519-26680-1-git-send-email-srivasam@codeaurora.org>
References: <1633614519-26680-1-git-send-email-srivasam@codeaurora.org>
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

Update pin control variable names to make common for all lpass varients.

Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 2f19ab4..c0117c5 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -107,7 +107,7 @@ struct lpi_pinctrl {
 };
 
 /* sm8250 variant specific data */
-static const struct pinctrl_pin_desc sm8250_lpi_pins[] = {
+static const struct pinctrl_pin_desc lpass_lpi_pins[] = {
 	PINCTRL_PIN(0, "gpio0"),
 	PINCTRL_PIN(1, "gpio1"),
 	PINCTRL_PIN(2, "gpio2"),
@@ -124,7 +124,8 @@ static const struct pinctrl_pin_desc sm8250_lpi_pins[] = {
 	PINCTRL_PIN(13, "gpio13"),
 };
 
-enum sm8250_lpi_functions {
+
+enum lpass_lpi_functions {
 	LPI_MUX_dmic1_clk,
 	LPI_MUX_dmic1_data,
 	LPI_MUX_dmic2_clk,
@@ -203,7 +204,7 @@ static const struct lpi_pingroup sm8250_groups[] = {
 	LPI_PINGROUP(13, NO_SLEW, dmic3_data, i2s2_data, _, _),
 };
 
-static const struct lpi_function sm8250_functions[] = {
+static const struct lpi_function lpass_functions[] = {
 	LPI_FUNCTION(dmic1_clk),
 	LPI_FUNCTION(dmic1_data),
 	LPI_FUNCTION(dmic2_clk),
@@ -228,12 +229,12 @@ static const struct lpi_function sm8250_functions[] = {
 };
 
 static struct lpi_pinctrl_variant_data sm8250_lpi_data = {
-	.pins = sm8250_lpi_pins,
-	.npins = ARRAY_SIZE(sm8250_lpi_pins),
+	.pins = lpass_lpi_pins,
+	.npins = ARRAY_SIZE(lpass_lpi_pins),
 	.groups = sm8250_groups,
 	.ngroups = ARRAY_SIZE(sm8250_groups),
-	.functions = sm8250_functions,
-	.nfunctions = ARRAY_SIZE(sm8250_functions),
+	.functions = lpass_functions,
+	.nfunctions = ARRAY_SIZE(lpass_functions),
 };
 
 static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
@@ -615,7 +616,7 @@ static int lpi_pinctrl_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(pctrl->slew_base),
 				     "Slew resource not provided\n");
 
-	ret = devm_clk_bulk_get(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
+	ret = devm_clk_bulk_get_optional(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
 	if (ret)
 		return dev_err_probe(dev, ret, "Can't get clocks\n");
 
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

