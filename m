Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D91D216F14
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 16:44:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E54EA836;
	Tue,  7 Jul 2020 16:43:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E54EA836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594133058;
	bh=UeaKl4pv+RuJz2Ecee5sA+b4IurRmuXeBKL/YsV1/2E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KQY5QeAQvJDROUaEMhMQMvttcggVQef+sf+znSD9bPCze8HnHzPoOPABg/i1xL1KS
	 dZK2avRstGLfteL/qujbDcCJcPatgupaVHZHcnvdk5LSU6S0ED+C3o4rj4+KIprF27
	 tLYKQnoQiEranT4RdX3yiLDx6cDkI8OyTVt8XkVg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 548BBF80316;
	Tue,  7 Jul 2020 16:38:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 170B6F802E1; Tue,  7 Jul 2020 16:38:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0965AF802BD
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 16:38:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0965AF802BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Tihaag9j"
Received: by mail-wm1-x344.google.com with SMTP id f18so46801839wml.3
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 07:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HXwAK5e9O3NfsiXPR7kk8AeqU5Nw2ls4PmOWf/vu7lg=;
 b=Tihaag9jMZwV29UerK76hQHb+DRXAFh+EUs1V7aQVmLUfa12c5Fgqr88tInVnn3Uc1
 LOGKlmUmb+W/soV/36Apjvy+WJPjIp43OaM8ccv/ZI9kSNdijHkDH6/Gl3UPf7G6HBdf
 xiaH7jdxISmGJOyBG2mT24keyFUnXZ4oMlos6cNb89np7R9u13rqCCPwN0VKr6W4bKj+
 V3acj0cuYTx9DTeA41/QMR0Gn4mK+hnG7Aaa7kxv48yTjcNutHvDXt1ekAr2SXoIQr8n
 6YJeRmk++sSjJasxlfqA1DPJNpHwqCymdkR6TM+tEFI+jO78WkaMABQw3YGw7/etEaqx
 208A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HXwAK5e9O3NfsiXPR7kk8AeqU5Nw2ls4PmOWf/vu7lg=;
 b=Ml/JAURvFBLlWzdJIFGeYTeFsnIuP8yxS7UaxA7Rdx7K3sMkw5J38zV24CUGI2mFWD
 Uvlv+f2yRhw2HIXRJGfxnMn/iozCX9GfrpO/Oeubgz2MRxbZUZ32QwAAQC24kn0MwCug
 +n+JwiIf7lkvHdB2BNkNGCFiUI3iwOQAilFYYRymg88mi8weYBgW3iARzXqPPQwZsKdC
 1gRnzsn/UBO9yXaj2osWZq/T7Q7ntyVeKFqSftNTWkZdiHtiEZCfHjkD8OCPsUME87SN
 0uRCDxgY9GXGxNtT0KdkuKFHQUiFckQ/z5v1R2sg1GSUSl7zSFP2oyoiKmUMA+VvBd/G
 7N4w==
X-Gm-Message-State: AOAM532aqFCCYMRMzmz+V2KsNmstbwr0PAs8GU3+K+XWhQ/oBbIM/UuJ
 M362zit6bZEn5yERgjUJODBzzQ==
X-Google-Smtp-Source: ABdhPJxKl25fOx72TKj8zseBRL2O39bOx4sTMEBHeAZ/aj9XhWqZW3rmDeB2Wlp30lHgwCTBjVA4cg==
X-Received: by 2002:a1c:7f82:: with SMTP id a124mr4232616wmd.132.1594132680416; 
 Tue, 07 Jul 2020 07:38:00 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id y16sm1276131wro.71.2020.07.07.07.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 07:37:59 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH v2 08/28] ASoC: fsl: fsl_spdif: Update 'struct
 fsl_spdif_priv's descriptions
Date: Tue,  7 Jul 2020 15:37:22 +0100
Message-Id: <20200707143742.2959960-9-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707143742.2959960-1-lee.jones@linaro.org>
References: <20200707143742.2959960-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Vladimir Barinov <vbarinov@embeddedalley.com>, alsa-devel@alsa-project.org,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
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

Two descriptions for 'soc' and 'regcache_srpc' were missing.  Add them.

Fixes the following W=1 kernel build warning(s):

 sound/soc/fsl/fsl_spdif.c:125: warning: Function parameter or member 'soc' not described in 'fsl_spdif_priv'
 sound/soc/fsl/fsl_spdif.c:125: warning: Function parameter or member 'regcache_srpc' not described in 'fsl_spdif_priv'

Cc: Timur Tabi <timur@kernel.org>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Vladimir Barinov <vbarinov@embeddedalley.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 sound/soc/fsl/fsl_spdif.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index 7aa3bdec5b6b5..f0b2375a9246f 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -83,6 +83,7 @@ struct spdif_mixer_control {
 /**
  * struct fsl_spdif_priv - Freescale SPDIF private data
  *
+ * @soc: SoC specific data
  * @fsl_spdif_control: SPDIF control data
  * @cpu_dai_drv: cpu dai driver
  * @pdev: platform device pointer
@@ -100,6 +101,7 @@ struct spdif_mixer_control {
  * @spbaclk: SPBA clock (optional, depending on SoC design)
  * @dma_params_tx: DMA parameters for transmit channel
  * @dma_params_rx: DMA parameters for receive channel
+ * @regcache_srpc: regcache for SRPC
  */
 struct fsl_spdif_priv {
 	const struct fsl_spdif_soc_data *soc;
@@ -120,7 +122,6 @@ struct fsl_spdif_priv {
 	struct clk *spbaclk;
 	struct snd_dmaengine_dai_dma_data dma_params_tx;
 	struct snd_dmaengine_dai_dma_data dma_params_rx;
-	/* regcache for SRPC */
 	u32 regcache_srpc;
 };
 
-- 
2.25.1

