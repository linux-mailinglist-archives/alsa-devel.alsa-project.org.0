Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D70C899ADF
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Apr 2024 12:30:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F14792D03;
	Fri,  5 Apr 2024 12:30:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F14792D03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712313011;
	bh=leoE7kS0L9aZrdEKE2+xsF8vyWhVtEMH1Bvpai1gEaY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WEdv820kj5XUXaCNgIPefEolwtBW1MqqxQ/YFG5xTaywlER+c3hmIkl2x8I4WCITm
	 tRh0m9soeTYFkc8ZFrozzq6mHyNpyJC9RzC5GOT6s7taUuwWqj00MHgHX6jC2/0ND+
	 I/r3Ih5ls8W2bjxCeYf7qammF7FVNTS+08VZoDa4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49EB6F805AA; Fri,  5 Apr 2024 12:29:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E4F7EF8020D;
	Fri,  5 Apr 2024 12:29:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FF3CF8020D; Fri,  5 Apr 2024 12:29:31 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B6EB4F8015B
	for <alsa-devel@alsa-project.org>; Fri,  5 Apr 2024 12:29:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6EB4F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=R/Wrc+PG;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=gjg2Xsqo;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=R/Wrc+PG;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=gjg2Xsqo
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 973541F78A;
	Fri,  5 Apr 2024 10:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1712312960;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W/BBCTLXoOFNiPV/VjRcdovDlIs+2UEQrQub9Z4VEnY=;
	b=R/Wrc+PGjG0OWPnkfrfc/IWU3HI/6eycn/OKXVGBpl0NaOZs7ISRql7UBy5+lVD7jiwg+5
	a2cydxg8rPtXpYofPNvIq9Im5zWO/s3F9533lGFlKbPj1t206ds7cr384xrj+/aZlJ+WJb
	0DL+7opDOLFG8SV47Cm+OvpoCRYwOJo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1712312960;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W/BBCTLXoOFNiPV/VjRcdovDlIs+2UEQrQub9Z4VEnY=;
	b=gjg2XsqoXvlTkHF/iNyRGhZRz/5MkImkn18MT7V7aUGCZ3V1OJPKXR1ucWH1o7rFirO7Ms
	saMpv0YqhhYptCDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="R/Wrc+PG";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=gjg2Xsqo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1712312960;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W/BBCTLXoOFNiPV/VjRcdovDlIs+2UEQrQub9Z4VEnY=;
	b=R/Wrc+PGjG0OWPnkfrfc/IWU3HI/6eycn/OKXVGBpl0NaOZs7ISRql7UBy5+lVD7jiwg+5
	a2cydxg8rPtXpYofPNvIq9Im5zWO/s3F9533lGFlKbPj1t206ds7cr384xrj+/aZlJ+WJb
	0DL+7opDOLFG8SV47Cm+OvpoCRYwOJo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1712312960;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W/BBCTLXoOFNiPV/VjRcdovDlIs+2UEQrQub9Z4VEnY=;
	b=gjg2XsqoXvlTkHF/iNyRGhZRz/5MkImkn18MT7V7aUGCZ3V1OJPKXR1ucWH1o7rFirO7Ms
	saMpv0YqhhYptCDA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 67BDD139E8;
	Fri,  5 Apr 2024 10:29:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id drjdF4DSD2YHbgAAn2gu4w
	(envelope-from <tiwai@suse.de>); Fri, 05 Apr 2024 10:29:20 +0000
Date: Fri, 05 Apr 2024 12:29:25 +0200
Message-ID: <87zfu8m7ay.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Cc: alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH v2 00/17] ALSA: emu10k1 & emux: fixes related to wavetable
 playback
In-Reply-To: <Zg/NfajQ3gdsmbUb@ugly>
References: <20240404100048.819674-1-oswald.buddenhagen@gmx.de>
	<875xwwnp27.wl-tiwai@suse.de>
	<Zg/NfajQ3gdsmbUb@ugly>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 973541F78A
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmx.de];
	FREEMAIL_ENVRCPT(0.00)[gmx.de];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap2.dmz-prg2.suse.org:helo,imap2.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
Message-ID-Hash: U5HOKIRM3THXDIWFW3M4WBOOGTS5W76H
X-Message-ID-Hash: U5HOKIRM3THXDIWFW3M4WBOOGTS5W76H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U5HOKIRM3THXDIWFW3M4WBOOGTS5W76H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 05 Apr 2024 12:07:57 +0200,
Oswald Buddenhagen wrote:
> 
> On Fri, Apr 05, 2024 at 11:20:32AM +0200, Takashi Iwai wrote:
> > On Thu, 04 Apr 2024 12:00:31 +0200,
> > Oswald Buddenhagen wrote:
> >> 
> >> ---
> >> This patch series needs to be applied on top of the patch titled
> >> "Revert "ALSA: emu10k1: fix synthesizer sample playback position and
> >> caching"".
> > 
> > The patch set isn't cleanly applicable even after the revert patch.
> > The patch 7 fails.
> > 
> > Please rebase to the latest for-linus branch and resubmit.
> > 
> this makes no sense; i'm getting a bit-identical patch after the rebase
> (which is unsurprising, as the file in question wasn't touched in
> years).
> 
> are you sure you didn't corrupt the patch somehow (it happened before,
> cf. summary of c960b012ec47)? or maybe you have an unpublished
> conflicting commit?
>
> if there is an actual problem and you just named the wrong patch, then i
> suspect that it's just git-am being stupid - the rebases from 6.8 and
> later from your master from about a week ago went through smoothly.

No, I used b4 at this time, and such a failure shouldn't happen.

Try by yourself to apply the submitted patch mails with git-am on the
latest for-linus (or master) branch.


thanks,

Takashi
