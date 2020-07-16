Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6682223527
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 09:06:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7581B1662;
	Fri, 17 Jul 2020 09:06:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7581B1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594969619;
	bh=c9uRyhRfNKBUBBZyxKtUrxMndDLQydw/cULV5zWzdB0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YJsipkHwnw/jzaTaEUtemODGjNEFw0lEpORmTR2I//vDHHsjrN6PYG5G4HICMXtkl
	 Y9GF1/DcPxdwPJ6FqGlmEP93uSm0RnSZrqJgBwPWiPhgzyrFaXKvWzR+fUnPmZImZf
	 iPeUpsJfKobWdo/gGtD74bvp04zc+8HQe7zPLONI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3258F802C2;
	Fri, 17 Jul 2020 09:05:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E23AF801EC; Thu, 16 Jul 2020 21:16:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11A96F8014E
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 21:15:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11A96F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="ZBulK0WZ"
Received: by mail-pf1-x441.google.com with SMTP id s26so4133819pfm.4
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 12:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2R0hcRnXsJS4VXyiriDanEq/mQczbWkrFO+xv3Ye6s4=;
 b=ZBulK0WZzf/Y2plsJIiBiP9vBDDMB7cKE4nNyO7pI4jhAiFahLl13+wjjYl4AYx5BB
 otJeoT7KMXmj//B0s5TndSWJM7ep3jPNHzKSwrpR80GkT/ENBrVdogHDfc7FSXQgqchK
 la7hTG8ks3MzuTa72KfZtSagY7XpH9MYfx1mQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2R0hcRnXsJS4VXyiriDanEq/mQczbWkrFO+xv3Ye6s4=;
 b=Mo52gFUtd2yUUWZnwUXxbrcn9ocayyW+FEAzUBCnH7rOF/1flzNKtN+fWGa0ee5JXK
 s3Yoa86Sj7B0CFONpEQBeKbFp/Rktx/kDhBUgwIfSVKIlsdOcwD5OoLbtnbKBMLfhbuW
 NtX980F/TLi+31l0sPAgtC3i9AMZ41pmsugGnny5bSziJnsSreyTFGZLmVcPTBkJHyDV
 H7UACg+II3NTQPhAdcw+X6IFVELGPwmjJr6T87ig8WT0nYum5RIaHX3OjtWDs21ROUWe
 OUAlnp+bepQkO1ygmpYNdnU9QdXv5LNSNz1xCvfUzuS3Jb19PX9aIiCOg3FQednmHNRI
 Y3xw==
X-Gm-Message-State: AOAM533Uc1Hf9DdghS8Zz4HYjRU/v07+Si4FVica6LOwIn8HYiTZ6ELf
 6dylEA9H+CwPSsm1ddyO3CZg0A==
X-Google-Smtp-Source: ABdhPJz1hoi+gTw0MHgO0dM+96Dp9MZSCNtNi6/yuZgpSobcItifHoGm+Bd2+MNyMCABANHPmkEEMg==
X-Received: by 2002:a65:664a:: with SMTP id z10mr5423029pgv.352.1594926957331; 
 Thu, 16 Jul 2020 12:15:57 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id h15sm5618413pfo.192.2020.07.16.12.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 12:15:56 -0700 (PDT)
Date: Thu, 16 Jul 2020 12:15:55 -0700
From: Kees Cook <keescook@chromium.org>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 2/3] treewide: Replace DECLARE_TASKLET() with
 DECLARE_TASKLET_OLD()
Message-ID: <202007161215.5C0CE54AB@keescook>
References: <20200716030847.1564131-1-keescook@chromium.org>
 <20200716030847.1564131-3-keescook@chromium.org>
 <20200716112914.GK12769@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200716112914.GK12769@casper.infradead.org>
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

On Thu, Jul 16, 2020 at 12:29:14PM +0100, Matthew Wilcox wrote:
> On Wed, Jul 15, 2020 at 08:08:46PM -0700, Kees Cook wrote:
> > This converts all the existing DECLARE_TASKLET() (and ...DISABLED)
> > macros with DECLARE_TASKLET_OLD() in preparation for refactoring the
> > tasklet callback type. All existing DECLARE_TASKLET() users had a "0"
> > data argument, it has been removed here as well.
> > 
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> [...]
> >  16 files changed, 26 insertions(+), 21 deletions(-)
> 
> This is about 5% of what needs to change.  There are 350 callers of
> tasklet_init(), and that still takes a 'data' argument.

Yup, please see the referenced tree. This "series" is just the
ground-work for allowing the rest of the 350 patches to land with calls
to the new tasklet_setup() API, and associated prototype and
container_of() changes.

-- 
Kees Cook
