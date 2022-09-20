Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 043F15BE4A2
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 13:40:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EC65868;
	Tue, 20 Sep 2022 13:39:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EC65868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663674037;
	bh=E4DU9rmdf0UwYK59Y3Eub9h1qrmrhC+cy2HTPK1HIdI=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pmjw6I0+hzNe7llatB08uTp9LLqzhkg/7YRrXGMyUoJgCY8nn/3h4NuL6S/e/1qaX
	 PwB8M86GJblyLVHtaaZeyQ92wmrBr6DR8Epzht3JG1p6l9iYa6ZtQMCdhDHQLIa2fd
	 37iyibzt9t1fLAS2B50/3xcdrbdvv26lR9kRwrAQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13394F80171;
	Tue, 20 Sep 2022 13:39:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC97FF800F2; Tue, 20 Sep 2022 13:39:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C44D1F800F2
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 13:39:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C44D1F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="VIB5ECv0"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="FGXqXcxL"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CC0071F37C;
 Tue, 20 Sep 2022 11:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663673971; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=1bouYJbiKCD/MxlqadFMA+8pWULiX1aAoCLc3hDUsOI=;
 b=VIB5ECv0iY6SxjgBaxb8RS+Xhrw1egsXh6vRQiJYTLwnCiKAaeGZH31TSCqNb7TbuskyEb
 K5X/EvhMIJgcBteOJ6Stwyinlh2vqSuH9fqIj5EO/zSEKZE/s+zVcyZ8F3+gZCfngkPqb/
 g5jqqypOyKFIsv493WTB4BnT6qktbO0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663673971;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=1bouYJbiKCD/MxlqadFMA+8pWULiX1aAoCLc3hDUsOI=;
 b=FGXqXcxL8B4LBHj9gjhxavUbzf2iB8pspgL4LZ8hMV5673HM83GYdg3aFUmlO3zo/1Uyj4
 BCq1/oprmTffUdAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AB0741346B;
 Tue, 20 Sep 2022 11:39:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3ZgfKXOmKWN2QgAAMHmgww
 (envelope-from <tiwai@suse.de>); Tue, 20 Sep 2022 11:39:31 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] Revert "ALSA: usb-audio: Split endpoint setups for hw_params
 and prepare"
Date: Tue, 20 Sep 2022 13:39:29 +0200
Message-Id: <20220920113929.25162-1-tiwai@suse.de>
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

This reverts commit ff878b408a03bef5d610b7e2302702e16a53636e.

Unfortunately the recent fix seems bringing another regressions with
PulseAudio / pipewire, at least for Steinberg and MOTU devices.

As a temporary solution, do a straight revert.  The issue for Android
will be revisited again later by another different fix (if any).

Fixes: ff878b408a03 ("ALSA: usb-audio: Split endpoint setups for hw_params and prepare")
Cc: <stable@vger.kernel.org>
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=216500
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/endpoint.c | 23 ++++++++++++++---------
 sound/usb/endpoint.h |  6 ++----
 sound/usb/pcm.c      | 14 ++++----------
 3 files changed, 20 insertions(+), 23 deletions(-)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 8c8f9a851f89..eb71df9da831 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -758,8 +758,7 @@ bool snd_usb_endpoint_compatible(struct snd_usb_audio *chip,
  * The endpoint needs to be closed via snd_usb_endpoint_close() later.
  *
  * Note that this function doesn't configure the endpoint.  The substream
- * needs to set it up later via snd_usb_endpoint_set_params() and
- * snd_usb_endpoint_prepare().
+ * needs to set it up later via snd_usb_endpoint_configure().
  */
 struct snd_usb_endpoint *
 snd_usb_endpoint_open(struct snd_usb_audio *chip,
@@ -1293,13 +1292,12 @@ static int sync_ep_set_params(struct snd_usb_endpoint *ep)
 /*
  * snd_usb_endpoint_set_params: configure an snd_usb_endpoint
  *
- * It's called either from hw_params callback.
  * Determine the number of URBs to be used on this endpoint.
  * An endpoint must be configured before it can be started.
  * An endpoint that is already running can not be reconfigured.
  */
-int snd_usb_endpoint_set_params(struct snd_usb_audio *chip,
-				struct snd_usb_endpoint *ep)
+static int snd_usb_endpoint_set_params(struct snd_usb_audio *chip,
+				       struct snd_usb_endpoint *ep)
 {
 	const struct audioformat *fmt = ep->cur_audiofmt;
 	int err;
@@ -1382,18 +1380,18 @@ static int init_sample_rate(struct snd_usb_audio *chip,
 }
 
 /*
- * snd_usb_endpoint_prepare: Prepare the endpoint
+ * snd_usb_endpoint_configure: Configure the endpoint
  *
  * This function sets up the EP to be fully usable state.
- * It's called either from prepare callback.
+ * It's called either from hw_params or prepare callback.
  * The function checks need_setup flag, and performs nothing unless needed,
  * so it's safe to call this multiple times.
  *
  * This returns zero if unchanged, 1 if the configuration has changed,
  * or a negative error code.
  */
-int snd_usb_endpoint_prepare(struct snd_usb_audio *chip,
-			     struct snd_usb_endpoint *ep)
+int snd_usb_endpoint_configure(struct snd_usb_audio *chip,
+			       struct snd_usb_endpoint *ep)
 {
 	bool iface_first;
 	int err = 0;
@@ -1414,6 +1412,9 @@ int snd_usb_endpoint_prepare(struct snd_usb_audio *chip,
 			if (err < 0)
 				goto unlock;
 		}
+		err = snd_usb_endpoint_set_params(chip, ep);
+		if (err < 0)
+			goto unlock;
 		goto done;
 	}
 
@@ -1441,6 +1442,10 @@ int snd_usb_endpoint_prepare(struct snd_usb_audio *chip,
 	if (err < 0)
 		goto unlock;
 
+	err = snd_usb_endpoint_set_params(chip, ep);
+	if (err < 0)
+		goto unlock;
+
 	err = snd_usb_select_mode_quirk(chip, ep->cur_audiofmt);
 	if (err < 0)
 		goto unlock;
diff --git a/sound/usb/endpoint.h b/sound/usb/endpoint.h
index e67ea28faa54..6a9af04cf175 100644
--- a/sound/usb/endpoint.h
+++ b/sound/usb/endpoint.h
@@ -17,10 +17,8 @@ snd_usb_endpoint_open(struct snd_usb_audio *chip,
 		      bool is_sync_ep);
 void snd_usb_endpoint_close(struct snd_usb_audio *chip,
 			    struct snd_usb_endpoint *ep);
-int snd_usb_endpoint_set_params(struct snd_usb_audio *chip,
-				struct snd_usb_endpoint *ep);
-int snd_usb_endpoint_prepare(struct snd_usb_audio *chip,
-			     struct snd_usb_endpoint *ep);
+int snd_usb_endpoint_configure(struct snd_usb_audio *chip,
+			       struct snd_usb_endpoint *ep);
 int snd_usb_endpoint_get_clock_rate(struct snd_usb_audio *chip, int clock);
 
 bool snd_usb_endpoint_compatible(struct snd_usb_audio *chip,
diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index b604f7e95e82..d45d1d7e6664 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -443,17 +443,17 @@ static int configure_endpoints(struct snd_usb_audio *chip,
 		if (stop_endpoints(subs, false))
 			sync_pending_stops(subs);
 		if (subs->sync_endpoint) {
-			err = snd_usb_endpoint_prepare(chip, subs->sync_endpoint);
+			err = snd_usb_endpoint_configure(chip, subs->sync_endpoint);
 			if (err < 0)
 				return err;
 		}
-		err = snd_usb_endpoint_prepare(chip, subs->data_endpoint);
+		err = snd_usb_endpoint_configure(chip, subs->data_endpoint);
 		if (err < 0)
 			return err;
 		snd_usb_set_format_quirk(subs, subs->cur_audiofmt);
 	} else {
 		if (subs->sync_endpoint) {
-			err = snd_usb_endpoint_prepare(chip, subs->sync_endpoint);
+			err = snd_usb_endpoint_configure(chip, subs->sync_endpoint);
 			if (err < 0)
 				return err;
 		}
@@ -551,13 +551,7 @@ static int snd_usb_hw_params(struct snd_pcm_substream *substream,
 	subs->cur_audiofmt = fmt;
 	mutex_unlock(&chip->mutex);
 
-	if (subs->sync_endpoint) {
-		ret = snd_usb_endpoint_set_params(chip, subs->sync_endpoint);
-		if (ret < 0)
-			goto unlock;
-	}
-
-	ret = snd_usb_endpoint_set_params(chip, subs->data_endpoint);
+	ret = configure_endpoints(chip, subs);
 
  unlock:
 	if (ret < 0)
-- 
2.35.3

