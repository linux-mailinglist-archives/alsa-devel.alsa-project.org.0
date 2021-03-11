Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 668F43376D1
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 16:19:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0400A18A4;
	Thu, 11 Mar 2021 16:18:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0400A18A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615475979;
	bh=XRJyqw/pXkIasdZQxg8O0t/Aew+OI2IcWd5DSpLusp4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ldfg6DTcYHY/1Q4EQqEUwamOXkgdkIM5lkr2GZXx0ZszgOFVawN0XdeFMB5SwPLpl
	 hjFPMqHin+Fxb193DmsrUTADPYjA0DQihKXYUiLt/e21NAKMNOOhcGciCnByoWJaDA
	 IhxNWosLl0XKEEF9Pv0imIZVt/dtHGIDbsDIcizs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73C41F80424;
	Thu, 11 Mar 2021 16:17:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9AD6BF8032B; Thu, 11 Mar 2021 16:17:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D43EF8025A
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 16:17:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D43EF8025A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="UDBlQOo0"
Received: by mail-lj1-x234.google.com with SMTP id s17so2606853ljc.5
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 07:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KFH1WQ55n2o2H6XVeSwGtTqtJ0JVSPd2X/kO35Iu2VI=;
 b=UDBlQOo0VHuBWQvz7qb5TRIEFjZSUTGJX4ib8y2FFVO4qqp0rOjQQ7+kS7wzvmI0bW
 M5toL29Iv+a3TDrQmKObPT9sE6ZoCW2RV9sFYqQl55y7pDFRxUQHKe96PHH4n1SWFka9
 VQO86dINekEbGOh3fnI79PXP9hNiZXiRp4Trv3phpZtbwn1l+QTRxSEW/h4iQAuqd9YU
 96ydk0HNI35S+PkhPFhVnmCweJWvoRDYflvssGhCIoRbWEMN0S4yMz2aMAVUqNvMSQlT
 Mt1uPEngr3+Ba7WdTLJ3tpSmWxCxNtcw+RS1/eyY9YefrqCLj2dtwV4Uwl2vrMGnCXXn
 Vu4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KFH1WQ55n2o2H6XVeSwGtTqtJ0JVSPd2X/kO35Iu2VI=;
 b=O9TYxNT7M2rBSEMV9lRSWlLilVDPkr70sdlEVDm23abMrPUtxRMlv0UskwaZv9eA/i
 lYuDrzYd1eWifh1leyyKMt73aKHitoTKiAGDdnBEp/Z4bslLEsT2XQbSMWUdESFwrJtx
 U8FEvV24PAWmlWlmFmjlMBBf1MOs0DrzGOXFfZ6zxYoxyXGjyueguHhB+JEB7bP9gomN
 rVtzq5MEDmwlLQytiuM5x5TY2RCbQ/5q1CrNuoMv6wB9GjMzTVHOSHJIcWHN0itxG9hU
 oqaw1CqLtAgMBoI6UaBfDPt1iLKVniPRH0v16Pa8U3YsKDI/fAfJt0dwEutK512dcP3p
 34KA==
X-Gm-Message-State: AOAM531NFK2/+aNOjFxko4d0/8StDfy6Njvb7D5fbASrogbxU04zoR+K
 wSeYOJeTjXTzGohBKeO9Gf4=
X-Google-Smtp-Source: ABdhPJxOKm/YqUC61DpNZ2SEmcZxsIjoGKR76Kk7YgVANQIN4qWFQoo9dB1XipoxHFS1Kh13U9Dj6A==
X-Received: by 2002:a2e:8e75:: with SMTP id t21mr5176930ljk.216.1615475821883; 
 Thu, 11 Mar 2021 07:17:01 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id m24sm923138lfq.184.2021.03.11.07.17.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 07:17:01 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Fertser <fercerpav@gmail.com>
Subject: [PATCH v2 5/5] ASoC: tegra: ahub: Switch to use reset-bulk API
Date: Thu, 11 Mar 2021 18:15:54 +0300
Message-Id: <20210311151554.23982-6-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210311151554.23982-1-digetx@gmail.com>
References: <20210311151554.23982-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

Switch to use reset-bulk API in order to make code cleaner.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra30_ahub.c | 104 ++++++++++++---------------------
 sound/soc/tegra/tegra30_ahub.h |   5 +-
 sound/soc/tegra/tegra30_i2s.c  |   1 +
 3 files changed, 40 insertions(+), 70 deletions(-)

diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index 9ef05ca4f6c4..d24c26f4960d 100644
--- a/sound/soc/tegra/tegra30_ahub.c
+++ b/sound/soc/tegra/tegra30_ahub.c
@@ -65,7 +65,7 @@ static int tegra30_ahub_runtime_resume(struct device *dev)
 {
 	int ret;
 
-	ret = reset_control_assert(ahub->reset);
+	ret = reset_control_bulk_assert(ahub->nresets, ahub->resets);
 	if (ret)
 		return ret;
 
@@ -75,7 +75,7 @@ static int tegra30_ahub_runtime_resume(struct device *dev)
 
 	usleep_range(10, 100);
 
-	ret = reset_control_deassert(ahub->reset);
+	ret = reset_control_bulk_deassert(ahub->nresets, ahub->resets);
 	if (ret)
 		goto disable_clocks;
 
@@ -339,41 +339,28 @@ int tegra30_ahub_unset_rx_cif_source(enum tegra30_ahub_rxcif rxcif)
 }
 EXPORT_SYMBOL_GPL(tegra30_ahub_unset_rx_cif_source);
 
-#define MOD_LIST_MASK_TEGRA30	BIT(0)
-#define MOD_LIST_MASK_TEGRA114	BIT(1)
-#define MOD_LIST_MASK_TEGRA124	BIT(2)
-
-#define MOD_LIST_MASK_TEGRA30_OR_LATER \
-		(MOD_LIST_MASK_TEGRA30 | MOD_LIST_MASK_TEGRA114 | \
-			MOD_LIST_MASK_TEGRA124)
-#define MOD_LIST_MASK_TEGRA114_OR_LATER \
-		(MOD_LIST_MASK_TEGRA114 | MOD_LIST_MASK_TEGRA124)
-
-static const struct {
-	const char *rst_name;
-	u32 mod_list_mask;
-} configlink_mods[] = {
-	{ "d_audio", MOD_LIST_MASK_TEGRA30_OR_LATER },
-	{ "apbif", MOD_LIST_MASK_TEGRA30_OR_LATER },
-	{ "i2s0", MOD_LIST_MASK_TEGRA30_OR_LATER },
-	{ "i2s1", MOD_LIST_MASK_TEGRA30_OR_LATER },
-	{ "i2s2", MOD_LIST_MASK_TEGRA30_OR_LATER },
-	{ "i2s3", MOD_LIST_MASK_TEGRA30_OR_LATER },
-	{ "i2s4", MOD_LIST_MASK_TEGRA30_OR_LATER },
-	{ "dam0", MOD_LIST_MASK_TEGRA30_OR_LATER },
-	{ "dam1", MOD_LIST_MASK_TEGRA30_OR_LATER },
-	{ "dam2", MOD_LIST_MASK_TEGRA30_OR_LATER },
-	{ "spdif", MOD_LIST_MASK_TEGRA30_OR_LATER },
-	{ "amx", MOD_LIST_MASK_TEGRA114_OR_LATER },
-	{ "adx", MOD_LIST_MASK_TEGRA114_OR_LATER },
-	{ "amx1", MOD_LIST_MASK_TEGRA124 },
-	{ "adx1", MOD_LIST_MASK_TEGRA124 },
-	{ "afc0", MOD_LIST_MASK_TEGRA124 },
-	{ "afc1", MOD_LIST_MASK_TEGRA124 },
-	{ "afc2", MOD_LIST_MASK_TEGRA124 },
-	{ "afc3", MOD_LIST_MASK_TEGRA124 },
-	{ "afc4", MOD_LIST_MASK_TEGRA124 },
-	{ "afc5", MOD_LIST_MASK_TEGRA124 },
+static const struct reset_control_bulk_data tegra30_ahub_resets_data[] = {
+	{ "d_audio" },
+	{ "apbif" },
+	{ "i2s0" },
+	{ "i2s1" },
+	{ "i2s2" },
+	{ "i2s3" },
+	{ "i2s4" },
+	{ "dam0" },
+	{ "dam1" },
+	{ "dam2" },
+	{ "spdif" },
+	{ "amx" }, /* Tegra114+ */
+	{ "adx" }, /* Tegra114+ */
+	{ "amx1" }, /* Tegra124 */
+	{ "adx1" }, /* Tegra124 */
+	{ "afc0" }, /* Tegra124 */
+	{ "afc1" }, /* Tegra124 */
+	{ "afc2" }, /* Tegra124 */
+	{ "afc3" }, /* Tegra124 */
+	{ "afc4" }, /* Tegra124 */
+	{ "afc5" }, /* Tegra124 */
 };
 
 #define LAST_REG(name) \
@@ -502,17 +489,17 @@ static const struct regmap_config tegra30_ahub_ahub_regmap_config = {
 };
 
 static struct tegra30_ahub_soc_data soc_data_tegra30 = {
-	.mod_list_mask = MOD_LIST_MASK_TEGRA30,
+	.num_resets = 11,
 	.set_audio_cif = tegra30_ahub_set_cif,
 };
 
 static struct tegra30_ahub_soc_data soc_data_tegra114 = {
-	.mod_list_mask = MOD_LIST_MASK_TEGRA114,
+	.num_resets = 13,
 	.set_audio_cif = tegra30_ahub_set_cif,
 };
 
 static struct tegra30_ahub_soc_data soc_data_tegra124 = {
-	.mod_list_mask = MOD_LIST_MASK_TEGRA124,
+	.num_resets = 21,
 	.set_audio_cif = tegra124_ahub_set_cif,
 };
 
@@ -527,8 +514,6 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 {
 	const struct of_device_id *match;
 	const struct tegra30_ahub_soc_data *soc_data;
-	struct reset_control *rst;
-	int i;
 	struct resource *res0;
 	void __iomem *regs_apbif, *regs_ahub;
 	int ret = 0;
@@ -541,34 +526,16 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 		return -EINVAL;
 	soc_data = match->data;
 
-	/*
-	 * The AHUB hosts a register bus: the "configlink". For this to
-	 * operate correctly, all devices on this bus must be out of reset.
-	 */
-	for (i = 0; i < ARRAY_SIZE(configlink_mods); i++) {
-		if (!(configlink_mods[i].mod_list_mask &
-					soc_data->mod_list_mask))
-			continue;
-
-		rst = reset_control_get_exclusive(&pdev->dev,
-						  configlink_mods[i].rst_name);
-		if (IS_ERR(rst)) {
-			dev_err(&pdev->dev, "Can't get reset %s\n",
-				configlink_mods[i].rst_name);
-			ret = PTR_ERR(rst);
-			return ret;
-		}
-
-		/* just check presence of the reset control in DT */
-		reset_control_put(rst);
-	}
-
 	ahub = devm_kzalloc(&pdev->dev, sizeof(struct tegra30_ahub),
 			    GFP_KERNEL);
 	if (!ahub)
 		return -ENOMEM;
 	dev_set_drvdata(&pdev->dev, ahub);
 
+	BUILD_BUG_ON(sizeof(ahub->resets) != sizeof(tegra30_ahub_resets_data));
+	memcpy(ahub->resets, tegra30_ahub_resets_data, sizeof(ahub->resets));
+
+	ahub->nresets = soc_data->num_resets;
 	ahub->soc_data = soc_data;
 	ahub->dev = &pdev->dev;
 
@@ -579,10 +546,11 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ahub->reset = devm_reset_control_array_get_exclusive(&pdev->dev);
-	if (IS_ERR(ahub->reset)) {
-		dev_err(&pdev->dev, "Can't get resets: %pe\n", ahub->reset);
-		return PTR_ERR(ahub->reset);
+	ret = devm_reset_control_bulk_get_exclusive(&pdev->dev, ahub->nresets,
+						    ahub->resets);
+	if (ret) {
+		dev_err(&pdev->dev, "Can't get resets: %d\n", ret);
+		return ret;
 	}
 
 	res0 = platform_get_resource(pdev, IORESOURCE_MEM, 0);
diff --git a/sound/soc/tegra/tegra30_ahub.h b/sound/soc/tegra/tegra30_ahub.h
index 3b85244f87f1..c9eaf4ec8f6e 100644
--- a/sound/soc/tegra/tegra30_ahub.h
+++ b/sound/soc/tegra/tegra30_ahub.h
@@ -491,7 +491,7 @@ void tegra124_ahub_set_cif(struct regmap *regmap, unsigned int reg,
 			   struct tegra30_ahub_cif_conf *conf);
 
 struct tegra30_ahub_soc_data {
-	u32 mod_list_mask;
+	unsigned int num_resets;
 	void (*set_audio_cif)(struct regmap *regmap,
 			      unsigned int reg,
 			      struct tegra30_ahub_cif_conf *conf);
@@ -511,7 +511,8 @@ struct tegra30_ahub_soc_data {
 struct tegra30_ahub {
 	const struct tegra30_ahub_soc_data *soc_data;
 	struct device *dev;
-	struct reset_control *reset;
+	struct reset_control_bulk_data resets[21];
+	unsigned int nresets;
 	struct clk_bulk_data clocks[2];
 	unsigned int nclocks;
 	resource_size_t apbif_addr;
diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index 3d22c1be6f3d..614b67be1dd9 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -23,6 +23,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
-- 
2.29.2

