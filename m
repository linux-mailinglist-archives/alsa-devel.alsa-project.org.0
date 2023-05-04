Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EAE6F71A1
	for <lists+alsa-devel@lfdr.de>; Thu,  4 May 2023 19:54:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C98612244;
	Thu,  4 May 2023 19:53:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C98612244
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683222889;
	bh=kJTKX/+OedvF8NSdoA1nXbDIbjyuW8qJ0EKQT562M18=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KxM9k68hJoKYFfhY4uzV+vXuZx2dhQgGgMEt+3jydyDc4t7ZKv+EDzSbFvsUhOTGJ
	 gkgmH1NGyDLnj9QStG1N2isXUmbgN83T5lTva4MRSgKvAAHYyWkE1cjxsSLvAqckFV
	 rLqdjJm+43HmEop5UL5P2Fb1JB9cD9/fBis9yhu4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F2811F80529;
	Thu,  4 May 2023 19:53:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46913F8052D; Thu,  4 May 2023 19:53:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1AF55F80114
	for <alsa-devel@alsa-project.org>; Thu,  4 May 2023 19:53:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AF55F80114
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 8B43323EB7;
	Thu,  4 May 2023 13:53:47 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pud9H-Mk5-00; Thu, 04 May 2023 19:53:47 +0200
Date: Thu, 4 May 2023 19:53:47 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: pcm: fix snd_pcm_playback_silence() with
 free-running mode
Message-ID: <ZFPxK7tgMEa0Gi1y@ugly>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org
References: <20230504130007.2208916-1-oswald.buddenhagen@gmx.de>
 <87cz3gkyz9.wl-tiwai@suse.de>
 <c2e501b7-68bc-947b-645e-e425dcd20c65@perex.cz>
 <ZFO5B+1+HaIz4B4X@ugly>
 <877ctokv6x.wl-tiwai@suse.de>
 <ZFPQ68qLr2fy1qRs@ugly>
 <87ttwsjbrx.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87ttwsjbrx.wl-tiwai@suse.de>
Message-ID-Hash: OBQWW5Q2CXKITYIEQ6TTBM7WBYEK25R2
X-Message-ID-Hash: OBQWW5Q2CXKITYIEQ6TTBM7WBYEK25R2
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OBQWW5Q2CXKITYIEQ6TTBM7WBYEK25R2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, May 04, 2023 at 06:34:42PM +0200, Takashi Iwai wrote:
>On Thu, 04 May 2023 17:36:11 +0200,
>Oswald Buddenhagen wrote:
>> 
>> On Thu, May 04, 2023 at 04:49:58PM +0200, Takashi Iwai wrote:
>> > Sorry, that doesn't work.  The review is done upon the patch, and if
>> > this patch can't be reviewed easily, it's simply no-go.
>> > 
>> that's a self-imposed limitation.
>
>And that's how the process works.  Over decades.
>
that doesn't mean that it's the best process. it's the only thing that 
was available 30 years ago, but technology has moved on.

>All those git-based work flows are based on commits, and commits
>consist of patches.
>
yes

>So, reviewing each commit is nothing but reviewing a patch.
>
that's technically correct, but completely misses the point. with a 
proper review tool, looking beyond the patch itself becomes *much* 
cheaper, which was the argument here.

in fact, gerrit defaults to side-by-side diff view, so people look at 
the new code rather than at the patch. (i actually think that's a stupid 
default, but having the option to switch in a second is extremely 
valuable.)

>IOW, if you do a PR via github, it'll hit the very
>same problem; when the commit is not understandable enough for
>reviewers, it'll be NAK'ed.
>
this is true, but with better tooling there are fewer pointless 
limitations.

>It's not only about contexts.  It's just not clear what your patch
>does as partial revert and as fix.
>
the fact that it's a partial revert is a property of the transition 
(that is, the patch) and therefore something to note in the history, but 
for understanding the correctness of the final code it's utterly 
irrelevant.

>> this is all deeply intertwined code.
>
>Err, I can't follow; in the previous patch and this patch, you added
>more comments, use different terms and variable names, and use
>different way to calculate the hw_avail value, etc -- which are
>basically irrelevant from the behavior fix itself, but they are just
>code refactoring.  Those could be separated easily.
>
some bits can be separated, while others can't. you'd just get a bunch 
of micro-changes, an insane amount of churn, and maybe two "meaty" 
patches which wouldn't be any simpler to actually understand.

so "partially rewrite" is imo exactly the right granularity for 
approaching this.

>> splitting up the patch will
>> merely give you the *illusion* of better understanding the pieces. but
>> to actually make sense of it, you need to see the whole, in its end
>> state, because there are no fully functional intermediate states.
>
>Again, I can't follow your logic.  Why splitting into small pieces
>can't lead to a better understanding *at all*?  Why you must refuse
>it?  Certainly one needs to take a look at big picture.  But it's a
>different story.
>
patches should be atomic. that means each one should contain one 
*complete* change. if you split a patch into pieces that aren't complete 
in themselves, you're just obfuscating the complexity.

i'm not going to try to prove to you that this is the case here. i just 
know that i failed at atomizing this _properly_ the first time around.

>> the original patch was three patches at first. when i was attempting
>> to write proper commit messages explaining what fixes what, i found
>> that it's just impossible to untangle it without lying by omission. so
>> i squashed them and wrote a cumulative description. and you accepted
>> it.
>
>The acceptance of your patch was my failure, yeah.  I should have
>rejected it.  So this failure doesn't happen again.  You're seeing the
>result now.
>
i think what i'm actually seeing is that you guys got bitten and are 
over-compensating.
but the patch was good, it fulfilled the documented api contract, and 
was thoroughly tested accordingly. the only problem was that there was 
an *undocumented* part of the api contract, and you both failed to 
notice it. atomizing the patch further wouldn't have changed anything 
about that. shit happens.

regards
