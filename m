Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1351466847
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Dec 2021 17:28:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E27228E7;
	Thu,  2 Dec 2021 17:28:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E27228E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638462539;
	bh=sJ3m+2GGapzkBGruGsmZw83idg+BqCVWV5zsotfe1JQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VkIPW6jw3TD5u5vsL8oYyAsl1Mhj11dX/AbEdANcaZX1pCBK2M1yRAps6IFC8ruCY
	 SVQlDoQAeU9E3IAC7oeF5EUulP2RbjZYbcSkVFcM8cPZ29pLS0yhyRoGZDXFpbVeJ5
	 wbERzH85wzxkmWkjgwi4yO3gyz3EPcBNOdnY5CB0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3A15F8051E;
	Thu,  2 Dec 2021 17:25:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7330AF80510; Thu,  2 Dec 2021 17:25:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F9AFF80301
 for <alsa-devel@alsa-project.org>; Thu,  2 Dec 2021 17:25:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F9AFF80301
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="VKHmJthU"
Received: by mail-lf1-x12c.google.com with SMTP id c32so72879220lfv.4
 for <alsa-devel@alsa-project.org>; Thu, 02 Dec 2021 08:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n+cwXkLuYTguZ/egF0PR3HKcbjBSFy6IZ25EC5llUN0=;
 b=VKHmJthUvjXS59BALwb+ATthridW7xhHVa77qVsv2kC+AI1yk0gqoD7e7ukv/VdpgE
 eopIG8eEd/6R1JvOAEEMrOIyMyhtdTq1mHZsVA8ZtzZ+EK6FX8JC7mUrCiyqU0/3oHs3
 uSVimfLQzh+HuVn/l9jwjsiToGPQGOTPJrR+sUEXvpnydyvUi7IwPVr8UmRiCIZ+A0XF
 zmOH65X+Sqo+a0PTV2+8HOncLJ50wBUOqp1JIoTOXiKiawqGetLW5doVAxtq8jXdfdUf
 UloDRnGPTYX4CBrmG0xb4F2Kw1NSa+rYE8xI244v9jl8/Fob4k5tBG36hOXSR+hvt3jN
 TW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n+cwXkLuYTguZ/egF0PR3HKcbjBSFy6IZ25EC5llUN0=;
 b=Z8JxrRuptSswqvYgw4u9AdZpls9fL/PmXr9P9TrOKMFNHXMpWsVE0d2twAubGy4TLt
 8/q/MqmlSIYH7gw1yc8aVW8vNyk+DIZTyvMfrwBNE6UCUJxWqcwT+NigmNSU/mVSCNrw
 WhthRFNsHEigRHvlvlLY4zd7GQtdzXLrxaNvuphRmNeD//3QYooo/1QFATBz7KJVpc9V
 AapRbTfgFpmSwT/uscGaUiLSupo2ak4VKwOtFWIevidGxFm2GFTkDLD/Q1MPL9N17OpA
 bMfNvLDsmyoyAGf78rhFO2NrD4skwxlgtyN4wE3YL01dS82zE1rPgWfVILMmdraHWu1i
 3Nsg==
X-Gm-Message-State: AOAM530hNlT4bOyx7kpeee0YjXPrua4IluR934HDV6p1+o0KHQzcINbO
 9FvLaqS5I/xI1q2DEGa++5U=
X-Google-Smtp-Source: ABdhPJx4sY5bfWAJiUlJjt+ZI84qUzYJ5TudTm3UCnZQn0koHijjsXA+YonMWOeM5aRlqg5oafHiOQ==
X-Received: by 2002:a05:6512:3e1e:: with SMTP id
 i30mr12327554lfv.560.1638462322498; 
 Thu, 02 Dec 2021 08:25:22 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id d18sm36806lfl.30.2021.12.02.08.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 08:25:22 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 07/20] ASoC: tegra20: spdif: Support device-tree
Date: Thu,  2 Dec 2021 19:23:28 +0300
Message-Id: <20211202162341.1791-8-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211202162341.1791-1-digetx@gmail.com>
References: <20211202162341.1791-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
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

Tegra20 S/PDIF driver was added in a pre-DT era and was never used since
that time. Revive driver by adding device-tree support.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra20_spdif.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index e45e371edc42..801784915004 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -10,6 +10,7 @@
 #include <linux/device.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
@@ -270,7 +271,7 @@ static int tegra20_spdif_platform_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(&pdev->dev, spdif);
 
-	spdif->clk_spdif_out = devm_clk_get(&pdev->dev, "spdif_out");
+	spdif->clk_spdif_out = devm_clk_get(&pdev->dev, "out");
 	if (IS_ERR(spdif->clk_spdif_out)) {
 		pr_err("Can't retrieve spdif clock\n");
 		ret = PTR_ERR(spdif->clk_spdif_out);
@@ -340,10 +341,17 @@ static const struct dev_pm_ops tegra20_spdif_pm_ops = {
 			   tegra20_spdif_runtime_resume, NULL)
 };
 
+static const struct of_device_id tegra20_spdif_of_match[] = {
+	{ .compatible = "nvidia,tegra20-spdif", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, tegra20_spdif_of_match);
+
 static struct platform_driver tegra20_spdif_driver = {
 	.driver = {
 		.name = DRV_NAME,
 		.pm = &tegra20_spdif_pm_ops,
+		.of_match_table = tegra20_spdif_of_match,
 	},
 	.probe = tegra20_spdif_platform_probe,
 	.remove = tegra20_spdif_platform_remove,
@@ -354,4 +362,3 @@ module_platform_driver(tegra20_spdif_driver);
 MODULE_AUTHOR("Stephen Warren <swarren@nvidia.com>");
 MODULE_DESCRIPTION("Tegra20 SPDIF ASoC driver");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:" DRV_NAME);
-- 
2.33.1

