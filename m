Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8820F769B55
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 17:52:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A26E83A;
	Mon, 31 Jul 2023 17:51:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A26E83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690818769;
	bh=TnPlhSxqlROyzSBHtNWdR5Cnz38t0TXqINiKDh/UoiY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bpYpSQnsdXbN7X5K9IxlP0vWalltnFZ7Wr92jJswNtZl1XD51HeVFQMThE3d/w11T
	 VB0cmTfBWVx2gpqwC0QFekKXLMPyNDxZI3tP3qQteR3ogP+wXGWRYwnbVZxLxJahF9
	 okBpPmIE6ADTtZfIQ8QxGL7zg86lFQjQlK+mfdDc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B98FF80617; Mon, 31 Jul 2023 17:48:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E19EEF80616;
	Mon, 31 Jul 2023 17:48:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0619F80163; Mon, 31 Jul 2023 17:48:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 484B8F80163
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 17:47:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 484B8F80163
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=mNBFkpwc;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=EEnH7mPL
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 736C6221DF;
	Mon, 31 Jul 2023 15:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1690818447;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UTZsiUon4MyqacTn+bvjQe32AeuuhNqmUBxuxc7XiqM=;
	b=mNBFkpwck945PDxWfuluIzMcCj46kHrVnh8UmJJYObyFlI0a9UudS+SDPsX8BnS+dJ8fIK
	t5f943UEaDbzk99OjYv7cPs2KgGRVqLJojw0lyqC9G0R53SqJB+M2zKO3K7TVUHJzmN1/Y
	n0bn4TR2GbqDZVwEFNIeTVfwmtLr+0M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690818447;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UTZsiUon4MyqacTn+bvjQe32AeuuhNqmUBxuxc7XiqM=;
	b=EEnH7mPLp/uracpMKtbYSqhgJM+egmKBvCm3Hoip4hvxdTtqPUyCiXaVeSEqSs5FUt3XAf
	KmNOGVqelYhwvIAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 585C0138EE;
	Mon, 31 Jul 2023 15:47:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id GEe0FI/Xx2Q3fwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 31 Jul 2023 15:47:27 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 24/24] ALSA: pcm: Drop obsoleted PCM copy_user and copy_kernel
 ops
Date: Mon, 31 Jul 2023 17:47:18 +0200
Message-Id: <20230731154718.31048-25-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230731154718.31048-1-tiwai@suse.de>
References: <20230731154718.31048-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LN2JVNQOEAWMLTR4D6YQ7KO6OQ34KUPA
X-Message-ID-Hash: LN2JVNQOEAWMLTR4D6YQ7KO6OQ34KUPA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LN2JVNQOEAWMLTR4D6YQ7KO6OQ34KUPA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Finally all users have been converted to the new PCM copy ops, let's
drop the obsoleted copy_kernel and copy_user ops completely.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/pcm.h     |  5 -----
 sound/core/pcm_lib.c    | 16 ----------------
 sound/core/pcm_native.c |  2 +-
 3 files changed, 1 insertion(+), 22 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 9b7054f0cea0..2700ca1c9db8 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -71,11 +71,6 @@ struct snd_pcm_ops {
 			    unsigned long pos, unsigned long bytes);
 	int (*copy)(struct snd_pcm_substream *substream, int channel,
 		    unsigned long pos, sockptr_t buf, unsigned long bytes);
-	int (*copy_user)(struct snd_pcm_substream *substream, int channel,
-			 unsigned long pos, void __user *buf,
-			 unsigned long bytes);
-	int (*copy_kernel)(struct snd_pcm_substream *substream, int channel,
-			   unsigned long pos, void *buf, unsigned long bytes);
 	struct page *(*page)(struct snd_pcm_substream *substream,
 			     unsigned long offset);
 	int (*mmap)(struct snd_pcm_substream *substream, struct vm_area_struct *vma);
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 1dd630cd22a7..1d10de7eeac6 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -2031,19 +2031,6 @@ static int default_read_copy(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-/* a wrapper for calling old copy_kernel or copy_user ops */
-static int call_old_copy(struct snd_pcm_substream *substream,
-			 int channel, unsigned long hwoff,
-			 sockptr_t buf, unsigned long bytes)
-{
-	if (sockptr_is_kernel(buf))
-		return substream->ops->copy_kernel(substream, channel, hwoff,
-						   buf.kernel, bytes);
-	else
-		return substream->ops->copy_user(substream, channel, hwoff,
-						 buf.user, bytes);
-}
-
 /* create a sockptr_t */
 static inline sockptr_t make_sockptr(void *p, bool in_kernel)
 {
@@ -2241,9 +2228,6 @@ snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
 	} else {
 		if (substream->ops->copy)
 			transfer = substream->ops->copy;
-		else if ((in_kernel && substream->ops->copy_kernel) ||
-			 (!in_kernel && substream->ops->copy_user))
-			transfer = call_old_copy;
 		else
 			transfer = is_playback ?
 				default_write_copy : default_read_copy;
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 34efd4d198d6..bd9ddf412b46 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -809,7 +809,7 @@ static int snd_pcm_hw_params(struct snd_pcm_substream *substream,
 		runtime->boundary *= 2;
 
 	/* clear the buffer for avoiding possible kernel info leaks */
-	if (runtime->dma_area && !substream->ops->copy && !substream->ops->copy_user) {
+	if (runtime->dma_area && !substream->ops->copy) {
 		size_t size = runtime->dma_bytes;
 
 		if (runtime->info & SNDRV_PCM_INFO_MMAP)
-- 
2.35.3

