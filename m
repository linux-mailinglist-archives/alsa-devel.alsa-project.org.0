Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1441A54F968
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 16:43:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5D8E1F2A;
	Fri, 17 Jun 2022 16:42:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5D8E1F2A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655477015;
	bh=6FbQ7PW9Q483W5AN1WuaGpYW/4PbXpaDvI0o57mZffk=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dJC3gmTWCkVl53S97ekRhf4++1/m8MGzw45TuZPzGruWiz6R9atTLWzbOUvlaD77s
	 0mf1mkdsMiPM41NIYxJC9xPM4rfOZUm6C2oyX1DYO+8iyjk7Kpcc1d4/O2jFbauHWu
	 TkLyiUwIl8hpyjqzvj2VuwoVQGPR2jMrrLF4PDbw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06F5EF80552;
	Fri, 17 Jun 2022 16:41:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB0B1F8053D; Fri, 17 Jun 2022 16:41:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D6AAF80529
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 16:40:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D6AAF80529
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="PXcEHhuL"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="U4V8tweL"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1A8DD21E47;
 Fri, 17 Jun 2022 14:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655476856; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e1tGlwoq7AuYV3LO3lbinxAjnWguF1m2X35r3UPl2Ng=;
 b=PXcEHhuLkV6TwBsKApUzFgtQX/mFni+xY6yrN5hVT6bRv2lGGmoFq14DkNT1kiF5PNXbEV
 Lels0Qn4RK9ZX7xnezE126WydVq7BhH60+ae60ct0h+jl+buDHVIKwl9u7YwskhG4APinF
 U1ymyBNzzY/GxQePG/rOQmDpjvTLfI4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655476856;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e1tGlwoq7AuYV3LO3lbinxAjnWguF1m2X35r3UPl2Ng=;
 b=U4V8tweL6qvWJruyULwSVqJpVDFbVt+SAc6o1g2ORVd9zJuqhSnbyBNHqI8lMnE7EhM8zg
 W+JxlqZNAHS0tsAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 02A621348F;
 Fri, 17 Jun 2022 14:40:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sPFeO3eSrGIYNQAAMHmgww
 (envelope-from <tiwai@suse.de>); Fri, 17 Jun 2022 14:40:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/5] ALSA: rawmidi: Take buffer refcount while draining output
Date: Fri, 17 Jun 2022 16:40:51 +0200
Message-Id: <20220617144051.18985-6-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220617144051.18985-1-tiwai@suse.de>
References: <20220617144051.18985-1-tiwai@suse.de>
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

Although snd_rawmidi_drain_output() may take some long time, it has no
protection and intrusive operations like the buffer resize may happen
meanwhile.  For making the operation a bit more robust, this patch
takes the buffer refcount for blocking the buffer resize.

Also, as this function is exported, in theory, it might be called
asynchronously from the stream open/close state.  For avoiding the
missing refcount, now the close call checks the buffer refcount, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/rawmidi.c | 45 ++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 41 insertions(+), 4 deletions(-)

diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index 889fa4747dad..6963d5a487b3 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -140,6 +140,23 @@ static inline void snd_rawmidi_buffer_unref(struct snd_rawmidi_runtime *runtime)
 	runtime->buffer_ref--;
 }
 
+static void snd_rawmidi_buffer_ref_sync(struct snd_rawmidi_substream *substream)
+{
+	int loop = HZ;
+
+	spin_lock_irq(&substream->lock);
+	while (substream->runtime->buffer_ref) {
+		spin_unlock_irq(&substream->lock);
+		if (!--loop) {
+			rmidi_err(substream->rmidi, "Buffer ref sync timeout\n");
+			return;
+		}
+		schedule_timeout_uninterruptible(1);
+		spin_lock_irq(&substream->lock);
+	}
+	spin_unlock_irq(&substream->lock);
+}
+
 static int snd_rawmidi_runtime_create(struct snd_rawmidi_substream *substream)
 {
 	struct snd_rawmidi_runtime *runtime;
@@ -222,15 +239,27 @@ EXPORT_SYMBOL(snd_rawmidi_drop_output);
 
 int snd_rawmidi_drain_output(struct snd_rawmidi_substream *substream)
 {
-	int err;
+	int err = 0;
 	long timeout;
-	struct snd_rawmidi_runtime *runtime = substream->runtime;
+	struct snd_rawmidi_runtime *runtime;
+
+	spin_lock_irq(&substream->lock);
+	runtime = substream->runtime;
+	if (!substream->opened || !runtime || !runtime->buffer) {
+		err = -EINVAL;
+	} else {
+		snd_rawmidi_buffer_ref(runtime);
+		runtime->drain = 1;
+	}
+	spin_unlock_irq(&substream->lock);
+	if (err < 0)
+		return err;
 
-	err = 0;
-	runtime->drain = 1;
 	timeout = wait_event_interruptible_timeout(runtime->sleep,
 				(runtime->avail >= runtime->buffer_size),
 				10*HZ);
+
+	spin_lock_irq(&substream->lock);
 	if (signal_pending(current))
 		err = -ERESTARTSYS;
 	if (runtime->avail < runtime->buffer_size && !timeout) {
@@ -240,6 +269,8 @@ int snd_rawmidi_drain_output(struct snd_rawmidi_substream *substream)
 		err = -EIO;
 	}
 	runtime->drain = 0;
+	spin_unlock_irq(&substream->lock);
+
 	if (err != -ERESTARTSYS) {
 		/* we need wait a while to make sure that Tx FIFOs are empty */
 		if (substream->ops->drain)
@@ -248,6 +279,11 @@ int snd_rawmidi_drain_output(struct snd_rawmidi_substream *substream)
 			msleep(50);
 		snd_rawmidi_drop_output(substream);
 	}
+
+	spin_lock_irq(&substream->lock);
+	snd_rawmidi_buffer_unref(runtime);
+	spin_unlock_irq(&substream->lock);
+
 	return err;
 }
 EXPORT_SYMBOL(snd_rawmidi_drain_output);
@@ -522,6 +558,7 @@ static void close_substream(struct snd_rawmidi *rmidi,
 			if (snd_rawmidi_drain_output(substream) == -ERESTARTSYS)
 				snd_rawmidi_output_trigger(substream, 0);
 		}
+		snd_rawmidi_buffer_ref_sync(substream);
 	}
 	spin_lock_irq(&substream->lock);
 	substream->opened = 0;
-- 
2.35.3

