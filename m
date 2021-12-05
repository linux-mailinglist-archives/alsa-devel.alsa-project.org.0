Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D612468C90
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Dec 2021 19:10:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEB051FF4;
	Sun,  5 Dec 2021 19:09:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEB051FF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638727843;
	bh=/pvWvPTkzs/dErFbAqs5VQhUGVYD8OJ+3HNpaQKgznk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dHc7qzK325Sg0gw3PddH9h+vMgjbEAv0Q8JvdMcTYvLJqnMtcR+PvZmWk3OVCUPOC
	 YcBkzBdnwvdxoJfX5rmhUo7J5wanHts0pPLR9wuPEXuy9InxJP/wkgal1FSO86ntMw
	 wsEE2Q1/P4+VYMsfT1ShNOhRUHKntrN/Kcfr5ecQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55D4AF804E3;
	Sun,  5 Dec 2021 19:08:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4AEC0F8032B; Sun,  5 Dec 2021 19:08:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5763F800D3
 for <alsa-devel@alsa-project.org>; Sun,  5 Dec 2021 19:08:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5763F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.b="nFjzSkNR"
Received: by mail-wr1-x42b.google.com with SMTP id j3so17671736wrp.1
 for <alsa-devel@alsa-project.org>; Sun, 05 Dec 2021 10:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wVbLQURO0Z9+ByAGWQaOmsfWDUK6bDVmhiIqKeEs0aE=;
 b=nFjzSkNR7Vt7NUjEHxsBt63+Y69rJq5h500HrTtMLIMNfhUgk7TR5niNnrdiFWf8WA
 +RQK/ThnUEuTN2rv5dzQc2IoCzA8BqP000JH4mLP9eotfQVdXcxKlBIx8rWDaFKgO6Fy
 pNwlAoPpzxF7X5rZcbuj2QuczHPULs64hnvYZf3i4xztjezQ5aRUfoDJ46KcglU4q+na
 NKx/oO6l3U0+oIlMDHDWpQnu+xzCeGds/oIXYweABOqsA4yX/mLk89PXAfZ5jAx7K8YY
 osT8Ld3oyXf1Zb4T3eqg8I8SQjsD7OOwSpfw1ICNlpOVu/RwdoX/pt/pGOK/rl4MAfMe
 yHlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wVbLQURO0Z9+ByAGWQaOmsfWDUK6bDVmhiIqKeEs0aE=;
 b=4CADgHXpXPpLU8dpEWal4M/cBZgod3G1gzKBf8c4zRwh3m+ci4/E5T2/l+BxVxCXdd
 2NsA69PrCAwtxQm3X/MapClmilOLuMTDlqhcsbzwJiUgztn4CCOEsX057d4WDlRkQmX6
 oTc5xFqszYQzHQdaEnmawnhMig6P/7IWumiD60way13YHH7ZtZfX+p74URzyXH7Oh8S/
 2Zh4AuVLuTacfD02K64J0PZo75DKr5QsBhtrhYw34IM/RlLZ4CxrR1Kkr5s1YRsn+KMj
 ZGz95j8M1vtgL1wRy4mFC+/3GgwQXXfDT7IkRgxgO69sAsweP1AMwgkLirmW+AnJoast
 +eqg==
X-Gm-Message-State: AOAM531GBHtpoqVgOTZNGMwqaujwlY7byzHrqikZ18Yec8TM5XfncSNi
 t6CxOw70xmCajSDyveHwC28=
X-Google-Smtp-Source: ABdhPJxrxANxSMd67C/dfrBs5aJyYKwDtHT0izw5kgpG/58jALhXD31larUKefLy5N5zKN1ZkX4fbw==
X-Received: by 2002:adf:fb82:: with SMTP id a2mr36968627wrr.168.1638727706827; 
 Sun, 05 Dec 2021 10:08:26 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-2a01-0c23-c11b-a200-f22f-74ff-fe21-0725.c23.pool.telefonica.de.
 [2a01:c23:c11b:a200:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id x13sm9250551wrr.47.2021.12.05.10.08.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Dec 2021 10:08:26 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: jbrunet@baylibre.com, linux-amlogic@lists.infradead.org,
 alsa-devel@alsa-project.org
Subject: [PATCH RFC v1 1/2] ASoC: meson: aiu: fifo: Add missing
 dma_coerce_mask_and_coherent()
Date: Sun,  5 Dec 2021 19:08:15 +0100
Message-Id: <20211205180816.2083864-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211205180816.2083864-1-martin.blumenstingl@googlemail.com>
References: <20211205180816.2083864-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

