Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCF08B6EBE
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2024 11:48:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A2A982C;
	Tue, 30 Apr 2024 11:48:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A2A982C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714470536;
	bh=hfPsR+TvslFnUBNIuyVhmYr8NyHVE6aQNn+Jr2aVxT4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=c9785Hdi84nf2tw+o7Dyv1FvqIgyp/ubWHwLPikLSB/qZWRd2L4/uFgCnRl5rpfLh
	 IBsfkvb7ejlsIgUbopKsoQvhSWQ8NwnmraBuVNcmJwq/MqxGOnDIxPcoZkoJkhuhvb
	 6JkiEFONZ46/ULKomNtE9RQtJC3QPzVZHCTH0NU0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6045DF8057C; Tue, 30 Apr 2024 11:48:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BA0EAF805A0;
	Tue, 30 Apr 2024 11:48:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3F30F80266; Tue, 30 Apr 2024 11:48:19 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id BA229F8003C
	for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2024 11:48:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA229F8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=O0Q9gOTs;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=+y1fr4wd;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=O0Q9gOTs;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=+y1fr4wd
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7B84633F34;
	Tue, 30 Apr 2024 09:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1714470485;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YH1W+Id/dLTXNgNqYVyigMO3kpW6gBLhkkAjF40ip4g=;
	b=O0Q9gOTssR2CouTHsv10fP/rPWyb8M4EVjgm91B7vKJ5LxZBqnDlN299aQtoIPsiGSpYqJ
	XN58MVx/wctD5O/BltISp3kTgbe+syPf4pI90Xq4aodzacEaKb2DDh0CNV9x3sWUQoFL34
	D67qF90JLeLWIRZVkUkRm/eDPbeYzvE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714470485;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YH1W+Id/dLTXNgNqYVyigMO3kpW6gBLhkkAjF40ip4g=;
	b=+y1fr4wdhVnYDdqhv2HWrGGghC/TOr+KxKyp0PImG2DgoSdQwPymzX1/Yw+VTKUB8TQC0s
	1gV3Mj+ll5qdO3DA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1714470485;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YH1W+Id/dLTXNgNqYVyigMO3kpW6gBLhkkAjF40ip4g=;
	b=O0Q9gOTssR2CouTHsv10fP/rPWyb8M4EVjgm91B7vKJ5LxZBqnDlN299aQtoIPsiGSpYqJ
	XN58MVx/wctD5O/BltISp3kTgbe+syPf4pI90Xq4aodzacEaKb2DDh0CNV9x3sWUQoFL34
	D67qF90JLeLWIRZVkUkRm/eDPbeYzvE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714470485;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YH1W+Id/dLTXNgNqYVyigMO3kpW6gBLhkkAjF40ip4g=;
	b=+y1fr4wdhVnYDdqhv2HWrGGghC/TOr+KxKyp0PImG2DgoSdQwPymzX1/Yw+VTKUB8TQC0s
	1gV3Mj+ll5qdO3DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 68272133A7;
	Tue, 30 Apr 2024 09:48:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Qc5cGFW+MGZLZQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 30 Apr 2024 09:48:05 +0000
Date: Tue, 30 Apr 2024 11:48:17 +0200
Message-ID: <87zftbmba6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>
Subject: Re: Thinkpad with ALC1318 has a chance of damaging the IC
In-Reply-To: <a853dc4f0a4e412381d5f60565181247@realtek.com>
References: <c646c8ef954d41e6b8fa78b202fd306d@realtek.com>
	<87o7a7xkas.wl-tiwai@suse.de>
	<acb0953b16d14047ae581772268c1e7c@realtek.com>
	<87le5awul9.wl-tiwai@suse.de>
	<a853dc4f0a4e412381d5f60565181247@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email]
Message-ID-Hash: 3TPAHZ7C6BMLZ3S2LZHE7S6GM3GEEFP7
X-Message-ID-Hash: 3TPAHZ7C6BMLZ3S2LZHE7S6GM3GEEFP7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3TPAHZ7C6BMLZ3S2LZHE7S6GM3GEEFP7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 30 Apr 2024 11:19:40 +0200,
Kailang wrote:
> 
> Attached new patch.

OK, applied now.


thanks,

Takashi


> > -----Original Message-----
> > From: Takashi Iwai <tiwai@suse.de>
> > Sent: Thursday, April 18, 2024 11:37 PM
> > To: Kailang <kailang@realtek.com>
> > Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>
> > Subject: Re: Thinkpad with ALC1318 has a chance of damaging the IC
> > 
> > 
> > External mail.
> > 
> > 
> > 
> > On Thu, 18 Apr 2024 08:33:42 +0200,
> > Kailang wrote:
> > >
> > > Hi Takashi,
> > >
> > > New patch was attached.
> > > new additional function was request from Lenovo.
> > 
> > I got a compile error.  The check should be rather
> > 
> >         if (codec->core.dev.power.power_state.event == PM_EVENT_FREEZE)
> > 
> > Maybe better to define is_s4_suspend() just like is_s4_resume().
> > 
> > And, please rebase the patch to the latest for-linus branch of sound.git tree.
> > 
> > 
> > thanks,
> > 
> > Takashi
> > 
> > >
> > > BR,
> > > Kailang
> > >
> > > > -----Original Message-----
> > > > From: Takashi Iwai <tiwai@suse.de>
> > > > Sent: Thursday, April 18, 2024 2:22 PM
> > > > To: Kailang <kailang@realtek.com>
> > > > Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>
> > > > Subject: Re: Thinkpad with ALC1318 has a chance of damaging the IC
> > > >
> > > >
> > > > External mail.
> > > >
> > > >
> > > >
> > > > On Mon, 15 Apr 2024 11:27:50 +0200,
> > > > Kailang wrote:
> > > > >
> > > > > Hi Takashi,
> > > > >
> > > > > Please don't apply this patch.
> > > > > They want to add stream open to enable GPIO3 functions.
> > > >
> > > > OK, let me know if the new patch is ready.
> > > >
> > > >
> > > > thanks,
> > > >
> > > > Takashi
> > > >
> > > > >
> > > > > BR,
> > > > > Kailang
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Kailang
> > > > > > Sent: Wednesday, April 10, 2024 5:23 PM
> > > > > > To: Takashi Iwai (tiwai@suse.de) <tiwai@suse.de>
> > > > > > Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>
> > > > > > Subject: Thinkpad with ALC1318 has a chance of damaging the IC
> > > > > >
> > > > > > Hi Takashi,
> > > > > >
> > > > > > Thinkpad with ALC1318 has a chance of damaging the IC at S4 resume.
> > > > > >
> > > > > > BR,
> > > > > > Kailang
> > >
> 
