Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC243FAA00
	for <lists+alsa-devel@lfdr.de>; Sun, 29 Aug 2021 09:40:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A80916E9;
	Sun, 29 Aug 2021 09:39:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A80916E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630222800;
	bh=l4sg+EX162g+G17NTuSeDjjVxwMB1E3hykgEz6hzqq8=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Xil+JpNU5p0zNV9Q87mHK1o7KgIHRXUhztS1F6irTfuspie5+QpOvrzwLQddETvaM
	 3jkuYrJNHrCBz5LSBHHTdIh/tSaLzN53GGZ9ydoGaec1XLi/2SiApsr7J+188knowB
	 +oe9KccS+uy6a3oON37k0VTug9GcQWc6mrsdCzEQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DAD3F80269;
	Sun, 29 Aug 2021 09:38:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 042CAF80246; Sun, 29 Aug 2021 09:38:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D08D2F80246
 for <alsa-devel@alsa-project.org>; Sun, 29 Aug 2021 09:38:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D08D2F80246
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="wOACkx1J"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="+rwjxefG"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id E46092001C
 for <alsa-devel@alsa-project.org>; Sun, 29 Aug 2021 07:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1630222711; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=B4m7d64wSkv2qhxccKKnqdD60GrFcTiRsUvMa6tlCZo=;
 b=wOACkx1Jdln1GwiDiXb1YUVtFbsi7VHjIoXRKgIjCwdSHkix+I/ZO9rlYvGLi8VJDWBYL+
 53uEaQQOxcJ3HosO/EIF0TTIp3qPbrwxmj+mnB0V/r9k2WuYGiJSH3G2iZlxBydvvvge8c
 DmcmC5jlhqWq0hHtkpflRUSj1PxAbY8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1630222711;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=B4m7d64wSkv2qhxccKKnqdD60GrFcTiRsUvMa6tlCZo=;
 b=+rwjxefG8oGC5E5x4P3JOahIM0PtQiAmaw2aN7owxrY++ZDQuYYw1KRVBIWRKkNqpdM5wT
 nCmH45nP5ooCipDw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id D0C51A3B81;
 Sun, 29 Aug 2021 07:38:31 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Add lowlatency module option
Date: Sun, 29 Aug 2021 09:38:30 +0200
Message-Id: <20210829073830.22686-1-tiwai@suse.de>
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

For making user to switch back to the old playback mode, this patch
adds a new module option 'lowlatency' to snd-usb-audio driver.
When user face a regression due to the recent low-latency playback
support, they can test easily by passing lowlatency=0 option without
rebuilding the kernel.

Fixes: 307cc9baac5c ("ALSA: usb-audio: Reduce latency at playback start, take#2")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/card.c     | 4 ++++
 sound/usb/pcm.c      | 3 ++-
 sound/usb/usbaudio.h | 1 +
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index cf8f3953f78f..fd570a42f043 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -68,6 +68,7 @@ static int pid[SNDRV_CARDS] = { [0 ... (SNDRV_CARDS-1)] = -1 };
 static int device_setup[SNDRV_CARDS]; /* device parameter for this card */
 static bool ignore_ctl_error;
 static bool autoclock = true;
+static bool lowlatency = true;
 static char *quirk_alias[SNDRV_CARDS];
 static char *delayed_register[SNDRV_CARDS];
 static bool implicit_fb[SNDRV_CARDS];
@@ -93,6 +94,8 @@ MODULE_PARM_DESC(ignore_ctl_error,
 		 "Ignore errors from USB controller for mixer interfaces.");
 module_param(autoclock, bool, 0444);
 MODULE_PARM_DESC(autoclock, "Enable auto-clock selection for UAC2 devices (default: yes).");
+module_param(lowlatency, bool, 0444);
+MODULE_PARM_DESC(lowlatency, "Enable low latency playback (default: yes).");
 module_param_array(quirk_alias, charp, NULL, 0444);
 MODULE_PARM_DESC(quirk_alias, "Quirk aliases, e.g. 0123abcd:5678beef.");
 module_param_array(delayed_register, charp, NULL, 0444);
@@ -623,6 +626,7 @@ static int snd_usb_audio_create(struct usb_interface *intf,
 	chip->setup = device_setup[idx];
 	chip->generic_implicit_fb = implicit_fb[idx];
 	chip->autoclock = autoclock;
+	chip->lowlatency = lowlatency;
 	atomic_set(&chip->active, 1); /* avoid autopm during probing */
 	atomic_set(&chip->usage_count, 0);
 	atomic_set(&chip->shutdown, 0);
diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index f5cbf61ac366..5dc9266180e3 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -617,7 +617,8 @@ static int snd_usb_pcm_prepare(struct snd_pcm_substream *substream)
 	/* check whether early start is needed for playback stream */
 	subs->early_playback_start =
 		subs->direction == SNDRV_PCM_STREAM_PLAYBACK &&
-		subs->data_endpoint->nominal_queue_size >= subs->buffer_bytes;
+		(!chip->lowlatency ||
+		 (subs->data_endpoint->nominal_queue_size >= subs->buffer_bytes));
 
 	if (subs->early_playback_start)
 		ret = start_endpoints(subs);
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index 94261d19cceb..167834133b9b 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -55,6 +55,7 @@ struct snd_usb_audio {
 	bool generic_implicit_fb;	/* from the 'implicit_fb' module param */
 	bool autoclock;			/* from the 'autoclock' module param */
 
+	bool lowlatency;		/* from the 'lowlatency' module param */
 	struct usb_host_interface *ctrl_intf;	/* the audio control interface */
 	struct media_device *media_dev;
 	struct media_intf_devnode *ctl_intf_media_devnode;
-- 
2.26.2

