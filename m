Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 116246B4054
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 14:24:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61BA1185D;
	Fri, 10 Mar 2023 14:23:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61BA1185D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678454664;
	bh=h7RM655AcdQjRMwtijNsqpUhz/Td+V4qRQ01ePQlxh8=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nriPMDpsuf7fJ+CUE36eRqGxHmkROtoP0yCKM3XA7JZ1aBeE2VFnTEqt3ggPTGiJh
	 s5AFOKsw+/AUiMn3L9Jjb3sr/WioCFGVUrMgM0klyBcuPreOLA7WcSs5Hoge4k64hg
	 iVmDF9M1lUcml2aWYeq54edtXehC5PEmZApng9qY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E7AF3F8053B;
	Fri, 10 Mar 2023 14:22:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5020F804FE; Fri, 10 Mar 2023 14:22:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DF654F8007E
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 14:22:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF654F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=EckjYIrE
Received: by mail-ed1-x534.google.com with SMTP id x3so20274070edb.10
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Mar 2023 05:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678454527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rto2D5OftYK1ID57dBSGS4QnEMib23DRCG76xg1zNII=;
        b=EckjYIrE4DJhMp6xe6dqYs9joBiyI1ngPyS/0OY9GgOP2nTQbi+9ZebR+rNljPuG36
         F/SyIj/rGDkrmCfzmx3Wg9DE/aVxU/s9cDsnSlyRpYEGL+KbGPIpmitQLhPyZNnryIyU
         6zwGgeGjcbTfKLAiqbdnwJzQvJN82nFfO6MY+2NjScneBbpLX1sRNJBvP1OIkffYoVxa
         XAVB8JDDrtlaz8FpxsLLA/2mjiJOJ2uHc62ToAcxhEIOQuT4VTRx55ZRE5DFxEqCQt1h
         ripnr9yzUtuZMAWmvBV/6gNz9XDXf/k01ARRcA+So1FaTcFAVzNrxd6FNTXiJQlbKTBo
         3aKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678454527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rto2D5OftYK1ID57dBSGS4QnEMib23DRCG76xg1zNII=;
        b=oENH11CUgzGJ3A3YJ9LL8ZhdVTkvaOVrpAmT3Pc48RVUUcNPaLspnYO1mxulXEYjqu
         HpvnYN6PnUubWi4yX3b9ZccWJvjayTZPPMGcgoxr1zVcafSN9liyltSv5+yfwABxApZE
         6617pSnM2aumc1PqC+suJvxZDdBSBTOxIfE8gbyfCqeCgjrMAk0bzLHM8l2oPlRKA9Xq
         9AUjwTGWiMXQQ0UbvKGTxCcDn3sgSKGCl02wNTQC68xCDqfveqiLmmDMqE/WBDLGgm7W
         QB9GwaqhkDydpVBGbtIXLWtYTU9lmfrCoWW652uUi1YhLxCxShUPvb9b0ifME2eBSdZe
         HMIw==
X-Gm-Message-State: AO0yUKVKb3A4l8FlHTntb2+MvBHH2xVsuOF0T5eZu7O6hLsAfPZp9/VI
	f/s+YM0edo4HEWvcvA3Osu+lsQ==
X-Google-Smtp-Source: 
 AK7set+O3ImPHzDIFLhFK5/g1q7pHfzB69yohRjQEKyKjOzXBvIq6vsr/mv67mV4NXtNeqiTtWIRJw==
X-Received: by 2002:a17:906:2bc2:b0:8b1:7de3:cfb4 with SMTP id
 n2-20020a1709062bc200b008b17de3cfb4mr24517931ejg.4.1678454527437;
        Fri, 10 Mar 2023 05:22:07 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:45c4:46be:ec71:4a51])
        by smtp.gmail.com with ESMTPSA id
 zc4-20020a170906988400b008b17879ec95sm959124ejb.22.2023.03.10.05.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 05:22:07 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/9] ASoC: codecs: lpass-rx-macro: add support for SM8550
Date: Fri, 10 Mar 2023 14:21:55 +0100
Message-Id: <20230310132201.322148-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310132201.322148-1-krzysztof.kozlowski@linaro.org>
References: <20230310132201.322148-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KOCWBODXWCX5ZLALMGBRZPM5BMDJAWAP
X-Message-ID-Hash: KOCWBODXWCX5ZLALMGBRZPM5BMDJAWAP
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KOCWBODXWCX5ZLALMGBRZPM5BMDJAWAP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add support for the RX macro codec on Qualcomm SM8550.  SM8550 does not
use NPL clock, thus add flags allowing to skip it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 39 ++++++++++++++++++++++++-------
 1 file changed, 31 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index a73a7d7a1c0a..e322d918db36 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -395,6 +395,9 @@
 #define COMP_MAX_COEFF 25
 #define RX_NUM_CLKS_MAX	5
 
+/* NPL clock is expected */
+#define RX_MACRO_FLAG_HAS_NPL_CLOCK		BIT(0)
+
 struct comp_coeff_val {
 	u8 lsb;
 	u8 msb;
@@ -3491,7 +3494,10 @@ static int rx_macro_register_mclk_output(struct rx_macro *rx)
 	struct clk_init_data init;
 	int ret;
 
-	parent_clk_name = __clk_get_name(rx->npl);
+	if (rx->npl)
+		parent_clk_name = __clk_get_name(rx->npl);
+	else
+		parent_clk_name = __clk_get_name(rx->mclk);
 
 	init.name = clk_name;
 	init.ops = &swclk_gate_ops;
@@ -3521,10 +3527,13 @@ static const struct snd_soc_component_driver rx_macro_component_drv = {
 static int rx_macro_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	kernel_ulong_t flags;
 	struct rx_macro *rx;
 	void __iomem *base;
 	int ret;
 
+	flags = (kernel_ulong_t)device_get_match_data(dev);
+
 	rx = devm_kzalloc(dev, sizeof(*rx), GFP_KERNEL);
 	if (!rx)
 		return -ENOMEM;
@@ -3541,9 +3550,11 @@ static int rx_macro_probe(struct platform_device *pdev)
 	if (IS_ERR(rx->mclk))
 		return PTR_ERR(rx->mclk);
 
-	rx->npl = devm_clk_get(dev, "npl");
-	if (IS_ERR(rx->npl))
-		return PTR_ERR(rx->npl);
+	if (flags & RX_MACRO_FLAG_HAS_NPL_CLOCK) {
+		rx->npl = devm_clk_get(dev, "npl");
+		if (IS_ERR(rx->npl))
+			return PTR_ERR(rx->npl);
+	}
 
 	rx->fsgen = devm_clk_get(dev, "fsgen");
 	if (IS_ERR(rx->fsgen))
@@ -3655,10 +3666,22 @@ static int rx_macro_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id rx_macro_dt_match[] = {
-	{ .compatible = "qcom,sc7280-lpass-rx-macro" },
-	{ .compatible = "qcom,sm8250-lpass-rx-macro" },
-	{ .compatible = "qcom,sm8450-lpass-rx-macro" },
-	{ .compatible = "qcom,sc8280xp-lpass-rx-macro" },
+	{
+		.compatible = "qcom,sc7280-lpass-rx-macro",
+		.data = (void *)RX_MACRO_FLAG_HAS_NPL_CLOCK,
+
+	}, {
+		.compatible = "qcom,sm8250-lpass-rx-macro",
+		.data = (void *)RX_MACRO_FLAG_HAS_NPL_CLOCK,
+	}, {
+		.compatible = "qcom,sm8450-lpass-rx-macro",
+		.data = (void *)RX_MACRO_FLAG_HAS_NPL_CLOCK,
+	}, {
+		.compatible = "qcom,sm8550-lpass-rx-macro",
+	}, {
+		.compatible = "qcom,sc8280xp-lpass-rx-macro",
+		.data = (void *)RX_MACRO_FLAG_HAS_NPL_CLOCK,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, rx_macro_dt_match);
-- 
2.34.1

