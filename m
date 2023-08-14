Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DC177B815
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Aug 2023 14:00:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFDE3857;
	Mon, 14 Aug 2023 13:59:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFDE3857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692014402;
	bh=VbMxhcubZiaZvOOq2SgHirLA14niU5dmi+w6ckCrdZs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=anin/n35TCVVESuiOq/0vbKj7AatloHincqbWMA52qbvAXAREuMapgWJ2cFj9XdZE
	 mit1QhiEcCihPy0LKe4v7KEwc7n1f7z0Q+bsXCCRSh88X8qeNfVfNSsx0fLZAy6LNg
	 j55x/WBqjOh5OdFiJPlz2YWvkpAqmyG/sqgqqtrs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90A66F805D3; Mon, 14 Aug 2023 13:57:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BB78AF805C6;
	Mon, 14 Aug 2023 13:57:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 702E5F80536; Mon, 14 Aug 2023 13:56:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9A5A0F80254
	for <alsa-devel@alsa-project.org>; Mon, 14 Aug 2023 13:55:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A5A0F80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=SZSjrG9v;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=SxbC5mE+
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 415F22199B;
	Mon, 14 Aug 2023 11:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692014146;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jfwP6oZUs8EGVLwkqju+PtJRX1CinD3ct3lzUDwZEgk=;
	b=SZSjrG9vuq9kIRCPQTxzwMV05MGcjPpYLVa9Ky4I69ukqgy3eFqGVFAlWGll/hBJQTIJQ+
	cl75/uIZxsaizW7PUa6livgluXpeiTzGp3aSkd9+XwAEHCT9hAyNQ+sUTGX0i8qO4jBlq4
	8JlJjUfT5xa8gRLpitKNThGBaYnoIoQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692014146;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jfwP6oZUs8EGVLwkqju+PtJRX1CinD3ct3lzUDwZEgk=;
	b=SxbC5mE+qcKRiJ2tf77kKljLrAyXh+pXGWxIuBs/iHZedKMt0JIsfkeGToRyka5tDib1m0
	cJaFJFWmkfrKCiAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1BE9F138EE;
	Mon, 14 Aug 2023 11:55:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id OODDBUIW2mRnMAAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 14 Aug 2023 11:55:46 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 05/25] ALSA: gus: Convert to generic PCM copy ops
Date: Mon, 14 Aug 2023 13:55:03 +0200
Message-Id: <20230814115523.15279-6-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230814115523.15279-1-tiwai@suse.de>
References: <20230814115523.15279-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QO5HCS37IDZEQF4DJDCX6JEWTPZB3C5A
X-Message-ID-Hash: QO5HCS37IDZEQF4DJDCX6JEWTPZB3C5A
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QO5HCS37IDZEQF4DJDCX6JEWTPZB3C5A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch converts the GUS driver code to use the new unified PCM
copy callback.  It's a straightforward conversion from *_user() to
*_iter() variants.

Note that copy_from/to_iter() returns the copied bytes, hence the
error condition is inverted from copy_from/to_user().

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/gus/gus_pcm.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/sound/isa/gus/gus_pcm.c b/sound/isa/gus/gus_pcm.c
index 388db5fb65bd..f67b53612d5f 100644
--- a/sound/isa/gus/gus_pcm.c
+++ b/sound/isa/gus/gus_pcm.c
@@ -369,7 +369,7 @@ static int playback_copy_ack(struct snd_pcm_substream *substream,
 
 static int snd_gf1_pcm_playback_copy(struct snd_pcm_substream *substream,
 				     int voice, unsigned long pos,
-				     void __user *src, unsigned long count)
+				     struct iov_iter *src, unsigned long count)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct gus_pcm_private *pcmp = runtime->private_data;
@@ -379,27 +379,11 @@ static int snd_gf1_pcm_playback_copy(struct snd_pcm_substream *substream,
 	bpos = get_bpos(pcmp, voice, pos, len);
 	if (bpos < 0)
 		return pos;
-	if (copy_from_user(runtime->dma_area + bpos, src, len))
+	if (!copy_from_iter(runtime->dma_area + bpos, len, src))
 		return -EFAULT;
 	return playback_copy_ack(substream, bpos, len);
 }
 
-static int snd_gf1_pcm_playback_copy_kernel(struct snd_pcm_substream *substream,
-					    int voice, unsigned long pos,
-					    void *src, unsigned long count)
-{
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct gus_pcm_private *pcmp = runtime->private_data;
-	unsigned int len = count;
-	int bpos;
-
-	bpos = get_bpos(pcmp, voice, pos, len);
-	if (bpos < 0)
-		return pos;
-	memcpy(runtime->dma_area + bpos, src, len);
-	return playback_copy_ack(substream, bpos, len);
-}
-
 static int snd_gf1_pcm_playback_silence(struct snd_pcm_substream *substream,
 					int voice, unsigned long pos,
 					unsigned long count)
@@ -830,8 +814,7 @@ static const struct snd_pcm_ops snd_gf1_pcm_playback_ops = {
 	.prepare =	snd_gf1_pcm_playback_prepare,
 	.trigger =	snd_gf1_pcm_playback_trigger,
 	.pointer =	snd_gf1_pcm_playback_pointer,
-	.copy_user =	snd_gf1_pcm_playback_copy,
-	.copy_kernel =	snd_gf1_pcm_playback_copy_kernel,
+	.copy =		snd_gf1_pcm_playback_copy,
 	.fill_silence =	snd_gf1_pcm_playback_silence,
 };
 
-- 
2.35.3

