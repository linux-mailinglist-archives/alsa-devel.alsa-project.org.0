Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9D9216F0B
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 16:42:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE99D950;
	Tue,  7 Jul 2020 16:41:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE99D950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594132926;
	bh=i3n9B9s2VeEmrvXJUCV0BnBc6eGEF0gB3iLz2vZE2M4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XXuF0FS7138nvpyZM03cfclUCDrXIMOohEUJdBqrXycu4gdaffb/klvJvDP7SUvh8
	 uLUsXSRB65fqCzUIOji8xON+JGP8vXYUPZsa8CPbCUzltYo2N8At7n8czeGtNdAgOT
	 6SHO5Ne7in2/p2a2xbunPzqwDW+w7cRLly2hkO30=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91337F802EA;
	Tue,  7 Jul 2020 16:38:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C584F801F9; Tue,  7 Jul 2020 16:38:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91093F80257
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 16:37:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91093F80257
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="gOyURcK3"
Received: by mail-wr1-x442.google.com with SMTP id s10so45356512wrw.12
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 07:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X8lNwwZEdxo/c3swk/aA3YOExp2MKHA0sqq87q0a3wI=;
 b=gOyURcK3r2DwvFpoXBFwf+VxrVGMJBFa5tiVKiVlD1Sv9lgSJWBeMg+Yax8Pr+ammt
 CbKHd9ahg6vBz7VNf2xbE9ZssjsBljDR3DjEbulgbGUDZrFoHU9h4D9wbsTb4jBnfoNR
 BTPi5POXO3enLgGBzWsE3oHOowzkBN9RZtp+Bbt+eKAwJq02R36MsWF0EP+2c1AaczEv
 bE2WQFjK+3Znea5sLS/gQOIFmLDDGJ8AQQvQk3IBTU2FB6NmZuPTDyO4CDvlS2YFnvQl
 P7R0E5P4x/uOsmhlSg0iofJtsjdLb+XJrIiMBSKnhqm17vb9OXyIP+HyGFWYJmTcejJF
 ecog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X8lNwwZEdxo/c3swk/aA3YOExp2MKHA0sqq87q0a3wI=;
 b=eOZomww75Q3JsoqO3IRqxHStJk4pA+cCDmnu965/yLr0b6MjXiVH2WrkANg2xpjFmX
 ro13ucqVMGHNtrH2mpCiNOyYPTI7nkOPXeQRs6wOS4aJqjhcAOgyRqZV3QKkWQhysesz
 NurQJgJ3XubsT65g3dICiZfHBq7TKDExT8zwuYLRdmJzKZuA9uy55k8wvUoBF74G5c+c
 QMOOZYOi0bDzA5ZXH/fYuysKTaUJpdv0l2E07g1pLuUXvRqD/uK5rNg110YWZvdurg3l
 L5hBIXfGWhIZk5+Gut4H/JLYmkPcW0rijJtRGp0erxIsAk1ETXsiOM2NuuT7drp5kJ9A
 jb6g==
X-Gm-Message-State: AOAM530i/KvMm2GUgaLcz4wIaXx8YkjIAEzicU9uEFyHyxD9C+JyZi33
 abe9cTxoCqRx7WjiuXIGRJOHIQ==
X-Google-Smtp-Source: ABdhPJw5AegAISkmzpd19TGSo7pM2dobgJDA/WJik6mZA0LLKNll4VvB7zgDEdydTeGdMWD3L+9EsQ==
X-Received: by 2002:a5d:40c9:: with SMTP id b9mr52265378wrq.425.1594132667350; 
 Tue, 07 Jul 2020 07:37:47 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id y16sm1276131wro.71.2020.07.07.07.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 07:37:46 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH v2 01/28] ASoC: atmel: atmel-pcm-dma: Demote function header
 which is clearly not kerneldoc
Date: Tue,  7 Jul 2020 15:37:15 +0100
Message-Id: <20200707143742.2959960-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707143742.2959960-1-lee.jones@linaro.org>
References: <20200707143742.2959960-1-lee.jones@linaro.org>
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

