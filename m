Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9BDE9F16
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Oct 2019 16:32:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A03C22330;
	Wed, 30 Oct 2019 16:31:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A03C22330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572449553;
	bh=Yv4enlt4how5olPCA9nd91eb1el/GcDMQhBUqK3WhPI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kea4ufliISNywQenadJwIeTewbyx3ybFdUcbV5TW/HT0/qcPqNsJ3Y2x3UjWhyrAn
	 K6azt114XFplIG9QX3gNEMUO2816ekba+AoNZEr3YR+2ZBAn4sj1x2MMuDDK4XI/Vo
	 93dE7vZIMxFa6hfxreMuk/XIbznvH2V/3CMGctgY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8299AF8044A;
	Wed, 30 Oct 2019 16:30:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8FA0DF80361; Wed, 30 Oct 2019 16:28:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94EF0F802A0
 for <alsa-devel@alsa-project.org>; Wed, 30 Oct 2019 16:28:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94EF0F802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=shutemov-name.20150623.gappssmtp.com
 header.i=@shutemov-name.20150623.gappssmtp.com header.b="XBcYFS13"
Received: by mail-lj1-x242.google.com with SMTP id c4so3122454lja.11
 for <alsa-devel@alsa-project.org>; Wed, 30 Oct 2019 08:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=6+1Ovu5C/Bgg+6JSL80oXmurHs8b7k01DUDVWs7V5Nw=;
 b=XBcYFS130JTeD/Xjt/YnNRBGwlmSgdDzpCoJTi1qf6ql2aX3M/OpKt1iWTLSRPPe7s
 3NiB5Z8akkWJ3AxZs6xVomdMiuvzSiTs3MIk+/FnHiEcZ5QgYof3hZ5uZ1sYhurMvD+2
 2A3A8DLOtnSAYJmj+jpflAgwj5r0dotRzXs/hRRuYrzPmhHAyXG2QIOdzeDWLcL3+gV3
 Q3tbkq55evjsQlANbn3jDvhArCt2aK4fAG34FCfkKK/D28jfDo7cl80U224yFFT1x4hr
 P9CJtK+oHCX6HSo8WEpuQQkj7Isyhm7v7l1KrN4z4pCxvTsS2mG8rWGZchjl4UeXSMg2
 zotQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6+1Ovu5C/Bgg+6JSL80oXmurHs8b7k01DUDVWs7V5Nw=;
 b=he1yhoy2uc5toK+WXffljbEfezhYxbQ/tOOtIFihAJ0kDBSfcrW1Zt4ZU9sxvHY1Qg
 uGCnliP8hTmr7Zr1pflNqB1kCpVV7T/UvOwT3v3SJ6TWuqjmTuExA0fOv/QzjH8N80j3
 9krbBmf6xoBukHCSsoJIKbPvrEgFWsw6GkxLnN3oxKTi0MjKQynM0JDRoRU+rQ49ZWVG
 GeSOEDvrMvVZmahXbyjXL6SQWY2nUb6uK2Q9ZXHQ6VmL+TyhUwqG9vd/1oDLqONma4BA
 VZaifPT7LgU0L0ungmDx9YqOAK1tHR9eo3KK3+04pOxiITU54qWjowIZLoV6gZhBCweN
 96oQ==
X-Gm-Message-State: APjAAAWpUEgBh1/vSxxii6AyPmKq9Um/4PyrB4NR2kBK0rPhDnMWeBqY
 dMGoPMIYLL5D/MIHQAb5dwQv91iwP6U=
X-Google-Smtp-Source: APXvYqzH+WaOIrGvKaH9DZOUL8I3+/ld8bglNzSwlh0OSILONiiTfD9/CDJNOv68fl+OdptuqyOhsA==
X-Received: by 2002:a2e:9094:: with SMTP id l20mr214907ljg.246.1572449304546; 
 Wed, 30 Oct 2019 08:28:24 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id v10sm124178lji.46.2019.10.30.08.28.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2019 08:28:23 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id A0978100C02; Wed, 30 Oct 2019 18:28:23 +0300 (+03)
Date: Wed, 30 Oct 2019 18:28:23 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20191030152823.zg7qglzmpo2k2ynu@box.shutemov.name>
References: <20191030141029.isw4y3tfmjp5azev@box.shutemov.name>
 <s5h1ruugtr2.wl-tiwai@suse.de>
 <20191030151137.nret25uc5caak2z4@box>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191030151137.nret25uc5caak2z4@box>
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

On Wed, Oct 30, 2019 at 06:11:37PM +0300, Kirill A. Shutemov wrote:
> On Wed, Oct 30, 2019 at 04:04:01PM +0100, Takashi Iwai wrote:
> > On Wed, 30 Oct 2019 15:10:29 +0100,
> > Kirill A. Shutemov wrote:
> > > 
> > > Hi,
> > > 
> > > I've stepped on this after pulling USB sound card:
> > > 
> > > 	 ============================================
> > > 	 WARNING: possible recursive locking detected
> > > 	 5.4.0-rc4-00090-g95b5dc072cc3-dirty #48 Not tainted
> > > 	 --------------------------------------------
> > > 	 xdg-screensaver/1321 is trying to acquire lock:
> > > 	 ffffffffbaf6b3a0 (register_mutex){+.+.}, at: snd_timer_free.part.0 (/include/linux/compiler.h:199 /include/linux/list.h:268 /sound/core/timer.c:944)
> > > 
> > > 	but task is already holding lock:
> > > 	 ffffffffbaf6b3a0 (register_mutex){+.+.}, at: snd_timer_close (/sound/core/timer.c:416)
> > > 
> > > 	other info that might help us debug this:
> > > 	  Possible unsafe locking scenario:
> > > 
> > > 		CPU0
> > > 		----
> > > 	   lock(register_mutex);
> > > 	   lock(register_mutex);
> > > 
> > > 	*** DEADLOCK ***
> > > 
> > > 	  May be due to missing lock nesting notation
> > > 
> > > 	 2 locks held by xdg-screensaver/1321:
> > > 	 #0: ffff9f74bbf5ef50 (&tu->ioctl_lock){+.+.}, at: snd_timer_user_release (/sound/core/timer.c:1467)
> > > 	 #1: ffffffffbaf6b3a0 (register_mutex){+.+.}, at: snd_timer_close (/sound/core/timer.c:416)
> > > 
> > > 	stack backtrace:
> > > 	 CPU: 27 PID: 1321 Comm: xdg-screensaver Not tainted 5.4.0-rc4-00090-g95b5dc072cc3-dirty #48
> > > 	 Hardware name: Gigabyte Technology Co., Ltd. X299 AORUS Gaming 3 Pro/X299 AORUS Gaming 3 Pro-CF, BIOS F3 12/28/2017
> > > 	 Call Trace:
> > > 	 dump_stack (/lib/dump_stack.c:115)
> > > 	 __lock_acquire.cold (/kernel/locking/lockdep.c:2371 /kernel/locking/lockdep.c:2412 /kernel/locking/lockdep.c:2955 /kernel/locking/lockdep.c:3955)
> > > 	 ? __lock_acquire (/kernel/locking/lockdep.c:3962)
> > > 	 lock_acquire (/arch/x86/include/asm/current.h:15 /kernel/locking/lockdep.c:4489)
> > > 	 ? snd_timer_free.part.0 (/include/linux/compiler.h:199 /include/linux/list.h:268 /sound/core/timer.c:944)
> > > 	 __mutex_lock (/include/linux/compiler.h:199 /arch/x86/include/asm/atomic64_64.h:22 /include/asm-generic/atomic-instrumented.h:837 /include/asm-generic/atomic-long.h:28 /kernel/locking/mutex.c:111 /kernel/locking/mutex.c:152 /kernel/locking/mutex.c:958 /kernel/locking/mutex.c:1103)
> > > 	 ? snd_timer_free.part.0 (/include/linux/compiler.h:199 /include/linux/list.h:268 /sound/core/timer.c:944)
> > > 	 ? __mutex_lock (/include/linux/compiler.h:199 /arch/x86/include/asm/atomic64_64.h:22 /include/asm-generic/atomic-instrumented.h:837 /include/asm-generic/atomic-long.h:28 /kernel/locking/mutex.c:111 /kernel/locking/mutex.c:152 /kernel/locking/mutex.c:958 /kernel/locking/mutex.c:1103)
> > > 	 ? __mutex_lock (/arch/x86/include/asm/preempt.h:102 /kernel/locking/mutex.c:964 /kernel/locking/mutex.c:1103)
> > > 	 ? snd_timer_free.part.0 (/include/linux/compiler.h:199 /include/linux/list.h:268 /sound/core/timer.c:944)
> > > 	 ? snd_timer_free.part.0 (/include/linux/compiler.h:199 /include/linux/list.h:268 /sound/core/timer.c:944)
> > > 	 ? lockdep_hardirqs_on (/kernel/locking/lockdep.c:3394 /kernel/locking/lockdep.c:3434)
> > > 	 snd_timer_free.part.0 (/include/linux/compiler.h:199 /include/linux/list.h:268 /sound/core/timer.c:944)
> > > 	 snd_timer_dev_free (/sound/core/timer.c:967)
> > > 	 __snd_device_free (/sound/core/device.c:76)
> > > 	 snd_device_free_all (/sound/core/device.c:228)
> > > 	 release_card_device (/sound/core/init.c:471 /sound/core/init.c:140)
> > > 	 device_release (/drivers/base/core.c:1105)
> > > 	 kobject_put (/lib/kobject.c:697 /lib/kobject.c:722 /include/linux/kref.h:65 /lib/kobject.c:739)
> > > 	 snd_timer_close_locked (/sound/core/timer.c:398)
> > > 	 snd_timer_close (/sound/core/timer.c:417)
> > > 	 snd_timer_user_release (/sound/core/timer.c:1469)
> > > 	 __fput (/fs/file_table.c:281)
> > > 	 task_work_run (/kernel/task_work.c:115 (discriminator 1))
> > > 	 exit_to_usermode_loop (/include/linux/tracehook.h:188 /arch/x86/entry/common.c:163)
> > > 	 do_syscall_64 (/arch/x86/entry/common.c:194 /arch/x86/entry/common.c:274 /arch/x86/entry/common.c:300)
> > > 	 entry_SYSCALL_64_after_hwframe (/arch/x86/entry/entry_64.S:177)
> > 
> > OK, this looks like a deadlock that is via put_device() called at
> > closing the timer device that is the last open instance while freeing
> > the card.
> > 
> > Could you try the patch below?
> 
> I can, but I'm not sure if I can trigger the issue for the second time.

Yeah, I was able to reproduce it without the patch and cannot with.

Reported-and-tested-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

-- 
 Kirill A. Shutemov
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
