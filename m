Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E64242227AF
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jul 2020 17:44:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 936B615F2;
	Thu, 16 Jul 2020 17:43:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 936B615F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594914265;
	bh=rjY6PZnbUEuWmjsknYHCNdPa4D57QToXEVEgJN3qn9s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oh0pvsRjCCJ+ZN3u4m93Z/KEd7hQyJLpJN5/2pBthdCPWYcqU75LzmIuazRk9LAPE
	 WlV3ItulMH9jXDaxi1WYr+lqckQnAaiSAmEgLTYqScyXDjV723UR6c851ykCn3xhHt
	 foofu3eVP3+cXeiXqlO7A8BMXQtLDl3/IftMqJhs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51AF3F802DD;
	Thu, 16 Jul 2020 17:40:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27357F8014E; Thu, 16 Jul 2020 10:15:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49092F8014E
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 10:15:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49092F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de
 header.b="UaFBKEA6"; 
 dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de
 header.b="5Sk5Wz7P"
Date: Thu, 16 Jul 2020 10:15:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1594887345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yn1umK+caUdMmMSNg+DEfBz4G3dj7XgdwXV/exFiYfQ=;
 b=UaFBKEA6NODD9CMCeCn4AwJJl+5Kb+eLxkOEAaardBheygNhikE3rlTYEMw5vaR51/Lawq
 7mrw/y3Z1AkwNQOP9LPdJjqePDdaFl5hWIwglIWh3mfsb2WuyFAVQIcALQM33iIyFKGFOj
 fa03u9uEJlrow8rG5a37UEKVEfdsK0ZmcBpclOT7xWQ9hH31YQZe7VjvBJv9FND71PPU45
 1K1qbauIzUgepakJxCLbRbOaMY0m7eICOmpcgqw4KVnQDM7Lkbns9Ap6g4Jqab08zfGYM1
 yr4OtcJqxtSX1gCSMt8B+famnlapOvVi1qj2ZLSe4MQSiJXSwlds1pkhkro8Jg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1594887345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yn1umK+caUdMmMSNg+DEfBz4G3dj7XgdwXV/exFiYfQ=;
 b=5Sk5Wz7PNQjRQnpYCfpv1U5JHmR5MI/fixBOjSbTfFHFRjXeJYKxTA/HCkWq4XYLVNfwXY
 n6eqRIBMER6pBPCA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 0/3] Modernize tasklet callback API
Message-ID: <20200716081538.2sivhkj4hcyrusem@linutronix.de>
References: <20200716030847.1564131-1-keescook@chromium.org>
 <20200716075718.GM10769@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200716075718.GM10769@hirez.programming.kicks-ass.net>
X-Mailman-Approved-At: Thu, 16 Jul 2020 17:40:15 +0200
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Oscar Carter <oscar.carter@gmx.com>, Mitchell Blank Jr <mitch@sfgoth.com>,
 kernel-hardening@lists.openwall.com, kgdb-bugreport@lists.sourceforge.net,
 alsa-devel@alsa-project.org, Allen Pais <allen.lkml@gmail.com>,
 netdev@vger.kernel.org, Christian Gromm <christian.gromm@microchip.com>,
 Will Deacon <will@kernel.org>, devel@driverdev.osuosl.org,
 Jonathan Corbet <corbet@lwn.net>, Daniel Thompson <daniel.thompson@linaro.org>,
 "David S. Miller" <davem@davemloft.net>,
 Masahiro Yamada <masahiroy@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Julian Wiedmann <jwi@linux.ibm.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Nishka Dasgupta <nishkadg.linux@gmail.com>, Jiri Slaby <jslaby@suse.com>,
 Jakub Kicinski <kuba@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Wambui Karuga <wambui.karugax@gmail.com>, Kees Cook <keescook@chromium.org>,
 Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 linux-input@vger.kernel.org, Ursula Braun <ubraun@linux.ibm.com>,
 Stephen Boyd <swboyd@chromium.org>,
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

On 2020-07-16 09:57:18 [+0200], Peter Zijlstra wrote:
> 
> there appear to be hardly any users left.. Can't we stage an extinction
> event here instead?

Most of the time the tasklet is scheduled from an interrupt handler. So
we could get rid of these tasklets by using threaded IRQs.

Sebastian
