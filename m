Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C58726B405F
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 14:25:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0397E175E;
	Fri, 10 Mar 2023 14:24:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0397E175E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678454747;
	bh=lz2C99wGv9Zk6fTFTeThPE/xxBmJoI/1pA86udLB1PA=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BgbwpMc3c5b+F4mUTJPz4IGrneJVHedOcImMK0lZ0EQ42r1ndBaZBhBrshtt5Kd13
	 OXAY8rOWxacImaUJ8MZG0bgPP9K+GKSlx89nUYI2ToEso/Td2SzucG7SvuoMCGAYOU
	 r2QwxPApjRDvvMBf7SZLDjlsZmAHbNLqrWIUcVWY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CACF3F8055B;
	Fri, 10 Mar 2023 14:22:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B4FFF804B1; Fri, 10 Mar 2023 14:22:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2F927F8051B
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 14:22:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F927F8051B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=JIQkZtAp
Received: by mail-ed1-x530.google.com with SMTP id s11so20331458edy.8
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Mar 2023 05:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678454533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YeDnl6eYe/Y1WHUjjQBiVQQ785HgKzOroIPYymGFtHY=;
        b=JIQkZtApYvCbzbSNsLyjszUm5ZltrUAYgrhR6dsl+1X2fMEMD5287v3iMgZKLL/Gf7
         1BV3eBn4craIdBuyzofyeHhHj4SyBwaiKGMaThJ6TaL6ebqGjkqIPH2JmFPhO5bVwDWc
         Ha4GehtuYrC8GzMn0y3zAZ6CLKE+w0WBxmwunF4nFRataYTPmTuncSHXq5ONUyledlhP
         To+7ypxXaKOcFwWjQtVdF9L0/m3wQk0Hp/DAW7DmDGyMZ87LCKvPJ+o0KbNAMdhDfLBa
         jNyTrjph1qtpbtVEFbjIFiMnwoVoYiE85g5+0Es9nDL7Z+ld0Dl3IuNdfCE3MdaotvKp
         Ox9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678454533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YeDnl6eYe/Y1WHUjjQBiVQQ785HgKzOroIPYymGFtHY=;
        b=eZiecvUUUNlUxnH6Av2UUZUjlRdaELoT0TGQkp5Q5XcZ1Po02gKczlUKufqfHLQg3g
         E7EW6oWqYHV+lJAeu8xu9vY0eCLGs5GQ3HUx1OKTzoGHFdoxAjLTq+QzwlO7MRpO3Il5
         Huux4H5shqNxwr9AhlqH0pQE54aNaSfaUL1KZQa0WDaZhyErUijWc2PsSkBY3wfPtw33
         GF+bNdA4/posUlc4BeI8Bo1mo1V+8nYjEDSktvoPknCrQZUD/YzPqB+PxHa0fhlT2cUQ
         0+BN1eP8AOK+N8QsWdnze5R0Qm4J0/vM0sHU9msRVmXWnmoEig9bcYYfbhycy35XtDIY
         zKQw==
X-Gm-Message-State: AO0yUKV/2HNGc1AP6VWZVS+4dSVMQQd0DFc9pzPABPc1+hfRM0SjCqE9
	0oJqGVxd5kEG1tLnFvPkWzpldA==
X-Google-Smtp-Source: 
 AK7set88AkgWffk6HYNIFQUMvmQ8KVcmU2jML2j4j71jiqRgBFuHLjnjJU1DOFwTomCcbkWOutVKgA==
X-Received: by 2002:a17:907:3f23:b0:84d:4e4f:1f85 with SMTP id
 hq35-20020a1709073f2300b0084d4e4f1f85mr33780491ejc.59.1678454533717;
        Fri, 10 Mar 2023 05:22:13 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:45c4:46be:ec71:4a51])
        by smtp.gmail.com with ESMTPSA id
 zc4-20020a170906988400b008b17879ec95sm959124ejb.22.2023.03.10.05.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 05:22:13 -0800 (PST)
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
Subject: [PATCH 9/9] ASoC: codecs: lpass-wsa-macro: add support for SM8550
Date: Fri, 10 Mar 2023 14:22:01 +0100
Message-Id: <20230310132201.322148-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310132201.322148-1-krzysztof.kozlowski@linaro.org>
References: <20230310132201.322148-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UP4KPRBIQUNSBJSEF7YTIXYCJHCQFFBA
X-Message-ID-Hash: UP4KPRBIQUNSBJSEF7YTIXYCJHCQFFBA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UP4KPRBIQUNSBJSEF7YTIXYCJHCQFFBA/>
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
---
 sound/soc/codecs/lpass-wsa-macro.c | 38 +++++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index ba7480f3831e..5155362de111 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -246,6 +246,9 @@
 #define WSA_MACRO_EC_MIX_TX1_MASK 0x18
 #define WSA_MACRO_MAX_DMA_CH_PER_PORT 0x2
 
+/* NPL clock is expected */
+#define WSA_MACRO_FLAG_HAS_NPL_CLOCK		BIT(0)
+
 enum {
 	WSA_MACRO_GAIN_OFFSET_M1P5_DB,
 	WSA_MACRO_GAIN_OFFSET_0_DB,
@@ -2346,7 +2349,10 @@ static int wsa_macro_register_mclk_output(struct wsa_macro *wsa)
 	struct clk_init_data init;
 	int ret;
 
-	parent_clk_name = __clk_get_name(wsa->npl);
+	if (wsa->npl)
+		parent_clk_name = __clk_get_name(wsa->npl);
+	else
+		parent_clk_name = __clk_get_name(wsa->mclk);
 
 	init.name = "mclk";
 	of_property_read_string(dev_of_node(dev), "clock-output-names",
@@ -2379,9 +2385,12 @@ static int wsa_macro_probe(struct platform_device *pdev)
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
@@ -2398,9 +2407,11 @@ static int wsa_macro_probe(struct platform_device *pdev)
 	if (IS_ERR(wsa->mclk))
 		return PTR_ERR(wsa->mclk);
 
-	wsa->npl = devm_clk_get(dev, "npl");
-	if (IS_ERR(wsa->npl))
-		return PTR_ERR(wsa->npl);
+	if (flags & WSA_MACRO_FLAG_HAS_NPL_CLOCK) {
+		wsa->npl = devm_clk_get(dev, "npl");
+		if (IS_ERR(wsa->npl))
+			return PTR_ERR(wsa->npl);
+	}
 
 	wsa->fsgen = devm_clk_get(dev, "fsgen");
 	if (IS_ERR(wsa->fsgen))
@@ -2553,10 +2564,21 @@ static const struct dev_pm_ops wsa_macro_pm_ops = {
 };
 
 static const struct of_device_id wsa_macro_dt_match[] = {
-	{.compatible = "qcom,sc7280-lpass-wsa-macro"},
-	{.compatible = "qcom,sm8250-lpass-wsa-macro"},
-	{.compatible = "qcom,sm8450-lpass-wsa-macro"},
-	{.compatible = "qcom,sc8280xp-lpass-wsa-macro" },
+	{
+		.compatible = "qcom,sc7280-lpass-wsa-macro",
+		.data = (void *)WSA_MACRO_FLAG_HAS_NPL_CLOCK,
+	}, {
+		.compatible = "qcom,sm8250-lpass-wsa-macro",
+		.data = (void *)WSA_MACRO_FLAG_HAS_NPL_CLOCK,
+	}, {
+		.compatible = "qcom,sm8450-lpass-wsa-macro",
+		.data = (void *)WSA_MACRO_FLAG_HAS_NPL_CLOCK,
+	}, {
+		.compatible = "qcom,sm8550-lpass-wsa-macro",
+	}, {
+		.compatible = "qcom,sc8280xp-lpass-wsa-macro",
+		.data = (void *)WSA_MACRO_FLAG_HAS_NPL_CLOCK,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, wsa_macro_dt_match);
-- 
2.34.1

