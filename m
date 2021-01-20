Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA0F2FC5E1
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 01:34:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73C4918D7;
	Wed, 20 Jan 2021 01:33:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73C4918D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611102889;
	bh=OpXsu9kLTmekJ11FUkFaDEBRv55KzBptY6c4XJKpZXM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CThZjHqv6m3FELCJ1sqsYo2Fxgq5OZlWZCwyOMHvhnUlS9TwveVMfHhEnz30S/qur
	 c9NyHVT1hvupNGZ8PUbJtniNjGMopSWHLp48rYaK461RBD8JMnnSFcFqKZSCebB0gX
	 23vCWSpPpe/03UW1qnfqDmDM8u+JuFYPG++Tzw4Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18A73F804D8;
	Wed, 20 Jan 2021 01:32:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F096F800FE; Wed, 20 Jan 2021 01:32:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21105F800FE
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 01:32:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21105F800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="chUHWZ5m"
Received: by mail-lf1-x131.google.com with SMTP id b26so31772666lff.9
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 16:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fQq5aMM1gfhP3pdE9BLkOlrfG0TdZlw8DX8e6i8Mgq8=;
 b=chUHWZ5mhJU4JGaLn/t7ZUUMT7ekqVsQRieJ2DMkmTdlCWigAXZElF17fl+NVBCtcF
 88tPjKnzNjJbQ3OAxqFVxyNoJXouTyC4G/3cJ6yQZ8Ho561XXPivpWwN3IAizMiitIhU
 IE7N1HJOGkfTMUzf2xO873dCxq9Yp8kIgeGYKMhoBIUyr6M+G4yAoP6jG/cTqcGqPxF5
 aqXQt8U4+tvSsad6fPUIc0kkec4UmESY9EVbo/xMDKKe4fsT1xIXrhgHtdFqhmLhFwP8
 0I4KyaffJdAj/4+1cnWws+nzqlk1fdua38eb2aRW3j+23su2NLhehvTQlOtDyhBShwTo
 uS5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fQq5aMM1gfhP3pdE9BLkOlrfG0TdZlw8DX8e6i8Mgq8=;
 b=Tj91DXkM8NHYxMKFSVem5Ho6afjSdPhQnSrqE3Y0zSB1IF2uA4SnKNDtWRpwicAzQ8
 Nnc6/+2e6JZTMh5cpyzNQZCXFf+6ZD8hAjP+VIPExzfzNFNiaUt7SAz5vuBIKA78eX8F
 KTVFWzf4OJC+xMOHxxQ75IKSt0Wp92JX1Q4l75xkKXSEuljwWuVb1UMEqeeHI/8uLAdC
 4z1RkM6AsxKYVtAHefeAqP2Mqs0tZz3i2Og6n4uhCqIJZ5j2JNQUxLAyCgkrmmgh2qaP
 jR0i8GNR84j/BHSD2lIxsx6Q+ks54ODrO7QIvKj0SYsDU5ua1sv0fAoDv+jmKhyc3uX2
 ebBg==
X-Gm-Message-State: AOAM530YG9pNP7fklw0EoxDsaeMiEYiu/z7EorgJZjocvXkgZICCDYZ5
 lf815Zc2hwsWenB9AyHFy8o=
X-Google-Smtp-Source: ABdhPJyINFwmCuSEz3SwkwQbZgcIhCFMpG6UVCoawsoZ+euU/4XalJp6swlgpoHoBmofInNxrnw1BQ==
X-Received: by 2002:ac2:518d:: with SMTP id u13mr2896249lfi.169.1611102723988; 
 Tue, 19 Jan 2021 16:32:03 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id s27sm17710ljd.25.2021.01.19.16.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 16:32:03 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Sameer Pujar <spujar@nvidia.com>,
 Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Matt Merhar <mattmerhar@protonmail.com>,
 Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH v3 1/6] ALSA: hda/tegra: Use clk_bulk helpers
Date: Wed, 20 Jan 2021 03:31:49 +0300
Message-Id: <20210120003154.26749-2-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120003154.26749-1-digetx@gmail.com>
References: <20210120003154.26749-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
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

Use clk_bulk helpers to make code cleaner. Note that this patch changed
the order in which clocks are enabled to make code look nicer, but this
doesn't matter in terms of hardware.

Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30 audio works
Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30 boot-tested
Tested-by: Nicolas Chauvet <kwizart@gmail.com> # TK1 boot-tested
Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/pci/hda/hda_tegra.c | 68 ++++++---------------------------------
 1 file changed, 9 insertions(+), 59 deletions(-)

diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index 361cf2041911..a25bf7083c28 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -70,9 +70,8 @@
 struct hda_tegra {
 	struct azx chip;
 	struct device *dev;
-	struct clk *hda_clk;
-	struct clk *hda2codec_2x_clk;
-	struct clk *hda2hdmi_clk;
+	struct clk_bulk_data clocks[3];
+	unsigned int nclocks;
 	void __iomem *regs;
 	struct work_struct probe_work;
 };
@@ -113,36 +112,6 @@ static void hda_tegra_init(struct hda_tegra *hda)
 	writel(v, hda->regs + HDA_IPFS_INTR_MASK);
 }
 
-static int hda_tegra_enable_clocks(struct hda_tegra *data)
-{
-	int rc;
-
-	rc = clk_prepare_enable(data->hda_clk);
-	if (rc)
-		return rc;
-	rc = clk_prepare_enable(data->hda2codec_2x_clk);
-	if (rc)
-		goto disable_hda;
-	rc = clk_prepare_enable(data->hda2hdmi_clk);
-	if (rc)
-		goto disable_codec_2x;
-
-	return 0;
-
-disable_codec_2x:
-	clk_disable_unprepare(data->hda2codec_2x_clk);
-disable_hda:
-	clk_disable_unprepare(data->hda_clk);
-	return rc;
-}
-
-static void hda_tegra_disable_clocks(struct hda_tegra *data)
-{
-	clk_disable_unprepare(data->hda2hdmi_clk);
-	clk_disable_unprepare(data->hda2codec_2x_clk);
-	clk_disable_unprepare(data->hda_clk);
-}
-
 /*
  * power management
  */
@@ -186,7 +155,7 @@ static int __maybe_unused hda_tegra_runtime_suspend(struct device *dev)
 		azx_stop_chip(chip);
 		azx_enter_link_reset(chip);
 	}
-	hda_tegra_disable_clocks(hda);
+	clk_bulk_disable_unprepare(hda->nclocks, hda->clocks);
 
 	return 0;
 }
@@ -198,7 +167,7 @@ static int __maybe_unused hda_tegra_runtime_resume(struct device *dev)
 	struct hda_tegra *hda = container_of(chip, struct hda_tegra, chip);
 	int rc;
 
-	rc = hda_tegra_enable_clocks(hda);
+	rc = clk_bulk_prepare_enable(hda->nclocks, hda->clocks);
 	if (rc != 0)
 		return rc;
 	if (chip && chip->running) {
@@ -268,29 +237,6 @@ static int hda_tegra_init_chip(struct azx *chip, struct platform_device *pdev)
 	return 0;
 }
 
-static int hda_tegra_init_clk(struct hda_tegra *hda)
-{
-	struct device *dev = hda->dev;
-
-	hda->hda_clk = devm_clk_get(dev, "hda");
-	if (IS_ERR(hda->hda_clk)) {
-		dev_err(dev, "failed to get hda clock\n");
-		return PTR_ERR(hda->hda_clk);
-	}
-	hda->hda2codec_2x_clk = devm_clk_get(dev, "hda2codec_2x");
-	if (IS_ERR(hda->hda2codec_2x_clk)) {
-		dev_err(dev, "failed to get hda2codec_2x clock\n");
-		return PTR_ERR(hda->hda2codec_2x_clk);
-	}
-	hda->hda2hdmi_clk = devm_clk_get(dev, "hda2hdmi");
-	if (IS_ERR(hda->hda2hdmi_clk)) {
-		dev_err(dev, "failed to get hda2hdmi clock\n");
-		return PTR_ERR(hda->hda2hdmi_clk);
-	}
-
-	return 0;
-}
-
 static int hda_tegra_first_init(struct azx *chip, struct platform_device *pdev)
 {
 	struct hda_tegra *hda = container_of(chip, struct hda_tegra, chip);
@@ -495,7 +441,11 @@ static int hda_tegra_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	err = hda_tegra_init_clk(hda);
+	hda->clocks[hda->nclocks++].id = "hda";
+	hda->clocks[hda->nclocks++].id = "hda2hdmi";
+	hda->clocks[hda->nclocks++].id = "hda2codec_2x";
+
+	err = devm_clk_bulk_get(&pdev->dev, hda->nclocks, hda->clocks);
 	if (err < 0)
 		goto out_free;
 
-- 
2.29.2

