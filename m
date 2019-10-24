Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74533E3B2E
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Oct 2019 20:42:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3644170F;
	Thu, 24 Oct 2019 20:41:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3644170F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571942553;
	bh=sdVPfaRjot9NuA8ZRyDdUAvhW6uQyc5r//qBWk3wj7s=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jxYs/B2k5SR+mGuV4e8L60+rFxw6goCARqw9D5Cpzkq8GibIhWVXo5Ss5OXJjCZXe
	 qHRLu7PZtRQZhro9eJU9hMXyiGfGXomHkXp94eULrvUJ3b76iY4oKEdkjvuDXlYJL1
	 ori8tSl96aXv4Xb9wTb+e2jPfGgTR2kl73VOOBHs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDD77F80274;
	Thu, 24 Oct 2019 20:40:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E5A2F8036B; Thu, 24 Oct 2019 20:40:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F5B9F80274
 for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2019 20:40:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F5B9F80274
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="JSoipD/H"
Received: by mail-pf1-x444.google.com with SMTP id c184so6156141pfb.0
 for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2019 11:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1RWpqHrDTsT6EWH1GIgHZ1+MufJ7Pq+vQ+OjVS++Lg4=;
 b=JSoipD/HNn3xJEwyLi6So/2AkS5E+xBXK5sqwarf56uTTuld4XhvwnAK/yv4DMQYIJ
 +YAcxymLv4ysH2veEUCRcDHahL7KbggA3LhAnpHLKjD5GSzLCWv5eBN3fKwTWaZOfQmD
 yeyk5ayomB3qN2i5WrCDrj1BlTKwlRnanOEgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1RWpqHrDTsT6EWH1GIgHZ1+MufJ7Pq+vQ+OjVS++Lg4=;
 b=prfWLnKdLxpgIAsUGREw8b0ejV2Jd0xhQJ1xWefFciFDu7ua+Ww95QrWoK/JeJyKV0
 yBkFkPFFtDSLC3Ei7H2fumUepSPJBuOX0A8Th1/BL+0cEW4GsCNZk65uAcsvKvPynAi7
 flN47xzqiYfE0/GRo96djlw3yg1XWBHnD0QdIKxX3MtCeRV0YjlSReLLVmK9yY6CueKz
 9W6QXH5dETGRLW6Jj4b6rhLfVwheqMEWUoHahhQKlPKn05Gn2QCFHcRqUClDSZ44Jqly
 bw1mTAVdmE1LhO//NKNzV9/bBw7B8XNQjJPVhsiRUEMxrrqsu42SUUz1+CagDpKWdsY6
 Er/A==
X-Gm-Message-State: APjAAAVjsfPeOSz7ZClrjZtWk93ilgWh1qgJbOAizQ7f9Vuho35BcY21
 Oh0yHpGO1gkdq5vTb+yC5amWxrQr8NqM
X-Google-Smtp-Source: APXvYqxvR380sk6XBNzBjH/qc0uYf1NDtsQCbN45x++MVZWUW5f+ZMoIbVLWNYqWRSJH097LKDxfJw==
X-Received: by 2002:a62:2783:: with SMTP id
 n125mr19205564pfn.167.1571942440547; 
 Thu, 24 Oct 2019 11:40:40 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id r185sm29534162pfr.68.2019.10.24.11.40.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Oct 2019 11:40:39 -0700 (PDT)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Thu, 24 Oct 2019 11:40:26 -0700
Message-Id: <20191024184026.183913-1-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.24.0.rc0.303.g954a862665-goog
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, kbuild test robot <lkp@intel.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <bardliao@realtek.com>,
 Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] [PATCH] ASoC: rt5677-spi: fix sparse warnings
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Fix bugs reported by kbuild test robot

Fixes: a0e0d135427c ("ASoC: rt5677: Add a PCM device for streaming hotword via SPI")
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
---
 sound/soc/codecs/rt5677-spi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5677-spi.c b/sound/soc/codecs/rt5677-spi.c
index 36c02d200cfc..958871b342ea 100644
--- a/sound/soc/codecs/rt5677-spi.c
+++ b/sound/soc/codecs/rt5677-spi.c
@@ -145,7 +145,7 @@ static int rt5677_spi_hw_free(
 			snd_soc_component_get_drvdata(component);
 
 	mutex_lock(&rt5677_dsp->dma_lock);
-	rt5677_dsp->substream = 0;
+	rt5677_dsp->substream = NULL;
 	mutex_unlock(&rt5677_dsp->dma_lock);
 
 	return snd_pcm_lib_free_vmalloc_buffer(substream);
@@ -362,7 +362,7 @@ static void rt5677_spi_copy_work(struct work_struct *work)
 	mutex_unlock(&rt5677_dsp->dma_lock);
 }
 
-struct page *rt5677_spi_pcm_page(
+static struct page *rt5677_spi_pcm_page(
 		struct snd_soc_component *component,
 		struct snd_pcm_substream *substream,
 		unsigned long offset)
-- 
2.24.0.rc0.303.g954a862665-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
