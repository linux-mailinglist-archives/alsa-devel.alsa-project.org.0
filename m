Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 224A573D842
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 09:12:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC24D83B;
	Mon, 26 Jun 2023 09:11:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC24D83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687763521;
	bh=JESBQ+7BRnenRvzyvCXCYXpiFjqBYYuA0oiVp9pCXSs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eMbkULy+UO8iKduWD5lsQDUB7Nr+yn2OnflbejiawlgfmUzITapq4uqlmDGKi3Rwq
	 oS+qlUTp7/KpyVnz6RrHLe3NdHvtxuaarA4HGjbN+XG1pl827E9tghMT21G7tZia8p
	 lYBFmN72IbeMu4Yj1R7/4T0RU/e9fW6Q3YSy/Yic=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18BB7F80544; Mon, 26 Jun 2023 09:11:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B2BEF80212;
	Mon, 26 Jun 2023 09:11:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73483F80246; Mon, 26 Jun 2023 09:09:06 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 65635F80093
	for <alsa-devel@alsa-project.org>; Mon, 26 Jun 2023 09:08:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65635F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=nicTZfve;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=y9fpu42H
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id ACF81218B8;
	Mon, 26 Jun 2023 07:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1687763335;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RWp9iBLJZSk2uRxV2vG2dj40DxJ+Lusxw9MuXwf/nTY=;
	b=nicTZfvexsoypP1428uP5XWujBsWDzihiVQ/qMRMXsLqfjRByx4/Ci2eUp+BeQVenUDbjL
	nVajufgf/xWNyQpa0H2e3wmWdV3c4h9kG2fgJZoF0/9yqY6vwcGXArkil2Icyr+dLIM7G8
	qxl3AKK0FGuStBR4kuqyRgxphOSjk0M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1687763335;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RWp9iBLJZSk2uRxV2vG2dj40DxJ+Lusxw9MuXwf/nTY=;
	b=y9fpu42HTeFcOVOYOuTrVliWYQVOKTGXynQ75YvERbOcyHeCDjQpHhqZEZZTg+1ji8O7pO
	y65rW++qYLWNlxBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7ED4113483;
	Mon, 26 Jun 2023 07:08:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id Z4r2HYc5mWQANAAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 26 Jun 2023 07:08:55 +0000
Date: Mon, 26 Jun 2023 09:08:54 +0200
Message-ID: <877crqwvi1.wl-tiwai@suse.de>
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
 <CADm8Tek6t0WedK+3Y6rbE5YEt19tML8BUL45N2ji4ZAz1KcN_A@mail.gmail.com>
References: 
 <CADm8Tek6t0WedK+3Y6rbE5YEt19tML8BUL45N2ji4ZAz1KcN_A@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KS6G3T2VHW2PBWC6TF35FJTOHT3Y6BPP
X-Message-ID-Hash: KS6G3T2VHW2PBWC6TF35FJTOHT3Y6BPP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KS6G3T2VHW2PBWC6TF35FJTOHT3Y6BPP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 26 Jun 2023 05:42:29 +0200,
Tuo Li wrote:
> 
> 
> Hello,
> 
> Our static analysis tool finds a possible data race in ALSA in Linux 6.4.0.
> 
> In some functions, the field snd_card.total_pcm_alloc_bytes is accessed
> with holding the lock snd_card.memory_mutex. Here is an example:
> 
>   do_free_pages() --> Line 57
>     mutex_lock(&card->memory_mutex); --> Line 61 (Lock card->memory_mutex)
>     card->total_pcm_alloc_bytes -= dmab->bytes;  --> Line 63 (Access  card->
> total_pcm_alloc_bytes)
> 
> However, in the function do_alloc_pages():
> 
>   if (max_alloc_per_card &&
>     card->total_pcm_alloc_bytes + size > max_alloc_per_card) --> Line 41
> 
> the variable card->total_pcm_alloc_bytes is accessed without holding
> the lock card->memory_mutex, and thus a data race can occur.
> 
> In my opinion, this data race may be harmful, because the value of
> card->total_pcm_alloc_bytes may be changed by another thread after
> the if check. Therefore, its value may be too large after Line 51 and can
> cause memory bugs such as buffer overflow:
> 
>   card->total_pcm_alloc_bytes += dmab->bytes;  --> Line 51
> 
> I am not quite sure whether this possible data race is real and how to
> fix it if it is real.
> 
> Any feedback would be appreciated, thanks!
> 
> Reported-by: BassCheck <bass@buaa.edu.cn>

It's a bit racy indeed, but the effect is almost negligible.  The size
check there is merely a sanity check, and allocating more bytes
doesn't mean to conflict against anything practically.

That said, it's a better-to-be-addressed bug, but nothing too
serious.


thanks,

Takashi
