Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E4A2227A8
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jul 2020 17:42:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E0661669;
	Thu, 16 Jul 2020 17:41:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E0661669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594914166;
	bh=mn6iTBJseqW6x95DXLzjCrLI7Ry2VVFhniqqXYPIzaE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=guSq+FjcVPLkeZmkG42pzWWpY0kGxuSbbw1N8zJ1jUvb8itPEJ1nV0NsKneU268dF
	 Uxr4L2WFW1jVp78lDZrTYxRbSjPuI1AfJHd2LHdCinLo8HONAEWjOVxVE5Jl1Qmcvg
	 jjcIGp3GCOFKzRut0xFdzMobUdIvlZIX/J1/jXfI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0172CF8020C;
	Thu, 16 Jul 2020 17:40:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C453F801EC; Thu, 16 Jul 2020 09:30:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A99BDF8014C
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 09:30:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A99BDF8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Phc6jm75"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D622D206C1;
 Thu, 16 Jul 2020 07:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594884616;
 bh=mn6iTBJseqW6x95DXLzjCrLI7Ry2VVFhniqqXYPIzaE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Phc6jm75BYs2701ce9G8bX4UnXRMO9gP//NOxj7gAtA+SR+gVk+ehe0idhpetsJbC
 6qT1RZjEEosqxo95k/Yl4CU/mLc7bykaJGRcZSAU6YGhwz/a2yRCZIMAj+095bxmQv
 6PeXnkbT8e99OL/8Dd8AnTc+6KMVnZ5RGOVEV95A=
Date: Thu, 16 Jul 2020 09:30:10 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 3/3] tasklet: Introduce new initialization API
Message-ID: <20200716073010.GB971895@kroah.com>
References: <20200716030847.1564131-1-keescook@chromium.org>
 <20200716030847.1564131-4-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200716030847.1564131-4-keescook@chromium.org>
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

On Wed, Jul 15, 2020 at 08:08:47PM -0700, Kees Cook wrote:
> From: Romain Perier <romain.perier@gmail.com>
> 
> Nowadays, modern kernel subsystems that use callbacks pass the data
> structure associated with a given callback as argument to the callback.
> The tasklet subsystem remains one which passes an arbitrary unsigned
> long to the callback function. This has several problems:
> 
> - This keeps an extra field for storing the argument in each tasklet
>   data structure, it bloats the tasklet_struct structure with a redundant
>   .data field
> 
> - No type checking can be performed on this argument. Instead of
>   using container_of() like other callback subsystems, it forces callbacks
>   to do explicit type cast of the unsigned long argument into the required
>   object type.
> 
> - Buffer overflows can overwrite the .func and the .data field, so
>   an attacker can easily overwrite the function and its first argument
>   to whatever it wants.
> 
> Add a new tasklet initialization API, via DECLARE_TASKLET() and
> tasklet_setup(), which will replace the existing ones.
> 
> This work is greatly inspired by the timer_struct conversion series,
> see commit e99e88a9d2b0 ("treewide: setup_timer() -> timer_setup()")
> 
> To avoid problems with both -Wcast-function-type (which is enabled in
> the kernel via -Wextra is several subsystems), and with mismatched
> function prototypes when build with Control Flow Integrity enabled,
> this adds the "use_callback" member to let the tasklet caller choose
> which union member to call through. Once all old API uses are removed,
> this and the .data member will be removed as well. (On 64-bit this does
> not grow the struct size as the new member fills the hole after atomic_t,
> which is also "int" sized.)
> 
> Signed-off-by: Romain Perier <romain.perier@gmail.com>
> Co-developed-by: Allen Pais <allen.lkml@gmail.com>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> Co-developed-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  include/linux/interrupt.h | 24 +++++++++++++++++++++++-
>  kernel/softirq.c          | 18 +++++++++++++++++-
>  2 files changed, 40 insertions(+), 2 deletions(-)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
