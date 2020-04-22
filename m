Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8CD1B4F62
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Apr 2020 23:27:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B63E516C1;
	Wed, 22 Apr 2020 23:26:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B63E516C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587590863;
	bh=QxxSew2HrsRzN5JK9bT73lnwtqDh14ibxMp9+LW/nyw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NlK7FuYvxkSPZbAghU0qJIac/DVQNr3KYMYN2OJ9OT5Xv7J0HdTkOYs4OJbMd+Or0
	 Aw5I8mBJs4GpIUBHnuc4zwlkprVBO3dzvCcqhPF2J0xa/Wdq4XF+WbOHE5af5lP2BV
	 J0qmvXkEQsKyZSa7W4s8RGaA1bHcDnjygT58cCHA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 028B1F8025E;
	Wed, 22 Apr 2020 23:25:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84824F80142; Wed, 22 Apr 2020 23:25:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50FE4F80142
 for <alsa-devel@alsa-project.org>; Wed, 22 Apr 2020 23:25:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50FE4F80142
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="Ut/Bmj5u"
Received: by mail-pj1-x1044.google.com with SMTP id e6so1531433pjt.4
 for <alsa-devel@alsa-project.org>; Wed, 22 Apr 2020 14:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ERFnmtA1PyeZJdQ62un11xfdSZSd2Gi50rPc2dY8Uj0=;
 b=Ut/Bmj5u26IOwOJydlPW9w4/ESujW+A38uL+JyLshKTHJMYwwzSs2DPXj9UTPGfcGB
 OcqH/MYLzbltdTdSHe5NVfsSi7PJUYq3EOuWu1l5f7U0Zrdk7/VwvuEY4XKQYupMvgUT
 pr4DcwLjx0v1iGeGcjUw0/WCvxsO/5cKMG0ECo/xG7WSe250LkwN4gFX652PHeRc9ihG
 xmkLWLEcGoLMEAuxGhK1c3cnq5GuA58azdZ4fDLjj22SrPYx/8rSxzeTyTcmPqkW1A4N
 BiIiZxkFCVnS5j5EcJXzqluWNKZ7FSHWaRTm9CHbf/InLfNTg0LwQzeiOzLd1qYOYwZY
 UARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ERFnmtA1PyeZJdQ62un11xfdSZSd2Gi50rPc2dY8Uj0=;
 b=rTuy+rxj0j4lhJ7whmwkuoAmfYOHDc2eBjUC8DM8RTCypdJQcceTlo3sY/zjHV34XM
 g2umY2pqyZ4AlbnCqCGk6a/fzbUMfh/Yl7pe73TtGEb805gvx7fQNjVZ7+f/juVP30zx
 9jDo1w0Qot2kHqow4u7W4DdNOA94/rduouiOf+OrPq/qzGvC6iw6Sz1O6QpQN7apJLSm
 nLgCauKDmRw5UVo7fWywEcF9N6I1puu+n22yz6wTr/woC0e4OI/SIJLz0x4KC8HawQ1K
 XyhVV+MvPS76HcXV08LLak45Hvzc1EbPvS+0zhS987Jux+UIZNrGIfyiB0X2U7TH4Vq3
 QO5w==
X-Gm-Message-State: AGi0PubeFJKcFZj82EUfVZW2WOJTs5rQQs6Z8cAk+3owtKoSjctoPfV+
 z1DHs3pZ18vJxCO0hElx2JwMXzpQfwssykgKhUvSOw==
X-Google-Smtp-Source: APiQypIp6HyuADVKwHXDbAnkJlVfxK5EpuMKb33dvMXcDrywroiaiY6wIgXHVc6YwsJR5hW+IdgBGxOABI8SwMB91Pw=
X-Received: by 2002:a17:90a:a2d:: with SMTP id
 o42mr766294pjo.164.1587590707823; 
 Wed, 22 Apr 2020 14:25:07 -0700 (PDT)
MIME-Version: 1.0
References: <1586506705-3194-1-git-send-email-brent.lu@intel.com>
 <4f495cf1-4740-cf3b-196f-cc850c503b43@linux.intel.com>
 <BN6PR1101MB21328B6F4147640D07F9E40A97DA0@BN6PR1101MB2132.namprd11.prod.outlook.com>
 <c8309abf-cbfb-a3db-5aa7-2e2f748a6d34@intel.com>
 <BN6PR1101MB21328C54E66082227B9F497A97D50@BN6PR1101MB2132.namprd11.prod.outlook.com>
In-Reply-To: <BN6PR1101MB21328C54E66082227B9F497A97D50@BN6PR1101MB2132.namprd11.prod.outlook.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 22 Apr 2020 14:24:56 -0700
Message-ID: <CAKwvOdkjGRPfO_=2So7HLrVPBr0SbT+zjJRYhFEeBxPCZuJoVA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: Intel: sst: ipc command timeout
To: "Lu, Brent" <brent.lu@intel.com>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Richard Fontana <rfontana@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 "clang-built-linux@googlegroups.com" <clang-built-linux@googlegroups.com>,
 Mark Brown <broonie@kernel.org>, Manoj Gupta <manojgupta@google.com>,
 "amadeuszx.slawinski@linux.intel.com" <amadeuszx.slawinski@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
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

On Tue, Apr 21, 2020 at 9:16 AM Lu, Brent <brent.lu@intel.com> wrote:
>
> >
> > Regs width difference between BDW and BYT comes from specification. BDW
> > has IPC registers which are 32 wide. This fact ain't exactly the reason to modify
> > sst_shim32_read64.
> >
> > I'm sharing Amadeo's point of view. Your change should slow down execution a
> > bit - but that might be just what handlers needed to make everything work again.
> > Debug prints also slow down the execution what could have prevented you from
> > spotting the real problem.
> > Let's ignore the memcpy stuff for a moment - could you focus on elaborating
> > the scenario where such issue occurs? Your initial commit message also skips
> > important bits such as platform used when reproducing and so on, please add
> > them.

Splicing in Manoj, from CrOS' LLVM team, who has done a ton of work
for building Linux kernels with Clang.  Manoj posted this on an
internal thread about this issue, that I think could help inform the
discussion upstream:
```
I saw the upstream discussion and would like to clarify a few things:

1. __builtin_memcpy makes clang emit a call to memcpy.
2. In Linux kernel: memcpy implementation is provided by Kernel, not clang.
3. clang 10 used to optimize trivial memcpy e.g. 64-bit memcpy was
optimized to two 32 bit reads and not calling memcpy at all.
4. clang 11 does not optimize trivial memcpy if the program provides
its own memcpy implementation i.e. it defers memcpy to the
implementation defined memcpy.
4.1: As kernel provides its own memcpy, this code here now calls into
kernel memcpy .
5. If the code now does not work as expected, this is because it was
relying on compiler to optimize the code to two 32 bit reads and not
calling memcpy. i.e. it was just working by chance.

So, replacing call to memcpy by an implementation that does the reads
in a loop is the right thing to get the previous behavior.
```
In particular, I'm curious if the readb/readl/readw macros
(arch/x86/include/asm/io.h) should be used here, which are explicitly
designed to prevent multiple reads or write from being combined into
memcpy()'s for MMIO?  Though I have no idea if that even applies here,
and have only been paying attention to this bug from afar, so sorry if
the suggestion is just noise.

> >
> > Thanks,
> > Czarek
>
> This issue is reported to happen on BYT Chrome book (rambi) on Chrome-v4.4
> branch after changing toolchain from clang10 to clang11.
>
> The reproduce step is simple. Just run arecord multiple times (<10) then you will
> see error message for hw_params ioctl failure.
>
> $ arecord -D hw:1,0 -f S16_LE -c 2 /dev/null
> $ ctrl+c
>
> The error message suggests the stream commit (IPC_IA_ALLOC_STREAM, 0x20) IPC
> command failed due to timeout but the msg id field of ipcd read after the timeout is
> also 0x20. It seems to me that the command is success but the host driver does not
> know it for some reason.
>
> 2020-03-15T23:02:06.614151+00:00 ERR kernel: [  852.023766] baytrail-pcm-audio baytrail-pcm-audio: ipc: --message timeout-- ipcx 0x2220 isr 0xf0020 ipcd 0x2220 imrx 0x0
> 2020-03-15T23:02:06.614209+00:00 ERR kernel: [  852.023796] baytrail-pcm-audio baytrail-pcm-audio: ipc: error stream commit failed
> 2020-03-15T23:02:06.614218+00:00 ERR kernel: [  852.023813]  Baytrail Audio: PCM: failed stream commit -110
> 2020-03-15T23:02:06.614225+00:00 ERR kernel: [  852.023832] baytrail-pcm-audio baytrail-pcm-audio: ASoC: baytrail-pcm-audio hw params failed: -110
>
> I add some messages to make the log easier to read. You can check the gerrit link if you
> are interested:
> https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2131507
>
> In the test patch I read the SST_IPCD register in sst_byt_irq_thread() twice and found
> the value could be different. The IPC_IA_FREE_STREAM(0x21) seems to be the last IPC
> command sent in the pcm_release of previous arecord command.
>
> [  125.009724] sound pcmC1D0c: snd_pcm_release:
> [  125.009732] baytrail-pcm-audio baytrail-pcm-audio: ipc_tx_message: header 0x8000000000000221 wait 1
> [  125.009760] baytrail-pcm-audio baytrail-pcm-audio: byt_tx_msg: header 0x8000000000000226
> [  125.009803] baytrail-pcm-audio baytrail-pcm-audio: sst_byt_irq_thread: header 0x297
> [  125.009823] baytrail-pcm-audio baytrail-pcm-audio: byt_tx_msg: header 0x8000000000000221
> [  125.009872] baytrail-pcm-audio baytrail-pcm-audio: sst_byt_irq_thread: header 0x297
> [  125.010442] baytrail-pcm-audio baytrail-pcm-audio: sst_byt_irq_thread: header 0x80000000000c2226
> [  125.010456] baytrail-pcm-audio baytrail-pcm-audio: sst_ipc_reply_find_msg: not match, msg header 0x8000000000000221
> [  125.010511] baytrail-pcm-audio baytrail-pcm-audio: sst_byt_irq_thread: header 0x8000000000000221
> [  125.011355] baytrail-pcm-audio baytrail-pcm-audio: tx_wait_done: ipc success, header 0x8000000000000221
> [  125.380506] sound pcmC1D0c: snd_pcm_capture_open:
> [  125.380544] sound pcmC1D0c: snd_pcm_capture_ioctl1: INFO
> [  125.380554] sound pcmC1D0c: snd_pcm_capture_ioctl1: PVERSION
> [  125.380561] sound pcmC1D0c: snd_pcm_capture_ioctl1: TTSTAMP
> [  125.380581] sound pcmC1D0c: snd_pcm_mmap:
> [  125.380622] sound pcmC1D0c: snd_pcm_mmap:
> [  125.380648] sound pcmC1D0c: snd_pcm_capture_ioctl1: INFO
> [  125.380717] sound pcmC1D0c: snd_pcm_capture_ioctl1: HW_REFINE
> [  125.380737] sound pcmC1D0c: snd_pcm_capture_ioctl1: HW_REFINE
> [  125.380766] sound pcmC1D0c: snd_pcm_capture_ioctl1: HW_REFINE
> [  125.380779] sound pcmC1D0c: snd_pcm_capture_ioctl1: HW_REFINE
> [  125.380789] sound pcmC1D0c: snd_pcm_capture_ioctl1: HW_REFINE
> [  125.380799] sound pcmC1D0c: snd_pcm_capture_ioctl1: HW_REFINE
> [  125.380808] sound pcmC1D0c: snd_pcm_capture_ioctl1: HW_REFINE
> [  125.380815] sound pcmC1D0c: snd_pcm_capture_ioctl1: HW_PARAMS
> [  125.380839] baytrail-pcm-audio baytrail-pcm-audio: ipc_tx_message: header 0x8000000000642220 wait 1
> [  125.380854] baytrail-pcm-audio baytrail-pcm-audio: byt_tx_msg: header 0x8000000000642220
> => write IPC_IA_ALLOC_STREAM message (0x20) to SST_IPCX
> [  125.380931] baytrail-pcm-audio baytrail-pcm-audio: sst_byt_irq_thread: header 0x8000000000000221
> => read message reply from SST_IPCD and an IPC_IA_FREE_STREAM(0x21) is returned
> [  125.380942] baytrail-pcm-audio baytrail-pcm-audio: sst_byt_irq_thread: ipcd 0x8000000000602220
> => read SST_IPCD again, this time the message id is what we are expected (0x20)
> [  125.380948] baytrail-pcm-audio baytrail-pcm-audio: sst_ipc_reply_find_msg: not match, msg header 0x8000000000642220
> [  125.681171] baytrail-pcm-audio baytrail-pcm-audio: tx_wait_done: ipc timeout, header 0x8000000000642220
> [  125.681204] baytrail-pcm-audio baytrail-pcm-audio: ipc: --message timeout-- ipcx 0x2220 isr 0x50020 ipcd 0x2220 imrx 0x0
> [  125.681212] baytrail-pcm-audio baytrail-pcm-audio: ipc: error stream commit failed
> [  125.681217]  Baytrail Audio: PCM: failed stream commit -110
> [  125.681223] baytrail-pcm-audio baytrail-pcm-audio: ASoC: baytrail-pcm-audio hw params failed: -110
>
> Regards,
> Brent
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/BN6PR1101MB21328C54E66082227B9F497A97D50%40BN6PR1101MB2132.namprd11.prod.outlook.com.



-- 
Thanks,
~Nick Desaulniers
