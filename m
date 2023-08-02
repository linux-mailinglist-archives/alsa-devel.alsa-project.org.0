Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EEB76C57E
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 08:46:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98DFA1E7;
	Wed,  2 Aug 2023 08:45:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98DFA1E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690958784;
	bh=BpVgfW/gI/RHr2ac9VuLAmxKlhvwwM78eqJu6Rmo49U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SxghrQc7CYKNTSzCp5IaA6nGIkvcOceaMLCn4+Zyy4eARjIVJ+U0bCOVp+GKu3d6o
	 6X4nCfWMtlOCqvuzuPbWWzgvJ7KoDXvvyqOfVEOl1OFqsv9TFUNTLIi286VYUiOsyJ
	 WnKOEOSNqCvEhKRYbEtcuLyqoGj8jRv9itGyapl0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B581F80149; Wed,  2 Aug 2023 08:45:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B98D1F80087;
	Wed,  2 Aug 2023 08:45:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA0A7F80087; Wed,  2 Aug 2023 08:43:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 45483F80087
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 08:42:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45483F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=R/xBpgGt;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=DD/dkd5k
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 188541F749;
	Wed,  2 Aug 2023 06:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1690958549;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f3lGsPeL6BrpCQaL4MctPULPba+woaZ0/hkoP763aLM=;
	b=R/xBpgGt3pXLjfFEyUValhxoeqvWP643IVT9cjhgAD0w5Smkg6tefHPEAYcJ5sUhN2viOB
	Py+HOuQDT/au4Gzdl//yEHgbkZG8qaqodIWMKF0tgcc2gebWQEmIQu8rVRz/z+sr8JIGyS
	Zlgdm71r2SUZDF4pmXfaqmN9WcK1xpc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690958549;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f3lGsPeL6BrpCQaL4MctPULPba+woaZ0/hkoP763aLM=;
	b=DD/dkd5k9E/rJps4aUgbIGa9wMcwd94W2oZfwngRjBOiPLE+ZTTauGmNz7Dgl+1GkVRybe
	7Gs6k0LQvlCcz4CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 975A013909;
	Wed,  2 Aug 2023 06:42:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id /CPvI9T6yWR+CAAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 02 Aug 2023 06:42:28 +0000
Date: Wed, 02 Aug 2023 08:42:27 +0200
Message-ID: <87cz06djxo.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: cujomalainey@chromium.org
Cc: alsa-devel@alsa-project.org,
	Doug Anderson <dianders@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Zheyu Ma <zheyuma97@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	Clement Lecigne <clecigne@google.com>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] sound: core: fix device ownership model in card and pcm
In-Reply-To: <20230801171928.1460120-1-cujomalainey@chromium.org>
References: <20230801171928.1460120-1-cujomalainey@chromium.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 3B2VMPFATCJCRD76DM36LZAICPDP2R6A
X-Message-ID-Hash: 3B2VMPFATCJCRD76DM36LZAICPDP2R6A
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3B2VMPFATCJCRD76DM36LZAICPDP2R6A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 01 Aug 2023 19:18:41 +0200,
cujomalainey@chromium.org wrote:
> 
> From: Curtis Malainey <cujomalainey@chromium.org>
> 
> The current implementation of how devices are released is valid for
> production use cases (root control of memory is handled by card_dev, all
> other devices are no-ops).
> 
> This model does not work though in a kernel hacking environment where
> KASAN and delayed release on kobj is enabled. If the card_dev device is
> released before any of the child objects a use-after-free bug is caught
> by KASAN as the delayed release still has a reference to the devices
> that were freed by the card_dev release. Also both snd_card and snd_pcm
> both own two devices internally, so even if they released independently,
> the shared struct would result in another use after free.
> 
> Solution is to move the child devices into their own memory so they can
> be handled independently and released on their own schedule.
> 
> Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
> Cc: Doug Anderson <dianders@chromium.org>

Thanks, it's an interesting bug.

I'm not much against the proposed solution, but still this has to be
carefully evaluated.  So, could you give more details about the bug
itself?  It's related with CONFIG_DEBUG_KOBJECT_RELEASE, right?
In which condition it's triggered and how the UAF looks like?


Takashi
