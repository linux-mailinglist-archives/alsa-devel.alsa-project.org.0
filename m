Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7993E1F12CB
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jun 2020 08:21:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17514166C;
	Mon,  8 Jun 2020 08:20:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17514166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591597300;
	bh=YefTnvDr1Kj6YBCvNxtISHWQjYQmNvmQDX2DM/2yin4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dvcN5mt0TBRM0AHGrEnH/3tK2OkBsMMSo40q89aJIstGS8DE6vtPB89o/8ZZTtzHX
	 XC5+JVczk4rxecVr84FjXQMJYOHvdPHzBiFqlIystSJtQd7y9AreaWYdFFLiiPv+ux
	 tEoWPa4rJ7xjHjFLZPWOEEP0+cmgKbdNPCWfeqMw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10356F8021E;
	Mon,  8 Jun 2020 08:19:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42979F8021C; Mon,  8 Jun 2020 08:19:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5EA44F80125
 for <alsa-devel@alsa-project.org>; Mon,  8 Jun 2020 08:19:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EA44F80125
Received: by verein.lst.de (Postfix, from userid 2407)
 id 820EA68B02; Mon,  8 Jun 2020 08:19:50 +0200 (CEST)
Date: Mon, 8 Jun 2020 08:19:50 +0200
From: Christoph Hellwig <hch@lst.de>
To: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Subject: Re: next-0519 on thinkpad x60: sound related? window manager crash
Message-ID: <20200608061950.GA17476@lst.de>
References: <20200520111136.GA3802@amd> <1591545088.74ii116nf2.none@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1591545088.74ii116nf2.none@localhost>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: alsa-devel@alsa-project.org, x86@kernel.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org, hch@infradead.org, mingo@redhat.com,
 bp@alien8.de, Pavel Machek <pavel@ucw.cz>, hpa@zytor.com, rientjes@google.com,
 tglx@linutronix.de, hch@lst.de
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Can you do a listing using gdb where this happens?

gdb vmlinux

l *(snd_pcm_hw_params+0x3f3)

?

On Sun, Jun 07, 2020 at 11:58:21AM -0400, Alex Xu (Hello71) wrote:
> I have a similar issue, caused between aaa2faab4ed8 and b170290c2836.
> 
> [   20.263098] BUG: unable to handle page fault for address: ffffb2b582cc2000
> [   20.263104] #PF: supervisor write access in kernel mode
> [   20.263105] #PF: error_code(0x000b) - reserved bit violation
> [   20.263107] PGD 3fd03b067 P4D 3fd03b067 PUD 3fd03c067 PMD 3f8822067 PTE 8000273942ab2163
> [   20.263113] Oops: 000b [#1] PREEMPT SMP
> [   20.263117] CPU: 3 PID: 691 Comm: mpv Not tainted 5.7.0-11262-gb170290c2836 #1
> [   20.263119] Hardware name: To Be Filled By O.E.M. To Be Filled By O.E.M./B450 Pro4, BIOS P4.10 03/05/2020
> [   20.263125] RIP: 0010:__memset+0x24/0x30
> [   20.263128] Code: cc cc cc cc cc cc 0f 1f 44 00 00 49 89 f9 48 89 d1 83 e2 07 48 c1 e9 03 40 0f b6 f6 48 b8 01 01 01 01 01 01 01 01 48 0f af c6 <f3> 48 ab 89 d1 f3 aa 4c 89 c8 c3 90 49 89 f9 40 88 f0 48 89 d1 f3
> [   20.263131] RSP: 0018:ffffb2b583d07e10 EFLAGS: 00010216
> [   20.263133] RAX: 0000000000000000 RBX: ffff8b8000102c00 RCX: 0000000000004000
> [   20.263134] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffb2b582cc2000
> [   20.263136] RBP: ffff8b8000101000 R08: 0000000000000000 R09: ffffb2b582cc2000
> [   20.263137] R10: 0000000000005356 R11: ffff8b8000102c18 R12: 0000000000000000
> [   20.263139] R13: 0000000000000000 R14: ffff8b8039944200 R15: ffffffff9794daa0
> [   20.263141] FS:  00007f41aa4b4200(0000) GS:ffff8b803ecc0000(0000) knlGS:0000000000000000
> [   20.263143] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   20.263144] CR2: ffffb2b582cc2000 CR3: 00000003b6731000 CR4: 00000000003406e0
> [   20.263146] Call Trace:
> [   20.263151]  ? snd_pcm_hw_params+0x3f3/0x47a
> [   20.263154]  ? snd_pcm_common_ioctl+0xf2/0xf73
> [   20.263158]  ? snd_pcm_ioctl+0x1e/0x29
> [   20.263161]  ? ksys_ioctl+0x77/0x91
> [   20.263163]  ? __x64_sys_ioctl+0x11/0x14
> [   20.263166]  ? do_syscall_64+0x3d/0xf5
> [   20.263170]  ? entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [   20.263173] Modules linked in: uvcvideo videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 videodev snd_usb_audio videobuf2_common snd_hwdep snd_usbmidi_lib input_leds snd_rawmidi led_class
> [   20.263182] CR2: ffffb2b582cc2000
> [   20.263184] ---[ end trace c6b47a774b91f0a0 ]---
> [   20.263187] RIP: 0010:__memset+0x24/0x30
> [   20.263190] Code: cc cc cc cc cc cc 0f 1f 44 00 00 49 89 f9 48 89 d1 83 e2 07 48 c1 e9 03 40 0f b6 f6 48 b8 01 01 01 01 01 01 01 01 48 0f af c6 <f3> 48 ab 89 d1 f3 aa 4c 89 c8 c3 90 49 89 f9 40 88 f0 48 89 d1 f3
> [   20.263192] RSP: 0018:ffffb2b583d07e10 EFLAGS: 00010216
> [   20.263193] RAX: 0000000000000000 RBX: ffff8b8000102c00 RCX: 0000000000004000
> [   20.263195] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffb2b582cc2000
> [   20.263196] RBP: ffff8b8000101000 R08: 0000000000000000 R09: ffffb2b582cc2000
> [   20.263197] R10: 0000000000005356 R11: ffff8b8000102c18 R12: 0000000000000000
> [   20.263199] R13: 0000000000000000 R14: ffff8b8039944200 R15: ffffffff9794daa0
> [   20.263201] FS:  00007f41aa4b4200(0000) GS:ffff8b803ecc0000(0000) knlGS:0000000000000000
> [   20.263202] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   20.263204] CR2: ffffb2b582cc2000 CR3: 00000003b6731000 CR4: 00000000003406e0
> 
> I bisected this to 82fef0ad811f "x86/mm: unencrypted non-blocking DMA 
> allocations use coherent pools". Reverting 1ee18de92927 resolves the 
> issue.
> 
> Looks like Thinkpad X60 doesn't have VT-d, but could still be DMA 
> related.
---end quoted text---
