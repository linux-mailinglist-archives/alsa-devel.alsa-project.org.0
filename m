Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9E3751D12
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 11:22:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B8E1203;
	Thu, 13 Jul 2023 11:21:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B8E1203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689240157;
	bh=HvdWU0T7E9xw4NqUuE8IuYK833cdvX2EjQFtRzlVszk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pVyIfGzU+jq+oQhsGITgI+y4m45Zm25FpxchfP6rbIPax6uay0Ljm+W9tc/AZyyRy
	 kfQ4f6RvtHx3zeX9T6OqKROFdPCnWqdy6jglZdIfBXs2c0Fjb9Olkgf+m7qtmxP85M
	 J6kpP4Hs8fO+7zg6OBULdZbKJh3Pu+GsNvFE+Prw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99DC4F8027B; Thu, 13 Jul 2023 11:21:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3402BF80153;
	Thu, 13 Jul 2023 11:21:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6004F80236; Thu, 13 Jul 2023 11:21:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3A074F800E4
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 11:21:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A074F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=bNadfALl;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=plBns6Nx
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 51B611F890;
	Thu, 13 Jul 2023 09:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689240099;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EF47hX8coRJpm4XrtkX/v4KeD+Kb9y2Cs90iZpJZ7og=;
	b=bNadfALlfSpDXnChAhMDpSf3jueVDBkr6Ljieau+f6fYyqvrqkncR1a9UNAkWYjRblb+J8
	EltXwI3OxbSPhSsUufZt9F1/UMMJ3+wKZHxExyA/awebDxukmfz0wBMrRcWH1PCWS+N25e
	xPFcq7tMa4OOdZWazZvXpXuUPl4/H8Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689240099;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EF47hX8coRJpm4XrtkX/v4KeD+Kb9y2Cs90iZpJZ7og=;
	b=plBns6NxrAg4wB8Uj2FPrKur351klzrn6COeFK07NjZ/PR4mMAs52n4V4W17LWHcoVV4De
	6ZjBIObPi3H4jvCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3280E13489;
	Thu, 13 Jul 2023 09:21:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id +uBqCyPCr2TTSQAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 13 Jul 2023 09:21:39 +0000
Date: Thu, 13 Jul 2023 11:21:38 +0200
Message-ID: <87edlcf9p9.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Cc: alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 3/3] ALSA: emu10k1: (re-)add mixer locking
In-Reply-To: <ZK++wAP6zYFFWvq6@ugly>
References: <20230712145750.125086-1-oswald.buddenhagen@gmx.de>
	<20230712145750.125086-3-oswald.buddenhagen@gmx.de>
	<87jzv4fbxl.wl-tiwai@suse.de>
	<ZK++wAP6zYFFWvq6@ugly>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: UEVJPRDACTSHECQPYGZPY2PS4RZV5XAX
X-Message-ID-Hash: UEVJPRDACTSHECQPYGZPY2PS4RZV5XAX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UEVJPRDACTSHECQPYGZPY2PS4RZV5XAX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 13 Jul 2023 11:07:12 +0200,
Oswald Buddenhagen wrote:
> 
> On Thu, Jul 13, 2023 at 10:33:26AM +0200, Takashi Iwai wrote:
> > We may optimize out the whole locking conditionally for the
> > known-good drivers,
> > 
> well, that would work, though obviously someone would still have to
> check the drivers and set the flag. also, this kind of technically
> unnecessary fragmentation doesn't really help.
> 
> > instead of relying on a (hackish) big iron lock that wasn't
> > considered to be used originally at all.
> > 
> i think you're focusing on the wrong thing here.
> the fact that the lock was originally meant to do something else is
> meaningless. you could just as well create a dedicated lock
> specifically for that task - the important thing is that the core
> would provide a guarantee to the drivers that mixer callbacks are
> locked, just like it does for some pcm callbacks unless the driver
> opts out. given that mixer operations are rare in the big picture,
> fine-grained locking in the drivers is unnecessary (except where not
> mixer-only data is accessed).  given the amount of code this saves,
> this seems like a rather worthwhile trade-off with the formal
> cleanness of drivers having self-contained locking.

My whole point is that no driver should touch card->controls_rwsem
from outside (unless the driver needs to traverse the card's linked
list by some special reasons).  It's not for protecting the driver's
own content.  It's used casually now for get/put, but it should be
seen only for protecting the list.

Unlike PCM, the control get/put has never been considered to be fully
protected, and it was always driver's responsibility.


Takashi
