Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD5C74DC98
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jul 2023 19:35:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 195D2203;
	Mon, 10 Jul 2023 19:34:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 195D2203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689010532;
	bh=OmDCbHQQGMH4ZtgF9rEovtc60GTxjEdUrtckExGJKXM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rlE4DHYS8iuMaN8H4KLpmMVPQA5HGgH8355IfBKD/JcpFn+/jrECX2A+dOjiO+qMx
	 y43lErDigY6XFk1l6XmOe4uMjJfXkWnZlEOfY8QLUD2JZusqZZFibOI3E8GqzmuQBT
	 rAN/EcNl2KxRmoD0v6RsSzUDSPQZt/XsD4PBhHZs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 954C3F80290; Mon, 10 Jul 2023 19:34:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E294F80153;
	Mon, 10 Jul 2023 19:34:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8EECDF80249; Mon, 10 Jul 2023 19:34:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0BCD6F800D2
	for <alsa-devel@alsa-project.org>; Mon, 10 Jul 2023 19:34:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BCD6F800D2
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 5E23A20081;
	Mon, 10 Jul 2023 13:34:29 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1qIumL-OoR-00; Mon, 10 Jul 2023 19:34:29 +0200
Date: Mon, 10 Jul 2023 19:34:29 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 2/2] ALSA: emu10k1: track loss of external clock on E-MU
 cards
Message-ID: <ZKxBJVxHdkmpHSVh@ugly>
References: <20230710065956.1246364-1-oswald.buddenhagen@gmx.de>
 <20230710065956.1246364-2-oswald.buddenhagen@gmx.de>
 <87ttubyfh9.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87ttubyfh9.wl-tiwai@suse.de>
Message-ID-Hash: 72SGCC6KXX6XUAFDN37TFARCOHZ66LWI
X-Message-ID-Hash: 72SGCC6KXX6XUAFDN37TFARCOHZ66LWI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/72SGCC6KXX6XUAFDN37TFARCOHZ66LWI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jul 10, 2023 at 05:05:06PM +0200, Takashi Iwai wrote:
>On Mon, 10 Jul 2023 08:59:56 +0200,
>Oswald Buddenhagen wrote:
>> +	// We consider this a mixer setting, so use the mixer's lock
>> +	down_write(&emu->card->controls_rwsem);
>
>I really don't want to see the driver touching this lock.  It's
>basically an internal stuff of ALSA core code.  And, as already
>discussed, the controls_rwsem wasn't intended as a lock for the mixer
>content protection originally.  It took over the role partially, but
>the drivers shouldn't rely on it.
>
i know that this is technically true, but i think that from a pragmatic 
point of view it just makes no sense.

if we are pedantic about it, we need to revert my 06405d8ee8c (emu10k1: 
remove now superfluous mixer locking) and do the opposite change, to add 
the technically missing locks. that's several tens of irq-safe spinlock 
operations in this driver alone. which are hundreds of bytes spent 
entirely pointlessly, because we _know_ that the operation is already 
locked, because it must be.

so i think the most sensible approach is to just make it official, which 
is what my 37bb927d5bb (core: update comment on snd_card.controls_rwsem) 
actually works towards. at least i can't think of a reason not to do 
that, except for some puristic ideals.

if somebody actually finds a _good_ reason to change this and wants to 
embark on the mammoth task of proving that everything is still safe 
afterwards, they can just do so. adjusting this commit for the new 
reality wouldn't be hard or laborious.

> > +     snd_emu1010_update_clock(emu);
> > +     downgrade_write(&emu->card->controls_rwsem);
> > +     snd_ctl_build_ioff(&id, emu->ctl_clock_source, 0);
> > +     snd_ctl_notify(emu->card, SNDRV_CTL_EVENT_MASK_VALUE, &id);
> > +     up_read(&emu->card->controls_rwsem);
> 
> Err, too ugly and unnecessary change.  snd_ctl_notify() doesn't take
> the rwsem, and it can be called at any place without fiddling the
> rwsem.  It's snd_ctl_notify_one() that needs the downgrade to read
> (and maybe we should rename the function to be clearer).
>
well, that lock is necessary exactly because we (ab-)use the rwsem as 
the general mixer lock, so we basically need to emulate the ioctl entry 
path, so a concurrent actual put ioctl doesn't blow up in our face. i 
actually agree that it's kinda ugly, but the argument remains the same - 
it just isn't worth doing it differently (we'd have to sprinkle around 
quite some reg_lock operations instead).

regards
