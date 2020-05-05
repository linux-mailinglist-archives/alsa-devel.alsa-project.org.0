Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5401C6284
	for <lists+alsa-devel@lfdr.de>; Tue,  5 May 2020 22:58:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7F3E1764;
	Tue,  5 May 2020 22:58:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7F3E1764
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588712338;
	bh=bUAX55uxct9o/8JjJpWsBod4EjMpSrTLyXJBtxL8bdc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RySzr+ZHSlYcENyotyNxvq6Y1UezJlWtYfK9BGubh9zduqx3qRR/6LdTz1rbo/tWY
	 AZk0tNE+2F/pt7bajZ4HKcg8oH1PXjG5gupnk8OCE5/BVQ/yYO8OMen7Cb9yJzSqGw
	 HW0BcnLSvNm6OlGb6oh77U0LmZ/8YN/HlvFs+xLA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDE1BF802DB;
	Tue,  5 May 2020 22:54:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48E3CF80299; Tue,  5 May 2020 22:53:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1FF5F8025E
 for <alsa-devel@alsa-project.org>; Tue,  5 May 2020 22:53:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1FF5F8025E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Z0L8NR3X"
Received: by mail-qk1-x743.google.com with SMTP id k81so3898867qke.5
 for <alsa-devel@alsa-project.org>; Tue, 05 May 2020 13:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ujW0nHi9xMd5qk/Iu456OfLYfIWk2zEF3Gg4EMtybLY=;
 b=Z0L8NR3XT+kkiNMgkL2qsAWfp/vZlIzOa8w2Z3218G7OxAZz7LSKH6Uui46BXiUSA3
 oStY6UktILiOEtOcrfFIYH8iBF1WzVePxjAq9M2SuWIA8Tn4kpEqn4hZvpIpWrbG48Tz
 G8yQ86qXqdqa9JJfpcQ5R5TrGaA6YmElFAo44C47PJMrrxwHN+oMIj7wers6NleSFIP4
 8p70WGeEg8n98GkzAVFYt99Px/ZtGEEZFq9q29gyu3gojRPp/2hb/c0n0DIk9YhvzASm
 ZPECuKyY7KDhdHpuELiQuMiLXA+BcMnoCbTh4R1nOXrsyNOSycQpbpyPVAQZZ/oJgZCw
 nKjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ujW0nHi9xMd5qk/Iu456OfLYfIWk2zEF3Gg4EMtybLY=;
 b=aqb3GcckFvIf7ak4z3ocu0CgYEEoe9gMa7n9BmgQpw0YKXYjhB/JQKGJI8vndz5Pd5
 63ro/FYpS4VSe8X4el/Pzc5nIAcllGvuuF1nmnmvYUqW2pY84lqMmJgY1lVSQbHUXhii
 Mu5MdFPco9h7Rck24S3Tmq/GYoZvocZDk9fWAa1ZByPYWBWJLv7HjD3AWA3DsEypp4AG
 oRf0fhOwp+VHRj6xDqdBpVCORCHTVAwq+yUQyDQU866ERTjV3OFcJpXFuPTc2aiuq3WE
 56HdeL5z/XPOsYHdejXSxv0/1zHN1romAIZx+Ulz9cFAXlnWQofWX7gZKwer5yGHsWay
 Wc9w==
X-Gm-Message-State: AGi0PubGXsF7pbIntUnUUWGBmH/Q6E3eo4ZKLkpP2i/7nJ20mfnCnmI9
 UR3Abqj0euGK9BEzoG//P6Ze/V7W
X-Google-Smtp-Source: APiQypJCOCSnM9yIyOIRr650TrrqZjWKpSrQnfV23KclsMxn3VcRTUG4Al0Rn58stkvFUfxNEmcEtA==
X-Received: by 2002:a37:38e:: with SMTP id 136mr5496834qkd.247.1588712023992; 
 Tue, 05 May 2020 13:53:43 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id k58sm2972513qtf.40.2020.05.05.13.53.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 13:53:43 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: alsa-devel@alsa-project.org, broonie@kernel.org, vijendar.mukunda@amd.com,
 tiwai@suse.de
Subject: [PATCH 06/14] ASoC: amd: irq handler changes for ACP3x PDM dma driver
Date: Tue,  5 May 2020 16:53:19 -0400
Message-Id: <20200505205327.642282-7-alexander.deucher@amd.com>
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

Whenever audio data equal to the PDM watermark level are
consumed, interrupt is generated.
Acknowledge the interrupt.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 sound/soc/amd/renoir/acp3x-pdm-dma.c | 38 ++++++++++++++++++++++++++++
 sound/soc/amd/renoir/rn_acp3x.h      |  2 ++
 2 files changed, 40 insertions(+)

diff --git a/sound/soc/amd/renoir/acp3x-pdm-dma.c b/sound/soc/amd/renoir/acp3x-pdm-dma.c
index 680b2505d65d..4ee47a85e37e 100644
--- a/sound/soc/amd/renoir/acp3x-pdm-dma.c
+++ b/sound/soc/amd/renoir/acp3x-pdm-dma.c
@@ -16,6 +16,31 @@
 
 #define DRV_NAME "acp_rn_pdm_dma"
 
+static irqreturn_t pdm_irq_handler(int irq, void *dev_id)
+{
+	struct pdm_dev_data *rn_pdm_data;
+	u16 cap_flag;
+	u32 val;
+
+	rn_pdm_data = dev_id;
+	if (!rn_pdm_data)
+		return IRQ_NONE;
+
+	cap_flag = 0;
+	val = rn_readl(rn_pdm_data->acp_base + ACP_EXTERNAL_INTR_STAT);
+	if ((val & BIT(PDM_DMA_STAT)) && rn_pdm_data->capture_stream) {
+		rn_writel(BIT(PDM_DMA_STAT), rn_pdm_data->acp_base +
+			  ACP_EXTERNAL_INTR_STAT);
+		snd_pcm_period_elapsed(rn_pdm_data->capture_stream);
+		cap_flag = 1;
+	}
+
+	if (cap_flag)
+		return IRQ_HANDLED;
+	else
+		return IRQ_NONE;
+}
+
 static struct snd_soc_dai_ops acp_pdm_dai_ops = {
 	.hw_params = NULL,
 	.trigger   = NULL,
@@ -66,6 +91,13 @@ static int acp_pdm_audio_probe(struct platform_device *pdev)
 	if (!adata->acp_base)
 		return -ENOMEM;
 
+	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
+	if (!res) {
+		dev_err(&pdev->dev, "IORESOURCE_IRQ FAILED\n");
+		return -ENODEV;
+	}
+
+	adata->pdm_irq = res->start;
 	adata->capture_stream = NULL;
 
 	dev_set_drvdata(&pdev->dev, adata);
@@ -77,6 +109,12 @@ static int acp_pdm_audio_probe(struct platform_device *pdev)
 
 		return -ENODEV;
 	}
+	status = devm_request_irq(&pdev->dev, adata->pdm_irq, pdm_irq_handler,
+				  irqflags, "ACP_PDM_IRQ", adata);
+	if (status) {
+		dev_err(&pdev->dev, "ACP PDM IRQ request failed\n");
+		return -ENODEV;
+	}
 	return 0;
 }
 
diff --git a/sound/soc/amd/renoir/rn_acp3x.h b/sound/soc/amd/renoir/rn_acp3x.h
index 0b450882c6c4..1ad8a7845fda 100644
--- a/sound/soc/amd/renoir/rn_acp3x.h
+++ b/sound/soc/amd/renoir/rn_acp3x.h
@@ -28,8 +28,10 @@
 
 #define ACP_ERROR_MASK 0x20000000
 #define ACP_EXT_INTR_STAT_CLEAR_MASK 0xFFFFFFFF
+#define PDM_DMA_STAT 0x10
 
 struct pdm_dev_data {
+	u32 pdm_irq;
 	void __iomem *acp_base;
 	struct snd_pcm_substream *capture_stream;
 };
-- 
2.25.4

