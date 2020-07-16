Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E99922352B
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 09:07:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 068E61674;
	Fri, 17 Jul 2020 09:06:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 068E61674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594969642;
	bh=VearAje4Qfs2XzZOx+4/lmvcvIYPIU4qhv+R/RZrFZA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E18mkvGhhgEqJ8PIWGqmRnoIXBWMi1Bt85RXz1Og6zbcwmVEys06S7XlDhn6mn7+e
	 qMdCXG6CvBWa81bDjA8fw8/+FYz6fSYsO4gjV/HozkgbDLNfF/VizHdaCveF+0B7g2
	 pscufc9ACory9N7OqS0Kz250mlvncl4istDCMOc8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13C2DF802DB;
	Fri, 17 Jul 2020 09:05:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98A0CF801EC; Thu, 16 Jul 2020 21:22:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_29,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EAC3BF8014E
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 21:22:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAC3BF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="IdV9MqF3"
Received: by mail-pl1-x644.google.com with SMTP id q17so4280297pls.9
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 12:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JkQIL6u1DfVeBakkxVv5TexNPiL0IlLMXUBOxPWyZ5M=;
 b=IdV9MqF3NgA5zvwc0WHh4MUmPJhoVdGBqF7mZzHR1z6W9+79kwebX37Odvx1RFYyD5
 TIcAItmVFebIbr0UGDR1VqZORhkkWg5GO3jP9SrAYBb/J9j1gAl6NCCYq5DxGfdZceJ5
 eJbQvOJJgIUB/uLUSvyqfC/7mWDvVcN1kqTj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JkQIL6u1DfVeBakkxVv5TexNPiL0IlLMXUBOxPWyZ5M=;
 b=EJDFJk0NTaO8E2kdsHQFWzLsVxf50Sdlk0LIJPVj5QNMKk/bydv9wfCYPWhsNQXl5N
 hnURSSpdUW8ak6HDpsFI0bOmzjj8RHBiJgnYrM884+CGune+XCPLp72gwOaYKxo10JA/
 fWfkQ/qtakOdXCcvqPzc2XtRAaKd9vNnJCO3Fg6iX7lIczVsaF3+vX8kwhE5hu8sfPi5
 Akfghs5Bbc1HyDv0RiU1PFgdgypoBGU8BvnLHGpxee8BL7PHj7p1O+oDTb+5sA+pojwc
 Um3lanhZ2rf7Amf4Y8RDR1fWCj7Ap7ZOslCZW8oNEWTvtYc7nTK3oxSjdoxOX/b2unx/
 f0qQ==
X-Gm-Message-State: AOAM53068e3tRq45JiDVEnxJwHsXy+FcOk5Tw0RWJ7OQFbNrVUjshcie
 F0vuA+d70ktgLbNaV3lsNTraAg==
X-Google-Smtp-Source: ABdhPJxnO0DLJTMuJCiKhGS2H/q0Dgh7D9XNeLpL7v+ETZT1fO0LQZze/EzzJLe1PvzD9lREJpkfEA==
X-Received: by 2002:a17:90a:1901:: with SMTP id
 1mr6710009pjg.199.1594927339413; 
 Thu, 16 Jul 2020 12:22:19 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id q24sm5641236pfg.95.2020.07.16.12.22.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 12:22:18 -0700 (PDT)
Date: Thu, 16 Jul 2020 12:22:17 -0700
From: Kees Cook <keescook@chromium.org>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 3/3] tasklet: Introduce new initialization API
Message-ID: <202007161216.9C9784FEBE@keescook>
References: <20200716030847.1564131-1-keescook@chromium.org>
 <20200716030847.1564131-4-keescook@chromium.org>
 <20200716153704.GM12769@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200716153704.GM12769@casper.infradead.org>
X-Mailman-Approved-At: Fri, 17 Jul 2020 09:05:03 +0200
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Oscar Carter <oscar.carter@gmx.com>, Mitchell Blank Jr <mitch@sfgoth.com>,
 kernel-hardening@lists.openwall.com, Peter Zijlstra <peterz@infradead.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, alsa-devel@alsa-project.org,
 Allen Pais <allen.lkml@gmail.com>, netdev@vger.kernel.org,
 Christian Gromm <christian.gromm@microchip.com>, Will Deacon <will@kernel.org>,
 devel@driverdev.osuosl.org, Jonathan Corbet <corbet@lwn.net>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 "David S. Miller" <davem@davemloft.net>,
 Masahiro Yamada <masahiroy@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Julian Wiedmann <jwi@linux.ibm.com>,
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

On Thu, Jul 16, 2020 at 04:37:04PM +0100, Matthew Wilcox wrote:
> On Wed, Jul 15, 2020 at 08:08:47PM -0700, Kees Cook wrote:
> > +#define DECLARE_TASKLET(name, _callback)		\
> > +struct tasklet_struct name = {				\
> > +	.count = ATOMIC_INIT(0),			\
> > +	.callback = _callback,				\
> > +	.use_callback = true,				\
> > +}
> > +
> > +#define DECLARE_TASKLET_DISABLED(name, _callback)	\
> > +struct tasklet_struct name = {				\
> > +	.count = ATOMIC_INIT(1),			\
> > +	.callback = _callback,				\
> > +}
> 
> You forgot to set use_callback here.

Eek; thank you.

> > @@ -547,7 +547,10 @@ static void tasklet_action_common(struct softirq_action *a,
> >  				if (!test_and_clear_bit(TASKLET_STATE_SCHED,
> >  							&t->state))
> >  					BUG();
> > -				t->func(t->data);
> > +				if (t->use_callback)
> > +					t->callback(t);
> > +				else
> > +					t->func(t->data);
> 
> I think this is the wrong way to do the conversion.  Start out by setting
> t->data to (unsigned long)t in the new initialisers.  Then convert the
> drivers (all 350 of them) to the new API.  Then you can get rid of 'data'
> from the tasklet_struct.

That's what I did when I converted timer_struct, and it ended up creating
a mess for Control Flow Integrity checking. (The problem isn't actually
casting .data, but rather in how the callsite calls the callback --
casting the callback assignments doesn't fix the mismatch between the
caller and the callback's expectation about the function prototype
under CFI.) I got lucky with timer_struct (in v4.14) in that not much
had been converted, and I was able to do the entire conversion in the
next kernel release.

So, this time, I'm trying to avoid the prototype mismatch mess by
providing a selector to determine which prototype the callback should
be called through, and I was happy to discover I could do it without
growing the tasklet structure. Obviously the memory corruption safety
improvement won't be realized until both .data, .use_callback, and .func
are removed, but that was true even with the earlier style of conversion.

-- 
Kees Cook
