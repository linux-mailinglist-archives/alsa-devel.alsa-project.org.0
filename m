Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA3A672295
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Jan 2023 17:10:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D393E46A9;
	Wed, 18 Jan 2023 17:09:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D393E46A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674058218;
	bh=9xBSBWQ085Dda9Mop4IJ73mtIVx8gElGy2cfYGMtsQY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=gX1io4ZkLpwBlFlVAyE7WQSmq/uuV7JBIUay1yMqSgLGBPqfCb+BfmCn8GKs4hS4j
	 nWDchAtQFoRop9FqExbHfUELqW0pOlbJJOk0Yka/4DxVSDSpOFl/g4bafnu8CKy4sl
	 xode2/UbAmoozGc+ZAhIy3/E8SH05PXm1WWESQ3c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 086CAF80520;
	Wed, 18 Jan 2023 17:08:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D302F804DE; Tue, 17 Jan 2023 21:26:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C037F8023A
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 21:26:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C037F8023A
Received: by mail-qt1-f179.google.com with SMTP id x5so4598505qti.3
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 12:26:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7rC0mNjXax5vqLz2OAo+EH0y+cJfjyIAm7sm9u5PvgQ=;
 b=4D62ayGPReZRl47Pp1En0mSLXXkV/hTwg/fbz6V2ukaRtLKm2DQQOkm53Nv0zM51Ye
 4SUikR6uW2sybbtOvRenKHF3E34/djUUFRGC+D9lEOiYo7wYz7RDTVUQv+LCZGSrXsP3
 uUeG2/EsA59LsKZtzhTN8zWOcs0XYfOCgtriQ+POjiJdJkV11clEjp8xAPFTMVq6ZQbG
 HCPGfZzNyFet/2+MIeBz0SIVJE2ZNruaNpG0OZhGuDrZmozSZe7shlFN2mY7UZ0sOTe6
 Zp36LaQ73ejO25ZwEQK+Jf9AadThOQ4QTs6R/s0q0M171CtQ21Tpe/928CZnCPpvv5QS
 5STw==
X-Gm-Message-State: AFqh2korz2O9AcHe5bSxXmmnoeo5oZJA5iH0PmOtrqxg4B4acp9MBuRr
 obOd/wzWNq8jE/QIPHAqkPhbMtKSBqpfTw==
X-Google-Smtp-Source: AMrXdXseyg846WBefqUIu2ygJhcev41+NRqALavekD98ctcTaCmCMHgIOMWiCryAw5tp0NS+EDfJBg==
X-Received: by 2002:ac8:6712:0:b0:3b6:3a58:912d with SMTP id
 e18-20020ac86712000000b003b63a58912dmr5937260qtp.0.1673987200790; 
 Tue, 17 Jan 2023 12:26:40 -0800 (PST)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com.
 [209.85.219.173]) by smtp.gmail.com with ESMTPSA id
 o24-20020a05620a229800b006fec1c0754csm20468760qkh.87.2023.01.17.12.26.39
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 12:26:40 -0800 (PST)
Received: by mail-yb1-f173.google.com with SMTP id v19so29696666ybv.1
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 12:26:39 -0800 (PST)
X-Received: by 2002:a25:9012:0:b0:7b8:a0b8:f7ec with SMTP id
 s18-20020a259012000000b007b8a0b8f7ecmr707665ybl.36.1673987199250; Tue, 17 Jan
 2023 12:26:39 -0800 (PST)
MIME-Version: 1.0
References: <20230113062339.1909087-1-hch@lst.de>
 <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de>
 <20230116071306.GA15848@lst.de>
 <9325a949-8d19-435a-50bd-9ebe0a432012@landley.net>
In-Reply-To: <9325a949-8d19-435a-50bd-9ebe0a432012@landley.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Jan 2023 21:26:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUJm5QvzH8hvqwvn9O6qSbzNOapabjw5nh9DJd0F55Zdg@mail.gmail.com>
Message-ID: <CAMuHMdUJm5QvzH8hvqwvn9O6qSbzNOapabjw5nh9DJd0F55Zdg@mail.gmail.com>
Subject: Re: remove arch/sh
To: Rob Landley <rob@landley.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 18 Jan 2023 17:08:49 +0100
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 linux-rtc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, alsa-devel@alsa-project.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Rob,

On Tue, Jan 17, 2023 at 8:01 PM Rob Landley <rob@landley.net> wrote:
> On 1/16/23 01:13, Christoph Hellwig wrote:
> > On Fri, Jan 13, 2023 at 09:09:52AM +0100, John Paul Adrian Glaubitz wrote:
> >> I'm still maintaining and using this port in Debian.
> >>
> >> It's a bit disappointing that people keep hammering on it. It works fine for me.
> >
> > What platforms do you (or your users) use it on?
>
> 3 j-core boards, two sh4 boards (the sh7760 one I patched the kernel of), and an
> sh4 emulator.
>
> I have multiple j-core systems (sh2 compatible with extensions, nommu, 3
> different kinds of boards running it here). There's an existing mmu version of
> j-core that's sh3 flavored but they want to redo it so it hasn't been publicly
> released yet, I have yet to get that to run Linux because the mmu code would
> need adapting, but the most recent customer projects were on the existing nommu
> SOC, as was last year's ASIC work via sky130.

J4 still vaporware?

> My physical sh4 boards are a Johnson Controls N40 (sh7760 chipset) and the
> little blue one is... sh4a I think? (It can run the same userspace, I haven't
> replaced that board's kernel since I got it, I think it's the type Glaubitz is
> using? It's mostly in case he had an issue I couldn't reproduce on different
> hardware, or if I spill something on my N40.)
>
> I also have a physical sh2 board on the shelf which I haven't touched in years
> (used to comparison test during j2 development, and then the j2 boards replaced it).
>
> I'm lazy and mostly test each new sh4 build under qemu -M r2d because it's
> really convenient: neither of my physical boards boot from SD card so replacing
> the kernel requires reflashing soldered in flash. (They'll net mount userspace
> but I haven't gotten either bootloader to net-boot a kernel.)

On my landisk (with boots from CompactFLASH), I boot the original 2.6.22
kernel, and use kexec to boot-test each and every renesas-drivers
release.  Note that this requires both the original 2.6.22 kernel
and matching kexec-tools.  Apparently both upstreamed kernel and
kexec-tools support for SH are different, and incompatible with each
other, so you cannot kexec from a contemporary kernel.
I tried working my way up from 2.6.22, but gave up around 2.6.29.
Probably I should do this with r2d and qemu instead ;-)

Both r2d and landisk are SH7751.

Probably SH7722/'23'24 (e.g. Migo-R and Ecovec boards) are also
worth keeping.  Most on-SoC blocks have drivers with DT support,
as they are shared with ARM.  So the hardest part is clock and
interrupt-controller support.
Unfortunately I no longer have access to the (remote) Migo-R.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
