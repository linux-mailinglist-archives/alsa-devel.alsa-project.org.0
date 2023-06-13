Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9C172E4C7
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 16:01:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44EB4E72;
	Tue, 13 Jun 2023 16:00:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44EB4E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686664894;
	bh=YIdLKZnfzAhjAe4b0LpxcSl3iM43h5xSxLuurmdK4+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Qd/Ed3LbQ6GH4cWNFrpaAjq86VV8iF0rroUoyT8ScD7sMrnVaPSbGfiKudhW8Kadt
	 0rEpxnkv8O6kjDpYbGldKAgfGcmFKeyK64fXaN/blDBuQm0yYGqtUa8Io60NPCmDO0
	 jOc5/Ibh2RGREh3pFYDDM6sxa3L4jACIboT7zRkY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F261FF80533; Tue, 13 Jun 2023 16:00:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B592F80132;
	Tue, 13 Jun 2023 16:00:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AEC36F80149; Tue, 13 Jun 2023 16:00:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EFB11F80130
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 16:00:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFB11F80130
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 15BF824129;
	Tue, 13 Jun 2023 10:00:35 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1q94ZW-imm-00; Tue, 13 Jun 2023 16:00:34 +0200
Date: Tue, 13 Jun 2023 16:00:34 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 6/8] ALSA: emu10k1: add support for 2x/4x word clocks in
 E-MU D.A.S. mode
Message-ID: <ZIh2gp/I4ot326KP@ugly>
References: <20230613073822.1343234-1-oswald.buddenhagen@gmx.de>
 <20230613073822.1343234-7-oswald.buddenhagen@gmx.de>
 <87v8fren1k.wl-tiwai@suse.de>
 <ZIhKe99WGpLFN1ld@ugly>
 <87edmfei0o.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87edmfei0o.wl-tiwai@suse.de>
Message-ID-Hash: ETDACMYWYN3NCALKPOWGPBCYIMFYQ34C
X-Message-ID-Hash: ETDACMYWYN3NCALKPOWGPBCYIMFYQ34C
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ETDACMYWYN3NCALKPOWGPBCYIMFYQ34C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jun 13, 2023 at 01:08:55PM +0200, Takashi Iwai wrote:
>On Tue, 13 Jun 2023 12:52:43 +0200,
>Oswald Buddenhagen wrote:
>> 
>> On Tue, Jun 13, 2023 at 11:20:23AM +0200, Takashi Iwai wrote:
>> > Creating and removing the controls from kctl put callback is no 
>> > good
>> > idea.  In general, dynamic control creation/deletion already confuses
>> > user-space.
>> > 
>> i kind of expected that, but what i've tried so far worked remarkably
>> well (ok, it was mostly alsamixer).
>> 
>> > On top of that, if it's done by a control element, it can
>> > be even triggered endlessly by user.
>> > 
>> it shouldn't, because there is no circularity between the
>> controls. even if the app sets all controls as a response to new ones
>> appearing, the second round will be a no-op for the multiplier
>> control, and therefore causes no new creation/deletion notifications,
>> and thus terminates the recursion.
>
>Hmm I don't get it; if an application just toggles the kctl value
>between two values in an infinite loop, it'll delete and recreate
>kctls endlessly as well with your patch, no?
>
yeah, but why should it toggle just so? it's not reasonable to do that.  
and if we assume it's being unreasonable, then there is no reason to 
think that controls appearing and disappearing would be special.

>> also, i don't think that disabling would be fundamentally different
>> from deleting: the particular code paths taken are somewhat different,
>> but the high-level view is essentially the same. so we can't really
>> make predictions which one would work better.
>
>Creating and deleting needs a lot of different works and much heavier
>tasks.
>
it's entirely plausible that an application would tear down structures 
in response to controls being disabled, too.

>And, above all, many user-space programs will be borked if an
>element goes away, simply crashing.  Some (rather rare) nice ones will
>still survive, though.  I've learned this from the past.
>
yeah, but why should we care? it's not a regression when something new 
doesn't work with some crappy pre-existing code.

>> > And, if we really have to create / delete a kctl element from some
>> > kctl action, don't do it in the callback but process in another work.
>> > 
>> would that really improve anything?
>
>As a primary reason, I don't want to expose such a stuff.  If you need
>such an unlocked version, you're already doing something very exotic,
>and in 99% cases, it's something that needs more care.
>
i don't see being "exotic" as something to avoid per se. and before 
putting in "more care" i want to see some evidence that there is 
actually a problem that needs to be addressed, in this place. esp. when 
the proposed much more complex alternative hasn't been shown to be 
actually better in relevant ways, even theoretically.

regards,
ossi
