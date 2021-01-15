Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2BE2F711D
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jan 2021 04:46:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 359C016FF;
	Fri, 15 Jan 2021 04:45:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 359C016FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610682391;
	bh=cdA03ySb6CKYUpa8DOBv5+3JqjRThDbxdgqNJ+mZD5g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mYGyx9YNdtcGcx4BEhguwkUvlDhA4iilCf6QjcFYstYittFUf8DneLc2Vn/58YmQG
	 YMipuMu4GN1Xd7APn0p/8B9eij8adewla38kBxor1liQiF+aTN+g7Bd7t/4sPIaUQY
	 1WiLeNjy+4Tfs58+pV7o5ZZk+rd/DPnkm9fjGkyQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE805F804D2;
	Fri, 15 Jan 2021 04:43:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8CF0CF80134; Fri, 15 Jan 2021 04:43:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F228DF80254
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 04:43:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F228DF80254
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="ULgpNlpg"
Received: by mail-pl1-x62e.google.com with SMTP id r4so3995196pls.11
 for <alsa-devel@alsa-project.org>; Thu, 14 Jan 2021 19:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s9PD4ybSHZrcBjqJdCoM6Loutk4FCNAKb8nE3vMhAu8=;
 b=ULgpNlpghQ9NJjD5vXpJkCkxc5lpEZk+FKzDxjuV8U3gtUVPgS4zRvph+8sD0vuzHU
 kQvyNzl5N3kMb/BVxk35jR/bz8moMQ5n3zKWW/F/acBIEglyH5B4zMCpZlXDCXfv1SOb
 9h8ceUKhgzwe8+Hym9qjEKTFdhJwMjbVNZKdk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s9PD4ybSHZrcBjqJdCoM6Loutk4FCNAKb8nE3vMhAu8=;
 b=QG/YRSXOkawHuKdxzNLJVSas042XYuPrhMzTt0Eo8L2NGinlkbtclA8FHWvjXumzDE
 TRnsR9eanFBW5TP8BdPz4PtFMpbDEAJw+E1hqu05k3YP/UqADcAiWyamGMcWmaz88LwR
 H2iS1hsYwdEIFKn/ORL94HMGCDPUT9r0N+JQpIJRiwkbO4Tv6WeA1gWBoDGCnJs2R1F0
 qcQlahMNSgPFAyzmTqztGF+jiC21K/Rxsst6f6atVBkYIfHugsZnh2Gt8wjwJjI6+Y4/
 4ePW1XcZ7Y0qggfZ876RuYrUtfAtNbUaBjSssqRnQqubwAI05V9BvyckqasZXdrrrRgX
 qssQ==
X-Gm-Message-State: AOAM533Q/4cNPjSW23DJRfXTePKmm4cppiV8uGfIv4ZEfQzKNTsQ/MTs
 SZHEMzh5Ub9OvYNVqUaqDgGLCg==
X-Google-Smtp-Source: ABdhPJxzUj6LzFxBo07BcRycwd7BfBvw0qIjiQ85/31Woj+IflcM3doIGxugpkX9nsBytclcZTlsrQ==
X-Received: by 2002:a17:90a:4042:: with SMTP id
 k2mr8498240pjg.160.1610682213617; 
 Thu, 14 Jan 2021 19:43:33 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id u12sm6499062pfh.98.2021.01.14.19.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 19:43:33 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 3/4] ASoC: qcom: Stop casting away __iomem for error pointers
Date: Thu, 14 Jan 2021 19:43:26 -0800
Message-Id: <20210115034327.617223-4-swboyd@chromium.org>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
In-Reply-To: <20210115034327.617223-1-swboyd@chromium.org>
References: <20210115034327.617223-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Srinivasa Rao <srivasam@codeaurora.org>,
 V Sujith Kumar Reddy <vsujithk@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 Patrick Lai <plai@codeaurora.org>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Cheng-Yi Chiang <cychiang@chromium.org>
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

We don't need to cast away __iomem when testing with IS_ERR() or
converting with PTR_ERR(). Modern sparse can handle this just fine.
Drop it.

Cc: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Cc: Srinivasa Rao <srivasam@codeaurora.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Cheng-Yi Chiang <cychiang@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 sound/soc/qcom/lpass-cpu.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 40126202a4a3..b267fe8db3fc 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -788,10 +788,10 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-lpaif");
 
 	drvdata->lpaif = devm_ioremap_resource(dev, res);
-	if (IS_ERR((void const __force *)drvdata->lpaif)) {
+	if (IS_ERR(drvdata->lpaif)) {
 		dev_err(dev, "error mapping reg resource: %ld\n",
-				PTR_ERR((void const __force *)drvdata->lpaif));
-		return PTR_ERR((void const __force *)drvdata->lpaif);
+				PTR_ERR(drvdata->lpaif));
+		return PTR_ERR(drvdata->lpaif);
 	}
 
 	lpass_cpu_regmap_config.max_register = LPAIF_WRDMAPER_REG(variant,
@@ -810,10 +810,10 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-hdmiif");
 
 		drvdata->hdmiif = devm_ioremap_resource(dev, res);
-		if (IS_ERR((void const __force *)drvdata->hdmiif)) {
+		if (IS_ERR(drvdata->hdmiif)) {
 			dev_err(dev, "error mapping reg resource: %ld\n",
-					PTR_ERR((void const __force *)drvdata->hdmiif));
-			return PTR_ERR((void const __force *)drvdata->hdmiif);
+					PTR_ERR(drvdata->hdmiif));
+			return PTR_ERR(drvdata->hdmiif);
 		}
 
 		lpass_hdmi_regmap_config.max_register = LPAIF_HDMI_RDMAPER_REG(variant,
-- 
https://chromeos.dev

