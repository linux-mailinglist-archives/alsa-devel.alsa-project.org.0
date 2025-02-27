Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C62A47637
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Feb 2025 08:02:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C30EF6034B;
	Thu, 27 Feb 2025 08:02:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C30EF6034B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1740639741;
	bh=/o5Rh4/b7D5EpLQrxfDRvAYPVd78Q64ILQCKU4wMR2s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gsdoLH7WUGIBT/j2O0yio3K4d6n/25Zb3eM9/arNjt5PQbKcXCtXvwpq+Dhf/cQVL
	 kVPBAAiyZvqu/B/EeaHepJgnwop2J0zcChwTncvDEFIih8xDg2B5R3OT8eZwICVPKs
	 nJZ3yBdcZH26zITHGPkRwW7FL24XJMpzTG3zNJ4g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8088CF805C0; Thu, 27 Feb 2025 08:01:48 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5645AF805AE;
	Thu, 27 Feb 2025 08:01:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C02C8F8021D; Thu, 27 Feb 2025 08:01:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B2B5F800E5
	for <alsa-devel@alsa-project.org>; Thu, 27 Feb 2025 08:01:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B2B5F800E5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Q4+Bio+2;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=NDqolwew;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=Q4+Bio+2;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=NDqolwew
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8A27E1F38A;
	Thu, 27 Feb 2025 07:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1740639699;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HXT9aAfKJ4P/NSCotlaojsRIxlADd+L97nb2iCJJ7tc=;
	b=Q4+Bio+2QZ9SASl/yRel5gXlYwq2VGVieL0+toBv1yEwSmpjeVEVq1YjwkeiKqw64Dmi6v
	Db7XWXSSIyf40rQ9kOOgnlOYu0ibudazK3piAfHBOrqm18rHYl7blzjvUssb65t1zAz9NN
	5p0laAvlH2rYiVH+Vi9YNXHHNs2K+mU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740639699;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HXT9aAfKJ4P/NSCotlaojsRIxlADd+L97nb2iCJJ7tc=;
	b=NDqolwewQuinG7LCGFOOEORxb34+th/zU3H+HHMtQcBHEJlfb3Y9sykim9wpao0NUP+3tv
	lX8aXjHgIzqCiRBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Q4+Bio+2;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=NDqolwew
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1740639699;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HXT9aAfKJ4P/NSCotlaojsRIxlADd+L97nb2iCJJ7tc=;
	b=Q4+Bio+2QZ9SASl/yRel5gXlYwq2VGVieL0+toBv1yEwSmpjeVEVq1YjwkeiKqw64Dmi6v
	Db7XWXSSIyf40rQ9kOOgnlOYu0ibudazK3piAfHBOrqm18rHYl7blzjvUssb65t1zAz9NN
	5p0laAvlH2rYiVH+Vi9YNXHHNs2K+mU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740639699;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HXT9aAfKJ4P/NSCotlaojsRIxlADd+L97nb2iCJJ7tc=;
	b=NDqolwewQuinG7LCGFOOEORxb34+th/zU3H+HHMtQcBHEJlfb3Y9sykim9wpao0NUP+3tv
	lX8aXjHgIzqCiRBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6A15313888;
	Thu, 27 Feb 2025 07:01:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xSdDGNMNwGegYwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 27 Feb 2025 07:01:39 +0000
Date: Thu, 27 Feb 2025 08:01:38 +0100
Message-ID: <87a5a73m7h.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Lena <lena@nihil.gay>
Cc: alsa-devel@alsa-project.org
Subject: Re: ALSA USB quirk mixer driver question
In-Reply-To: <527b73fe-892f-476e-95e7-7c0cd09df1d0@nihil.gay>
References: <6f03b7d6-97d5-48a4-be6f-a1df481971fc@nihil.gay>
	<87cyf557kv.wl-tiwai@suse.de>
	<527b73fe-892f-476e-95e7-7c0cd09df1d0@nihil.gay>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 8A27E1F38A
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
Message-ID-Hash: KSNFZKH7GOGN4GKXFLPO3EANRNFHM33N
X-Message-ID-Hash: KSNFZKH7GOGN4GKXFLPO3EANRNFHM33N
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KSNFZKH7GOGN4GKXFLPO3EANRNFHM33N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 27 Feb 2025 00:15:01 +0100,
Lena wrote:
> 
> Thanks for the reply!
> 
> So, if i understand correctly, instead of going through
> sound/usb/mixer_quirks.c, i need to create a standalone USBHID driver
> that exposes the ALSA kcontrols and then the ALSA userspace
> understands that it's the same interface and 'links' the
> UAC/isochronous audio part and the standalone ALSA mixer kcontrol part
> that has the volume knobs, mute, output select and input
> impedance/phantom power/headphone gain switches such that an userspace
> application (like alsamixer) treats it all as a single thing.

Well, how to manage HID device is other question.  Usually a HID
device provides the controls via input device API.  It's not
prohibited to use a sound API (in this case you'd need to create your
own sound card object), though.

> Does this driver then belong in sound/usb/ (given it imports the API
> in <sound/control.h>) or somewhere else (e.g. drivers/hid/usbhid/,
> drivers/usb/)?

Not likely.  It'll be a pure HID driver.


HTH,

Takashi
