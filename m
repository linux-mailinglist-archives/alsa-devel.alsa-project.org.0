Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F71456D3C
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Nov 2021 11:26:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBB4B17B5;
	Fri, 19 Nov 2021 11:25:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBB4B17B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637317592;
	bh=shGuYCgxzeZCDTdeYw8YFul2cIp4PlkuLHml7Orzsdg=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=J26MsxVxef4IPvb+ZWkfHMEsYlMy7jnJjylxzWOtW5n+G5+qi8LmKZW+iGWLGMpG2
	 h5cV80Cf0s4Z471jsPPeCxEyVkR+kIIvSD62bqGrjs0fncTTcqA1jWfgj9rqcLe6Qw
	 EjIyzJDxeOWBoGy0jhdX34/VXhNJStyIE/e/uOVs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1182EF8026D;
	Fri, 19 Nov 2021 11:25:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AAF59F80217; Fri, 19 Nov 2021 11:25:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B97A8F80115
 for <alsa-devel@alsa-project.org>; Fri, 19 Nov 2021 11:25:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B97A8F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="GatAuDwk"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="MWTa8kMj"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 9226B212C8
 for <alsa-devel@alsa-project.org>; Fri, 19 Nov 2021 10:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1637317500; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=JEASyue1Hs2VOsGsJyxj1Owb37mpgHPZtKOrXgBfHVs=;
 b=GatAuDwk364P3SNEnKKu4UFzvdxPypy3VphNvUSaDnPv1o5CKhDSUkhYZjKq7POGFwxJQf
 QVpC64rE/PZiifNZGWEUGh5Jco5rsVv+3ipPCN5BRNUTI8YVVuSV7IZbH0r8HN9VyqORU3
 VDhRGTtgjrwVhEzVg4Zpy+K2skqjNBk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1637317500;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=JEASyue1Hs2VOsGsJyxj1Owb37mpgHPZtKOrXgBfHVs=;
 b=MWTa8kMjo9V7c0NU+BQPrs0bp1yW1uYaw7wgNwLmi3Ji5pOeUItSADCwGAoPuWiNlWYs0o
 /unZNoQyEs6msXDg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 83470A3B88;
 Fri, 19 Nov 2021 10:25:00 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Switch back to non-latency mode at a later
 point
Date: Fri, 19 Nov 2021 11:24:59 +0100
Message-Id: <20211119102459.7055-1-tiwai@suse.de>
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

The recent regression report revealed that the judgment of the
low-latency playback mode based on the runtime->stop_threshold cannot
work reliably at the prepare stage, as sw_params call may happen at
any time, and PCM dmix actually sets it up after the prepare call.
This ended up with the stall of the stream as PCM ack won't be issued
at all.

For addressing this, check the free-wheeling mode again at the PCM
trigger right before starting the stream again, and allow switching to
the non-LL mode at a late stage.

Fixes: d5f871f89e21 ("ALSA: usb-audio: Improved lowlatency playback support")
Reported-and-tested-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Link: https://lore.kernel.org/r/20211117161855.m45mxcqszkfcetai@box.shutemov.name
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/pcm.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 95ec8eec1bb0..57b046e73bfe 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -581,6 +581,12 @@ static int snd_usb_hw_free(struct snd_pcm_substream *substream)
 	return 0;
 }
 
+/* free-wheeling mode? (e.g. dmix) */
+static int in_free_wheeling_mode(struct snd_pcm_runtime *runtime)
+{
+	return runtime->stop_threshold > runtime->buffer_size;
+}
+
 /* check whether early start is needed for playback stream */
 static int lowlatency_playback_available(struct snd_pcm_runtime *runtime,
 					 struct snd_usb_substream *subs)
@@ -592,8 +598,7 @@ static int lowlatency_playback_available(struct snd_pcm_runtime *runtime,
 	/* disabled via module option? */
 	if (!chip->lowlatency)
 		return false;
-	/* free-wheeling mode? (e.g. dmix) */
-	if (runtime->stop_threshold > runtime->buffer_size)
+	if (in_free_wheeling_mode(runtime))
 		return false;
 	/* implicit feedback mode has own operation mode */
 	if (snd_usb_endpoint_implicit_feedback_sink(subs->data_endpoint))
@@ -1552,6 +1557,8 @@ static int snd_usb_substream_playback_trigger(struct snd_pcm_substream *substrea
 					      subs);
 		if (subs->lowlatency_playback &&
 		    cmd == SNDRV_PCM_TRIGGER_START) {
+			if (in_free_wheeling_mode(substream->runtime))
+				subs->lowlatency_playback = false;
 			err = start_endpoints(subs);
 			if (err < 0) {
 				snd_usb_endpoint_set_callback(subs->data_endpoint,
-- 
2.26.2

