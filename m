Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD28707BBF
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 10:18:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A38FE1F2;
	Thu, 18 May 2023 10:17:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A38FE1F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684397922;
	bh=rdrr7v5Q6zW0Xofh0d8yXWHUIIkzRogdJKJ4qVPoM0Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HfxTbT0j8cFGiYM8e7D0D5SPpba9/oj8cucdMk9FHpzgYM2nWPVAHc0rUbrRrvrs8
	 uLLXE9A5UOjjBEUzqaTc04lma+ShaCkZ+4gEM0A3mf6g53pFmyUrmCEmzGzlZ2uhCy
	 FPY80WC4EayqNCAHUeO4S4vvuED8TlvVs9IlhTjs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EAA7DF8025A; Thu, 18 May 2023 10:17:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AE6C1F8025A;
	Thu, 18 May 2023 10:17:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07F07F80272; Thu, 18 May 2023 10:17:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2EBC7F8016A
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 10:17:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EBC7F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=NOrKYajL;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=TMfClREJ
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A59332269E;
	Thu, 18 May 2023 08:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684397864;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sGlfc2T9gbPb6K+IChDTsR41ND52avsNX2wfykuhaNw=;
	b=NOrKYajLrH2PBFTGLmL6/l5eSZJ0+Mw0sVuhsqSzoAdXcmuneb6uwIUNUwKxXd//YPcBfU
	2PSNvDyA4Vp28mbB3FxLxmH4CY4/hBruFKnW/1RWDDPr15Ozcu7gpqPuxHQkniNJgXtzb4
	ejt5f0Fv/m8joBivPsDIbKH8rCeFsjw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684397864;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sGlfc2T9gbPb6K+IChDTsR41ND52avsNX2wfykuhaNw=;
	b=TMfClREJ/a7Nr7lSJy+4UvApzSXTq1B1Qi8Bt2xLbFJ9JRDH6Oby2KkjqpoEEJ0ZXiZY64
	SVBznHQ8jzzK1jCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 83BBB1390B;
	Thu, 18 May 2023 08:17:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 2P7gHijfZWRMNAAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 18 May 2023 08:17:44 +0000
Date: Thu, 18 May 2023 10:17:43 +0200
Message-ID: <87zg62kq8o.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Cc: alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 6/9] ALSA: emu10k1: fix PCM playback buffer size
 constraints
In-Reply-To: <ZGXaf0IKe4xDgLmH@ugly>
References: <20230517174256.3657060-1-oswald.buddenhagen@gmx.de>
	<20230517174256.3657060-6-oswald.buddenhagen@gmx.de>
	<874joa1zab.wl-tiwai@suse.de>
	<ZGXaf0IKe4xDgLmH@ugly>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 7UOPK2B6PFEEYOYGUWD4MY7TFK6HQ5XJ
X-Message-ID-Hash: 7UOPK2B6PFEEYOYGUWD4MY7TFK6HQ5XJ
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7UOPK2B6PFEEYOYGUWD4MY7TFK6HQ5XJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 18 May 2023 09:57:51 +0200,
Oswald Buddenhagen wrote:
> 
> On Wed, May 17, 2023 at 10:25:00PM +0200, Takashi Iwai wrote:
> > On Wed, 17 May 2023 19:42:53 +0200,
> > Oswald Buddenhagen wrote:
> >> 
> >> The period_bytes_min parameter made no sense at all, as it didn't
> >> correlate with any hardware limitation.
> > 
> > Does the device really work with less than 64 bytes period size?
> > I meant not in theory but in practice.
> > 
> somewhat predictably, not.
> 
> > Without any value set,
> > dumb applications may try to set 4 bytes for period size,
> > 
> the "try to" is key here. it will fail, because the frame-based
> constraint will prevent it from doing so.

Ah OK, this should be commented that the lower bound is set in a
different way.


Takashi
