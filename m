Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B89A31C627A
	for <lists+alsa-devel@lfdr.de>; Tue,  5 May 2020 22:57:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 627791761;
	Tue,  5 May 2020 22:56:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 627791761
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588712230;
	bh=MyRPfxKMG59AIy1NlpAXeh2J9ljb2OrEOBksHY3lkgA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=unRp/sKoGOppdr/e6XnB/JDA5dEEh+QpYnQjC3FZ7S5inPN0d4NWbhwo2gCpt6EGq
	 MZ2Cs5GksHqNysGQ+SWUnuHYQt1SOyQVC9C0sPnG8Va6mvBxrawX/G1LACdFHGGqtW
	 B4WBLqMSh2sgYO4C1wlO65UIl5JXfe8tb32GwJ94=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BDE2F802A1;
	Tue,  5 May 2020 22:54:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2A7CF8028F; Tue,  5 May 2020 22:53:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC686F8015F
 for <alsa-devel@alsa-project.org>; Tue,  5 May 2020 22:53:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC686F8015F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="sYAVFCsN"
Received: by mail-qk1-x741.google.com with SMTP id c10so285784qka.4
 for <alsa-devel@alsa-project.org>; Tue, 05 May 2020 13:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l5GC7AeviTm0dsPxzVOVf9lEu4WrYp5KvzaevYC7+jM=;
 b=sYAVFCsN83uF1khHYGG45QBllVzDoapvj6i0iBkG5i9xtWWnsevterJS7GwxPKRQvG
 gdBesCKeedt4UEvRLVTjA0S6l4QJIMaiorc3pK6dWrM5zP/u5UQzViVqskckkxgee0Iq
 CNOFsx9KC8MKSH60kKrBAdwBM5wozC/6Ep5rj8cxj80ynZ9VGIwL8JWLJinXdpxBf35f
 hnt50MXkCH2VFh/ZOXcm42GhcEZPVbb/ecvrgMzip+n30p2Ul85r1/JYgTJ2hPBHKleY
 MsYCzPhHlTvdNxXQfNWsLGHFRT/Y1dMKYa9eWSjdXajHJpCt5tA1f/ZtP6ayqD2W+wPI
 OzbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l5GC7AeviTm0dsPxzVOVf9lEu4WrYp5KvzaevYC7+jM=;
 b=bIMw2NVp0/kVtVPjcLUppcJD5Pjl/RjeN7rGXbOph6zasSLFDbvAo3FWvZo8IImgYe
 0ztFRqVq2gjM6jiOJ2JXELu6klxaU0136zol3/3WY2sKrOhaecVe/iyP3TlQtNH1XmD3
 DB8GHxnB2leTnej8Ug4VOEz0eAm6Xf86IcjnjEj4xrhQvYt/13FNXTrM8y6H0WlIcMhT
 MOkndnrOUnTeSDLd+QIB6FX4umA1cgwlKIzBZXcTSXBTgwCJGtN31scC0eEhTbjOdDY5
 fvn2RHTzXXHYF2PtBNewOLjNB7v0fGDo8jQaHFGKm+QboA9w6c2Vl+lTQlfjOvBqGITL
 DReA==
X-Gm-Message-State: AGi0PuZY9kwf2nuEmFx6RakVw21SNlFqU0R3k+2/WzVkkkfxMeFlFi4/
 gtcVXLolDpa+/HjA6olnJDr46PUS
X-Google-Smtp-Source: APiQypIyN6LwkRcot9rat4OWuQmKateQrs//birb9eaJKSKMRMZpvUZ45dYBMh7xQqpIIma20j8UXw==
X-Received: by 2002:a37:b105:: with SMTP id a5mr5514926qkf.308.1588712022205; 
 Tue, 05 May 2020 13:53:42 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id k58sm2972513qtf.40.2020.05.05.13.53.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 13:53:41 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: alsa-devel@alsa-project.org, broonie@kernel.org, vijendar.mukunda@amd.com,
 tiwai@suse.de
Subject: [PATCH 05/14] ASoC: amd: add ACP3x PDM platform driver
Date: Tue,  5 May 2020 16:53:18 -0400
Message-Id: <20200505205327.642282-6-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200505205327.642282-1-alexander.deucher@amd.com>
References: <20200505205327.642282-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
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

From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

PDM platform driver binds to the platform device created by
ACP3x PCI device. PDM driver registers ALSA DMA and CPU DAI
components with ASoC framework.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 sound/soc/amd/renoir/acp3x-pdm-dma.c | 101 +++++++++++++++++++++++++++
 sound/soc/amd/renoir/rn_acp3x.h      |   5 ++
 2 files changed, 106 insertions(+)
 create mode 100644 sound/soc/amd/renoir/acp3x-pdm-dma.c

diff --git a/sound/soc/amd/renoir/acp3x-pdm-dma.c b/sound/soc/amd/renoir/acp3x-pdm-dma.c
new file mode 100644
index 000000000000..680b2505d65d
--- /dev/null
+++ b/sound/soc/amd/renoir/acp3x-pdm-dma.c
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// AMD ALSA SoC PDM Driver
+//
+//Copyright 2020 Advanced Micro Devices, Inc.
+
+#include <linux/platform_device.h>
+#include <linux/module.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+
+#include "rn_acp3x.h"
+
+#define DRV_NAME "acp_rn_pdm_dma"
+
+static struct snd_soc_dai_ops acp_pdm_dai_ops = {
+	.hw_params = NULL,
+	.trigger   = NULL,
+};
+
+static struct snd_soc_dai_driver acp_pdm_dai_driver = {
+	.capture = {
+		.rates = SNDRV_PCM_RATE_48000,
+		.formats = SNDRV_PCM_FMTBIT_S24_LE |
+			   SNDRV_PCM_FMTBIT_S32_LE,
+		.channels_min = 2,
+		.channels_max = 2,
+		.rate_min = 48000,
+		.rate_max = 48000,
+	},
+	.ops = &acp_pdm_dai_ops,
+};
+
+static const struct snd_soc_component_driver acp_pdm_component = {
+	.name		= DRV_NAME,
+};
+
+static int acp_pdm_audio_probe(struct platform_device *pdev)
+{
+	struct resource *res;
+	struct pdm_dev_data *adata;
+	unsigned int irqflags;
+	int status;
+
+	if (!pdev->dev.platform_data) {
+		dev_err(&pdev->dev, "platform_data not retrieved\n");
+		return -ENODEV;
+	}
+	irqflags = *((unsigned int *)(pdev->dev.platform_data));
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(&pdev->dev, "IORESOURCE_MEM FAILED\n");
+		return -ENODEV;
+	}
+
+	adata = devm_kzalloc(&pdev->dev, sizeof(*adata), GFP_KERNEL);
+	if (!adata)
+		return -ENOMEM;
+
+	adata->acp_base = devm_ioremap(&pdev->dev, res->start,
+				       resource_size(res));
+	if (!adata->acp_base)
+		return -ENOMEM;
+
+	adata->capture_stream = NULL;
+
+	dev_set_drvdata(&pdev->dev, adata);
+	status = devm_snd_soc_register_component(&pdev->dev,
+						 &acp_pdm_component,
+						 &acp_pdm_dai_driver, 1);
+	if (status) {
+		dev_err(&pdev->dev, "Fail to register acp pdm dai\n");
+
+		return -ENODEV;
+	}
+	return 0;
+}
+
+static int acp_pdm_audio_remove(struct platform_device *pdev)
+{
+	return 0;
+}
+
+static struct platform_driver acp_pdm_dma_driver = {
+	.probe = acp_pdm_audio_probe,
+	.remove = acp_pdm_audio_remove,
+	.driver = {
+		.name = "acp_rn_pdm_dma",
+	},
+};
+
+module_platform_driver(acp_pdm_dma_driver);
+
+MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
+MODULE_DESCRIPTION("AMD ACP3x Renior PDM Driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:" DRV_NAME);
diff --git a/sound/soc/amd/renoir/rn_acp3x.h b/sound/soc/amd/renoir/rn_acp3x.h
index 5e4fd99397d5..0b450882c6c4 100644
--- a/sound/soc/amd/renoir/rn_acp3x.h
+++ b/sound/soc/amd/renoir/rn_acp3x.h
@@ -29,6 +29,11 @@
 #define ACP_ERROR_MASK 0x20000000
 #define ACP_EXT_INTR_STAT_CLEAR_MASK 0xFFFFFFFF
 
+struct pdm_dev_data {
+	void __iomem *acp_base;
+	struct snd_pcm_substream *capture_stream;
+};
+
 static inline u32 rn_readl(void __iomem *base_addr)
 {
 	return readl(base_addr - ACP_PHY_BASE_ADDRESS);
-- 
2.25.4

