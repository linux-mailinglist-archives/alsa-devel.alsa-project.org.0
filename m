Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0602227BB
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jul 2020 17:46:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D1A3852;
	Thu, 16 Jul 2020 17:45:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D1A3852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594914361;
	bh=SEbmjwVaSC+xt+ki5I1cJpVTfGx6F/hiisqmMwfQ/xo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bLlWq8FOc/59KYkLo4fmaFT9hXUiUiqNkfhIbBYJJ8nD7MPz8M0SW104DDAFbEUWy
	 DzJl5RicQvbomHrrgOeTjM/oKuFcE3OJXC/vjBvpw4agT4PqbhtqCs0M0LPZuKG+K4
	 PFnNE0qc912KdJ4OOKiFadXygPj4rl6w7Box/zHk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 373DAF802F7;
	Thu, 16 Jul 2020 17:40:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2AEE9F801F2; Thu, 16 Jul 2020 17:38:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA99BF80110
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 17:38:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA99BF80110
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="blVXROz0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=o6oHT2rpgf0cErqSO7RynM1ahrdcZBKx58Lp4xYSPqk=; b=blVXROz0kqPs9WT7AReAWRXnaN
 giDr3C3VPp7qAB5MirGN6Ghar0/xZ6skZ2oTHZrIQnlWV0t6l172otR7fmoceWN/3Omnm1QChvIMq
 v24J9raPRCn37XZp1iaolfjuwtv7Xbf1SjhRG2+phHG2UAzWRhI9WhvuDp7GGNLuphLQb40yeLPn3
 CQvkTsWNMP4QZfiCDKNmVfer2n52y/giQdVBQQgnlCxKQCaxItNDXKZ4xi8RomDl1v2I45h76ddYe
 874YANmm/lqvFG5LUaTOLCBGOMdHl/R06HcEWCdFmgnxvTEFvwNCpVE7mt6U4f8u6oQtVOhd7dG0R
 /sE940zQ==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jw5wW-0004De-Tg; Thu, 16 Jul 2020 15:37:05 +0000
Date: Thu, 16 Jul 2020 16:37:04 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 3/3] tasklet: Introduce new initialization API
Message-ID: <20200716153704.GM12769@casper.infradead.org>
References: <20200716030847.1564131-1-keescook@chromium.org>
 <20200716030847.1564131-4-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200716030847.1564131-4-keescook@chromium.org>
X-Mailman-Approved-At: Thu, 16 Jul 2020 17:40:15 +0200
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

On Wed, Jul 15, 2020 at 08:08:47PM -0700, Kees Cook wrote:
> +#define DECLARE_TASKLET(name, _callback)		\
> +struct tasklet_struct name = {				\
> +	.count = ATOMIC_INIT(0),			\
> +	.callback = _callback,				\
> +	.use_callback = true,				\
> +}
> +
> +#define DECLARE_TASKLET_DISABLED(name, _callback)	\
> +struct tasklet_struct name = {				\
> +	.count = ATOMIC_INIT(1),			\
> +	.callback = _callback,				\
> +}

You forgot to set use_callback here.

> @@ -547,7 +547,10 @@ static void tasklet_action_common(struct softirq_action *a,
>  				if (!test_and_clear_bit(TASKLET_STATE_SCHED,
>  							&t->state))
>  					BUG();
> -				t->func(t->data);
> +				if (t->use_callback)
> +					t->callback(t);
> +				else
> +					t->func(t->data);

I think this is the wrong way to do the conversion.  Start out by setting
t->data to (unsigned long)t in the new initialisers.  Then convert the
drivers (all 350 of them) to the new API.  Then you can get rid of 'data'
from the tasklet_struct.

