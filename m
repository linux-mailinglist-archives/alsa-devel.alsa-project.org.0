Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE8A769B32
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 17:50:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43300886;
	Mon, 31 Jul 2023 17:49:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43300886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690818612;
	bh=cQKRuVnvL6VEm4PmKgDf0Nd5FEtuvTfDiLVqc8exlmw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kjILhiI3I0TbYr3BvqjcCo5wkq2doNu5pgMxHO9xE+R+1wlrrefBDioBByn5p7wv4
	 NZW65vXSbR7osstg9NxeEzUhKwzAzX79yWZWYUc6+pcq6DknNVL5MrpHQJhb+crXVn
	 0upgdbcmuRw7PiihicA/HJ+zH1eciD/DFXLJ4IJQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52F86F805BF; Mon, 31 Jul 2023 17:47:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 799A2F805BF;
	Mon, 31 Jul 2023 17:47:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D453F8059F; Mon, 31 Jul 2023 17:47:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 637CBF80553
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 17:47:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 637CBF80553
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=k25t2ou8;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=InJ7VDz+
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 855AC221D6;
	Mon, 31 Jul 2023 15:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1690818445;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s4v3FHD9rAA+qtVdJIOPCEHHvCgzf8AaiYvI0TPR1ME=;
	b=k25t2ou8vibBX/0X/olV7M4D/yj964u9ppVjv4MKOQQxTuK81Gr8Ig27MNZjZCd24/wD+k
	1n5Zj48VQYLQ3WWVxQHVUoedjJiHcgvlXLQCkG9ZNlCz7tG8nPfU424U3gH6d3kOiVtRT4
	dv0zA80ykc2aThPPrfXERBcEVi+mzDg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690818445;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s4v3FHD9rAA+qtVdJIOPCEHHvCgzf8AaiYvI0TPR1ME=;
	b=InJ7VDz+UO45oXv2aTxiuNvkIlDX5bkiWz0tXjv/k4ewhTT+4caEDwyha643dxdDVeHdiA
	ZLLM2kl0D6R/9YAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 65A451322C;
	Mon, 31 Jul 2023 15:47:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id ALeQF43Xx2Q3fwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 31 Jul 2023 15:47:25 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 13/24] ALSA: sh: Convert to generic PCM copy ops
Date: Mon, 31 Jul 2023 17:47:07 +0200
Message-Id: <20230731154718.31048-14-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230731154718.31048-1-tiwai@suse.de>
References: <20230731154718.31048-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XAZJUNPZJL7GCDNHKLNN5HHAOR6CTZFY
X-Message-ID-Hash: XAZJUNPZJL7GCDNHKLNN5HHAOR6CTZFY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XAZJUNPZJL7GCDNHKLNN5HHAOR6CTZFY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch converts the sh_dac_audio driver code to use the new
unified PCM copy callback.  It's a straightforward conversion from
*_user() to *_sockptr() variants.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/sh/sh_dac_audio.c | 25 +++----------------------
 1 file changed, 3 insertions(+), 22 deletions(-)

diff --git a/sound/sh/sh_dac_audio.c b/sound/sh/sh_dac_audio.c
index 8cf571955c9d..40e783219b44 100644
--- a/sound/sh/sh_dac_audio.c
+++ b/sound/sh/sh_dac_audio.c
@@ -158,12 +158,12 @@ static int snd_sh_dac_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 
 static int snd_sh_dac_pcm_copy(struct snd_pcm_substream *substream,
 			       int channel, unsigned long pos,
-			       void __user *src, unsigned long count)
+			       sockptr_t src, unsigned long count)
 {
 	/* channel is not used (interleaved data) */
 	struct snd_sh_dac *chip = snd_pcm_substream_chip(substream);
 
-	if (copy_from_user_toio(chip->data_buffer + pos, src, count))
+	if (copy_from_sockptr_toio(chip->data_buffer + pos, src, count))
 		return -EFAULT;
 	chip->buffer_end = chip->data_buffer + pos + count;
 
@@ -175,24 +175,6 @@ static int snd_sh_dac_pcm_copy(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int snd_sh_dac_pcm_copy_kernel(struct snd_pcm_substream *substream,
-				      int channel, unsigned long pos,
-				      void *src, unsigned long count)
-{
-	/* channel is not used (interleaved data) */
-	struct snd_sh_dac *chip = snd_pcm_substream_chip(substream);
-
-	memcpy_toio(chip->data_buffer + pos, src, count);
-	chip->buffer_end = chip->data_buffer + pos + count;
-
-	if (chip->empty) {
-		chip->empty = 0;
-		dac_audio_start_timer(chip);
-	}
-
-	return 0;
-}
-
 static int snd_sh_dac_pcm_silence(struct snd_pcm_substream *substream,
 				  int channel, unsigned long pos,
 				  unsigned long count)
@@ -227,8 +209,7 @@ static const struct snd_pcm_ops snd_sh_dac_pcm_ops = {
 	.prepare	= snd_sh_dac_pcm_prepare,
 	.trigger	= snd_sh_dac_pcm_trigger,
 	.pointer	= snd_sh_dac_pcm_pointer,
-	.copy_user	= snd_sh_dac_pcm_copy,
-	.copy_kernel	= snd_sh_dac_pcm_copy_kernel,
+	.copy		= snd_sh_dac_pcm_copy,
 	.fill_silence	= snd_sh_dac_pcm_silence,
 	.mmap		= snd_pcm_lib_mmap_iomem,
 };
-- 
2.35.3

