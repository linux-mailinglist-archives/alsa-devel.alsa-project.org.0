Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9FC65C2CA
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Jan 2023 16:14:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F7DDE3AF;
	Tue,  3 Jan 2023 16:13:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F7DDE3AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672758855;
	bh=9CZWUS+HjTC+oBDN9DfEIpAdO0eLZN1UZHIMobFpLzs=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=l2MhD2EmCpXKUzOC6tYTINTjotOKHled5c/IeiiiIxgXWffZnXbcfJLdeVDz7uabU
	 4JxRqDk95ZCXTfR/hfHe7M9J8QpFaPlxu8hMh3/AG9Evu1CDOW2ugDpsF3a9tNbiqQ
	 h0h5A6/mpX5ARkoarOdrHjY1F366EXgJ8v6QYQe0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97742F800F8;
	Tue,  3 Jan 2023 16:13:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86692F804AA; Tue,  3 Jan 2023 16:13:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6B66F803DC
 for <alsa-devel@alsa-project.org>; Tue,  3 Jan 2023 16:13:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6B66F803DC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=hQs+sGmQ; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=l6pZyvdC
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B422867A50;
 Tue,  3 Jan 2023 15:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1672758790; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J/q0XYjWdcHcGHvf2zvFOmE/CmItt9EEwaXdou/KhH8=;
 b=hQs+sGmQcm2RbaGaJhnN3eAUr3OuguTcxtUHSRFK+7nKTWQuuT8RXeHFYTxgEPOe30Ei70
 E+mY8bDqjtis2cmOjHL9dKJNsonV/fne2f33UU6fSz7hky6TQNH/WO1kYQ4CW0wnijA6O0
 e3KbnAZUNQko0kL5w+qAu4EYpDoiPpc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1672758790;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J/q0XYjWdcHcGHvf2zvFOmE/CmItt9EEwaXdou/KhH8=;
 b=l6pZyvdCpCtizyaWnlXpWTmbm4Trzo4KW0IcjXXhCcHRsc3yvlRtRly9dkaEwmI/jei2w0
 9a44YgN+q3MZRNAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 898B41390C;
 Tue,  3 Jan 2023 15:13:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iibJIAZGtGPwYgAAMHmgww
 (envelope-from <tiwai@suse.de>); Tue, 03 Jan 2023 15:13:10 +0000
Date: Tue, 03 Jan 2023 16:13:10 +0100
Message-ID: <87bknfr6rd.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Michael Ralston <michael@ralston.id.au>
Subject: Re: USB-Audio regression on behringer UMC404HD
In-Reply-To: <CAC2975+cUqiFC0LO-D-fi0swH+x=_FMuG+==mhg6HH4pc_YDRA@mail.gmail.com>
References: <CAC2975JXkS1A5Tj9b02G_sy25ZWN-ys+tc9wmkoS=qPgKCogSg@mail.gmail.com>
 <bf646395-1231-92f6-7c5a-5b7765596358@leemhuis.info>
 <87zgb0q7x4.wl-tiwai@suse.de>
 <CAC2975K24Gt3rGieAToHjb7FEHv84aqiRSQx7EOuR2Q7KByUXw@mail.gmail.com>
 <87sfgrrb5f.wl-tiwai@suse.de>
 <CAC2975+cUqiFC0LO-D-fi0swH+x=_FMuG+==mhg6HH4pc_YDRA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: alsa-devel@alsa-project.org, regressions@lists.linux.dev,
 Takashi Iwai <tiwai@suse.com>, stable@vger.kernel.org,
 Thorsten Leemhuis <regressions@leemhuis.info>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, 03 Jan 2023 16:05:18 +0100,
Michael Ralston wrote:
> 
> On Wed, 4 Jan 2023 at 00:38, Takashi Iwai <tiwai@suse.de> wrote:
> >
> > Thanks; that's helpful.
> >
> > Could you try to revert the commit
> > 9902b303b5ade208b58f0dd38a09831813582211
> >     ALSA: usb-audio: Avoid unnecessary interface change at EP close
> as a blind shot?
> >
> > Also, there has been a series of fixes for other issues, and it might
> > be worth to try as well:
> >   https://lore.kernel.org/r/20230102170759.29610-1-tiwai@suse.de
> >
> 
> I built 3 kernels: one with the reverted commit, one with the patches
> you linked, and one with both. These builds were based on 6.1.2.
> 
> None of them worked. Also, even though I continued to boot with
> snd_usb_audio.dyndbg=+p, none of the kernel logs showed the debug
> messages that the other versions did. I'm baffled why this is.

That's weird.  Is snd_usb_audio driver bound with the device at all?
That is, does it appear in /proc/asound/cards?


Takashi
