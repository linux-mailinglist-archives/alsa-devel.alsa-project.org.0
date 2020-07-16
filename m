Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 075C2223532
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 09:10:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0FEA168E;
	Fri, 17 Jul 2020 09:09:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0FEA168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594969813;
	bh=UQQoBsFbpjla3wQ4i0/T69W2hA7YzBSn0i/qXLyvbjU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oOCCelnnVqDi6MDnKXYqFZHG7Vy8EhHHAM1Ayfu6ADlKpDn0hnEtmXE3Anu69+Yhz
	 o8hUTHxcvvv9L2qZtcdjGQQnzcUEMlQmWm1zHc4PH8U0TZdmHEJEdDjam0jvMu0twB
	 p8ymmZd9+V/MhHUZK5oCIAirzCXCHusg7EbHrVLQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44362F802FE;
	Fri, 17 Jul 2020 09:05:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2303F801EC; Thu, 16 Jul 2020 23:24:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 260E5F8014C
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 23:24:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 260E5F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="g8LC2DWS"
Received: by mail-pl1-x643.google.com with SMTP id m16so4427586pls.5
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 14:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=GuRiIW4nk04qSodan0OUo2QjHoiXfRAFsMTlj/9iRXw=;
 b=g8LC2DWSxvHGrs2YfNgqk3VpuTWmyx3EVdSYPeLpfd8l0h3R8fxuksSBwA40ai4ADZ
 kvo6yqRa0fHbA8eJUx9ZhH7+OM1Pi2G/tAj5fqTQQNaJxqtiMUti5yjEE1XiAduQJjm5
 0svDx9VcKd8b8SNp5t3SPolgR9wFDAMRS57OI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GuRiIW4nk04qSodan0OUo2QjHoiXfRAFsMTlj/9iRXw=;
 b=igJoEcLKtW+PSqa8suSMMIGwUHbsjy1q0XYItda3Ajj3z/cX7K/qMzDgvHAK2Q/ysx
 eZMu3VcvDZYqnYzqrRvllJ+o9WXw78CVpChUw9K8TM7KD6iaqMTa/zmeYSvdTdoUZoww
 yq7F6cNXPQWhwFpe8Y8JlczHH6sAYaoyejjPo0gOjdxsegBqdRjqiRgBPcX104swmR/c
 9SPaFQstFA4LE0MBHmjvaRYiwhj1OeJygbbb2d9GeuXHip2TkI18mkWiehR53QEqJDng
 vBMuPvHfJEAzbupc1eNiYV5gVg4Rp8aNRM+hrGBXY5Mo8eyTfBNkwMQu34vtdgQ/JeIO
 7xLQ==
X-Gm-Message-State: AOAM533SEONs8xPZ1KYIDh3AbEOqE7U6OtvNn72hhomM2YrfT93eFMlv
 5nbcELHVzuJKCzKbfUJ7VN1oWA==
X-Google-Smtp-Source: ABdhPJyP3qLO1Y3SOoBLYTFQL4BEKccE2HwZrJKw7OBU3VgLMhd+dox46Tq8jY21pcPLVhtrgaAB+g==
X-Received: by 2002:a17:90a:1089:: with SMTP id
 c9mr6859603pja.180.1594934662399; 
 Thu, 16 Jul 2020 14:24:22 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id r25sm1515610pgv.88.2020.07.16.14.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 14:24:21 -0700 (PDT)
Date: Thu, 16 Jul 2020 14:24:20 -0700
From: Kees Cook <keescook@chromium.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 0/3] Modernize tasklet callback API
Message-ID: <202007161416.9C1B8F3D26@keescook>
References: <20200716030847.1564131-1-keescook@chromium.org>
 <20200716075718.GM10769@hirez.programming.kicks-ass.net>
 <202007161214.102F6E6@keescook>
 <CAKdAkRQHRobiG-RpifyrAmV9ENgENn_woPBVXpRrhKwRBf9Esw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKdAkRQHRobiG-RpifyrAmV9ENgENn_woPBVXpRrhKwRBf9Esw@mail.gmail.com>
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

On Thu, Jul 16, 2020 at 01:48:20PM -0700, Dmitry Torokhov wrote:
> On Thu, Jul 16, 2020 at 12:14 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > On Thu, Jul 16, 2020 at 09:57:18AM +0200, Peter Zijlstra wrote:
> > > On Wed, Jul 15, 2020 at 08:08:44PM -0700, Kees Cook wrote:
> > > > Hi,
> > > >
> > > > This is the infrastructure changes to prepare the tasklet API for
> > > > conversion to passing the tasklet struct as the callback argument instead
> > > > of an arbitrary unsigned long. The first patch details why this is useful
> > > > (it's the same rationale as the timer_struct changes from a bit ago:
> > > > less abuse during memory corruption attacks, more in line with existing
> > > > ways of doing things in the kernel, save a little space in struct,
> > > > etc). Notably, the existing tasklet API use is much less messy, so there
> > > > is less to clean up.
> > >
> > > I would _MUCH_ rather see tasklets go the way of the dodo, esp. given
> > > that:
> > >
> > > >  drivers/input/keyboard/omap-keypad.c   |  2 +-
> > > >  drivers/input/serio/hil_mlc.c          |  2 +-
> > > >  drivers/net/wan/farsync.c              |  4 +--
> > > >  drivers/s390/crypto/ap_bus.c           |  2 +-
> > > >  drivers/staging/most/dim2/dim2.c       |  2 +-
> > > >  drivers/staging/octeon/ethernet-tx.c   |  2 +-
> > > >  drivers/tty/vt/keyboard.c              |  2 +-
> > > >  drivers/usb/gadget/udc/snps_udc_core.c |  6 ++---
> > > >  drivers/usb/host/fhci-sched.c          |  2 +-
> > > >  include/linux/interrupt.h              | 37 ++++++++++++++++++++++----
> > > >  kernel/backtracetest.c                 |  2 +-
> > > >  kernel/debug/debug_core.c              |  2 +-
> > > >  kernel/irq/resend.c                    |  2 +-
> > > >  kernel/softirq.c                       | 18 ++++++++++++-
> > > >  net/atm/pppoatm.c                      |  2 +-
> > > >  net/iucv/iucv.c                        |  2 +-
> > > >  sound/drivers/pcsp/pcsp_lib.c          |  2 +-
> > > >  17 files changed, 66 insertions(+), 25 deletions(-)
> > >
> > > there appear to be hardly any users left.. Can't we stage an extinction
> > > event here instead?
> >
> > Oh, I wish, but no. That's just the ones using DECLARE_TASKLET. There
> > are hundred(s?) more (see the referenced tree).
> 
> Still, do we really need tasklets? Can we substitute timers executing
> immediately in their place?

If there is a direct replacement, then sure, I'd be happy to do
whatever, however it does not look mechanical to me. If there is a
mechanical way that will convert these two directories (as an example of
various complexities):

drivers/crypto/ccp/
drivers/gpu/drm/i915/gt/

then let's get it documented. But if not, let's write up a paragraph for
the deprecated.rst, mark it as deprecated in comments, and modernize the
API (which is a mostly mechanical change) to avoid it being a problem
for CFI, for memory corruption, and heap space, etc.

-- 
Kees Cook
