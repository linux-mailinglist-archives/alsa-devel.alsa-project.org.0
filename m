Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4814D19D12C
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Apr 2020 09:27:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0DAF1686;
	Fri,  3 Apr 2020 09:26:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0DAF1686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585898825;
	bh=jjwsCjuCzUzBAlEFAT1ylvRYYTynhwMVHEIAtSSf73w=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mpeHWlT0PD8vcEYg+tmYzKMaSsIb8a0+dfwq9S7CmwhudRXpKEkLio2r81FFka5Jl
	 fvg2jkHSYiEvJ6i76QYne5Om3g9W6Sb0/rniAllgKWYECeH7DAiBOS+c9bFBQIKTpU
	 W5tCADXqaKZB6Gtr+D3CCxgGM3ByFzxOGHMBn7gY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3F00F800C2;
	Fri,  3 Apr 2020 09:25:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E368F8014C; Fri,  3 Apr 2020 09:25:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4AF25F80141
 for <alsa-devel@alsa-project.org>; Fri,  3 Apr 2020 09:25:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AF25F80141
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EB3C6AF5C
 for <alsa-devel@alsa-project.org>; Fri,  3 Apr 2020 07:25:15 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: pcm: oss: Fix regression by buffer overflow fix
Date: Fri,  3 Apr 2020 09:25:15 +0200
Message-Id: <20200403072515.25539-1-tiwai@suse.de>
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

The recent fix for the OOB access in PCM OSS plugins (commit
f2ecf903ef06: "ALSA: pcm: oss: Avoid plugin buffer overflow") caused a
regression on OSS applications.  The patch introduced the size check
in client and slave size calculations to limit to each plugin's buffer
size, but I overlooked that some code paths call those without
allocating the buffer but just for estimation.

This patch fixes the bug by skipping the size check for those code
paths while keeping checking in the actual transfer calls.

Fixes: f2ecf903ef06 ("ALSA: pcm: oss: Avoid plugin buffer overflow")
Tested-and-reported-by: Jari Ruusu <jari.ruusu@gmail.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/oss/pcm_plugin.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/sound/core/oss/pcm_plugin.c b/sound/core/oss/pcm_plugin.c
index 752d078908e9..50c35ecc8953 100644
--- a/sound/core/oss/pcm_plugin.c
+++ b/sound/core/oss/pcm_plugin.c
@@ -196,7 +196,9 @@ int snd_pcm_plugin_free(struct snd_pcm_plugin *plugin)
 	return 0;
 }
 
-snd_pcm_sframes_t snd_pcm_plug_client_size(struct snd_pcm_substream *plug, snd_pcm_uframes_t drv_frames)
+static snd_pcm_sframes_t plug_client_size(struct snd_pcm_substream *plug,
+					  snd_pcm_uframes_t drv_frames,
+					  bool check_size)
 {
 	struct snd_pcm_plugin *plugin, *plugin_prev, *plugin_next;
 	int stream;
@@ -209,7 +211,7 @@ snd_pcm_sframes_t snd_pcm_plug_client_size(struct snd_pcm_substream *plug, snd_p
 	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		plugin = snd_pcm_plug_last(plug);
 		while (plugin && drv_frames > 0) {
-			if (drv_frames > plugin->buf_frames)
+			if (check_size && drv_frames > plugin->buf_frames)
 				drv_frames = plugin->buf_frames;
 			plugin_prev = plugin->prev;
 			if (plugin->src_frames)
@@ -222,7 +224,7 @@ snd_pcm_sframes_t snd_pcm_plug_client_size(struct snd_pcm_substream *plug, snd_p
 			plugin_next = plugin->next;
 			if (plugin->dst_frames)
 				drv_frames = plugin->dst_frames(plugin, drv_frames);
-			if (drv_frames > plugin->buf_frames)
+			if (check_size && drv_frames > plugin->buf_frames)
 				drv_frames = plugin->buf_frames;
 			plugin = plugin_next;
 		}
@@ -231,7 +233,9 @@ snd_pcm_sframes_t snd_pcm_plug_client_size(struct snd_pcm_substream *plug, snd_p
 	return drv_frames;
 }
 
-snd_pcm_sframes_t snd_pcm_plug_slave_size(struct snd_pcm_substream *plug, snd_pcm_uframes_t clt_frames)
+static snd_pcm_sframes_t plug_slave_size(struct snd_pcm_substream *plug,
+					 snd_pcm_uframes_t clt_frames,
+					 bool check_size)
 {
 	struct snd_pcm_plugin *plugin, *plugin_prev, *plugin_next;
 	snd_pcm_sframes_t frames;
@@ -252,14 +256,14 @@ snd_pcm_sframes_t snd_pcm_plug_slave_size(struct snd_pcm_substream *plug, snd_pc
 				if (frames < 0)
 					return frames;
 			}
-			if (frames > plugin->buf_frames)
+			if (check_size && frames > plugin->buf_frames)
 				frames = plugin->buf_frames;
 			plugin = plugin_next;
 		}
 	} else if (stream == SNDRV_PCM_STREAM_CAPTURE) {
 		plugin = snd_pcm_plug_last(plug);
 		while (plugin) {
-			if (frames > plugin->buf_frames)
+			if (check_size && frames > plugin->buf_frames)
 				frames = plugin->buf_frames;
 			plugin_prev = plugin->prev;
 			if (plugin->src_frames) {
@@ -274,6 +278,18 @@ snd_pcm_sframes_t snd_pcm_plug_slave_size(struct snd_pcm_substream *plug, snd_pc
 	return frames;
 }
 
+snd_pcm_sframes_t snd_pcm_plug_client_size(struct snd_pcm_substream *plug,
+					   snd_pcm_uframes_t drv_frames)
+{
+	return plug_client_size(plug, drv_frames, false);
+}
+
+snd_pcm_sframes_t snd_pcm_plug_slave_size(struct snd_pcm_substream *plug,
+					  snd_pcm_uframes_t clt_frames)
+{
+	return plug_slave_size(plug, clt_frames, false);
+}
+
 static int snd_pcm_plug_formats(const struct snd_mask *mask,
 				snd_pcm_format_t format)
 {
@@ -630,7 +646,7 @@ snd_pcm_sframes_t snd_pcm_plug_write_transfer(struct snd_pcm_substream *plug, st
 		src_channels = dst_channels;
 		plugin = next;
 	}
-	return snd_pcm_plug_client_size(plug, frames);
+	return plug_client_size(plug, frames, true);
 }
 
 snd_pcm_sframes_t snd_pcm_plug_read_transfer(struct snd_pcm_substream *plug, struct snd_pcm_plugin_channel *dst_channels_final, snd_pcm_uframes_t size)
@@ -640,7 +656,7 @@ snd_pcm_sframes_t snd_pcm_plug_read_transfer(struct snd_pcm_substream *plug, str
 	snd_pcm_sframes_t frames = size;
 	int err;
 
-	frames = snd_pcm_plug_slave_size(plug, frames);
+	frames = plug_slave_size(plug, frames, true);
 	if (frames < 0)
 		return frames;
 
-- 
2.16.4

