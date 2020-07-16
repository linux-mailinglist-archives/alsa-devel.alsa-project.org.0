Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7ADA2227A9
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jul 2020 17:43:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BC1441;
	Thu, 16 Jul 2020 17:42:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BC1441
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594914185;
	bh=CTWyxPTHWyxqgMnm+vWIXeBCmqZkbSrc0AEZhda/f10=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HOKOXw4Bv4BBE7IRJtrW5iK3GnONrZfUdG8VpLVrSJIDkLjiV1/O4eV6yN6b8OJ+e
	 +4XvzIuUA1Gr5wNh3ZOzqsmMwwCbsu/ivccA92bwVuVcB4+2HKa3RvdwC5Wu9Z9pBd
	 a4WSL01efNq6vKtfELP9kRatVJBaw8CUcbhy2jto=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32260F80110;
	Thu, 16 Jul 2020 17:40:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E664FF801EC; Thu, 16 Jul 2020 09:31:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2852F8014E
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 09:30:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2852F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="xXkGscLL"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C5BC1206C1;
 Thu, 16 Jul 2020 07:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594884658;
 bh=CTWyxPTHWyxqgMnm+vWIXeBCmqZkbSrc0AEZhda/f10=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xXkGscLLek9N9EogKr6n85j7W6mDu9jr4loE95Kn/BePJVkVdXfeQmIC64S/1jTBK
 opn+bStcloxvD+/LOq6UBHLCu5pkeVSMcrvbGymLF6xbmCWu9p6nX8eDaey4wUAQCY
 h8K057x1JyJ9ns50hganKtjoBLO8cmbEyUwND05U=
Date: Thu, 16 Jul 2020 09:30:52 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 2/3] treewide: Replace DECLARE_TASKLET() with
 DECLARE_TASKLET_OLD()
Message-ID: <20200716073052.GC971895@kroah.com>
References: <20200716030847.1564131-1-keescook@chromium.org>
 <20200716030847.1564131-3-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200716030847.1564131-3-keescook@chromium.org>
X-Mailman-Approved-At: Thu, 16 Jul 2020 17:40:14 +0200
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Douglas Anderson <dianders@chromium.org>, Oscar Carter <oscar.carter@gmx.com>,
 Mitchell Blank Jr <mitch@sfgoth.com>, kernel-hardening@lists.openwall.com,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Christian Gromm <christian.gromm@microchip.com>,
 Kevin Curtis <kevin.curtis@farsite.co.uk>, Will Deacon <will@kernel.org>,
 devel@driverdev.osuosl.org, linux-s390@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Masahiro Yamada <masahiroy@kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Julian Wiedmann <jwi@linux.ibm.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Nishka Dasgupta <nishkadg.linux@gmail.com>, Jiri Slaby <jslaby@suse.com>,
 Jakub Kicinski <kuba@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Wambui Karuga <wambui.karugax@gmail.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, linux-input@vger.kernel.org,
 Ursula Braun <ubraun@linux.ibm.com>, Stephen Boyd <swboyd@chromium.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Felipe Balbi <balbi@kernel.org>,
 Kyungtae Kim <kt0755@gmail.com>, netdev@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Allen Pais <allen.lkml@gmail.com>,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 Karsten Graul <kgraul@linux.ibm.com>, Romain Perier <romain.perier@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
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

On Wed, Jul 15, 2020 at 08:08:46PM -0700, Kees Cook wrote:
> This converts all the existing DECLARE_TASKLET() (and ...DISABLED)
> macros with DECLARE_TASKLET_OLD() in preparation for refactoring the
> tasklet callback type. All existing DECLARE_TASKLET() users had a "0"
> data argument, it has been removed here as well.
> 
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  drivers/input/keyboard/omap-keypad.c   |  2 +-
>  drivers/input/serio/hil_mlc.c          |  2 +-
>  drivers/net/wan/farsync.c              |  4 ++--
>  drivers/s390/crypto/ap_bus.c           |  2 +-
>  drivers/staging/most/dim2/dim2.c       |  2 +-
>  drivers/staging/octeon/ethernet-tx.c   |  2 +-
>  drivers/tty/vt/keyboard.c              |  2 +-
>  drivers/usb/gadget/udc/snps_udc_core.c |  2 +-
>  drivers/usb/host/fhci-sched.c          |  2 +-
>  include/linux/interrupt.h              | 15 ++++++++++-----
>  kernel/backtracetest.c                 |  2 +-
>  kernel/debug/debug_core.c              |  2 +-
>  kernel/irq/resend.c                    |  2 +-
>  net/atm/pppoatm.c                      |  2 +-
>  net/iucv/iucv.c                        |  2 +-
>  sound/drivers/pcsp/pcsp_lib.c          |  2 +-
>  16 files changed, 26 insertions(+), 21 deletions(-)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
