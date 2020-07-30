Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F5423383D
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jul 2020 20:16:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3105A169C;
	Thu, 30 Jul 2020 20:15:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3105A169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596132963;
	bh=4SL9Mmk+GHNbrm/FfS6j6RlA9DMmMlZkUCOkM+XtH0c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pVixjC+ooJpIJ2FWO6J0EVMxNCVq/71l0//Bls5JdhQyiHJW9S9j2KF5j3E/D1QPX
	 2tIUit8uNmTJPjCk/mrp9Icsa6sn1QVHgw4gA+KauE5Obu1zDGAAZiCWSGPcLQLF0o
	 WyNl6UCVJ9c5LixvBLM8EW/O2T+x6WvRveXnlp/o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4216F80240;
	Thu, 30 Jul 2020 20:15:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E237CF80240; Thu, 30 Jul 2020 20:15:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5D02F80111
 for <alsa-devel@alsa-project.org>; Thu, 30 Jul 2020 20:14:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5D02F80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Rd+sngN9"
Received: by mail-pl1-x642.google.com with SMTP id d1so14891029plr.8
 for <alsa-devel@alsa-project.org>; Thu, 30 Jul 2020 11:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=R3XH19x0j9mpAwBbmALhrl+K1g6ws6AmAQc8yDsKxwc=;
 b=Rd+sngN9fVYhzl82nqy0DTTR682+o7qxhCC/+ghYliHvyO1hzJDTm0Q4K9N2e2sjvd
 N6jmVrVP1K+zH7o8lQSP7igJY1O84vbHMVMFz6s9vC7DFwyG9aRzqW/9TFWhy9bGwJDD
 8rWbAMt/fh9RSp/q+tWRyrXHkaKeB34igvVHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=R3XH19x0j9mpAwBbmALhrl+K1g6ws6AmAQc8yDsKxwc=;
 b=I3cdRqzI+IxIwf86CXmCk4ozr7UEYaInFU0htuyZqy27Q7ljscPvXHaQQ0DkiMeby0
 9rGYIf5JaOMZIJpw0VW/v3OefMlznV6k9G2HUHb59/6k2k9x3UjnOd8bheveHCJqBd5u
 GClqbfGzTRnEDnwXiB1tsNKB5LqwSmjOObD+lldNVrnteM+QqpSwWrYXWX5EOIc1kpIq
 cnvw6MQXGDhwWaca2CdDb9CRQqQFx/bVYH4TNDGSnWSNm5617yXGLXBAjnU7RC8oEOSX
 8WHi84swtnLtxpBEefwiS2BhPH/gnz881AkRh4NFXMDMiXrw614j/pYc7ECRktHcrb7L
 DFiw==
X-Gm-Message-State: AOAM5326KoZdGWDVFfEr6K/2XQtpePHvS6dCOxLivRcuMFM//t2q97FL
 HQGjOM9NaKjm1sr5JR+GYt14/JULcA4=
X-Google-Smtp-Source: ABdhPJxh4YSRJo64KtvfOflwHcynTg8W1GmMjR98OKYM43hau9SWD31eOcjpDevGju3jfuntinpu7g==
X-Received: by 2002:a17:90a:884:: with SMTP id v4mr318901pjc.27.1596132893170; 
 Thu, 30 Jul 2020 11:14:53 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id b63sm7067818pfg.43.2020.07.30.11.14.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2020 11:14:52 -0700 (PDT)
Date: Thu, 30 Jul 2020 11:14:50 -0700
From: Kees Cook <keescook@chromium.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 0/3] Modernize tasklet callback API
Message-ID: <202007301113.45D24C9D@keescook>
References: <20200716030847.1564131-1-keescook@chromium.org>
 <87h7tpa3hg.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h7tpa3hg.fsf@nanos.tec.linutronix.de>
Cc: devel@driverdev.osuosl.org, linux-s390@vger.kernel.org,
 alsa-devel@alsa-project.org, Oscar Carter <oscar.carter@gmx.com>,
 kernel-hardening@lists.openwall.com, Peter Zijlstra <peterz@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Allen Pais <allen.lkml@gmail.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-input@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net, Romain Perier <romain.perier@gmail.com>,
 Will Deacon <will@kernel.org>, "David S. Miller" <davem@davemloft.net>
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

[heavily trimmed CC list because I think lkml is ignoring this
thread...]

On Thu, Jul 30, 2020 at 09:03:55AM +0200, Thomas Gleixner wrote:
> Kees,
> 
> Kees Cook <keescook@chromium.org> writes:
> > This is the infrastructure changes to prepare the tasklet API for
> > conversion to passing the tasklet struct as the callback argument instead
> > of an arbitrary unsigned long. The first patch details why this is useful
> > (it's the same rationale as the timer_struct changes from a bit ago:
> > less abuse during memory corruption attacks, more in line with existing
> > ways of doing things in the kernel, save a little space in struct,
> > etc). Notably, the existing tasklet API use is much less messy, so there
> > is less to clean up.
> >
> > It's not clear to me which tree this should go through... Greg since it
> > starts with a USB clean-up, -tip for timer or interrupt, or if I should
> > just carry it. I'm open to suggestions, but if I don't hear otherwise,
> > I'll just carry it.
> >
> > My goal is to have this merged for v5.9-rc1 so that during the v5.10
> > development cycle the new API will be available. The entire tree of
> > changes is here[1] currently, but to split it up by maintainer the
> > infrastructure changes need to be landed first.
> >
> > Review and Acks appreciated! :)
> 
> I'd rather see tasklets vanish from the planet completely, but that's
> going to be a daring feat. So, grudgingly:

Understood! I will update the comments near the tasklet API.

> Acked-by: Thomas Gleixner <tglx@linutronix.de>

Thanks!

-- 
Kees Cook
