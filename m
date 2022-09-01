Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D7A5A9713
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Sep 2022 14:42:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED1AB161E;
	Thu,  1 Sep 2022 14:42:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED1AB161E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662036171;
	bh=xjkTf7dn8IU0BWwTlUk+Ol7f/mnYjZcrAHIs45ah0m0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KERBxU6pX0SJDgoUOT2MsZ3UcPwDKY/y/7PyIM/abhzwRlmooA0fLqd9AAtHQ47fl
	 qmjUdi+FvEgAyRmBZSKQ/HI0FtyVxYLMUG7M4UvtcDCG4KVe4N+wzM64HJ2AVqw21i
	 NY1kEzcwvank+Jcpo8msPCpClEfDM5fFg1TuX4v8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52358F804A9;
	Thu,  1 Sep 2022 14:41:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D480DF8026D; Thu,  1 Sep 2022 14:41:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF8DFF80236
 for <alsa-devel@alsa-project.org>; Thu,  1 Sep 2022 14:41:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF8DFF80236
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="igkd/hvD"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="EgMztJw3"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 063782283F;
 Thu,  1 Sep 2022 12:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662036101; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=anMd1JfxHMUnbsishSvc8claxn4o1Dk6oeV2IogFwS0=;
 b=igkd/hvDAvJYXW3XcbzutoMWc8pjXBgLDnWvvgjJ2vMzdZ3J998q89jhUJjesAstpK+bE5
 8wlsqFdWM2QdDx36CfHjZwIhpNuptDyBD4wUYtW2876KmlZNC5TP4hg/d7Q66KiwPj7Es5
 3GKr3wb8PID2AMo0OrocZERP2oHoM2E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662036101;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=anMd1JfxHMUnbsishSvc8claxn4o1Dk6oeV2IogFwS0=;
 b=EgMztJw35w4XiIzkFnI/HbouDSgKoFUjnKr1cfn/TeuEo4MowaOQ1hShRIl7Vdsdf+MskK
 bd5uY7cQ5yQCnCBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DC7AC13A89;
 Thu,  1 Sep 2022 12:41:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id S3kcNYSoEGP+KgAAMHmgww
 (envelope-from <tiwai@suse.de>); Thu, 01 Sep 2022 12:41:40 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Split endpoint setups for hw_params and
 prepare
Date: Thu,  1 Sep 2022 14:41:36 +0200
Message-Id: <20220901124136.4984-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: chihhao chen <chihhao.chen@mediatek.com>
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

One of the former changes for the endpoint management was the more
consistent setup of endpoints at hw_params.
snd_usb_endpoint_configure() is a single function that does the full
setup, and it's called from both PCM hw_params and prepare callbacks.
Although the EP setup at the prepare phase is usually skipped (by
checking need_setup flag), it may be still effective in some cases
like suspend/resume that requires the interface setup again.

As it's a full and single setup, the invocation of
snd_usb_endpoint_configure() includes not only the USB interface setup
but also the buffer release and allocation.  OTOH, doing the buffer
release and re-allocation at PCM prepare phase is rather superfluous,
and better to be done only in the hw_params phase.

For those optimizations, this patch splits the endpoint setup to two
phases: snd_usb_endpoint_set_params() and snd_usb_endpoint_prepare(),
to be called from hw_params and from prepare, respectively.

Note that this patch changes the driver operation slightly,
effectively moving the USB interface setup again to PCM prepare stage
instead of hw_params stage, while the buffer allocation and such
initializations are still done at hw_params stage.

And, the change of the USB interface setup timing (moving to prepare)
gave an interesting "fix", too: it was reported that the recent
kernels caused silent output at the beginning on playbacks on some
devices on Android, and this change casually fixed the regression.
It seems that those devices are picky about the sample rate change (or
the interface change?), and don't follow the too immediate rate
changes.

Meanwhile, Android operates the PCM in the following order:
- open, then hw_params with the possibly highest sample rate
- close without prepare
- re-open, hw_params with the normal sample rate
- prepare, and start streaming
This procedure ended up the hw_params twice with different rates, and
because the recent kernel did set up the sample rate twice one and
after, it screwed up the device.  OTOH, the earlier kernels didn't set
up the USB interface at hw_params, hence this problem didn't appear.

Now, with this patch, the USB interface setup is again back to the
prepare phase, and it works around the problem automagically.
Although we should address the sample rate problem in a more solid
way in future, let's keep things working as before for now.

Fixes: bf6313a0ff76 ("ALSA: usb-audio: Refactor endpoint management")
Cc: <stable@vger.kernel.org>
Reported-by: chihhao chen <chihhao.chen@mediatek.com>
Link: https://lore.kernel.org/r/87e6d6ae69d68dc588ac9acc8c0f24d6188375c3.camel@mediatek.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/endpoint.c | 23 +++++++++--------------
 sound/usb/endpoint.h |  6 ++++--
 sound/usb/pcm.c      | 14 ++++++++++----
 3 files changed, 23 insertions(+), 20 deletions(-)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 0d7b73bf7945..a42f2ce19455 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -758,7 +758,8 @@ bool snd_usb_endpoint_compatible(struct snd_usb_audio *chip,
  * The endpoint needs to be closed via snd_usb_endpoint_close() later.
  *
  * Note that this function doesn't configure the endpoint.  The substream
- * needs to set it up later via snd_usb_endpoint_configure().
+ * needs to set it up later via snd_usb_endpoint_set_params() and
+ * snd_usb_endpoint_prepare().
  */
 struct snd_usb_endpoint *
 snd_usb_endpoint_open(struct snd_usb_audio *chip,
@@ -1290,12 +1291,13 @@ static int sync_ep_set_params(struct snd_usb_endpoint *ep)
 /*
  * snd_usb_endpoint_set_params: configure an snd_usb_endpoint
  *
+ * It's called either from hw_params callback.
  * Determine the number of URBs to be used on this endpoint.
  * An endpoint must be configured before it can be started.
  * An endpoint that is already running can not be reconfigured.
  */
-static int snd_usb_endpoint_set_params(struct snd_usb_audio *chip,
-				       struct snd_usb_endpoint *ep)
+int snd_usb_endpoint_set_params(struct snd_usb_audio *chip,
+				struct snd_usb_endpoint *ep)
 {
 	const struct audioformat *fmt = ep->cur_audiofmt;
 	int err;
@@ -1378,18 +1380,18 @@ static int init_sample_rate(struct snd_usb_audio *chip,
 }
 
 /*
- * snd_usb_endpoint_configure: Configure the endpoint
+ * snd_usb_endpoint_prepare: Prepare the endpoint
  *
  * This function sets up the EP to be fully usable state.
- * It's called either from hw_params or prepare callback.
+ * It's called either from prepare callback.
  * The function checks need_setup flag, and performs nothing unless needed,
  * so it's safe to call this multiple times.
  *
  * This returns zero if unchanged, 1 if the configuration has changed,
  * or a negative error code.
  */
-int snd_usb_endpoint_configure(struct snd_usb_audio *chip,
-			       struct snd_usb_endpoint *ep)
+int snd_usb_endpoint_prepare(struct snd_usb_audio *chip,
+			     struct snd_usb_endpoint *ep)
 {
 	bool iface_first;
 	int err = 0;
@@ -1410,9 +1412,6 @@ int snd_usb_endpoint_configure(struct snd_usb_audio *chip,
 			if (err < 0)
 				goto unlock;
 		}
-		err = snd_usb_endpoint_set_params(chip, ep);
-		if (err < 0)
-			goto unlock;
 		goto done;
 	}
 
@@ -1440,10 +1439,6 @@ int snd_usb_endpoint_configure(struct snd_usb_audio *chip,
 	if (err < 0)
 		goto unlock;
 
-	err = snd_usb_endpoint_set_params(chip, ep);
-	if (err < 0)
-		goto unlock;
-
 	err = snd_usb_select_mode_quirk(chip, ep->cur_audiofmt);
 	if (err < 0)
 		goto unlock;
diff --git a/sound/usb/endpoint.h b/sound/usb/endpoint.h
index 6a9af04cf175..e67ea28faa54 100644
--- a/sound/usb/endpoint.h
+++ b/sound/usb/endpoint.h
@@ -17,8 +17,10 @@ snd_usb_endpoint_open(struct snd_usb_audio *chip,
 		      bool is_sync_ep);
 void snd_usb_endpoint_close(struct snd_usb_audio *chip,
 			    struct snd_usb_endpoint *ep);
-int snd_usb_endpoint_configure(struct snd_usb_audio *chip,
-			       struct snd_usb_endpoint *ep);
+int snd_usb_endpoint_set_params(struct snd_usb_audio *chip,
+				struct snd_usb_endpoint *ep);
+int snd_usb_endpoint_prepare(struct snd_usb_audio *chip,
+			     struct snd_usb_endpoint *ep);
 int snd_usb_endpoint_get_clock_rate(struct snd_usb_audio *chip, int clock);
 
 bool snd_usb_endpoint_compatible(struct snd_usb_audio *chip,
diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index d45d1d7e6664..b604f7e95e82 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -443,17 +443,17 @@ static int configure_endpoints(struct snd_usb_audio *chip,
 		if (stop_endpoints(subs, false))
 			sync_pending_stops(subs);
 		if (subs->sync_endpoint) {
-			err = snd_usb_endpoint_configure(chip, subs->sync_endpoint);
+			err = snd_usb_endpoint_prepare(chip, subs->sync_endpoint);
 			if (err < 0)
 				return err;
 		}
-		err = snd_usb_endpoint_configure(chip, subs->data_endpoint);
+		err = snd_usb_endpoint_prepare(chip, subs->data_endpoint);
 		if (err < 0)
 			return err;
 		snd_usb_set_format_quirk(subs, subs->cur_audiofmt);
 	} else {
 		if (subs->sync_endpoint) {
-			err = snd_usb_endpoint_configure(chip, subs->sync_endpoint);
+			err = snd_usb_endpoint_prepare(chip, subs->sync_endpoint);
 			if (err < 0)
 				return err;
 		}
@@ -551,7 +551,13 @@ static int snd_usb_hw_params(struct snd_pcm_substream *substream,
 	subs->cur_audiofmt = fmt;
 	mutex_unlock(&chip->mutex);
 
-	ret = configure_endpoints(chip, subs);
+	if (subs->sync_endpoint) {
+		ret = snd_usb_endpoint_set_params(chip, subs->sync_endpoint);
+		if (ret < 0)
+			goto unlock;
+	}
+
+	ret = snd_usb_endpoint_set_params(chip, subs->data_endpoint);
 
  unlock:
 	if (ret < 0)
-- 
2.35.3

