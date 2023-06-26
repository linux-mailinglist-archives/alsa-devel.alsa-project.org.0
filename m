Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3B373DCC0
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 13:03:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7249983A;
	Mon, 26 Jun 2023 13:02:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7249983A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687777418;
	bh=OK/eSTeZqXW8ek3GQ7nl6NhthmWn+xHWWfXCMU+ph5w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=M2xKTKvOUrpJ13CJAgMu/FEXgCndS+FJRE8HITba7tTaDWq5jNF1RUzRAcWPIFHvv
	 A65csXWeFA/e1bTBR5DJopeU+pj9iqAD3zBX8o/CDus3f/867qCj9PJfjsGHfV3hXW
	 66zeINH11hIjvZb3LbcHkbIL3uorOuTccKzn8Txw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D3B8F80169; Mon, 26 Jun 2023 13:02:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7814BF80093;
	Mon, 26 Jun 2023 13:02:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F6A2F80246; Mon, 26 Jun 2023 13:02:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4A628F80093
	for <alsa-devel@alsa-project.org>; Mon, 26 Jun 2023 13:02:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A628F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=eFEd58D+;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=wRzUWXpV
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EC45E21861;
	Mon, 26 Jun 2023 11:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1687777335;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nbqsb2L4j9asp0Yxl6Eyl8kIxlFivGaAHwXM+9WqDB8=;
	b=eFEd58D+kQOIKSAmvIA/C7aJUK7aNO+6TWCMdriqrZVwF9YSoFWvnNxX+x++SortqYOOEM
	YGIVJ6GL6ZVfJBNiOFj3jJy3vEbID9mp/+rRps29EvDxWkvT5p+Clwgj7EIHc4XIFuRlH5
	dMhD9xlqsSx/xxj/OxZ+g+Ll/EVVpjA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1687777335;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nbqsb2L4j9asp0Yxl6Eyl8kIxlFivGaAHwXM+9WqDB8=;
	b=wRzUWXpVfr9iB3sJfGLeJ8W6oHK2/QELqTR5N7/VRDS5HoKSF3VRHNxtfPnQPy8Ce7NBXG
	/n4aqOCP+BYau6Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BD86713483;
	Mon, 26 Jun 2023 11:02:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 7aHdLDdwmWRXHwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 26 Jun 2023 11:02:15 +0000
Date: Mon, 26 Jun 2023 13:02:15 +0200
Message-ID: <87wmzqv64o.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Tuo Li <islituo@gmail.com>,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	Linux Kernel <linux-kernel@vger.kernel.org>,
	baijiaju1990@outlook.com
Subject: Re: [BUG] ALSA: core: pcm_memory: a possible data race in
 do_alloc_pages()
In-Reply-To: <4d0931bf-b356-6969-5aaf-b663d7f2b21a@perex.cz>
References: 
 <CADm8Tek6t0WedK+3Y6rbE5YEt19tML8BUL45N2ji4ZAz1KcN_A@mail.gmail.com>
	<877crqwvi1.wl-tiwai@suse.de>
	<CADm8Tenfy8joto5WLCqQWjfT8WimsbJgOss0hJe-ciyDRMrSXw@mail.gmail.com>
	<871qhywucj.wl-tiwai@suse.de>
	<4d0931bf-b356-6969-5aaf-b663d7f2b21a@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: WZSYPWAMIP57EDEXIVCD5SMPCG2NXL6B
X-Message-ID-Hash: WZSYPWAMIP57EDEXIVCD5SMPCG2NXL6B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WZSYPWAMIP57EDEXIVCD5SMPCG2NXL6B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 26 Jun 2023 09:56:47 +0200,
Jaroslav Kysela wrote:
> 
> On 26. 06. 23 9:33, Takashi Iwai wrote:
> > On Mon, 26 Jun 2023 09:31:18 +0200,
> > Tuo Li wrote:
> >> 
> >> 
> >> Hello,
> >> 
> >> Thank you for your reply!
> > 
> > FWIW, the simplest fix would be something like below, just extending
> > the mutex coverage.  But it'll serialize the all calls, so it might
> > influence on the performance, while it's the safest way.
> 
> It may be better to update total_pcm_alloc_bytes before
> snd_dma_alloc_dir_pages() call and decrease this value when allocation
> fails to allow parallel allocations. Then the mutex can be held only
> for the total_pcm_alloc_bytes variable update.

Yes, it'd work.  But a tricky part is that the actual allocation size
can be bigger, and we need to correct the total_pcm_alloc_bytes after
the allocation result.  So the end result would be a patch like below,
which is a bit more complex than the previous simpler approach.  But
it might be OK.

> Eventually, total_pcm_alloc_bytes may be atomic.

Possible, but the same problem like the above applies, so I believe
the mutex is good enough.

Another alternative would be to move the size check after the
successful allocation, assuming that the size exceeds a very
exceptional scenario.  The code flow would be a bit simpler.


thanks,

Takashi

--- a/sound/core/pcm_memory.c
+++ b/sound/core/pcm_memory.c
@@ -37,9 +37,14 @@ static int do_alloc_pages(struct snd_card *card, int type, struct device *dev,
 	enum dma_data_direction dir;
 	int err;
 
+	mutex_lock(&card->memory_mutex);
 	if (max_alloc_per_card &&
-	    card->total_pcm_alloc_bytes + size > max_alloc_per_card)
+	    card->total_pcm_alloc_bytes + size > max_alloc_per_card) {
+		mutex_unlock(&card->memory_mutex);
 		return -ENOMEM;
+	}
+	card->total_pcm_alloc_bytes += size		
+	mutex_unlock(&card->memory_mutex);
 
 	if (str == SNDRV_PCM_STREAM_PLAYBACK)
 		dir = DMA_TO_DEVICE;
@@ -47,8 +52,18 @@ static int do_alloc_pages(struct snd_card *card, int type, struct device *dev,
 		dir = DMA_FROM_DEVICE;
 	err = snd_dma_alloc_dir_pages(type, dev, dir, size, dmab);
 	if (!err) {
+		/* the actual allocation size might be bigger than requested,
+		 * and we need to correct the account
+		 */
+		if (dmab->bytes != size) {
+			mutex_lock(&card->memory_mutex);
+			card->total_pcm_alloc_bytes += dmab->bytes - size;
+			mutex_unlock(&card->memory_mutex);
+		}
+	} else {
+		/* allocation failure, take back */
 		mutex_lock(&card->memory_mutex);
-		card->total_pcm_alloc_bytes += dmab->bytes;
+		card->total_pcm_alloc_bytes -= size;
 		mutex_unlock(&card->memory_mutex);
 	}
 	return err;
