Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEE083F56D
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Jan 2024 13:10:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C097F828;
	Sun, 28 Jan 2024 13:10:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C097F828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706443844;
	bh=D0uL3lH0FVrQXu93KAKOmdSWdLEBHIK4IfRiqatNGn8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NHDbyG4y+yugjKQjYYxpOb+MK/s8JNL9tZwri4GI+rD8mHeS6Nyhj/7CtiFtzdSaz
	 99iC/Vjt1rjxpLhvlO0A3toagDDlas1+ap+VzwCUv3VChcmZwZYJywgLfpO4rwk7vJ
	 Gl+L/E5zbBmYjmgxpv7akXuoNY5MjyZ4t198Us+g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0CF0F8056F; Sun, 28 Jan 2024 13:10:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 02393F8022B;
	Sun, 28 Jan 2024 13:10:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F157F80425; Sun, 28 Jan 2024 13:10:09 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D8106F8022B
	for <alsa-devel@alsa-project.org>; Sun, 28 Jan 2024 13:09:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8106F8022B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=EJ+7YIgF;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Fmf6Flud;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=EJ+7YIgF;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Fmf6Flud
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 25ABF1F785;
	Sun, 28 Jan 2024 12:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1706443798;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n9R1exAl60BblNjDcdNrpospLKobUXh6fuNHr7QGsvE=;
	b=EJ+7YIgFF2mlm0Jcwv5iGiRyAFkvjjqHGP48wbx00rwOdD/98RD3RRhHEeUtI/TXpVeRe3
	H9ikwmXMVC+y2UbYTW4vsP4HVq5cRfkihowWkZ6mJS4Sw69EDDWEOPvMexNEtbCWSXUcrH
	9d9lBlPu6V7D42pWBpSFC52/Pxdu4vk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706443798;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n9R1exAl60BblNjDcdNrpospLKobUXh6fuNHr7QGsvE=;
	b=Fmf6FludLUw2YGaCcFNUmjxLmJ9xV6JHpvAKl1vCY4lYTjhYUhm1k6Q9xYvFXxnTtL9+cV
	Zz2reP0XTs0cnECA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1706443798;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n9R1exAl60BblNjDcdNrpospLKobUXh6fuNHr7QGsvE=;
	b=EJ+7YIgFF2mlm0Jcwv5iGiRyAFkvjjqHGP48wbx00rwOdD/98RD3RRhHEeUtI/TXpVeRe3
	H9ikwmXMVC+y2UbYTW4vsP4HVq5cRfkihowWkZ6mJS4Sw69EDDWEOPvMexNEtbCWSXUcrH
	9d9lBlPu6V7D42pWBpSFC52/Pxdu4vk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706443798;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n9R1exAl60BblNjDcdNrpospLKobUXh6fuNHr7QGsvE=;
	b=Fmf6FludLUw2YGaCcFNUmjxLmJ9xV6JHpvAKl1vCY4lYTjhYUhm1k6Q9xYvFXxnTtL9+cV
	Zz2reP0XTs0cnECA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EB4CB12FF7;
	Sun, 28 Jan 2024 12:09:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MOGYNxVEtmXwCQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 28 Jan 2024 12:09:57 +0000
Date: Sun, 28 Jan 2024 13:09:57 +0100
Message-ID: <8734uhoe0a.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Alexander Tsoy <alexander@tsoy.me>
Cc: linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Jaroslav
 Kysela <perex@perex.cz>
Subject: Re: [PATCH] ALSA: usb-audio: Skip setting clock selector for single
 connections
In-Reply-To: <3d4b6eca78d222598f8313c1fca34f3b9ee0bdba.camel@tsoy.me>
References: <20240123134635.54026-1-alexander@tsoy.me>
	<87mssw6sry.wl-tiwai@suse.de>
	<3d4b6eca78d222598f8313c1fca34f3b9ee0bdba.camel@tsoy.me>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=EJ+7YIgF;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Fmf6Flud
X-Spamd-Result: default: False [-2.02 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.71)[98.73%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 25ABF1F785
Message-ID-Hash: MWSFFI4SZH5TKMOA7LJO3KEO6LOKOTQ5
X-Message-ID-Hash: MWSFFI4SZH5TKMOA7LJO3KEO6LOKOTQ5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MWSFFI4SZH5TKMOA7LJO3KEO6LOKOTQ5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 28 Jan 2024 11:35:51 +0100,
Alexander Tsoy wrote:
> 
> ÷ ÷Ô, 23/01/2024 × 15:14 +0100, Takashi Iwai ÐÉÛÅÔ:
> > > On Tue, 23 Jan 2024 14:46:35 +0100,
> > > Alexander Tsoy wrote:
> > > > > 
> > > > > Since commit 086b957cc17f5 ("ALSA: usb-audio: Skip the clock
> > > > > selector
> > > > > inquiry for single connections") we are already skipping clock
> > > > > selector
> > > > > inquiry if only one clock source is connected, but we are still
> > > > > sending
> > > > > a set request. Lets skip that too.
> > > > > 
> > > > > This should fix errors when setting a sample rate on devices
> > > > > that
> > > > > don't
> > > > > have any controls present within the clock selector. An example
> > > > > of
> > > > > such
> > > > > device is the new revision of MOTU M Series (07fd:000b):
> > > > > 
> > > > > ššššš AudioControl Interface Descriptor:
> > > > > ššššššš bLengthšššššššššššššššš 8
> > > > > ššššššš bDescriptorTypeššššššš 36
> > > > > ššššššš bDescriptorSubtypešššš 11 (CLOCK_SELECTOR)
> > > > > ššššššš bClockIDššššššššššššššš 1
> > > > > ššššššš bNrInPinsšššššššššššššš 1
> > > > > ššššššš baCSourceID(0)ššššššššš 2
> > > > > ššššššš bmControlsšššššššššš 0x00
> > > > > ššššššš iClockSelectorššššššššš 0
> > > > > 
> > > > > Perhaps we also should check if clock selectors are readable
> > > > > and
> > > > > writeable
> > > > > like we already do for clock sources, but this is out of scope
> > > > > of
> > > > > this
> > > > > patch.
> > > > > 
> > > > > Link: https://bugzilla.kernel.org/show_bug.cgi?id=217601
> > > > > Signed-off-by: Alexander Tsoy <alexander@tsoy.me>
> > > 
> > > Thanks, applied.
> 
> It looks like this patch will bring back problems with Behringer mixers
> [1]. So we probably should revert. The mentioned case with MOTU M
> Series should be also covered by "Support read-only clock selector
> control" commit.
> 
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=199327

OK, care to submit a patch to revert it?


thanks,

Takashi
