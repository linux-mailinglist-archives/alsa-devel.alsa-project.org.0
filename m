Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4B7118A9D
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 15:17:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFCD21677;
	Tue, 10 Dec 2019 15:16:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFCD21677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575987450;
	bh=jWlI6VOVp3ym5frBeKSiXSa8EgIeZ0s90qZIGupsGwY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cGBq2mWSIZvbEFXKbXNQMznIo3VjTTvu7/6EsqgHlAzcvqpd/Z9UKriDNPL1fQAqj
	 HYCulZ36aOClijVk6wshtEvFNUXhx3O2XpXbl/QUHnc171tfksNGLl0RQasbhu7ZVU
	 ERts8VBCS2R8PUEWKh2LDAJFau4bG84yzejIb8sQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5384F80259;
	Tue, 10 Dec 2019 15:14:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1464F80217; Tue, 10 Dec 2019 15:14:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 329F8F8011E
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 15:14:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 329F8F8011E
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 007DBAF3B;
 Tue, 10 Dec 2019 14:14:04 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 10 Dec 2019 15:13:54 +0100
Message-Id: <20191210141356.18074-3-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210141356.18074-1-tiwai@suse.de>
References: <20191210141356.18074-1-tiwai@suse.de>
Cc: devel@driverdev.osuosl.org, alsa-devel@alsa-project.org,
 Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, linux-kernel@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: [alsa-devel] [PATCH for-5.6 2/4] staging: bcm2835-audio: Use
	managed buffer allocation
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
The hw_params and hw_free callbacks became superfluous and dropped.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 .../staging/vc04_services/bcm2835-audio/bcm2835-pcm.c   | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-pcm.c b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-pcm.c
index 826016c3431a..97726b190bc5 100644
--- a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-pcm.c
+++ b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-pcm.c
@@ -193,17 +193,6 @@ static int snd_bcm2835_playback_close(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int snd_bcm2835_pcm_hw_params(struct snd_pcm_substream *substream,
-	struct snd_pcm_hw_params *params)
-{
-	return snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(params));
-}
-
-static int snd_bcm2835_pcm_hw_free(struct snd_pcm_substream *substream)
-{
-	return snd_pcm_lib_free_pages(substream);
-}
-
 static int snd_bcm2835_pcm_prepare(struct snd_pcm_substream *substream)
 {
 	struct bcm2835_chip *chip = snd_pcm_substream_chip(substream);
@@ -317,8 +306,6 @@ static const struct snd_pcm_ops snd_bcm2835_playback_ops = {
 	.open = snd_bcm2835_playback_open,
 	.close = snd_bcm2835_playback_close,
 	.ioctl = snd_pcm_lib_ioctl,
-	.hw_params = snd_bcm2835_pcm_hw_params,
-	.hw_free = snd_bcm2835_pcm_hw_free,
 	.prepare = snd_bcm2835_pcm_prepare,
 	.trigger = snd_bcm2835_pcm_trigger,
 	.pointer = snd_bcm2835_pcm_pointer,
@@ -329,8 +316,6 @@ static const struct snd_pcm_ops snd_bcm2835_playback_spdif_ops = {
 	.open = snd_bcm2835_playback_spdif_open,
 	.close = snd_bcm2835_playback_close,
 	.ioctl = snd_pcm_lib_ioctl,
-	.hw_params = snd_bcm2835_pcm_hw_params,
-	.hw_free = snd_bcm2835_pcm_hw_free,
 	.prepare = snd_bcm2835_pcm_prepare,
 	.trigger = snd_bcm2835_pcm_trigger,
 	.pointer = snd_bcm2835_pcm_pointer,
@@ -362,7 +347,7 @@ int snd_bcm2835_new_pcm(struct bcm2835_chip *chip, const char *name,
 			spdif ? &snd_bcm2835_playback_spdif_ops :
 			&snd_bcm2835_playback_ops);
 
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
 		chip->card->dev, 128 * 1024, 128 * 1024);
 
 	if (spdif)
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
