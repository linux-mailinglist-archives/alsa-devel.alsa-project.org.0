Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E45116B0E
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 11:31:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA0FF16D5;
	Mon,  9 Dec 2019 11:30:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA0FF16D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575887503;
	bh=iqkURh30BcZFV8B/ViV+ezvgUpI4i3jaL1efnRypu24=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a6uN/BW98fnaO6rLfpR6pnYzQM/wyYBxyKHScZf/grnO4R76soXD10xkkhx+VuB9l
	 Eqk2uw043DaY7jSYG/dDVHq1QO9cACNcvtXIgmMbJkB1g3QcOnpyyG+Q+hZoBpwsr1
	 l0BMJwcHrVNjucjSeKmtad0cK7xmQzAV5TLec/+Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41908F802FE;
	Mon,  9 Dec 2019 10:52:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13F9FF8036E; Mon,  9 Dec 2019 10:51:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20235F801F4
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 10:49:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20235F801F4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B4F8BB2D1
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 09:49:48 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Mon,  9 Dec 2019 10:49:18 +0100
Message-Id: <20191209094943.14984-47-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191209094943.14984-1-tiwai@suse.de>
References: <20191209094943.14984-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 5.6 46/71] ALSA: maestro3: Use managed buffer
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
 sound/pci/maestro3.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/pci/maestro3.c b/sound/pci/maestro3.c
index cc8594d76c70..f4076e2a6400 100644
--- a/sound/pci/maestro3.c
+++ b/sound/pci/maestro3.c
@@ -1381,10 +1381,7 @@ static int snd_m3_pcm_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *hw_params)
 {
 	struct m3_dma *s = substream->runtime->private_data;
-	int err;
 
-	if ((err = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params))) < 0)
-		return err;
 	/* set buffer address */
 	s->buffer_addr = substream->runtime->dma_addr;
 	if (s->buffer_addr & 0x3) {
@@ -1401,7 +1398,6 @@ static int snd_m3_pcm_hw_free(struct snd_pcm_substream *substream)
 	if (substream->runtime->private_data == NULL)
 		return 0;
 	s = substream->runtime->private_data;
-	snd_pcm_lib_free_pages(substream);
 	s->buffer_addr = 0;
 	return 0;
 }
@@ -1860,9 +1856,8 @@ snd_m3_pcm(struct snd_m3 * chip, int device)
 	strcpy(pcm->name, chip->card->driver);
 	chip->pcm = pcm;
 	
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      &chip->pci->dev,
-					      64*1024, 64*1024);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
+				       &chip->pci->dev, 64*1024, 64*1024);
 
 	return 0;
 }
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
