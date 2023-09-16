Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F5E7A2E24
	for <lists+alsa-devel@lfdr.de>; Sat, 16 Sep 2023 08:08:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A8B4A4E;
	Sat, 16 Sep 2023 08:07:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A8B4A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694844519;
	bh=3Fhyy5SYSq+q1YLoxp9rt7vV1TadT4QCv9w+qHaGS4U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DK2nNeONh5g58SwTpZcGOnPe5R/4wE8OBGYCkedRTUWpJ95+lGkHNHko2swjEuN3p
	 A55ccdUyTW0gfiuUMnw122CgpylzXaGTFcdf44NF7HVfXHzZnXuqzVDtINFtDF1MdM
	 c6aMp028a7o0cNMydHKFwuQkR9vd4OfMh3Rhji8Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE08DF80425; Sat, 16 Sep 2023 08:07:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 36F86F80141;
	Sat, 16 Sep 2023 08:07:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59FB9F80425; Sat, 16 Sep 2023 08:06:16 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 60C29F80141
	for <alsa-devel@alsa-project.org>; Sat, 16 Sep 2023 08:06:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60C29F80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=TuZEJ/fZ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=LJWUrQoB
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8BE962197E;
	Sat, 16 Sep 2023 06:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1694844361;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MKJPVMkfCPsAMBC1n6lximFInfxVkA6IUNTVb85qc70=;
	b=TuZEJ/fZuOkZjYIvqj7wBizy0xRWY+crKyCyqoR4u+Qsh3ThpV/ysvTpvGNGymLsKEmkbk
	SBiJ3JxTQM5joQjmigkmJ8kPpSBphgsS+XrkDPpvobqC4fD4QWRzWThByZwmUcNyjdgmd5
	b9cxr8b9rlnTCmis3hUhWe2CLj9/js8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1694844361;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MKJPVMkfCPsAMBC1n6lximFInfxVkA6IUNTVb85qc70=;
	b=LJWUrQoB/bEFmoHkCJr0nseXLpmxnMElbbppZCq4rXdDze8oyDi1nk/C9o7NqSE1MD64PO
	TmuRQ21vFJT1PjDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6B43E13499;
	Sat, 16 Sep 2023 06:06:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 6KX3GMlFBWUMVwAAMHmgww
	(envelope-from <tiwai@suse.de>); Sat, 16 Sep 2023 06:06:01 +0000
Date: Sat, 16 Sep 2023 08:06:01 +0200
Message-ID: <87y1h6tzxy.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Hills <mark@xwax.org>
Cc: Ash Holland <ash@sorrel.sh>,
	alsa-devel@alsa-project.org,
	regressions@lists.linux.dev
Subject: Re: [REGRESSION] rust midir MIDI library causes kernel oops
In-Reply-To: <ba096915-4d9e-0cfa-2dfb-57cb476b3544@xwax.org>
References: <8a555319-9f31-4ea2-878f-adc338bc40d4@sorrel.sh>
	<87msy1ip6l.wl-tiwai@suse.de>
	<ef9118c3-a2eb-d0ff-1efa-cc5fb6416bde@xwax.org>
	<874jjvuywk.wl-tiwai@suse.de>
	<871qezux3d.wl-tiwai@suse.de>
	<ba096915-4d9e-0cfa-2dfb-57cb476b3544@xwax.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: HBRQNS3DIYP4OMAOPNEMHZEBFFGONYXX
X-Message-ID-Hash: HBRQNS3DIYP4OMAOPNEMHZEBFFGONYXX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HBRQNS3DIYP4OMAOPNEMHZEBFFGONYXX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 15 Sep 2023 20:20:12 +0200,
Mark Hills wrote:
> 
> On Fri, 15 Sep 2023, Takashi Iwai wrote:
> 
> > On Fri, 15 Sep 2023 19:30:51 +0200, Takashi Iwai wrote:
> > > 
> > > On Fri, 15 Sep 2023 18:04:35 +0200, Mark Hills wrote:
> [...]
> > > > I upgraded from 6.1.0 to 6.5.3 and Reaper now crashes or hangs on startup 
> > > > with the trace below in dmesg.
> > > > 
> > > > The newer kernel already includes a fix very similar to below, so I think 
> > > > an issue remains.
> > > > 
> > > > I did not dig deeper than capturing information and finding this related 
> > > > thread.
> > > (snip)
> > > > [   72.601440] BUG: kernel NULL pointer dereference, address: 0000000000000020
> > > (snip)
> > > > [   72.601455] RIP: 0010:snd_rawmidi_proc_info_read+0x35/0x220 [snd_rawmidi]
> > > (snip)
> > > > [   72.601477] Call Trace:
> > > > [   72.601478]  <TASK>
> > > > [   72.601479]  ? __die+0x1b/0x60
> > > > [   72.601482]  ? page_fault_oops+0x154/0x420
> > > > [   72.601485]  ? mas_update_gap.part.0+0xac/0x1f0
> > > > [   72.601488]  ? sched_clock_cpu+0xb/0x190
> > > > [   72.601491]  ? __smp_call_single_queue+0x2f/0x50
> > > > [   72.601493]  ? exc_page_fault+0x37a/0x560
> > > > [   72.601495]  ? seq_open+0x4b/0x70
> > > > [   72.601497]  ? asm_exc_page_fault+0x22/0x30
> > > > [   72.601501]  ? snd_rawmidi_proc_info_read+0x35/0x220 [snd_rawmidi]
> > > > [   72.601505]  snd_info_seq_show+0x21/0x40 [snd]
> > > > [   72.601511]  seq_read_iter+0x105/0x4a0
> > > > [   72.601514]  seq_read+0x9e/0xd0
> > > > [   72.601516]  proc_reg_read+0x50/0xa0
> > > > [   72.601518]  vfs_read+0xa4/0x300
> > > > [   72.601521]  ? __do_sys_newfstatat+0x35/0x60
> > > > [   72.601524]  ksys_read+0x5a/0xe0
> > > > [   72.601526]  do_syscall_64+0x38/0x90
> > > > [   72.601528]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
> > > 
> > > It must be a completely different bug.  It comes from the proc fs
> > > read, not the read over sequencer device itself.
> > 
> > Does the change below fix the problem?
> 
> It does! At least it passes my initial test. Reaper starts up now.

Good to hear.  I'll submit the proper fix patch.


thanks,

Takashi
