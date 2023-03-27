Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CC56CA5C6
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 15:26:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDFE4DF5;
	Mon, 27 Mar 2023 15:25:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDFE4DF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679923608;
	bh=t07sxcXzkpF7bZu1ybuEwzbOfvE1YvDkHqHz1cB33uc=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LlbcESfbRmgs07HLrIWVVHm1pSMCulmPZUmjjMCpUz07nhT0Fb95/oeLUn9pbUfj0
	 ji7qVlN408lkKB57HxeV5p4k5c2P3mrcaULoIYofHn1V6Z2oG4ESB3E+l2eJb1IVuZ
	 PXfl1A68lt/hSdmLPyFlh0lm5/knG6niKCZclxXU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 97315F805A9;
	Mon, 27 Mar 2023 15:23:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60408F80529; Mon, 27 Mar 2023 15:23:30 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 527F6F80544
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 15:23:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 527F6F80544
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=f/5TMMjI
Received: by mail-ed1-x534.google.com with SMTP id ek18so36171107edb.6
        for <alsa-devel@alsa-project.org>;
 Mon, 27 Mar 2023 06:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679923401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FjQpUfEO0NsE7N3bLT5uR7/QoLqyWyEQKa6IuwI/2/Q=;
        b=f/5TMMjIfCgndJMlaJ4r71lbXVsNskze6ZnT/CIHAv6BxV9SLh4v8fyC88l8kU85U2
         rBuuo9mpNQroSu66yJ+POn8fD3VptqUzEncPkYpeIuk1IEmjjHw+0o1Hh1D3DxAnNoon
         M4CO6AT+7YDrU0CwU7qbo5QXem3KQ035DCr2lS5QQIZM7RSeD7VwuN2fPgKaD1i84dVz
         fMug82jTJauGI7kjWHYTHY2qRwDTWT4eE+CwoHSdufk68x530YMC2eAH6+ALuKLziA1Z
         Na8OVqga5M6b10mcS3g9uttyq31xzK+aaoniJII5oRksHGW3biJbt8MLE19umzxrlDz5
         Y1sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679923401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FjQpUfEO0NsE7N3bLT5uR7/QoLqyWyEQKa6IuwI/2/Q=;
        b=ae1FEsrnO58OMEJ0R3Fz5U/PFR7rVlHzUpRF8X2lRkOBOks3EZaB70L1gPa1f3ceW2
         mfndQf7q2GbBnZm2gj4IWXRXNEQO27aKopQIBfWvYIDeNdl0EVDLgWtX0JtrooKq80WG
         WSeoFsKyDphFR9NJFxolADrQ7PHZQ2CRLnNWn7nRwLaRLUTwJk3VAW8pkPtFz5PsRyMg
         BaTWvbvhliyovuKmsmNceHjDqg2pR2k2NCorhhjzIHx7UFan6GfFTof5TRCo4/zAlNZ1
         Aqo21lwFN6ZWJp9e3L59ho+Fq2iI8tYVWe1w4NxsWSTgIOoEFSd9dCCby/3ci4nOmCU2
         QyWA==
X-Gm-Message-State: AAQBX9da4I1/Zo5Wmq3xNDppQoR9/Oe4wc6pVSU68onifhovc/jvvosn
	NPgVDZI09WsL9VEEotCU4QDRYQ==
X-Google-Smtp-Source: 
 AKy350ZUl+vUbD/HZJiigKbFVDkPZWimDS0mWigAI07cv5eEwg9rsxZejhZUO4wjuY3K/PLlHqV1aw==
X-Received: by 2002:a17:907:d402:b0:930:ca4d:f2bf with SMTP id
 vi2-20020a170907d40200b00930ca4df2bfmr14281716ejc.54.1679923400927;
        Mon, 27 Mar 2023 06:23:20 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:581e:789c:7616:5ee])
        by smtp.gmail.com with ESMTPSA id
 gy24-20020a170906f25800b00930445428acsm14286814ejb.14.2023.03.27.06.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 06:23:20 -0700 (PDT)
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
Subject: [PATCH v3 10/10] ASoC: codecs: lpass-wsa-macro: add support for
 SM8550
Date: Mon, 27 Mar 2023 15:22:54 +0200
Message-Id: <20230327132254.147975-11-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230327132254.147975-1-krzysztof.kozlowski@linaro.org>
References: <20230327132254.147975-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: APNO5XZEQYS4PUOWCLTRSTEC3ZNY5NMQ
X-Message-ID-Hash: APNO5XZEQYS4PUOWCLTRSTEC3ZNY5NMQ
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Patrick Lai <quic_plai@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/APNO5XZEQYS4PUOWCLTRSTEC3ZNY5NMQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add support for the WSA macro codec on Qualcomm SM8550.  SM8550 does not
use NPL clock, thus add flags allowing to skip it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

---

Changes since v1:
1. Move the flag define to common header
---
 sound/soc/codecs/lpass-wsa-macro.c | 37 +++++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 6484c335bd5d..8ba7dc89daaa 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -14,6 +14,8 @@
 #include <linux/pm_runtime.h>
 #include <linux/of_platform.h>
 #include <sound/tlv.h>
+
+#include "lpass-macro-common.h"
 #include "lpass-wsa-macro.h"
 
 #define CDC_WSA_CLK_RST_CTRL_MCLK_CONTROL	(0x0000)
@@ -2346,7 +2348,10 @@ static int wsa_macro_register_mclk_output(struct wsa_macro *wsa)
 	struct clk_init_data init;
 	int ret;
 
-	parent_clk_name = __clk_get_name(wsa->npl);
+	if (wsa->npl)
+		parent_clk_name = __clk_get_name(wsa->npl);
+	else
+		parent_clk_name = __clk_get_name(wsa->mclk);
 
 	init.name = "mclk";
 	of_property_read_string(dev_of_node(dev), "clock-output-names",
@@ -2379,9 +2384,12 @@ static int wsa_macro_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct wsa_macro *wsa;
+	kernel_ulong_t flags;
 	void __iomem *base;
 	int ret;
 
+	flags = (kernel_ulong_t)device_get_match_data(dev);
+
 	wsa = devm_kzalloc(dev, sizeof(*wsa), GFP_KERNEL);
 	if (!wsa)
 		return -ENOMEM;
@@ -2398,9 +2406,11 @@ static int wsa_macro_probe(struct platform_device *pdev)
 	if (IS_ERR(wsa->mclk))
 		return PTR_ERR(wsa->mclk);
 
-	wsa->npl = devm_clk_get(dev, "npl");
-	if (IS_ERR(wsa->npl))
-		return PTR_ERR(wsa->npl);
+	if (flags & LPASS_MACRO_FLAG_HAS_NPL_CLOCK) {
+		wsa->npl = devm_clk_get(dev, "npl");
+		if (IS_ERR(wsa->npl))
+			return PTR_ERR(wsa->npl);
+	}
 
 	wsa->fsgen = devm_clk_get(dev, "fsgen");
 	if (IS_ERR(wsa->fsgen))
@@ -2551,10 +2561,21 @@ static const struct dev_pm_ops wsa_macro_pm_ops = {
 };
 
 static const struct of_device_id wsa_macro_dt_match[] = {
-	{.compatible = "qcom,sc7280-lpass-wsa-macro"},
-	{.compatible = "qcom,sm8250-lpass-wsa-macro"},
-	{.compatible = "qcom,sm8450-lpass-wsa-macro"},
-	{.compatible = "qcom,sc8280xp-lpass-wsa-macro" },
+	{
+		.compatible = "qcom,sc7280-lpass-wsa-macro",
+		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
+	}, {
+		.compatible = "qcom,sm8250-lpass-wsa-macro",
+		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
+	}, {
+		.compatible = "qcom,sm8450-lpass-wsa-macro",
+		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
+	}, {
+		.compatible = "qcom,sm8550-lpass-wsa-macro",
+	}, {
+		.compatible = "qcom,sc8280xp-lpass-wsa-macro",
+		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, wsa_macro_dt_match);
-- 
2.34.1

