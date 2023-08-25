Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A149788DD0
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Aug 2023 19:27:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD672857;
	Fri, 25 Aug 2023 19:26:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD672857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692984446;
	bh=+NN8XrEaFBygmo3q/e38Bu/eRF3y7vIEUdBDz81oARw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EPfdDqXS9/am15GClHVG9ZTfTFNY71VH7hCDP3CprDfMxJFx+OpH2DlQA1tOMDfHd
	 Mj9fJcO9E/6oRao5R+hDLB1hOOWdbXdczDk2c6neGjSh3AfLrposyxrK0Iz8gnXyJl
	 34sZdr8MFlpe3e6T2K+2Q1IWqXbnK5PO0FRqA4wg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22141F80549; Fri, 25 Aug 2023 19:25:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C8399F80549;
	Fri, 25 Aug 2023 19:25:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A1A8F800D1; Fri, 25 Aug 2023 19:23:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BDA5CF800F5
	for <alsa-devel@alsa-project.org>; Fri, 25 Aug 2023 19:23:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDA5CF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=GLVQRR0u
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2b9c907bc68so17768701fa.2
        for <alsa-devel@alsa-project.org>;
 Fri, 25 Aug 2023 10:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692984202; x=1693589002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zgZvHL8hFswLYwPF8AuRbBMK7oSEIDIwPQTcWj9HdOU=;
        b=GLVQRR0uqz7h3mQtbUDjl9KTg9wErpM6VkLfEbYi5c6RumHoQDQau59jJOZR/a72EL
         RbR7Tz7YcIWnHUtdHuF/Y47W01Kz2aYojHdPM7AInofd/QaNRKuXjrLG9ZutsVUenVCE
         95QiaH6WtlpdnjqMTJpl4gfQ5KpVptXQ4RtHkooUTBK64il+bYztIx5gvR1Nr7L6zl6k
         of9RBaLaOZYy9qWKiYn+Zeg6ql0rop5CA9J6zzbUoyI8vKePJYvr2IViClxE8TsRLbnX
         0K2F4IH0BCU8cu+X6nD2nDuPODM3Tu3RQYYHf0wghvgxsm/m3c8VBqIoEuRFiGHNZlRx
         47eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692984202; x=1693589002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zgZvHL8hFswLYwPF8AuRbBMK7oSEIDIwPQTcWj9HdOU=;
        b=ioFvmdzoecUd1SG+HDTFTc3s5E6VkR3iItB4t35gp9hYdmzvpxlbLVGLB+3dLCPcpN
         GPsyyVGpHt9oS1F0y2DpQRdu/5XTheAzvUeH7WFD8fHRJ0Wj1wzJCCDhbutQ1aSF/55G
         owO7HOu5FnGmQv/GoQtEBFWcP/sUQaahEsOTqD5f4w70vgkVe/xuE9XRAmPfp6d52fym
         eCFSn9g0PTO7ss7G23WUEvt1EALy/BNsGKI0S/8xpXB144xXNKEzjsUEsasEFnVuV1vX
         yFEBZ/+LsZksuC8p0V34XZ6em5XtXQeH7lxxb/nBfJZ2ToSmv5B5wPHfoMJiAB4akNms
         UUsA==
X-Gm-Message-State: AOJu0YwEuZ8bOsBP7QFlq8MrEgmXoL+0uHbXI4yu47wK5pTWDpTRhZQM
	MTU/E8EPt5ycDw0i82TkjeCgVw==
X-Google-Smtp-Source: 
 AGHT+IGEWTWl4FE5/sIMoCZYj5tNQhpLyEV1B/4/UDUeu8WyCLiRwN1y6zdZ489KTOTHVvEld8lL/g==
X-Received: by 2002:a2e:6a03:0:b0:2bc:d993:b7ba with SMTP id
 f3-20020a2e6a03000000b002bcd993b7bamr7286415ljc.27.1692984202704;
        Fri, 25 Aug 2023 10:23:22 -0700 (PDT)
Received: from [192.168.1.101] (abxh59.neoplus.adsl.tpnet.pl. [83.9.1.59])
        by smtp.gmail.com with ESMTPSA id
 n11-20020a2e904b000000b002bcb1e1322asm407647ljg.63.2023.08.25.10.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 10:23:22 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 25 Aug 2023 19:23:13 +0200
Subject: [PATCH 2/2] ASoC: codecs: lpass-tx-macro: Add SM6115 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230825-topic-6115tx-v1-2-ebed201ad54b@linaro.org>
References: <20230825-topic-6115tx-v1-0-ebed201ad54b@linaro.org>
In-Reply-To: <20230825-topic-6115tx-v1-0-ebed201ad54b@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692984198; l=3082;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=+NN8XrEaFBygmo3q/e38Bu/eRF3y7vIEUdBDz81oARw=;
 b=PU8ItgsZg+K3RccuAVuAqM2PAzOyCQhzUKWthiWh3L6UofpAK5W3bKNmtGaPMdLJoFiUUi6zf
 3rLk7uFbnPtAvqytAVbHnLiVI7gkllxNwXze/kEeL6zDIkXc/aDdDGR
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Message-ID-Hash: NIZEK26KFOVCCR6FA6ZLOHS74ADCQIB4
X-Message-ID-Hash: NIZEK26KFOVCCR6FA6ZLOHS74ADCQIB4
X-MailFrom: konrad.dybcio@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NIZEK26KFOVCCR6FA6ZLOHS74ADCQIB4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SM6115 has a TX macro, which surprisingly doesn't host a SWR master.
Conditionally skip the SWR reset sequence on this platform.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 sound/soc/codecs/lpass-macro-common.h |  2 ++
 sound/soc/codecs/lpass-tx-macro.c     | 22 +++++++++++++++-------
 2 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
index 4eb886565ea3..d3684c7ab930 100644
--- a/sound/soc/codecs/lpass-macro-common.h
+++ b/sound/soc/codecs/lpass-macro-common.h
@@ -8,6 +8,8 @@
 
 /* NPL clock is expected */
 #define LPASS_MACRO_FLAG_HAS_NPL_CLOCK		BIT(0)
+/* The soundwire block should be internally reset at probe */
+#define LPASS_MACRO_FLAG_RESET_SWR		BIT(1)
 
 struct lpass_macro {
 	struct device *macro_pd;
diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index 3e33418898e8..82f9873ffada 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -2045,15 +2045,19 @@ static int tx_macro_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_fsgen;
 
+
 	/* reset soundwire block */
-	regmap_update_bits(tx->regmap, CDC_TX_CLK_RST_CTRL_SWR_CONTROL,
-			   CDC_TX_SWR_RESET_MASK, CDC_TX_SWR_RESET_ENABLE);
+	if (flags & LPASS_MACRO_FLAG_RESET_SWR)
+		regmap_update_bits(tx->regmap, CDC_TX_CLK_RST_CTRL_SWR_CONTROL,
+				   CDC_TX_SWR_RESET_MASK, CDC_TX_SWR_RESET_ENABLE);
 
 	regmap_update_bits(tx->regmap, CDC_TX_CLK_RST_CTRL_SWR_CONTROL,
 			   CDC_TX_SWR_CLK_EN_MASK,
 			   CDC_TX_SWR_CLK_ENABLE);
-	regmap_update_bits(tx->regmap, CDC_TX_CLK_RST_CTRL_SWR_CONTROL,
-			   CDC_TX_SWR_RESET_MASK, 0x0);
+
+	if (flags & LPASS_MACRO_FLAG_RESET_SWR)
+		regmap_update_bits(tx->regmap, CDC_TX_CLK_RST_CTRL_SWR_CONTROL,
+				   CDC_TX_SWR_RESET_MASK, 0x0);
 
 	ret = devm_snd_soc_register_component(dev, &tx_macro_component_drv,
 					      tx_macro_dai,
@@ -2158,18 +2162,22 @@ static const struct dev_pm_ops tx_macro_pm_ops = {
 static const struct of_device_id tx_macro_dt_match[] = {
 	{
 		.compatible = "qcom,sc7280-lpass-tx-macro",
+		.data = (void *)(LPASS_MACRO_FLAG_HAS_NPL_CLOCK | LPASS_MACRO_FLAG_RESET_SWR),
+	}, {
+		.compatible = "qcom,sm6115-lpass-tx-macro",
 		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
 	}, {
 		.compatible = "qcom,sm8250-lpass-tx-macro",
-		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
+		.data = (void *)(LPASS_MACRO_FLAG_HAS_NPL_CLOCK | LPASS_MACRO_FLAG_RESET_SWR),
 	}, {
 		.compatible = "qcom,sm8450-lpass-tx-macro",
-		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
+		.data = (void *)(LPASS_MACRO_FLAG_HAS_NPL_CLOCK | LPASS_MACRO_FLAG_RESET_SWR),
 	}, {
 		.compatible = "qcom,sm8550-lpass-tx-macro",
+		.data = (void *)LPASS_MACRO_FLAG_RESET_SWR,
 	}, {
 		.compatible = "qcom,sc8280xp-lpass-tx-macro",
-		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
+		.data = (void *)(LPASS_MACRO_FLAG_HAS_NPL_CLOCK | LPASS_MACRO_FLAG_RESET_SWR),
 	},
 	{ }
 };

-- 
2.42.0

