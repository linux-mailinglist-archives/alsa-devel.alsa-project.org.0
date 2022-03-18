Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8404DD606
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Mar 2022 09:23:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC10118AF;
	Fri, 18 Mar 2022 09:22:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC10118AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647591793;
	bh=RgHzapn3ynFHd5Cl+uvf6dkUplC7kHu/RLd0WpbUPyw=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AFkD5orrGoiyHYCl1cMeWhliDjLBDw+Bmc8GIEfDXf6Jc7jndoqZxCPy8OLVRQoiA
	 IIJHK2R1+t81bXN9JGMi8OrOVchLUMuHl8QuGsjsaIlU6VlQDTD8iRdSrZKCMTgPOW
	 VtB24jxvVIS1nGNMrxv1ksTUCm3G6OzMl3vtEFbg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38579F8026D;
	Fri, 18 Mar 2022 09:22:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80184F8026A; Fri, 18 Mar 2022 09:22:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 709A3F80121
 for <alsa-devel@alsa-project.org>; Fri, 18 Mar 2022 09:21:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 709A3F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="LWpuulMz"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="fnJ/SFOe"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 462E9210EA
 for <alsa-devel@alsa-project.org>; Fri, 18 Mar 2022 08:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1647591718; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=uOBd8NZpQqMQv20bvtUsFFAFwue6zpCKUDHui7xNKWY=;
 b=LWpuulMzPsaeHHy9lDSQR6JdpGBinhZscRiAVPnKWv13cw9no7VBTjpTtvCm0zHU4SA1sM
 fiLP4OTaXorfqru01dMxaUXpsL5jqnALlZjvuXfJHxyQ7WjMy1LrM2Y7B4DIong/QQ0fff
 +Y11E6xQJF4KqW4kNtivu837aXimvXM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1647591718;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=uOBd8NZpQqMQv20bvtUsFFAFwue6zpCKUDHui7xNKWY=;
 b=fnJ/SFOeymlQOlfipKHbndZlxxqQILzBEgAMytrB5JiODfGaTUfQvLZxSCf5Y0GBPhm3qi
 QgoSlGXYsUr47GAw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 302A7A3B83;
 Fri, 18 Mar 2022 08:21:58 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: oss: Release temporary buffers upon errors
Date: Fri, 18 Mar 2022 09:21:57 +0100
Message-Id: <20220318082157.29769-1-tiwai@suse.de>
X-Mailer: git-send-email 2.31.1
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

When the parameter changes fails, we don't need to keep the old
temporary buffers.  Release those (and plugin instances) upon errors
for reducing dead memory footprint.  Since we always call it at the
exit of snd_pcm_oss_changes_params_locked(), the explicit calls of
snd_pcm_oss_plugin_clear() can be dropped, too.

Along with it, unify the buffer-free calls to a single helper and call
it from the needed places.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/oss/pcm_oss.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
index f158f0abd25d..90c3a367d7de 100644
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -842,6 +842,17 @@ static void unlock_params(struct snd_pcm_runtime *runtime)
 	mutex_unlock(&runtime->oss.params_lock);
 }
 
+static void snd_pcm_oss_release_buffers(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+
+	kvfree(runtime->oss.buffer);
+	runtime->oss.buffer = NULL;
+#ifdef CONFIG_SND_PCM_OSS_PLUGINS
+	snd_pcm_oss_plugin_clear(substream);
+#endif
+}
+
 /* call with params_lock held */
 static int snd_pcm_oss_change_params_locked(struct snd_pcm_substream *substream)
 {
@@ -972,12 +983,10 @@ static int snd_pcm_oss_change_params_locked(struct snd_pcm_substream *substream)
 	snd_pcm_oss_plugin_clear(substream);
 	if (!direct) {
 		/* add necessary plugins */
-		snd_pcm_oss_plugin_clear(substream);
 		err = snd_pcm_plug_format_plugins(substream, params, sparams);
 		if (err < 0) {
 			pcm_dbg(substream->pcm,
 				"snd_pcm_plug_format_plugins failed: %i\n", err);
-			snd_pcm_oss_plugin_clear(substream);
 			goto failure;
 		}
 		if (runtime->oss.plugin_first) {
@@ -986,7 +995,6 @@ static int snd_pcm_oss_change_params_locked(struct snd_pcm_substream *substream)
 			if (err < 0) {
 				pcm_dbg(substream->pcm,
 					"snd_pcm_plugin_build_io failed: %i\n", err);
-				snd_pcm_oss_plugin_clear(substream);
 				goto failure;
 			}
 			if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
@@ -994,10 +1002,8 @@ static int snd_pcm_oss_change_params_locked(struct snd_pcm_substream *substream)
 			} else {
 				err = snd_pcm_plugin_insert(plugin);
 			}
-			if (err < 0) {
-				snd_pcm_oss_plugin_clear(substream);
+			if (err < 0)
 				goto failure;
-			}
 		}
 	}
 #endif
@@ -1086,6 +1092,8 @@ static int snd_pcm_oss_change_params_locked(struct snd_pcm_substream *substream)
 
 	err = 0;
 failure:
+	if (err)
+		snd_pcm_oss_release_buffers(substream);
 	kfree(sw_params);
 	kfree(params);
 	kfree(sparams);
@@ -2355,13 +2363,7 @@ static void snd_pcm_oss_look_for_setup(struct snd_pcm *pcm, int stream,
 
 static void snd_pcm_oss_release_substream(struct snd_pcm_substream *substream)
 {
-	struct snd_pcm_runtime *runtime;
-	runtime = substream->runtime;
-	kvfree(runtime->oss.buffer);
-	runtime->oss.buffer = NULL;
-#ifdef CONFIG_SND_PCM_OSS_PLUGINS
-	snd_pcm_oss_plugin_clear(substream);
-#endif
+	snd_pcm_oss_release_buffers(substream);
 	substream->oss.oss = 0;
 }
 
-- 
2.34.1

