Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A9173D894
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 09:34:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56A20826;
	Mon, 26 Jun 2023 09:33:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56A20826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687764889;
	bh=+p197upc7jCX0EUx57Vw0lC6naCh9ztLna+J+uVUdSg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EkiKQ61maecSwp1Ffl2DAOXp1QtlD6F1SL7lbn58xGCv827MjgVK1JfcoAIUBjHKH
	 WHSm+Hc4ckF1vXncFwczWHY5Qu7gLQzEWy+GuoQm6v/WFhobLqTaklYHVx9DNT3cNO
	 APWsiBG+vFK9pRYRly5kP5j1LVNBVSSqvK7T2ze4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBA1CF8051E; Mon, 26 Jun 2023 09:33:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A17CF80212;
	Mon, 26 Jun 2023 09:33:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF267F80246; Mon, 26 Jun 2023 09:33:54 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D4BB8F80093
	for <alsa-devel@alsa-project.org>; Mon, 26 Jun 2023 09:33:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4BB8F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=qQE9c3pS;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=2uFouN1h
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0C5F9210DF;
	Mon, 26 Jun 2023 07:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1687764830;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5VlDdmYvDqnDzHA7zfHHZhmopchZjN51DD43ktpiPIw=;
	b=qQE9c3pSc8pg9de3la3h/ajMjs6oJW+3ObjddNmhfZiBamXWmdbAfSuFh0B0ffjNL0xoSz
	pn/IYIS8uZNScyMnXh0uPO6zft6QvpfkCXljplhbpzrTPPtQnnJaIrnfFfPcPKafvlKOu1
	gVarCKidHAaY4kA6n7TZX0Es6HaZJAY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1687764830;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5VlDdmYvDqnDzHA7zfHHZhmopchZjN51DD43ktpiPIw=;
	b=2uFouN1hTLWN7Dx9ITQ0MzlSyuZU0ZSuKE6t/px02D7s6eWmYLFAEl+2FXWlwQc7G/YTHV
	tQg3sL/NqNtstCDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 89E431391D;
	Mon, 26 Jun 2023 07:33:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id quHPIF0/mWRCPAAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 26 Jun 2023 07:33:49 +0000
Date: Mon, 26 Jun 2023 09:33:48 +0200
Message-ID: <871qhywucj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Tuo Li <islituo@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	Linux Kernel <linux-kernel@vger.kernel.org>,
	baijiaju1990@outlook.com
Subject: Re: [BUG] ALSA: core: pcm_memory: a possible data race in
 do_alloc_pages()
In-Reply-To: 
 <CADm8Tenfy8joto5WLCqQWjfT8WimsbJgOss0hJe-ciyDRMrSXw@mail.gmail.com>
References: 
 <CADm8Tek6t0WedK+3Y6rbE5YEt19tML8BUL45N2ji4ZAz1KcN_A@mail.gmail.com>
	<877crqwvi1.wl-tiwai@suse.de>
	<CADm8Tenfy8joto5WLCqQWjfT8WimsbJgOss0hJe-ciyDRMrSXw@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: XVO7XYUNLK6AYTWS2YKJPCJDE3I3IX6R
X-Message-ID-Hash: XVO7XYUNLK6AYTWS2YKJPCJDE3I3IX6R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XVO7XYUNLK6AYTWS2YKJPCJDE3I3IX6R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 26 Jun 2023 09:31:18 +0200,
Tuo Li wrote:
> 
> 
> Hello,
> 
> Thank you for your reply!

FWIW, the simplest fix would be something like below, just extending
the mutex coverage.  But it'll serialize the all calls, so it might
influence on the performance, while it's the safest way.


Takashi

--- a/sound/core/pcm_memory.c
+++ b/sound/core/pcm_memory.c
@@ -37,20 +37,22 @@ static int do_alloc_pages(struct snd_card *card, int type, struct device *dev,
 	enum dma_data_direction dir;
 	int err;
 
+	mutex_lock(&card->memory_mutex);
 	if (max_alloc_per_card &&
-	    card->total_pcm_alloc_bytes + size > max_alloc_per_card)
-		return -ENOMEM;
+	    card->total_pcm_alloc_bytes + size > max_alloc_per_card) {
+		err = -ENOMEM;
+		goto unlock;
+	}
 
 	if (str == SNDRV_PCM_STREAM_PLAYBACK)
 		dir = DMA_TO_DEVICE;
 	else
 		dir = DMA_FROM_DEVICE;
 	err = snd_dma_alloc_dir_pages(type, dev, dir, size, dmab);
-	if (!err) {
-		mutex_lock(&card->memory_mutex);
+	if (!err)
 		card->total_pcm_alloc_bytes += dmab->bytes;
-		mutex_unlock(&card->memory_mutex);
-	}
+ unlock:
+	mutex_unlock(&card->memory_mutex);
 	return err;
 }
 
