Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9ADC6E1088
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Apr 2023 17:00:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A82E1F0F;
	Thu, 13 Apr 2023 16:59:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A82E1F0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681398008;
	bh=PuhnKqVh2UaWJCJxNjWnQ+m0PcNkTJ+5eFHm0awq0rg=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=o1HfovqDQW7obMKPDAkfizZh+hobkVGW+OJ/C4QgJGDeMss1AF/NOY84el7vPY7ll
	 0rAe45YNBF23NK1K+aUOMhreDycZhACW0wDQviTt0E65x6mLCXZD8ihebiooEJLXZR
	 GXjjxsw5L9VICveCu3i4arfNx4eWpQfda1YM+bAY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EFB3F8025E;
	Thu, 13 Apr 2023 16:59:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 934E1F8032B; Thu, 13 Apr 2023 16:59:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C763AF8023A
	for <alsa-devel@alsa-project.org>; Thu, 13 Apr 2023 16:59:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C763AF8023A
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 5ED7920391
	for <alsa-devel@alsa-project.org>; Thu, 13 Apr 2023 10:59:03 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pmyPe-hg4-00
	for <alsa-devel@alsa-project.org>; Thu, 13 Apr 2023 16:59:02 +0200
Date: Thu, 13 Apr 2023 16:59:02 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: Re: [PATCH 2/2] ALSA: pcm: auto-fill buffer with silence when
 draining playback
Message-ID: <ZDgYto5sExV2q3pE@ugly>
Mail-Followup-To: ALSA development <alsa-devel@alsa-project.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87edoovvdy.wl-tiwai@suse.de>
Message-ID-Hash: FA66S2ASX6PZPMXNZKZY532PJ7P6PRTB
X-Message-ID-Hash: FA66S2ASX6PZPMXNZKZY532PJ7P6PRTB
X-MailFrom: ossi@kde.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FA66S2ASX6PZPMXNZKZY532PJ7P6PRTB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Apr 13, 2023 at 02:06:49PM +0200, Takashi Iwai wrote:
>On Thu, 13 Apr 2023 13:10:34 +0200, Oswald Buddenhagen wrote:
>> i don't think that's true. if an app wants to control things finely,
>> it would just use start/stop and manage the timing itself. draining
>> otoh is a convenient fire-and-forget operation. that makes it easy to
>> miss the finer details, which is why i'm so insistent that it should
>> just work out of the box.
>
>Sure, but that's still no excuse to ignore the possibility blindly.
>
it's not blindly. it's after considering it, and concluding that it's a 
hypothetical problem at best.

we could of course do a survey of actually existing publicly accessible 
code, to quantify the trade-off between apps fixed and apps broken. i 
actually sort of tried that ...

first thing is that i found lots of stackoverflow answers and similar, 
and *none* of them even mentioned the need to clear the rest of the 
buffer. i found a bunch of libs, and none of the apidocs mentioned it in 
the parts i read. i found one cross-platform how-to which did actually 
mention it. yay.

code search was trickier, with rather predictable results:
basically all hits for drain() were immediately followed by close().
i found some simple cases of write+drain, and none of them did any 
additional padding. this includes alsa's own pcm example. but never 
mind, we're in agreement about this case.
most other code was some abstraction, so it would be impossible to asses 
the bigger picture quickly.
that would be even more the case for apps that use mmap. so i won't even 
try to provide actual data.
one thing to consider here is that most of the code are cross-platform 
abstractions. under such circumstances, it seems kinda inconceivable 
that the higher level code would make any assumptions about buffer space 
that has not been filled with fresh samples.

>> and doing it all in user space is yet more code. for all i can
>> tell, it's really just layers of complexity to solve a non-problem.
>
>I don't get it: we're talking about the sw_params call in alsa-lib's
>drain function, and how can it be *so* complex...?
>
the "drain function" bit is critical here, because it kind of implies 
resetting it, potentially asynchronously. but if we add a specific bit 
to the kernel to enable it, then it can be actually set already when the 
device is set up, and the user space would be rather simple. however, 
that would overall be still a lot more code than doing it 
unconditionally, and fully in kernel.

regards
