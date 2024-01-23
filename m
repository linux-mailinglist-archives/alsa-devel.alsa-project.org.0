Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2BA839115
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jan 2024 15:16:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8125EE97;
	Tue, 23 Jan 2024 15:16:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8125EE97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706019384;
	bh=oEspfoFO05yzAviOiXySAnGDCi0hgKsktBv6RZDeiPc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GNQD5glvRcP/aTiWSz5NfHesXDHgx3Ha2szqt4eX1mcNogZINdE9w/By8Mkrr28zD
	 zVpIrsYZWacxCbmExfNdah9VFMtGWQRo1nSsg5Jsjii/yNOF9OBsoyAbFHwL7xPo3Q
	 S7uP2KaQ5aX5K8XnViu4aQRAkJoOViWCnI1CZfJc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0212F805BF; Tue, 23 Jan 2024 15:15:09 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BAC9EF80589;
	Tue, 23 Jan 2024 15:15:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 752C3F8059F; Tue, 23 Jan 2024 15:15:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 27E97F8057B
	for <alsa-devel@alsa-project.org>; Tue, 23 Jan 2024 15:14:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27E97F8057B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=yPCkMcIT;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=WWVaL8YF;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=Iq56RTeh;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=YWPKdi8B
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C55C21FD9D;
	Tue, 23 Jan 2024 14:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1706019282;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=48Zdgq+cJITCIoj+JZsjJPnJyJ76eCLaTzFd0e3VeAg=;
	b=yPCkMcITohU3QVF/WJYgaPODWAhe/Mwf4eKH8sUbuZ3UdBKP5jBkY6S64hS9TvRu7Kciuz
	RxErHR6H47VtzAPsoVqQvQcdvgi6kh81X7ncvI37+nDIxKiq0rRbKnGdwv9BuO3SJbiQbJ
	3r4hqbDMEUO9SjqlaTLEgYG6J5Gydow=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706019282;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=48Zdgq+cJITCIoj+JZsjJPnJyJ76eCLaTzFd0e3VeAg=;
	b=WWVaL8YFWaOi1tgIEwOz+nYmSt602SzQRhw6SYK5+O5BLrg1aPybe9qGA6z4SygCjNVvku
	rYSsZLttsMXH/bCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1706019281;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=48Zdgq+cJITCIoj+JZsjJPnJyJ76eCLaTzFd0e3VeAg=;
	b=Iq56RTeh5BqrFqdLSxK+PNX6gINXzzjKmigNOBTPiAuzcREF1i6i/OrjqlkIbgl5X3lTB8
	pDbIXYmgVj5NaXJ8EIr9fsrqZT4bAIt29QUP/vyiCqQDGRRDy/1/xUSZwFGHvxzgb9wqo/
	1nu502NwOChBEK20WEMa2ZcHjTg9BLg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706019281;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=48Zdgq+cJITCIoj+JZsjJPnJyJ76eCLaTzFd0e3VeAg=;
	b=YWPKdi8BtQariZj8khsUp7R43IWseBWw9ru/ngy6cBdJZGMh0W5YZ31OPJxwniLBNVs7Ts
	aSyLleVDWMDva9Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B4EF113786;
	Tue, 23 Jan 2024 14:14:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HAenK9HJr2VtXgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 23 Jan 2024 14:14:41 +0000
Date: Tue, 23 Jan 2024 15:14:41 +0100
Message-ID: <87mssw6sry.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Alexander Tsoy <alexander@tsoy.me>
Cc: alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ALSA: usb-audio: Skip setting clock selector for single
 connections
In-Reply-To: <20240123134635.54026-1-alexander@tsoy.me>
References: <20240123134635.54026-1-alexander@tsoy.me>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-1.97 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[3];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.87)[99.43%]
Message-ID-Hash: W4YIHPEYASC4DFPQI7QPMSJ6TNPVETLE
X-Message-ID-Hash: W4YIHPEYASC4DFPQI7QPMSJ6TNPVETLE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W4YIHPEYASC4DFPQI7QPMSJ6TNPVETLE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 23 Jan 2024 14:46:35 +0100,
Alexander Tsoy wrote:
> 
> Since commit 086b957cc17f5 ("ALSA: usb-audio: Skip the clock selector
> inquiry for single connections") we are already skipping clock selector
> inquiry if only one clock source is connected, but we are still sending
> a set request. Lets skip that too.
> 
> This should fix errors when setting a sample rate on devices that don't
> have any controls present within the clock selector. An example of such
> device is the new revision of MOTU M Series (07fd:000b):
> 
>       AudioControl Interface Descriptor:
>         bLength                 8
>         bDescriptorType        36
>         bDescriptorSubtype     11 (CLOCK_SELECTOR)
>         bClockID                1
>         bNrInPins               1
>         baCSourceID(0)          2
>         bmControls           0x00
>         iClockSelector          0
> 
> Perhaps we also should check if clock selectors are readable and writeable
> like we already do for clock sources, but this is out of scope of this
> patch.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217601
> Signed-off-by: Alexander Tsoy <alexander@tsoy.me>

Thanks, applied.


Takashi
