Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF0C6E1E37
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Apr 2023 10:27:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8EBDE7F;
	Fri, 14 Apr 2023 10:26:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8EBDE7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681460850;
	bh=OLVGjlgQO49fdXAbDbBOJUARFNOHQTlTjKOM3NpmeBk=;
	h=Date:From:To:Subject:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GNF5k5VT16kIpngmebnGKAe6IfGCDp3fWSfcfLc/nbrgLEg0usq5xkCyhQHdKBzEg
	 W1CfaxU/K+xpmTRjkuFQnOQep4xz9Lu5Xl4ZQfVtdNlxv79YUwEU8tyiTPMaGwjyoa
	 LPmWWFyy3PMs4c+4qB6Z1Ug9Ot2cDSW5faVJkxO4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0211EF8025E;
	Fri, 14 Apr 2023 10:26:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5709DF8032B; Fri, 14 Apr 2023 10:26:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 50186F80100
	for <alsa-devel@alsa-project.org>; Fri, 14 Apr 2023 10:26:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50186F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=cqYhpLwn;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=3U9xl9pr
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C36761FD93;
	Fri, 14 Apr 2023 08:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1681460786;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sAw0ofeTT1FecC1SrRQYspSf1CiPGd1a+UZ51ah3KqM=;
	b=cqYhpLwn//ng1CKnzwruDTAu1x/z/Q/sH2pww6qKsQYRDyt6ay2IJgmtIugZB6/Ny/neji
	w8sCM3Uq72dM7LJb9dty7xeUYS6fh1HdqtR9P18vQuiJSHHA/rOGX0fkrm7QHsLCj4xxFm
	WrNO59Ysptwu1VGJ01KtsXG3m/a7RrM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1681460786;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sAw0ofeTT1FecC1SrRQYspSf1CiPGd1a+UZ51ah3KqM=;
	b=3U9xl9pr5jnOSXOREWVHtwAYcsVL6vhIqT6Dm4YQB/qaRC9Z+tljSd1slomV3QwQDaRjzp
	5mGf1QlxwhIVkbAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AD3AB139FC;
	Fri, 14 Apr 2023 08:26:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id y8apKTIOOWQeaAAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 14 Apr 2023 08:26:26 +0000
Date: Fri, 14 Apr 2023 10:26:26 +0200
Message-ID: <87h6tina31.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Subject: Re: [PATCH 2/2] ALSA: pcm: auto-fill buffer with silence when
 draining playback
In-Reply-To: <ZDgYto5sExV2q3pE@ugly>
References: <7b317956-deb1-0a75-0a34-f82d6a81cf90@perex.cz>
	<87ttxl7cxd.wl-tiwai@suse.de>
	<ZDZmDyOMYMD4Uu5g@ugly>
	<87wn2ho06z.wl-tiwai@suse.de>
	<54c16616-dee7-b50f-d612-82eef906d1df@perex.cz>
	<871qkoxrrl.wl-tiwai@suse.de>
	<ZDfWZG+VASX/Xo/j@ugly>
	<87ile0vzxp.wl-tiwai@suse.de>
	<ZDfjKgLJ2tpV45eW@ugly>
	<87edoovvdy.wl-tiwai@suse.de>
	<ZDgYto5sExV2q3pE@ugly>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: ION3G76GVN2LX755GFI4LNSCYH4SJT5W
X-Message-ID-Hash: ION3G76GVN2LX755GFI4LNSCYH4SJT5W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ION3G76GVN2LX755GFI4LNSCYH4SJT5W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 13 Apr 2023 16:59:02 +0200,
Oswald Buddenhagen wrote:
> 
> On Thu, Apr 13, 2023 at 02:06:49PM +0200, Takashi Iwai wrote:
> > On Thu, 13 Apr 2023 13:10:34 +0200, Oswald Buddenhagen wrote:
> >> i don't think that's true. if an app wants to control things finely,
> >> it would just use start/stop and manage the timing itself. draining
> >> otoh is a convenient fire-and-forget operation. that makes it easy to
> >> miss the finer details, which is why i'm so insistent that it should
> >> just work out of the box.
> > 
> > Sure, but that's still no excuse to ignore the possibility blindly.
> > 
> it's not blindly. it's after considering it, and concluding that it's
> a hypothetical problem at best.
> 
> we could of course do a survey of actually existing publicly
> accessible code, to quantify the trade-off between apps fixed and apps
> broken. i actually sort of tried that ...
> 
> first thing is that i found lots of stackoverflow answers and similar,
> and *none* of them even mentioned the need to clear the rest of the
> buffer. i found a bunch of libs, and none of the apidocs mentioned it
> in the parts i read. i found one cross-platform how-to which did
> actually mention it. yay.
> 
> code search was trickier, with rather predictable results:
> basically all hits for drain() were immediately followed by close().
> i found some simple cases of write+drain, and none of them did any
> additional padding. this includes alsa's own pcm example. but never
> mind, we're in agreement about this case.
> most other code was some abstraction, so it would be impossible to
> asses the bigger picture quickly.
> that would be even more the case for apps that use mmap. so i won't
> even try to provide actual data.
> one thing to consider here is that most of the code are cross-platform
> abstractions. under such circumstances, it seems kinda inconceivable
> that the higher level code would make any assumptions about buffer
> space that has not been filled with fresh samples.

Those whole context should have been mentioned before the
discussion...  But still we'd better survey the actual usage for the
decision.

ATM, I still hesitate taking the behavior change in the kernel,
*iff* it can be worked around differently.
While the mmap situation is admittedly a corner case, the point of
alsa-lib implementation is the flexibility.  And, your implementation
means to modify the mmapped data silently, which never happened in the
past -- this is another side of coin of fixing in API side, and we
don't know the side-effect to any wild applications.  Some additional
configuration or flexible workaround might be required, and that's
often harder to apply in the kernel.

And, another concern is, as already discussed, whether we really have
to apply it unconditionally at every draining call.  Obviously the
workaround is superfluous for the drivers like USB-audio, which never
overrun without the filled data.

> >> and doing it all in user space is yet more code. for all i can
> >> tell, it's really just layers of complexity to solve a non-problem.
> > 
> > I don't get it: we're talking about the sw_params call in alsa-lib's
> > drain function, and how can it be *so* complex...?
> > 
> the "drain function" bit is critical here, because it kind of implies
> resetting it, potentially asynchronously. but if we add a specific bit
> to the kernel to enable it, then it can be actually set already when
> the device is set up, and the user space would be rather
> simple. however, that would overall be still a lot more code than
> doing it unconditionally, and fully in kernel.

Indeed we might want to take the kernel-side fix in the end, but let's
check things a bit more beforehand.


BTW, I guess that one missing piece in your patch is the case where
the drain is called at the moment of fully filled data.  You added
snd_pcm_playback_silence() at snd_pcm_do_drain_init(), but in this
scenario, the call wouldn't do anything at this moment.  But
snd_pcm_playback_silence() won't be called afterwards because
runtime->silence_size = 0.  So this workaround won't take effect in
that case, no?


thanks,

Takashi
