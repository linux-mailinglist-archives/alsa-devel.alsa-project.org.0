Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1283C116B57
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 11:46:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A5BB1703;
	Mon,  9 Dec 2019 11:45:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A5BB1703
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575888371;
	bh=6dqJeO5hZ8qQxgfdFsyOyXaLgvSvdPt2EORxigyr5CE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H0UbxVbnFQedZHyAvfLpFXSXIrfvlA30K9Ngx2cd8CiB12Hfe+TYrCy5c7MTIzHts
	 bNMjZqIJi9DeOPHVb65IttKO7siaAxiiBHA5FEIA62/7EJvywycHTw2pcDzf0JR78g
	 1nVhEv65TqumAIEG6f1k90sNS4VTbAUtgKCoXUE4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C735FF806ED;
	Mon,  9 Dec 2019 10:52:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77DC5F803C9; Mon,  9 Dec 2019 10:51:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95074F802E3
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 10:49:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95074F802E3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CA96FB29F
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 09:49:49 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Mon,  9 Dec 2019 10:49:40 +0100
Message-Id: <20191209094943.14984-69-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191209094943.14984-1-tiwai@suse.de>
References: <20191209094943.14984-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 5.6 68/71] ALSA: ua101: Use managed buffer
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
The hw_free callback became superfluous and got dropped.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/misc/ua101.c | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/sound/usb/misc/ua101.c b/sound/usb/misc/ua101.c
index 566a4a31528a..a7b68447f3ad 100644
--- a/sound/usb/misc/ua101.c
+++ b/sound/usb/misc/ua101.c
@@ -730,11 +730,7 @@ static int capture_pcm_hw_params(struct snd_pcm_substream *substream,
 	mutex_lock(&ua->mutex);
 	err = start_usb_capture(ua);
 	mutex_unlock(&ua->mutex);
-	if (err < 0)
-		return err;
-
-	return snd_pcm_lib_malloc_pages(substream,
-					params_buffer_bytes(hw_params));
+	return err;
 }
 
 static int playback_pcm_hw_params(struct snd_pcm_substream *substream,
@@ -748,16 +744,7 @@ static int playback_pcm_hw_params(struct snd_pcm_substream *substream,
 	if (err >= 0)
 		err = start_usb_playback(ua);
 	mutex_unlock(&ua->mutex);
-	if (err < 0)
-		return err;
-
-	return snd_pcm_lib_malloc_pages(substream,
-					params_buffer_bytes(hw_params));
-}
-
-static int ua101_pcm_hw_free(struct snd_pcm_substream *substream)
-{
-	return snd_pcm_lib_free_pages(substream);
+	return err;
 }
 
 static int capture_pcm_prepare(struct snd_pcm_substream *substream)
@@ -885,7 +872,6 @@ static const struct snd_pcm_ops capture_pcm_ops = {
 	.close = capture_pcm_close,
 	.ioctl = snd_pcm_lib_ioctl,
 	.hw_params = capture_pcm_hw_params,
-	.hw_free = ua101_pcm_hw_free,
 	.prepare = capture_pcm_prepare,
 	.trigger = capture_pcm_trigger,
 	.pointer = capture_pcm_pointer,
@@ -896,7 +882,6 @@ static const struct snd_pcm_ops playback_pcm_ops = {
 	.close = playback_pcm_close,
 	.ioctl = snd_pcm_lib_ioctl,
 	.hw_params = playback_pcm_hw_params,
-	.hw_free = ua101_pcm_hw_free,
 	.prepare = playback_pcm_prepare,
 	.trigger = playback_pcm_trigger,
 	.pointer = playback_pcm_pointer,
@@ -1294,8 +1279,8 @@ static int ua101_probe(struct usb_interface *interface,
 	strcpy(ua->pcm->name, name);
 	snd_pcm_set_ops(ua->pcm, SNDRV_PCM_STREAM_PLAYBACK, &playback_pcm_ops);
 	snd_pcm_set_ops(ua->pcm, SNDRV_PCM_STREAM_CAPTURE, &capture_pcm_ops);
-	snd_pcm_lib_preallocate_pages_for_all(ua->pcm, SNDRV_DMA_TYPE_VMALLOC,
-					      NULL, 0, 0);
+	snd_pcm_set_managed_buffer_all(ua->pcm, SNDRV_DMA_TYPE_VMALLOC,
+				       NULL, 0, 0);
 
 	err = snd_usbmidi_create(card, ua->intf[INTF_MIDI],
 				 &ua->midi_list, &midi_quirk);
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
