Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6443817E78E
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Mar 2020 19:52:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D546816A3;
	Mon,  9 Mar 2020 19:51:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D546816A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583779968;
	bh=qTviI9DYYgkM5Cv9KFD2zUS/55c60SOehV5stZhPGcs=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sZttyj/3q2ePlPeje7Pi4iwfpqe8zOCP+RlUcfFNbaAZ2vtsUoAbNVCIF8MHpLSmj
	 6ol7rPsenmW2hzk8ngshxo7Szh/0IaNdBZKxT3Jl0jiWdEOQxG5pR1Ugsfl6n/+21z
	 ONwhYGrV6bHEjEiEgafdNey/hQx1pF13HxBoHBN0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D83D5F801F7;
	Mon,  9 Mar 2020 19:51:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B76EF801EB; Mon,  9 Mar 2020 19:51:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C383F800DA
 for <alsa-devel@alsa-project.org>; Mon,  9 Mar 2020 19:51:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C383F800DA
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B774EB2AA
 for <alsa-devel@alsa-project.org>; Mon,  9 Mar 2020 18:50:58 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: pcm: oss: Simplify plugin frame size calculations
Date: Mon,  9 Mar 2020 19:50:57 +0100
Message-Id: <20200309185057.13974-1-tiwai@suse.de>
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

Both snd_pcm_plug_client_size() and snd_pcm_plug_slave_size() do the
almost same calculations of calling src_frames() and dst_frames() in
the chain, but just to the different directions with each other.

This patch simplifies those functions.  Now they return -EINVAL for
the invalid direction, but practically seen, there is no functional
changes at all.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/oss/pcm_plugin.c | 120 +++++++++++++++++++++-----------------------
 1 file changed, 56 insertions(+), 64 deletions(-)

diff --git a/sound/core/oss/pcm_plugin.c b/sound/core/oss/pcm_plugin.c
index c9401832967c..3978f6d99076 100644
--- a/sound/core/oss/pcm_plugin.c
+++ b/sound/core/oss/pcm_plugin.c
@@ -196,82 +196,74 @@ int snd_pcm_plugin_free(struct snd_pcm_plugin *plugin)
 	return 0;
 }
 
-snd_pcm_sframes_t snd_pcm_plug_client_size(struct snd_pcm_substream *plug, snd_pcm_uframes_t drv_frames)
+static snd_pcm_sframes_t calc_dst_frames(struct snd_pcm_substream *plug,
+					 snd_pcm_uframes_t frames)
 {
-	struct snd_pcm_plugin *plugin, *plugin_prev, *plugin_next;
-	int stream;
+	struct snd_pcm_plugin *plugin, *plugin_next;
 
-	if (snd_BUG_ON(!plug))
-		return -ENXIO;
-	if (drv_frames == 0)
-		return 0;
-	stream = snd_pcm_plug_stream(plug);
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		plugin = snd_pcm_plug_last(plug);
-		while (plugin && drv_frames > 0) {
-			if (drv_frames > plugin->buf_frames)
-				drv_frames = plugin->buf_frames;
-			plugin_prev = plugin->prev;
-			if (plugin->src_frames)
-				drv_frames = plugin->src_frames(plugin, drv_frames);
-			plugin = plugin_prev;
+	plugin = snd_pcm_plug_first(plug);
+	while (plugin && frames > 0) {
+		plugin_next = plugin->next;
+		if (plugin->dst_frames) {
+			frames = plugin->dst_frames(plugin, frames);
+			if (frames < 0)
+				return frames;
 		}
-	} else if (stream == SNDRV_PCM_STREAM_CAPTURE) {
-		plugin = snd_pcm_plug_first(plug);
-		while (plugin && drv_frames > 0) {
-			plugin_next = plugin->next;
-			if (plugin->dst_frames)
-				drv_frames = plugin->dst_frames(plugin, drv_frames);
-			if (drv_frames > plugin->buf_frames)
-				drv_frames = plugin->buf_frames;
-			plugin = plugin_next;
+		if (frames > plugin->buf_frames)
+			frames = plugin->buf_frames;
+		plugin = plugin_next;
+	}
+	return frames;
+}
+
+static snd_pcm_sframes_t calc_src_frames(struct snd_pcm_substream *plug,
+					 snd_pcm_uframes_t frames)
+{
+	struct snd_pcm_plugin *plugin, *plugin_prev;
+
+	plugin = snd_pcm_plug_last(plug);
+	while (plugin) {
+		if (frames > plugin->buf_frames)
+			frames = plugin->buf_frames;
+		plugin_prev = plugin->prev;
+		if (plugin->src_frames) {
+			frames = plugin->src_frames(plugin, frames);
+			if (frames < 0)
+				return frames;
 		}
-	} else
+		plugin = plugin_prev;
+	}
+	return frames;
+}
+
+snd_pcm_sframes_t snd_pcm_plug_client_size(struct snd_pcm_substream *plug, snd_pcm_uframes_t drv_frames)
+{
+	if (snd_BUG_ON(!plug))
+		return -ENXIO;
+	switch (snd_pcm_plug_stream(plug)) {
+	case SNDRV_PCM_STREAM_PLAYBACK:
+		return calc_src_frames(plug, drv_frames);
+	case SNDRV_PCM_STREAM_CAPTURE:
+		return calc_dst_frames(plug, drv_frames);
+	default:
 		snd_BUG();
-	return drv_frames;
+		return -EINVAL;
+	}
 }
 
 snd_pcm_sframes_t snd_pcm_plug_slave_size(struct snd_pcm_substream *plug, snd_pcm_uframes_t clt_frames)
 {
-	struct snd_pcm_plugin *plugin, *plugin_prev, *plugin_next;
-	snd_pcm_sframes_t frames;
-	int stream;
-	
 	if (snd_BUG_ON(!plug))
 		return -ENXIO;
-	if (clt_frames == 0)
-		return 0;
-	frames = clt_frames;
-	stream = snd_pcm_plug_stream(plug);
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		plugin = snd_pcm_plug_first(plug);
-		while (plugin && frames > 0) {
-			plugin_next = plugin->next;
-			if (plugin->dst_frames) {
-				frames = plugin->dst_frames(plugin, frames);
-				if (frames < 0)
-					return frames;
-			}
-			if (frames > plugin->buf_frames)
-				frames = plugin->buf_frames;
-			plugin = plugin_next;
-		}
-	} else if (stream == SNDRV_PCM_STREAM_CAPTURE) {
-		plugin = snd_pcm_plug_last(plug);
-		while (plugin) {
-			if (frames > plugin->buf_frames)
-				frames = plugin->buf_frames;
-			plugin_prev = plugin->prev;
-			if (plugin->src_frames) {
-				frames = plugin->src_frames(plugin, frames);
-				if (frames < 0)
-					return frames;
-			}
-			plugin = plugin_prev;
-		}
-	} else
+	switch (snd_pcm_plug_stream(plug)) {
+	case SNDRV_PCM_STREAM_PLAYBACK:
+		return calc_dst_frames(plug, clt_frames);
+	case SNDRV_PCM_STREAM_CAPTURE:
+		return calc_src_frames(plug, clt_frames);
+	default:
 		snd_BUG();
-	return frames;
+		return -EINVAL;
+	}
 }
 
 static int snd_pcm_plug_formats(const struct snd_mask *mask,
-- 
2.16.4

