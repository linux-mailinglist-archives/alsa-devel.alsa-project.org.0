Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 955E5118B5B
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 15:43:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A6EF169D;
	Tue, 10 Dec 2019 15:42:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A6EF169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575989017;
	bh=yDpNE0oKsOa0aa4S/L7x5JBOUY5wLaqZ+7EpRBhzFMU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vHM9olgl/zT9DF2MH1MaJI9UbhzWF7xw3Oe+v6hjz011U04bBudqqjHyAwrs9oVU7
	 ot2f1TdqKaNseAfQI4bkMt25lpS6L2pN4jbru7Rue0y6KPDV+PeKtMJNDOwEMtcg2G
	 WXry9kdX5fJJs5tpt4kgJLtcrTVMBhxJxqyp4ygM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3222F80368;
	Tue, 10 Dec 2019 15:27:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92D47F80265; Tue, 10 Dec 2019 15:27:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0171DF80268
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 15:26:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0171DF80268
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 94427B20F;
 Tue, 10 Dec 2019 14:26:26 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Date: Tue, 10 Dec 2019 15:26:08 +0100
Message-Id: <20191210142614.19405-18-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210142614.19405-1-tiwai@suse.de>
References: <20191210142614.19405-1-tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Benson Leung <bleung@chromium.org>, Cheng-Yi Chiang <cychiang@chromium.org>
Subject: [alsa-devel] [PATCH for-5.6 17/23] ASoC: cros_ec_codec: Use managed
	buffer allocation
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Clean up the driver with the new managed buffer allocation API.
The superfluous snd_pcm_lib_malloc_pages() and
snd_pcm_lib_free_pages() calls are dropped.

Cc: Cheng-Yi Chiang <cychiang@chromium.org>
Cc: Benson Leung <bleung@chromium.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/cros_ec_codec.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
index 7b17f39a6a10..c81bbef2367a 100644
--- a/sound/soc/codecs/cros_ec_codec.c
+++ b/sound/soc/codecs/cros_ec_codec.c
@@ -918,7 +918,7 @@ static int wov_pcm_hw_params(struct snd_soc_component *component,
 	priv->wov_burst_read = true;
 	mutex_unlock(&priv->wov_dma_lock);
 
-	return snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
+	return 0;
 }
 
 static int wov_pcm_hw_free(struct snd_soc_component *component,
@@ -934,7 +934,7 @@ static int wov_pcm_hw_free(struct snd_soc_component *component,
 
 	cancel_delayed_work_sync(&priv->wov_copy_work);
 
-	return snd_pcm_lib_free_pages(substream);
+	return 0;
 }
 
 static snd_pcm_uframes_t wov_pcm_pointer(struct snd_soc_component *component,
@@ -950,8 +950,8 @@ static snd_pcm_uframes_t wov_pcm_pointer(struct snd_soc_component *component,
 static int wov_pcm_new(struct snd_soc_component *component,
 		       struct snd_soc_pcm_runtime *rtd)
 {
-	snd_pcm_lib_preallocate_pages_for_all(rtd->pcm, SNDRV_DMA_TYPE_VMALLOC,
-					      NULL, 0, 0);
+	snd_pcm_set_managed_buffer_all(rtd->pcm, SNDRV_DMA_TYPE_VMALLOC,
+				       NULL, 0, 0);
 	return 0;
 }
 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
