Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94ACB77B82A
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Aug 2023 14:04:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA558EAD;
	Mon, 14 Aug 2023 14:03:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA558EAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692014660;
	bh=gApq1H8D3zA77fLoCECVg5yF9obQ+GBSITTsYlfImgc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i3oSKhsbMvtOeYvxUnq9RTmCbR6VIIu50WG/PSff6OORUqPP2ZAS5sHK245xHtKXJ
	 kCE/VXgvOZlnqcmy01BrEhXMvaBZcFJh3cdKUr63I3eW1suDifzkfku54HoKDCCOW6
	 faL9rYTfAfjUJuLlPu4M6ciVmr7Lv4fx7NqGTOns=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89080F80690; Mon, 14 Aug 2023 13:57:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BF03F80549;
	Mon, 14 Aug 2023 13:57:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5388F80254; Mon, 14 Aug 2023 13:56:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CB721F80571
	for <alsa-devel@alsa-project.org>; Mon, 14 Aug 2023 13:55:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB721F80571
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=WbY4jj3/;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=099nYc38
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B21791FD6A;
	Mon, 14 Aug 2023 11:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692014157;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DzfPkrsHVrap+B5JD7fqRR+3BmI5kvbs99homa/INDo=;
	b=WbY4jj3/sk00FggPcUN6O0aD11Ah7Xhq+9Ug/mn6uRgymnckvhjVFU6IXtJSwKdQ+dk/2F
	Yo/d032FvvXeB8krreZ/19OZkriFdaDStfhsTIy1uA7WzBm919g5MiiVnx/TSdrbROjrAG
	lrYKqiLMEQUOOb9NKAlWSEsgEK2AGl4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692014157;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DzfPkrsHVrap+B5JD7fqRR+3BmI5kvbs99homa/INDo=;
	b=099nYc389SygLDTBfFZDK/anaM2wRHsyU4Xjdu8kvoIqxfk4wm3T2Fest5dDR87Ll+kAnz
	HVUVFF0jBqvphtDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9181E138EE;
	Mon, 14 Aug 2023 11:55:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id UEaxIU0W2mRnMAAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 14 Aug 2023 11:55:57 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 25/25] ALSA: pcm: Drop obsoleted PCM copy_user and copy_kernel
 ops
Date: Mon, 14 Aug 2023 13:55:23 +0200
Message-Id: <20230814115523.15279-26-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230814115523.15279-1-tiwai@suse.de>
References: <20230814115523.15279-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KMYR2N6KLHKV57N6OOZLXM5PZCV7FMT2
X-Message-ID-Hash: KMYR2N6KLHKV57N6OOZLXM5PZCV7FMT2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KMYR2N6KLHKV57N6OOZLXM5PZCV7FMT2/>
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
 sound/core/pcm_lib.c    | 18 +-----------------
 sound/core/pcm_native.c |  2 +-
 3 files changed, 2 insertions(+), 23 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index f75beead79e3..958a0b284b5f 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -71,11 +71,6 @@ struct snd_pcm_ops {
 			    unsigned long pos, unsigned long bytes);
 	int (*copy)(struct snd_pcm_substream *substream, int channel,
 		    unsigned long pos, struct iov_iter *iter, unsigned long bytes);
-	int (*copy_user)(struct snd_pcm_substream *substream, int channel,
-			 unsigned long pos, void __user *buf,
-			 unsigned long bytes);
-	int (*copy_kernel)(struct snd_pcm_substream *substream, int channel,
-			   unsigned long pos, void *buf, unsigned long bytes);
 	struct page *(*page)(struct snd_pcm_substream *substream,
 			     unsigned long offset);
 	int (*mmap)(struct snd_pcm_substream *substream, struct vm_area_struct *vma);
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 3303914c58ea..4859fb1caec9 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -2031,19 +2031,6 @@ static int default_read_copy(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-/* a wrapper for calling old copy_kernel or copy_user ops */
-static int call_old_copy(struct snd_pcm_substream *substream,
-			 int channel, unsigned long hwoff,
-			 struct iov_iter *iter, unsigned long bytes)
-{
-	if (iov_iter_is_kvec(iter))
-		return substream->ops->copy_kernel(substream, channel, hwoff,
-						   iter_iov_addr(iter), bytes);
-	else
-		return substream->ops->copy_user(substream, channel, hwoff,
-						 iter_iov_addr(iter), bytes);
-}
-
 /* call transfer with the filled iov_iter */
 static int do_transfer(struct snd_pcm_substream *substream, int c,
 		       unsigned long hwoff, void *data, unsigned long bytes,
@@ -2147,7 +2134,7 @@ static int pcm_sanity_check(struct snd_pcm_substream *substream)
 	if (PCM_RUNTIME_CHECK(substream))
 		return -ENXIO;
 	runtime = substream->runtime;
-	if (snd_BUG_ON(!substream->ops->copy && !substream->ops->copy_user && !runtime->dma_area))
+	if (snd_BUG_ON(!substream->ops->copy && !runtime->dma_area))
 		return -EINVAL;
 	if (runtime->state == SNDRV_PCM_STATE_OPEN)
 		return -EBADFD;
@@ -2255,9 +2242,6 @@ snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
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

