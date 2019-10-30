Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D40E9D32
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Oct 2019 15:11:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45ABB231F;
	Wed, 30 Oct 2019 15:10:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45ABB231F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572444692;
	bh=ejpAtYQN7SGhMd4g/zy7p05VYABvB++4QsiMGxD7P28=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aOKr7IQRUQ6Bs/4njVIi8ALJ9WdtTwd8wA/VgaxIeaEdvRBevGZc++pQQehgy5scZ
	 v6rXziVlbFvan/JDJu/XE0LsUwPtIcXrbv1bYhtRvGin74WawGKKITL2EkcPfuRgb/
	 1c6jnXZpcXRADX9boYpD6xhsT+ugcHAj8OUgEA1M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8DB2F8015A;
	Wed, 30 Oct 2019 15:10:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C78F7F80361; Wed, 30 Oct 2019 15:10:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D200BF802A1
 for <alsa-devel@alsa-project.org>; Wed, 30 Oct 2019 15:10:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D200BF802A1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=shutemov-name.20150623.gappssmtp.com
 header.i=@shutemov-name.20150623.gappssmtp.com header.b="UHnwlO44"
Received: by mail-lf1-x144.google.com with SMTP id f5so1686665lfp.1
 for <alsa-devel@alsa-project.org>; Wed, 30 Oct 2019 07:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=vWvOPEIi1tbsZALaFAv0Uy0WFf8KUbbFXlv9R7bSARI=;
 b=UHnwlO44x8oRaD6wl7/Yv6WQXv1nR50giDX60GgPqV972Fr3GoJC1jnFvHS39TN0lh
 K1FCyNB9qwU19KxQWnJT8t3ZqipYusVSGv0kIsu2bQe+DttKFDB+gEaVKBWmDFYe2+ZZ
 R2x9Xh7y2zboI/vQPvmyxeMqqG4xNbMgg+TtpbJD2xbLrNnU1XPwyEiD6by/jvw3FUPK
 5FNDMJbN2F+IH1k0QWnhlFvisLiKCwcMqqTTL6TMGtFowemAQ0ATnXZd4r8txSCh//56
 uYpLiHnz2XAsPjgSGO2jXUTTOdpeNeqW+BxuLJa8DzD0LVjX64G9OQjQkEaOofO2FOMy
 QiCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=vWvOPEIi1tbsZALaFAv0Uy0WFf8KUbbFXlv9R7bSARI=;
 b=NiTn1niCvW6336OpJTSkyMWUSkHclwL9xIFS7xb5pHlhlw78Q9KDIIgl9EPYenP7ZK
 83AwfYtjLS+GeAKkyccsEbfnpNYPJJ+Kr8R0ha9Rmt9svTI86ULQ7OODCm8bGttLILhl
 xTjCGFpo+zKpW9htBsSOosTGyTTmsCzZtUkTMA2G2pxhTYsVsDznDeXjYGfUX2t/fLqW
 /ySqhS87pm6vZiopl0pJJKXb9nZQlbVCMPgxMzcB5k36eUCFVk8RiUU3x0sDy5lhKrTO
 n8RA5TTWQrqpM/kNhNw0zHdOaPj3ldyJp/hVvbYIDQrfy3fjr+hRhKNubtkwM4XFJY22
 NATQ==
X-Gm-Message-State: APjAAAVQuOy9h3a9+hnoy7MUq+9sf68lxnJeKYFDjsFmk45VJkvBW/a7
 aIcgsGM8KhgbSK3Bbp4gIQ3mBeOp6B4=
X-Google-Smtp-Source: APXvYqzFqjIdXhHgSDDwq/JhvWduZmLL2rp2GUtjDIt05HFFNvGaSxeJVxGJEMc+xOs+2ukKp+l/BQ==
X-Received: by 2002:ac2:569c:: with SMTP id 28mr443084lfr.139.1572444630933;
 Wed, 30 Oct 2019 07:10:30 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id x187sm91633lfa.64.2019.10.30.07.10.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2019 07:10:30 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id D5DEE100C02; Wed, 30 Oct 2019 17:10:29 +0300 (+03)
Date: Wed, 30 Oct 2019 17:10:29 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Jaroslav Kysela <perex@perex.cz>
Message-ID: <20191030141029.isw4y3tfmjp5azev@box.shutemov.name>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: NeoMutt/20180716
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Thomas Gleixner <tglx@linutronix.de>, Logan Gunthorpe <logang@deltatee.com>,
 Kirill Smelkov <kirr@nexedi.com>, Guenter Roeck <linux@roeck-us.net>
Subject: [alsa-devel] sound/core/timer: Deadlock on register_mutex
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

Hi,

I've stepped on this after pulling USB sound card:

	 ============================================
	 WARNING: possible recursive locking detected
	 5.4.0-rc4-00090-g95b5dc072cc3-dirty #48 Not tainted
	 --------------------------------------------
	 xdg-screensaver/1321 is trying to acquire lock:
	 ffffffffbaf6b3a0 (register_mutex){+.+.}, at: snd_timer_free.part.0 (/include/linux/compiler.h:199 /include/linux/list.h:268 /sound/core/timer.c:944)

	but task is already holding lock:
	 ffffffffbaf6b3a0 (register_mutex){+.+.}, at: snd_timer_close (/sound/core/timer.c:416)

	other info that might help us debug this:
	  Possible unsafe locking scenario:

		CPU0
		----
	   lock(register_mutex);
	   lock(register_mutex);

	*** DEADLOCK ***

	  May be due to missing lock nesting notation

	 2 locks held by xdg-screensaver/1321:
	 #0: ffff9f74bbf5ef50 (&tu->ioctl_lock){+.+.}, at: snd_timer_user_release (/sound/core/timer.c:1467)
	 #1: ffffffffbaf6b3a0 (register_mutex){+.+.}, at: snd_timer_close (/sound/core/timer.c:416)

	stack backtrace:
	 CPU: 27 PID: 1321 Comm: xdg-screensaver Not tainted 5.4.0-rc4-00090-g95b5dc072cc3-dirty #48
	 Hardware name: Gigabyte Technology Co., Ltd. X299 AORUS Gaming 3 Pro/X299 AORUS Gaming 3 Pro-CF, BIOS F3 12/28/2017
	 Call Trace:
	 dump_stack (/lib/dump_stack.c:115)
	 __lock_acquire.cold (/kernel/locking/lockdep.c:2371 /kernel/locking/lockdep.c:2412 /kernel/locking/lockdep.c:2955 /kernel/locking/lockdep.c:3955)
	 ? __lock_acquire (/kernel/locking/lockdep.c:3962)
	 lock_acquire (/arch/x86/include/asm/current.h:15 /kernel/locking/lockdep.c:4489)
	 ? snd_timer_free.part.0 (/include/linux/compiler.h:199 /include/linux/list.h:268 /sound/core/timer.c:944)
	 __mutex_lock (/include/linux/compiler.h:199 /arch/x86/include/asm/atomic64_64.h:22 /include/asm-generic/atomic-instrumented.h:837 /include/asm-generic/atomic-long.h:28 /kernel/locking/mutex.c:111 /kernel/locking/mutex.c:152 /kernel/locking/mutex.c:958 /kernel/locking/mutex.c:1103)
	 ? snd_timer_free.part.0 (/include/linux/compiler.h:199 /include/linux/list.h:268 /sound/core/timer.c:944)
	 ? __mutex_lock (/include/linux/compiler.h:199 /arch/x86/include/asm/atomic64_64.h:22 /include/asm-generic/atomic-instrumented.h:837 /include/asm-generic/atomic-long.h:28 /kernel/locking/mutex.c:111 /kernel/locking/mutex.c:152 /kernel/locking/mutex.c:958 /kernel/locking/mutex.c:1103)
	 ? __mutex_lock (/arch/x86/include/asm/preempt.h:102 /kernel/locking/mutex.c:964 /kernel/locking/mutex.c:1103)
	 ? snd_timer_free.part.0 (/include/linux/compiler.h:199 /include/linux/list.h:268 /sound/core/timer.c:944)
	 ? snd_timer_free.part.0 (/include/linux/compiler.h:199 /include/linux/list.h:268 /sound/core/timer.c:944)
	 ? lockdep_hardirqs_on (/kernel/locking/lockdep.c:3394 /kernel/locking/lockdep.c:3434)
	 snd_timer_free.part.0 (/include/linux/compiler.h:199 /include/linux/list.h:268 /sound/core/timer.c:944)
	 snd_timer_dev_free (/sound/core/timer.c:967)
	 __snd_device_free (/sound/core/device.c:76)
	 snd_device_free_all (/sound/core/device.c:228)
	 release_card_device (/sound/core/init.c:471 /sound/core/init.c:140)
	 device_release (/drivers/base/core.c:1105)
	 kobject_put (/lib/kobject.c:697 /lib/kobject.c:722 /include/linux/kref.h:65 /lib/kobject.c:739)
	 snd_timer_close_locked (/sound/core/timer.c:398)
	 snd_timer_close (/sound/core/timer.c:417)
	 snd_timer_user_release (/sound/core/timer.c:1469)
	 __fput (/fs/file_table.c:281)
	 task_work_run (/kernel/task_work.c:115 (discriminator 1))
	 exit_to_usermode_loop (/include/linux/tracehook.h:188 /arch/x86/entry/common.c:163)
	 do_syscall_64 (/arch/x86/entry/common.c:194 /arch/x86/entry/common.c:274 /arch/x86/entry/common.c:300)
	 entry_SYSCALL_64_after_hwframe (/arch/x86/entry/entry_64.S:177)


--
 Kirill A. Shutemov
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
