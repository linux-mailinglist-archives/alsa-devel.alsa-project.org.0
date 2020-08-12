Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8196242962
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Aug 2020 14:33:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 353C2166F;
	Wed, 12 Aug 2020 14:33:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 353C2166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597235635;
	bh=rVoACvL3vbhn7Hy+rg7NvJC/rRz4OGAEG/IOuYVfJLk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lHlVkICiDQxlwJKuqoB+wM9YE9vW3iRgYvPrkxFFHB6DykmyLWS0BZOY0I7IEyvr1
	 utEyjexdXclLTgi1fis1gBplbnGb+Hxmmu+m/HVgTNWxfG44ZPy61xF2a8fCKbH4c5
	 NoU8Fh+/C5i1oerv0I+SgoRz2aYE6jhP6ICdH4wU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64957F8022B;
	Wed, 12 Aug 2020 14:32:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10255F8022B; Wed, 12 Aug 2020 14:32:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3B8EF800F4
 for <alsa-devel@alsa-project.org>; Wed, 12 Aug 2020 14:32:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3B8EF800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="YkqGfxOv"
Received: by mail-oi1-x241.google.com with SMTP id a24so1635308oia.6
 for <alsa-devel@alsa-project.org>; Wed, 12 Aug 2020 05:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rVoACvL3vbhn7Hy+rg7NvJC/rRz4OGAEG/IOuYVfJLk=;
 b=YkqGfxOvN96eGolDSvt0iCWOvbZZeKLlCAGi8BAH/XmoiSQNEa5synSoNNTH3X5sLJ
 J0XSC09qP/ds7a/R4Q0SSHomSPcp0o15AVV2+lMvLnTd0vBV6RrhGJjKX/x/0SkqiKwV
 0A06fOqNelj9etWPOTYb+YgdV2enu7Fu10STP5iSBmXYnoCAcjjN9WoirJjjmeTuYc3n
 nbzkPOmaEZpF2jhtGMP8FxV8952FOiOMh2n1AUuK375GNKqppbaAbdxZ1DWWt48ETdQL
 u7QVCoEWkBLGQ3/N4TpSYorKV9FXu36SK0GdrESPraE01ZXd8Fjq2XFQXHvDOrZrjyq5
 8LeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rVoACvL3vbhn7Hy+rg7NvJC/rRz4OGAEG/IOuYVfJLk=;
 b=Ofv3kVE76wz+IaOqSlHtH287ghEITWD1MPrek1xCG3eZJUZQi8uBILW/ER+kKx+VDy
 l2a6rk0g39Eu7WxJEZI7Wu/B4zQzF9TnC/zgL6fTsYwEaExTTOMpUmPRGi1jCG4mavek
 r6oFs4KlqB+XIH9aaC2Oq98ulY+R/oZBTbgahPCGnpdKNf6APXbBsJgQ7RYQVu7FwZZw
 8P33/DPGNY2hvZzJ7xUv01WronGsMg15povHLHfdeX3pJY3CGXE98TbIrUcASTnoBB9E
 7/SbGwoLXUPbSASCfGyNtusw0lRFcS8/6DvrG93ivGm8uV1kTL6QtvOLpwO8ZJR7n2u9
 7Q9Q==
X-Gm-Message-State: AOAM531+5O5HDC3qeGmSJIRvr0KX1xy9n5/g0tv8YDmb0Fdd2lloZyUc
 qHtMCUHJgyreEEsCL7sHu1v2h7aRcWd5KvC22+0=
X-Google-Smtp-Source: ABdhPJypHP+8lAnojHqsj+HMjv2Kx5qQD1vR1U48FukFJAYIMQIqPx17kRoJyhSS4FcPT0MB5slRlnJYgqYSUKBAAmw=
X-Received: by 2002:a05:6808:4c5:: with SMTP id
 a5mr7370620oie.175.1597235526662; 
 Wed, 12 Aug 2020 05:32:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200716030847.1564131-1-keescook@chromium.org>
 <87h7tpa3hg.fsf@nanos.tec.linutronix.de> <202007301113.45D24C9D@keescook>
 <CAOMdWSJQKHAWY1P297b9koOLd8sVtezEYEyWGtymN1YeY27M6A@mail.gmail.com>
 <202008111427.D00FCCF@keescook>
In-Reply-To: <202008111427.D00FCCF@keescook>
From: Allen <allen.lkml@gmail.com>
Date: Wed, 12 Aug 2020 18:01:55 +0530
Message-ID: <CAOMdWS+nJr+g1c0Kb99Z=HwQjHtH_-NCC9hW-o6xFs4huGKsqQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Modernize tasklet callback API
To: Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Cc: devel@driverdev.osuosl.org, linux-s390@vger.kernel.org,
 alsa-devel@alsa-project.org, Oscar Carter <oscar.carter@gmx.com>,
 Kernel Hardening <kernel-hardening@lists.openwall.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-input@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
 Thomas Gleixner <tglx@linutronix.de>, Romain Perier <romain.perier@gmail.com>,
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

Kees,

> Was a Coccinelle script used for any of these conversions? I wonder if
> it'd be easier to do a single treewide patch for the more mechanical
> changes.

No, I should have written one. Will do it.

> And, actually, I still think the "prepare" patches should just be
> collapsed into the actual "covert" patches -- there are only a few.

Okay. It's been done and pushed to:
https://github.com/allenpais/tasklets/tree/V4

> After those, yeah, I think getting these sent to their respective
> maintainers is the next step.

 Please look at the above branch, if it looks fine, let me know
if I can add your ACK on the patches.
>
> Sure! I will add it to the tracker. Here's for the refactoring:
> https://github.com/KSPP/linux/issues/30
>
> and here's for the removal:
> https://github.com/KSPP/linux/issues/94
>
> if you can added details/examples of how they should be removed, that'd
> help other folks too, if they wanted to jump in. :)

Sure, Thank you.

- Allen
