Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D008568B3D0
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 02:27:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E41FE826;
	Mon,  6 Feb 2023 02:26:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E41FE826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675646860;
	bh=3Qc6RGFIghka8aFkntJ1Aez2cC3Ikg5f129v5qcp5po=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=BCCWW5Lds9U5wH0cZJYemOW83UVu1MhETGqid6gl6TQNPjbkuev3QkSWJ3JdKnluc
	 I4qbP8VvTxaCthzhDoeui9jRwmbUpIosV0WPmXGf+puiObqGF7Q/S9dcdrD/hgur3x
	 D4qSJMsech9Fg5oeIpbPYxKhzWdDMYK9Dw/DSGR0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 124A4F800E3;
	Mon,  6 Feb 2023 02:26:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C551FF804AA; Mon,  6 Feb 2023 02:26:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AEFB4F8001D
 for <alsa-devel@alsa-project.org>; Mon,  6 Feb 2023 02:26:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEFB4F8001D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp
 header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm3 header.b=eb6FSFTE; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=petqqoS9
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 0C120320031A;
 Sun,  5 Feb 2023 20:26:26 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Sun, 05 Feb 2023 20:26:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1675646786; x=1675733186; bh=UE
 KNU1FmrW09k9ZW9NZaetsf4NRwpOezeB0K6Ma8XQg=; b=eb6FSFTEb8QSxZeBxX
 gernGe5tDE2CVjytUOFb2gw87+Pumf4wMkDuYicqCVMW95ITCzfFHk0NFGoy/mIz
 oX6Kpf+0/1c0fa/Usjjow1AA35RcO7vpGit3CGXAF9FSUdU1m9kIuB85rG+bGLhL
 80Wlx1I34plQL4DU83nAOVE0Cf1C9YAaRXBRx3wAhhG9odjoqhVOmsVSFmG+YPOX
 ryCf+yC7k7eFHBwXQm9k1s8NPj1n5gW+DUHuMDmn83U5s0P9pf6xtj7bzH4XclYN
 OcZ1HwVTG42OaA+g6zJRw4vLenxl/uJiscdqfnsBu3W44VT31CWid6ym4iOP4kyN
 QtYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1675646786; x=1675733186; bh=UEKNU1FmrW09k9ZW9NZaetsf4NRw
 pOezeB0K6Ma8XQg=; b=petqqoS9WzgL/pCIwxiFJ8mwstDMXYGEoslcTk7q744M
 y8JC643BU4tGqNtcBcbP53NZGb8pGX8jUGrJctmxjWi8XBnpXgyVPoxm0WyO6UbJ
 bC/xmFoutwPiJkwOAfjkvOyluB84OogYfdsqakxwfIoGk9notytGu7Qc95n9roLW
 mUfVQeUkVtZXOnNqfjp8X4MtVJRDzWn7pyTwACv/DlQVByGYaJ5/S/D24L2ZPVc6
 JOkR1cY6TDfVmHwm4WaB+/1HqrQvK87/zF/nf4rmry9YncToiHFqy1Hd7CCViiOS
 WVF6W7PqQISQCKA2hCp4Xk3h/vXWLB5rBezD8YYGwA==
X-ME-Sender: <xms:QlfgY-rRLluA3lWBilUlSbCAVFP6eIVgIU1H7CV0y1iWMet6eI49qw>
 <xme:QlfgY8q4NZstU1NsAkblJcHHyON1tJZAtOEb3SgwIUQ4Kp45iG3PwoIe2_DnlZcLw
 ixxlarYJOAf58TuexU>
X-ME-Received: <xmr:QlfgYzOCfdcwqWaP-b3qxeUkdgF41g7l0tMDcYk81k912u4mz94S4wAtPD4DXZygxNb_q4RkvpQqWc8-j9JW-7oU0CrwK67YlW-W>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeghedgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
 shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
 hjpheqnecuggftrfgrthhtvghrnhepvdeugeejleeuhfeggeehieejhfefheeuledvfedv
 fedtfeduvefgheehgefftddtnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpkhgvrh
 hnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
 rhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:QlfgY96tUQngLOO8MdT6DUc5qLNt7Xo7BEq3TinuaM8jTjv4q1d5lA>
 <xmx:QlfgY94_6GJtO8f9jzEJY7aC6x4RIeRKlHD_kyCHo5sN7uhGk2tUwQ>
 <xmx:QlfgY9hB06t7S1RD1VKZx5V4V8us5MO7r4k7ZR44tKBKVOuFOLknTw>
 <xmx:QlfgY_RW8QzC4gc5MPoDt1J6ta25-LQs-hMgBCjcIyDpl0WNF0H2zQ>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 5 Feb 2023 20:26:24 -0500 (EST)
Date: Mon, 6 Feb 2023 10:26:21 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Martin Armsby on GMX <m.armsby@gmx.de>
Subject: Re: Motu 896Mk3Hybrid dump
Message-ID: <Y+BXPeHLp+qoKJcv@workstation>
Mail-Followup-To: Martin Armsby on GMX <m.armsby@gmx.de>,
 alsa-devel@alsa-project.org, perex@perex.cz
References: <clpqss6u2nl2-tqmbic2pqf4x-fl7n8ufasb45-1to1x7160p65-86skuflc32uf-b435ds-2dqjqzzi2x9r-n26ssw-jjzxq0-aeknhb-drcr4x44iip67z8kfz-gayyzivnj1e3-exbx9z-ayuv2umcdyh1.1675078615418@email.android.com>
 <Y9fD0Nzg+bwKsDEZ@workstation> <63DF98FE.2060604@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63DF98FE.2060604@gmx.de>
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
Cc: alsa-devel@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

On Sun, Feb 05, 2023 at 12:54:38PM +0100, Martin Armsby on GMX wrote:
> On 30.01.2023 14:19, Takashi Sakamoto wrote:
> > Jaroslav, would I ask your opinion for the problem which perhaps dropped
> > the message body from his messages?

Now his message is successfully blasted to subscribers. Thanks.

> Ok, Im pleased to help with the drivers for Motu 896 Mk3 Hybrid
> I followed your instruction and dumped an .img
> Just for comparison I also dumped an .img for Traveler Mk1
> These are both in the zip file - (or how would ou like it)
> The img seems ver small - I hope it's usefull :)
 
Thanks. I pushed it to my public repository for the collection[1].

Additionally, I filed a merge request to systemd project for the
hardware database[2]:

> BTW
> Manjaro update with Kernel 6.2.Rc6 is running very well with Terratec
> Phase24 and both Motu Travelers.
> Not perfeclty but I was able (for the first time) to edit productions
> using Reaper for over an hour with no problem!
> 
> Note:
> Traveler have wrong output numbering.

I guess that you mentioned about the difference between the contents
of attached 'motu-896mk3hybrid.img' and 'ma_test_traveler.img'. If not,
would I ask your further opinion about the 'output numbering' so that
I can figure out it.

If it was the mapping of PCM channels, it would come from the
specification of MOTU protocol. As long as I know, the second generation
of MOTU FireWire series, the first two channels in playback PCM frame
are for headphone output 1 and 2 (if exists). The channels for analog
outputs, for main outputs (if exists), for S/PDIF outputs (if exists),
for ADAT outputs (if exists) follow to them in the order.

Well, if supporting MOTU 896 mk3 hybrid, we need to investigate the
format of packet content. You can see the format table in
'sound/firewire/motu/motu-protocol-v3.c'[3]. Unfortunately, I have never
had chance to access to the real hardware, so it would be helpful to me
that you investigate it on behalf of me. But it consumes your time. If
you are willing to help, I'm pleased to work for it with you.

[1] https://github.com/takaswie/am-config-roms
[2] https://github.com/systemd/systemd/pull/26319
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/firewire/motu/motu-protocol-v3.c


Regards

Takashi Sakamoto
