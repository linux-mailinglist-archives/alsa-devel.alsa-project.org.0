Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFF4116AA2
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 11:13:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 821A41661;
	Mon,  9 Dec 2019 11:13:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 821A41661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575886435;
	bh=yKgE09FMcGBltSxxUEz4O2IrubUK1OoRvs06nGUqlR4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aUwtR1sHTm+eJUQD6GnwfOID5QrcGnXKjlayGNRk7gw3hcdh0VUKkEihYh3LWDcwe
	 Lvuq6nx2SpMJEtN5bCWc8aNRrtpRmZMyiuEe4LmI/KjujCMEaum6nBP+Pk+OPGviEB
	 91eOG2Pfw0B9OqSaHCjWiiQ/tpM2A4oSqJTr1bPs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A6BFF803EA;
	Mon,  9 Dec 2019 10:51:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64206F8034A; Mon,  9 Dec 2019 10:50:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8E88F8027B
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 10:49:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8E88F8027B
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 05781B2C5
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 09:49:48 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Mon,  9 Dec 2019 10:49:04 +0100
Message-Id: <20191209094943.14984-33-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191209094943.14984-1-tiwai@suse.de>
References: <20191209094943.14984-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 5.6 32/71] ALSA: cs5535: Use managed buffer
	allocation
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

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/cs5535audio/cs5535audio_pcm.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/pci/cs5535audio/cs5535audio_pcm.c b/sound/pci/cs5535audio/cs5535audio_pcm.c
index 4642e5384e83..0b2a23c6d277 100644
--- a/sound/pci/cs5535audio/cs5535audio_pcm.c
+++ b/sound/pci/cs5535audio/cs5535audio_pcm.c
@@ -236,10 +236,6 @@ static int snd_cs5535audio_hw_params(struct snd_pcm_substream *substream,
 	struct cs5535audio_dma *dma = substream->runtime->private_data;
 	int err;
 
-	err = snd_pcm_lib_malloc_pages(substream,
-					params_buffer_bytes(hw_params));
-	if (err < 0)
-		return err;
 	dma->buf_addr = substream->runtime->dma_addr;
 	dma->buf_bytes = params_buffer_bytes(hw_params);
 
@@ -267,7 +263,7 @@ static int snd_cs5535audio_hw_free(struct snd_pcm_substream *substream)
 		dma->pcm_open_flag = 0;
 	}
 	cs5535audio_clear_dma_packets(cs5535au, dma, substream);
-	return snd_pcm_lib_free_pages(substream);
+	return 0;
 }
 
 static int snd_cs5535audio_playback_prepare(struct snd_pcm_substream *substream)
@@ -431,9 +427,9 @@ int snd_cs5535audio_pcm(struct cs5535audio *cs5535au)
 	pcm->info_flags = 0;
 	strcpy(pcm->name, "CS5535 Audio");
 
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      &cs5535au->pci->dev,
-					      64*1024, 128*1024);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
+				       &cs5535au->pci->dev,
+				       64*1024, 128*1024);
 	cs5535au->pcm = pcm;
 
 	return 0;
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
