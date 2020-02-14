Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 000E415EB09
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Feb 2020 18:18:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 844D11689;
	Fri, 14 Feb 2020 18:17:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 844D11689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581700710;
	bh=b48ZBRPyk+ZOMKowA2coUuIv8e2FS1IkJ8m3QCcpGmE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oZUUXYBSPSSy2SNUFBN7HvT4YrO+A2go5QFhcUQhcyCf5DfeJxMw5N/FoTG3rP1jJ
	 92w+og53BHoFCcd9tlec09a8HUw6rCCd9lrspSLuymwPl6LYi9YAy6s9Ebly7ro+MF
	 JTXbDxQgVTdc2g3Q5/rnrc8+pK6ZyC3wJTW24Do8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84444F8013E;
	Fri, 14 Feb 2020 18:16:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F636F8013E; Fri, 14 Feb 2020 18:16:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15830F80138
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 18:16:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15830F80138
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8B841ACA4
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 17:16:44 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri, 14 Feb 2020 18:16:43 +0100
Message-Id: <20200214171643.26212-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Subject: [alsa-devel] [PATCH] ALSA: pcm: oss: Unlock mutex temporarily for
	sleeping at read/write
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

ALSA PCM OSS layer calls the generic __snd_pcm_lib_xfer() helper for
the actual transfer of the audio data.  The xfer helper may sleep long
for waiting for the enough space becoming empty for read/write, and
it does unlock/relock for the substream lock.  This works fine, so
far, but a slight problem specific to OSS layer is that OSS layer
wraps yet more mutex (runtime->oss.params_lock) over
__snd_pcm_lib_xfer() call; so this mutex is still locked during a
possible long sleep, and it prevents the whole ioctl and other actions
applied to the given stream.

This patch adds the temporarily unlock and relock of the mutex around
__snd_pcm_lib_xfer() call in the OSS layer to be more friendly to the
concurrent accesses.  The long mutex protection itself shouldn't be a
real issue for the normal systems, and its influence appears only on
strange things like fuzzers.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/oss/pcm_oss.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
index 707eb2a9d50c..930def8201f4 100644
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -1217,8 +1217,10 @@ snd_pcm_sframes_t snd_pcm_oss_write3(struct snd_pcm_substream *substream, const
 			if (ret < 0)
 				break;
 		}
+		mutex_unlock(&runtime->oss.params_lock);
 		ret = __snd_pcm_lib_xfer(substream, (void *)ptr, true,
 					 frames, in_kernel);
+		mutex_lock(&runtime->oss.params_lock);
 		if (ret != -EPIPE && ret != -ESTRPIPE)
 			break;
 		/* test, if we can't store new data, because the stream */
@@ -1254,8 +1256,10 @@ snd_pcm_sframes_t snd_pcm_oss_read3(struct snd_pcm_substream *substream, char *p
 		ret = snd_pcm_oss_capture_position_fixup(substream, &delay);
 		if (ret < 0)
 			break;
+		mutex_unlock(&runtime->oss.params_lock);
 		ret = __snd_pcm_lib_xfer(substream, (void *)ptr, true,
 					 frames, in_kernel);
+		mutex_lock(&runtime->oss.params_lock);
 		if (ret == -EPIPE) {
 			if (runtime->status->state == SNDRV_PCM_STATE_DRAINING) {
 				ret = snd_pcm_kernel_ioctl(substream, SNDRV_PCM_IOCTL_DROP, NULL);
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
