Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 101781326F0
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jan 2020 14:03:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D53A182C;
	Tue,  7 Jan 2020 14:02:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D53A182C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578402197;
	bh=036Ld/jtOEHsL2jmMdjlFPaDclaBpQv6gpO1foVXn0w=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tbuGQaodvo309Lj1sDjThFLo7ZUH/TiodFbCmkQpZlKSXmhLATM1ywnZy1O79StGx
	 gk0tib4u38EAyV1iP7HgvX2Q3Zl+LiLaHJ9qJnCH4EWKL372H6XdHZGQh2eK6OUUY2
	 JEFQwKdJTrHUcSIcpYLS5lv2Mp3ngSpiqfr6aRVY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C681DF80140;
	Tue,  7 Jan 2020 14:01:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A028F8014A; Tue,  7 Jan 2020 14:01:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1F91F8010D
 for <alsa-devel@alsa-project.org>; Tue,  7 Jan 2020 14:01:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1F91F8010D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="MjzY/BAu"
Received: by mail-lj1-x243.google.com with SMTP id y4so40276299ljj.9
 for <alsa-devel@alsa-project.org>; Tue, 07 Jan 2020 05:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vZDJ0Z3KTFuC9+XlVjxg702wKwgGzFZIhEmKFnvf86g=;
 b=MjzY/BAuEKZAcNNT+oRqdDHKYqnzMWjORiGocCmWFgViO0SQorMl9uOkA0kY+tZ5Sf
 IoTtuA+3nKp9JAnTq+dM35A7eZyRt3zsIiuz6kXFuQI9Ai9DqHxdA/e+oPjVCKE/LGV8
 GCfAZEJ39bHDDiijwQlnzJcB2cvL4Z9i+ClziGxKcVYXv2hYsLNCj90lDyr76xNw2NHD
 V0MkHG+RXhSDDecDp02bTaaMV6Pi2i+T4MBzXqROZyFTeVqDnyLFB+OBTT9MAF9Kcj/H
 GBi6H7Ca6DShJRTARhq4gIXuZg6nq2v4GiCIl1uOFX20TAS6Oexu9LTG08NoYLPAqA9v
 4QRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vZDJ0Z3KTFuC9+XlVjxg702wKwgGzFZIhEmKFnvf86g=;
 b=sct1lTWXDEWeItAloyA6aS2QWlfY9X+p5P27UDc1NegMb877OC+45eyY+Yyr1GWJ7L
 jNwATg/x7ufEG4aZXmOcDLu5RqCcu0cd4e7F0q3IC7cxLs3b7phraXmaIUh1VZv+HNmo
 o5Ah0eoIm9P2Le6xGKC0h8gXhEn3r5NQfUQgNv+7YDQ8/FuyZvhfnTMvrfpbJdItIzNP
 JPh1APy75bGuaMa2lSRjhHbb6t0WXzEsBk4jjKHLh//DFvxoYx/mhgLVlxd94E90m8dD
 uOIwE68CQlllMHoYRxy2SsUDi/lxZOCmqcHOX7kuj85mus2ldb+2nuQNxopj/8+J80Xp
 slYw==
X-Gm-Message-State: APjAAAVTjwpnwsxArn5epDC4zVXRpWI++gtEoKn3Lvp6JI/Ki1JBF3/5
 RqGSEp7AHjxnZOD9EBma4iwSWL4CHOepBz5T8MfTqg==
X-Google-Smtp-Source: APXvYqzfa9fyHLZiKNwulHXqjCb8J6xujMZt5bBYtglre/yN1M6166N2+u+zxthTNv8KgR4tjFQhinxWumnRvskeLf8=
X-Received: by 2002:a2e:85cd:: with SMTP id h13mr61608991ljj.191.1578402087989; 
 Tue, 07 Jan 2020 05:01:27 -0800 (PST)
MIME-Version: 1.0
References: <20191218163701.171914-1-arnd@arndb.de>
 <CACRpkdbqzLUNUjx_kt3-7JLZym2RZ47edW5qp0MgXmpW4-Xf9Q@mail.gmail.com>
 <CAK8P3a2BoVcdgRZqYutA=_SVHLtJwQzP3mKKN-q8n1ROj_iPgw@mail.gmail.com>
 <322b5fbe-e9ca-99cd-80d0-000a5464b37a@opensource.cirrus.com>
 <CAK8P3a12NievRVGgcyuPaFC3eKr9c7Y3KiTnFxEaLkDyzCCj1Q@mail.gmail.com>
In-Reply-To: <CAK8P3a12NievRVGgcyuPaFC3eKr9c7Y3KiTnFxEaLkDyzCCj1Q@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 7 Jan 2020 14:01:16 +0100
Message-ID: <CACRpkdYWbHS1ZwRhCPyfncXyCyhFrmxOz1OzZR3Ui1toNHh60A@mail.gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Charles Keepax <ckeepax@opensource.cirrus.com>,
 patches@opensource.cirrus.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [alsa-devel] [PATCH] pinctrl: lochnagar: select GPIOLIB
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Jan 7, 2020 at 1:39 PM Arnd Bergmann <arnd@arndb.de> wrote:
> On Tue, Jan 7, 2020 at 12:58 PM Richard Fitzgerald
> <rf@opensource.cirrus.com> wrote:
> > On 07/01/2020 10:39, Arnd Bergmann wrote:
> > > On Tue, Jan 7, 2020 at 10:45 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> > >> On Wed, Dec 18, 2019 at 5:37 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > >>> I wonder if GPIOLIB should just become mandatory when enabling the pinctrl
> > >>> subsystem, or if there are still good reasons for leaving it disabled
> > >>> on any machine that uses CONFIG_PINCTRL.
> > >>
> > >> Hm that is a tricky question, they almost always come in pair but are
> > >> technically speaking separate subsystems.
> > >
> > > I think there are a number of use cases for GPIOLIB drivers without PINCTRL, but
> > > are there any examples of the reverse?
> >
> > You could have muxable pins that aren't gpios. For example muxing
> > between i2c/spi signals. So a pinctrl driver doesn't imply gpio.
>
> I understand that this is the case in theory, but what I was wondering about
> is whether there are any such users, or at least any that also want to
> save a few kilobytes of kernel size for gpiolib.

I don't think so. In any case what we need to do at all times is
put gpiolib on lowcarb diet as it gets compiled into pretty much
everything (at least everything embedded), so I am working a bit on that.

Yours,
Linus Walleij
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
