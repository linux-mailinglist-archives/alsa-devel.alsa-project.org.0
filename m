Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A10B78B1D03
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Apr 2024 10:46:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32708E65;
	Thu, 25 Apr 2024 10:46:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32708E65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714034771;
	bh=4ZwS23tJmBQ7rn5u9jMGRugfkV8QmnG5WYrW71x+JmU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Uuwrqr3mwOmS2WPI2YIF8Xp3dN+/fH0fxDjM916LLYJx1CXl8VvmKwCjGcD/ucx9L
	 gtcGWzsJH83EbJCRBknNmm7mPa7BwZmJreVob2BOi2VqLrErz+aJmUrvNouh/vhCk/
	 GUyKJWTOs4DVjieLCnwUEGM27nADmSxVnUnjEXPs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1590F805AE; Thu, 25 Apr 2024 10:45:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 56CB0F80579;
	Thu, 25 Apr 2024 10:45:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39801F80423; Thu, 25 Apr 2024 10:45:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A151BF800B5
	for <alsa-devel@alsa-project.org>; Thu, 25 Apr 2024 10:45:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A151BF800B5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=NgQTp7Sv;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=iq3h0us4;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=NgQTp7Sv;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=iq3h0us4
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B9AC121A3E;
	Thu, 25 Apr 2024 08:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1714034729;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dNDJ4DzALde89Y14WJrBYkitz3hfwwSaY+lFmcZW88w=;
	b=NgQTp7SvCnpMAUopn8g0eiemr/FLaHi8KziKh3QbLZMl7WficSwoQZTLZkvshxyelMr96/
	L2fiYuDJYdNlxXIWv6TlyN+YlMRPw2ewa5IBDzFcB9S33H7vkxLCNgHdNBRkNN//I97kqn
	ALJH9WYLCIPj1Ps1tuOVX27ru9FUJb4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714034729;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dNDJ4DzALde89Y14WJrBYkitz3hfwwSaY+lFmcZW88w=;
	b=iq3h0us4TJqrYSxk6yo5Wl3Sv9nradCa/JqirV2fjznHwhm8GpKl/N9+9lPFzWgZaMijl4
	ygvRKXeqAmndHZBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=NgQTp7Sv;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=iq3h0us4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1714034729;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dNDJ4DzALde89Y14WJrBYkitz3hfwwSaY+lFmcZW88w=;
	b=NgQTp7SvCnpMAUopn8g0eiemr/FLaHi8KziKh3QbLZMl7WficSwoQZTLZkvshxyelMr96/
	L2fiYuDJYdNlxXIWv6TlyN+YlMRPw2ewa5IBDzFcB9S33H7vkxLCNgHdNBRkNN//I97kqn
	ALJH9WYLCIPj1Ps1tuOVX27ru9FUJb4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714034729;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dNDJ4DzALde89Y14WJrBYkitz3hfwwSaY+lFmcZW88w=;
	b=iq3h0us4TJqrYSxk6yo5Wl3Sv9nradCa/JqirV2fjznHwhm8GpKl/N9+9lPFzWgZaMijl4
	ygvRKXeqAmndHZBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 865D513991;
	Thu, 25 Apr 2024 08:45:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Q8MkICkYKmYGIgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 25 Apr 2024 08:45:29 +0000
Date: Thu, 25 Apr 2024 10:45:36 +0200
Message-ID: <87a5lhbzkf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Aaron Ma <aaron.ma@canonical.com>
Cc: shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Subject: Re: [PATCH] ALSA: hda/ASOC tas2781: align the path of firmware
In-Reply-To: <11d5d3db-d5ba-4a02-9c58-400075f2918e@canonical.com>
References: <20240425072000.22284-1-aaron.ma@canonical.com>
	<87h6fpc21p.wl-tiwai@suse.de>
	<3ba54d1d-7b09-4257-9f05-9a1182bf03dc@canonical.com>
	<87edatc001.wl-tiwai@suse.de>
	<11d5d3db-d5ba-4a02-9c58-400075f2918e@canonical.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: B9AC121A3E
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
Message-ID-Hash: XKO7IQTQSAMOQQHYEBJMFLNZ26W7PWAI
X-Message-ID-Hash: XKO7IQTQSAMOQQHYEBJMFLNZ26W7PWAI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XKO7IQTQSAMOQQHYEBJMFLNZ26W7PWAI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 25 Apr 2024 10:40:50 +0200,
Aaron Ma wrote:
> 
> 
> On 4/25/24 16:36, Takashi Iwai wrote:
> > On Thu, 25 Apr 2024 09:54:17 +0200,
> > Aaron Ma wrote:
> >> 
> >> 
> >> On 4/25/24 15:52, Takashi Iwai wrote:
> >> 
> >>      On Thu, 25 Apr 2024 09:20:00 +0200,
> >>      Aaron Ma wrote:
> >>               TI upstream the files in ti/tas2781 for
> >> linux-firmware.
> >>          Make the driver find the correct files.
> >>               Note that the upstream linux-firmware provides
> >> symlinks to
> >>      ti/tas2781/* files, so it's not "incorrect", so far :)
> >> 
> >> $ find . -iname TIAS2781RCA2.bin
> >> ./ti/tas2781/TIAS2781RCA2.bin
> >> 
> >> Only one bin file found.
> >> Could you point it out clearly?
> > 
> > See WHENCE file.  It has "Link:" entries, and copy-firmware.sh creates
> > corresponding symlinks.
> 
> Oh, missed it.
> Retrieve the patch.

OK.  I guess ti/*/* is a better place for newer firmware files
(and likely intended by TI), but it's up to TI whether we should
update or not for newer chips.  Let's see.


thanks,

Takashi
