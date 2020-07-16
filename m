Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5E1223530
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 09:09:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D190D15F2;
	Fri, 17 Jul 2020 09:08:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D190D15F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594969742;
	bh=pymZLuOefemxl8KcFGDGIO6cl1bzZLDA4cIOLkJbjbE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vfsaLjNpdCU1QMp0OAnqjg0hgVFCvs/B2h/8YrqgcYU2WY7TDhLSs3OoNJz3XCwRd
	 JhrvW3auGhtHOONZP2mote3hfiPNXZz7ew1Ovlc5UXiEOZ98wSnrRIQBd/7WOEygl/
	 cq7ikn/b0D9G3wPrWMphnXi2SnsCrSovPUcslZOY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52517F802E7;
	Fri, 17 Jul 2020 09:05:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 999F6F801EC; Thu, 16 Jul 2020 22:48:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADDCEF8014E
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 22:48:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADDCEF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="CLn8nEZ9"
Received: by mail-io1-xd42.google.com with SMTP id y2so7518246ioy.3
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 13:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E+1tVGknt5yYZ8eT3cfGaVP/Gx6TNLloqdwWVn2c4ZM=;
 b=CLn8nEZ9Umx3u1uxQ6iB8vnvAwGkRUs5ZG9EfQL8CJiHvyLP8M7b6NUIAKo+LBuY4f
 8/9k4vjIky1k6ccVtwc1XCLpJ9OIXcaSnSgOd0xYtfqQA5VkwUEJhpc/XojQNud255Fp
 CS65GQl3KtSyU2zn3gjZRqpQReiLPt5Jdwt/SCKKel4uYCiyIFetSEXJKpr/nhCoi0IP
 Fh7/R7sRei2OUkuvv/y1qWAnzOrzRAxFmPwXU3sJhnRHuwo9BC1LeRHApdtIROKUBM0Y
 PuMZgqnjotBdORPgdDy9QbhiTqpBvHJsERxZbAO44L6pd99V8/cw6eA29lB/55EAquIA
 5X2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E+1tVGknt5yYZ8eT3cfGaVP/Gx6TNLloqdwWVn2c4ZM=;
 b=Hl4JSuU6nx12xAPza5+h9eNG+JJ/GtH1HbOAOztDK3h9QhDlhsJMr3LrplnziD0yRn
 8XRAJECvUf4F/wf4OXe++ymdhUujCRfTFDlenQ/D8pu+Q5XhIS5PbZRZZJjDuf2HbOg8
 xdzevgGcWPIa+pqCSDjPw2/Eg1PHb/JlNgMbu+4IBtPaIOyM3u8xzQKY78nzcsY8/29c
 5HD1wMeda+14goiXnX09Gd0GJvloqOWchYew9661EDeYGO+8r2XR32jjGku9OjvzIbvV
 gcaB6IeFGrsQoR2WKH5Q7+Q1WwpMcDNj4/Yk0W4aP3A/ntVZHQ0Z0lXiGQOisTpNvPlN
 R2OA==
X-Gm-Message-State: AOAM531WA+eO0h5F3J4k21IaGem4DVQpa7gUW3UplXWREsTm1Gq7xVLJ
 uUqctF1vfLyrg/S1OW1dUyZOmEsAZv01BxjKqfA=
X-Google-Smtp-Source: ABdhPJzpsbm7TwGhHG6RzXDqgC6/209E5TMuTQBViDF3W3srNDclU8jiNSeIW3HzQAj2kQTZKYQslP0k+o4Ij2ZF6uA=
X-Received: by 2002:a5d:9c0e:: with SMTP id 14mr6302830ioe.109.1594932511887; 
 Thu, 16 Jul 2020 13:48:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200716030847.1564131-1-keescook@chromium.org>
 <20200716075718.GM10769@hirez.programming.kicks-ass.net>
 <202007161214.102F6E6@keescook>
In-Reply-To: <202007161214.102F6E6@keescook>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 16 Jul 2020 13:48:20 -0700
Message-ID: <CAKdAkRQHRobiG-RpifyrAmV9ENgENn_woPBVXpRrhKwRBf9Esw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Modernize tasklet callback API
To: Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 17 Jul 2020 09:05:03 +0200
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Oscar Carter <oscar.carter@gmx.com>, Mitchell Blank Jr <mitch@sfgoth.com>,
 kernel-hardening@lists.openwall.com, Peter Zijlstra <peterz@infradead.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Allen Pais <allen.lkml@gmail.com>, netdev <netdev@vger.kernel.org>,
 Christian Gromm <christian.gromm@microchip.com>, Will Deacon <will@kernel.org>,
 devel@driverdev.osuosl.org, linux-s390@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 "David S. Miller" <davem@davemloft.net>,
 Masahiro Yamada <masahiroy@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Julian Wiedmann <jwi@linux.ibm.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Nishka Dasgupta <nishkadg.linux@gmail.com>, Jiri Slaby <jslaby@suse.com>,
 Jakub Kicinski <kuba@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Wambui Karuga <wambui.karugax@gmail.com>, Vasily Gorbik <gor@linux.ibm.com>,
 lkml <linux-kernel@vger.kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 Ursula Braun <ubraun@linux.ibm.com>, Stephen Boyd <swboyd@chromium.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Felipe Balbi <balbi@kernel.org>,
 Kyungtae Kim <kt0755@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Douglas Anderson <dianders@chromium.org>,
 Kevin Curtis <kevin.curtis@farsite.co.uk>,
 USB list <linux-usb@vger.kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Romain Perier <romain.perier@gmail.com>, Karsten Graul <kgraul@linux.ibm.com>
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

On Thu, Jul 16, 2020 at 12:14 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Thu, Jul 16, 2020 at 09:57:18AM +0200, Peter Zijlstra wrote:
> > On Wed, Jul 15, 2020 at 08:08:44PM -0700, Kees Cook wrote:
> > > Hi,
> > >
> > > This is the infrastructure changes to prepare the tasklet API for
> > > conversion to passing the tasklet struct as the callback argument instead
> > > of an arbitrary unsigned long. The first patch details why this is useful
> > > (it's the same rationale as the timer_struct changes from a bit ago:
> > > less abuse during memory corruption attacks, more in line with existing
> > > ways of doing things in the kernel, save a little space in struct,
> > > etc). Notably, the existing tasklet API use is much less messy, so there
> > > is less to clean up.
> >
> > I would _MUCH_ rather see tasklets go the way of the dodo, esp. given
> > that:
> >
> > >  drivers/input/keyboard/omap-keypad.c   |  2 +-
> > >  drivers/input/serio/hil_mlc.c          |  2 +-
> > >  drivers/net/wan/farsync.c              |  4 +--
> > >  drivers/s390/crypto/ap_bus.c           |  2 +-
> > >  drivers/staging/most/dim2/dim2.c       |  2 +-
> > >  drivers/staging/octeon/ethernet-tx.c   |  2 +-
> > >  drivers/tty/vt/keyboard.c              |  2 +-
> > >  drivers/usb/gadget/udc/snps_udc_core.c |  6 ++---
> > >  drivers/usb/host/fhci-sched.c          |  2 +-
> > >  include/linux/interrupt.h              | 37 ++++++++++++++++++++++----
> > >  kernel/backtracetest.c                 |  2 +-
> > >  kernel/debug/debug_core.c              |  2 +-
> > >  kernel/irq/resend.c                    |  2 +-
> > >  kernel/softirq.c                       | 18 ++++++++++++-
> > >  net/atm/pppoatm.c                      |  2 +-
> > >  net/iucv/iucv.c                        |  2 +-
> > >  sound/drivers/pcsp/pcsp_lib.c          |  2 +-
> > >  17 files changed, 66 insertions(+), 25 deletions(-)
> >
> > there appear to be hardly any users left.. Can't we stage an extinction
> > event here instead?
>
> Oh, I wish, but no. That's just the ones using DECLARE_TASKLET. There
> are hundred(s?) more (see the referenced tree).

Still, do we really need tasklets? Can we substitute timers executing
immediately in their place?

Thanks.

-- 
Dmitry
