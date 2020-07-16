Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB94A2227AB
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jul 2020 17:43:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 779C6166C;
	Thu, 16 Jul 2020 17:42:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 779C6166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594914221;
	bh=wzlf3Xu0uNuYrbkFi7OAkmyk8e9z4oVwEHbpctSgI/A=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d9hgGA6DNO6t9lRw497WyrnSUOEiUEqxJ0qDEuqrQATw/LeiPEq25MtZSYe9O1p9v
	 gWgoy96xFTAlFmQVTBIUQnjINIPi2URL3DOC/nlO+g1ZBZUSmcgKMReuOuvCFK2PJz
	 If+hF9lXct2d4DgUNRT55R9I/LkUsaAP6l/y5YS0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53F09F802BE;
	Thu, 16 Jul 2020 17:40:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 237FFF801EC; Thu, 16 Jul 2020 09:57:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5D5DF8014E
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 09:57:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5D5DF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="TZzTFaLg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=GFw2paDr6x0B7btxhYa6Jgza9jDSX5w0Syg6HAfqvAU=; b=TZzTFaLgoCrDFyD2Ef7BIGlBta
 PcBSBGGB+L1ZGg/6TvwqEVkDwtJvPMwytSYQGDp70iFs3HYFtUzixiCUJBCw87DTMJBfIXHnvvfnd
 6ameDw70kTnMCMShOJMLxtGhSyz6kY4hrpUUBjp0ui+1HVAj0Hay4YgN/lD2M/s7p7WsPZX2sJgpx
 m0smx2K4jAlv5k8raCR6nfmWAqaiI+XQ35t9LL9ZDp7G/Bd6Xv6xN/1+oU2M1YPrCDGAKZNt5KRft
 m+Xhvn6+OLAoQcGmFJfkRhrkSCPQ3enbR99hEbretKEtzPoWiv9AHO8kAFyBzSXUqnNW18hpG0dgz
 Y6UHjSQA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvylm-0001J0-AL; Thu, 16 Jul 2020 07:57:30 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E92D2300446;
 Thu, 16 Jul 2020 09:57:18 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id AF62B23D64B97; Thu, 16 Jul 2020 09:57:18 +0200 (CEST)
Date: Thu, 16 Jul 2020 09:57:18 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 0/3] Modernize tasklet callback API
Message-ID: <20200716075718.GM10769@hirez.programming.kicks-ass.net>
References: <20200716030847.1564131-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200716030847.1564131-1-keescook@chromium.org>
X-Mailman-Approved-At: Thu, 16 Jul 2020 17:40:13 +0200
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

On Wed, Jul 15, 2020 at 08:08:44PM -0700, Kees Cook wrote:
> Hi,
> 
> This is the infrastructure changes to prepare the tasklet API for
> conversion to passing the tasklet struct as the callback argument instead
> of an arbitrary unsigned long. The first patch details why this is useful
> (it's the same rationale as the timer_struct changes from a bit ago:
> less abuse during memory corruption attacks, more in line with existing
> ways of doing things in the kernel, save a little space in struct,
> etc). Notably, the existing tasklet API use is much less messy, so there
> is less to clean up.

I would _MUCH_ rather see tasklets go the way of the dodo, esp. given
that:

>  drivers/input/keyboard/omap-keypad.c   |  2 +-
>  drivers/input/serio/hil_mlc.c          |  2 +-
>  drivers/net/wan/farsync.c              |  4 +--
>  drivers/s390/crypto/ap_bus.c           |  2 +-
>  drivers/staging/most/dim2/dim2.c       |  2 +-
>  drivers/staging/octeon/ethernet-tx.c   |  2 +-
>  drivers/tty/vt/keyboard.c              |  2 +-
>  drivers/usb/gadget/udc/snps_udc_core.c |  6 ++---
>  drivers/usb/host/fhci-sched.c          |  2 +-
>  include/linux/interrupt.h              | 37 ++++++++++++++++++++++----
>  kernel/backtracetest.c                 |  2 +-
>  kernel/debug/debug_core.c              |  2 +-
>  kernel/irq/resend.c                    |  2 +-
>  kernel/softirq.c                       | 18 ++++++++++++-
>  net/atm/pppoatm.c                      |  2 +-
>  net/iucv/iucv.c                        |  2 +-
>  sound/drivers/pcsp/pcsp_lib.c          |  2 +-
>  17 files changed, 66 insertions(+), 25 deletions(-)

there appear to be hardly any users left.. Can't we stage an extinction
event here instead?
