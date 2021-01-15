Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F86B2F7D93
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jan 2021 15:04:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E48E17A8;
	Fri, 15 Jan 2021 15:03:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E48E17A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610719435;
	bh=OiqMasFlYFTMeFv2S6eKxeE8ApKhcKBA0UX9CqWyvQA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JxIJWWV1wRbkmHEAt4LAe/lL9ccF/wAcsdFi4SF3HQ+8m0cAc9TeFsqcf21KeCy6T
	 p0gPTTR/LAhR1srHYua9ezxuEYwqusg7VVt2iG/DGnhE2h/MAHcocDbby3laA9at0G
	 FaUjiOWPgvQxE17ajPbQSuDP73BlBsNBkTpu3Qkw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6415F8026B;
	Fri, 15 Jan 2021 15:02:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0FF2F8026B; Fri, 15 Jan 2021 15:02:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CB81F80134
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 15:02:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CB81F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="k8/AHNV5"
Received: by mail-lj1-x22a.google.com with SMTP id m13so10438206ljo.11
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 06:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uVkqDfNQ/EnFgo5jXovd2Jva9z2rUJt5+5HSBeWXzh8=;
 b=k8/AHNV5vFQMmcQ36DuxnWRApxG0nrgnzbBvKSIHN+UXTGkPrX9/6U26N20Tp9IwvZ
 gRabXEn8Em5u+J6AWuFk39HDXdCXs16hj0iuFUAF+PzvC6fKL0UDxxW50EQO+otAf4kh
 gNnBMc81wLSjdzBNlrf9bAsFmSPyxiM1w/dhOkY7xNdxgbzFlaSJFKYI+ze32YxQyuZo
 vafJX9Ul/oFgMEFZbDPL+itg2VmHq+eB61QnVmt0ri5lQXaCsjL5CaCdggU89YcedAAT
 8RhNuYQwK9xctZ5FhFimPXQdePeSJOf1G22kQNrjsiREhk3Pv1aPeB2fFN9WWS+H3SCd
 AFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uVkqDfNQ/EnFgo5jXovd2Jva9z2rUJt5+5HSBeWXzh8=;
 b=HRLbR5YcGqJtuTOl5mQY4u7gC/BDlN6PXXtTDpv9SIIuS2zZqizJml9AhDQTcyNXxK
 0oeiLrp0lsjzbSMykPgntfsC8ita0OtZOVZfogVHcYqmP5A3HkxlGmVndwX1jharWL+b
 JIFD53CkSDaHE6dRDppZWHSsdgE1BBSiux/GppAAhclYSOcKqI2FoI/tUQKv3AQ0Odoa
 gwuKVc1hdkLEsXh1QELvJAooTIGMav5kme+obgXsJRjTk+NlrPnUbKBEKxnVjL/SNMGf
 6qFsTqblxDK6kVXD04h8nkzbAmSDK5G6UpDO/QvWbCSeEKqLt6sIZ2Tee24aEo7yuMtZ
 b+ag==
X-Gm-Message-State: AOAM531KZi1jkxMtgmSvrkBqiFhjLTMPP+k+bLxA+wLhk/OHPr/fUrMq
 R7ENenu3PySlsbRwOECn2EI=
X-Google-Smtp-Source: ABdhPJxZ7UaFizlMG1wxnusogSLwNvOH+tv2AnM7S51b1YFmebkjUNJK9l060nexKwNCxBcmjlRXKw==
X-Received: by 2002:a2e:9dc1:: with SMTP id x1mr5119364ljj.32.1610719324653;
 Fri, 15 Jan 2021 06:02:04 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id f132sm906852lfd.252.2021.01.15.06.02.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 06:02:04 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Sameer Pujar <spujar@nvidia.com>,
 Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH v2 1/5] ALSA: hda/tegra: Use clk_bulk helpers
Date: Fri, 15 Jan 2021 17:01:41 +0300
Message-Id: <20210115140145.10668-2-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210115140145.10668-1-digetx@gmail.com>
References: <20210115140145.10668-1-digetx@gmail.com>
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

Use clk_bulk helpers to make code cleaner.

Tested-by: Peter Geis <pgwipeout@gmail.com>
Tested-by: Nicolas Chauvet <kwizart@gmail.com>
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

