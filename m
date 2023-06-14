Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC29972F86C
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jun 2023 10:53:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAB9F3E8;
	Wed, 14 Jun 2023 10:53:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAB9F3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686732838;
	bh=alZ9io+F507STsxmuhOgyoG9ngmJYnWVziStH6sDWn0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C69f4wrGQ6uoaptwsj6OerQycwQT45xiMHywrPh81J0xET012eRbvfy6P8a7QGlIG
	 VyuuvQA4xtESrHoVGPDEDFlUeI1GXahfywAOuOuz2W/+eS5/+9IHaIsvVEbg5t28tK
	 i8TOMcBsNsf5guXUpMjL/fpXXZWdT7Vcpnzi+1Kw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15973F80132; Wed, 14 Jun 2023 10:53:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CDAF8F80132;
	Wed, 14 Jun 2023 10:53:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45714F80149; Wed, 14 Jun 2023 10:53:03 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D7A51F80093
	for <alsa-devel@alsa-project.org>; Wed, 14 Jun 2023 10:52:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7A51F80093
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id BFF06202F9;
	Wed, 14 Jun 2023 04:52:54 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1q9MFK-vtg-00; Wed, 14 Jun 2023 10:52:54 +0200
Date: Wed, 14 Jun 2023 10:52:54 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 6/8] ALSA: emu10k1: add support for 2x/4x word clocks in
 E-MU D.A.S. mode
Message-ID: <ZIl/5rSSydaVngpQ@ugly>
References: <20230613073822.1343234-7-oswald.buddenhagen@gmx.de>
 <87v8fren1k.wl-tiwai@suse.de>
 <ZIhKe99WGpLFN1ld@ugly>
 <87edmfei0o.wl-tiwai@suse.de>
 <ZIh2gp/I4ot326KP@ugly>
 <871qife9ga.wl-tiwai@suse.de>
 <ZIiJ9zzwgvQHyrW9@ugly>
 <87fs6vcqpt.wl-tiwai@suse.de>
 <ZIij6mdc1utyBD93@ugly>
 <87sfaublds.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87sfaublds.wl-tiwai@suse.de>
Message-ID-Hash: IPJ4CTWA4SNTRQBNHDWKLIPDUJFR5G5R
X-Message-ID-Hash: IPJ4CTWA4SNTRQBNHDWKLIPDUJFR5G5R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IPJ4CTWA4SNTRQBNHDWKLIPDUJFR5G5R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jun 14, 2023 at 08:36:47AM +0200, Takashi Iwai wrote:
>On Tue, 13 Jun 2023 19:14:18 +0200,
>Oswald Buddenhagen wrote:
>> On Tue, Jun 13, 2023 at 05:43:58PM +0200, Takashi Iwai wrote:
>> > Crashing an existing application is the worst-case scenario.
>> > 
>> a new driver (which this effectively is) crashing a broken application
>> is perfectly legitimate, as it doesn't affect any existing users.
>
>No, you can't ignore it.
>
you're allowing _hypothetical_ crappy 3rd party code to dictate what you 
can and cannot do. that's a completely unreasonable and 
counterproductive attitude, akin to letting hostage-takers set the 
rules.

>> > Oh well, that's really not a change to be advertised for creating /
>> > deleting kctls from the put callback at all.
>> > 
>> and? it's done, and it's basically impossible to revert. so we may
>> reap its full benefits just as well, as i did in that previous commit.
>
>Well, I can revert your commit, too...
>
sure, but my point was that there are likely many more such commits, 
some of them not explicitly marked as such. it would be a very costly 
and risky exercise to actually do that revert at this point.

>Basically the content protection shouldn't be covered by this rwsem.
>It's rather a misuse.
>
yes, sort of.
otoh, the commit message is rather convincing, and you clearly saw it 
that way as well.

>> > Sorry, but my answer is same: NO.  I see no reason why kctl 
>> > deletion
>> > and creation _must_ be implemented _inevitably_ in that way.
>> > 
>> being the most straight-forward way to implement it certainly
>> qualifies as a good reason for doing it that way.
>> and i still see no convincing reason why it shouldn't.
>
>I still see no convincing reason why it must be done so, either.
>
the very convincing reason is that it was already done that way, and 
you'd have to bring forward a very convincing justification for further 
investment into a much more complex solution, esp. considering what 
driver we're talking about.

>The way you're trying to implement is an anti-pattern,
>
that's something you keep repeating in various ways, but i see no 
evidence that there is an _actual_ problem.

>not seen in other drivers that have been developed over decades.
>
that alone doesn't mean anything.

what are SNDRV_CTL_EVENT_MASK_{ADD,REMOVE} for, if not exactly that? if 
you're afraid to use it because it makes some poorly written apps crash, 
then you may delete the API just as well.

and as i've argued in a previous mail, doing it synchronously from the 
put() callback would cause an additional risk only for poorly coded 
multi-threaded apps, another purely hypothetical problem. it certainly 
does not appear to create problems in the kernel, given current locking 
realities (though it would not hurt to have a few more eyes confirm 
that).

regards,
ossi
