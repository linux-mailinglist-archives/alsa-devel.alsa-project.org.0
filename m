Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1A15AF1C8
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 19:06:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 185871637;
	Tue,  6 Sep 2022 19:05:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 185871637
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662483995;
	bh=dTDIl5ElI/DFRyrNb8lSXqJFr/2FE9TvUUj2fmAOo+o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RX4CpH5/S0IjqOYoL5h+uB8Mdw/ztbAeonS6Eg8SUg5RkYTqoErMpmV5wBqlRIqG1
	 4mOVlA4ZWxsDZe8u1SXjg4kGsEPJalSfAyR+v7rTeZasTinPvkzODEndNhxCQ6W1vQ
	 S35pZWEmjS5Kg9kF6TEZix6bVn7vjOJ3Exsm6sjw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89BD0F805A1;
	Tue,  6 Sep 2022 19:02:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0242F8057A; Tue,  6 Sep 2022 19:02:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8A62F8053B
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 19:02:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8A62F8053B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="uh7RFVbh"
Received: by mail-wr1-x432.google.com with SMTP id t7so11384473wrm.10
 for <alsa-devel@alsa-project.org>; Tue, 06 Sep 2022 10:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=mG8/68Nd5p6XZNfAhdT98YGrwNfmwR141FpLjSTTCsc=;
 b=uh7RFVbh3hlpTGPDorwsH8R2nLEmp4+jlQNOI9EiFJ31/0Ykxmu4xRyR+fC4uD7Lpm
 oJDMIOoi18SVX2FocPN9rM2wGfUgWz6jq+IZGHlMQft9R/mXbKpAquExjYC1Rw0ihz6W
 Es1L9Mw8SO+HBsRuliZndqb7kPxFrlkEk3YmC16UwUSLP/9+nPuO8Ud+r1BFcfBdXjpX
 K0MXqsprT/C5o+Yzt+JhsT78JMvycWrlWjTCNmitIZb8dzBkuiAl6Qx2UknyX4LrA3F9
 Ha0LtmNxttQH45H6rjmeqFoJxMDk3WVPsDlc2OFNc+B8PSjagr6DShJHBl78+fjg10QK
 /B6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=mG8/68Nd5p6XZNfAhdT98YGrwNfmwR141FpLjSTTCsc=;
 b=YF9hq8sMl8nXPuiWa7jON6sI/zbVMAKBQOkQD9AAJdyngEElu9tqeaaqnHM2cMBXrB
 23i89tT4Ta4ddY5ZbDXE1kB9yccPOfIJnqTiTWlbFcAp7YxCqII5p3BBsYFbNvzjNfSw
 Eze16xOmaHqIRQ4e1dWatqMf8hpUh6/zdZgSqRTITNgj9KqTNerFzQDaGLxMXePXa4x/
 AjTh34361A9OkeK7LV2i9+TipkQRTOpoOdptG51qMomKsyGYPHHrB47+6bgJt9fyryL/
 zjB50WBuo6XUJpfl60meja8DaHmu61uV/8Mu4FPg8MGyaYDuaHwvxfyOLBsSDmTHEBS0
 DgIw==
X-Gm-Message-State: ACgBeo17Wg1qsgsutCheUqsbu+xawNmkL6/ACakj+Oa0/qxp9Q7ATOuj
 5/iAMCNY+7HnGPK1cD+CRSe6jg==
X-Google-Smtp-Source: AA6agR5o+WxhiVIt2WMx5uJpNoS9ENqcSmIrIAhT4pbo9v9ROfyHeGLlqZncQLhHUlTKORr4qAhk1A==
X-Received: by 2002:adf:f48e:0:b0:228:d490:564a with SMTP id
 l14-20020adff48e000000b00228d490564amr3552651wro.546.1662483739451; 
 Tue, 06 Sep 2022 10:02:19 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 x13-20020a1c7c0d000000b003a5ca627333sm21085967wmc.8.2022.09.06.10.02.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 10:02:18 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 12/12] ASoC: codecs: va-macro: add support for sm8450 and
 sc8280xp
Date: Tue,  6 Sep 2022 18:01:12 +0100
Message-Id: <20220906170112.1984-13-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220906170112.1984-1-srinivas.kandagatla@linaro.org>
References: <20220906170112.1984-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, bgoswami@quicinc.com,
 linux-kernel@vger.kernel.org
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

LPASS VA Macro now has soundwire master to deal with access to
analog mic in low power island use cases.

This is added after sc8280xp, add support for this.
Along with this also add compatibles for sm8450 and sc8280xp.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-va-macro.c | 74 +++++++++++++++++++++++++++++--
 1 file changed, 70 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index a35f684053d2..b0b6cf29cba3 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -25,6 +25,10 @@
 #define CDC_VA_FS_CONTROL_EN			BIT(0)
 #define CDC_VA_FS_COUNTER_CLR			BIT(1)
 #define CDC_VA_CLK_RST_CTRL_SWR_CONTROL		(0x0008)
+#define CDC_VA_SWR_RESET_MASK		BIT(1)
+#define CDC_VA_SWR_RESET_ENABLE		BIT(1)
+#define CDC_VA_SWR_CLK_EN_MASK		BIT(0)
+#define CDC_VA_SWR_CLK_ENABLE		BIT(0)
 #define CDC_VA_TOP_CSR_TOP_CFG0			(0x0080)
 #define CDC_VA_FS_BROADCAST_EN			BIT(1)
 #define CDC_VA_TOP_CSR_DMIC0_CTL		(0x0084)
@@ -66,6 +70,8 @@
 #define CDC_VA_TOP_CSR_SWR_MIC_CTL0		(0x00D0)
 #define CDC_VA_TOP_CSR_SWR_MIC_CTL1		(0x00D4)
 #define CDC_VA_TOP_CSR_SWR_MIC_CTL2		(0x00D8)
+#define CDC_VA_SWR_MIC_CLK_SEL_0_1_MASK		(0xEE)
+#define CDC_VA_SWR_MIC_CLK_SEL_0_1_DIV1		(0xCC)
 #define CDC_VA_TOP_CSR_SWR_CTRL			(0x00DC)
 #define CDC_VA_INP_MUX_ADC_MUX0_CFG0		(0x0100)
 #define CDC_VA_INP_MUX_ADC_MUX0_CFG1		(0x0104)
@@ -194,6 +200,7 @@ struct va_macro {
 	unsigned long active_ch_mask[VA_MACRO_MAX_DAIS];
 	unsigned long active_ch_cnt[VA_MACRO_MAX_DAIS];
 	u16 dmic_clk_div;
+	bool has_swr_master;
 
 	int dec_mode[VA_MACRO_NUM_DECIMATORS];
 	struct regmap *regmap;
@@ -216,6 +223,18 @@ struct va_macro {
 
 #define to_va_macro(_hw) container_of(_hw, struct va_macro, hw)
 
+struct va_macro_data {
+	bool has_swr_master;
+};
+
+static const struct va_macro_data sm8250_va_data = {
+	.has_swr_master = false,
+};
+
+static const struct va_macro_data sm8450_va_data = {
+	.has_swr_master = true,
+};
+
 static bool va_is_volatile_register(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
@@ -325,6 +344,9 @@ static bool va_is_rw_register(struct device *dev, unsigned int reg)
 	case CDC_VA_TOP_CSR_DMIC2_CTL:
 	case CDC_VA_TOP_CSR_DMIC3_CTL:
 	case CDC_VA_TOP_CSR_DMIC_CFG:
+	case CDC_VA_TOP_CSR_SWR_MIC_CTL0:
+	case CDC_VA_TOP_CSR_SWR_MIC_CTL1:
+	case CDC_VA_TOP_CSR_SWR_MIC_CTL2:
 	case CDC_VA_TOP_CSR_DEBUG_BUS:
 	case CDC_VA_TOP_CSR_DEBUG_EN:
 	case CDC_VA_TOP_CSR_TX_I2S_CTL:
@@ -1306,12 +1328,36 @@ static const struct snd_soc_component_driver va_macro_component_drv = {
 
 static int fsgen_gate_enable(struct clk_hw *hw)
 {
-	return va_macro_mclk_enable(to_va_macro(hw), true);
+	struct va_macro *va = to_va_macro(hw);
+	struct regmap *regmap = va->regmap;
+	int ret;
+
+	ret = va_macro_mclk_enable(va, true);
+	if (!va->has_swr_master)
+		return ret;
+
+	regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_SWR_CONTROL,
+			   CDC_VA_SWR_RESET_MASK,  CDC_VA_SWR_RESET_ENABLE);
+
+	regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_SWR_CONTROL,
+			   CDC_VA_SWR_CLK_EN_MASK,
+			   CDC_VA_SWR_CLK_ENABLE);
+	regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_SWR_CONTROL,
+			   CDC_VA_SWR_RESET_MASK, 0x0);
+
+	return ret;
 }
 
 static void fsgen_gate_disable(struct clk_hw *hw)
 {
-	va_macro_mclk_enable(to_va_macro(hw), false);
+	struct va_macro *va = to_va_macro(hw);
+	struct regmap *regmap = va->regmap;
+
+	if (va->has_swr_master)
+		regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_SWR_CONTROL,
+			   CDC_VA_SWR_CLK_EN_MASK, 0x0);
+
+	va_macro_mclk_enable(va, false);
 }
 
 static int fsgen_gate_is_enabled(struct clk_hw *hw)
@@ -1405,6 +1451,7 @@ static int va_macro_validate_dmic_sample_rate(u32 dmic_sample_rate,
 static int va_macro_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	const struct va_macro_data *data;
 	struct va_macro *va;
 	void __iomem *base;
 	u32 sample_rate = 0;
@@ -1459,6 +1506,9 @@ static int va_macro_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(dev, va);
 
+	data = of_device_get_match_data(dev);
+	va->has_swr_master = data->has_swr_master;
+
 	/* mclk rate */
 	clk_set_rate(va->mclk, 2 * VA_MACRO_MCLK_FREQ);
 
@@ -1484,6 +1534,20 @@ static int va_macro_probe(struct platform_device *pdev)
 		goto err_clkout;
 	}
 
+	if (va->has_swr_master) {
+		/* Set default CLK div to 1 */
+		regmap_update_bits(va->regmap, CDC_VA_TOP_CSR_SWR_MIC_CTL0,
+				  CDC_VA_SWR_MIC_CLK_SEL_0_1_MASK,
+				  CDC_VA_SWR_MIC_CLK_SEL_0_1_DIV1);
+		regmap_update_bits(va->regmap, CDC_VA_TOP_CSR_SWR_MIC_CTL1,
+				  CDC_VA_SWR_MIC_CLK_SEL_0_1_MASK,
+				  CDC_VA_SWR_MIC_CLK_SEL_0_1_DIV1);
+		regmap_update_bits(va->regmap, CDC_VA_TOP_CSR_SWR_MIC_CTL2,
+				  CDC_VA_SWR_MIC_CLK_SEL_0_1_MASK,
+				  CDC_VA_SWR_MIC_CLK_SEL_0_1_DIV1);
+
+	}
+
 	ret = devm_snd_soc_register_component(dev, &va_macro_component_drv,
 					      va_macro_dais,
 					      ARRAY_SIZE(va_macro_dais));
@@ -1558,8 +1622,10 @@ static const struct dev_pm_ops va_macro_pm_ops = {
 };
 
 static const struct of_device_id va_macro_dt_match[] = {
-	{ .compatible = "qcom,sc7280-lpass-va-macro" },
-	{ .compatible = "qcom,sm8250-lpass-va-macro" },
+	{ .compatible = "qcom,sc7280-lpass-va-macro", .data = &sm8250_va_data },
+	{ .compatible = "qcom,sm8250-lpass-va-macro", .data = &sm8250_va_data },
+	{ .compatible = "qcom,sm8450-lpass-va-macro", .data = &sm8450_va_data },
+	{ .compatible = "qcom,sc8280xp-lpass-va-macro", .data = &sm8450_va_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, va_macro_dt_match);
-- 
2.21.0

