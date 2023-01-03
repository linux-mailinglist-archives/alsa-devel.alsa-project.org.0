Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A7A65C23D
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Jan 2023 15:49:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93A01E206;
	Tue,  3 Jan 2023 15:48:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93A01E206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672757388;
	bh=85fTOh4wKjhRal9Bzo/2k5gylHL6/jvDCJzAuiR4gLI=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=GMMUmMqra1WTzCCm6ESrQVdX5p4AGdnE6VcveT8/bLisSItAEYmEoHmOMDX+cFYYt
	 q8tnU74SgghPv8UGiC+UUT0Qn9V6TLhvJX/QowOvf3j5d+BGb8Uab29WahAW9CKUmD
	 dHT3cmrdZDpMUQVfFJQprkof2+XmuzyJl9D1pr6A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B364EF8047B;
	Tue,  3 Jan 2023 15:48:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B2F7F803DC; Tue,  3 Jan 2023 15:48:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E2D2F800F8
 for <alsa-devel@alsa-project.org>; Tue,  3 Jan 2023 15:48:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E2D2F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=eO2lEeh8; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=APm+f0c6
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A92AC38016;
 Tue,  3 Jan 2023 14:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1672757321; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sovwqjCX/Lg3b4xYU7Si4jSQmDxNGHWrdnUaNJ8QV1s=;
 b=eO2lEeh8+wGU7EzyxQ1Z6iW/B9QuT+OBYsDZ6juGOZlPyatfEEzbjLPJrXcS6kURpe1GMn
 MWYNMJSE9SX0C6g3sWnwv35OIq6iAbmCUvoU3MlgHr4bI8LByuNHEXVN8MIT1tjTouXTV+
 YwvWa1dvDm3mF2MLIk9PKvwpDpPU9as=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1672757321;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sovwqjCX/Lg3b4xYU7Si4jSQmDxNGHWrdnUaNJ8QV1s=;
 b=APm+f0c6x/vOsb4ZWCkTCRH5RVl46PyTYdFtH8iw0zC80stWXQVjId4RS4kGi9J+7gcKfw
 UaSC48JRsOfQBvAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 746FF1392B;
 Tue,  3 Jan 2023 14:48:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0u6zG0lAtGO3UwAAMHmgww
 (envelope-from <tiwai@suse.de>); Tue, 03 Jan 2023 14:48:41 +0000
Date: Tue, 03 Jan 2023 15:48:41 +0100
Message-ID: <87h6x7r7w6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?P=C1LFFY_D=E1niel?= <dpalffy@gmail.com>
Subject: Re: [regression,
 5.10.y] Bug 216861 - sound disappearance on Acer Swift 3
 SF314-59-78UR after update to 5.10.157
In-Reply-To: <CALp6mk+rdqGXySUowxZv3kEEVWrh96m_x-h8xcFNQ9YZPkbc5w@mail.gmail.com>
References: <bebd692d-7d21-6648-6b7a-c91063bb51c2@leemhuis.info>
 <Y7K1WDmPYi3EMOn1@eldamar.lan> <87wn65umye.wl-tiwai@suse.de>
 <CALp6mkJhM1zDcNr9X_7WL09+uqcaAhNFFMhrjme0r7584O+Lgw@mail.gmail.com>
 <CALp6mk+rdqGXySUowxZv3kEEVWrh96m_x-h8xcFNQ9YZPkbc5w@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
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
Cc: Alsa-devel <alsa-devel@alsa-project.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Thorsten Leemhuis <regressions@leemhuis.info>, Takashi Iwai <tiwai@suse.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 Salvatore Bonaccorso <carnil@debian.org>, Sergey <zagagyka@basealt.ru>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, 03 Jan 2023 14:04:50 +0100,
PÁLFFY Dániel wrote:
> 
> And confirming, 5.10.161 with e8444560b4d9302a511f0996f4cfdf85b628f4ca
> and 636110411ca726f19ef8e87b0be51bb9a4cdef06 cherry-picked works for
> me.

That's a good news.  Then we can ask stable people to pick up those
commits for 5.10.y and 5.15.y.


Takashi

> 
> On Tue, Jan 3, 2023 at 1:05 PM PÁLFFY Dániel <dpalffy@gmail.com> wrote:
> >
> > Another report: https://bugs.archlinux.org/task/76795
> > Apparently, folks at alsa-devel traced down the dependencies of that patch, see the mail thread at https://lore.kernel.org/all/dc65501c-c2fd-5608-c3d9-7cea184c3989%40opensource.cirrus.com/
> >
> > On Mon, Jan 2, 2023 at 1:42 PM Takashi Iwai <tiwai@suse.de> wrote:
> >>
> >> On Mon, 02 Jan 2023 11:43:36 +0100,
> >> Salvatore Bonaccorso wrote:
> >> >
> >> > Hi,
> >> >
> >> > [Adding as well Richard Fitzgerald and PÁLFFY Dániel to recipients]
> >> >
> >> > On Fri, Dec 30, 2022 at 09:08:57AM +0100, Thorsten Leemhuis wrote:
> >> > > Hi, this is your Linux kernel regression tracker speaking.
> >> > >
> >> > > I noticed a regression report in bugzilla.kernel.org. As many (most?)
> >> > > kernel developer don't keep an eye on it, I decided to forward it by
> >> > > mail. Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=216861 :
> >> > >
> >> > > >  Sergey 2022-12-29 10:07:51 UTC
> >> > > >
> >> > > > Created attachment 303497 [details]
> >> > > > pulseaudio.log
> >> > > >
> >> > > > Sudden sound disappearance was reported for some laptops, e.g.
> >> > > >
> >> > > > Acer Swift 3 SF314-59-78UR 11th Gen Intel(R) Core(TM) i7-1165G7 @ 2.80GHz
> >> > > >
> >> > > > # lspci
> >> > > > 0000:00:1f.3 Multimedia audio controller: Intel Corporation Tiger Lake-LP Smart Sound Technology Audio Controller (rev 20)
> >> > > >         Subsystem: Acer Incorporated [ALI] Device 148c
> >> > > >         Flags: bus master, fast devsel, latency 32, IRQ 197, IOMMU group 12
> >> > > >         Memory at 601f270000 (64-bit, non-prefetchable) [size=16K]
> >> > > >         Memory at 601f000000 (64-bit, non-prefetchable) [size=1M]
> >> > > >         Capabilities: [50] Power Management version 3
> >> > > >         Capabilities: [80] Vendor Specific Information: Len=14 <?>
> >> > > >         Capabilities: [60] MSI: Enable+ Count=1/1 Maskable- 64bit+
> >> > > >         Kernel driver in use: sof-audio-pci
> >> > > >
> >> > > > I am attaching the pulseaudio and dmesg logs
> >> > > >
> >> > > > This bug started reproducing after updating the kernel from 5.10.156 to 5.10.157
> >> > > >
> >> > > > Bisection revealed the commit being reverted:
> >> > > >
> >> > > > c34db0d6b88b1da95e7ab3353e674f4f574cccee is the first bad commit
> >> > > > commit c34db0d6b88b1da95e7ab3353e674f4f574cccee
> >> > > > Author: Richard Fitzgerald <rf@opensource.cirrus.com>
> >> > > > Date:   Fri Nov 4 13:22:13 2022 +0000
> >> > > >
> >> > > >     ASoC: soc-pcm: Don't zero TDM masks in __soc_pcm_open()
> >> > > >
> >> > > >     [ Upstream commit 39bd801d6908900e9ab0cdc2655150f95ddd4f1a ]
> >> > > >
> >> > > >     The DAI tx_mask and rx_mask are set by snd_soc_dai_set_tdm_slot()
> >> > > >     and used by later code that depends on the TDM settings. So
> >> > > >     __soc_pcm_open() should not be obliterating those mask values.
> >> > > >
> >> > > > [...]
> >> > > > Original bug report: https://bugzilla.altlinux.org/44690
> >> > >
> >> > > See the ticket for more details.
> >> > >
> >> > > BTW, let me use this mail to also add the report to the list of tracked
> >> > > regressions to ensure it's doesn't fall through the cracks:
> >> > >
> >> > > #regzbot introduced: c34db0d6b88b1d
> >> > > https://bugzilla.kernel.org/show_bug.cgi?id=216861
> >> > > #regzbot title: sound: asoc: sudden sound disappearance
> >> > > #regzbot ignore-activity
> >> >
> >> > FWIW, we had as well reports in Debian after having updated the kernel
> >> > from 5.10.149 based one to 5.10.158 based one in the last point
> >> > releases, they are at least:
> >> >
> >> > https://bugs.debian.org/1027483
> >> > https://bugs.debian.org/1027430
> >>
> >> I got another report while the commit was backported to 5.14-based
> >> openSUSE Leap kernel, and I ended up with dropping it.
> >>
> >> So, IMO, it's safer to drop this patch from the older stable trees.
> >> As far as I see, 5.15.y and 5.10.y got this.
> >>
> >> Unless anyone gives a better fix, I'm going to submit a revert patch
> >> for those trees.
> >>
> >>
> >> thanks,
> >>
> >> Takashi
> 
