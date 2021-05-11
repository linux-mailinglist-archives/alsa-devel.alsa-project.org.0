Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 602D937A846
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 15:57:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E110117D2;
	Tue, 11 May 2021 15:57:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E110117D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620741476;
	bh=qb+l8vx2stkm/UDi3H/T8Emn75VQjMXikBoPMVg5cMU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nuV/ozXET6hVwQZy4vtelCEK//vguY3hUaDnQkNXO+vjcTGVNDVwnYemQYbtoNEKr
	 muXFed4p0TQ1+Knxa2670KxIEdCV66/OyxpVLUyhBf2zeEt0BZagyqCZkDdvCjOK79
	 MBCqrTryBP/hFiXdfI/IlnTft+vyINmwghXVVQ78=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A7F8F8016B;
	Tue, 11 May 2021 15:56:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B996AF80163; Tue, 11 May 2021 15:56:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C691F80129
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 15:56:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C691F80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="OjhwFSBd"
Received: by mail-pg1-x52f.google.com with SMTP id u25so5216062pgl.9
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 06:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x6xiojJvPih6Su8dJP6cTthVY6rnrZqEJ8f2jB635BA=;
 b=OjhwFSBd4ZiSWstu50HVKqtm1dzYLZykbZNRq1ki8R15rHYZJe9awA4i9xexupMPev
 HHCowKwFSWuZBmwvWvoKMcsfusNkEBQkbH3J0Ea0rPE/1vXc5PWae/t0fv0iSovfqAiS
 lgxhh/xXYni3aBYEDG3VxfETLSlJwxmvYYFHduPsURzBOeDAoLl87Ij9hTcnLudrEnwW
 VosLtKIWVLM34deB9XV0cIQY4t1RA2fvoEVbjt06DDMZjTL1meDPZ+3I3lHdEz59CTXx
 poHaXWmV6hMQF5vWhApIIqomd54x9gkr1IxFNqr09SG6Eh+hxbsBzE05dhd2oAaetjBJ
 xU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x6xiojJvPih6Su8dJP6cTthVY6rnrZqEJ8f2jB635BA=;
 b=h9136QWHSfTGWTiutuu1MefC2PEwx+uyV0BoeF5SqrHR7pApqdtSCWFSJyzst+q2+V
 PHFV/j495hF/8q9wC8tbSJEQ8kWG+dOMZRa9pcXW7KGc8/TxpZagUNn0qhFhIf4bQFzI
 Y2j0Q5Lp4DUKDHLJaz3yxX20qbYJIhW+ZoADiLiWcvlT3oWSILDzrIsd/VAmutkmt9/Y
 Q5TYFR9ODzKdhqbIaQIqAOWdW6TiwoiSE1Pg8B91Bu149pw83Kh7snHyv95U1PnvD49F
 L3jW7Td0SnTehpmkWqOmHcjnan7W6lGv6SqbdQM1QmaJhAa4tM/kgbsU2no4s/ONFJfX
 thDA==
X-Gm-Message-State: AOAM5336GBTTBldpld4OLzOy6+XvX3UqZh2mT6GxxGErfT15zuM2fbej
 BZQCKqnjwwTg48sWfEixkBUhDGhhDdYHe8XjyIg=
X-Google-Smtp-Source: ABdhPJxt7GLkiELgSKahdlUf+bIA8EAT61FIDSGEdXptYhdNj+vgN0O6ZekTN7Dj6Shx/cjy4lI4W/OrNanbBOr8v+8=
X-Received: by 2002:a63:cd11:: with SMTP id i17mr30507573pgg.74.1620741381507; 
 Tue, 11 May 2021 06:56:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210423182441.50272-1-andriy.shevchenko@linux.intel.com>
 <162072071980.33404.13031284441613044277.b4-ty@kernel.org>
 <CAHp75Vck5izDB4mTRV5hTaknpx5Bm+OA4rNLVznQxVaEwigBZg@mail.gmail.com>
 <20210511134706.GI4496@sirena.org.uk>
 <CAHp75VdPHYEq+Xn5yQ+TyQn5uerc+afcVaHj22OmVzsBW2jcaQ@mail.gmail.com>
In-Reply-To: <CAHp75VdPHYEq+Xn5yQ+TyQn5uerc+afcVaHj22OmVzsBW2jcaQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 11 May 2021 16:56:05 +0300
Message-ID: <CAHp75Vca2KT4kd9zw3ECqym1rRDSg2NNbwRRVVA1L7vyD3VCJQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] spi: pxa2xx: Set of cleanups
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 linux-spi <linux-spi@vger.kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Daniel Mack <daniel@zonque.org>
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

On Tue, May 11, 2021 at 4:52 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, May 11, 2021 at 4:47 PM Mark Brown <broonie@kernel.org> wrote:
> >
> > On Tue, May 11, 2021 at 03:28:18PM +0300, Andy Shevchenko wrote:
> > > On Tue, May 11, 2021 at 11:27 AM Mark Brown <broonie@kernel.org> wrote:
> >
> > > > On Fri, 23 Apr 2021 21:24:27 +0300, Andy Shevchenko wrote:
> > > > > Set of cleanups here and there related to the SPI PXA2xx driver.
> > > > > On top of them, adding the special type for Intel Merrifield.
> >
> > > > [07/14] spi: pxa2xx: Introduce int_stop_and_reset() helper
> > > >         (no commit info)
> >
> > > The above patches are effectively missed.
> > > Anything to fix in your scripts / my patches?
> >
> > Like I said, patch 7 didn't apply so you should check and resend.
>
> I didn't get it. I have effectively rebased the entire series and resend as v2.

v2 --> v3

v3
https://lore.kernel.org/linux-spi/20210510124134.24638-1-andriy.shevchenko@linux.intel.com/T/#t


> I can speculate that your scripts have a bug since they might try v1

v1 --> v1 and / or v2

> as well (as far as I can see they usually send a confirmation of
> application for all versions of the series in question).
>
> Sorry, but I do not see an issue.




-- 
With Best Regards,
Andy Shevchenko
