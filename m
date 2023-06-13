Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 455F572E020
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 12:53:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79108827;
	Tue, 13 Jun 2023 12:52:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79108827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686653626;
	bh=TX1T94nV/yH9HtX3uYnkUtSeuunGvF1HDDtHqbDgJUU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HxqYOharMUE4gghAFUKyMEndONW03LmnYEkBmBeUaSrp7QCoKit1MdfLxgPsw6+qW
	 aZfi+8HEXlBU+zWRzHFLKTKzK4L+Km9maPJcg0RRX0rcxB8u7K/lE3hvw4+lIvJSi4
	 A2W7EHFQEIMqYu3VPbLyKoFYHRaoXMmuVobjYZyk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05949F80246; Tue, 13 Jun 2023 12:52:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B6E12F80132;
	Tue, 13 Jun 2023 12:52:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6AB75F80149; Tue, 13 Jun 2023 12:52:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4CE60F80093
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 12:52:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CE60F80093
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 382BB2408D;
	Tue, 13 Jun 2023 06:52:44 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1q91dj-fdq-00; Tue, 13 Jun 2023 12:52:43 +0200
Date: Tue, 13 Jun 2023 12:52:43 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 6/8] ALSA: emu10k1: add support for 2x/4x word clocks in
 E-MU D.A.S. mode
Message-ID: <ZIhKe99WGpLFN1ld@ugly>
References: <20230613073822.1343234-1-oswald.buddenhagen@gmx.de>
 <20230613073822.1343234-7-oswald.buddenhagen@gmx.de>
 <87v8fren1k.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87v8fren1k.wl-tiwai@suse.de>
Message-ID-Hash: 5YJR5SUZFNQ54QRXWH2RXBR3TADTEZL4
X-Message-ID-Hash: 5YJR5SUZFNQ54QRXWH2RXBR3TADTEZL4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5YJR5SUZFNQ54QRXWH2RXBR3TADTEZL4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jun 13, 2023 at 11:20:23AM +0200, Takashi Iwai wrote:
>On Tue, 13 Jun 2023 09:38:20 +0200,
>Oswald Buddenhagen wrote:
>> 
>> Notably, add_ctls() now uses snd_ctl_add_locked(), so it doesn't
>> deadlock when called from snd_emu1010_clock_shift_put(). This also
>> affects the initial creation of the controls, which is OK, as that is
>> done before the card is registered, so no concurrent access can occur.
>
>Creating and removing the controls from kctl put callback is no good
>idea.  In general, dynamic control creation/deletion already confuses
>user-space.
>
i kind of expected that, but what i've tried so far worked remarkably 
well (ok, it was mostly alsamixer).

> On top of that, if it's done by a control element, it can
>be even triggered endlessly by user.
>
it shouldn't, because there is no circularity between the controls. 
even if the app sets all controls as a response to new ones appearing, 
the second round will be a no-op for the multiplier control, and 
therefore causes no new creattion/deletion notifications, and thus 
terminates the recursion.

but suppose a sufficiently broken application exists. then causing it to 
fail still seems quite acceptable: this is effectively new hardware (the 
new mode needs to be enabled manually), so it would be simply 
unsupported by the application until that gets fixed.

>A safer approach would be to create controls statically, and set
>active flag dynamically, I suppose.
>
i wanted to do that, but the problem is that not only the number of 
controls changes, but also the number of enum values in each control, as 
there is no way to make particular enum values inactive.
and i didn't want to keep three whole sets of controls around at all 
times, as that seems a bit wasteful.

also, i don't think that disabling would be fundamentally different from 
deleting: the particular code paths taken are somewhat different, but 
the high-level view is essentially the same. so we can't really make 
predictions which one would work better.

>And, if we really have to create / delete a kctl element from some
>kctl action, don't do it in the callback but process in another work.
>
would that really improve anything? for the notification to be received 
before the ioctl returns, it would have to be watched by a different 
thread. but if the app thought that there is a race, it would have to 
take the lock before issuing the ioctl anyway. so i think for user space 
it doesn't matter when exactly the notifications are emitted.

otoh, making the mixer reorganization async would introduce rather 
significant complexity to the driver due to having to deal with ioctls 
that come in while the inconsistent state persists (which seems likely 
during a state restoration).

so i would _really_ prefer to keep things as they are, and think about 
changing them only once we have hard evidence that the approach is too 
problematic.

regards,
ossi
