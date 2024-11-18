Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 598D89D121C
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Nov 2024 14:39:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CCF3A4A;
	Mon, 18 Nov 2024 14:39:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CCF3A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1731937158;
	bh=/td8+4wWQTvp3IPGcZ9enOwVZbTEZd+Scjg/rzpSPe8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CLgIbTw5xzoTzyBM9GiRuW0AESrn/1B/dJflGLLD1hFjXNPzMVxkPtOa236KV9pe+
	 iohvQsa2c81qfOpijuq9ivP2m/oPrggbWFbdJ4t0Gyve67PQ7aK/iraXH0YXvOVVT2
	 qGuyH2ri4uc07y/Ar5q9exV5qLx0+ojG8v9IEvFQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52D7EF805AE; Mon, 18 Nov 2024 14:38:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BD48F805BA;
	Mon, 18 Nov 2024 14:38:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6442F8026D; Mon, 18 Nov 2024 14:38:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B2D67F800BA
	for <alsa-devel@alsa-project.org>; Mon, 18 Nov 2024 14:38:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2D67F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=W89kw9/y;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=e2j1A21Q;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=W89kw9/y;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=e2j1A21Q
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 874391F365;
	Mon, 18 Nov 2024 13:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1731937118;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lqZBBu9P0vMQ+LDYax8S5AKlyWD14AuVgXKH6RN0Bqo=;
	b=W89kw9/y0wty21neLLp8Sqg0IlIi1GFSsAUXSswmhwzMWkWoaet+riFLwiJtwSPGkH3yDd
	hUci/P2GR49J6jinabGyxvWnjyEDmru6HVn+TzbRJRabWdVLU0x6mQQil2Y/xeXeU/2y11
	gKkabqcqyCoiNUJuFQ/+1/7Lji+vGQ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1731937118;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lqZBBu9P0vMQ+LDYax8S5AKlyWD14AuVgXKH6RN0Bqo=;
	b=e2j1A21QZRkN1KEH4N+rbTjyL1aKgU0Pn3AOChbvspJXeg/LXxCOUsEFH0oiNHSJbsNHsf
	LOwr0CjeDlIJfDDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1731937118;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lqZBBu9P0vMQ+LDYax8S5AKlyWD14AuVgXKH6RN0Bqo=;
	b=W89kw9/y0wty21neLLp8Sqg0IlIi1GFSsAUXSswmhwzMWkWoaet+riFLwiJtwSPGkH3yDd
	hUci/P2GR49J6jinabGyxvWnjyEDmru6HVn+TzbRJRabWdVLU0x6mQQil2Y/xeXeU/2y11
	gKkabqcqyCoiNUJuFQ/+1/7Lji+vGQ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1731937118;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lqZBBu9P0vMQ+LDYax8S5AKlyWD14AuVgXKH6RN0Bqo=;
	b=e2j1A21QZRkN1KEH4N+rbTjyL1aKgU0Pn3AOChbvspJXeg/LXxCOUsEFH0oiNHSJbsNHsf
	LOwr0CjeDlIJfDDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6971F134A0;
	Mon, 18 Nov 2024 13:38:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1bt1GF5DO2dtaAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 18 Nov 2024 13:38:38 +0000
Date: Mon, 18 Nov 2024 14:38:38 +0100
Message-ID: <87iksk7jc1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC updates for v6.13
In-Reply-To: <448e5dfb7b1c48b7b4a544d2ece10c7e.broonie@kernel.org>
References: <448e5dfb7b1c48b7b4a544d2ece10c7e.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
Message-ID-Hash: 37NDMATFFD7BSFGL5VXE4MZ7HNJ3KHMP
X-Message-ID-Hash: 37NDMATFFD7BSFGL5VXE4MZ7HNJ3KHMP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/37NDMATFFD7BSFGL5VXE4MZ7HNJ3KHMP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 18 Nov 2024 14:32:14 +0100,
Mark Brown wrote:
> 
> The following changes since commit 2ae6da569e34e1d26c5275442d17ffd75fd343b3:
> 
>   ASoC: max9768: Fix event generation for playback mute (2024-11-12 13:16:37 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v6.13
> 
> for you to fetch changes up to 82ff5abc2edcfba0c0f1a1be807795e2876f46e9:
> 
>   ASoC: hdmi-codec: reorder channel allocation list (2024-11-15 13:43:00 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Updates for v6.13
> 
> This release was mainly about new drivers, there's a very large batch of
> new drivers and devices including quite a few from newer vendors which
> is great to see.  Other than the new drivers and the usual routine fixes
> and enhancements the bulk of the work has been Morimoto-san's continuing
> work on simplifiying APIs, plus a few other bits:
> 
>  - More API simplifications from Morimoto-san.
>  - Renaming of the sh directory to Renesas to reflect the focus on other
>    architectures.
>  - Factoring out of some of the common code for Realtek devices.
>  - Support for Allwinner H616, AMD ACP 6.3 systems, AWInic AW88081,
>    Cirrus Logic CS32L84, Everest ES8328, Iron Devices SMA1307, Longsoon
>    I2S, NeoFidelity NTP8918 and NTP8835, Philips UDA1342, Qualcomm
>    SM8750, RealTek RT721, and ST Microelectronics STM32MP25.

Pulled now.  Thanks.


Takashi
