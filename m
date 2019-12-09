Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 229EC116B4F
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 11:44:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 934EF16C9;
	Mon,  9 Dec 2019 11:43:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 934EF16C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575888259;
	bh=D7uXmmCGtZgLm/QeftZH0VkyAnCWptvcfuOwX36LUY8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uSMDTP3K7ZuOBxEpcEUsLEcHRozJsEhem3sRLfPzMuJhdaHYt6tDYUxp8aiFHwMXN
	 7SvIZVyOKRp/b8AsdreASOMf7vT5Esd66ThhnLPTisRiqJlHsd36c2yTNIRln30RlA
	 EDlkDDyBaCEjwcZfyh7KdbN6nU0z/GxnaoPl8ShA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41A14F8067A;
	Mon,  9 Dec 2019 10:52:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74215F803B1; Mon,  9 Dec 2019 10:51:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95848F802E8
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 10:49:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95848F802E8
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D82E7B2A0
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 09:49:49 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Mon,  9 Dec 2019 10:49:41 +0100
Message-Id: <20191209094943.14984-70-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191209094943.14984-1-tiwai@suse.de>
References: <20191209094943.14984-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 5.6 69/71] ALSA: usx2y: Use managed buffer
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
 sound/usb/usx2y/usbusx2yaudio.c | 26 +++++++++-----------------
 sound/usb/usx2y/usx2yhwdeppcm.c | 18 +++++++++---------
 2 files changed, 18 insertions(+), 26 deletions(-)

diff --git a/sound/usb/usx2y/usbusx2yaudio.c b/sound/usb/usx2y/usbusx2yaudio.c
index 25a0939f410a..7eb9805a4326 100644
--- a/sound/usb/usx2y/usbusx2yaudio.c
+++ b/sound/usb/usx2y/usbusx2yaudio.c
@@ -764,14 +764,6 @@ static int snd_usX2Y_pcm_hw_params(struct snd_pcm_substream *substream,
 		}
 	}
 
-	err = snd_pcm_lib_malloc_pages(substream,
-				       params_buffer_bytes(hw_params));
-	if (err < 0) {
-		snd_printk(KERN_ERR "snd_pcm_lib_malloc_pages(%p, %i) returned %i\n",
-			   substream, params_buffer_bytes(hw_params), err);
-		goto error;
-	}
-
  error:
 	mutex_unlock(&usX2Y(card)->pcm_mutex);
 	return err;
@@ -806,7 +798,7 @@ static int snd_usX2Y_pcm_hw_free(struct snd_pcm_substream *substream)
 		}
 	}
 	mutex_unlock(&subs->usX2Y->pcm_mutex);
-	return snd_pcm_lib_free_pages(substream);
+	return 0;
 }
 /*
  * prepare callback
@@ -968,16 +960,16 @@ static int usX2Y_audio_stream_new(struct snd_card *card, int playback_endpoint,
 	sprintf(pcm->name, NAME_ALLCAPS" Audio #%d", usX2Y(card)->pcm_devs);
 
 	if (playback_endpoint) {
-		snd_pcm_lib_preallocate_pages(pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream,
-					      SNDRV_DMA_TYPE_CONTINUOUS,
-					      NULL,
-					      64*1024, 128*1024);
+		snd_pcm_set_managed_buffer(pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream,
+					   SNDRV_DMA_TYPE_CONTINUOUS,
+					   NULL,
+					   64*1024, 128*1024);
 	}
 
-	snd_pcm_lib_preallocate_pages(pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream,
-				      SNDRV_DMA_TYPE_CONTINUOUS,
-				      NULL,
-				      64*1024, 128*1024);
+	snd_pcm_set_managed_buffer(pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream,
+				   SNDRV_DMA_TYPE_CONTINUOUS,
+				   NULL,
+				   64*1024, 128*1024);
 	usX2Y(card)->pcm_devs++;
 
 	return 0;
diff --git a/sound/usb/usx2y/usx2yhwdeppcm.c b/sound/usb/usx2y/usx2yhwdeppcm.c
index 997493e839ee..419d9f07d197 100644
--- a/sound/usb/usx2y/usx2yhwdeppcm.c
+++ b/sound/usb/usx2y/usx2yhwdeppcm.c
@@ -376,7 +376,7 @@ static int snd_usX2Y_usbpcm_hw_free(struct snd_pcm_substream *substream)
 		}
 	}
 	mutex_unlock(&subs->usX2Y->pcm_mutex);
-	return snd_pcm_lib_free_pages(substream);
+	return 0;
 }
 
 static void usX2Y_usbpcm_subs_startup(struct snd_usX2Y_substream *subs)
@@ -726,14 +726,14 @@ int usX2Y_hwdep_pcm_new(struct snd_card *card)
 	pcm->info_flags = 0;
 
 	sprintf(pcm->name, NAME_ALLCAPS" hwdep Audio");
-	snd_pcm_lib_preallocate_pages(pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream,
-				      SNDRV_DMA_TYPE_CONTINUOUS,
-				      NULL,
-				      64*1024, 128*1024);
-	snd_pcm_lib_preallocate_pages(pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream,
-				      SNDRV_DMA_TYPE_CONTINUOUS,
-				      NULL,
-				      64*1024, 128*1024);
+	snd_pcm_set_managed_buffer(pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream,
+				   SNDRV_DMA_TYPE_CONTINUOUS,
+				   NULL,
+				   64*1024, 128*1024);
+	snd_pcm_set_managed_buffer(pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream,
+				   SNDRV_DMA_TYPE_CONTINUOUS,
+				   NULL,
+				   64*1024, 128*1024);
 
 	return 0;
 }
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
