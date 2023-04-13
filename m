Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 456156E0D37
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Apr 2023 14:07:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB732EDD;
	Thu, 13 Apr 2023 14:07:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB732EDD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681387671;
	bh=ct7ddTauNUKFao5RWztnrvbqLkqFVgA2I+wmAUirclI=;
	h=Date:From:To:Subject:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UWIgRhytfLa2SQfOdABf/SoAN6ctQATMd5kV5XqmBNZnLom6y8KHQ90NZfouxGN3v
	 nTOkR7WWiovZuxpa03BzPPp7ptz2eTwtugswUU47MH27SdQEKd3PbnKma1Nins0lr5
	 Oc9jd7fxJOs7b1rbyE8XrnRp3Gx+Yel8Zs0/g3Jk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 21A17F8025E;
	Thu, 13 Apr 2023 14:07:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45DDDF8032B; Thu, 13 Apr 2023 14:06:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 98AC5F8023A
	for <alsa-devel@alsa-project.org>; Thu, 13 Apr 2023 14:06:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98AC5F8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=ByIpaQm9;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=PU5rrEjv
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E4C22216DA;
	Thu, 13 Apr 2023 12:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1681387609;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TQ4W5ZzUJOsg7bjXm/IjUeFMG84Sz4ptp8YH+6T7UCw=;
	b=ByIpaQm9XBNgtO5vE+7iOckMiszArW7OsznoQXQO5O4paB0tGorN9QFJQ/jfZ/7hmlIwHn
	mH22vPkWYvEKNAQVdhR19fxykQws8MC2YQe33IEjWHUHeVY4esWyUxUp5FcZzt3sOQfzGI
	RXIZvT6jT1vCdO5wVDzX54flcliP7fo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1681387609;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TQ4W5ZzUJOsg7bjXm/IjUeFMG84Sz4ptp8YH+6T7UCw=;
	b=PU5rrEjvXnK9HIP2sx+z9pzX+VBq5Vh548+8zO3U4d/dtX74H6x4vomFJmyl+OGnNXhdqM
	es+0tYW1t5TnnNBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C723A13421;
	Thu, 13 Apr 2023 12:06:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id y1ylL1nwN2TKeAAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 13 Apr 2023 12:06:49 +0000
Date: Thu, 13 Apr 2023 14:06:49 +0200
Message-ID: <87edoovvdy.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Subject: Re: [PATCH 2/2] ALSA: pcm: auto-fill buffer with silence when
 draining playback
In-Reply-To: <ZDfjKgLJ2tpV45eW@ugly>
References: <6d6c5f3a-81bc-acf4-eb4d-229b581bbe8b@perex.cz>
	<ZDWPy9YbXWWOqaC+@ugly>
	<7b317956-deb1-0a75-0a34-f82d6a81cf90@perex.cz>
	<87ttxl7cxd.wl-tiwai@suse.de>
	<ZDZmDyOMYMD4Uu5g@ugly>
	<87wn2ho06z.wl-tiwai@suse.de>
	<54c16616-dee7-b50f-d612-82eef906d1df@perex.cz>
	<871qkoxrrl.wl-tiwai@suse.de>
	<ZDfWZG+VASX/Xo/j@ugly>
	<87ile0vzxp.wl-tiwai@suse.de>
	<ZDfjKgLJ2tpV45eW@ugly>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: QL4OXFPR24MTSVQHT5BBLPUFAN4S5LDZ
X-Message-ID-Hash: QL4OXFPR24MTSVQHT5BBLPUFAN4S5LDZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QL4OXFPR24MTSVQHT5BBLPUFAN4S5LDZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 13 Apr 2023 13:10:34 +0200,
Oswald Buddenhagen wrote:
> 
> On Thu, Apr 13, 2023 at 12:28:34PM +0200, Takashi Iwai wrote:
> > On Thu, 13 Apr 2023 12:16:04 +0200, Oswald Buddenhagen wrote:
> >> On Thu, Apr 13, 2023 at 07:42:06AM +0200, Takashi Iwai wrote:
> >> > Also, we may skip the
> >> > workaround for applications accessing directly via mmap as default.
> >> > no, because one may easily miss that more than one period is
> >> required.
> >> also, i think that forgetting it entirely is an easy mistake to make,
> >> even if it's harder with mmap than with write.
> > 
> > I don't agree with that point -- if application wants the access only
> > via mmap (without any write actions via alsa-lib functions), the
> > buffer and data management relies fully on the application itself.
> > Manipulating the data *silently* is no good action for such
> > applications.
> 
> > For them, the drain simply means to stop at the certain point.
> > 
> i don't think that's true. if an app wants to control things finely,
> it would just use start/stop and manage the timing itself. draining
> otoh is a convenient fire-and-forget operation. that makes it easy to
> miss the finer details, which is why i'm so insistent that it should
> just work out of the box.

Sure, but that's still no excuse to ignore the possibility blindly.

> if you exclude mmapped devices in kernel, you exclude plughw with
> emulated write(), so you'd have to add yet more code to compensate for
> that.

No, I wrote "if application wants the access only via mmap (without
any write actions via alsa-lib functions)".  So if application writes
via plugin write(), we should apply the workaround, too.

> and doing it all in user space is yet more code. for all i can
> tell, it's really just layers of complexity to solve a non-problem.

I don't get it: we're talking about the sw_params call in alsa-lib's
drain function, and how can it be *so* complex...?


Takashi
