Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 244FB6DED0A
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Apr 2023 09:55:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D50901084;
	Wed, 12 Apr 2023 09:55:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D50901084
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681286157;
	bh=5j4bLg4ZLki9b/x9QKqUdcD+MvRaLIdYdnfKaBLcCXI=;
	h=Date:From:To:Subject:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=R74w1/K7mrolWQkQAgCoTD6ReldGJ37huu/GCW5Deep2IpMw6nqRvMfFCOEYXNeH+
	 fx4x5ymflJWLaxf/6ucjxZvCN7P/6kxG4wIwrrZl5UaecCB7IRo3c0hkQE1UGktB7z
	 9n894vctQPl9sLbyUdkyp9Eg2XQoP/yySpUAVmT4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F67EF8025E;
	Wed, 12 Apr 2023 09:55:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3844AF8032B; Wed, 12 Apr 2023 09:55:03 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 36268F80100
	for <alsa-devel@alsa-project.org>; Wed, 12 Apr 2023 09:54:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36268F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=em7v/sq5;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=o+5rh1/A
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6D71B1F6E6;
	Wed, 12 Apr 2023 07:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1681286095;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O5POT9WJ3p24qzGvxl2BPWemHA+8hz0V6Lv8IfhIdu0=;
	b=em7v/sq5IVaeADNZWryMJ1j5CWZ89922MCjxcO3925TRrOP1Ft6AGYpgDbWHECbHCjTS++
	PHwkTaqxlYgAmSCwsE/vNnJTJ2VbaO9nYiYUTITvu9EaIIfvo9BH4t2SWHtHMpo+l+43KZ
	ddxzOR+fRGtCIdElwfuibnLKsyXixoo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1681286095;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O5POT9WJ3p24qzGvxl2BPWemHA+8hz0V6Lv8IfhIdu0=;
	b=o+5rh1/AVW2Nz764FQ+7AFWOXcqXhBnahuNogPhkon5mTcES7RCKRff2qn782bKCnduhCu
	k2nd37ptg96IKQCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 534A4132C7;
	Wed, 12 Apr 2023 07:54:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id GMluE89jNmR2SQAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 12 Apr 2023 07:54:55 +0000
Date: Wed, 12 Apr 2023 09:54:54 +0200
Message-ID: <87ttxl7cxd.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 2/2] ALSA: pcm: auto-fill buffer with silence when
 draining playback
In-Reply-To: <7b317956-deb1-0a75-0a34-f82d6a81cf90@perex.cz>
References: <20230405201219.2197789-1-oswald.buddenhagen@gmx.de>
	<20230405201219.2197789-2-oswald.buddenhagen@gmx.de>
	<3d75c103-7e94-e6a1-7f3d-7f957c33cddc@perex.cz>
	<ZDEWyjdVE2IocpGY@ugly>
	<22f551f3-deae-1536-bd07-0b9340940ea4@perex.cz>
	<ZDVnUj2B0EkMiOlA@ugly>
	<6d6c5f3a-81bc-acf4-eb4d-229b581bbe8b@perex.cz>
	<ZDWPy9YbXWWOqaC+@ugly>
	<7b317956-deb1-0a75-0a34-f82d6a81cf90@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: YQKEDZBRSRD5PWNUCKLJNZTONKBDMD4D
X-Message-ID-Hash: YQKEDZBRSRD5PWNUCKLJNZTONKBDMD4D
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org,
 Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YQKEDZBRSRD5PWNUCKLJNZTONKBDMD4D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 11 Apr 2023 19:23:17 +0200,
Jaroslav Kysela wrote:
> 
> On 11. 04. 23 18:50, Oswald Buddenhagen wrote:
> 
> >> If we allow modification of the PCM buffer, I think that we should:
> >> 
> >> - Do not modify the buffer for drivers already working with the
> >>    appl_ptr data (end position) only.
> >> 
> > i suppose that should be detected by the drain callback being set up?
> 
> Yes, but it would be probably better to add a default silencing
> callback with a warning to notify authors of drivers to review and
> eventually correct the behavior.
> 
> >> - Handle the situation with the large buffer; it may make sense
> >>    to change the "wait" operation from the end-of-period interrupt to time
> >>    scheduler and stop the drain more early when the end-of-valid data condition
> >>    is fulfilled.
> >> 
> > i don't understand what you're asking for.
> 
> Use jiffies/timeout instead waiting to the interrupt. In this case,
> the stop may be called earlier (in the middle of period). In this case
> the silenced area may be much smaller.

Does this difference matter so much?  I guess you're concerned about
the performance, right?  This sounds a bit too complex just for the
simple purpose...

> >> - Increase the protocol version.
> >> 
> >> But as I wrote, I would make those extensions configurable
> >> (SNDRV_PCM_HW_PARAMS_DRAIN_ALLOW_SILENCE). It can be turned on by default.
> >> 
> > i have no clue what would be involved in doing that. to me that sounds
> > like overkill (solving a non-issue), and goes waaaay beyond what i
> > expected to invest into this issue (really, i just wanted to verify that
> > the emu10k1 fixes work, and accidentally discovered that there is a
> > mid-layer issue that affects user space, as the pyalsaaudio lib i'm
> > using doesn't handle it).
> 
> OK. I don't think that it's a pyalsaudio job to resolve the issue with
> the minimal transfer chunk / period (which you set / know before the
> transfer is initiated).

I'm thinking whether we need to change anything in the kernel side for
this at all.  Can't it be changed rather in alsa-lib side instead?


Takashi
