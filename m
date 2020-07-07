Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 791EB2169ED
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 12:19:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1741F1612;
	Tue,  7 Jul 2020 12:18:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1741F1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594117164;
	bh=i3n9B9s2VeEmrvXJUCV0BnBc6eGEF0gB3iLz2vZE2M4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LLiW8yx70UayY1GmDtzKxgTzRjg8eajFJ2LWgxZHQgyejCPWTM6wevxkTYZBzDSbo
	 XI7DsF492mnXSWCm/AP4HS7cWfvTq8J4GPQQnOS4QlMC/dtJMxK1PXsKIRtHD9ryb4
	 pJEX+9Cu65JsCawyYSILVTG4YQPIeIt3UstzxaYc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD2F9F802C2;
	Tue,  7 Jul 2020 12:17:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3115CF802A9; Tue,  7 Jul 2020 12:16:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A95DAF801F9
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 12:16:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A95DAF801F9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="JPaF/Cic"
Received: by mail-wr1-x442.google.com with SMTP id z2so22274516wrp.2
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 03:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X8lNwwZEdxo/c3swk/aA3YOExp2MKHA0sqq87q0a3wI=;
 b=JPaF/CicEUbbEvjATlnxD7O2L+C/bGJ44q6+XFBdFLiooQUTKPkM6b0DF3WaHnu4JS
 ljQ5WTYJ0xaTu2U4mv3oOx94WuvUQoFuRkIBSLp8S2hyPW4ZQLvUaGeRMmQZt7cpJj4x
 m01vqsFt+pXzQBT5G2aTJ3/BjNOhPTnV8UlrL+8wty5YciPoKJ4ARWpjMjBBFNiU1Uhx
 9RLT5cN5m8UAT70LX2t+cMicwmn7u5LoXarjAg0/SCZWkFYApjO4j0N51QUXv+ZkdZxI
 q7sxYY1T4eOP1cuu4pEh2T0MQzepg3MsQdNjmC/63Xv8pzwyBzI699063chxHcX2/rES
 m0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X8lNwwZEdxo/c3swk/aA3YOExp2MKHA0sqq87q0a3wI=;
 b=hn9wu3Uf3dGxBUQdIWKbILXwFBhFnGC+xaDqClQjsrqHujbzXJzkQPtHsVkZXQDz09
 1P+wAEM+CXLTivMlAv3tdJBroaARQ8DoRjLz2iegU5HRJ5HDjRd+kMm4EKOWOJdSzxrt
 5cECjXMZWTUHeFW6mgcNSHQRLSbX0EQ/IQBtwizmSQTdjWLTJt4/tDBPxCo1sjQK/vNs
 SvuTSQ2jzuUKFBBVcreHFb1SbPQKfgPFnqspzJaNyCzaSFoxIBuN9/Aklks5JGNsOJPe
 0FC2liZImHsKWeiWhospEiAZGHybK9chyFqSuCcy4cWB5JImhQBd8nnzy72SMbZsJ6e4
 Yv7A==
X-Gm-Message-State: AOAM533OOLf3ecujQmfhtAYsrDp533r/97RZ7HQiI83hQCk6Rua6plMV
 bSwqkHgVWHAftcguFBz6OV/GBA==
X-Google-Smtp-Source: ABdhPJzoaszx/FMxs1EP+dndZHd/3eQX6gVh8XKr9z6/arTSDiQU05AAnvgjIGjxpvs4zR3pPcZ5+Q==
X-Received: by 2002:adf:f888:: with SMTP id u8mr11364000wrp.18.1594117008361; 
 Tue, 07 Jul 2020 03:16:48 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id z8sm469409wmg.39.2020.07.07.03.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 03:16:47 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH 01/28] ASoC: atmel: atmel-pcm-dma: Demote function header
 which is clearly not kerneldoc
Date: Tue,  7 Jul 2020 11:16:15 +0100
Message-Id: <20200707101642.1747944-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707101642.1747944-1-lee.jones@linaro.org>
References: <20200707101642.1747944-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-kernel@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Sedji Gaouaou <sedji.gaouaou@atmel.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Bo Shen <voice.shen@atmel.com>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
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

No attempt has been made to document the demoted function here.

Fixes the following W=1 kernel build warning(s):

 sound/soc/atmel/atmel-pcm-dma.c:55: warning: Function parameter or member 'ssc_sr' not described in 'atmel_pcm_dma_irq'
 sound/soc/atmel/atmel-pcm-dma.c:55: warning: Function parameter or member 'substream' not described in 'atmel_pcm_dma_irq'

Cc: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: Bo Shen <voice.shen@atmel.com>
Cc: Sedji Gaouaou <sedji.gaouaou@atmel.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 sound/soc/atmel/atmel-pcm-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/atmel/atmel-pcm-dma.c b/sound/soc/atmel/atmel-pcm-dma.c
index cb03c4f7324c9..0a2e956232afe 100644
--- a/sound/soc/atmel/atmel-pcm-dma.c
+++ b/sound/soc/atmel/atmel-pcm-dma.c
@@ -44,7 +44,7 @@ static const struct snd_pcm_hardware atmel_pcm_dma_hardware = {
 	.buffer_bytes_max	= 512 * 1024,
 };
 
-/**
+/*
  * atmel_pcm_dma_irq: SSC interrupt handler for DMAENGINE enabled SSC
  *
  * We use DMAENGINE to send/receive data to/from SSC so this ISR is only to
-- 
2.25.1

