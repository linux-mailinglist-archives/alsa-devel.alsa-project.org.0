Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1205D1C6292
	for <lists+alsa-devel@lfdr.de>; Tue,  5 May 2020 23:03:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB5D21792;
	Tue,  5 May 2020 23:02:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB5D21792
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588712584;
	bh=xJxUAGPZt2Uv90HX57w9RNfrxCSkJSUrLJ928RAtssE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PJIyRC9OMOCi1F9XvuvGhhKqbBGSUgandOEXjLRy5jzRLtbclmoNiNx1W/ahisz1/
	 gCzfwCQza5MSWPRNxaKcbxBCZuQ7oZj6uazkHYcD+dNyeh6/qYZajYGd4YhzvWWrzT
	 9H4VlAp3SVHqug19fB2vvkkkMbAuVaWca66vue+o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04E3EF80336;
	Tue,  5 May 2020 22:54:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 243CAF802EB; Tue,  5 May 2020 22:54:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
 DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9C12F8023E
 for <alsa-devel@alsa-project.org>; Tue,  5 May 2020 22:53:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9C12F8023E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="uPJnt6v+"
Received: by mail-qk1-x742.google.com with SMTP id b6so3857318qkh.11
 for <alsa-devel@alsa-project.org>; Tue, 05 May 2020 13:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c+eSD6JZC4THB9YwHcMFZmdVU+wdM7Rk0LOykpENBUc=;
 b=uPJnt6v+OKPG0l3QBnfrm5lEUiiITEBit1IpQsujhU8Ecq3mkqFtdZZSMx2k1JwBdo
 wZDQ1RiL+Y44f9C+viFRflLFsdpGPL13wrrrsBQDSEgDcSz5vKm6pglLFhshTeVhR3e8
 qnFR3iCcj3/PAcXh7jnTVzfnSjYzgAYkcwZxnCe25uskPoePIf2nmZn+GrSPRioZ2L2m
 gmAACYGCpDnN8Hs0kXOibvLpGL0XlXNXKu1DXNdwesCKAuKqn4N+ZD0qLnDOMy+K5mN2
 igDzofdzUriWjueH5JESGw1sY2tLQGtRRVgBT/Gq1hg2oVbZnzeSXLrjQgmV+HZVAwFB
 /j+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c+eSD6JZC4THB9YwHcMFZmdVU+wdM7Rk0LOykpENBUc=;
 b=OsHwKQ/JbT/+lyruiNHy/SBCV6bL88Z4aJpIFrECmkRqxM8oED1BHR/mOpw2mtxK1l
 fzHOztWFBecEgRokNQj3CQd2Hw+NmS4dQXJamUA/S1u+ZpB3ZNp3c6TqXapY3asO4lme
 LF8CE7m9LjbFzK5uv2s6qYtM6SYiLhI3GjQp+sFVvJW3Mxhwg4sD8CKZ+N0V/1WvbZTP
 udCQZF534SN7/5ed7fGPPawxiIo0DnJEzkesvHEfdoaoYgn9zNByW16PqpWON5DBBQ9s
 cHBkFJLPajOiBa/V4XckQbkWsW2usec5eohRkam9GSh7C9KBg1oaFvQ7kMGJ9ZZYoLvr
 IWkw==
X-Gm-Message-State: AGi0PuYjULwyYKvmCJylH0a3STIDQ/nxvGT6wXr9zM4Xhwl19WR8DeYw
 BH4AGV8wM48+IhjaU2IsWoptpnMo
X-Google-Smtp-Source: APiQypKpkPgkH1M17qPy4bQQ2mR3+p3rDKMQA57Nr+BLm+SvC3RDN9Puwamld/72oFR2I0ao7S9F2A==
X-Received: by 2002:a37:ae07:: with SMTP id x7mr4822569qke.13.1588712029628;
 Tue, 05 May 2020 13:53:49 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id k58sm2972513qtf.40.2020.05.05.13.53.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 13:53:49 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: alsa-devel@alsa-project.org, broonie@kernel.org, vijendar.mukunda@amd.com,
 tiwai@suse.de
Subject: [PATCH 10/14] ASoC: amd: add ACP PDM DMA driver pm ops
Date: Tue,  5 May 2020 16:53:23 -0400
Message-Id: <20200505205327.642282-11-alexander.deucher@amd.com>
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

Add ACP PDM DMA driver pm ops.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 sound/soc/amd/renoir/acp3x-pdm-dma.c | 53 ++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/sound/soc/amd/renoir/acp3x-pdm-dma.c b/sound/soc/amd/renoir/acp3x-pdm-dma.c
index 6e8d5b85bce4..ef256c777873 100644
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
@@ -457,19 +458,71 @@ static int acp_pdm_audio_probe(struct platform_device *pdev)
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

