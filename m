Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C69305FB4C5
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Oct 2022 16:41:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56C6D3E05;
	Tue, 11 Oct 2022 16:40:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56C6D3E05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665499265;
	bh=hEEbjFNkUoUyMh2KpcSleFdDACALAdemRBKk4JXGLGE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tu3WdV3fPTbkd5h1iPmhHif7ZbSC6YLh5p2O5VTqrItNQoQJvL6b/O6ebDi7nrvc1
	 F4yypksQ/jwKewg64lgQJPdQOIcYg+fuInrQD66icwWIu+pUdKVscqBe8l/9lJ/3Ek
	 LEy7+Q34bxRg/GBdFX0r70l5YCAQ76nqb23TuG0E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1204F80256;
	Tue, 11 Oct 2022 16:40:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67FB5F8021D; Tue, 11 Oct 2022 16:40:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E050F80130
 for <alsa-devel@alsa-project.org>; Tue, 11 Oct 2022 16:40:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E050F80130
Received: by mail-qv1-f49.google.com with SMTP id mx8so9052589qvb.8
 for <alsa-devel@alsa-project.org>; Tue, 11 Oct 2022 07:40:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7sKcP+GTT+SWbU28Mvg7qTSCnoQqhpg8QoNv8i57vas=;
 b=NK3qz+JnfAacVzANmdxh55WOoP/QlpCpWX8IGUj5eHHHp4lZgf4PLTCDPGqch0lZEQ
 zz1R43jlSez5cmFBeXJBfz7wnMBZZbPfL4eOanaih8my8VJ8ooyNRieZbHNZLu7nLE0T
 pB1TyUjREm31w++KZJfEnTf/LPWem5N64MqVr/mQq+O2xTKncIT/BX/6ttZEzkkkAwhP
 JDrvzDANMYcrXDs376A7VGXnXuQ+LZSAZlbNMqeqFe3vrnBqlEyrC4pokOpbZZ2+JZGF
 UQnF9vm1HLY4DnLlfKmtd6lX4zcx/27xTyxuaK2C0pyWjjd12bZ8MOieJi0kGQJ0Z1i0
 Om6A==
X-Gm-Message-State: ACrzQf1QfJxZm3ew4hTQ1BAuCEHtvweGOLHDl3h1K+sBYx1rnlu3cPFR
 d77d8ifekKPvMBYDYKNUVWBfsDKMTKHdaQ==
X-Google-Smtp-Source: AMsMyM4PGJIxLetoOGBMr4RUSLPGQ9oUyxKxeqh/1t9do+R5X+wCJpfmAau9hsn1bUszqAhqioGU1w==
X-Received: by 2002:a05:6214:252c:b0:4b1:8d8b:9042 with SMTP id
 gg12-20020a056214252c00b004b18d8b9042mr19150603qvb.29.1665499200781; 
 Tue, 11 Oct 2022 07:40:00 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com.
 [209.85.219.176]) by smtp.gmail.com with ESMTPSA id
 u10-20020a05620a430a00b006e702033b15sm12979182qko.66.2022.10.11.07.39.58
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Oct 2022 07:39:58 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id y205so16683448yby.13
 for <alsa-devel@alsa-project.org>; Tue, 11 Oct 2022 07:39:58 -0700 (PDT)
X-Received: by 2002:a25:4fc2:0:b0:6be:afb4:d392 with SMTP id
 d185-20020a254fc2000000b006beafb4d392mr21857240ybb.604.1665499197788; Tue, 11
 Oct 2022 07:39:57 -0700 (PDT)
MIME-Version: 1.0
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-3-andriy.shevchenko@linux.intel.com>
 <Y0SyVwjDl7NGfTPn@sol>
 <CAHp75Vf4oS8g0zxgismtLrzsJ7AE-bdMEq+GAzx2=Mwnhuk3UA@mail.gmail.com>
 <Y0V0IXF3sASTGdMU@smile.fi.intel.com> <Y0V57gI75ik4ki3A@sol>
 <Y0V9eJX7a0fe6EfX@smile.fi.intel.com>
In-Reply-To: <Y0V9eJX7a0fe6EfX@smile.fi.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Oct 2022 16:39:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUhSKuJ3N5zf_+ad_dFu6kSmVTqRpgFUWtd54S9ryw=ew@mail.gmail.com>
Message-ID: <CAMuHMdUhSKuJ3N5zf_+ad_dFu6kSmVTqRpgFUWtd54S9ryw=ew@mail.gmail.com>
Subject: Re: [PATCH v2 02/36] gpiolib: cdev: Add missed header(s)
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Kent Gibson <warthog618@gmail.com>, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-aspeed@lists.ozlabs.org,
 patches@opensource.cirrus.com, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-riscv@lists.infradead.org, alsa-devel@alsa-project.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
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

Hi Andy,

On Tue, Oct 11, 2022 at 4:31 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Tue, Oct 11, 2022 at 10:13:02PM +0800, Kent Gibson wrote:
> > On Tue, Oct 11, 2022 at 04:48:17PM +0300, Andy Shevchenko wrote:
> > > On Tue, Oct 11, 2022 at 11:05:42AM +0300, Andy Shevchenko wrote:
> > > > On Tue, Oct 11, 2022 at 3:02 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > > > On Mon, Oct 10, 2022 at 11:14:18PM +0300, Andy Shevchenko wrote:
>
> ...
>
> > > > > > -#include <linux/gpio.h>
> > > > > >  #include <linux/gpio/driver.h>
> > > > > > +#include <linux/gpio.h>
> > > > > > +#include <linux/hte.h>
> > > > >
> > > > > Ok with the hte re-order.
> > > > >
> > > > > But moving the gpio subsystem header after the gpio/driver is not
> > > > > alphabetical ('.' precedes '/') and it read better and made more sense
> > > > > to me the way it was.
> > > >
> > > > I see, I guess this is vim sort vs shell sort. Strange, they should
> > > > follow the locale settings...
> > >
> > > I have checked, the shell and vim sort gave the same result as in this patch.
> > >
> >
> > The original order (sans hte.h) was done by VSCode Sort Lines Ascending,
> > and that still returns the same result.  That matches what I would
> > expect to see given the content of the text.
> >
> > And for me vim also gives the original order.
> >
> > Just to confirm - is '.' 0x2e and '/' 0x2f in your universe?
>
> $ LC_COLLATE=C sort test1.txt
> #include <linux/gpio.h>
> #include <linux/gpio/driver.h>
>
> $ LC_COLLATE= sort test1.txt
> #include <linux/gpio/driver.h>
> #include <linux/gpio.h>
>
> I guess this explains the difference. Currently I have en_US.UTF-8.

Throwing my can of paint into the mix...

I think it is more logical to first include the general <linux/gpio.h>,
followed by whatever <linux/gpio-foo.h> and <linux/gpio/bar.h>,
irrespective of (language-specific or phonebook) sort order.

Yeah, it sucks that this requires some manual work after running sort...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
