Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF31893AAF
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 13:45:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 173B022C9;
	Mon,  1 Apr 2024 13:44:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 173B022C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711971903;
	bh=mRH/4AnFnz8F1ujnCdhf0gADx01YxKeux0q9imCjYk0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cshmksSW6b5TzJ8vjhFyJyAQu4fNKS9cjbXOU2Bfo0OXPHTjvwUaGcFkPdgg2xOya
	 64Ir5vcxJpP/FBE44TQH48pU8WZXS2Ij7iUtHMpapqTAFUdzbyJ17PYzb5Ef/TfgjU
	 XNWJ6Es8z+CgOILPHtPHn7ixA4pqSTuIcoUojOsA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 917B8F805AF; Mon,  1 Apr 2024 13:44:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 53FAEF8055C;
	Mon,  1 Apr 2024 13:44:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 479DBF80236; Mon,  1 Apr 2024 13:44:24 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 577F2F8016E
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 13:44:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 577F2F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=nNA/J9KR;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=u0xXrDp1
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7DEA1201B2;
	Mon,  1 Apr 2024 11:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1711971853;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4b4pOuVnVa2b7wCP2qWaNboruRj+293BXnsb6acQj50=;
	b=nNA/J9KRzW0fvE0DkwA0J8OHlqnXU0tvq2kTbg5A59ahB9kXp39j83aa7HzCzvKylOEFDE
	4hqs464DZaL6GPoL6CS9Q51MDbRhuHbgipBYcvaUOeVI9YflzJL4kGBjU8ZBgA88AE7Q7c
	u5kxl0hq5j8MbUfdg8BJzL4zbZ0DeXg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1711971853;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4b4pOuVnVa2b7wCP2qWaNboruRj+293BXnsb6acQj50=;
	b=u0xXrDp1KEP1jAWpSwzjty8gJKgRo0IUi7e28ybvQeqnHzwCW7JNX2onaKDLmEFIuQ+XvR
	RC/AF1dBrBa2HhBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=none
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 53674139BE;
	Mon,  1 Apr 2024 11:44:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id zvzKEg2eCmZ/DwAAn2gu4w
	(envelope-from <tiwai@suse.de>); Mon, 01 Apr 2024 11:44:13 +0000
Date: Mon, 01 Apr 2024 13:44:17 +0200
Message-ID: <87ttkle29a.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Cc: alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: Re: [PATCH 00/18] ALSA: emu10k1 & emux: fixes related to wavetable
 playback
In-Reply-To: <ZgqYDAXb2HKw6IiE@ugly>
References: <20240401100742.506001-1-oswald.buddenhagen@gmx.de>
	<87r0fp5paj.wl-tiwai@suse.de>
	<ZgqYDAXb2HKw6IiE@ugly>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 7DEA1201B2
X-Spamd-Result: default: False [-1.24 / 50.00];
	BAYES_HAM(-1.93)[94.60%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmx.de];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	R_DKIM_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmx.de,internode.on.net];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[alsa-project.org,perex.cz,internode.on.net];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_THREE(0.00)[4]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
Message-ID-Hash: 3KEAFKRJNFYBGVK7SKACP5KNWZIH3YO5
X-Message-ID-Hash: 3KEAFKRJNFYBGVK7SKACP5KNWZIH3YO5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3KEAFKRJNFYBGVK7SKACP5KNWZIH3YO5/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 01 Apr 2024 13:18:36 +0200,
Oswald Buddenhagen wrote:
> 
> On Mon, Apr 01, 2024 at 12:51:32PM +0200, Takashi Iwai wrote:
> > Could you give Fixes tag in each commit if it's a regression fix for
> > the  corresponding commit?
> > 
> i did. you'll see it when the later patches arrive (minor hiccup with
> mail delivery on my end ...).
> 
> of course this won't help a lot with picking to stable, because the fix
> actually depends on several of the prior patches. i can re-arrange the
> series to minimize the hard dependency chain, but it will still be ~10
> patches.
>
> an alternative approach would be just reverting the offending patch and
> re-fixing it as part of the subsequent series. the revert would be
> easily pickable, but that merely replaces the current problem with the
> (admittedly less audible) previous problem. your choice.

Judging from the amount of patches, I prefer a quicker "fix" for the
known regression, so a revert-and-rewrite sounds more like a
reasonable approach.  Care to resubmit with that?


thanks,

Takashi
