Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAAA45CFD8
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 23:10:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D9C2181F;
	Wed, 24 Nov 2021 23:09:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D9C2181F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637791840;
	bh=yJLbY0Ibh5GGbjilTVPPqneyfq24PxZlF14d+djHmKE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gUMVigTcYHZGXDo/XI5z6CWtYH0908MEcalPkqiauBHOHGL71DlxXiCpqQFemErFB
	 OSootVia+ABO0e4Y774uHQ3xGUPR4cPZ8sPpaEyRcJdyZo8jduNJYzzJjjWGGaq33E
	 uOPgRnldsXc/NoaF8FA4tttx9a5Ilvwdj9J2lVNU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BAE8F804FB;
	Wed, 24 Nov 2021 23:06:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E71AF80519; Wed, 24 Nov 2021 23:06:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B50A9F804ED
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 23:06:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B50A9F804ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="UqwzU78y"
Received: by mail-lj1-x235.google.com with SMTP id 207so8350044ljf.10
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 14:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1JU496kEAul2Xrq2ly7/mGbdp4YdTxxslXy87kjnkVE=;
 b=UqwzU78ytiFl6/Y/ntkoBchG3Lc6SXt6mrHGgPBCHW5nh9kTIg+ls1wTiTKE4yID3C
 we6f23L5TPwplR8LoL/OQ9Cp5QLkkALk6tyAMys6W6VkLak7/ZwmqIqbKtayFHFkxD31
 LnTAE+RnHWBlZOGQrmklnFF1nUKQDd82jjO7PCZVmrcNOMS3Fz6Lvt3wSV0a+bSf4gOe
 VfNb0TCxamCV9LKcR2Rrf05Elmd04arCw0ITH9RiP7vPHuhjMzO4bisyW1gmlkl64Ctv
 GC8BtGu6I+eOvvfVohuGYchkVfQ5MRCz2ObBvNX7O4YGCtPv6Wug/RWU1+ySuc8hlE+c
 EWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1JU496kEAul2Xrq2ly7/mGbdp4YdTxxslXy87kjnkVE=;
 b=hPpkr8K9/TwPSlB0DNtjAFOSd740KARKMg96tWh6L1LFcDdbZWbtKLkAa1nSG5UcXU
 84Wzn/5dvx0+zZOwEjJ97o1c7bksc02Hq03CnFq3hgSZ0MOkFdJ4Xet8XIQUrznCTwtr
 tVEJEcQ3tGo7xBZbYI093k24TOuMKtwKY2mq3AXsqrk93hjsAPHbRPr65JY0rv6Ydcyz
 8txVVkUUfG0FFNMYFbUgF9Iogak8tMBt6pwGEx8hfSHfYGa4vl3HKTeuXBq8blLZ4dPi
 Sz0b28dl2RHW3BCXkvuxaYNfMrVz38COdTS01LR4XRo4SXnjCSiiU3fSm3WckhIk8quj
 oaGw==
X-Gm-Message-State: AOAM533zZOGZVWz2Em6LkbsHI1TcnnbNR88lH9UAMXdd+cM0201t/SR3
 f1V6cA0zscDApBH40Dvrl8E=
X-Google-Smtp-Source: ABdhPJyzNTbRmF53l+Iw649bJHHzEY01rJ+pkrDrJDSRRi2322Eki64x9PXyd93QePOA6hecAJIOhA==
X-Received: by 2002:a2e:9450:: with SMTP id o16mr19173212ljh.444.1637791595711; 
 Wed, 24 Nov 2021 14:06:35 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id w17sm93266ljh.15.2021.11.24.14.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 14:06:35 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 06/20] ASoC: tegra20: spdif: Support device-tree
Date: Thu, 25 Nov 2021 01:00:43 +0300
Message-Id: <20211124220057.15763-7-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124220057.15763-1-digetx@gmail.com>
References: <20211124220057.15763-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
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
 sound/soc/tegra/tegra20_spdif.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index 57a6c576b91f..bd81df5378d1 100644
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
@@ -332,10 +333,17 @@ static const struct dev_pm_ops tegra20_spdif_pm_ops = {
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
@@ -346,4 +354,3 @@ module_platform_driver(tegra20_spdif_driver);
 MODULE_AUTHOR("Stephen Warren <swarren@nvidia.com>");
 MODULE_DESCRIPTION("Tegra20 SPDIF ASoC driver");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:" DRV_NAME);
-- 
2.33.1

