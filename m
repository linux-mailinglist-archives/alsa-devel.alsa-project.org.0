Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6390643CAF7
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Oct 2021 15:44:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D238A16B3;
	Wed, 27 Oct 2021 15:43:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D238A16B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635342272;
	bh=Fthn7ngi9tiy4+9qZNYyzA1ucHl+bFYCBESghSHNSv0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Rx1VerGumdSiCuyIZgK66kRAAZmQpfRcQU4rySs5nNTqQ1qSqtnjwrHcO5kl4WmAd
	 ldJE3tJkaobj7zmmnyXgKYB7TGoJp7spvXfnNY3EiCcM6gnQEULJhIrXHZndrc8Cvi
	 RSSTMO5yuXF9C85X5tdp8QKFwGzebyA2KJ7ufGEU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F342F804EC;
	Wed, 27 Oct 2021 15:42:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5431AF804E7; Wed, 27 Oct 2021 15:42:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D71EF8049C
 for <alsa-devel@alsa-project.org>; Wed, 27 Oct 2021 15:42:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D71EF8049C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="aN0Jmfj1"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1635342134; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=J3EW1Zq2am1RTaPdOiCGqfwjRwDl6DkV6HGUmMii8GM=;
 b=aN0Jmfj1MAoZQtBNWpOxGZxmHkJOxabpVl4zXLPLzggknO7TZ/8Pf4y+3nESupPPnhuqu6UA
 wj9tTsa2Otmr7IXayyG6kU9jOqa/5ezTVEVyJco8KFiWhVftlljkxlSLoG2pXoYHB78JOI2P
 dNs5PkoOjzP1rg987adawjsmI2Q=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 617957342e144ac4d3edb0fb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 27 Oct 2021 13:42:12
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id EB607C4361A; Wed, 27 Oct 2021 13:42:11 +0000 (UTC)
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9ECC8C4360C;
 Wed, 27 Oct 2021 13:42:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 9ECC8C4360C
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
Subject: [PATCH v2 3/3] pinctrl: qcom: Add SC7280 lpass pin configuration
Date: Wed, 27 Oct 2021 19:11:37 +0530
Message-Id: <1635342097-2726-4-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635342097-2726-1-git-send-email-srivasam@codeaurora.org>
References: <1635342097-2726-1-git-send-email-srivasam@codeaurora.org>
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

Update pin control support for SC7280 LPASS LPI.

Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 40 ++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 0bd0c16..17a05a6 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -122,6 +122,7 @@ static const struct pinctrl_pin_desc lpass_lpi_pins[] = {
 	PINCTRL_PIN(11, "gpio11"),
 	PINCTRL_PIN(12, "gpio12"),
 	PINCTRL_PIN(13, "gpio13"),
+	PINCTRL_PIN(14, "gpio14"),
 };
 
 enum lpass_lpi_functions {
@@ -136,6 +137,7 @@ enum lpass_lpi_functions {
 	LPI_MUX_i2s1_ws,
 	LPI_MUX_i2s2_clk,
 	LPI_MUX_i2s2_data,
+	LPI_MUX_sc7280_i2s2_data,
 	LPI_MUX_i2s2_ws,
 	LPI_MUX_qua_mi2s_data,
 	LPI_MUX_qua_mi2s_sclk,
@@ -144,6 +146,7 @@ enum lpass_lpi_functions {
 	LPI_MUX_swr_rx_data,
 	LPI_MUX_swr_tx_clk,
 	LPI_MUX_swr_tx_data,
+	LPI_MUX_sc7280_swr_tx_data,
 	LPI_MUX_wsa_swr_clk,
 	LPI_MUX_wsa_swr_data,
 	LPI_MUX_gpio,
@@ -164,8 +167,11 @@ static const unsigned int gpio10_pins[] = { 10 };
 static const unsigned int gpio11_pins[] = { 11 };
 static const unsigned int gpio12_pins[] = { 12 };
 static const unsigned int gpio13_pins[] = { 13 };
+static const unsigned int gpio14_pins[] = { 14 };
+
 static const char * const swr_tx_clk_groups[] = { "gpio0" };
 static const char * const swr_tx_data_groups[] = { "gpio1", "gpio2", "gpio5" };
+static const char * const sc7280_swr_tx_data_groups[] = { "gpio1", "gpio2", "gpio14" };
 static const char * const swr_rx_clk_groups[] = { "gpio3" };
 static const char * const swr_rx_data_groups[] = { "gpio4", "gpio5" };
 static const char * const dmic1_clk_groups[] = { "gpio6" };
@@ -185,6 +191,7 @@ static const char * const i2s1_data_groups[] = { "gpio8", "gpio9" };
 static const char * const wsa_swr_clk_groups[] = { "gpio10" };
 static const char * const wsa_swr_data_groups[] = { "gpio11" };
 static const char * const i2s2_data_groups[] = { "gpio12", "gpio12" };
+static const char * const sc7280_i2s2_data_groups[] = { "gpio12", "gpio13" };
 
 static const struct lpi_pingroup sm8250_groups[] = {
 	LPI_PINGROUP(0, 0, swr_tx_clk, qua_mi2s_sclk, _, _),
@@ -203,6 +210,24 @@ static const struct lpi_pingroup sm8250_groups[] = {
 	LPI_PINGROUP(13, NO_SLEW, dmic3_data, i2s2_data, _, _),
 };
 
+static const struct lpi_pingroup sc7280_groups[] = {
+	LPI_PINGROUP(0, 0, swr_tx_clk, qua_mi2s_sclk, _, _),
+	LPI_PINGROUP(1, 2, swr_tx_data, qua_mi2s_ws, _, _),
+	LPI_PINGROUP(2, 4, swr_tx_data, qua_mi2s_data, _, _),
+	LPI_PINGROUP(3, 8, swr_rx_clk, qua_mi2s_data, _, _),
+	LPI_PINGROUP(4, 10, swr_rx_data, qua_mi2s_data, _, _),
+	LPI_PINGROUP(5, 12, swr_rx_data, _, _, _),
+	LPI_PINGROUP(6, NO_SLEW, dmic1_clk, i2s1_clk, _,  _),
+	LPI_PINGROUP(7, NO_SLEW, dmic1_data, i2s1_ws, _, _),
+	LPI_PINGROUP(8, NO_SLEW, dmic2_clk, i2s1_data, _, _),
+	LPI_PINGROUP(9, NO_SLEW, dmic2_data, i2s1_data, _, _),
+	LPI_PINGROUP(10, 16, i2s2_clk, wsa_swr_clk, _, _),
+	LPI_PINGROUP(11, 18, i2s2_ws, wsa_swr_data, _, _),
+	LPI_PINGROUP(12, NO_SLEW, dmic3_clk, sc7280_i2s2_data, _, _),
+	LPI_PINGROUP(13, NO_SLEW, dmic3_data, sc7280_i2s2_data, _, _),
+	LPI_PINGROUP(14, 6, sc7280_swr_tx_data, _, _, _),
+};
+
 static const struct lpi_function lpass_functions[] = {
 	LPI_FUNCTION(dmic1_clk),
 	LPI_FUNCTION(dmic1_data),
@@ -215,6 +240,7 @@ static const struct lpi_function lpass_functions[] = {
 	LPI_FUNCTION(i2s1_ws),
 	LPI_FUNCTION(i2s2_clk),
 	LPI_FUNCTION(i2s2_data),
+	LPI_FUNCTION(sc7280_i2s2_data),
 	LPI_FUNCTION(i2s2_ws),
 	LPI_FUNCTION(qua_mi2s_data),
 	LPI_FUNCTION(qua_mi2s_sclk),
@@ -223,6 +249,7 @@ static const struct lpi_function lpass_functions[] = {
 	LPI_FUNCTION(swr_rx_data),
 	LPI_FUNCTION(swr_tx_clk),
 	LPI_FUNCTION(swr_tx_data),
+	LPI_FUNCTION(sc7280_swr_tx_data),
 	LPI_FUNCTION(wsa_swr_clk),
 	LPI_FUNCTION(wsa_swr_data),
 };
@@ -236,6 +263,15 @@ static struct lpi_pinctrl_variant_data sm8250_lpi_data = {
 	.nfunctions = ARRAY_SIZE(lpass_functions),
 };
 
+static const struct lpi_pinctrl_variant_data sc7280_lpi_data = {
+	.pins = lpass_lpi_pins,
+	.npins = ARRAY_SIZE(lpass_lpi_pins),
+	.groups = sc7280_groups,
+	.ngroups = ARRAY_SIZE(sc7280_groups),
+	.functions = lpass_functions,
+	.nfunctions = ARRAY_SIZE(lpass_functions),
+};
+
 static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
 			 unsigned int addr)
 {
@@ -677,6 +713,10 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
 	       .compatible = "qcom,sm8250-lpass-lpi-pinctrl",
 	       .data = &sm8250_lpi_data,
 	},
+	{
+	       .compatible = "qcom,sc7280-lpass-lpi-pinctrl",
+	       .data = &sc7280_lpi_data,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

