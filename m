Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB188BCFC4
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2024 16:12:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D40CA825;
	Mon,  6 May 2024 16:11:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D40CA825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715004727;
	bh=p+Xdhnx4wdy3lSPFf7UhNmEtwq/+hm1NyXd/vNKFYHo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pvZ87CliCsWz3L5NtNVI0Zd9Q6Hu9AYMnqn2hq6sCMK0lydht7Ff1HapaCneey24O
	 iyTTsCjEYy4jFrD1ixjpZm80LLO6A+cBcpv59GCxH/14wGQaglrEtH0slbWPlcAHY6
	 eF7/SZ7qRFhYf57r+RF15koueqFmA+DXr7hOh+XI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5895CF805A9; Mon,  6 May 2024 16:11:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7537FF8057D;
	Mon,  6 May 2024 16:11:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38994F8049C; Mon,  6 May 2024 16:11:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B725AF800E2
	for <alsa-devel@alsa-project.org>; Mon,  6 May 2024 16:11:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B725AF800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=jb76RfXx;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=QfrpxTz3;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=Z8RU8VIQ;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=q8BsFXKZ
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CD9815FE40;
	Mon,  6 May 2024 14:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1715004681;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W57xwqkuyj/BWWW3i9ykpNAisrJ4FnrNu4TpCOGhdk8=;
	b=jb76RfXx6bCPNKizKzh1kaEFbGjdIB1FV30CZ1CP57PweztgeVs1iXumbCE3bNpPbjEIn6
	X4gWZnBnOdQASD+UzC12NVevemPLSNszQOjVbpAaMigwxoM4bGs8L86LkATrq1YmGUL6/s
	I36jpcw1Oih2QxAZQ6svdq2/D8ObhTI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715004681;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W57xwqkuyj/BWWW3i9ykpNAisrJ4FnrNu4TpCOGhdk8=;
	b=QfrpxTz3SEOLSOco9ZwQ2SPVUsJLIzGXFG97XnUcnnr2UIma8exJONWPyyrQ2N+fzu5wS2
	vR4k/jjB3LqIifCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Z8RU8VIQ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=q8BsFXKZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1715004680;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W57xwqkuyj/BWWW3i9ykpNAisrJ4FnrNu4TpCOGhdk8=;
	b=Z8RU8VIQUoAXVNaXqLxnp5+MmrJePvjhW/tDqlpAcpk2+iusOJG7L2k8WDsmz4wBGXnzrn
	pyccbK5QvSxUZf7oZLVA7lAkJ2Mkbgzpl7KE/N7KySmQwkx0gVLrx8+NAi88gc8Se2O9o0
	v90okfXCdJGM+fHk/PzU74886dH9lrM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715004680;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W57xwqkuyj/BWWW3i9ykpNAisrJ4FnrNu4TpCOGhdk8=;
	b=q8BsFXKZwBl8guKysW9Sl8VvEI+IrGwLY1ivkdFXInztTbe2wFggUEeYZ6oCwAGoZlKXVl
	WGrVIVK504VvL5Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B00F113A25;
	Mon,  6 May 2024 14:11:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CVjAKQjlOGYhaQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 06 May 2024 14:11:20 +0000
Date: Mon, 06 May 2024 16:11:35 +0200
Message-ID: <87a5l3ghd4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Manu <mbarriolinares@gmail.com>
Cc: alsa-devel@alsa-project.org,
	kernelnewbies@kernelnewbies.org
Subject: Re: ALSA: usb-audio: Adding mixer controls to Mbox3
In-Reply-To: 
 <CA+64nrt8gP5gJXaC=MS5AHjfZFSz=AvUT-CcRV9o2+zSenVXfg@mail.gmail.com>
References: <87cyq7nw19.wl-tiwai@suse.de>
	<20240430171020.192285-1-mbarriolinares@gmail.com>
	<87mspakltl.wl-tiwai@suse.de>
	<CA+64nrt8gP5gJXaC=MS5AHjfZFSz=AvUT-CcRV9o2+zSenVXfg@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-5.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: CD9815FE40
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: 5J4QTEBKKLGBPE6FCFBSNLMPP6EJZ2RN
X-Message-ID-Hash: 5J4QTEBKKLGBPE6FCFBSNLMPP6EJZ2RN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5J4QTEBKKLGBPE6FCFBSNLMPP6EJZ2RN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 01 May 2024 16:31:35 +0200,
Manu wrote:
> 
> Thank you for all your help, Takashi!
> 
> I would like to add the hardware mixer controls for Mbox3.
> I have already identified every control in the function "mbox3_setup_defaults"
> of "quirks.c", but I am unsure about the structure needed to make the controls
> appear in alsamixer (further investigation is required). I would appreciate any
> help you or anyone else can provide.

I believe it'd be helpful if you can show some mock up or any examples
you wanted to try (or had in your head).  If the question was about
the complexity or too many code to add there, you can split to another
file, too.


thanks,

Takashi

> 
> Manuel Barrio Linares
> 
> 
> On Wed, May 1, 2024 at 4:55 AM Takashi Iwai <tiwai@suse.de> wrote:
> >
> > On Tue, 30 Apr 2024 19:10:18 +0200,
> > Manuel Barrio Linares wrote:
> > >
> > > This adds support for all sample rates supported by the
> > > hardware,Digidesign Mbox 3 supports: {44100, 48000, 88200, 96000}
> > >
> > > Fixes syncing clock issues that presented as pops. To test this, without
> > > this patch playing 440hz tone produces pops.
> > >
> > > Clock is now synced between playback and capture interfaces so no more
> > > latency drift issue when using pipewire pro-profile.
> > > (https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/3900)
> > >
> > > Signed-off-by: Manuel Barrio Linares <mbarriolinares@gmail.com>
> >
> > Applied to for-next branch now.  Thanks!
> >
> >
> > Takashi
