Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D87F1B7F1D
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Apr 2020 21:40:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E64D116C1;
	Fri, 24 Apr 2020 21:39:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E64D116C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587757234;
	bh=hGaH/+NynImM8JBum3kHeBMCo0zs1MEERt7QLtuFsc8=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oDSM7CryZ7IRG1QG5VvIlHZJVa73LtSeSl/X8Icg/gl3gFTfvhxq4OKkHba6j+1vo
	 ZA+qXbKeRyYJC4veUduzVOid/2cjPKUGlMpaXuWeTxVD8sV4zwChQ3O6lwW62nSpsh
	 C8nyXtZlcLyuHIvoCW2gLCKu4RRn5+qUa9yGXuQI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 846E7F800BE;
	Fri, 24 Apr 2020 21:38:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F9A2F80142; Fri, 24 Apr 2020 21:38:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7071BF800BE
 for <alsa-devel@alsa-project.org>; Fri, 24 Apr 2020 21:38:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7071BF800BE
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DBB5BADD7
 for <alsa-devel@alsa-project.org>; Fri, 24 Apr 2020 19:38:44 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: pcm: oss: Place the plugin buffer overflow checks
 correctly (for 5.7)
Date: Fri, 24 Apr 2020 21:38:43 +0200
Message-Id: <20200424193843.20397-1-tiwai@suse.de>
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

[ This is again a forward-port of the fix applied for 5.6-base code
  (commit 4285de0725b1) to 5.7-base, hence neither Fixes nor
  Cc-to-stable tags are included here -- tiwai ]

The checks of the plugin buffer overflow in the previous fix by commit
  f2ecf903ef06 ("ALSA: pcm: oss: Avoid plugin buffer overflow")
are put in the wrong places mistakenly, which leads to the expected
(repeated) sound when the rate plugin is involved.  Fix in the right
places.

Also, at those right places, the zero check is needed for the
termination node, so added there as well, and let's get it done,
finally.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/oss/pcm_plugin.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/core/oss/pcm_plugin.c b/sound/core/oss/pcm_plugin.c
index 59d62f05658f..1545f8fdb4db 100644
--- a/sound/core/oss/pcm_plugin.c
+++ b/sound/core/oss/pcm_plugin.c
@@ -205,13 +205,14 @@ static snd_pcm_sframes_t calc_dst_frames(struct snd_pcm_substream *plug,
 	plugin = snd_pcm_plug_first(plug);
 	while (plugin && frames > 0) {
 		plugin_next = plugin->next;
+		if (check_size && plugin->buf_frames &&
+		    frames > plugin->buf_frames)
+			frames = plugin->buf_frames;
 		if (plugin->dst_frames) {
 			frames = plugin->dst_frames(plugin, frames);
 			if (frames < 0)
 				return frames;
 		}
-		if (check_size && frames > plugin->buf_frames)
-			frames = plugin->buf_frames;
 		plugin = plugin_next;
 	}
 	return frames;
@@ -225,14 +226,15 @@ static snd_pcm_sframes_t calc_src_frames(struct snd_pcm_substream *plug,
 
 	plugin = snd_pcm_plug_last(plug);
 	while (plugin && frames > 0) {
-		if (check_size && frames > plugin->buf_frames)
-			frames = plugin->buf_frames;
 		plugin_prev = plugin->prev;
 		if (plugin->src_frames) {
 			frames = plugin->src_frames(plugin, frames);
 			if (frames < 0)
 				return frames;
 		}
+		if (check_size && plugin->buf_frames &&
+		    frames > plugin->buf_frames)
+			frames = plugin->buf_frames;
 		plugin = plugin_prev;
 	}
 	return frames;
-- 
2.16.4

