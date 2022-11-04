Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7549761D877
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Nov 2022 08:25:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 132C6172A;
	Sat,  5 Nov 2022 08:24:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 132C6172A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667633118;
	bh=CH03+LtiaLzntLINYBwnH9CWU4bugJpzMoA7QUpzTrQ=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YwC4XE92eZ4eT9i3cccAoGBbPDPWTkVR5zCY3lctLC0h7gEHLXjnKsa6SnE8FDWWY
	 z+cZfMLp0uJV/DoxmQwaiIpQbKKBO86419YwqP9HeEj3ziM5mlgI4oB4ahizf8C8ci
	 QFffEUg4WcWEItumRHWSkIZEWE0wf+bpUs3cdGHs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8733F80862;
	Sat,  5 Nov 2022 08:04:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1C17F80448; Fri,  4 Nov 2022 20:42:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2BD08F801D5
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 20:42:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BD08F801D5
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 02FAFB82DCA;
 Fri,  4 Nov 2022 19:42:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32A74C433D6;
 Fri,  4 Nov 2022 19:42:11 +0000 (UTC)
Date: Fri, 4 Nov 2022 15:42:09 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [RFC][PATCH v3 00/33] timers: Use timer_shutdown*() before
 freeing timers
Message-ID: <20221104154209.21b26782@rorschach.local.home>
In-Reply-To: <20221104192232.GA2520396@roeck-us.net>
References: <20221104054053.431922658@goodmis.org>
 <20221104192232.GA2520396@roeck-us.net>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 05 Nov 2022 08:03:30 +0100
Cc: alsa-devel@alsa-project.org, linux-staging@lists.linux.dev,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-leds@vger.kernel.org, drbd-dev@lists.linbit.com,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-atm-general@lists.sourceforge.net, linux-afs@lists.infradead.org,
 lvs-devel@vger.kernel.org, linux-acpi@vger.kernel.org, coreteam@netfilter.org,
 intel-wired-lan@lists.osuosl.org, linux-input@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-ext4@vger.kernel.org,
 linux-media@vger.kernel.org, bridge@lists.linux-foundation.org,
 linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org, rcu@vger.kernel.org,
 cgroups@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 Anna-Maria Gleixner <anna-maria@linutronix.de>, linux-edac@vger.kernel.org,
 linux-block@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-parisc@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, netfilter-devel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
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

On Fri, 4 Nov 2022 12:22:32 -0700
Guenter Roeck <linux@roeck-us.net> wrote:

> Unfortunately the renaming caused some symbol conflicts.
> 
> Global definition: timer_shutdown
> 
>   File             Line
> 0 time.c            93 static inline void timer_shutdown(struct clock_event_device *evt)
> 1 arm_arch_timer.c 690 static __always_inline int timer_shutdown(const int access,
> 2 timer-fttmr010.c 105 int (*timer_shutdown)(struct clock_event_device *evt);
> 3 timer-sp804.c    158 static inline void timer_shutdown(struct clock_event_device *evt)
> 4 timer.h          239 static inline int timer_shutdown(struct timer_list *timer)

$ git grep '\btimer_shutdown'
arch/arm/mach-spear/time.c:static inline void timer_shutdown(struct clock_event_device *evt)
arch/arm/mach-spear/time.c:     timer_shutdown(evt);
arch/arm/mach-spear/time.c:     timer_shutdown(evt);
arch/arm/mach-spear/time.c:     timer_shutdown(evt);
drivers/clocksource/arm_arch_timer.c:static __always_inline int timer_shutdown(const int access,
drivers/clocksource/arm_arch_timer.c:   return timer_shutdown(ARCH_TIMER_VIRT_ACCESS, clk);
drivers/clocksource/arm_arch_timer.c:   return timer_shutdown(ARCH_TIMER_PHYS_ACCESS, clk);
drivers/clocksource/arm_arch_timer.c:   return timer_shutdown(ARCH_TIMER_MEM_VIRT_ACCESS, clk);
drivers/clocksource/arm_arch_timer.c:   return timer_shutdown(ARCH_TIMER_MEM_PHYS_ACCESS, clk);
drivers/clocksource/timer-fttmr010.c:   int (*timer_shutdown)(struct clock_event_device *evt);
drivers/clocksource/timer-fttmr010.c:   fttmr010->timer_shutdown(evt);
drivers/clocksource/timer-fttmr010.c:   fttmr010->timer_shutdown(evt);
drivers/clocksource/timer-fttmr010.c:   fttmr010->timer_shutdown(evt);
drivers/clocksource/timer-fttmr010.c:           fttmr010->timer_shutdown = ast2600_timer_shutdown;
drivers/clocksource/timer-fttmr010.c:           fttmr010->timer_shutdown = fttmr010_timer_shutdown;
drivers/clocksource/timer-fttmr010.c:   fttmr010->clkevt.set_state_shutdown = fttmr010->timer_shutdown;
drivers/clocksource/timer-fttmr010.c:   fttmr010->clkevt.tick_resume = fttmr010->timer_shutdown;
drivers/clocksource/timer-sp804.c:static inline void timer_shutdown(struct clock_event_device *evt)
drivers/clocksource/timer-sp804.c:      timer_shutdown(evt);
drivers/clocksource/timer-sp804.c:      timer_shutdown(evt);

Honestly, I think these need to be renamed, as "timer_shutdown()"
should be specific to the timer code, and not individual timers.

I'll start making a patch set that starts by renaming these timers,
then adds the timer_shutdown() API, and finished with the trivial
updates, and that will be a real "PATCH" (non RFC).

Linus, should I also add any patches that has already been acked by the
respective maintainer?

-- Steve
