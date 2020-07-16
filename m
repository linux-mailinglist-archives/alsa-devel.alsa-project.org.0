Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C00F822352C
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 09:07:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DB2E168B;
	Fri, 17 Jul 2020 09:07:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DB2E168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594969676;
	bh=zh1m2HbHSlb0WcR1WmsKNtk22LWo6BYXXSy8N9YQm3I=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o6OsCmUxymKm5TGXiUeeqxrFKffTdVJcfcwOi15OP3JHzYfu/Sd8l8bJFMzE2EG3e
	 EObAW0TzIGYtnUq39s1oP0ylkQThwQNjAoLCHPeLBB0Sc+7qsLhTZ9t4IMN4zdh/B7
	 5HCve+twcKzZ5QAgIEdmx4BoCuZssH3LUTPsNfnU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54A58F802E0;
	Fri, 17 Jul 2020 09:05:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63AF9F801EC; Thu, 16 Jul 2020 21:24:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5E67F8014E
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 21:24:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5E67F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="MoeXRncz"
Received: by mail-pl1-x642.google.com with SMTP id l6so4286799plt.7
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 12:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=IO5rF0v38hkORnZpPQ2np7PkHTT7l3o2Frf1znSvMCA=;
 b=MoeXRnczoJvOTiX060NRDer3ic+Z0a6OAKDDzvlghJHJsuwLM+IhpBPYCW1h0hZNZh
 Fr5kyGgY0/SatP2EZptwciRkxUEZBeWULPC9tbngCSgNOCvd0NXvOeL8OmnqU6ynZicD
 iZLZdIgB2wXCD8oLjuasdEEdCIEAfOKV/ccMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IO5rF0v38hkORnZpPQ2np7PkHTT7l3o2Frf1znSvMCA=;
 b=ZfZzj4NMPLiC/OOVJE1ni4vqI+DH4QEXi1R4CP3zAglezc04Uwy6wm1LqcA2VN7tIH
 R0a40l9XoBwK7DYkgo60CDZpLDCGivJnL/GbY1UMO++KtiPoapx1+cxnsIlie1AUH9Yp
 NvaqWoRD51zXKyUMIhBPANEXk0YuBdSomhEU4XMvBz5tyjRJoqBlGKm13Oo+CdXWakT2
 X+RGLQXI6BLSSbARPMxNKjpvoWCXXrAp6B5pn4OvYmD+1qCYcrr8ReLPNkdRIKDMBRVp
 gG9H7Ii4u5EhPF81ZxP6/HIb4oKLFFlU05fZjhPnxE7IgYs7m8/rG7jtTZSQdLJBB9V/
 DMrA==
X-Gm-Message-State: AOAM533qAlF47a8wnfg+mcEhbBoq8kIm/Yf99P1n0z/Apz8B6PFF8SrE
 jA67Q7+OvUgYmJWIJQJcxfPXdQ==
X-Google-Smtp-Source: ABdhPJy0sUnqF9h52WMr6418CCHExwqoVmt3MmuGhwouhxSV6Mqarvy7mOWSh3mLcM/3Qo2Kub5J7g==
X-Received: by 2002:a17:90a:d30c:: with SMTP id
 p12mr6742185pju.4.1594927454098; 
 Thu, 16 Jul 2020 12:24:14 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id f29sm5669290pga.59.2020.07.16.12.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 12:24:13 -0700 (PDT)
Date: Thu, 16 Jul 2020 12:24:12 -0700
From: Kees Cook <keescook@chromium.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH 0/3] Modernize tasklet callback API
Message-ID: <202007161223.19FB352B5@keescook>
References: <20200716030847.1564131-1-keescook@chromium.org>
 <20200716075718.GM10769@hirez.programming.kicks-ass.net>
 <20200716081538.2sivhkj4hcyrusem@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200716081538.2sivhkj4hcyrusem@linutronix.de>
X-Mailman-Approved-At: Fri, 17 Jul 2020 09:05:03 +0200
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Oscar Carter <oscar.carter@gmx.com>, Mitchell Blank Jr <mitch@sfgoth.com>,
 kernel-hardening@lists.openwall.com, Peter Zijlstra <peterz@infradead.org>,
 kgdb-bugreport@lists.sourceforge.net, alsa-devel@alsa-project.org,
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

On Thu, Jul 16, 2020 at 10:15:38AM +0200, Sebastian Andrzej Siewior wrote:
> On 2020-07-16 09:57:18 [+0200], Peter Zijlstra wrote:
> > 
> > there appear to be hardly any users left.. Can't we stage an extinction
> > event here instead?
> 
> Most of the time the tasklet is scheduled from an interrupt handler. So
> we could get rid of these tasklets by using threaded IRQs.

Perhaps I can add a comment above the tasklet API area in interrupt.h?

-- 
Kees Cook
