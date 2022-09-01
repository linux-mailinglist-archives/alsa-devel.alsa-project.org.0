Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 195385A981A
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Sep 2022 15:09:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93BCC1638;
	Thu,  1 Sep 2022 15:08:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93BCC1638
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662037786;
	bh=YA2std7gZFufzanM1kYVA0lUwYLrfgMBOx+tLsMzkv0=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UvtNJnXXAHszm7KD6P40+PYy/Wnel82cj065qgKHAlpdLci17dGHyxnMi2Wm52Hdk
	 YRRR44AR+ciuON9nevOlJMtw8K9BxB3Gg3KX4/gAbhD24qvPybw4MWBEvhReZBIRbp
	 gHbF17kXt8JNTqp3mY1XwN/dABYZmR5PSTn5uFZs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01A47F800EB;
	Thu,  1 Sep 2022 15:08:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61489F8026D; Thu,  1 Sep 2022 15:08:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B014F80236
 for <alsa-devel@alsa-project.org>; Thu,  1 Sep 2022 15:08:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B014F80236
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="rldVBPZK"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="ZTEFNBjM"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BA1B020084;
 Thu,  1 Sep 2022 13:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662037712; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=aUI+IV/rMeSKL5JxSOm7Q7gDkY5VA7enX3lbFuxwJ2g=;
 b=rldVBPZKC7gKemABllS57xsOCfHVxXuATnCg8zEpR0QLhomajUJ2JMpkp4Z8LmGxWDX8iF
 WmueFCiBFXwv1pTtt+oCHv7c48mhZ+L/8iAifmVCXmJ6KCD0g3Et7UZEevOLIi+OqE3jjv
 BwcF5bCyjUljWywvdPLLZADFnh0VStE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662037712;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=aUI+IV/rMeSKL5JxSOm7Q7gDkY5VA7enX3lbFuxwJ2g=;
 b=ZTEFNBjM1pFyP0U7L9pY4D/HPtHw8FctCnp6nS+LWuWcrmUAdaUZbXlizGK+UuJ5orR3R1
 pHG6qliBOFTFmbDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A3E5B13A79;
 Thu,  1 Sep 2022 13:08:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CNZmJ9CuEGM4OAAAMHmgww
 (envelope-from <tiwai@suse.de>); Thu, 01 Sep 2022 13:08:32 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Clean up endpoint setups at PCM prepare
Date: Thu,  1 Sep 2022 15:08:31 +0200
Message-Id: <20220901130831.6136-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
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

This patch cleans up the superfluous checks and calls for setting up
the endpoints at PCM prepare callback:

- Drop stop_endpoints() and sync_pending_stops() calls; the stream is
  guaranteed to have been already stopped and synced at each PCM
  prepare call by ALSA PCM core

- Call snd_usb_endpoint_prepare() unconditionally;
  the check for endpoint->need_setup is done in
  snd_pcm_hw_endpoint_prepare() itself

- Apply snd_usb_set_format_quirk() only when the endpoint is actually
  set up (i.e. the return code from snd_usb_endpoint_prepare() > 0)

- Move a few lines back into snd_usb_pcm_prepare();
  it's even easier to follow than a small useless function

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/pcm.c | 40 ++++++++++------------------------------
 1 file changed, 10 insertions(+), 30 deletions(-)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index b604f7e95e82..4ed53a3dc922 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -433,35 +433,6 @@ static void close_endpoints(struct snd_usb_audio *chip,
 	}
 }
 
-static int configure_endpoints(struct snd_usb_audio *chip,
-			       struct snd_usb_substream *subs)
-{
-	int err;
-
-	if (subs->data_endpoint->need_setup) {
-		/* stop any running stream beforehand */
-		if (stop_endpoints(subs, false))
-			sync_pending_stops(subs);
-		if (subs->sync_endpoint) {
-			err = snd_usb_endpoint_prepare(chip, subs->sync_endpoint);
-			if (err < 0)
-				return err;
-		}
-		err = snd_usb_endpoint_prepare(chip, subs->data_endpoint);
-		if (err < 0)
-			return err;
-		snd_usb_set_format_quirk(subs, subs->cur_audiofmt);
-	} else {
-		if (subs->sync_endpoint) {
-			err = snd_usb_endpoint_prepare(chip, subs->sync_endpoint);
-			if (err < 0)
-				return err;
-		}
-	}
-
-	return 0;
-}
-
 /*
  * hw_params callback
  *
@@ -640,9 +611,18 @@ static int snd_usb_pcm_prepare(struct snd_pcm_substream *substream)
 		goto unlock;
 	}
 
-	ret = configure_endpoints(chip, subs);
+	if (subs->sync_endpoint) {
+		ret = snd_usb_endpoint_prepare(chip, subs->sync_endpoint);
+		if (ret < 0)
+			goto unlock;
+	}
+
+	ret = snd_usb_endpoint_prepare(chip, subs->data_endpoint);
 	if (ret < 0)
 		goto unlock;
+	else if (ret > 0)
+		snd_usb_set_format_quirk(subs, subs->cur_audiofmt);
+	ret = 0;
 
 	/* reset the pointer */
 	subs->buffer_bytes = frames_to_bytes(runtime, runtime->buffer_size);
-- 
2.35.3

