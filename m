Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44510116A33
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 10:53:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 932141668;
	Mon,  9 Dec 2019 10:52:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 932141668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575885191;
	bh=efEHH1TyVhB1SchTShoxbJo1BvUfNZE5rj6ZIpLeMA0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nXso2dUuM9etDPB5hQtUx7ZX8ktnxtsojpGob2pxU4hQMLww0TY+Grt1qWH6LkYKT
	 Aq7+Eyvtd4BxmRClzzlzvDmI6zR3WxfkG5HdMTs2D4eA9+22SweL0B1Mf5PuKxYKug
	 CsjZW/g2JaFkwjP9b6ScfIMn3x5bDQ3U9BstO/1I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2B32F80254;
	Mon,  9 Dec 2019 10:50:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54F13F802E2; Mon,  9 Dec 2019 10:49:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5BE1BF80234
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 10:49:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BE1BF80234
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 53B10B287
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 09:49:46 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Mon,  9 Dec 2019 10:48:33 +0100
Message-Id: <20191209094943.14984-2-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191209094943.14984-1-tiwai@suse.de>
References: <20191209094943.14984-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 5.6 01/71] ALSA: aoa: Use managed buffer
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
The hw_params callbacks became superfluous and got dropped.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/aoa/soundbus/i2sbus/pcm.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/sound/aoa/soundbus/i2sbus/pcm.c b/sound/aoa/soundbus/i2sbus/pcm.c
index a94e4023fadf..44397e72c868 100644
--- a/sound/aoa/soundbus/i2sbus/pcm.c
+++ b/sound/aoa/soundbus/i2sbus/pcm.c
@@ -294,12 +294,6 @@ void i2sbus_wait_for_stop_both(struct i2sbus_dev *i2sdev)
 }
 #endif
 
-static int i2sbus_hw_params(struct snd_pcm_substream *substream,
-			    struct snd_pcm_hw_params *params)
-{
-	return snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(params));
-}
-
 static inline int i2sbus_hw_free(struct snd_pcm_substream *substream, int in)
 {
 	struct i2sbus_dev *i2sdev = snd_pcm_substream_chip(substream);
@@ -308,7 +302,6 @@ static inline int i2sbus_hw_free(struct snd_pcm_substream *substream, int in)
 	get_pcm_info(i2sdev, in, &pi, NULL);
 	if (pi->dbdma_ring.stopping)
 		i2sbus_wait_for_stop(i2sdev, pi);
-	snd_pcm_lib_free_pages(substream);
 	return 0;
 }
 
@@ -781,7 +774,6 @@ static const struct snd_pcm_ops i2sbus_playback_ops = {
 	.open =		i2sbus_playback_open,
 	.close =	i2sbus_playback_close,
 	.ioctl =	snd_pcm_lib_ioctl,
-	.hw_params =	i2sbus_hw_params,
 	.hw_free =	i2sbus_playback_hw_free,
 	.prepare =	i2sbus_playback_prepare,
 	.trigger =	i2sbus_playback_trigger,
@@ -851,7 +843,6 @@ static const struct snd_pcm_ops i2sbus_record_ops = {
 	.open =		i2sbus_record_open,
 	.close =	i2sbus_record_close,
 	.ioctl =	snd_pcm_lib_ioctl,
-	.hw_params =	i2sbus_hw_params,
 	.hw_free =	i2sbus_record_hw_free,
 	.prepare =	i2sbus_record_prepare,
 	.trigger =	i2sbus_record_trigger,
@@ -1026,7 +1017,7 @@ i2sbus_attach_codec(struct soundbus_dev *dev, struct snd_card *card,
 	dev->pcm->private_free = i2sbus_private_free;
 
 	/* well, we really should support scatter/gather DMA */
-	snd_pcm_lib_preallocate_pages_for_all(
+	snd_pcm_set_managed_buffer_all(
 		dev->pcm, SNDRV_DMA_TYPE_DEV,
 		&macio_get_pci_dev(i2sdev->macio)->dev,
 		64 * 1024, 64 * 1024);
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
