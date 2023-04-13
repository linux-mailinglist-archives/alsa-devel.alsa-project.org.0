Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D406B6E0B68
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Apr 2023 12:29:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDE719F6;
	Thu, 13 Apr 2023 12:28:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDE719F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681381779;
	bh=hVY8pypYgtBg8AGIzGzfNLmxigNt4+NLFN+9DTHRl1o=;
	h=Date:From:To:Subject:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NgO8ga9gxC+n4bDueFN/gtgaOs6W8JI0QnvhjoYyBsjHtEe1rK1uawuU64XGlNu8J
	 vima2s4x9Y5yK1KNOTunZY2W1CMcydG9kA+MQRDIcMNJ3FWKVm1NLs9uwSrPs1Gso0
	 68V7VzfBQyJNR6kCpGIF2hOxXdeIG6ew5wFnkrYY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D6E90F8025E;
	Thu, 13 Apr 2023 12:28:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01A6FF8032B; Thu, 13 Apr 2023 12:28:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B916EF800E5
	for <alsa-devel@alsa-project.org>; Thu, 13 Apr 2023 12:28:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B916EF800E5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Y8Qmrv6b;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=A7eNNSNq
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 05EAA2187D;
	Thu, 13 Apr 2023 10:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1681381715;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bbKl4iOcPE1gs+oi5V1wRfRiP9Ekbv/puhGtauJDjIE=;
	b=Y8Qmrv6bUHWJYcOk254WfQRF1bD9uMzquED3dzvmswV2QaOxAu8denSTYrl66d3yAILTcN
	ykQWh2j8ZvSCXcVnl/2abkcNxNwjgWvirmFWLaR/ASwH4gx93ILrICfxpNLq0pVEDM59ri
	NfhiuMg+IoppNY/P3oHANZZXmK6/mEw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1681381715;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bbKl4iOcPE1gs+oi5V1wRfRiP9Ekbv/puhGtauJDjIE=;
	b=A7eNNSNq9bShPxLzycIWTi/ML4CAOtBYChNjIUOKjER0MKqNF2NR+SixNuZdNdIDuhLcMd
	pt9aDiw56Fu83eCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E57461390E;
	Thu, 13 Apr 2023 10:28:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id OkL7NlLZN2SISwAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 13 Apr 2023 10:28:34 +0000
Date: Thu, 13 Apr 2023 12:28:34 +0200
Message-ID: <87ile0vzxp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Subject: Re: [PATCH 2/2] ALSA: pcm: auto-fill buffer with silence when
 draining playback
In-Reply-To: <ZDfWZG+VASX/Xo/j@ugly>
References: <22f551f3-deae-1536-bd07-0b9340940ea4@perex.cz>
	<ZDVnUj2B0EkMiOlA@ugly>
	<6d6c5f3a-81bc-acf4-eb4d-229b581bbe8b@perex.cz>
	<ZDWPy9YbXWWOqaC+@ugly>
	<7b317956-deb1-0a75-0a34-f82d6a81cf90@perex.cz>
	<87ttxl7cxd.wl-tiwai@suse.de>
	<ZDZmDyOMYMD4Uu5g@ugly>
	<87wn2ho06z.wl-tiwai@suse.de>
	<54c16616-dee7-b50f-d612-82eef906d1df@perex.cz>
	<871qkoxrrl.wl-tiwai@suse.de>
	<ZDfWZG+VASX/Xo/j@ugly>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: EG5PWZGC253OLMLSWWYASH4SYJD6TDYN
X-Message-ID-Hash: EG5PWZGC253OLMLSWWYASH4SYJD6TDYN
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: ALSA development <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EG5PWZGC253OLMLSWWYASH4SYJD6TDYN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 13 Apr 2023 12:16:04 +0200,
Oswald Buddenhagen wrote:
> 
> On Thu, Apr 13, 2023 at 07:42:06AM +0200, Takashi Iwai wrote:
> > On Wed, 12 Apr 2023 21:59:28 +0200,
> > Jaroslav Kysela wrote:
> >> This looks like a sane proposal, but some drivers does not require
> >> the
> >> silencing at all, so we can probably skip this step for them (new
> >> SNDRV_PCM_INFO_PERFECT_DRAIN flag?).
> > 
> > Sure, we should apply it only conditionally.
> > 
> i don't think the extra complexity is justified. with my improved
> proposal, we're talking about a cost of filling two periods per
> draining op, which aren't exactly super-frequent.

I'm not much fan of introducing a new flag for that behavior, either.

> > Also, we may skip the
> > workaround for applications accessing directly via mmap as default.
> > 
> no, because one may easily miss that more than one period is required.
> also, i think that forgetting it entirely is an easy mistake to make,
> even if it's harder with mmap than with write.

I don't agree with that point -- if application wants the access only
via mmap (without any write actions via alsa-lib functions), the
buffer and data management relies fully on the application itself.
Manipulating the data *silently* is no good action for such
applications.  For them, the drain simply means to stop at the certain
point.  OTOH, for the explicit write, basically alsa-lib / kernel is
responsible for the buffer / data management, and the workaround can
be applied.

That's I mentioned to "apply conditionally".  There are cases where we
shouldn't touch the data at all.  For the usual cases with the
standard write, we may apply it.


thanks,

Takashi
