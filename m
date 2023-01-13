Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4826691AD
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 09:51:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6378A526;
	Fri, 13 Jan 2023 09:50:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6378A526
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673599902;
	bh=btXy0yFVN7Bu/EMyQg9LuLklVrXV7x7YVfwVN+gzI9A=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=myzx2jEsaa/5Lh5agCGfV/wNlqF2koP/FYXv8J7BT3xP14qdSfBR+5ri3r6+SREkL
	 QNTguY/MwiXWJNf1Tw6FVQhPr3vsavSiTA1fiJcV0a549EiOdX5sfB2kWGcG5btTiE
	 oKll812Yv9ALBAvgTvK3mzuikKU0s07dP3sf3u3Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62B84F8030F;
	Fri, 13 Jan 2023 09:50:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FD04F803DC; Fri, 13 Jan 2023 09:50:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 613BCF8016D
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 09:50:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 613BCF8016D
Received: by mail-qt1-f172.google.com with SMTP id jr10so11292637qtb.7
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 00:50:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=awQakUOIwVvp4xWgkhRGNM/c58rzqkM16qYt20+qNyU=;
 b=mHh2dIc9+hj2OhebeAbFT9ovwJY/KFrxtgROBAJMtDaC9rJN2QGutgXFZplXnKBUx0
 XAL39849hsbDxfOeukROV6HGRaWBKRVjlLU2kt1nb0ivgWvN0O383RJbYKa6MV9fjvYz
 A+a4DYARZovZCYoqyIualrjrDRDNDNTjbJNYKoQqDwoWa5MVgB2Df1dALmk9Kru7bCG4
 hbTJTxkHFeXbc6sn/ygTL7e/8D+Ze9cJnkAaDll67UEJ06kPnb8CYM4jrRSkvjSW4v3O
 HcCvEiLpFZIlNKj7rwRwfyF1kMnGHFr8RcZUMXCRDeh8sYaSIU68ouj2Gp2Hmy3okPrW
 GveQ==
X-Gm-Message-State: AFqh2kqwQA6rPeGjdkoIIUmJpYPiL4YlKoBfsKC0D+5W89gW/ArBFyh/
 UP8oXMm1eZZrk+8vuEfdj8bvsY3m6z0AKA==
X-Google-Smtp-Source: AMrXdXuP4DI1Vc9B8xb3SD/YRSxc4QLn5ZOvtctYsRbjDAMQviOyEhEgy/zHgIdG06ovdkHlMnKYQA==
X-Received: by 2002:ac8:7c8:0:b0:3ad:a37b:54e with SMTP id
 m8-20020ac807c8000000b003ada37b054emr23829885qth.32.1673599837806; 
 Fri, 13 Jan 2023 00:50:37 -0800 (PST)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com.
 [209.85.128.182]) by smtp.gmail.com with ESMTPSA id
 x14-20020ac86b4e000000b003a816011d51sm10244115qts.38.2023.01.13.00.50.36
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 00:50:36 -0800 (PST)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-4b718cab0e4so275365127b3.9
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 00:50:36 -0800 (PST)
X-Received: by 2002:a81:578e:0:b0:4d9:3858:392 with SMTP id
 l136-20020a81578e000000b004d938580392mr551266ywb.502.1673599835999; Fri, 13
 Jan 2023 00:50:35 -0800 (PST)
MIME-Version: 1.0
References: <20230113062339.1909087-1-hch@lst.de>
 <20230113062339.1909087-17-hch@lst.de>
In-Reply-To: <20230113062339.1909087-17-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Jan 2023 09:50:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU2vaVaCrcKom5YQYD9GLoeerX8HAQav36uFGUksOFc9w@mail.gmail.com>
Message-ID: <CAMuHMdU2vaVaCrcKom5YQYD9GLoeerX8HAQav36uFGUksOFc9w@mail.gmail.com>
Subject: Re: [PATCH 16/22] spi: remove spi-sh-sci
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
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
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-arch@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-gpio@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, linux-rtc@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Jan 13, 2023 at 7:24 AM Christoph Hellwig <hch@lst.de> wrote:
> Now that arch/sh is removed this driver is dead code.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/spi/Kconfig      |   7 --
>  drivers/spi/Makefile     |   1 -
>  drivers/spi/spi-sh-sci.c | 197 ---------------------------------------
>  3 files changed, 205 deletions(-)
>  delete mode 100644 drivers/spi/spi-sh-sci.c
>
> diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
> index 7508dcef909c78..76f3bc6f8c81fc 100644
> --- a/drivers/spi/Kconfig
> +++ b/drivers/spi/Kconfig
> @@ -882,13 +882,6 @@ config SPI_SH_MSIOF
>         help
>           SPI driver for SuperH and SH Mobile MSIOF blocks.
>
> -config SPI_SH_SCI
> -       tristate "SuperH SCI SPI controller"
> -       depends on SUPERH
> -       select SPI_BITBANG
> -       help
> -         SPI driver for SuperH SCI blocks.

This driver uses the Serial Communications Interface (SCI, cfr.
drivers/tty/serial/sh-sci.c) in SPI mode. Hence in theory it could be
used on a variety of Renesas ARM SoCs, and even on RZ/Five.
Again, no DT support.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
