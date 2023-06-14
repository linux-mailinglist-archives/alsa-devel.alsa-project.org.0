Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CBC72FBBF
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jun 2023 12:54:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C15B5823;
	Wed, 14 Jun 2023 12:54:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C15B5823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686740098;
	bh=owI1k5P4I25PEH9VFv2B0tehHOqsOi/3BdvGUoI9qbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Pj1oKurWPrKcZxT1YSDi4yOWGr/TGMKeG5WnaJVkn71oAzIhmpgO1Ba3YPBgKBxBx
	 BMoWF9o8URCyQ+gtZAPcH6u9B2Wm2mGZCkNpk0JF30ijZv1X1HP8jY6FDVCyOWI/4i
	 dHa0zSVCx84uAW48tM/+c8Uebwumh/reOXBy+r9M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E61AF80246; Wed, 14 Jun 2023 12:53:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EA8BBF80132;
	Wed, 14 Jun 2023 12:53:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1CA09F80149; Wed, 14 Jun 2023 12:53:43 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 338B1F800BA
	for <alsa-devel@alsa-project.org>; Wed, 14 Jun 2023 12:53:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 338B1F800BA
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id C4BFA202DF;
	Wed, 14 Jun 2023 06:53:34 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1q9O86-xvT-00; Wed, 14 Jun 2023 12:53:34 +0200
Date: Wed, 14 Jun 2023 12:53:34 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 6/8] ALSA: emu10k1: add support for 2x/4x word clocks in
 E-MU D.A.S. mode
Message-ID: <ZImcLtzArlB1VAny@ugly>
References: <ZIhKe99WGpLFN1ld@ugly>
 <87edmfei0o.wl-tiwai@suse.de>
 <ZIh2gp/I4ot326KP@ugly>
 <871qife9ga.wl-tiwai@suse.de>
 <ZIiJ9zzwgvQHyrW9@ugly>
 <87fs6vcqpt.wl-tiwai@suse.de>
 <ZIij6mdc1utyBD93@ugly>
 <87sfaublds.wl-tiwai@suse.de>
 <ZIl/5rSSydaVngpQ@ugly>
 <87352ubdzw.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87352ubdzw.wl-tiwai@suse.de>
Message-ID-Hash: B4M26IIL25OP72UQZHBABHQNHY66GJSL
X-Message-ID-Hash: B4M26IIL25OP72UQZHBABHQNHY66GJSL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B4M26IIL25OP72UQZHBABHQNHY66GJSL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jun 14, 2023 at 11:16:19AM +0200, Takashi Iwai wrote:
>On Wed, 14 Jun 2023 10:52:54 +0200,
>Oswald Buddenhagen wrote:
>> 
>> you're allowing _hypothetical_ crappy 3rd party code to dictate what
>> you can and cannot do. that's a completely unreasonable and
>> counterproductive attitude, akin to letting hostage-takers set the
>> rules.
>
>Oswald, it's no hypothetical, I have seen lots of applications that
>did crash with such mixer element changes in the past.
>
these apps have been meanwhile fixed or become obsolete, which makes it 
a hypothetical again.

>It's no dictation by 3rd party.
>
it IS. that's exactly what letting downstream limit your possibilities 
is. especially if it's BROKEN downstream.

>We simply must not crash things by an
>update (unless it's a must, something like a security fix).
>
and i'm telling you that this is an unreasonable reading of the rule.  
_every_ new feature in something already existing has the potential to 
blow up some crappy downstream code.

>> >> > Oh well, that's really not a change to be advertised for creating /
>> >> > deleting kctls from the put callback at all.
>> >> > and? it's done, and it's basically impossible to revert. so we
>> >> may
>> >> reap its full benefits just as well, as i did in that previous commit.
>> > 
>> > Well, I can revert your commit, too...
>> > 
>> sure, but my point was that there are likely many more such commits,
>> some of them not explicitly marked as such. it would be a very costly
>> and risky exercise to actually do that revert at this point.
>
>Sure, I didn't mean to do it immediately, it's no easy task.
>
great! then you can adjust this driver at that later point as well, when 
you actually want to go forward with that project. ;-)

>> > The way you're trying to implement is an anti-pattern,
>> > 
>> that's something you keep repeating in various ways, but i see no
>> evidence that there is an _actual_ problem.
>
>There were actual problems, and we had to address them.
>
what exactly where those problems?
do the circumstances under which they occurred still apply?

>The API is there and it should be usable in the ideal world, but we
>know that it breaks far more than expected.  We don't prohibit that
>API, but the actual use should be limited for very special use cases.
>
that's exactly the wrong way to go about it. the way to make sure that 
fewer apps crash is to hammer them as much as possible. if you wanted to 
make sure that they all *really* work, you'd randomly create and destroy 
fake controls from time to time.

>If it were triggered in only certain (rare and race-free) situations,
>it'd be acceptable.  But your patch allows every user to trigger it by
>the normal kctl value adjustment, which is simply no-go.
>
you are describing a completely contrieved attack scenario. it would 
have to be a multi-user system with an e-mu card where one user 
intentionally messes with the mixer to crash a broken application 
another user is using at the same time. think through the probabilities, 
motivations, alternative attack vectors, and how the whole affair would 
play out IRL for the attacker.

regards,
ossi
