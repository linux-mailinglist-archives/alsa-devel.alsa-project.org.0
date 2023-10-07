Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BF37BC56E
	for <lists+alsa-devel@lfdr.de>; Sat,  7 Oct 2023 09:12:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2E6810E;
	Sat,  7 Oct 2023 09:12:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2E6810E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696662775;
	bh=hhwnjAAsSP/l6Ouvz51yvgFr2KhtwUVcVrsPzDXmuko=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lvOPkTwUvO5exXVa50XItWYLAtb/K1QiTPJM5iaSqtfGPZMA0U02+Mz5vxUTvmLHU
	 /k7CIJ5oL7t3fVhe73pWNLzYqw5t0tZ5shNP/wZ4ETYCfJ4D3SNSPMZD9sMaO+xhn0
	 HZdfhtj0v2mlyVoZH2YKxU9Io6SVQF1hXyCdtPIg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14A3AF800C1; Sat,  7 Oct 2023 09:12:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E602F80310;
	Sat,  7 Oct 2023 09:12:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CDD5F8047D; Sat,  7 Oct 2023 09:10:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8CBA9F80130
	for <alsa-devel@alsa-project.org>; Sat,  7 Oct 2023 09:10:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CBA9F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=IHmQa+iI;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ruTz2Cra
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 958EA21866;
	Sat,  7 Oct 2023 07:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1696662637;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5Wlo7idDxPZ+X6QoHcs7nsfqSU9sd9ptHbEToKA0UFs=;
	b=IHmQa+iIvKK27N+gsv8zf70v0YSnAS1hyAxvwvh9zy6H5blt74Vct7UarNYTP2ZYh30r8d
	fknfkWyXDvn/XyPsYH3TyZcSXLWVs+vRVrA17rEXLgHq68sVzNsjnxCh7sP5ECeYiryAfI
	uv0AvGdnUZ5RZAiZ9xCDeFtRJhlxD1c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1696662637;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5Wlo7idDxPZ+X6QoHcs7nsfqSU9sd9ptHbEToKA0UFs=;
	b=ruTz2CrapckWYJL0CQOvNgZURFlfTGiDumoBoKiiepMDASibOhiYXF2fcQHTRMxEgBO0ag
	341CLhUyRoqXefAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7214C13479;
	Sat,  7 Oct 2023 07:10:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id QsjOGm0EIWVHdAAAMHmgww
	(envelope-from <tiwai@suse.de>); Sat, 07 Oct 2023 07:10:37 +0000
Date: Sat, 07 Oct 2023 09:10:36 +0200
Message-ID: <87y1geucur.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Michael Wang <michael-mw.wang@broadcom.com>
Cc: alsa-devel@alsa-project.org,
	Abdul Khan <abdul.khan@broadcom.com>,
	Yuming Wen <yuming.wen@broadcom.com>
Subject: Re: time to remove COPYING.GPL from alsa-plugins? (issue #45)
In-Reply-To: 
 <CANAqB7LBRjAH1UOwA5AtoVjw7veoPBzH_HkoPv3bogmgBgaZAA@mail.gmail.com>
References: 
 <CANAqB7JFnNbbd0+zEKrSW6mSnVrGr8MPJ9ESnsNc3uXQdkFEZw@mail.gmail.com>
	<87r0m8w2nf.wl-tiwai@suse.de>
	<CANAqB7LBRjAH1UOwA5AtoVjw7veoPBzH_HkoPv3bogmgBgaZAA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: POAGQK4NS42JWLW7VVIFHHGZDCD3REZB
X-Message-ID-Hash: POAGQK4NS42JWLW7VVIFHHGZDCD3REZB
X-MailFrom: tiwai@suse.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/POAGQK4NS42JWLW7VVIFHHGZDCD3REZB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 07 Oct 2023 02:12:20 +0200,
Michael Wang wrote:
> 
> Hi Takashi,
> 
> Thanks for taking time to address this issue.
> 
> Yes, rate_samplerate.c is dual licensed (LGPL or GPLv2).   However,
> depending on one's interpretation, someone MAY conclude that the
> rate_samplerate plugin is licensed as GPLv2 for a commercial entity
> such as Broadcom.
> 
> The first line in the license is:
> 
> "This plugin code is supposed to be used and distributed primarily
> under GPL v2 or later..."
> 
> The second line says:
> 
> "However, if you already own a commercial license to use libsamplerate
> for dynamic linking, this plugin code can be used and distributed also
> under LGPL v2.1 or later."
> 
> But Broadcom does not own a "commercial license to use libsamplerate"
> since libsamplerate basically eliminated the need for a commercial
> license in 2016 when it was released with the 2-Clause BSD license.
> So it is not clear whether the first sentence (GPLv2) or the second
> sentence (LGPLv2) applies to Broadcom.
> 
> So I am trying to eliminate any possibility of different
> interpretations by requesting that the license in rate_samplerate.c
> and the alsa-plugins be updated to reflect the current license status
> of libsamplerate.

OK, then I think we can simply move to LGPL-only for that plugin.
Luckily, I'm the sole author of that piece of code, so it's legally OK
to relicense.


Takashi

> 
> 
> Thank you,
> Michael
> 
> 
> 
> 
> On Fri, Oct 6, 2023 at 1:55 AM Takashi Iwai <tiwai@suse.de> wrote:
> >
> > On Wed, 27 Sep 2023 20:26:31 +0200,
> > Michael Wang wrote:
> > >
> > > Hi Alsa-devs and Mr Iwai,
> > >
> > > Sorry for the spam, I am resending this in plain text mode this time.
> > >
> > > It seems the only thing in alsa-plugins that has a GPL license is
> > > rate/rate_samplerate.c, and that is due to the license of
> > > libsamplerate.  But in 2016, libsamplerate dropped the commercial/GPL
> > > part of its license and was released with the 2-Clause BSD license.
> > > So I was wondering if the license for rate_samplerate.c can be updated
> > > to remove the GPL license, which means the COPYING.GPL file can also
> > > be removed from the alsa-plugins package?
> > >
> > > I have created issue #54 in github.com/alsa-project/alsa-plugins, but
> > > so far, no action.
> > >
> > > Should I submit a pull request?
> >
> > The code allows LGPL, too.  What's the problem with it?
> >
> >
> > thanks,
> >
> > Takashi
> 
> -- 
> This electronic communication and the information and any files transmitted 
> with it, or attached to it, are confidential and are intended solely for 
> the use of the individual or entity to whom it is addressed and may contain 
> information that is confidential, legally privileged, protected by privacy 
> laws, or otherwise restricted from disclosure to anyone else. If you are 
> not the intended recipient or the person responsible for delivering the 
> e-mail to the intended recipient, you are hereby notified that any use, 
> copying, distributing, dissemination, forwarding, printing, or copying of 
> this e-mail is strictly prohibited. If you received this e-mail in error, 
> please return the e-mail to the sender, delete it from your computer, and 
> destroy any printed copy of it.
> Verifying...
