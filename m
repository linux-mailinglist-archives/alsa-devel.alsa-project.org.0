Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D39F1CE767
	for <lists+alsa-devel@lfdr.de>; Mon, 11 May 2020 23:26:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37DA61670;
	Mon, 11 May 2020 23:25:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37DA61670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589232384;
	bh=KSfQhOpnvNdGNI4/xTuI00kX5WjE7dVG8hO9bIOr010=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UJJSIt9BpeNdpwz9r7aEvLyB8bFyxJtPWTiEQ+2GEYL/Q8u9KsQr8EpOATABH+cLe
	 k1+QbekZxjTnjoIx1Bbkv9pLMS9UL0v5GrwK6t7KMRj1AiiZ2LrfmnBJDmIMmx4OAU
	 uJEH9tISaf4vVsIwkPi0ODInqx2c1rV1CnRi7o0U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DE66F802EB;
	Mon, 11 May 2020 23:21:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74BE6F80254; Mon, 11 May 2020 23:20:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21DF2F8027D
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 23:20:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21DF2F8027D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PK7ty76L"
Received: by mail-qt1-x844.google.com with SMTP id c24so2909428qtw.7
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 14:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qzGVjqSG9mTKiIMJRK+NL4nYVOs8cUKRy6lyIw1ZFrM=;
 b=PK7ty76Lh3yOAdrW0BK6eHqSJm9IbHQfl0R1vFCZ283vxjddSg9T1SRVcMEYEMAFgf
 5ZmrhJvpGkadcbgw1NsBrWVu2/vl8DO/Lax7LjObpze0LfN4REqjIT1iT/2ILBhOj3ck
 aJuamTdKEjOXsWaQg7fnZ6Zru2QOo2K/HxPZxI6Tt9Ejfh+KGiLD7QotO3M10JXBzltI
 UbbCqUqv5kLMINzDF+z3/MHScWDEl7J2HpRchsePAn+lZBdVmoFmgaHmQretcCoVyUf0
 QRz29i4mv6u9VSYRstAoTGw592B5bvTTgDfF6aJ8imirdeCyESrwaGa3kxlQsJxORLU3
 EUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qzGVjqSG9mTKiIMJRK+NL4nYVOs8cUKRy6lyIw1ZFrM=;
 b=g9HYEbLy30m57Jg9coVd7fUrf0Ft169so6GgPcdxUxezdjyhRp6KqorAMVO54DZpGL
 g5Ye7GPyfidqWr6oOwpiomDZqH7q49o6F3jcYRWZDjdSfivihvY1ToBmund3B6sBzTOg
 jJHAiOiaIVyVM0OgKtpfjXlG44tCdfl7txtKM0MmwZ17ezAWl+s8IxeXcnxC87Xogd8u
 66okZTpZ0hM1E3LnQnmZtrJi4HS8V4QkbEE+YIM+58KJQy+uETseVhBQ8kEdzb3GddXz
 xArloKE5suy7oUXkmZbSfj5473ir0NBxlDCA+wcRFLurj8WclA8XhiIJD2atz2yRbAUk
 Nq1w==
X-Gm-Message-State: AGi0Pub6da3MUCvlPwruPj5mmCMiHxIC5cerEHSsXxW1/OyKM+MMtmnw
 z6tOtPXHxTW4FdJDyiGwF9C5NJcy
X-Google-Smtp-Source: APiQypKOlh5rEdY2ntvsLzl0uil7M2ftnqV4pcdGHvkKRTwPwuGOBsETZThS/rZelLAV+0bB+DmeTw==
X-Received: by 2002:ac8:550c:: with SMTP id j12mr18728752qtq.22.1589232030802; 
 Mon, 11 May 2020 14:20:30 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id c26sm9148691qkm.98.2020.05.11.14.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 14:20:30 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: alsa-devel@alsa-project.org, broonie@kernel.org, vijendar.mukunda@amd.com,
 tiwai@suse.de
Subject: [PATCH v2 06/14] ASoC: amd: irq handler changes for ACP3x PDM dma
 driver
Date: Mon, 11 May 2020 17:20:06 -0400
Message-Id: <20200511212014.2359225-7-alexander.deucher@amd.com>
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

Whenever audio data equal to the PDM watermark level
are consumed, interrupt is generated.
Acknowledge the interrupt.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 sound/soc/amd/renoir/acp3x-pdm-dma.c | 38 ++++++++++++++++++++++++++++
 sound/soc/amd/renoir/rn_acp3x.h      |  2 ++
 2 files changed, 40 insertions(+)

diff --git a/sound/soc/amd/renoir/acp3x-pdm-dma.c b/sound/soc/amd/renoir/acp3x-pdm-dma.c
index 1dda8cf2edd2..fdac2c1e3acd 100644
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
 static struct snd_soc_dai_driver acp_pdm_dai_driver = {
 	.capture = {
 		.rates = SNDRV_PCM_RATE_48000,
@@ -60,6 +85,13 @@ static int acp_pdm_audio_probe(struct platform_device *pdev)
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
@@ -71,6 +103,12 @@ static int acp_pdm_audio_probe(struct platform_device *pdev)
 
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

