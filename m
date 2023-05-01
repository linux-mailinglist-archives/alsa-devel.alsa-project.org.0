Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 179066F3257
	for <lists+alsa-devel@lfdr.de>; Mon,  1 May 2023 16:53:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6040517FD;
	Mon,  1 May 2023 16:52:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6040517FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682952819;
	bh=S+ZShRQbvpMxH2AZm9etCdlayQuFEO6/T5OdadTzXqA=;
	h=Date:From:To:Subject:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Rwv1flnBw5Qu6RBZt6+aN7IvBJ9L0l8c0OTuvpML85ZUGeCKS7TxvvtqaB13pu+0d
	 lwD9V50PlUhWmJR09q/CpHCNNwRWX9jNXhWDkSxXYvAU8Qfah6S/pmZpbXs9NHnR7B
	 F4U0pcLDgB7jvYCHxoH1kiA2fVZoRrIjLj4PgZ/I=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AA850F8032B;
	Mon,  1 May 2023 16:52:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E05BF8049E; Mon,  1 May 2023 16:52:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AC5E0F80114
	for <alsa-devel@alsa-project.org>; Mon,  1 May 2023 16:52:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC5E0F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=ed38KbJn;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=TWtKeMe4
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2ED0022803;
	Mon,  1 May 2023 14:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1682952753;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xbQ+PGMN9hG1G30QUr276yLVsCOjGNqJegqC5F0YBj4=;
	b=ed38KbJno5dmnTPK/oB8P588V07RuYKyB+rLGeyJdPy6gPtDNfL2nKFs/lnI9xcguF5tPX
	DzWHaCR9ToQy0q9wkfu+rZ28tp45u5hNWv+cdjArOH3PdcQlZXa02sR5fwPFWGnKBxjP9m
	NhNBQDo7Hctlv/a7mXIQ8aX2Mvw0Cx0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1682952753;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xbQ+PGMN9hG1G30QUr276yLVsCOjGNqJegqC5F0YBj4=;
	b=TWtKeMe4UVJjAp1nFyqQEBnU9Ygr9axQ56TLQ01PQgabJqRmu/9ppyx+Jn099QJI44PIXv
	fRDbsMITxa90pYDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F41C313587;
	Mon,  1 May 2023 14:52:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id hPXOOjDST2RQEwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 01 May 2023 14:52:32 +0000
Date: Mon, 01 May 2023 16:52:32 +0200
Message-ID: <87fs8gp0i7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jeff Chua <jeff.chua.linux@gmail.com>
Subject: Re: linux-6.4 alsa sound broken
In-Reply-To: 
 <CAAJw_ZsDdiB=b2PZydQWF2fjSULit3NWE-Bf1icBEryN-GuqUw@mail.gmail.com>
References: 
 <CAAJw_ZsbTVd3Es373x_wTNDF7RknGhCD0r+NKUSwAO7HpLAkYA@mail.gmail.com>
	<ZE9B4avbDtIXOu4O@debian.me>
	<87r0s0pnim.wl-tiwai@suse.de>
	<CAAJw_ZsDdiB=b2PZydQWF2fjSULit3NWE-Bf1icBEryN-GuqUw@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OSKJXNU6ADPUWWCULWLZ7OX7YWV6X6GN
X-Message-ID-Hash: OSKJXNU6ADPUWWCULWLZ7OX7YWV6X6GN
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Bagas Sanjaya <bagasdotme@gmail.com>, lkml <linux-kernel@vger.kernel.org>,
 Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
 Linux ALSA Subsystem Development <alsa-devel@alsa-project.org>,
 Linux Regressions <regressions@lists.linux.dev>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OSKJXNU6ADPUWWCULWLZ7OX7YWV6X6GN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 01 May 2023 15:16:35 +0200,
Jeff Chua wrote:
> 
> On Mon, May 1, 2023 at 2:35 PM Takashi Iwai <tiwai@suse.de> wrote:
> >
> > On Mon, 01 May 2023 06:36:49 +0200,
> > Bagas Sanjaya wrote:
> > >
> > > On Mon, May 01, 2023 at 11:59:12AM +0800, Jeff Chua wrote:
> > > > Latest git pull from Linus's tree ... playing a simple sound file will
> > > > resulted in a lot of echo.
> > > >
> > > > Running on Lenovo X1 with ..
> > > > 00:1f.3 Audio device: Intel Corporation Alder Lake PCH-P High
> > > > Definition Audio Controller (rev 01)
> > > >
> > > > I've bisected and reverted the following patch fixed the problem.
> > > >
> > > > commit 9f656705c5faa18afb26d922cfc64f9fd103c38d
> > >
> > > Thanks for the regression report. However, where is your dmesg and/or ALSA log
> > > when the regression occurs? What is the playback test file?
> >
> > Yes, in addition, which driver is used (provide the alsa-info.sh
> > output at best), and which sound backend is used (pipewire, PA or
> > dmix) with which application?
> 
> /proc/asound# cat cards devices hwdep pcm timers version
>  0 [PCH            ]: HDA-Intel - HDA Intel PCH
>                       HDA Intel PCH at 0x603e1c8000 irq 147
>   1:        : sequencer
>   2: [ 0- 0]: digital audio playback
>   3: [ 0- 0]: digital audio capture
>   4: [ 0- 3]: digital audio playback
>   5: [ 0- 7]: digital audio playback
>   6: [ 0- 8]: digital audio playback
>   7: [ 0- 9]: digital audio playback
>   8: [ 0- 0]: hardware dependent
>   9: [ 0- 2]: hardware dependent
>  10: [ 0]   : control
>  33:        : timer
> 00-00: HDA Codec 0
> 00-02: HDA Codec 2
> 00-00: ALC287 Analog : ALC287 Analog : playback 1 : capture 1
> 00-03: HDMI 0 : HDMI 0 : playback 1
> 00-07: HDMI 1 : HDMI 1 : playback 1
> 00-08: HDMI 2 : HDMI 2 : playback 1
> 00-09: HDMI 3 : HDMI 3 : playback 1
> G0: system timer : 10000.000us (10000000 ticks)
> G3: HR timer : 0.001us (1000000000 ticks)
> P0-0-0: PCM playback 0-0-0 : SLAVE
> P0-0-1: PCM capture 0-0-1 : SLAVE
> P0-3-0: PCM playback 0-3-0 : SLAVE
> P0-7-0: PCM playback 0-7-0 : SLAVE
> P0-8-0: PCM playback 0-8-0 : SLAVE
> P0-9-0: PCM playback 0-9-0 : SLAVE
> Advanced Linux Sound Architecture Driver Version k6.3.0.
> 
> 
> # test playing with ...
> aplay /usr/share/sounds/alsa/Side_Right.wav
> Playing WAVE '/usr/share/sounds/alsa/Side_Right.wav' : Signed 16 bit
> Little Endian, Rate 48000 Hz, Mono
>
> I'll try to capture the sound ... it's seems to just repeating every
> second until the last second. So, if you just play a "beep", its ok.

There was no description about which sound backend is used.  Is it
PulseAudio, pipewire or dmix/dsnoop?


Takashi
