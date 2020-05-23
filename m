Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 078FD1DF74D
	for <lists+alsa-devel@lfdr.de>; Sat, 23 May 2020 14:57:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97FE71832;
	Sat, 23 May 2020 14:56:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97FE71832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590238627;
	bh=nfsKUJ9v/DE8lBXRk1jCpoSHeDVSLHAb6O/9dWHzoLM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ey1rT6HhP0MYaVrtbQD9KcPHu2O5VRmdjvlDL5CRZvkeatW0vHr9S1vGwuTTuFo47
	 SvPtPyKcYDUVHQMpSZZwUREbVAXTlegYPDulk2n/UwDHFMowaiNR+3aqoHk4F2VKiH
	 3Ic0u63k+D6XIgo3mDt7NbTIUSU7afwh5cSLSsRo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD02FF80121;
	Sat, 23 May 2020 14:55:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DAC51F801D8; Sat, 23 May 2020 14:55:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C9DCF80121
 for <alsa-devel@alsa-project.org>; Sat, 23 May 2020 14:55:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C9DCF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.b="nfJBLKFe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1590238514; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:references; bh=4H5s0QFOM5/H2soQZqt1IUyUDqpcpHgzFYC6TqO7StY=;
 b=nfJBLKFeNz7AabXPcYV/iLwDNAeQUj/6xCxsDCCRKt3OSHSMIUupJDDSQlBbUS+U1DjbLZ
 tB8K6KJJx62eRqHW88tCAyP3Uujqhvc2pieS9RjRUbTeCKOu9stEHYCl0/gQi1WfobKKyx
 V9rmQNUwJR45bjLUZm0MK9TFHbpRZUc=
From: Paul Cercueil <paul@crapouillou.net>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: ingenic: Unconditionally depend on devicetree
Date: Sat, 23 May 2020 14:54:55 +0200
Message-Id: <20200523125455.12392-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Paul Cercueil <paul@crapouillou.net>, alsa-devel@alsa-project.org,
 od@zcrc.me, linux-kernel@vger.kernel.org, kbuild test robot <lkp@intel.com>
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

All boards with Ingenic SoCs probe with devicetree already, we have no
use for a non-devicetree path.

This solves some compilation warnings that were caused by unused
variables in the case where CONFIG_OF was disabled.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Reported-by: kbuild test robot <lkp@intel.com>
---
 sound/soc/codecs/Kconfig      | 3 +++
 sound/soc/codecs/jz4725b.c    | 4 +---
 sound/soc/codecs/jz4740.c     | 4 +---
 sound/soc/codecs/jz4770.c     | 2 +-
 sound/soc/jz4740/Kconfig      | 2 +-
 sound/soc/jz4740/jz4740-i2s.c | 4 +---
 6 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index e60e0b6a689c..3a0a6824e278 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -681,6 +681,7 @@ config SND_SOC_CX2072X
 
 config SND_SOC_JZ4740_CODEC
 	depends on MIPS || COMPILE_TEST
+	depends on OF
 	select REGMAP_MMIO
 	tristate "Ingenic JZ4740 internal CODEC"
 	help
@@ -692,6 +693,7 @@ config SND_SOC_JZ4740_CODEC
 
 config SND_SOC_JZ4725B_CODEC
 	depends on MIPS || COMPILE_TEST
+	depends on OF
 	select REGMAP
 	tristate "Ingenic JZ4725B internal CODEC"
 	help
@@ -703,6 +705,7 @@ config SND_SOC_JZ4725B_CODEC
 
 config SND_SOC_JZ4770_CODEC
 	depends on MIPS || COMPILE_TEST
+	depends on OF
 	select REGMAP
 	tristate "Ingenic JZ4770 internal CODEC"
 	help
diff --git a/sound/soc/codecs/jz4725b.c b/sound/soc/codecs/jz4725b.c
index 2567a5d15b55..e49374c72e70 100644
--- a/sound/soc/codecs/jz4725b.c
+++ b/sound/soc/codecs/jz4725b.c
@@ -574,19 +574,17 @@ static int jz4725b_codec_probe(struct platform_device *pdev)
 	return ret;
 }
 
-#ifdef CONFIG_OF
 static const struct of_device_id jz4725b_codec_of_matches[] = {
 	{ .compatible = "ingenic,jz4725b-codec", },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, jz4725b_codec_of_matches);
-#endif
 
 static struct platform_driver jz4725b_codec_driver = {
 	.probe = jz4725b_codec_probe,
 	.driver = {
 		.name = "jz4725b-codec",
-		.of_match_table = of_match_ptr(jz4725b_codec_of_matches),
+		.of_match_table = jz4725b_codec_of_matches,
 	},
 };
 module_platform_driver(jz4725b_codec_driver);
diff --git a/sound/soc/codecs/jz4740.c b/sound/soc/codecs/jz4740.c
index 460aa1fd1efe..c9900d1cd5c2 100644
--- a/sound/soc/codecs/jz4740.c
+++ b/sound/soc/codecs/jz4740.c
@@ -344,19 +344,17 @@ static int jz4740_codec_probe(struct platform_device *pdev)
 	return ret;
 }
 
-#ifdef CONFIG_OF
 static const struct of_device_id jz4740_codec_of_matches[] = {
 	{ .compatible = "ingenic,jz4740-codec", },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, jz4740_codec_of_matches);
-#endif
 
 static struct platform_driver jz4740_codec_driver = {
 	.probe = jz4740_codec_probe,
 	.driver = {
 		.name = "jz4740-codec",
-		.of_match_table = of_match_ptr(jz4740_codec_of_matches),
+		.of_match_table = jz4740_codec_of_matches,
 	},
 };
 
diff --git a/sound/soc/codecs/jz4770.c b/sound/soc/codecs/jz4770.c
index e7cf2c107607..34775aa62402 100644
--- a/sound/soc/codecs/jz4770.c
+++ b/sound/soc/codecs/jz4770.c
@@ -937,7 +937,7 @@ static struct platform_driver jz4770_codec_driver = {
 	.probe			= jz4770_codec_probe,
 	.driver			= {
 		.name		= "jz4770-codec",
-		.of_match_table = of_match_ptr(jz4770_codec_of_matches),
+		.of_match_table = jz4770_codec_of_matches,
 	},
 };
 module_platform_driver(jz4770_codec_driver);
diff --git a/sound/soc/jz4740/Kconfig b/sound/soc/jz4740/Kconfig
index e72f826062e9..29144720cb62 100644
--- a/sound/soc/jz4740/Kconfig
+++ b/sound/soc/jz4740/Kconfig
@@ -2,7 +2,7 @@
 config SND_JZ4740_SOC_I2S
 	tristate "SoC Audio (I2S protocol) for Ingenic JZ4740 SoC"
 	depends on MIPS || COMPILE_TEST
-	depends on HAS_IOMEM
+	depends on OF && HAS_IOMEM
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
 	  Say Y if you want to use I2S protocol and I2S codec on Ingenic JZ4740
diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index 6f6f8dad0356..52460adf6ca1 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -504,7 +504,6 @@ static const struct snd_soc_component_driver jz4740_i2s_component = {
 	.resume		= jz4740_i2s_resume,
 };
 
-#ifdef CONFIG_OF
 static const struct of_device_id jz4740_of_matches[] = {
 	{ .compatible = "ingenic,jz4740-i2s", .data = &jz4740_i2s_soc_info },
 	{ .compatible = "ingenic,jz4760-i2s", .data = &jz4760_i2s_soc_info },
@@ -513,7 +512,6 @@ static const struct of_device_id jz4740_of_matches[] = {
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, jz4740_of_matches);
-#endif
 
 static int jz4740_i2s_dev_probe(struct platform_device *pdev)
 {
@@ -558,7 +556,7 @@ static struct platform_driver jz4740_i2s_driver = {
 	.probe = jz4740_i2s_dev_probe,
 	.driver = {
 		.name = "jz4740-i2s",
-		.of_match_table = of_match_ptr(jz4740_of_matches)
+		.of_match_table = jz4740_of_matches,
 	},
 };
 
-- 
2.26.2

