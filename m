Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62052E9E97
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Oct 2019 16:14:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1D3E22A6;
	Wed, 30 Oct 2019 16:13:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1D3E22A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572448464;
	bh=i1Fs8KPdtHNpNk9oiDPezKtdTtS66uo6x3lrhd6Lx+k=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o+HmHa7mNaSHEHqBBjYhBK3YfFKZ3JK4k0+8mY+ltH5jbG9lWJyKL7YHfUPQKt33e
	 m3tBHdRgS3xpm4vDiwMSNEmij+kr7ZEnze2ub/peHV+gMYpGBY/PSRj6K2z0dwVyh8
	 SHsQVmb9FdmvSrmLPRN/Q1QhEvGqR/TcXG9NJK8U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55949F8044A;
	Wed, 30 Oct 2019 16:12:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A015F80361; Wed, 30 Oct 2019 16:11:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5CBFF8015A
 for <alsa-devel@alsa-project.org>; Wed, 30 Oct 2019 16:11:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5CBFF8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=shutemov-name.20150623.gappssmtp.com
 header.i=@shutemov-name.20150623.gappssmtp.com header.b="VTGm2FJj"
Received: by mail-lf1-x142.google.com with SMTP id z12so1839382lfj.9
 for <alsa-devel@alsa-project.org>; Wed, 30 Oct 2019 08:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Ew4mPHzEDChjwZ6r+gSELsFP9TQqVpPuS742rIsS3aE=;
 b=VTGm2FJjHoT/ZAESegWwnI0GDBO1bZXjQqYVbwyRw9Qmae+24JA8Jy1DsEbFoaTm3F
 qpYKVPvWyqStm6Sp/Ef8wvmfeG9QCS3BmH7zxuTvsg40Tb95m1/Sqf8I4WrVBR+TqTfj
 8rSRXTZroyj7p1x9mdQUhAIEel0/gwZTm7VZnvq3bANLf4Y9y8l/9g8nccIC8dkmkDS9
 xggPgk2vedAK9zjZ4sZjF2471t0sXTVbboWmvxZiyQhqB77u08PCUwA2IT0Xve7r9cqb
 RWzqRlWM+4yQ75PyfXZrd6aHNzSW7gs2IZDcuWRj60dkfYocDaMSW0VWXBE/23Yk3lRS
 urEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Ew4mPHzEDChjwZ6r+gSELsFP9TQqVpPuS742rIsS3aE=;
 b=l+0esCohNn1aemo9EDTbAHabi8a1XNDvxaoM+Vo+KNpmpabaCfoJAVVUKVFW5hA1c+
 1Qcck39ylVZ/h6iOkSkGMM+ImRAmVj/d8OuoK0xyJMqffjwPi7S0yFGfoh1U0pRnB+96
 oHiC6bWBj+12mOcNoIeQxfHBeqR7saDs6JCTTJBF0dzw2PNB+ri0VAZwPp5/5kPzTisF
 j5Vng9ewgyPvVn4P2S18lLt0kC5UD07jjL5w5FzcM7M4wmdzO0k6w/09Xu3zFsvP3CXI
 nqYmdJsFEQJX92Wx5hNtbVXiVYFH/FkgYucwWLuQXlxRWl21DOhgc+0uONzwfTRVuLc2
 EA9A==
X-Gm-Message-State: APjAAAV23Pjy0TYb1/hpeMFA6GeePyfzpgkQ63WhH63uId0NlF/uTyU4
 HgHVGjyZEImHGjDF19W22vtLmN9qy5g=
X-Google-Smtp-Source: APXvYqwcEExqFdUNonrfA4lX6RwYdiJdcOhGFj/HtekeESzr5IUyiQjiWsB5ozrcE1oDLfyAaoXuGw==
X-Received: by 2002:a19:7515:: with SMTP id y21mr6435911lfe.96.1572448299509; 
 Wed, 30 Oct 2019 08:11:39 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id x16sm102028ljd.69.2019.10.30.08.11.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2019 08:11:38 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id C1CE0100C02; Wed, 30 Oct 2019 18:11:37 +0300 (+03)
Date: Wed, 30 Oct 2019 18:11:37 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20191030151137.nret25uc5caak2z4@box>
References: <20191030141029.isw4y3tfmjp5azev@box.shutemov.name>
 <s5h1ruugtr2.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <s5h1ruugtr2.wl-tiwai@suse.de>
User-Agent: NeoMutt/20180716
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Thomas Gleixner <tglx@linutronix.de>, Logan Gunthorpe <logang@deltatee.com>,
 Kirill Smelkov <kirr@nexedi.com>, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [alsa-devel] sound/core/timer: Deadlock on register_mutex
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Oct 30, 2019 at 04:04:01PM +0100, Takashi Iwai wrote:
> On Wed, 30 Oct 2019 15:10:29 +0100,
> Kirill A. Shutemov wrote:
> > 
> > Hi,
> > 
> > I've stepped on this after pulling USB sound card:
> > 
> > 	 ============================================
> > 	 WARNING: possible recursive locking detected
> > 	 5.4.0-rc4-00090-g95b5dc072cc3-dirty #48 Not tainted
> > 	 --------------------------------------------
> > 	 xdg-screensaver/1321 is trying to acquire lock:
> > 	 ffffffffbaf6b3a0 (register_mutex){+.+.}, at: snd_timer_free.part.0 (/include/linux/compiler.h:199 /include/linux/list.h:268 /sound/core/timer.c:944)
> > 
> > 	but task is already holding lock:
> > 	 ffffffffbaf6b3a0 (register_mutex){+.+.}, at: snd_timer_close (/sound/core/timer.c:416)
> > 
> > 	other info that might help us debug this:
> > 	  Possible unsafe locking scenario:
> > 
> > 		CPU0
> > 		----
> > 	   lock(register_mutex);
> > 	   lock(register_mutex);
> > 
> > 	*** DEADLOCK ***
> > 
> > 	  May be due to missing lock nesting notation
> > 
> > 	 2 locks held by xdg-screensaver/1321:
> > 	 #0: ffff9f74bbf5ef50 (&tu->ioctl_lock){+.+.}, at: snd_timer_user_release (/sound/core/timer.c:1467)
> > 	 #1: ffffffffbaf6b3a0 (register_mutex){+.+.}, at: snd_timer_close (/sound/core/timer.c:416)
> > 
> > 	stack backtrace:
> > 	 CPU: 27 PID: 1321 Comm: xdg-screensaver Not tainted 5.4.0-rc4-00090-g95b5dc072cc3-dirty #48
> > 	 Hardware name: Gigabyte Technology Co., Ltd. X299 AORUS Gaming 3 Pro/X299 AORUS Gaming 3 Pro-CF, BIOS F3 12/28/2017
> > 	 Call Trace:
> > 	 dump_stack (/lib/dump_stack.c:115)
> > 	 __lock_acquire.cold (/kernel/locking/lockdep.c:2371 /kernel/locking/lockdep.c:2412 /kernel/locking/lockdep.c:2955 /kernel/locking/lockdep.c:3955)
> > 	 ? __lock_acquire (/kernel/locking/lockdep.c:3962)
> > 	 lock_acquire (/arch/x86/include/asm/current.h:15 /kernel/locking/lockdep.c:4489)
> > 	 ? snd_timer_free.part.0 (/include/linux/compiler.h:199 /include/linux/list.h:268 /sound/core/timer.c:944)
> > 	 __mutex_lock (/include/linux/compiler.h:199 /arch/x86/include/asm/atomic64_64.h:22 /include/asm-generic/atomic-instrumented.h:837 /include/asm-generic/atomic-long.h:28 /kernel/locking/mutex.c:111 /kernel/locking/mutex.c:152 /kernel/locking/mutex.c:958 /kernel/locking/mutex.c:1103)
> > 	 ? snd_timer_free.part.0 (/include/linux/compiler.h:199 /include/linux/list.h:268 /sound/core/timer.c:944)
> > 	 ? __mutex_lock (/include/linux/compiler.h:199 /arch/x86/include/asm/atomic64_64.h:22 /include/asm-generic/atomic-instrumented.h:837 /include/asm-generic/atomic-long.h:28 /kernel/locking/mutex.c:111 /kernel/locking/mutex.c:152 /kernel/locking/mutex.c:958 /kernel/locking/mutex.c:1103)
> > 	 ? __mutex_lock (/arch/x86/include/asm/preempt.h:102 /kernel/locking/mutex.c:964 /kernel/locking/mutex.c:1103)
> > 	 ? snd_timer_free.part.0 (/include/linux/compiler.h:199 /include/linux/list.h:268 /sound/core/timer.c:944)
> > 	 ? snd_timer_free.part.0 (/include/linux/compiler.h:199 /include/linux/list.h:268 /sound/core/timer.c:944)
> > 	 ? lockdep_hardirqs_on (/kernel/locking/lockdep.c:3394 /kernel/locking/lockdep.c:3434)
> > 	 snd_timer_free.part.0 (/include/linux/compiler.h:199 /include/linux/list.h:268 /sound/core/timer.c:944)
> > 	 snd_timer_dev_free (/sound/core/timer.c:967)
> > 	 __snd_device_free (/sound/core/device.c:76)
> > 	 snd_device_free_all (/sound/core/device.c:228)
> > 	 release_card_device (/sound/core/init.c:471 /sound/core/init.c:140)
> > 	 device_release (/drivers/base/core.c:1105)
> > 	 kobject_put (/lib/kobject.c:697 /lib/kobject.c:722 /include/linux/kref.h:65 /lib/kobject.c:739)
> > 	 snd_timer_close_locked (/sound/core/timer.c:398)
> > 	 snd_timer_close (/sound/core/timer.c:417)
> > 	 snd_timer_user_release (/sound/core/timer.c:1469)
> > 	 __fput (/fs/file_table.c:281)
> > 	 task_work_run (/kernel/task_work.c:115 (discriminator 1))
> > 	 exit_to_usermode_loop (/include/linux/tracehook.h:188 /arch/x86/entry/common.c:163)
> > 	 do_syscall_64 (/arch/x86/entry/common.c:194 /arch/x86/entry/common.c:274 /arch/x86/entry/common.c:300)
> > 	 entry_SYSCALL_64_after_hwframe (/arch/x86/entry/entry_64.S:177)
> 
> OK, this looks like a deadlock that is via put_device() called at
> closing the timer device that is the last open instance while freeing
> the card.
> 
> Could you try the patch below?

I can, but I'm not sure if I can trigger the issue for the second time.

-- 
 Kirill A. Shutemov
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
