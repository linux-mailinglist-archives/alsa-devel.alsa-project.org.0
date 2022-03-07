Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3814CF3E6
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 09:46:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3E3B1727;
	Mon,  7 Mar 2022 09:45:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3E3B1727
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646642805;
	bh=6r+XgMIsU4Ie3CXYXDqh0oHUBh0ouTe2elUDO80bRME=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QEVqqvXxbCY7TNocl1ILUE09/o6N2v9mDzDcyokp2nC0PfiI8cm44joXzOpyfYDKi
	 WMSXZVxprt5GaMI83CGMx0xlYAj3bSMNGlSWS022X66bQ2oygfd9qiTqufuCPmkxE7
	 3sZnO07pNSdPdKLqHqUGczSpsMChd31G9AS9BaA0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66BCFF80159;
	Mon,  7 Mar 2022 09:45:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2D93F8013F; Mon,  7 Mar 2022 09:45:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2605EF800D1
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 09:45:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2605EF800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="T4NVnNiG"
Received: by mail-pj1-x1034.google.com with SMTP id bx5so12700884pjb.3
 for <alsa-devel@alsa-project.org>; Mon, 07 Mar 2022 00:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=UnOTdbP36uQdWVvv2vJzAekSb/8o0Oe+p5E2vt+S+ug=;
 b=T4NVnNiGS1Muf3VR2in4zLSK86XJVDGHoEhJhvCUEBQ+3tcPvmrHZUpGvRdlsjtcs4
 U50wcXlRgK+zhrWV4Wrq7XTvZzb4ISOwQ8GfCw9hBFWbMhrW/Y7VgTyvNsV5s1mX/4F0
 PteXB58we6VQrZz/q/4fA4WHXnzyDUYTObtckFHPN7mJSn38eeBSU4xrpIkXPHrT0GV2
 oBB+NXcHG99GIGXSUo+aaDBjkOKwar1nIUmQQ3w85UlQNLGbp02jdmZ/DPoh3YegGzJt
 7qAvtXrpxJ9VoYFidxl64YYlwOxIGuxDp8vp0NKP9xuTzd83QKaS11o4RUcdxNumWZ99
 tSFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=UnOTdbP36uQdWVvv2vJzAekSb/8o0Oe+p5E2vt+S+ug=;
 b=CDxFBos8ti7D9pETlsE5XPFqoAND773hMVjJSgW2wF349s9ucCmL+QuncOaKkVpaTz
 WUxy5tcuVkABItMkYoe6rzi9dsAurd/I5famRZzr8UXbhaa/lXgnW1fQYJ/jZtDcKqv3
 hgUUwfXCP36IruXRoMqyByMKTDMzezVTmHbV9suL8U9XPlUJqk7HwIKl+swNQqMU7Z8b
 cUXCfeqJ1JkrlJMPdnWJBsNaEV64diThVx2Nyn9KhiBcWC6uChVT5lCn4mT9dB0Gu4EN
 Cx9VWM0Fb7HEVv6683HZBDoK/WIOG14NSTA8+azQEYEbthA7vRcK1UUendrjS/zWbWPn
 FGLg==
X-Gm-Message-State: AOAM531Qh+n8YXRqSupiypRV7jVYBENL6F4Tzvas0hd0H5FxUnIvyNS1
 WkHyeLK9uhEK4ITZqo+1HZ0=
X-Google-Smtp-Source: ABdhPJxr0p4VCR38LEhMY2qMANg8ktrD0H+xhr3U1pYrZh5H3mjPOrE5RdurcbcW+/wY8D7+31RCXA==
X-Received: by 2002:a17:90b:4b4a:b0:1bf:83d:6805 with SMTP id
 mi10-20020a17090b4b4a00b001bf083d6805mr24461078pjb.174.1646642728807; 
 Mon, 07 Mar 2022 00:45:28 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 a133-20020a621a8b000000b004f6a79008ddsm12541851pfa.45.2022.03.07.00.45.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 00:45:28 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: msm8916-wcd-digital: Fix missing
 clk_disable_unprepare() in msm8916_wcd_digital_probe
Date: Mon,  7 Mar 2022 08:45:22 +0000
Message-Id: <20220307084523.28687-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linmq006@gmail.com
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

Fix the missing clk_disable_unprepare() before return
from msm8916_wcd_digital_probe in the error handling case.

Fixes: 150db8c5afa1 ("ASoC: codecs: Add msm8916-wcd digital codec")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 sound/soc/codecs/msm8916-wcd-digital.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/msm8916-wcd-digital.c b/sound/soc/codecs/msm8916-wcd-digital.c
index fcc10c8bc625..9ad7fc0baf07 100644
--- a/sound/soc/codecs/msm8916-wcd-digital.c
+++ b/sound/soc/codecs/msm8916-wcd-digital.c
@@ -1201,7 +1201,7 @@ static int msm8916_wcd_digital_probe(struct platform_device *pdev)
 	ret = clk_prepare_enable(priv->mclk);
 	if (ret < 0) {
 		dev_err(dev, "failed to enable mclk %d\n", ret);
-		return ret;
+		goto err_clk;
 	}
 
 	dev_set_drvdata(dev, priv);
@@ -1209,6 +1209,9 @@ static int msm8916_wcd_digital_probe(struct platform_device *pdev)
 	return devm_snd_soc_register_component(dev, &msm8916_wcd_digital,
 				      msm8916_wcd_digital_dai,
 				      ARRAY_SIZE(msm8916_wcd_digital_dai));
+err_clk:
+	clk_disable_unprepare(priv->ahbclk);
+	return ret;
 }
 
 static int msm8916_wcd_digital_remove(struct platform_device *pdev)
-- 
2.17.1

