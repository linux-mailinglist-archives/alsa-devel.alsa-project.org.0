Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F01751EC7
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 12:25:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C151203;
	Thu, 13 Jul 2023 12:24:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C151203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689243928;
	bh=Dr2AfJ5Lcig5A6zYEcpNbTDzHrE3Pi5nC3Qi1AirYZs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ikDJC9tt9HnORW7b81ep4pYSC501gisTMaRbgYJjYa8HsZbg/smJzxMBI1zK3hj9x
	 R6DOybCpklQdqxPKouTTg90QxJouIVmNGsJaQK9etGzZ8hMTB5WqeY4VWRbY6NfbKE
	 Gcs02/zSqU9XJa8Qa1Ty1fJCTqLYIAaNHpTUbtnM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6EE69F80153; Thu, 13 Jul 2023 12:24:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EFC83F80236;
	Thu, 13 Jul 2023 12:24:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B2F7F80249; Thu, 13 Jul 2023 12:24:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 86FE0F800E4
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 12:24:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86FE0F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=INnIqalP;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=NZ1ibJZ1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A0385221A1;
	Thu, 13 Jul 2023 10:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689243868;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8Oa7RBPwvoSzWPydIv61ja2ex+rMU6W+Z7xFOfSQ084=;
	b=INnIqalP3mfRD+SyaJuuKAiZTR7KUEogJ0CRumWLX38FsSz0Bo6V/+Z9V41tnu0wiPVAoT
	cKL9qqolPM74ehGMTdclhzMv1mhABzy15j0LU9QU/f2Vu1hQAtNHOmSVjffAb0qHiuzdHS
	aqhYnz4LgDuIh/wjY3CrkihLRegruZs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689243868;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8Oa7RBPwvoSzWPydIv61ja2ex+rMU6W+Z7xFOfSQ084=;
	b=NZ1ibJZ1rYLLBJQP4mOI6lw9BDtWlx/dCln9IP8e4D7ivPV6ll8TSrD37LhSQa1PMFFhfq
	+GroNbhgeZJroMBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 724F1133D6;
	Thu, 13 Jul 2023 10:24:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id KUQNG9zQr2TPaQAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 13 Jul 2023 10:24:28 +0000
Date: Thu, 13 Jul 2023 12:24:28 +0200
Message-ID: <875y6of6sj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Cc: alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 3/3] ALSA: emu10k1: (re-)add mixer locking
In-Reply-To: <ZK/LhwAr+uMMTFZZ@ugly>
References: <20230712145750.125086-1-oswald.buddenhagen@gmx.de>
	<20230712145750.125086-3-oswald.buddenhagen@gmx.de>
	<87jzv4fbxl.wl-tiwai@suse.de>
	<ZK++wAP6zYFFWvq6@ugly>
	<87edlcf9p9.wl-tiwai@suse.de>
	<ZK/LhwAr+uMMTFZZ@ugly>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: HA4KLL6WMNEYDWNZW5OFGJVLKOZ3PZ3X
X-Message-ID-Hash: HA4KLL6WMNEYDWNZW5OFGJVLKOZ3PZ3X
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HA4KLL6WMNEYDWNZW5OFGJVLKOZ3PZ3X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 13 Jul 2023 12:01:43 +0200,
Oswald Buddenhagen wrote:
> 
> On Thu, Jul 13, 2023 at 11:21:38AM +0200, Takashi Iwai wrote:
> > On Thu, 13 Jul 2023 11:07:12 +0200,
> > Oswald Buddenhagen wrote:
> >> 
> >> On Thu, Jul 13, 2023 at 10:33:26AM +0200, Takashi Iwai wrote:
> >> > instead of relying on a (hackish) big iron lock that wasn't
> >> > considered to be used originally at all.
> >> > i think you're focusing on the wrong thing here.
> >> the fact that the lock was originally meant to do something else is
> >> meaningless. you could just as well create a dedicated lock
> >> specifically for that task - the important thing is that the core
> >> would provide a guarantee to the drivers that mixer callbacks are
> >> locked, just like it does for some pcm callbacks unless the driver
> >> opts out. given that mixer operations are rare in the big picture,
> >> fine-grained locking in the drivers is unnecessary (except where not
> >> mixer-only data is accessed).  given the amount of code this saves,
> >> this seems like a rather worthwhile trade-off with the formal
> >> cleanness of drivers having self-contained locking.
> > 
> > My whole point is that no driver should touch card->controls_rwsem
> > from outside (unless the driver needs to traverse the card's linked
> > list by some special reasons).
> > 
> nothing in what i wrote even suggests that it _should_. how a driver
> would explicitly interact with _a_ mixer callback lock is entirely
> open so far.
> 
> > Unlike PCM, the control get/put has never been considered to be fully
> > protected,
> > 
> the whole argument is that it _should_.
> 
> > and it was always driver's responsibility.
> > 
> clearly a responsibility that has been widely shirked, even before it
> was actually safe to do so. the pragmatic thing to do would be
> accepting this reality and ensuring locking by the core, in whichever
> way.

Well, I took your patch 3 just because you wanted to have a protection
of your data from both get/put callback and from another code path in
another patch.  It was an (ab)use of controls->rwsem that couldn't be
accepted, so the patch 3 was taken as an alternative.

If this isn't the scenario, let me know: I'd rather drop the patch
again, as it's superfluous.

Again, my point is that you shouldn't use controls_rwsem for the
driver's data protection purpose.

There's many rooms for improvements in ALSA core, and things may
change.  So, if the driver needs to protect its own data from both
mixer code path and from another, use the own lock, instead of
touching controls_rwsem (which is basically an internal stuff for
ALSA control core).


Takashi
