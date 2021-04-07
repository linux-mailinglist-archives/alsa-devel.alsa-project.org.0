Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE15C356F97
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Apr 2021 17:01:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F1061616;
	Wed,  7 Apr 2021 17:00:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F1061616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617807660;
	bh=5ugmSE94N8Ele9/1HxOALx1D0geWTS1gL/lYzcWXWgU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OG2wszf9naZv59sGUye3x7JBsxsxssCGJscq7aHxlnjdeVcfvToQchiaWOyi9rFFM
	 rB0XNJ0MAqeP6BYoWR9twaR8daKgkzg54Z1pbBrrn2Uar4xOUeihpqTQKAX3C6RCW0
	 D6EC4ID8VEwOQNkaz0E0wn4hCmNMKxSjiEE7HsHk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE9E9F8016D;
	Wed,  7 Apr 2021 16:59:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D301F8016A; Wed,  7 Apr 2021 16:59:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E92A9F80162
 for <alsa-devel@alsa-project.org>; Wed,  7 Apr 2021 16:59:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E92A9F80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="zZoVhHro"
Received: by mail-ed1-x532.google.com with SMTP id m3so11433237edv.5
 for <alsa-devel@alsa-project.org>; Wed, 07 Apr 2021 07:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RhiVLxZ189Mfi2/3w2wk+mT3BSMHUmXI5aQWXNu5k2c=;
 b=zZoVhHro6L2LnmIIbWv4pad71Bvb0y4XyBmWu6P/hmrzntRYC0UoynxC+JhP2SKoXn
 UEzcesZpmt7p760jdD0RYi8NswCaIA3X+aKJW5tmY70iG49QyQW34o0HeYE/Iw7QuTxj
 a6GSlrLvuch1v7YuT1uXu0mApwSkZSjjeEO8Zf0820ze9vQ5dP1wqwTcGU5V0mtXEw8V
 cIziaxSKFvXB+k0Zi4h7WVHuTkIw23lFacZs7QDfM4n1zLia7x5pw+yD1CpWlDFQe3Hn
 QRkm2ORd+tRA4G1Zp3DrSUB7MkfwTPo2P+DOk7H3u9YsZZXwbIr0rIELnx3PdBGjYecq
 d5Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RhiVLxZ189Mfi2/3w2wk+mT3BSMHUmXI5aQWXNu5k2c=;
 b=DbVEDI/+fV1UfhgPr8nzUvVRncLlJhJqFfR5uf8RgqlYgoQsMa3ZldCHC/Q9ccl4wL
 GVpUVi0Et5RhHhlY7APPyNjeYZkLuOpTKv4YAktfF+TUa6VkTvaf8qdm40hn7MGIJP1R
 cUuG2XPqEyxPUztNe+3bjL8XWUCaHflnEj7+dSzgrYEYIkw+LoS06dGn3WC7oBhnFzdK
 yUJJ4UX0nNybN2xbEM22yiC/ENaUz97IaudNZC/D22w6MpwwdG+HvqTD5yyyyrTc+M1G
 duL8ZjbRBM22u0muk32UA7KKdt7xO13XpZaq2exskzSR+zOmssQJGW1qW+UvIvPTqYaB
 sKzw==
X-Gm-Message-State: AOAM531QgdoO274ZXjVgU6g9W/AxDiOHbv07RTLOWwobT/rPAn8gx+j8
 EYRDCaBfa580sC5oQ207ptVlgA==
X-Google-Smtp-Source: ABdhPJxzmktfBJNJzlo7KcK7eCSOqr9CD9XKZcsYIEH7+/H04DXrYXnpi/VBjAARwmgiCznZjmuALA==
X-Received: by 2002:a05:6402:1606:: with SMTP id
 f6mr4867670edv.216.1617807563889; 
 Wed, 07 Apr 2021 07:59:23 -0700 (PDT)
Received: from starbuck.lan (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.googlemail.com with ESMTPSA id
 pj18sm6144647ejb.101.2021.04.07.07.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 07:59:23 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: meson: axg-fifo: add NO_PERIOD_WAKEUP support
Date: Wed,  7 Apr 2021 16:59:14 +0200
Message-Id: <20210407145914.311479-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Cc: linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
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

On the AXG family, the fifo irq is not necessary for the HW to operate.
It is just used to notify that a period has elapsed. If userpace does not
care for these wakeups (such as pipewire), we are just wasting CPU cycles.

Add support for NO_PERIOD_WAKEUP and disable irq when they are no needed.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-fifo.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index b2e867113226..b9af2d513e09 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -27,8 +27,8 @@ static struct snd_pcm_hardware axg_fifo_hw = {
 		 SNDRV_PCM_INFO_MMAP |
 		 SNDRV_PCM_INFO_MMAP_VALID |
 		 SNDRV_PCM_INFO_BLOCK_TRANSFER |
-		 SNDRV_PCM_INFO_PAUSE),
-
+		 SNDRV_PCM_INFO_PAUSE |
+		 SNDRV_PCM_INFO_NO_PERIOD_WAKEUP),
 	.formats = AXG_FIFO_FORMATS,
 	.rate_min = 5512,
 	.rate_max = 192000,
@@ -113,7 +113,7 @@ int axg_fifo_pcm_hw_params(struct snd_soc_component *component,
 {
 	struct snd_pcm_runtime *runtime = ss->runtime;
 	struct axg_fifo *fifo = axg_fifo_data(ss);
-	unsigned int burst_num, period, threshold;
+	unsigned int burst_num, period, threshold, irq_en;
 	dma_addr_t end_ptr;
 
 	period = params_period_bytes(params);
@@ -142,10 +142,11 @@ int axg_fifo_pcm_hw_params(struct snd_soc_component *component,
 	regmap_field_write(fifo->field_threshold,
 			   threshold ? threshold - 1 : 0);
 
-	/* Enable block count irq */
+	/* Enable irq if necessary  */
+	irq_en = runtime->no_period_wakeup ? 0 : FIFO_INT_COUNT_REPEAT;
 	regmap_update_bits(fifo->map, FIFO_CTRL0,
 			   CTRL0_INT_EN(FIFO_INT_COUNT_REPEAT),
-			   CTRL0_INT_EN(FIFO_INT_COUNT_REPEAT));
+			   CTRL0_INT_EN(irq_en));
 
 	return 0;
 }
-- 
2.30.2

