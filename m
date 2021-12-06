Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 379EC46A92B
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Dec 2021 22:10:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A130A226B;
	Mon,  6 Dec 2021 22:09:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A130A226B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638825016;
	bh=/pvWvPTkzs/dErFbAqs5VQhUGVYD8OJ+3HNpaQKgznk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XU6yPU5gB6sz3YLeeL/pjaI93rmEoZcF4f7K68CT39YFH1nGMgel0y/OimiYeRxKE
	 5Z0jKR0ut6YyDN1Lo96yBTWDY3fNnJQHV+YIbR4DKKpi4nx4XfIw+1qDQWLaE7YdYd
	 KwkrJDIN9THfxqyxv3qEdyXGhWUFmkR/9u33UqI0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6449BF804F3;
	Mon,  6 Dec 2021 22:08:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0EF6BF804FA; Mon,  6 Dec 2021 22:08:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5246F804AE
 for <alsa-devel@alsa-project.org>; Mon,  6 Dec 2021 22:08:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5246F804AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.b="JJI/H5a6"
Received: by mail-wr1-x42f.google.com with SMTP id u17so17749223wrt.3
 for <alsa-devel@alsa-project.org>; Mon, 06 Dec 2021 13:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wVbLQURO0Z9+ByAGWQaOmsfWDUK6bDVmhiIqKeEs0aE=;
 b=JJI/H5a668Mbw7an8DN7K5GFo+wMZtRO8iMv7j/qlsQGYFUIRN6UN8UO4pRQj4kE4Q
 3E+w1ZmIpJu3OuLUHoI9LMIe8ZBkG26ekEFAwXwIv2KDBvqWUqcgTuKHLPykX3Ai3Jm/
 e/lrTmT3Y4YmHzwAg4UvD7yr+Zw7wBUhk2EHakWmhWg36/pTFpm0yypEDi/g4CEjIiaZ
 0CdFL2GDfoNavQdQNPbIw64cGgxlrrYI0bIc03PrjA048vcvDH8SY1jLtta3PEblBI2j
 XvAdE7zk/vz8Ryvo7GHx+FCqS5wosrdXIsgXuIBBh5MaU09HaDgeLkAFqHFgrwn2i4Zb
 0aFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wVbLQURO0Z9+ByAGWQaOmsfWDUK6bDVmhiIqKeEs0aE=;
 b=Y8OiwhNfml1rvl98nyXJXv3grFQeWkQPtAoJT4gD9Oi5xSD2ljZ5az2nT8nc6h2/An
 E4JEzdWShJnb0mOuLZhBMMfqVvDddoXa0PP+rCcI854HweOH0f0JuOGrJ/jEko7nefhk
 kq8IWNQozLdfG+Bm+FYjxOsMCmB0EB5p6gz4iRwDLJZNI+toQVdcLGMa1J4ppV5B8iRU
 onHMFav6Op3x+2UshSl9JR9u8BFA9iclWNqTi0n+zS42EpR0F77EMRZNc3TcXcEuvE5b
 0jKQ+ILUdG8kSNNo4uFomVQzzr7JH8ptlO98Yrxq1+U+XYCgTLxcpZCbKTyvYDuJXvXo
 N7iQ==
X-Gm-Message-State: AOAM530fXcHu40F069bBN68KXjPllgJ0FnWWY88nBEqBUDND4vYQeOpO
 wMjKS4YmHzL74pFXoHxTWew=
X-Google-Smtp-Source: ABdhPJzEwhqm3P3YmM/t7Y0RuKivCcAhGdMYzJbPK7Wpsp6pnDkQCJuVYBBJQWzsPjGC43hmFI+h+Q==
X-Received: by 2002:adf:cd09:: with SMTP id w9mr44802888wrm.619.1638824902076; 
 Mon, 06 Dec 2021 13:08:22 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-2a01-0c23-c0cf-f800-f22f-74ff-fe21-0725.c23.pool.telefonica.de.
 [2a01:c23:c0cf:f800:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id p13sm511195wmi.0.2021.12.06.13.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 13:08:20 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	alsa-devel@alsa-project.org
Subject: [PATCH v2 1/2] ASoC: meson: aiu: fifo: Add missing
 dma_coerce_mask_and_coherent()
Date: Mon,  6 Dec 2021 22:08:03 +0100
Message-Id: <20211206210804.2512999-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211206210804.2512999-1-martin.blumenstingl@googlemail.com>
References: <20211206210804.2512999-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, broonie@kernel.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
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

The FIFO registers which take an DMA-able address are only 32-bit wide
on AIU. Add dma_coerce_mask_and_coherent() to make the DMA core aware of
this limitation.

Fixes: 6ae9ca9ce986bf ("ASoC: meson: aiu: add i2s and spdif support")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 sound/soc/meson/aiu-fifo.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/meson/aiu-fifo.c b/sound/soc/meson/aiu-fifo.c
index 4ad23267cace..d67ff4cdabd5 100644
--- a/sound/soc/meson/aiu-fifo.c
+++ b/sound/soc/meson/aiu-fifo.c
@@ -5,6 +5,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/clk.h>
+#include <linux/dma-mapping.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/soc-dai.h>
@@ -179,6 +180,11 @@ int aiu_fifo_pcm_new(struct snd_soc_pcm_runtime *rtd,
 	struct snd_card *card = rtd->card->snd_card;
 	struct aiu_fifo *fifo = dai->playback_dma_data;
 	size_t size = fifo->pcm->buffer_bytes_max;
+	int ret;
+
+	ret = dma_coerce_mask_and_coherent(card->dev, DMA_BIT_MASK(32));
+	if (ret)
+		return ret;
 
 	snd_pcm_set_managed_buffer_all(rtd->pcm, SNDRV_DMA_TYPE_DEV,
 				       card->dev, size, size);
-- 
2.34.1

