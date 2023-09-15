Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F46D7A2335
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 18:05:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2427483A;
	Fri, 15 Sep 2023 18:04:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2427483A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694793946;
	bh=UPAfpmdkPFtTc401lOU8vi6xvNfnSYlqAQ9cF0rjv64=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PbQO4iJJzlaq72aGLVdovUTw9qzrQZRcBpZIUFO1plgQf6EeAw2btNsvBEHfr0KQN
	 Ch0jNx7dnBI1wiZ58I+EiCHupWdBzsl3VyIPngYLW97qBSqQDYIEi7qW5JtZSMmKsP
	 vDRVGYgKYC4FYV3loTz65X5/arydhl3ZzANoVvQc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6AC3BF801F5; Fri, 15 Sep 2023 18:04:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 22977F80246;
	Fri, 15 Sep 2023 18:04:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 003C2F80425; Fri, 15 Sep 2023 18:04:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from disco.pogo.org.uk (disco.pogo.org.uk [93.93.128.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D7CDFF801F5
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 18:04:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7CDFF801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=xwax.org header.i=@xwax.org header.a=rsa-sha256
 header.s=swing header.b=yNhjhwAc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xwax.org;
	s=swing; h=Content-Type:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=CHBOuZf4YhWO+yRWCY6EW8ESurgwTxRQozyPLyNOUrE=; b=yNhjhwAcr40NnXUGNNYv+Kwevr
	RDY5cxOPXavxkSOFjezChdH0acAx29byp9PBMGzpyOwrITHQaoC9vnNBM9rQQFhePRj88WD+E933B
	sH5/yvNrMYPHln0+7g2u/HZwJiZSpy8KTQQJnWI1mUBoOhWF0uDSpwxMjAuGK1sHaUcI=;
Received: from cpc93786-hari17-2-0-cust786.20-2.cable.virginm.net
 ([82.36.99.19] helo=stax)
	by disco.pogo.org.uk with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96 (FreeBSD))
	(envelope-from <mark@xwax.org>)
	id 1qhBJ7-0006t3-2W;
	Fri, 15 Sep 2023 17:04:37 +0100
Received: from localhost (stax.localdomain [local])
	by stax.localdomain (OpenSMTPD) with ESMTPA id 48d0ab79;
	Fri, 15 Sep 2023 16:04:35 +0000 (UTC)
Date: Fri, 15 Sep 2023 17:04:35 +0100 (BST)
From: Mark Hills <mark@xwax.org>
To: Takashi Iwai <tiwai@suse.de>
cc: Ash Holland <ash@sorrel.sh>, alsa-devel@alsa-project.org,
    regressions@lists.linux.dev
Subject: Re: [REGRESSION] rust midir MIDI library causes kernel oops
In-Reply-To: <87msy1ip6l.wl-tiwai@suse.de>
Message-ID: <ef9118c3-a2eb-d0ff-1efa-cc5fb6416bde@xwax.org>
References: <8a555319-9f31-4ea2-878f-adc338bc40d4@sorrel.sh>
 <87msy1ip6l.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-ID-Hash: NWJRBKGQM4DATWV6AFSG4FYQ363WYVPT
X-Message-ID-Hash: NWJRBKGQM4DATWV6AFSG4FYQ363WYVPT
X-MailFrom: mark@xwax.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NWJRBKGQM4DATWV6AFSG4FYQ363WYVPT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 4 Sep 2023, Takashi Iwai wrote:

> On Mon, 04 Sep 2023 20:10:45 +0200,
> Ash Holland wrote:

> > I upgraded to Linux 6.5 and found that my MIDI-input application no longer
> > works, and causes an oops when I launch it.
[...]
> > I bisected this to:
> > 
> > commit f80e6d60d677be1d4dbbcdbf97379b8fbcf97ff0
> > Author: Takashi Iwai <tiwai@suse.de>
> > Date:   2023-05-23 09:53:38 +0200
> > 
> >     ALSA: seq: Clear padded bytes at expanding events
> > 
> >     There can be a small memory hole that may not be cleared at expanding
> >     an event with the variable length type.  Make sure to clear it.
> > 
> >     Reviewed-by: Jaroslav Kysela <perex@perex.cz>
> >     Link: https://lore.kernel.org/r/20230523075358.9672-18-tiwai@suse.de
> >     Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > 
> > #regzbot introduced: f80e6d60d677be1d4dbbcdbf97379b8fbcf97ff0
> > 
> > I guess the problematic part is the `memset(buf + len, 0, newlen - len)`, which
> > tries to memset a buffer that can be allocated in userspace.
> 
> Yes, that was a bad change.  Could you try the fix below?

I think this problem is recurring -- page_fault_oops triggered via MIDI. 
But with the new fix.

I upgraded from 6.1.0 to 6.5.3 and Reaper now crashes or hangs on startup 
with the trace below in dmesg.

The newer kernel already includes a fix very similar to below, so I think 
an issue remains.

I did not dig deeper than capturing information and finding this related 
thread.

Thanks

-- 
Mark


> -- 8< --
> --- a/sound/core/seq/seq_memory.c
> +++ b/sound/core/seq/seq_memory.c
> @@ -187,8 +187,12 @@ int snd_seq_expand_var_event(const struct snd_seq_event *event, int count, char
>  	err = expand_var_event(event, 0, len, buf, in_kernel);
>  	if (err < 0)
>  		return err;
> -	if (len != newlen)
> -		memset(buf + len, 0, newlen - len);
> +	if (len != newlen) {
> +		if (in_kernel)
> +			memset(buf + len, 0, newlen - len);
> +		else
> +			clear_user((__force void __user *)buf + len, newlen - len);
> +	}
>  	return newlen;
>  }
>  EXPORT_SYMBOL(snd_seq_expand_var_event);
> 


[   72.601440] BUG: kernel NULL pointer dereference, address: 0000000000000020
[   72.601443] #PF: supervisor read access in kernel mode
[   72.601445] #PF: error_code(0x0000) - not-present page
[   72.601446] PGD 800000010506c067 P4D 800000010506c067 PUD 10506d067 PMD 0 
[   72.601449] Oops: 0000 [#2] PREEMPT SMP PTI
[   72.601451] CPU: 3 PID: 1944 Comm: reaper Tainted: G      D            6.5.3-mh #159
[   72.601454] Hardware name: Gigabyte Technology Co., Ltd. H170-D3HP/H170-D3HP-CF, BIOS F20g 03/09/2018
[   72.601455] RIP: 0010:snd_rawmidi_proc_info_read+0x35/0x220 [snd_rawmidi]
[   72.601461] Code: 55 48 89 f5 48 c7 c6 aa 26 15 a0 53 48 83 ec 18 4c 8b 67 40 48 8b 7d 00 49 8d 54 24 60 e8 f3 43 0b e1 49 8b 84 24 b0 00 00 00 <48> 8b 40 20 48 85 c0 74 0b 48 89 ee 4c 89 ef ff d0 0f 1f 00 4d 8d
[   72.601463] RSP: 0018:ffffc9000053fd10 EFLAGS: 00010246
[   72.601465] RAX: 0000000000000000 RBX: ffff888102cfa1e0 RCX: 0000000000000002
[   72.601466] RDX: 0000000000001000 RSI: ffffffffa01526ac RDI: ffff888103f9d007
[   72.601467] RBP: ffff888102e800a0 R08: 000000000000000a R09: 000000000000000a
[   72.601469] R10: ffffffffffffffff R11: 0000000000000000 R12: ffff8881020c6000
[   72.601470] R13: ffff888101c4b0c0 R14: ffff888102cfa208 R15: 0000000000000001
[   72.601471] FS:  00007ff035e83740(0000) GS:ffff888a16d80000(0000) knlGS:0000000000000000
[   72.601472] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   72.601473] CR2: 0000000000000020 CR3: 000000010f0f6003 CR4: 00000000003706e0
[   72.601475] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   72.601476] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   72.601477] Call Trace:
[   72.601478]  <TASK>
[   72.601479]  ? __die+0x1b/0x60
[   72.601482]  ? page_fault_oops+0x154/0x420
[   72.601485]  ? mas_update_gap.part.0+0xac/0x1f0
[   72.601488]  ? sched_clock_cpu+0xb/0x190
[   72.601491]  ? __smp_call_single_queue+0x2f/0x50
[   72.601493]  ? exc_page_fault+0x37a/0x560
[   72.601495]  ? seq_open+0x4b/0x70
[   72.601497]  ? asm_exc_page_fault+0x22/0x30
[   72.601501]  ? snd_rawmidi_proc_info_read+0x35/0x220 [snd_rawmidi]
[   72.601505]  snd_info_seq_show+0x21/0x40 [snd]
[   72.601511]  seq_read_iter+0x105/0x4a0
[   72.601514]  seq_read+0x9e/0xd0
[   72.601516]  proc_reg_read+0x50/0xa0
[   72.601518]  vfs_read+0xa4/0x300
[   72.601521]  ? __do_sys_newfstatat+0x35/0x60
[   72.601524]  ksys_read+0x5a/0xe0
[   72.601526]  do_syscall_64+0x38/0x90
[   72.601528]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
[   72.601531] RIP: 0033:0x7ff0359d53fe
[   72.601532] Code: c0 e9 e6 fe ff ff 50 48 8d 3d 4e 53 0a 00 e8 59 ea 01 00 66 0f 1f 84 00 00 00 00 00 64 8b 04 25 18 00 00 00 85 c0 75 14 0f 05 <48> 3d 00 f0 ff ff 77 5a c3 66 0f 1f 84 00 00 00 00 00 48 83 ec 28
[   72.601534] RSP: 002b:00007fff08e0f898 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
[   72.601536] RAX: ffffffffffffffda RBX: 0000000001c10e20 RCX: 00007ff0359d53fe
[   72.601537] RDX: 0000000000000400 RSI: 0000000001bf3bf0 RDI: 0000000000000007
[   72.601538] RBP: 00007ff035aaa520 R08: 0000000000000007 R09: 0000000000000000
[   72.601539] R10: 0000000000001000 R11: 0000000000000246 R12: 0000000001c10e20
[   72.601540] R13: 0000000000000d68 R14: 00007ff035aa9920 R15: 0000000000000d68
[   72.601541]  </TASK>
[   72.601542] Modules linked in: nfsd lockd grace sunrpc tun snd_aloop bridge stp llc ipv6 wacom reiserfs uvcvideo videobuf2_vmalloc videobuf2_memops uvc videobuf2_v4l2 snd_usb_audio videodev snd_usbmidi_lib snd_hwdep videobuf2_common mousedev input_leds mc led_class radeon dm_cache_smq dm_cache dm_persistent_data drm_ttm_helper dm_bio_prison ttm dm_bufio drm_suballoc_helper libcrc32c drm_display_helper dm_mod drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops x86_pkg_temp_thermal drm coretemp kvm_intel drm_panel_orientation_quirks agpgart snd_echo3g cfbfillrect kvm cfbimgblt snd_pcm cfbcopyarea i2c_algo_bit snd_timer fb snd_rawmidi irqbypass i2c_i801 snd_seq_device e1000e font crc32_pclmul sr_mod xhci_pci i2c_smbus fbdev crc32c_intel snd mei_me cdrom i2c_core xhci_pci_renesas soundcore mei xhci_hcd fan thermal evdev video wmi rtc_cmos backlight acpi_pad button
[   72.601588] CR2: 0000000000000020
[   72.601589] ---[ end trace 0000000000000000 ]---
[   72.601590] RIP: 0010:snd_rawmidi_proc_info_read+0x35/0x220 [snd_rawmidi]
[   72.601594] Code: 55 48 89 f5 48 c7 c6 aa 26 15 a0 53 48 83 ec 18 4c 8b 67 40 48 8b 7d 00 49 8d 54 24 60 e8 f3 43 0b e1 49 8b 84 24 b0 00 00 00 <48> 8b 40 20 48 85 c0 74 0b 48 89 ee 4c 89 ef ff d0 0f 1f 00 4d 8d
[   72.601596] RSP: 0018:ffffc90000557d10 EFLAGS: 00010246
[   72.601597] RAX: 0000000000000000 RBX: ffff888102cfa168 RCX: 0000000000000002
[   72.601598] RDX: 0000000000001000 RSI: ffffffffa01526ac RDI: ffff888103f9b007
[   72.601599] RBP: ffff888102e80340 R08: 000000000000000a R09: 000000000000000a
[   72.601600] R10: ffffffffffffffff R11: 0000000000000000 R12: ffff8881020c6000
[   72.601601] R13: ffff888101c4b0c0 R14: ffff888102cfa190 R15: 0000000000000001
[   72.601602] FS:  00007ff035e83740(0000) GS:ffff888a16d80000(0000) knlGS:0000000000000000
[   72.601603] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   72.601605] CR2: 0000000000000020 CR3: 000000010f0f6003 CR4: 00000000003706e0
[   72.601606] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   72.601607] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   72.601608] note: reaper[1944] exited with irqs disabled



$ strace -f -- reaper
[...]
stat("/home/mark/.config/REAPER/reaper.ini", {st_mode=S_IFREG|0644, st_size=12579, ...}) = 0
openat(AT_FDCWD, "/proc/asound/cards", O_RDONLY) = 6
newfstatat(6, "", {st_mode=S_IFREG|0444, st_size=0, ...}, AT_EMPTY_PATH) = 0
read(6, " 0 [Layla3G        ]: Echo_Echo3"..., 1024) = 392
openat(AT_FDCWD, "/proc/asound/card0/midi0", O_RDONLY) = 7
newfstatat(7, "", {st_mode=S_IFREG|0444, st_size=0, ...}, AT_EMPTY_PATH) = 0
read(7,  <unfinished ...>)              = ?
+++ killed by SIGKILL +++
Killed

