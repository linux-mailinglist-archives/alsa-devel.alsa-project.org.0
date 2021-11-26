Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C2745F1CA
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Nov 2021 17:24:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E42171AAD;
	Fri, 26 Nov 2021 17:24:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E42171AAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637943894;
	bh=S6IilNKdyiqLrg66HkYXNGJUZYfm7+SZPWzSxs6xur4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OmQJ0jMOf5ExiJeTMAj/ceGqWrRVr0ogpNiMgI5j7NzvDlBn3bSQGFXABo3L0VcXn
	 tvJR7YCOeYumAQ1RaUJX9rYzsUP/QTmof1InC0JBfkZL3ylJk0WRaRLTgV4FMbHVb6
	 ++fKf0EllQVL/UfREP+Z5xzOgIRL7OT8ii+lYVYE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A80DFF80538;
	Fri, 26 Nov 2021 17:20:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70231F80508; Fri, 26 Nov 2021 17:20:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4EB52F80212
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 17:19:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4EB52F80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TCD9cLoC"
Received: by mail-lf1-x131.google.com with SMTP id k37so25544681lfv.3
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 08:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mwo4lC7FD/kahBv1NqaH+i3tNvopsZJiJsXaLzIpIZs=;
 b=TCD9cLoCNbfUnZM9J4HcmwXzAfE4L8q7phnym6pZ33wnza+OUwA0voHnXlbFX8BALc
 98huQvHMfRZhR6vs0iXkCJdDzPLwc5Iu+hxNfnAJnOhuly6FVmgiTFQv0PNbYTrY2rHK
 dXyOTzj2XWTpCS6APfNz7Hm9xKXXuqF/C+ZhAAm2IgEouLO7p3q6Mlpn1p7veF13LonA
 /7ZVdUUY7c6q4wvZ6+486FTu58keZbE7EBmxdkLoAiwTtH0JeaxWgQvf0AkdolivqHRy
 bEpOVWzuuV7+krtw1TWDsd1Sze10F/d3Wbvxxvs00NCVytod7kMqi7KRBBzLhKj0lu3v
 rHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mwo4lC7FD/kahBv1NqaH+i3tNvopsZJiJsXaLzIpIZs=;
 b=UNeeGLV9LtYvmwLKJ4CiPdOxf4RjWYaN+vNo97SN6WNidHrEFGZo2qk4usDVjPYrLX
 kngWpEtWLmfxirC4TQ3X9aXyUGzXISiO+1hinukOvtvtWaOByn4FYRCUH+RSR5jTnI22
 ZyZxLIwHuFh9on+yvK1JzGLkB79ZfVIZfZBV28CYCouExDhgJdm3aJawMfH9vWzmpWlj
 j1uk3nN9knKe6cKzxMzutPax86asT73i1Y4btIki7w2bw1p3eX6bREg060P3vghUGfjx
 0JSZ3nifjKeRAV7Mtu4Tr1Qg9oTQS1ZkcGsPRbG/v4h+FFyqVZcgRCipe+7Z/NiE0hiH
 2QVA==
X-Gm-Message-State: AOAM531jruiHFW6mEIy8MQ2Xue4IDfxFZdSyAhlpx0l3X2xfZ9Y2AcAg
 02kQKyJ0yNmxbo1gXqpLPiWdUxL4p6k=
X-Google-Smtp-Source: ABdhPJy2HOctdB6ar2RL70kTPxIThtcFWFugw3cBJPBAONKS4zeQwsXwB5N/38mWQcSQnbt2QPuv7A==
X-Received: by 2002:ac2:4e0b:: with SMTP id e11mr30573216lfr.208.1637943585591; 
 Fri, 26 Nov 2021 08:19:45 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id t7sm613381lfl.260.2021.11.26.08.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 08:19:45 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 07/20] ASoC: tegra20: spdif: Support device-tree
Date: Fri, 26 Nov 2021 19:17:54 +0300
Message-Id: <20211126161807.15776-8-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126161807.15776-1-digetx@gmail.com>
References: <20211126161807.15776-1-digetx@gmail.com>
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
 sound/soc/tegra/tegra20_spdif.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index e45e371edc42..6650875d2555 100644
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

