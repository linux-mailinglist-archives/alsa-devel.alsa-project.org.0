Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2AE310CA8
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Feb 2021 15:47:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D98CE1657;
	Fri,  5 Feb 2021 15:46:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D98CE1657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612536464;
	bh=Exn6kpTeqxavHQkoeYIgFLcSRNui7o51lnVxtpJ2R3Q=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=d0Sv64Fv+05JHZ4DsXWKFqg7/1fXUQvmDSQnLBZr4o4PTbxpwvvOrRtGf9tryhrnD
	 2riQM3w9q/uxg0eAPhRMbjAuh1wloQtSu1r5mYbAlPYqCXjBizca7o9Hxazt8AZsoc
	 E436r8VGziAh9GA8ue6NbpgcPc1TOtOuvaA8Yh6A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D4ADF80139;
	Fri,  5 Feb 2021 15:46:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0E7AF8015A; Fri,  5 Feb 2021 15:46:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9411CF80139
 for <alsa-devel@alsa-project.org>; Fri,  5 Feb 2021 15:46:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9411CF80139
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 28ABEAEBD
 for <alsa-devel@alsa-project.org>; Fri,  5 Feb 2021 14:46:00 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Fix PCM buffer allocation in non-vmalloc mode
Date: Fri,  5 Feb 2021 15:45:59 +0100
Message-Id: <20210205144559.29555-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The commit f274baa49be6 ("ALSA: usb-audio: Allow non-vmalloc buffer
for PCM buffers") introduced the mode to allocate coherent pages for
PCM buffers, and it used bus->controller device as its DMA device.
It turned out, however, that bus->sysdev is a more appropriate device
to be used for DMA mapping in HCD code.

This patch corrects the device reference accordingly.

Note that, on most platforms, both point to the very same device,
hence this patch doesn't change anything practically.  But on
platforms like xhcd-plat hcd, the change becomes effective.

Fixes: f274baa49be6 ("ALSA: usb-audio: Allow non-vmalloc buffer for PCM buffers")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 078bb4c94033..dcadf8f164b2 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -1558,7 +1558,7 @@ void snd_usb_preallocate_buffer(struct snd_usb_substream *subs)
 {
 	struct snd_pcm *pcm = subs->stream->pcm;
 	struct snd_pcm_substream *s = pcm->streams[subs->direction].substream;
-	struct device *dev = subs->dev->bus->controller;
+	struct device *dev = subs->dev->bus->sysdev;
 
 	if (snd_usb_use_vmalloc)
 		snd_pcm_set_managed_buffer(s, SNDRV_DMA_TYPE_VMALLOC,
-- 
2.26.2

