Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6085C116B4E
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 11:43:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA4771704;
	Mon,  9 Dec 2019 11:42:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA4771704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575888217;
	bh=tMjieHEUN0foc7OdMNbteFX3xLn4oy4DV2NJM2yGIA8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V9OokyvjkixgoBhFDQhYyP31Tw9xRGDpXpoBq6rASUuGy7WpzDWPJD3BHNO0GXt6v
	 ZAV6qytGoQBlfNaY1EessZKVAwTVjHNyqhr4rGYINnNhAl8xPW8dtVX94cNz15Gi/F
	 OvJJ5wMguwfNXcmjkej/QHcZDcpgAgcinDd2e8Cs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D335F80675;
	Mon,  9 Dec 2019 10:52:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C9F7F802F7; Mon,  9 Dec 2019 10:51:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B360F80234
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 10:49:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B360F80234
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9EB91B2E4
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 09:49:49 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Mon,  9 Dec 2019 10:49:36 +0100
Message-Id: <20191209094943.14984-65-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191209094943.14984-1-tiwai@suse.de>
References: <20191209094943.14984-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 5.6 64/71] ALSA: 6fire: Use managed buffer
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
The hw_params and hw_free callbacks became superfluous and got
dropped.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/6fire/pcm.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/sound/usb/6fire/pcm.c b/sound/usb/6fire/pcm.c
index cdc5dd7fbe16..706aa3fac351 100644
--- a/sound/usb/6fire/pcm.c
+++ b/sound/usb/6fire/pcm.c
@@ -446,18 +446,6 @@ static int usb6fire_pcm_close(struct snd_pcm_substream *alsa_sub)
 	return 0;
 }
 
-static int usb6fire_pcm_hw_params(struct snd_pcm_substream *alsa_sub,
-		struct snd_pcm_hw_params *hw_params)
-{
-	return snd_pcm_lib_malloc_pages(alsa_sub,
-					params_buffer_bytes(hw_params));
-}
-
-static int usb6fire_pcm_hw_free(struct snd_pcm_substream *alsa_sub)
-{
-	return snd_pcm_lib_free_pages(alsa_sub);
-}
-
 static int usb6fire_pcm_prepare(struct snd_pcm_substream *alsa_sub)
 {
 	struct pcm_runtime *rt = snd_pcm_substream_chip(alsa_sub);
@@ -555,8 +543,6 @@ static const struct snd_pcm_ops pcm_ops = {
 	.open = usb6fire_pcm_open,
 	.close = usb6fire_pcm_close,
 	.ioctl = snd_pcm_lib_ioctl,
-	.hw_params = usb6fire_pcm_hw_params,
-	.hw_free = usb6fire_pcm_hw_free,
 	.prepare = usb6fire_pcm_prepare,
 	.trigger = usb6fire_pcm_trigger,
 	.pointer = usb6fire_pcm_pointer,
@@ -658,8 +644,7 @@ int usb6fire_pcm_init(struct sfire_chip *chip)
 	strcpy(pcm->name, "DMX 6Fire USB");
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &pcm_ops);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &pcm_ops);
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_VMALLOC,
-					      NULL, 0, 0);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_VMALLOC, NULL, 0, 0);
 
 	rt->instance = pcm;
 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
