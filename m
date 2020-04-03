Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A110519D168
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Apr 2020 09:40:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44B491686;
	Fri,  3 Apr 2020 09:39:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44B491686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585899609;
	bh=J4voEMZ505zK9sjm/pk+PwAeG6oXkA4CXqIZ21Lm3y4=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hMua1UA5sXLHh3CoAUuimYDPJbbS7ghIYAUVzSoF++d75Xl/w02tql/+pQG6PaEDZ
	 +ihj+/FP/+lH+D0dtF/pRSCXXePFsaVEZxwehPZhFOjEaSK7skBLjqSljERtTkwuDM
	 eGqAPD3KrXjbqp46UmLPso0hlVv6o8exCm5sKtoE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31152F8015C;
	Fri,  3 Apr 2020 09:38:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CAF9F8014C; Fri,  3 Apr 2020 09:38:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9CCCF800C2
 for <alsa-devel@alsa-project.org>; Fri,  3 Apr 2020 09:38:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9CCCF800C2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 99DB6AC92
 for <alsa-devel@alsa-project.org>; Fri,  3 Apr 2020 07:38:19 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: pcm: oss: Fix regression by buffer overflow fix (again)
Date: Fri,  3 Apr 2020 09:38:18 +0200
Message-Id: <20200403073818.27943-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
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

[ This is essentially the same fix as commit ae769d355664, but it's
  adapted to the latest code for 5.7; hence it contains no Fixes or
  other tags for avoid backport confusion -- tiwai ]

The recent fix for the OOB access in PCM OSS plugins (commit
f2ecf903ef06: "ALSA: pcm: oss: Avoid plugin buffer overflow") caused a
regression on OSS applications.  The patch introduced the size check
in client and slave size calculations to limit to each plugin's buffer
size, but I overlooked that some code paths call those without
allocating the buffer but just for estimation.

This patch fixes the bug by skipping the size check for those code
paths while keeping checking in the actual transfer calls.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/oss/pcm_plugin.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/sound/core/oss/pcm_plugin.c b/sound/core/oss/pcm_plugin.c
index fbda4ebf38b3..59d62f05658f 100644
--- a/sound/core/oss/pcm_plugin.c
+++ b/sound/core/oss/pcm_plugin.c
@@ -197,7 +197,8 @@ int snd_pcm_plugin_free(struct snd_pcm_plugin *plugin)
 }
 
 static snd_pcm_sframes_t calc_dst_frames(struct snd_pcm_substream *plug,
-					 snd_pcm_sframes_t frames)
+					 snd_pcm_sframes_t frames,
+					 bool check_size)
 {
 	struct snd_pcm_plugin *plugin, *plugin_next;
 
@@ -209,7 +210,7 @@ static snd_pcm_sframes_t calc_dst_frames(struct snd_pcm_substream *plug,
 			if (frames < 0)
 				return frames;
 		}
-		if (frames > plugin->buf_frames)
+		if (check_size && frames > plugin->buf_frames)
 			frames = plugin->buf_frames;
 		plugin = plugin_next;
 	}
@@ -217,13 +218,14 @@ static snd_pcm_sframes_t calc_dst_frames(struct snd_pcm_substream *plug,
 }
 
 static snd_pcm_sframes_t calc_src_frames(struct snd_pcm_substream *plug,
-					 snd_pcm_sframes_t frames)
+					 snd_pcm_sframes_t frames,
+					 bool check_size)
 {
 	struct snd_pcm_plugin *plugin, *plugin_prev;
 
 	plugin = snd_pcm_plug_last(plug);
 	while (plugin && frames > 0) {
-		if (frames > plugin->buf_frames)
+		if (check_size && frames > plugin->buf_frames)
 			frames = plugin->buf_frames;
 		plugin_prev = plugin->prev;
 		if (plugin->src_frames) {
@@ -242,9 +244,9 @@ snd_pcm_sframes_t snd_pcm_plug_client_size(struct snd_pcm_substream *plug, snd_p
 		return -ENXIO;
 	switch (snd_pcm_plug_stream(plug)) {
 	case SNDRV_PCM_STREAM_PLAYBACK:
-		return calc_src_frames(plug, drv_frames);
+		return calc_src_frames(plug, drv_frames, false);
 	case SNDRV_PCM_STREAM_CAPTURE:
-		return calc_dst_frames(plug, drv_frames);
+		return calc_dst_frames(plug, drv_frames, false);
 	default:
 		snd_BUG();
 		return -EINVAL;
@@ -257,9 +259,9 @@ snd_pcm_sframes_t snd_pcm_plug_slave_size(struct snd_pcm_substream *plug, snd_pc
 		return -ENXIO;
 	switch (snd_pcm_plug_stream(plug)) {
 	case SNDRV_PCM_STREAM_PLAYBACK:
-		return calc_dst_frames(plug, clt_frames);
+		return calc_dst_frames(plug, clt_frames, false);
 	case SNDRV_PCM_STREAM_CAPTURE:
-		return calc_src_frames(plug, clt_frames);
+		return calc_src_frames(plug, clt_frames, false);
 	default:
 		snd_BUG();
 		return -EINVAL;
@@ -622,7 +624,7 @@ snd_pcm_sframes_t snd_pcm_plug_write_transfer(struct snd_pcm_substream *plug, st
 		src_channels = dst_channels;
 		plugin = next;
 	}
-	return snd_pcm_plug_client_size(plug, frames);
+	return calc_src_frames(plug, frames, true);
 }
 
 snd_pcm_sframes_t snd_pcm_plug_read_transfer(struct snd_pcm_substream *plug, struct snd_pcm_plugin_channel *dst_channels_final, snd_pcm_uframes_t size)
@@ -632,7 +634,7 @@ snd_pcm_sframes_t snd_pcm_plug_read_transfer(struct snd_pcm_substream *plug, str
 	snd_pcm_sframes_t frames = size;
 	int err;
 
-	frames = snd_pcm_plug_slave_size(plug, frames);
+	frames = calc_src_frames(plug, frames, true);
 	if (frames < 0)
 		return frames;
 
-- 
2.16.4

