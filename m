Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 293C91CE762
	for <lists+alsa-devel@lfdr.de>; Mon, 11 May 2020 23:25:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC280165E;
	Mon, 11 May 2020 23:24:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC280165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589232315;
	bh=Nl7D7/NEAUsz9wEM/mJTTfri5Wd9vXlG+aWhv/LPc6U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KpoUj1v7vzhDaVTbq3RyhwqXGTKwY9YSVV2/l+/uLRpgbmYEXpS/DDt8cTQl2Yh4+
	 uix3rSlKpFM+jE7piK4ph7041/Ia+Bije4KXY7Bs8YgjKKQ9qEzMtPGitfHRJ+xIx2
	 2emdOMCyNlyZU6X7jfAqfVMaYfxylU8qCxIa6UrQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8364BF802E0;
	Mon, 11 May 2020 23:21:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C32A5F802A0; Mon, 11 May 2020 23:20:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50649F80254
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 23:20:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50649F80254
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bkFki8sU"
Received: by mail-qt1-x843.google.com with SMTP id i68so9357422qtb.5
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 14:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zvtJwPSCYW+MuonbkYt3SOcglOA+xtGW3BGzmsx5WdE=;
 b=bkFki8sUvH7neMIpfgPQy0pkbbp5Ir/s0aX5Myt+Md6bCir2AsCvkvn9mUDewp4og6
 9mfrSWFS5uA1+dJsT5n+/zuWuiOMR48fGVotP2WRqX79fca2IH74EefHG83a01wuqGF5
 MpAl/QSBRajTVID2I93G/LecGwigLnIuw86n4a1H14VU0LP2SkOuRQlQOXkvvlUiOAzr
 5FTRCF1E7HuhoXEsI8nFvpcY0FE2QthcoDHgW1560Qr9eCfYC8zIjJstZj40v9Mw5xF3
 SRb4jTK8/CA7Wf3mSFLo1ynaRQmHKw9FseFE+4pCoeCdeTCxDRXNajupge9ddlGfLFoI
 2DRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zvtJwPSCYW+MuonbkYt3SOcglOA+xtGW3BGzmsx5WdE=;
 b=MBipUHXLEsJ+F05Ax2d0VQSIp+F8FKTiq9fZfYN4Jov8xIwjyNFCn8PAm2+NYaWUE5
 I4dRUjr813OV9zwqwd7pSohLrzENM03PtswLC51uVWKNdAxJ/OI/lpUhnvn5bzUVVMAx
 FM976vZwIpQclv8hzOFwFf+bPMigg371O5fOZ4AFKI0l9kJwSe+W/8isaBgm/ci+k58E
 8yFUlQr0lYT4m2VwEAliQhlK2YSy5199vtyhwz2SFf3i9Rn78cwErI1O+gqDANGtNPRj
 hMM6QsD5UNknMJ3LGnZOBJoB7ex1RS01jo0OzR85GzSEJUHCcJ6D1NsR4nxVxrczqE1O
 NWIg==
X-Gm-Message-State: AGi0PuZZ05IUeIuvVw7Odu/4ES9zeQQREdvTvzFdZABJL3Y6mVhmXx/6
 VdopbottiU0wTbV6/H8/ZRFhug2F
X-Google-Smtp-Source: APiQypIuu1Esia3Z42BRSYMj9xxIsPpozhP+ieK+72ksgdArYhWFL+Vkfs6qwTirYcrlOoRmG+vOow==
X-Received: by 2002:ac8:6b55:: with SMTP id x21mr9708677qts.75.1589232029510; 
 Mon, 11 May 2020 14:20:29 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id c26sm9148691qkm.98.2020.05.11.14.20.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 14:20:29 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: alsa-devel@alsa-project.org, broonie@kernel.org, vijendar.mukunda@amd.com,
 tiwai@suse.de
Subject: [PATCH v2 05/14] ASoC: amd: add ACP3x PDM platform driver
Date: Mon, 11 May 2020 17:20:05 -0400
Message-Id: <20200511212014.2359225-6-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200511212014.2359225-1-alexander.deucher@amd.com>
References: <20200511212014.2359225-1-alexander.deucher@amd.com>
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

V2:
- Removed empty declaration of dai_ops

 sound/soc/amd/renoir/acp3x-pdm-dma.c | 95 ++++++++++++++++++++++++++++
 sound/soc/amd/renoir/rn_acp3x.h      |  5 ++
 2 files changed, 100 insertions(+)
 create mode 100644 sound/soc/amd/renoir/acp3x-pdm-dma.c

diff --git a/sound/soc/amd/renoir/acp3x-pdm-dma.c b/sound/soc/amd/renoir/acp3x-pdm-dma.c
new file mode 100644
index 000000000000..1dda8cf2edd2
--- /dev/null
+++ b/sound/soc/amd/renoir/acp3x-pdm-dma.c
@@ -0,0 +1,95 @@
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

