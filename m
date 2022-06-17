Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE29E54F966
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 16:43:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 858841F30;
	Fri, 17 Jun 2022 16:42:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 858841F30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655476985;
	bh=KkSG8jfv+A9V+0FZyICfVVg0r7OslGBoe4CrJK3IZcs=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pSYP7o8DpzH94wU+em3/JXETns52Rn/Yi5KAg0JrX+mVgpjTS1i50P3DmKRe5fLbP
	 AB+J/fBdzn5ehWj4AL10T5b+PNjtzYL1Oip0G5+eH9HBWF8vwMKb+GZXlV5OOHOX8E
	 cztBNM/tOoHa9PulenJOSGco8wRfzQJ43XMOk6fE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1D9FF8053E;
	Fri, 17 Jun 2022 16:41:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11545F8051F; Fri, 17 Jun 2022 16:41:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DF0FF80527
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 16:40:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DF0FF80527
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="q1RQ5NsK"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="V8/sUykW"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9B2D51F86A;
 Fri, 17 Jun 2022 14:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655476855; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AkzZQqMh8x4VvR3VWwn+xRTRi6wjnFn9VRQM3WzdECc=;
 b=q1RQ5NsKtnVM7YkyRyZ0zvle2lHel1j5Kdvfb6AXnEcHB9YD9m4BZqNOxgOlwOLDGz5qvn
 1CQnzVbHhr/OKuSK86N1nBU4ZrmOdGtt0BTO8YLu8qgyS0MMjd6cjwjHVBGKFvI+RJwer6
 0gHwzoFiI4qhv+yFHb9PwwPgrVpRBBs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655476855;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AkzZQqMh8x4VvR3VWwn+xRTRi6wjnFn9VRQM3WzdECc=;
 b=V8/sUykWqlCwlur1fF7fBpyBSCs9We4P2916GVcAi2dDRnY5VfN2XwUA266ll9lPvL8JvC
 AIl3xo3DTsYotcAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7EE561348F;
 Fri, 17 Jun 2022 14:40:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ELIaHneSrGIYNQAAMHmgww
 (envelope-from <tiwai@suse.de>); Fri, 17 Jun 2022 14:40:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/5] ALSA: rawmidi: Make internal functions local static
Date: Fri, 17 Jun 2022 16:40:47 +0200
Message-Id: <20220617144051.18985-2-tiwai@suse.de>
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

__snd_rawmidi_transmit_peek() and __snd_rawmidi_transmit_ack() are
never called from the outside.  Let's make them local static and
unexport them.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/rawmidi.h |  4 ----
 sound/core/rawmidi.c    | 13 ++++++-------
 2 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/include/sound/rawmidi.h b/include/sound/rawmidi.h
index 7a08ed2acd60..9402c25ae9ba 100644
--- a/include/sound/rawmidi.h
+++ b/include/sound/rawmidi.h
@@ -156,10 +156,6 @@ int snd_rawmidi_transmit_peek(struct snd_rawmidi_substream *substream,
 int snd_rawmidi_transmit_ack(struct snd_rawmidi_substream *substream, int count);
 int snd_rawmidi_transmit(struct snd_rawmidi_substream *substream,
 			 unsigned char *buffer, int count);
-int __snd_rawmidi_transmit_peek(struct snd_rawmidi_substream *substream,
-			      unsigned char *buffer, int count);
-int __snd_rawmidi_transmit_ack(struct snd_rawmidi_substream *substream,
-			       int count);
 int snd_rawmidi_proceed(struct snd_rawmidi_substream *substream);
 
 /* main midi functions */
diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index befa9809ff00..82e8f656bbb2 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -1258,7 +1258,7 @@ int snd_rawmidi_transmit_empty(struct snd_rawmidi_substream *substream)
 }
 EXPORT_SYMBOL(snd_rawmidi_transmit_empty);
 
-/**
+/*
  * __snd_rawmidi_transmit_peek - copy data from the internal buffer
  * @substream: the rawmidi substream
  * @buffer: the buffer pointer
@@ -1266,8 +1266,8 @@ EXPORT_SYMBOL(snd_rawmidi_transmit_empty);
  *
  * This is a variant of snd_rawmidi_transmit_peek() without spinlock.
  */
-int __snd_rawmidi_transmit_peek(struct snd_rawmidi_substream *substream,
-			      unsigned char *buffer, int count)
+static int __snd_rawmidi_transmit_peek(struct snd_rawmidi_substream *substream,
+				       unsigned char *buffer, int count)
 {
 	int result, count1;
 	struct snd_rawmidi_runtime *runtime = substream->runtime;
@@ -1304,7 +1304,6 @@ int __snd_rawmidi_transmit_peek(struct snd_rawmidi_substream *substream,
       __skip:
 	return result;
 }
-EXPORT_SYMBOL(__snd_rawmidi_transmit_peek);
 
 /**
  * snd_rawmidi_transmit_peek - copy data from the internal buffer
@@ -1334,14 +1333,15 @@ int snd_rawmidi_transmit_peek(struct snd_rawmidi_substream *substream,
 }
 EXPORT_SYMBOL(snd_rawmidi_transmit_peek);
 
-/**
+/*
  * __snd_rawmidi_transmit_ack - acknowledge the transmission
  * @substream: the rawmidi substream
  * @count: the transferred count
  *
  * This is a variant of __snd_rawmidi_transmit_ack() without spinlock.
  */
-int __snd_rawmidi_transmit_ack(struct snd_rawmidi_substream *substream, int count)
+static int __snd_rawmidi_transmit_ack(struct snd_rawmidi_substream *substream,
+				      int count)
 {
 	struct snd_rawmidi_runtime *runtime = substream->runtime;
 
@@ -1361,7 +1361,6 @@ int __snd_rawmidi_transmit_ack(struct snd_rawmidi_substream *substream, int coun
 	}
 	return count;
 }
-EXPORT_SYMBOL(__snd_rawmidi_transmit_ack);
 
 /**
  * snd_rawmidi_transmit_ack - acknowledge the transmission
-- 
2.35.3

