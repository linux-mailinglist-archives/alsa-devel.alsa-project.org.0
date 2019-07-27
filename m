Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A04B777E9
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Jul 2019 11:33:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 139C62076;
	Sat, 27 Jul 2019 11:32:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 139C62076
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564220018;
	bh=Bmcug4s2uLC4HOCNd66I7acwCCEvyE5TsjJ/dK2+oio=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Cv1K7ZNGhEWUPGEwIrNaYfsFR59oOE3c2oXoXi0GUv6TJ+MsZgXEQ7Dix/f8h/7kc
	 b6iyw2etx3PhW3u9iljvNLT4HO0/f4VqAWkFtbcZJxYiNoAKCi3eIIRja8lFBOWe+w
	 o6auf7yGlTkfE8reIOOzKRE0ZC9rdkLSIAXkJE1s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E8DBF8048D;
	Sat, 27 Jul 2019 11:30:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1796CF8044A; Sat, 27 Jul 2019 11:30:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AEE1AF80394
 for <alsa-devel@alsa-project.org>; Sat, 27 Jul 2019 11:30:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEE1AF80394
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9E495AF80;
 Sat, 27 Jul 2019 09:30:14 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sat, 27 Jul 2019 11:30:05 +0200
Message-Id: <20190727093006.9870-2-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190727093006.9870-1-tiwai@suse.de>
References: <20190727093006.9870-1-tiwai@suse.de>
Cc: Tanu Kaskinen <tanuk@iki.fi>, Alexander Tsoy <alexander@tsoy.me>
Subject: [alsa-devel] [PATCH v2 1/2] ALSA: usb-audio: Unify audioformat
	release code
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

There are many open code for releasing audioformat object.
Provide a unified helper and call it from the all places.

Only a cleanup, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/stream.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/sound/usb/stream.c b/sound/usb/stream.c
index 7ee9d17d0143..963d425004f8 100644
--- a/sound/usb/stream.c
+++ b/sound/usb/stream.c
@@ -28,6 +28,14 @@
 #include "power.h"
 #include "media.h"
 
+static void audioformat_free(struct audioformat *fp)
+{
+	list_del(&fp->list); /* unlink for avoiding double-free */
+	kfree(fp->rate_table);
+	kfree(fp->chmap);
+	kfree(fp);
+}
+
 /*
  * free a substream
  */
@@ -37,11 +45,8 @@ static void free_substream(struct snd_usb_substream *subs)
 
 	if (!subs->num_formats)
 		return; /* not initialized */
-	list_for_each_entry_safe(fp, n, &subs->fmt_list, list) {
-		kfree(fp->rate_table);
-		kfree(fp->chmap);
-		kfree(fp);
-	}
+	list_for_each_entry_safe(fp, n, &subs->fmt_list, list)
+		audioformat_free(fp);
 	kfree(subs->rate_list.list);
 	kfree(subs->str_pd);
 	snd_media_stream_delete(subs);
@@ -832,8 +837,7 @@ snd_usb_get_audioformat_uac12(struct snd_usb_audio *chip,
 	/* ok, let's parse further... */
 	if (snd_usb_parse_audio_format(chip, fp, format,
 					fmt, stream) < 0) {
-		kfree(fp->rate_table);
-		kfree(fp);
+		audioformat_free(fp);
 		return NULL;
 	}
 
@@ -1043,8 +1047,7 @@ snd_usb_get_audioformat_uac3(struct snd_usb_audio *chip,
 
 		pd = kzalloc(sizeof(*pd), GFP_KERNEL);
 		if (!pd) {
-			kfree(fp->rate_table);
-			kfree(fp);
+			audioformat_free(fp);
 			return NULL;
 		}
 		pd->pd_id = (stream == SNDRV_PCM_STREAM_PLAYBACK) ?
@@ -1063,9 +1066,7 @@ snd_usb_get_audioformat_uac3(struct snd_usb_audio *chip,
 		/* ok, let's parse further... */
 		if (snd_usb_parse_audio_format_v3(chip, fp, as, stream) < 0) {
 			kfree(pd);
-			kfree(fp->chmap);
-			kfree(fp->rate_table);
-			kfree(fp);
+			audioformat_free(fp);
 			return NULL;
 		}
 	}
@@ -1184,11 +1185,8 @@ int snd_usb_parse_audio_interface(struct snd_usb_audio *chip, int iface_no)
 			err = snd_usb_add_audio_stream(chip, stream, fp);
 
 		if (err < 0) {
-			list_del(&fp->list); /* unlink for avoiding double-free */
+			audioformat_free(fp);
 			kfree(pd);
-			kfree(fp->rate_table);
-			kfree(fp->chmap);
-			kfree(fp);
 			return err;
 		}
 		/* try to set the interface... */
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
