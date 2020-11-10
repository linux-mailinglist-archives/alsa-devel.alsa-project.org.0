Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 811EF2AEAC0
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Nov 2020 09:02:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72B711741;
	Wed, 11 Nov 2020 09:01:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72B711741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605081766;
	bh=g7iE4i3m7n6xGHagt20QwINIFfXGNpqrVD0VnstBRbY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VyAJE/NRfMUldfStNokqpik4m8bI7/ZNam3jc0yt0wqJjzwI2KkXmbbNbZGpzPv6i
	 MMq2djBxTAAjwGOBzb1TepPKKYPeXkknr2ziVQQsdrd0IhKCnmY4n6nCR3R+z2udon
	 +q/n9JOmY/kP7fS/nWJP7MetGWkFrCOKjb72Fk4I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 044E9F804C3;
	Wed, 11 Nov 2020 09:00:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70BE7F801EB; Tue, 10 Nov 2020 21:40:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E50EF800EB
 for <alsa-devel@alsa-project.org>; Tue, 10 Nov 2020 21:40:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E50EF800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="i15mV2PV"
Received: by mail-qt1-x844.google.com with SMTP id n63so9614196qte.4
 for <alsa-devel@alsa-project.org>; Tue, 10 Nov 2020 12:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=wEPf5s9SkRqd1f4+ysAjNzyGwpeXs+ptojr97a73ahQ=;
 b=i15mV2PVbALbSOAjCWH/BdysvNOKVJTKHP9BmIrFkncW0zV6pqG7Rmsvgu2xh7mBR/
 YJONrJFViH2jx87ylKdRNWRtmCUGNd8PDJPR1WWLxXgvSK/+ZMLFcf70EuzYSfIVSZdr
 24HbNFDka7Jp28ZqMyJv5UK3FqU+UsW073G8KTMr57IsPbjt5ZW0YhwTZudzfeMNEYJx
 Fh1OTjA3AMQu3T2MtAFUa2zmFzS5iWW7Isi6cbzXpQ43/o4T2EUqrmK051mIe27FiuAa
 YedrpLlVU9G6h6Ect8tiBcB5fTKlQN8jdIzfjTXp2OhhU07fGmBukoFSrElfStEiNzKK
 rJRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=wEPf5s9SkRqd1f4+ysAjNzyGwpeXs+ptojr97a73ahQ=;
 b=Q6lr42G+NYfpxNhhn4/blAi3QfMgZ5cxCiB75jaJkZolx29bG+mF+G6bxHVJ3Moh/Y
 4gtcByLNbDfGPuK/lNJiS1E93vXAOJtl1I66AZb/YrH0R60Mzvihj6gt8EsxPGYhTn46
 63o4YvjgJVGeAsxSbod7fUAHhNbkz/2BuStKKkqRMRq8iKY+WG6XABn4rhdp445SgtU2
 iKnU+erPz9zTnDKgEYoke+K8VVsQo5T62tVFXejoWRvpfk+/Z+05auiHz3HJHoFJ6NCf
 gihM08/ds1N87FaGX5pzo8XMOpinKzhnTv680i1wcmssxk4oStIOZh0UGKYSG0GA7eKj
 DAhg==
X-Gm-Message-State: AOAM533dd9F/+kp8QjiRm3/WlTnmaTgfnVvfPyQMcpIDETraChXJODvS
 FpO1rnYrEoU0/p1iXANX5Yw=
X-Google-Smtp-Source: ABdhPJzJq6IREo151KD1LzJeXuWVP6u1NP615hKktMHDuhLiWgtT5h+dhLvq4/K4XhcFYPxq8XLrDQ==
X-Received: by 2002:ac8:4685:: with SMTP id g5mr14378822qto.173.1605040797982; 
 Tue, 10 Nov 2020 12:39:57 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:482:997:69a4:dc84:4b91:560e])
 by smtp.gmail.com with ESMTPSA id
 a85sm6247719qkg.3.2020.11.10.12.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 12:39:57 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 3/6] ASoC: phycore-ac97: Remove unused driver
Date: Tue, 10 Nov 2020 17:39:34 -0300
Message-Id: <20201110203937.25684-3-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201110203937.25684-1-festevam@gmail.com>
References: <20201110203937.25684-1-festevam@gmail.com>
X-Mailman-Approved-At: Wed, 11 Nov 2020 09:00:11 +0100
Cc: nicoleotsuka@gmail.com, shengjiu.wang@nxp.com,
 Fabio Estevam <festevam@gmail.com>, alsa-devel@alsa-project.org
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

Since commit e1324ece2af4 ("ARM: imx: Remove i.MX35 board files"), the 
MACH_PCM043 and MACH_PCA100 non-DT platform are no longer supported,
so get rid of their machine audio driver too.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 sound/soc/fsl/Kconfig        |  12 ----
 sound/soc/fsl/Makefile       |   2 -
 sound/soc/fsl/phycore-ac97.c | 121 -----------------------------------
 3 files changed, 135 deletions(-)
 delete mode 100644 sound/soc/fsl/phycore-ac97.c

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index c18ec9310aa7..63be2bf5b509 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -239,18 +239,6 @@ config SND_SOC_IMX_SSI
 
 comment "SoC Audio support for Freescale i.MX boards:"
 
-config SND_SOC_PHYCORE_AC97
-	tristate "SoC Audio support for Phytec phyCORE (and phyCARD) boards"
-	depends on MACH_PCM043 || MACH_PCA100
-	select SND_SOC_AC97_BUS
-	select SND_SOC_WM9712
-	select SND_SOC_IMX_PCM_FIQ
-	select SND_SOC_IMX_AUDMUX
-	select SND_SOC_IMX_SSI
-	help
-	  Say Y if you want to add support for SoC audio on Phytec phyCORE
-	  and phyCARD boards in AC97 mode
-
 config SND_SOC_EUKREA_TLV320
 	tristate "Eukrea TLV320"
 	depends on ARCH_MXC && !ARM64 && I2C
diff --git a/sound/soc/fsl/Makefile b/sound/soc/fsl/Makefile
index 5c6058f414be..12755058f877 100644
--- a/sound/soc/fsl/Makefile
+++ b/sound/soc/fsl/Makefile
@@ -63,7 +63,6 @@ obj-$(CONFIG_SND_SOC_IMX_PCM_DMA) += imx-pcm-dma.o
 
 # i.MX Machine Support
 snd-soc-eukrea-tlv320-objs := eukrea-tlv320.o
-snd-soc-phycore-ac97-objs := phycore-ac97.o
 snd-soc-imx-es8328-objs := imx-es8328.o
 snd-soc-imx-sgtl5000-objs := imx-sgtl5000.o
 snd-soc-imx-spdif-objs := imx-spdif.o
@@ -71,7 +70,6 @@ snd-soc-imx-mc13783-objs := imx-mc13783.o
 snd-soc-imx-audmix-objs := imx-audmix.o
 
 obj-$(CONFIG_SND_SOC_EUKREA_TLV320) += snd-soc-eukrea-tlv320.o
-obj-$(CONFIG_SND_SOC_PHYCORE_AC97) += snd-soc-phycore-ac97.o
 obj-$(CONFIG_SND_SOC_IMX_ES8328) += snd-soc-imx-es8328.o
 obj-$(CONFIG_SND_SOC_IMX_SGTL5000) += snd-soc-imx-sgtl5000.o
 obj-$(CONFIG_SND_SOC_IMX_SPDIF) += snd-soc-imx-spdif.o
diff --git a/sound/soc/fsl/phycore-ac97.c b/sound/soc/fsl/phycore-ac97.c
deleted file mode 100644
index e561f7ff1699..000000000000
--- a/sound/soc/fsl/phycore-ac97.c
+++ /dev/null
@@ -1,121 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-//
-// phycore-ac97.c  --  SoC audio for imx_phycore in AC97 mode
-//
-// Copyright 2009 Sascha Hauer, Pengutronix <s.hauer@pengutronix.de>
-
-#include <linux/module.h>
-#include <linux/moduleparam.h>
-#include <linux/device.h>
-#include <linux/i2c.h>
-#include <sound/core.h>
-#include <sound/pcm.h>
-#include <sound/soc.h>
-#include <asm/mach-types.h>
-
-#include "imx-audmux.h"
-
-static struct snd_soc_card imx_phycore;
-
-static const struct snd_soc_ops imx_phycore_hifi_ops = {
-};
-
-SND_SOC_DAILINK_DEFS(hifi,
-	DAILINK_COMP_ARRAY(COMP_CPU("imx-ssi.0")),
-	DAILINK_COMP_ARRAY(COMP_CODEC("wm9712-codec", "wm9712-hifi")),
-	DAILINK_COMP_ARRAY(COMP_PLATFORM("imx-ssi.0")));
-
-static struct snd_soc_dai_link imx_phycore_dai_ac97[] = {
-	{
-		.name		= "HiFi",
-		.stream_name	= "HiFi",
-		.ops		= &imx_phycore_hifi_ops,
-		SND_SOC_DAILINK_REG(hifi),
-	},
-};
-
-static struct snd_soc_card imx_phycore = {
-	.name		= "PhyCORE-ac97-audio",
-	.owner		= THIS_MODULE,
-	.dai_link	= imx_phycore_dai_ac97,
-	.num_links	= ARRAY_SIZE(imx_phycore_dai_ac97),
-};
-
-static struct platform_device *imx_phycore_snd_ac97_device;
-static struct platform_device *imx_phycore_snd_device;
-
-static int __init imx_phycore_init(void)
-{
-	int ret;
-
-	if (machine_is_pca100()) {
-		imx_audmux_v1_configure_port(MX27_AUDMUX_HPCR1_SSI0,
-			IMX_AUDMUX_V1_PCR_SYN | /* 4wire mode */
-			IMX_AUDMUX_V1_PCR_TFCSEL(3) |
-			IMX_AUDMUX_V1_PCR_TCLKDIR | /* clock is output */
-			IMX_AUDMUX_V1_PCR_RXDSEL(3));
-		imx_audmux_v1_configure_port(3,
-			IMX_AUDMUX_V1_PCR_SYN | /* 4wire mode */
-			IMX_AUDMUX_V1_PCR_TFCSEL(0) |
-			IMX_AUDMUX_V1_PCR_TFSDIR |
-			IMX_AUDMUX_V1_PCR_RXDSEL(0));
-	} else if (machine_is_pcm043()) {
-		imx_audmux_v2_configure_port(3,
-			IMX_AUDMUX_V2_PTCR_SYN | /* 4wire mode */
-			IMX_AUDMUX_V2_PTCR_TFSEL(0) |
-			IMX_AUDMUX_V2_PTCR_TFSDIR,
-			IMX_AUDMUX_V2_PDCR_RXDSEL(0));
-		imx_audmux_v2_configure_port(0,
-			IMX_AUDMUX_V2_PTCR_SYN | /* 4wire mode */
-			IMX_AUDMUX_V2_PTCR_TCSEL(3) |
-			IMX_AUDMUX_V2_PTCR_TCLKDIR, /* clock is output */
-			IMX_AUDMUX_V2_PDCR_RXDSEL(3));
-	} else {
-		/* return happy. We might run on a totally different machine */
-		return 0;
-	}
-
-	imx_phycore_snd_ac97_device = platform_device_alloc("soc-audio", -1);
-	if (!imx_phycore_snd_ac97_device)
-		return -ENOMEM;
-
-	platform_set_drvdata(imx_phycore_snd_ac97_device, &imx_phycore);
-	ret = platform_device_add(imx_phycore_snd_ac97_device);
-	if (ret)
-		goto fail1;
-
-	imx_phycore_snd_device = platform_device_alloc("wm9712-codec", -1);
-	if (!imx_phycore_snd_device) {
-		ret = -ENOMEM;
-		goto fail2;
-	}
-	ret = platform_device_add(imx_phycore_snd_device);
-
-	if (ret) {
-		printk(KERN_ERR "ASoC: Platform device allocation failed\n");
-		goto fail3;
-	}
-
-	return 0;
-
-fail3:
-	platform_device_put(imx_phycore_snd_device);
-fail2:
-	platform_device_del(imx_phycore_snd_ac97_device);
-fail1:
-	platform_device_put(imx_phycore_snd_ac97_device);
-	return ret;
-}
-
-static void __exit imx_phycore_exit(void)
-{
-	platform_device_unregister(imx_phycore_snd_device);
-	platform_device_unregister(imx_phycore_snd_ac97_device);
-}
-
-late_initcall(imx_phycore_init);
-module_exit(imx_phycore_exit);
-
-MODULE_AUTHOR("Sascha Hauer <s.hauer@pengutronix.de>");
-MODULE_DESCRIPTION("PhyCORE ALSA SoC driver");
-MODULE_LICENSE("GPL");
-- 
2.17.1

