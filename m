Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE71C7A24D5
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 19:32:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37BBE820;
	Fri, 15 Sep 2023 19:31:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37BBE820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694799120;
	bh=oilDYuT9CA5V8fzu5AZ76NXuubdIMRN3WkxKyWBOAfQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aqwecXXG0xnwXdeUlGherKHgy9HMsALI0zWu34ClDzC64ZmERkPvU9T1llhbKzxuO
	 jQ7qfpnogeqhQtgs7XK5/1i8wrGi/AA78ZJ9MRAvEkQ24Ky258rE5m2vzOwtj666lv
	 kvm8ZG5L0C3vSC5PmcW/os77PFkjE2s7NCC9JZZk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0E7DF80552; Fri, 15 Sep 2023 19:31:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B23EF80246;
	Fri, 15 Sep 2023 19:31:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D21B1F80425; Fri, 15 Sep 2023 19:31:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9F244F80246
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 19:30:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F244F80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=pD27TyyW;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=fJnjfKMA
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0EDF81FD6E;
	Fri, 15 Sep 2023 17:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1694799052;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RQQTFTfoJhINlFPQeTi2ZFYQCbm4RkSVI4Z+IpD1pQo=;
	b=pD27TyyWHhMHjHR5RsQaZNoOo8hvAeDA861UxJQlRwJuz48ebkeXhmMqRwJMspQcaxLJM4
	KEK3ASAzrhrVtXF7k96S8RUOCGENJqJ01Vepi5r509JhwmL7T4LtVmZOKLbvFZx8RMCz6f
	024fFuiW+QRt++f4bigyIRF4OruC/+c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1694799052;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RQQTFTfoJhINlFPQeTi2ZFYQCbm4RkSVI4Z+IpD1pQo=;
	b=fJnjfKMAWjCWFcPy94Hgd+pALKmnIPza34UQTRC9y7vmSJyqXNqEFys9rOCq2kSY1fQ6Vc
	rEtmlGDciXQT7nDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DBE831358A;
	Fri, 15 Sep 2023 17:30:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id yVXINMuUBGUmUQAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 15 Sep 2023 17:30:51 +0000
Date: Fri, 15 Sep 2023 19:30:51 +0200
Message-ID: <874jjvuywk.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Hills <mark@xwax.org>
Cc: Ash Holland <ash@sorrel.sh>,
	alsa-devel@alsa-project.org,
	regressions@lists.linux.dev
Subject: Re: [REGRESSION] rust midir MIDI library causes kernel oops
In-Reply-To: <ef9118c3-a2eb-d0ff-1efa-cc5fb6416bde@xwax.org>
References: <8a555319-9f31-4ea2-878f-adc338bc40d4@sorrel.sh>
	<87msy1ip6l.wl-tiwai@suse.de>
	<ef9118c3-a2eb-d0ff-1efa-cc5fb6416bde@xwax.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: BBEQKMXGLA2ZX33IXDV3YFF3D3D5NXUK
X-Message-ID-Hash: BBEQKMXGLA2ZX33IXDV3YFF3D3D5NXUK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BBEQKMXGLA2ZX33IXDV3YFF3D3D5NXUK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 15 Sep 2023 18:04:35 +0200,
Mark Hills wrote:
> 
> On Mon, 4 Sep 2023, Takashi Iwai wrote:
> 
> > On Mon, 04 Sep 2023 20:10:45 +0200,
> > Ash Holland wrote:
> 
> > > I upgraded to Linux 6.5 and found that my MIDI-input application no longer
> > > works, and causes an oops when I launch it.
> [...]
> > > I bisected this to:
> > > 
> > > commit f80e6d60d677be1d4dbbcdbf97379b8fbcf97ff0
> > > Author: Takashi Iwai <tiwai@suse.de>
> > > Date:   2023-05-23 09:53:38 +0200
> > > 
> > >     ALSA: seq: Clear padded bytes at expanding events
> > > 
> > >     There can be a small memory hole that may not be cleared at expanding
> > >     an event with the variable length type.  Make sure to clear it.
> > > 
> > >     Reviewed-by: Jaroslav Kysela <perex@perex.cz>
> > >     Link: https://lore.kernel.org/r/20230523075358.9672-18-tiwai@suse.de
> > >     Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > > 
> > > #regzbot introduced: f80e6d60d677be1d4dbbcdbf97379b8fbcf97ff0
> > > 
> > > I guess the problematic part is the `memset(buf + len, 0, newlen - len)`, which
> > > tries to memset a buffer that can be allocated in userspace.
> > 
> > Yes, that was a bad change.  Could you try the fix below?
> 
> I think this problem is recurring -- page_fault_oops triggered via MIDI. 
> But with the new fix.
> 
> I upgraded from 6.1.0 to 6.5.3 and Reaper now crashes or hangs on startup 
> with the trace below in dmesg.
> 
> The newer kernel already includes a fix very similar to below, so I think 
> an issue remains.
> 
> I did not dig deeper than capturing information and finding this related 
> thread.
(snip)
> [   72.601440] BUG: kernel NULL pointer dereference, address: 0000000000000020
(snip)
> [   72.601455] RIP: 0010:snd_rawmidi_proc_info_read+0x35/0x220 [snd_rawmidi]
(snip)
> [   72.601477] Call Trace:
> [   72.601478]  <TASK>
> [   72.601479]  ? __die+0x1b/0x60
> [   72.601482]  ? page_fault_oops+0x154/0x420
> [   72.601485]  ? mas_update_gap.part.0+0xac/0x1f0
> [   72.601488]  ? sched_clock_cpu+0xb/0x190
> [   72.601491]  ? __smp_call_single_queue+0x2f/0x50
> [   72.601493]  ? exc_page_fault+0x37a/0x560
> [   72.601495]  ? seq_open+0x4b/0x70
> [   72.601497]  ? asm_exc_page_fault+0x22/0x30
> [   72.601501]  ? snd_rawmidi_proc_info_read+0x35/0x220 [snd_rawmidi]
> [   72.601505]  snd_info_seq_show+0x21/0x40 [snd]
> [   72.601511]  seq_read_iter+0x105/0x4a0
> [   72.601514]  seq_read+0x9e/0xd0
> [   72.601516]  proc_reg_read+0x50/0xa0
> [   72.601518]  vfs_read+0xa4/0x300
> [   72.601521]  ? __do_sys_newfstatat+0x35/0x60
> [   72.601524]  ksys_read+0x5a/0xe0
> [   72.601526]  do_syscall_64+0x38/0x90
> [   72.601528]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8

It must be a completely different bug.  It comes from the proc fs
read, not the read over sequencer device itself.


Takashi
