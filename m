Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 142604685AB
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Dec 2021 15:40:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2F0B230F;
	Sat,  4 Dec 2021 15:40:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2F0B230F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638628851;
	bh=sJ3m+2GGapzkBGruGsmZw83idg+BqCVWV5zsotfe1JQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HR5BdN3mrfp6gkoLAb585LLTCALMwgyM/aukWoEQ07sFycvOXEHM4I0lsJSKdzuEt
	 SfXBwZSgAQKOgGsR7pn7uawX49xCrxahZZfiK2BiBO5xkWkQ+C3vppMlji1+HQn+7g
	 cRx5bNIR5zJc+Sim/KJuvU8nbiVPHmgUDHtjRn+Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0BC7F80524;
	Sat,  4 Dec 2021 15:37:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1AADF804FC; Sat,  4 Dec 2021 15:37:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E96D2F802DB
 for <alsa-devel@alsa-project.org>; Sat,  4 Dec 2021 15:37:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E96D2F802DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="j/nRLfBM"
Received: by mail-lj1-x229.google.com with SMTP id v15so12067750ljc.0
 for <alsa-devel@alsa-project.org>; Sat, 04 Dec 2021 06:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n+cwXkLuYTguZ/egF0PR3HKcbjBSFy6IZ25EC5llUN0=;
 b=j/nRLfBMh83bJkhX9kKkLg6MjMASwyBr0GXZu60BaXxuoTEiPEjuzogBdZGlgka4J8
 X8HEaoSu45IvmOwqyH78PgKM6szrLRdv+/ijT5pquObXabsfbJPZm4fpOW5F9h6GRMEY
 t6Fk9xa+gAy2Pq+ihRQQZjLdcF5s/QvwgHPeFq8LW+wCLAIylGpE5Roy7YsE43E04Bba
 tfl4N8tQs0bx+3JPhEQj80CJwWDXuSMbA+8by/i4C5us+V0ts+EPDwBtIlDmsg05irSp
 ELhBsJVrP9D+R5nn1uidp4WIhSa+hLi8YfCm4xdnSgBq2Ruz8yVqPaW2HTolTzPMqZc4
 u1oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n+cwXkLuYTguZ/egF0PR3HKcbjBSFy6IZ25EC5llUN0=;
 b=Q6Ta5/RonxJbDPdO7HXSP02bKrjaHKn6z/aQcwg07B7KcOnnVKtgKJ99zF0SjofROr
 S/IACijaV1Y93L6uC9P2Kcb0TUgUM55dyO1y0PysY3vhWaLBKbosWwMmt/nH72VwcmaU
 ncmnGLnIcJ/h+1sdu1ev+7DZLQ5FgxnhGMjgpsg1EsBNPhdVvmW2xk7dW1y7XW2KIq5R
 yQUIR0W/Q9rmqGplyedyp0sfk0fvI4JJjALYO9cX7oLqcj8tQOFFfG2F/n6aUlg0po1D
 y3AKF1y10yQXNIBKQvgDW9JSwIg6s4hlo1qbQmH38h6y4ZY6KF8fCi6Ydwlbn2+o38yE
 w+tw==
X-Gm-Message-State: AOAM533RQq0gz7/cnFJLd4prJjeZnnySM7IMJAbpfm+M6imo8xxL7iS5
 sQvTxVPHrU47ByBf6J+qbxY=
X-Google-Smtp-Source: ABdhPJyzjPMRg1eQNKV77H8cTJlpAZtummXWT5L9NX8MxCuSuSlCajaCwXqQPQJt0JF2skWo4aiVNw==
X-Received: by 2002:a2e:7a02:: with SMTP id v2mr24889139ljc.227.1638628657078; 
 Sat, 04 Dec 2021 06:37:37 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id g36sm782934lfv.16.2021.12.04.06.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 06:37:36 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>
Subject: [PATCH v4 07/22] ASoC: tegra20: spdif: Support device-tree
Date: Sat,  4 Dec 2021 17:37:10 +0300
Message-Id: <20211204143725.31646-8-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211204143725.31646-1-digetx@gmail.com>
References: <20211204143725.31646-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-tegra@vger.kernel.org
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

