Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFCD72E714
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 17:24:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57900E89;
	Tue, 13 Jun 2023 17:24:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57900E89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686669894;
	bh=5iQImxOQvBF0drht6Dn+X7oMcwoZvMQFNY4a82/zxRg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g04clCYioCeYOAOXbCBt1Nr1wZdvU5Ckj2fnGGYmlqhXHBJCDBEqpACMEmLK0sMV4
	 M1hNJR1uW15sa8ojRE5qHeB+VTZnGwyrF8FFtrzi+waS3zpArecBEjLMm/84w6xTGc
	 LYTuH8UVsk9Sb3CDFJT5gmT9xHJ7xRmAwg2S/Edg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B79EF80552; Tue, 13 Jun 2023 17:23:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 162D7F80132;
	Tue, 13 Jun 2023 17:23:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E69AEF80548; Tue, 13 Jun 2023 17:23:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E3C7DF80246
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 17:23:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3C7DF80246
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 15C352408D;
	Tue, 13 Jun 2023 11:23:36 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1q95rr-kkV-00; Tue, 13 Jun 2023 17:23:35 +0200
Date: Tue, 13 Jun 2023 17:23:35 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 6/8] ALSA: emu10k1: add support for 2x/4x word clocks in
 E-MU D.A.S. mode
Message-ID: <ZIiJ9zzwgvQHyrW9@ugly>
References: <20230613073822.1343234-1-oswald.buddenhagen@gmx.de>
 <20230613073822.1343234-7-oswald.buddenhagen@gmx.de>
 <87v8fren1k.wl-tiwai@suse.de>
 <ZIhKe99WGpLFN1ld@ugly>
 <87edmfei0o.wl-tiwai@suse.de>
 <ZIh2gp/I4ot326KP@ugly>
 <871qife9ga.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <871qife9ga.wl-tiwai@suse.de>
Message-ID-Hash: C3FMOOE4FUEISVQY4HVF4Q5X4V7QXIY3
X-Message-ID-Hash: C3FMOOE4FUEISVQY4HVF4Q5X4V7QXIY3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C3FMOOE4FUEISVQY4HVF4Q5X4V7QXIY3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jun 13, 2023 at 04:13:57PM +0200, Takashi Iwai wrote:
>On Tue, 13 Jun 2023 16:00:34 +0200,
>Oswald Buddenhagen wrote:
>> 
>> On Tue, Jun 13, 2023 at 01:08:55PM +0200, Takashi Iwai wrote:
>> > Hmm I don't get it; if an application just toggles the kctl value
>> > between two values in an infinite loop, it'll delete and recreate
>> > kctls endlessly as well with your patch, no?
>> > 
>> yeah, but why should it toggle just so? it's not reasonable to do
>> that. 
>
>I'm arguing about a malicious or buggy applications.  Don't ask logics
>or conscience behind it.
>
yes, that was exactly the point of the sentence you cut away. it can be 
broken in any number of "creative" ways. there is absolutely no point in 
trying to prevent that.

the notion of "malicious" is meaningless in this context. a valid attack 
vector would allow the application to do something that i cannot do 
otherwise. hogging a cpu thread while flooding the system with 
meaningless ioctls is something an app can do regardless, so whatever.

>> >> also, i don't think that disabling would be fundamentally different
>> >> from deleting: the particular code paths taken are somewhat different,
>> >> but the high-level view is essentially the same. so we can't really
>> >> make predictions which one would work better.
>> > 
>> > Creating and deleting needs a lot of different works and much heavier
>> > tasks.
>> > 
>> it's entirely plausible that an application would tear down structures
>> in response to controls being disabled, too.
>
>But it's less dangerous.
>
if the app does mostly the same in both cases, then obviously neither 
one is any less dangerous than the other one.

there is also the opposite angle to this, which makes it an own goal for 
you: if the app did in fact respond to the elements being disabled by 
merely disabling them in the user interface, then having the currently 
inactive (but superficially identical) controls at all times would 
contribute to a rather horrible user experience. so for this reason 
alone it's better to actually delete the inapplicable set of controls.

>> > And, above all, many user-space programs will be borked if an
>> > element goes away, simply crashing.  Some (rather rare) nice ones will
>> > still survive, though.  I've learned this from the past.
>> > 
>> yeah, but why should we care? it's not a regression when something new
>> doesn't work with some crappy pre-existing code.
>
>We can't break user-space.  That's a rule set in stone.
>
that rule means that we may not cause regressions, which we would not.

>Well, then another, maybe foremost reason: you can't create / delete
>kctls from the callback, simply because the callbacks are called in
>the read lock.  Adding / deleting an element may crash the another
>concurrent task that traverses the list.
>
that would indeed be a problem, but fortunately the put() callback is 
nowadays invoked with a write lock (see also commit 06405d8ee).

also, please go back to the first paragraph of the commit message of 
patch 5 in the series.

regards,
ossi
