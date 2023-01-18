Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1466722A9
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Jan 2023 17:11:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66D5E7995;
	Wed, 18 Jan 2023 17:10:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66D5E7995
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674058282;
	bh=k/Assz0EUsvtavUESdEw+MMNq6qnAqGjxpdDihguySs=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=gc/3T4hglvjvxhPyS6pmT1yBzZ3JSUJwDTM5Ujh4vFW4je4Zpvatw1UoQUb6QF6Wc
	 sIN29GohG0JcHaDATjKyLuFtcyaFYODJAI9kQPXOuCTJTpaipfYCll/i/jxAnKIoZj
	 vj04rFIuhau5dINub+Q2RYhgIbHx8HBDICf8CeTI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29861F80563;
	Wed, 18 Jan 2023 17:08:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8ACB7F8024D; Wed, 18 Jan 2023 08:47:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA8DFF80083
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 08:47:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA8DFF80083
Received: by mail-qt1-f178.google.com with SMTP id s4so356769qtx.6
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 23:47:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ckf5E8d0Cnw+micSJ5vxd9QO1KFnhxODfDAqVKF2Q0k=;
 b=i0C22bFJXlNzqEJglZO2yA1JVTKuurZAinvezWe+LIsRhi7IIb5wcHPtWFEkO7fTCF
 J73CxKeXnCsdG+qbhnSkSuyQapYkjV6FevfWI1KORCqPcJC1AlWHICqq7lwg+QkGHj36
 bJuovy07+Kn8KY01h1P4hSl7MyZoYERnGvj2pXnmNTL8gZZcFJrAl4ahBAZESTKeMjev
 20SocX0UxzPZR1vHlTXNp0tBKnYHuCTD1OvGGVx6Nw62N2KZppffFvxX4VMpihCP+xul
 wHL9Nk44NcXCslJoa9IMcbDVYnzEtW9gn53GyMwynzakZhXQCK0z3ev4bsVdP5a/7x81
 KKIA==
X-Gm-Message-State: AFqh2kpAXzbllNu0hIeGfUe2aP0zce7wxNKWEN+zLQ7TLbpln7ly/LCI
 saDTNwKf05EDvvzgXt5hBJIl0ILEzP5QlA==
X-Google-Smtp-Source: AMrXdXtEzA8nTZtM8IugIm7lCDZOzkG4Dy5IvGJgXRWMxM7mk7wEWTJRoslK8uN4n7OrHEt5XmAxnw==
X-Received: by 2002:ac8:44cd:0:b0:3b6:2fbb:1f8 with SMTP id
 b13-20020ac844cd000000b003b62fbb01f8mr7518254qto.61.1674028032717; 
 Tue, 17 Jan 2023 23:47:12 -0800 (PST)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com.
 [209.85.128.169]) by smtp.gmail.com with ESMTPSA id
 jr49-20020a05622a803100b003ad373d04b6sm14238522qtb.59.2023.01.17.23.47.11
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 23:47:11 -0800 (PST)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-4a2f8ad29d5so456471017b3.8
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 23:47:11 -0800 (PST)
X-Received: by 2002:a81:bd6:0:b0:48d:1334:6e38 with SMTP id
 205-20020a810bd6000000b0048d13346e38mr726842ywl.316.1674028030903; Tue, 17
 Jan 2023 23:47:10 -0800 (PST)
MIME-Version: 1.0
References: <20230113062339.1909087-1-hch@lst.de>
 <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de>
 <20230116071306.GA15848@lst.de>
 <9325a949-8d19-435a-50bd-9ebe0a432012@landley.net>
 <CAMuHMdUJm5QvzH8hvqwvn9O6qSbzNOapabjw5nh9DJd0F55Zdg@mail.gmail.com>
 <7329212f-b1a0-41eb-99b3-a56eb1d23138@landley.net>
In-Reply-To: <7329212f-b1a0-41eb-99b3-a56eb1d23138@landley.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Jan 2023 08:46:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXo3iR2C=CAaXO5tBRCncnQAAMR6BMPLOm_nBpFAeVhrA@mail.gmail.com>
Message-ID: <CAMuHMdXo3iR2C=CAaXO5tBRCncnQAAMR6BMPLOm_nBpFAeVhrA@mail.gmail.com>
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

On Wed, Jan 18, 2023 at 5:50 AM Rob Landley <rob@landley.net> wrote:
> On 1/17/23 14:26, Geert Uytterhoeven wrote:
> > On Tue, Jan 17, 2023 at 8:01 PM Rob Landley <rob@landley.net> wrote:
> >> I'm lazy and mostly test each new sh4 build under qemu -M r2d because it's
> >> really convenient: neither of my physical boards boot from SD card so replacing
> >> the kernel requires reflashing soldered in flash. (They'll net mount userspace
> >> but I haven't gotten either bootloader to net-boot a kernel.)
> >
> > On my landisk (with boots from CompactFLASH), I boot the original 2.6.22
> > kernel, and use kexec to boot-test each and every renesas-drivers
> > release.  Note that this requires both the original 2.6.22 kernel
> > and matching kexec-tools.
>
> I make it a point to run _current_ kernels in all my mkroot systems, including
> sh4. What I shipped was 6.1 is:
>
> # cat /proc/version
> Linux version 6.1.0 (landley@driftwood) (sh4-linux-musl-cc (GCC) 9.4.0, GNU ld
> (GNU Binutils) 2.33.1) #1 Tue Jan 10 16:32:07 CST 2023

I think you misunderstood: renesas-drivers releases[1] are current
kernels.

   Linux version 6.2.0-rc3-landisk-01864-g0c6453b3e5f6 (geert@rox)
(sh4-linux-gnu-gcc (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0, GNU ld (GNU
Binutils for Ubuntu) 2.38) #125 Tue Jan 10 14:29:01 CET 2023

I use 2.6.22 and kexec as a boot loader for newer kernels, to avoid
juggling CF cards.  I cannot install a newer base kernel on the CF,
as kexec is broken upstream.

> > Apparently both upstreamed kernel and
> > kexec-tools support for SH are different, and incompatible with each
> > other, so you cannot kexec from a contemporary kernel.
>
> Sure you can. Using toybox's insmod and modprobe, anyway. (That's the target I
> tested those on... :)
>
> Haven't messed with signing or compression or anything yet, my insmod is just
> doing syscall(SYS_finit_module) and then falling back to SYS_init_module if that
> fails and either fd was 0 or errno was ENOSYS. (Don't ask me why
> SYS_finit_module doesn't work on stdin...)
>
> https://github.com/landley/toybox/blob/master/toys/other/insmod.c#L31
>
> https://landley.net/toybox/downloads/binaries/0.8.9/toybox-sh4

Again, I think you're talking about something different.
Does kexec work for you?

> > I tried working my way up from 2.6.22, but gave up around 2.6.29.
> > Probably I should do this with r2d and qemu instead ;-)
>
> I have current running there. I've had current running there for years. Config
> attached...
>
> > Both r2d and landisk are SH7751.
>
> Cool. Shouldn't be hard to get landisk running current then.

Current kernels work fine on landisk with an old Debian userspace
on CF.  The 8139cp driver is a bit flaky: last time I tried nfsroot,
that didn't work well.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
