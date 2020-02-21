Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 744BE167EAF
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Feb 2020 14:33:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24C9216DB;
	Fri, 21 Feb 2020 14:32:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24C9216DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582292014;
	bh=QKHqZ00yKtGu8N6aznMUiN3rI9e/HPyfvUYEezAa5GI=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=YaayEOXqqpOw4dyA0fg8xM+WIPjCrq6tCC5fzzzDwV9HoNkjM1kSHTkbPKfdl5o05
	 PiyY54jcineHkoDDJ0EpPd1rtRMke4UQ9a3iJaMLrWE9OnZAwo+WVT7hXTdm/RweMf
	 pOnG7G1ici5fChuq45ouVvyO2GzS43xaen4IAIJ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A09FF80279;
	Fri, 21 Feb 2020 14:31:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 451E9F80278; Fri, 21 Feb 2020 14:31:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 39BCAF80273
 for <alsa-devel@alsa-project.org>; Fri, 21 Feb 2020 14:31:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39BCAF80273
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C1BA30E;
 Fri, 21 Feb 2020 05:31:06 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 109B23F703;
 Fri, 21 Feb 2020 05:31:05 -0800 (PST)
Date: Fri, 21 Feb 2020 13:31:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Applied "ASoC: meson: aiu: introduce a struct for platform specific
 information" to the asoc tree
In-Reply-To: 
Message-Id: 
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

The patch

   ASoC: meson: aiu: introduce a struct for platform specific information

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From edc761805302db6d63916694d0cdb7468864a47a Mon Sep 17 00:00:00 2001
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 20 Feb 2020 21:57:10 +0100
Subject: [PATCH] ASoC: meson: aiu: introduce a struct for platform specific
 information

Introduce a struct aiu_platform_data to make the driver aware of
platform specific information. Convert the existing check for the
internal stereo audio codec (only available on GXL) to this new struct.
Support for the 32-bit SoCs will need this as well because the
AIU_CLK_CTRL_MORE register doesn't have the I2S divider bits (and we
need to use the I2S divider from AIU_CLK_CTRL instead).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Link: https://lore.kernel.org/r/20200220205711.77953-3-martin.blumenstingl@googlemail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/meson/aiu.c | 19 ++++++++++++++++---
 sound/soc/meson/aiu.h |  5 +++++
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index d3e2d40e9562..38209312a8c3 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -273,6 +273,11 @@ static int aiu_probe(struct platform_device *pdev)
 	aiu = devm_kzalloc(dev, sizeof(*aiu), GFP_KERNEL);
 	if (!aiu)
 		return -ENOMEM;
+
+	aiu->platform = device_get_match_data(dev);
+	if (!aiu->platform)
+		return -ENODEV;
+
 	platform_set_drvdata(pdev, aiu);
 
 	ret = device_reset(dev);
@@ -322,7 +327,7 @@ static int aiu_probe(struct platform_device *pdev)
 	}
 
 	/* Register the internal dac control component on gxl */
-	if (of_device_is_compatible(dev->of_node, "amlogic,aiu-gxl")) {
+	if (aiu->platform->has_acodec) {
 		ret = aiu_acodec_ctrl_register_component(dev);
 		if (ret) {
 			dev_err(dev,
@@ -344,9 +349,17 @@ static int aiu_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct aiu_platform_data aiu_gxbb_pdata = {
+	.has_acodec = false,
+};
+
+static const struct aiu_platform_data aiu_gxl_pdata = {
+	.has_acodec = true,
+};
+
 static const struct of_device_id aiu_of_match[] = {
-	{ .compatible = "amlogic,aiu-gxbb", },
-	{ .compatible = "amlogic,aiu-gxl", },
+	{ .compatible = "amlogic,aiu-gxbb", .data = &aiu_gxbb_pdata },
+	{ .compatible = "amlogic,aiu-gxl", .data = &aiu_gxl_pdata },
 	{}
 };
 MODULE_DEVICE_TABLE(of, aiu_of_match);
diff --git a/sound/soc/meson/aiu.h b/sound/soc/meson/aiu.h
index 06a968c55728..ab003638d5e5 100644
--- a/sound/soc/meson/aiu.h
+++ b/sound/soc/meson/aiu.h
@@ -27,11 +27,16 @@ struct aiu_interface {
 	int irq;
 };
 
+struct aiu_platform_data {
+	bool has_acodec;
+};
+
 struct aiu {
 	struct clk *pclk;
 	struct clk *spdif_mclk;
 	struct aiu_interface i2s;
 	struct aiu_interface spdif;
+	const struct aiu_platform_data *platform;
 };
 
 #define AIU_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |	\
-- 
2.20.1

