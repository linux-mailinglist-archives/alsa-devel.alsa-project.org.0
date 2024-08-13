Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A8A95066A
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2024 15:26:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A335520E;
	Tue, 13 Aug 2024 15:26:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A335520E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723555604;
	bh=YDxB0HgopBggQswhaM9Nf30/Wv6HgEPuB5MAMQDxXIs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mpLL82fiBPYeA97vjFITto1RArl0A9eWQ3tIQdmLp/INkxr3+2Y/D5f0Www9EH1Z/
	 qyQgx1d7/OB8YWQCDRCYqxaDKsBqk2p/1ej0Kav/7HKsmVurP2Msp/g/e+1P1rkZe9
	 NFNbc6YM9vo62PdWmPGm0yCR3TvJrGwKaF0syT2M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C323F805DF; Tue, 13 Aug 2024 15:25:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E837BF805F9;
	Tue, 13 Aug 2024 15:25:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4B7EF80423; Tue, 13 Aug 2024 15:10:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B955FF8047C
	for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2024 15:10:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B955FF8047C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=eDkTzVa2
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-42817f1eb1fso38637735e9.1
        for <alsa-devel@alsa-project.org>;
 Tue, 13 Aug 2024 06:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723554613; x=1724159413;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NvFqdgdGTLbeV2IBiZybZvZVviH6ZKLzya6Ui6o1+og=;
        b=eDkTzVa2dnxSpWxn1xiAfxK8FtEVG/b17sRcwlN7keZCSTA97bHWPfM3PbR6iEeEIx
         +DCH0AlOUwQY/suVgS1mPHEgLouymkx0es8HpcP7MWJrRhkbOsXBt39HsR3nsTlp1PPm
         2WkLB9fymzV7omRrGHsMm9XPm5k95h7nUXzSbdFStF7Z/hvI19bXOMJdRkU0G/bnMV2Y
         nz2eUYMSodVkY9/UZ9Mj98DoWpKgBujetrkDyfQWhkg2K6HjYSks8n6/09oSPCQB9KXj
         5oj2xIyQUzYBDGIom5hFZQPrBAuEhI00HWCyBfHc0eq0WPvRGdpATCNElAd3tnBuCpmL
         uJ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723554613; x=1724159413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NvFqdgdGTLbeV2IBiZybZvZVviH6ZKLzya6Ui6o1+og=;
        b=YXZyLKljmvsHkgNUxxjPwVSc5kx0yppE8V306DU4hHyumfeAkrrYUO5j/zVqsI3wDx
         0e1P4bgOAxzBQBecUggznjovXXECrY9cvGDJWfAu7ZNTpiJDW6RqLudWUHS/oyI0qBcv
         5HsKl+rEqNusBSLfoAABwrI0T5JDIwULKQwjilv5PYg4UBTFQ9K1/MYiWPQnPLXR+KIx
         ja1N3OK51oYpX+s876U0OXE5waTCaG57PdA8E8hL1tJ6BsnNi1koguT7bNwMlr7aezm1
         up/OBPzCQiRfr0iM+GO9KjX59YjyWT5I/owYUNJnNVDZxlKgZDMGhAYNg0HrimOaljRs
         w2wA==
X-Gm-Message-State: AOJu0Yx2ydfg09cZH1kx0r/RKRrcNZlSmxKUuIYLZ4qWLkfx20RZqGBr
	WuCR46YDwFwPZ3QamKiMZsT5ZQLgKe5BYTrUbvtCwboOU1gt1RYtH/AkfJgC8pE=
X-Google-Smtp-Source: 
 AGHT+IFr6R1DpWudIdK2UY1bOf6WYcFVh4iOEtSuhgiHZqcRCa0lqDw4BllFA19PwIX+96XPSVJgIA==
X-Received: by 2002:a05:600c:2305:b0:428:e09d:3c with SMTP id
 5b1f17b1804b1-429d48e7af2mr24961855e9.33.1723554612987;
        Tue, 13 Aug 2024 06:10:12 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36e4c938280sm10305003f8f.36.2024.08.13.06.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 06:10:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 13 Aug 2024 15:09:50 +0200
Subject: [PATCH 4/6] soc: qcom: ocmem: use scoped device node handling to
 simplify error paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240813-b4-cleanup-h-of-node-put-other-v1-4-cfb67323a95c@linaro.org>
References: 
 <20240813-b4-cleanup-h-of-node-put-other-v1-0-cfb67323a95c@linaro.org>
In-Reply-To: 
 <20240813-b4-cleanup-h-of-node-put-other-v1-0-cfb67323a95c@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1306;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=YDxB0HgopBggQswhaM9Nf30/Wv6HgEPuB5MAMQDxXIs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmu1siVHCQ20U1/0c3igZrQElWbBLRyATq9fBlN
 F+5zmuH+maJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZrtbIgAKCRDBN2bmhouD
 1zbED/45WDZUHgP3RqB6w7yI2gsueMfYjV7TCCDzkdPzWodbwhKT9aOtyzZ8u6Nvu/VhqZ74CJn
 kgMTHSX2YZL4VHnkGRxfGRiw6TfagE2RDpkhmRlgg/55amHb8JlKBboZSID4mGP38knLAHuCr5d
 cFk+3m03hK7eWI352kn+S1JREEdN4Pjf8M1nUpeMBMTepZYnsPZqBQwuYUL36YEyw/h5SK5HWMp
 GWysgBX9xC31TRQSjqy3kVbq+hr8HTCwdQI373KQqVgdJ+tvv9KiZ4BKNTX/NH+JCr75+rTrety
 HZjYLIEwdhVHIUSX8MysgLQH1KcMjPggTMeQoZgxpDzMcaUc8Nt2V+o7PyeOJCmx1MPBQJG7+Vl
 zoQGETaGgP7RWWzsWasKZXQdyUwlwbdlcD/mJtAx80UIduzMW/z2YYMKR6BNYO4w43xjTN8bRSu
 QIQMNrgovYFSQozpl65x0ugXtaHPMJcxMN0OqXcazVZysVm67Sd4MqtLM8s38a1CzjZHpVpJ1FD
 H/l0sS37JzIkYoZbAqDbbFVrKa5Paz2BDPJ/KP2ZX/yG8R8JWoNn+gArLr3DvM22o0/veHPT9RA
 Yk+HJp5mncc87kzuj7MiHmTDIZLSX9ClbrkQ6/NM2Ai9o30UdeUQOEyEmWdG4jJFt2JNdeIquib
 mw5JqY6OXrxQoaw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: EFESKR4TPYF6AIOUZKI3KW4SHGVPUAD4
X-Message-ID-Hash: EFESKR4TPYF6AIOUZKI3KW4SHGVPUAD4
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EFESKR4TPYF6AIOUZKI3KW4SHGVPUAD4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Obtain the device node reference with scoped/cleanup.h to reduce error
handling and make the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soc/qcom/ocmem.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/qcom/ocmem.c b/drivers/soc/qcom/ocmem.c
index 6b6dd80cbc0f..ff8df7d75d6b 100644
--- a/drivers/soc/qcom/ocmem.c
+++ b/drivers/soc/qcom/ocmem.c
@@ -186,23 +186,20 @@ static void update_range(struct ocmem *ocmem, struct ocmem_buf *buf,
 struct ocmem *of_get_ocmem(struct device *dev)
 {
 	struct platform_device *pdev;
-	struct device_node *devnode;
 	struct ocmem *ocmem;
 
-	devnode = of_parse_phandle(dev->of_node, "sram", 0);
+	struct device_node *devnode __free(device_node) = of_parse_phandle(dev->of_node,
+									   "sram", 0);
 	if (!devnode || !devnode->parent) {
 		dev_err(dev, "Cannot look up sram phandle\n");
-		of_node_put(devnode);
 		return ERR_PTR(-ENODEV);
 	}
 
 	pdev = of_find_device_by_node(devnode->parent);
 	if (!pdev) {
 		dev_err(dev, "Cannot find device node %s\n", devnode->name);
-		of_node_put(devnode);
 		return ERR_PTR(-EPROBE_DEFER);
 	}
-	of_node_put(devnode);
 
 	ocmem = platform_get_drvdata(pdev);
 	if (!ocmem) {

-- 
2.43.0

