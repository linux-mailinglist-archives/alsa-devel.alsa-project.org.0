Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57278397804
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Jun 2021 18:26:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFDB316E4;
	Tue,  1 Jun 2021 18:26:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFDB316E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622564812;
	bh=5ySjhuuk4SkenMYPGm0I2Nz0DZ4p68O8FD07sAdYH4A=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ImBXlniBUw8SmL+Y+CLeQDOoSHZGr4h6q5kWS69lUfp6/UQYLko8eMeryl3X31v3N
	 2EU4miV0GqK8toGd6FkOc+y1FVbGGiICTWKnxwmtyCHiaSA2DmBLIbd/YKBtXk0CI6
	 DIVzbJ8/BlHDLv1NVxC54ScPxRAk7Mldh8yCzb/I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28362F804BD;
	Tue,  1 Jun 2021 18:25:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A232EF804AF; Tue,  1 Jun 2021 18:25:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DCCEAF80254
 for <alsa-devel@alsa-project.org>; Tue,  1 Jun 2021 18:24:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCCEAF80254
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="NDWheX7r"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="91ZPWIEN"
Received: from relay2.suse.de (unknown [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id CC57821963
 for <alsa-devel@alsa-project.org>; Tue,  1 Jun 2021 16:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1622564698; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WYCquLZWAUtwsKRsm1Vk986BlBN+cqLHdeQkKaeSawE=;
 b=NDWheX7rytan3cGq6omD9EYFE7dfgzB959upl6RUgaBT7K6cSqIVLmc5OcPgydfrzviBLp
 jEafTGwjP3n8K+uL1CvXz/fD+/2Nlv6atLN2SAZ2960F9DpKMw2teygsFOXdTI8erfcF/1
 gA39FUvAQUyIryMXvyALfRYebJWY3k8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1622564698;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WYCquLZWAUtwsKRsm1Vk986BlBN+cqLHdeQkKaeSawE=;
 b=91ZPWIENg2Oeu3Og0VbJy+01CIAYm7YJfoB7JNqYh9VGtczeavswoIEild0wipatVP/56G
 74Yug7BpSmqiGDBQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id BCE21A3B87;
 Tue,  1 Jun 2021 16:24:58 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/5] ALSA: usb-audio: Reduce latency at playback start
Date: Tue,  1 Jun 2021 18:24:57 +0200
Message-Id: <20210601162457.4877-6-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601162457.4877-1-tiwai@suse.de>
References: <20210601162457.4877-1-tiwai@suse.de>
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

USB-audio driver behaves a bit strangely for the playback stream --
namely, it starts sending silent packets at PCM prepare state while
the actual data is submitted at first when the trigger START is kicked
off.  This is a workaround for the behavior where URBs are processed
too quickly at the beginning.  That is, if we start submitting URBs at
trigger START, the first few URBs will be immediately completed, and
this would result in the immediate period-elapsed calls right after
the start, which may confuse applications.

OTOH, submitting the data after silent URBs would, of course, result
in a certain delay of the actual data processing, and this is rather
more serious problem on modern systems, in practice.

This patch tries to revert the workaround and lets the URB submission
starting at PCM trigger for the playback again.  As far as I've tested
with various backends (native ALSA, PA, JACK, PW), I haven't seen any
problems (famous last words :)

Note that the capture stream handling needs no such workaround, since
the capture is driven per received URB.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/pcm.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index e26d37365f02..c66831ee15f9 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -613,11 +613,6 @@ static int snd_usb_pcm_prepare(struct snd_pcm_substream *substream)
 	subs->last_frame_number = 0;
 	runtime->delay = 0;
 
-	/* for playback, submit the URBs now; otherwise, the first hwptr_done
-	 * updates for all URBs would happen at the same time when starting */
-	if (subs->direction == SNDRV_PCM_STREAM_PLAYBACK)
-		ret = start_endpoints(subs);
-
  unlock:
 	snd_usb_unlock_shutdown(chip);
 	return ret;
@@ -1430,6 +1425,7 @@ static int snd_usb_substream_playback_trigger(struct snd_pcm_substream *substrea
 					      int cmd)
 {
 	struct snd_usb_substream *subs = substream->runtime->private_data;
+	int err;
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
@@ -1440,6 +1436,14 @@ static int snd_usb_substream_playback_trigger(struct snd_pcm_substream *substrea
 					      prepare_playback_urb,
 					      retire_playback_urb,
 					      subs);
+		if (cmd == SNDRV_PCM_TRIGGER_START) {
+			err = start_endpoints(subs);
+			if (err < 0) {
+				snd_usb_endpoint_set_callback(subs->data_endpoint,
+							      NULL, NULL, NULL);
+				return err;
+			}
+		}
 		subs->running = 1;
 		dev_dbg(&subs->dev->dev, "%d:%d Start Playback PCM\n",
 			subs->cur_audiofmt->iface,
-- 
2.26.2

