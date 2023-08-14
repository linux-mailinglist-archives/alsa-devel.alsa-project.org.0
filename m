Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FA477B818
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Aug 2023 14:00:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65BC5A4E;
	Mon, 14 Aug 2023 14:00:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65BC5A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692014452;
	bh=LQJN7vijFj0hSWq+t5NVzfU8XvxZzFi7YVWdP90CSRQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WdxjU18YqDjXpSOQsTnU9A3V47znabNVqzoihNyanrUDrT8jipoZmLekp/bAqlQwg
	 O4tSzJPNU7IPY01ilP8DS0M602D3ckZzdxy6IkKwlfLNwziaz+UAfcbATZ96cFvlbs
	 j5sH5l2e9IO85qh5XfFqysryJKpoXCNixdYDaP/8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27142F80551; Mon, 14 Aug 2023 13:57:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77399F805E4;
	Mon, 14 Aug 2023 13:57:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7CF23F80272; Mon, 14 Aug 2023 13:56:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7679DF8055A
	for <alsa-devel@alsa-project.org>; Mon, 14 Aug 2023 13:55:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7679DF8055A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=CVrUT9XI;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Y9L7oU/8
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4FBDD219A0;
	Mon, 14 Aug 2023 11:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692014151;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sornzw8ObUuh4FueGJ820FsFvgO7TY3p6mTQ3GQIfsY=;
	b=CVrUT9XIrY3uMZzCWOFV7JlPopcREvQN2H1+iHkxvnKkDp/mT8wf7315ohwnedV3KVRLPf
	IKjrJoawVhJToAAowJJjFkoo8hsktpfD70pwJjcWwFpHplo9LGjd0fL4zpf90B2QpOAbd4
	W58VXdLcQgL10h1uk+C91eAseOWzlb4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692014151;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sornzw8ObUuh4FueGJ820FsFvgO7TY3p6mTQ3GQIfsY=;
	b=Y9L7oU/8UYK3IKOnphxNwmZN54/GSRtS6pvX9/QjTpmxrMkV6nQj8V27wQJrfTnYB+T9xJ
	BQZqybIE3N87BcCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 237CD138EE;
	Mon, 14 Aug 2023 11:55:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id kMPqB0cW2mRnMAAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 14 Aug 2023 11:55:51 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 14/25] ALSA: sh: Convert to generic PCM copy ops
Date: Mon, 14 Aug 2023 13:55:12 +0200
Message-Id: <20230814115523.15279-15-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230814115523.15279-1-tiwai@suse.de>
References: <20230814115523.15279-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: C7XPLLPK42QONRGBC6P34QGWO6MVZFUW
X-Message-ID-Hash: C7XPLLPK42QONRGBC6P34QGWO6MVZFUW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C7XPLLPK42QONRGBC6P34QGWO6MVZFUW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch converts the sh_dac_audio driver code to use the new
unified PCM copy callback.  It's a straightforward conversion from
*_user() to *_iter() variants.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/sh/sh_dac_audio.c | 25 +++----------------------
 1 file changed, 3 insertions(+), 22 deletions(-)

diff --git a/sound/sh/sh_dac_audio.c b/sound/sh/sh_dac_audio.c
index 8cf571955c9d..95ba3abd4e47 100644
--- a/sound/sh/sh_dac_audio.c
+++ b/sound/sh/sh_dac_audio.c
@@ -158,12 +158,12 @@ static int snd_sh_dac_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 
 static int snd_sh_dac_pcm_copy(struct snd_pcm_substream *substream,
 			       int channel, unsigned long pos,
-			       void __user *src, unsigned long count)
+			       struct iov_iter *src, unsigned long count)
 {
 	/* channel is not used (interleaved data) */
 	struct snd_sh_dac *chip = snd_pcm_substream_chip(substream);
 
-	if (copy_from_user_toio(chip->data_buffer + pos, src, count))
+	if (copy_from_iter_toio(chip->data_buffer + pos, src, count))
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

