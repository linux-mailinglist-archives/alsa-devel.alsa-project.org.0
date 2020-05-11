Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BC51CE76B
	for <lists+alsa-devel@lfdr.de>; Mon, 11 May 2020 23:27:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA6B1166D;
	Mon, 11 May 2020 23:26:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA6B1166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589232451;
	bh=WagKbrqJTfUklAy9cL7NMtRQRQQsqtOpZ9yDa/fCcbA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FhaplnHWip6a4fbeSXuhlSFEi0nw/303z6E1FoLGCqQDrrfFo2ZR3tQw74MvTCbKe
	 xxONQ5u9QX/g6gaS66vuvKlqkBRP8E6WD+sz2b9qXc/3QL7MtS29Lo+U04FHujOfFK
	 0yg0sPgu/5YfB9533sPvm/Jls2vDOasXJrzGmljM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE698F80308;
	Mon, 11 May 2020 23:21:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64488F80254; Mon, 11 May 2020 23:20:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADD45F80291
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 23:20:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADD45F80291
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="dH2pLIxP"
Received: by mail-qt1-x841.google.com with SMTP id b1so8568819qtt.1
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 14:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e8M1e1/gwGXERcgjjjjU4mWRilXtzdychUe5Oc1rZY8=;
 b=dH2pLIxPamAR76lYGylmtvnYCNtWAjyy+yPHVG1P1bm4+rQ8jPn5s5Vi7gAo+QByV8
 xI6bCzoDdQf2DKgurxWxYmJUdRipTZDr05xvrUUaTxFKadfs2vdDUNsGnjIRZYAyVUqK
 HkTGBlN+WuTDvRajxbkON32fqy8QEFAdrj63c/SZ2L0Sla0/20hLLzu+56zEeNfPJiOR
 z1/2KqUSHq4+SNLeLGF6TL2KBVLOtEoDzQLhGxQIHA9UVzDx5NjgqljQBb0RADVXHm+i
 ThFguteQZ2xNgWEeyLRetsa+oD+xHGou3K+DO6M3ovD7ozz03aJH1PvvkOGe0mH/6hm+
 4KZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e8M1e1/gwGXERcgjjjjU4mWRilXtzdychUe5Oc1rZY8=;
 b=VIaLO7bCPHysqjo+pJJopsm1/qCeLdeVNf2hjDtQF0RT2Na9NqretSOk3pzcLma9CH
 hHgoO+xiA1RfKBYvX/Ns209PmvouawNtn8r9fFURl6i7IYp6dxIdbAJ+YynfActnSOS8
 GnJeHAfng10qKH2lRjSsXRxgJ8BYY8Fez/LzKGwn7LefWrwxewsaouyFwT45u9P+8xDK
 RatN/M0QZitl3ol4WFFu8WG6u+YFUBKILlYv7z5rLHjxod2YQCfZJ+xTyzsEMnv9dHw7
 lIu2fYpk3gKW7a76qkXPKOofWQT5KkWXpxINw2chyhGeUlQblXP/2Wvd7asCxi32Bl9Q
 cnNA==
X-Gm-Message-State: AGi0PuY+hRdAT+CahtJcYed7YG4pxc4Ss+msFoyMNM+5zRbb1I6/vUDl
 P/ZOEM2AcBL5Aa5WWro4UwPn6v6J
X-Google-Smtp-Source: APiQypJ2zCSrMNDamhgns1WJC/N5K7HijrkadFy3c1Nq+Idq8KfSajmEBmB/jrN/79aQgZ8Su8cWPQ==
X-Received: by 2002:ac8:2ba7:: with SMTP id m36mr18761030qtm.254.1589232035657; 
 Mon, 11 May 2020 14:20:35 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id c26sm9148691qkm.98.2020.05.11.14.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 14:20:35 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: alsa-devel@alsa-project.org, broonie@kernel.org, vijendar.mukunda@amd.com,
 tiwai@suse.de
Subject: [PATCH v2 10/14] ASoC: amd: add ACP PDM DMA driver pm ops
Date: Mon, 11 May 2020 17:20:10 -0400
Message-Id: <20200511212014.2359225-11-alexander.deucher@amd.com>
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

Add ACP PDM DMA driver pm ops.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 sound/soc/amd/renoir/acp3x-pdm-dma.c | 53 ++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/sound/soc/amd/renoir/acp3x-pdm-dma.c b/sound/soc/amd/renoir/acp3x-pdm-dma.c
index fd19b17f553e..942010021319 100644
--- a/sound/soc/amd/renoir/acp3x-pdm-dma.c
+++ b/sound/soc/amd/renoir/acp3x-pdm-dma.c
@@ -8,6 +8,7 @@
 #include <linux/module.h>
 #include <linux/err.h>
 #include <linux/io.h>
+#include <linux/pm_runtime.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/soc-dai.h>
@@ -453,19 +454,71 @@ static int acp_pdm_audio_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "ACP PDM IRQ request failed\n");
 		return -ENODEV;
 	}
+	pm_runtime_set_autosuspend_delay(&pdev->dev, ACP_SUSPEND_DELAY_MS);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+	pm_runtime_allow(&pdev->dev);
 	return 0;
 }
 
 static int acp_pdm_audio_remove(struct platform_device *pdev)
 {
+	pm_runtime_disable(&pdev->dev);
 	return 0;
 }
 
+static int acp_pdm_resume(struct device *dev)
+{
+	struct pdm_dev_data *adata;
+	struct snd_pcm_runtime *runtime;
+	struct pdm_stream_instance *rtd;
+	u32 period_bytes, buffer_len;
+
+	adata = dev_get_drvdata(dev);
+	if (adata->capture_stream && adata->capture_stream->runtime) {
+		runtime = adata->capture_stream->runtime;
+		rtd = runtime->private_data;
+		period_bytes = frames_to_bytes(runtime, runtime->period_size);
+		buffer_len = frames_to_bytes(runtime, runtime->buffer_size);
+		config_acp_dma(rtd, SNDRV_PCM_STREAM_CAPTURE);
+		init_pdm_ring_buffer(MEM_WINDOW_START, buffer_len, period_bytes,
+				     adata->acp_base);
+	}
+	enable_pdm_interrupts(adata->acp_base);
+	return 0;
+}
+
+static int acp_pdm_runtime_suspend(struct device *dev)
+{
+	struct pdm_dev_data *adata;
+
+	adata = dev_get_drvdata(dev);
+	disable_pdm_interrupts(adata->acp_base);
+
+	return 0;
+}
+
+static int acp_pdm_runtime_resume(struct device *dev)
+{
+	struct pdm_dev_data *adata;
+
+	adata = dev_get_drvdata(dev);
+	enable_pdm_interrupts(adata->acp_base);
+	return 0;
+}
+
+static const struct dev_pm_ops acp_pdm_pm_ops = {
+	.runtime_suspend = acp_pdm_runtime_suspend,
+	.runtime_resume = acp_pdm_runtime_resume,
+	.resume = acp_pdm_resume,
+};
+
 static struct platform_driver acp_pdm_dma_driver = {
 	.probe = acp_pdm_audio_probe,
 	.remove = acp_pdm_audio_remove,
 	.driver = {
 		.name = "acp_rn_pdm_dma",
+		.pm = &acp_pdm_pm_ops,
 	},
 };
 
-- 
2.25.4

