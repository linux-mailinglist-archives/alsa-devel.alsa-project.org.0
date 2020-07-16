Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 586A7223525
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 09:06:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DE311677;
	Fri, 17 Jul 2020 09:05:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DE311677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594969576;
	bh=NZocQeeIJf8p5bZCkEFoQYkhY8UFGtycxTaLVrc6cwA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ExS+MR8aSfGzhco2rhNbubPPGdMQjvKAsqv2XpQ2mm73A+c4O05NuQVl8ebcXaFnt
	 ipECxEVtWSNO6ae3iSXPu37vT9kfouTN6YHmlt3iWN0DJEqvpf97DioaoQwh0H9obA
	 U3GctqOeuaZJMD3I9sX4g8UPpiLKZO1kEcUtYeSk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1BBDF8014E;
	Fri, 17 Jul 2020 09:05:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2320F801EC; Thu, 16 Jul 2020 21:15:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5632F8014C
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 21:14:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5632F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="GFAY7/qF"
Received: by mail-pl1-x644.google.com with SMTP id t6so4281989plo.3
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 12:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DmwAjlYrRkrceLF5k8BiY0q5EpRy1ms1f0jDcB2PX04=;
 b=GFAY7/qFyIYdH5WwlOR6lmpQdUB8pidv4p+YEiNNV+24D6QE2wlS74FWkZdBInZexv
 UOIim5XchmtCaZ3l4TQzzuOzonn1fB1BUMbSjBEdmwtfVzMcmZFxfBS2TADWV5S1ZbJV
 +LUOh6KntXrSBKz4ZwAcXC+80++YNoPqG5L4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DmwAjlYrRkrceLF5k8BiY0q5EpRy1ms1f0jDcB2PX04=;
 b=l4Xozf1LKF9abrWWUKiuaDzbiFkFXd0JEPpwYeUXp9kF0Yu81fINjCNkhXH8le/W16
 2J8kzx+uR8YPXvr+ocjCklq21ilEcdWqbfpWpyPU95Niit2qpLMmA7AhpKW97CdGDEJF
 CGIawp+4JFlP4p/37A/CRY08bm6ePgVa5TBklJ10PEKpwTtF6biwP1FiM9nGVsl6cJ4m
 Z1Z5Sdi70OHaQUS68a7PWekdcNPLkMpix2L0R8yc4Vn4OJ/0Slh+uXTsy3btvyQ4lmbp
 fP5GVeDOhQi5YQCZ4plEDZI5mvLbZrXtyZAdqt01a3Z9PmnI36tVJo1zd8Zm9Yz6R1Ev
 13LA==
X-Gm-Message-State: AOAM532PSozKvTPP6UTiou/jWiEggw8qG/Nf3SitLcOS6UC8Rfhjzbeh
 nnFhX30sj6KlMUb9IWL6mTyvjg==
X-Google-Smtp-Source: ABdhPJzXMzbyTY5VJHPd4Edm3bSGjXJUJOwIzo3RSPKyMSZOc846WSYGarDg6OCvj6pUTCBmbdFM0Q==
X-Received: by 2002:a17:90a:318c:: with SMTP id
 j12mr6129543pjb.25.1594926888230; 
 Thu, 16 Jul 2020 12:14:48 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id s194sm5671642pgs.24.2020.07.16.12.14.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 12:14:47 -0700 (PDT)
Date: Thu, 16 Jul 2020 12:14:46 -0700
From: Kees Cook <keescook@chromium.org>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 0/3] Modernize tasklet callback API
Message-ID: <202007161214.102F6E6@keescook>
References: <20200716030847.1564131-1-keescook@chromium.org>
 <20200716075718.GM10769@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200716075718.GM10769@hirez.programming.kicks-ass.net>
X-Mailman-Approved-At: Fri, 17 Jul 2020 09:05:03 +0200
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Oscar Carter <oscar.carter@gmx.com>, Mitchell Blank Jr <mitch@sfgoth.com>,
 kernel-hardening@lists.openwall.com, kgdb-bugreport@lists.sourceforge.net,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, alsa-devel@alsa-project.org,
 Allen Pais <allen.lkml@gmail.com>, netdev@vger.kernel.org,
 Christian Gromm <christian.gromm@microchip.com>, Will Deacon <will@kernel.org>,
 devel@driverdev.osuosl.org, Jonathan Corbet <corbet@lwn.net>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 "David S. Miller" <davem@davemloft.net>,
 Masahiro Yamada <masahiroy@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Julian Wiedmann <jwi@linux.ibm.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Nishka Dasgupta <nishkadg.linux@gmail.com>, Jiri Slaby <jslaby@suse.com>,
 Jakub Kicinski <kuba@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Wambui Karuga <wambui.karugax@gmail.com>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org,
 Heiko Carstens <hca@linux.ibm.com>, linux-input@vger.kernel.org,
 Ursula Braun <ubraun@linux.ibm.com>, Stephen Boyd <swboyd@chromium.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Felipe Balbi <balbi@kernel.org>,
 Kyungtae Kim <kt0755@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Kevin Curtis <kevin.curtis@farsite.co.uk>, linux-usb@vger.kernel.org,
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

On Thu, Jul 16, 2020 at 09:57:18AM +0200, Peter Zijlstra wrote:
> On Wed, Jul 15, 2020 at 08:08:44PM -0700, Kees Cook wrote:
> > Hi,
> > 
> > This is the infrastructure changes to prepare the tasklet API for
> > conversion to passing the tasklet struct as the callback argument instead
> > of an arbitrary unsigned long. The first patch details why this is useful
> > (it's the same rationale as the timer_struct changes from a bit ago:
> > less abuse during memory corruption attacks, more in line with existing
> > ways of doing things in the kernel, save a little space in struct,
> > etc). Notably, the existing tasklet API use is much less messy, so there
> > is less to clean up.
> 
> I would _MUCH_ rather see tasklets go the way of the dodo, esp. given
> that:
> 
> >  drivers/input/keyboard/omap-keypad.c   |  2 +-
> >  drivers/input/serio/hil_mlc.c          |  2 +-
> >  drivers/net/wan/farsync.c              |  4 +--
> >  drivers/s390/crypto/ap_bus.c           |  2 +-
> >  drivers/staging/most/dim2/dim2.c       |  2 +-
> >  drivers/staging/octeon/ethernet-tx.c   |  2 +-
> >  drivers/tty/vt/keyboard.c              |  2 +-
> >  drivers/usb/gadget/udc/snps_udc_core.c |  6 ++---
> >  drivers/usb/host/fhci-sched.c          |  2 +-
> >  include/linux/interrupt.h              | 37 ++++++++++++++++++++++----
> >  kernel/backtracetest.c                 |  2 +-
> >  kernel/debug/debug_core.c              |  2 +-
> >  kernel/irq/resend.c                    |  2 +-
> >  kernel/softirq.c                       | 18 ++++++++++++-
> >  net/atm/pppoatm.c                      |  2 +-
> >  net/iucv/iucv.c                        |  2 +-
> >  sound/drivers/pcsp/pcsp_lib.c          |  2 +-
> >  17 files changed, 66 insertions(+), 25 deletions(-)
> 
> there appear to be hardly any users left.. Can't we stage an extinction
> event here instead?

Oh, I wish, but no. That's just the ones using DECLARE_TASKLET. There
are hundred(s?) more (see the referenced tree).

-- 
Kees Cook
