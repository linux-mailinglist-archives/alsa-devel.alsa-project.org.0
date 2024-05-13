Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0214D8C3F48
	for <lists+alsa-devel@lfdr.de>; Mon, 13 May 2024 12:48:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3EA6EB6;
	Mon, 13 May 2024 12:48:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3EA6EB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715597315;
	bh=279kSmoWeCzliCqptPUjh1StgW/VKBe+o1R9LomBGpw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MhtkFOXB6Rk11vQ52Gt7FBZd1YgHXRcVbKO6VfsR7IDQVkL5AcL4Ec5U1E7jR6wd2
	 NKARk9PvRahfGx1wB6qnHPvaoSM2g5Jv+Kxr0x2EiNO0cJy9ovTo3cvKTXsN2pxeNL
	 CbKs5skJL93d2tiFCps6/bUtcZf2Nuui1lwxyNJc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3DB9DF80570; Mon, 13 May 2024 12:48:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C1AAF805C7;
	Mon, 13 May 2024 12:48:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7927FF8025F; Mon, 13 May 2024 12:48:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 51EC9F800E2
	for <alsa-devel@alsa-project.org>; Mon, 13 May 2024 12:48:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51EC9F800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=HX38Qfsi;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=KkdcwRCB;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=05nmcTkk;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=7tTwiwSs
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F1A2920BB2;
	Mon, 13 May 2024 10:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1715597284;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kK2QWSuJFFQpvxu4rdXRpQf9HOUfLt5sgCtkuALulmQ=;
	b=HX38Qfsif16pUPezX61iPQD2v9EIZJtzBBLRRT80O3QT+3X4/fApDzt5O/KoktCnqyLvvK
	HLME9LRSfY+gloImoY750VRMLGCDxQiBD/9UQ3nKLZXpslhj91/vGFjNinhjrdA3G7xtsV
	3H2akAeXPQfP7nJx+BwO9H3Z2Tgl8R8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715597284;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kK2QWSuJFFQpvxu4rdXRpQf9HOUfLt5sgCtkuALulmQ=;
	b=KkdcwRCBszarBmqESQoiBJu7kJkzkGXcNW8DimD3u/aZXN2Msz+DlJXWiWhWTO232iSZFn
	ZItV+PF5XQ7Ci1Dg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1715597283;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kK2QWSuJFFQpvxu4rdXRpQf9HOUfLt5sgCtkuALulmQ=;
	b=05nmcTkkjf57syTWAYNiun55iffUcPQ+9ZPlUIjE8O33zR9Y6hF58Xo4EjjrfKvCTcQ4wt
	nU/vAK1ed0t1vlEfRNUzFqYoUCnArrWf+JBOiN3AqtmeDnt+HyUD9qT0s0GrpSgO3oCetu
	dxWULn9bMr4QlHrs09u0959wMszP5PE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715597283;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kK2QWSuJFFQpvxu4rdXRpQf9HOUfLt5sgCtkuALulmQ=;
	b=7tTwiwSsF1RaQ4p3MPIwgpVbSe8ClA9ZvM3pBzWSjApTqWy4MjYrL9yG/KMAQVU1Kz9dNq
	QRGScs+akw7/RzBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D49F913A52;
	Mon, 13 May 2024 10:48:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7tHBMuPvQWbGWgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 13 May 2024 10:48:03 +0000
Date: Mon, 13 May 2024 12:48:19 +0200
Message-ID: <87a5kugf7w.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC updates for v6.10
In-Reply-To: <94245281bc3c75bc6a74e7366f594cfa.broonie@kernel.org>
References: <94245281bc3c75bc6a74e7366f594cfa.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.02 / 50.00];
	BAYES_HAM(-2.72)[98.76%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,alsa-project.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_THREE(0.00)[3]
Message-ID-Hash: XJU2YTQUTJRVCN2T33G2E5QOQ4BBTCYJ
X-Message-ID-Hash: XJU2YTQUTJRVCN2T33G2E5QOQ4BBTCYJ
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XJU2YTQUTJRVCN2T33G2E5QOQ4BBTCYJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 13 May 2024 11:34:35 +0200,
Mark Brown wrote:
> 
> The following changes since commit c942a0cd3603e34dd2d7237e064d9318cb7f9654:
> 
>   Merge tag 'for_linus' of git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost (2024-04-25 15:38:45 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v6.10
> 
> for you to fetch changes up to c3c5ac4bd7d7019f2e3ad1720572d53226fe656e:
> 
>   ASoC: Intel: updates for 6.10 - part7 (2024-05-10 12:30:12 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Updates for v6.10
> 
> This is a very big update, in large part due to extensive work the Intel
> people have been doing in their drivers though it's also been busy
> elsewhere.  There's also a big overhaul of the DAPM documentation from
> Luca Ceresoli arising from the work he did putting together his recent
> ELC talk, and he also contributed a new tool for visualising the DAPM
> state.
> 
>  - A new tool dapm-graph for visualising the DAPM state.
>  - Substantial fixes and clarifications for the DAPM documentation.
>  - Very large updates throughout the Intel audio drivers.
>  - Cleanups of accessors for driver data, module labelling, and for
>    constification.
>  - Modernsation and cleanup work in the Mediatek drivers.
>  - Several fixes and features for the DaVinci I2S driver.
>  - New drivers for several AMD and Intel platforms, Nuvoton NAU8325,
>    Rockchip RK3308 and Texas Instruments PCM6240.

Pulled now.  Thanks.


Takashi
