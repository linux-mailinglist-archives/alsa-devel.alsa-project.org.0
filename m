Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E285777D304
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 21:09:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6141FEA0;
	Tue, 15 Aug 2023 21:08:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6141FEA0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692126587;
	bh=vjcpszBaE0iHWR34p/U4Gv2MoX9+UIwTBYuFFD0RRzc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=R2eEnEuHPu64kGVFhrcmQ1rLt90tizIsrjOxtB4mMCpJb49WYyG73ONONybFxMsPO
	 3AGa0bAAXf0r8VXVab3AOIf/OC1kQcW7uIdxkXghtbLNuOvYLCnGsJHqduvkO0LvRm
	 fDGRxk7MEY7evfsBpfSKxkFh83SSdZfsCKnQNdts=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9AF5F805AD; Tue, 15 Aug 2023 21:04:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4909EF80589;
	Tue, 15 Aug 2023 21:04:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A769F80558; Tue, 15 Aug 2023 21:03:56 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 776AAF80510
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 21:01:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 776AAF80510
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=MXBQHOYY;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=kaVCJFAt
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E365D219A3;
	Tue, 15 Aug 2023 19:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692126107;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xEwshEXd5jHzSin+0WURFtdbZgE1smV0MVE5PXNoruQ=;
	b=MXBQHOYYgfH/bnDoaMxIMU9sASgToyrxBUm30m8PuWlu/pP5JqqJvzzrBpOtgj76DJY1c7
	pbTQcR3wzes52tW2kWVN8ugApPC2jTS3erRVA9FGQ4rmB1la2XsHUdm6BwBlNt8/PdcqRq
	LuubXnRCBl0PcDOzyIbaUw+A7VxykgE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692126107;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xEwshEXd5jHzSin+0WURFtdbZgE1smV0MVE5PXNoruQ=;
	b=kaVCJFAtAOnSLajpLtq32S+HTkQCWOElto/vs99aqqdWPdCqOBAN03HyTMDs5wC1qfy/48
	wVqb4g/Z9BsXrxBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C567E1390C;
	Tue, 15 Aug 2023 19:01:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id mOkrL5vL22QTVAAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 15 Aug 2023 19:01:47 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 05/25] ALSA: gus: Convert to generic PCM copy ops
Date: Tue, 15 Aug 2023 21:01:16 +0200
Message-Id: <20230815190136.8987-6-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230815190136.8987-1-tiwai@suse.de>
References: <20230815190136.8987-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3QU46DOZWW23MII3FCFC62OKBUIO2AO4
X-Message-ID-Hash: 3QU46DOZWW23MII3FCFC62OKBUIO2AO4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3QU46DOZWW23MII3FCFC62OKBUIO2AO4/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch converts the GUS driver code to use the new unified PCM
copy callback.  It's a straightforward conversion from *_user() to
*_iter() variants.

Note that copy_from/to_iter() returns the copied bytes, hence the
error condition is adjusted accordingly.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/gus/gus_pcm.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/sound/isa/gus/gus_pcm.c b/sound/isa/gus/gus_pcm.c
index 388db5fb65bd..850544725da7 100644
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
+	if (copy_from_iter(runtime->dma_area + bpos, len, src) != len)
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

