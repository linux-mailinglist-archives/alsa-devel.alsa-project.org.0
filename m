Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A826669102
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 09:32:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23ADCA1A5;
	Fri, 13 Jan 2023 09:31:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23ADCA1A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673598725;
	bh=ZoTE67ONFXD+M5umQmg/25ZC4fVxfi67Rj/7+ApVQCs=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ODCm5KuZfcLBl+DaBaFSnG9yPGkSuPjwAVnmbODcPxwENEiKwmv6jYwOkskwd03B6
	 mpsrHESIqe/5sfpxzP8p22Bwtjj62VesxgGFFP1EwM+rs5SfRim4ZN30M2zhyeNBL7
	 ylRGMflG9dEnlOvcH4odThfa0lk7yTfOGfmNK6Ew=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE78CF8016D;
	Fri, 13 Jan 2023 09:31:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBEB9F8030F; Fri, 13 Jan 2023 09:31:05 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id DB4DEF8019B
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 09:31:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB4DEF8019B
Received: by mail-qt1-f172.google.com with SMTP id a25so11393512qto.10
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 00:31:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5kunZU7S+tV+EkJ89PAjAGhUsATazsdxcPmCZjz3Piw=;
 b=Cm+oZrPXemqJ801ZoWc8t7shRtsMFkTaXF8X/B/aCBBcfGVZFq19hS4aGTDmMCWDsz
 kFovgIzF8tO5CEYVb4DecOTFNCqEDukt69WjTD3EcF16X1WMfWQrGt9er75Ac40PhYyu
 Qq2UuvftB6Gd6xMxLdZTDioqPjVVEnpQfSyP9SJe+UbpdfYyOo4uqygB4Ig7R8wCpcL9
 oyZHvvNBZ8/+ZWR+SBM1eGx4NHlXwNTu8zbW4HHQv8Icl0Xr9agfIctRq4JJHxEenAB/
 MwHFd7lxowFya6ChMnIn5Va33OHP4x9DpEfE/qjtb2ZmF43B+Gh2AnPJr1llTzA1miZG
 CTxw==
X-Gm-Message-State: AFqh2krUoSNSIX+NW2M4lEzPQC0DDemiTDxqneeuSdkOfbVo3gKA2QSZ
 tMucy22j2uxgVuRqisU4Kx44mXLNzqlDfg==
X-Google-Smtp-Source: AMrXdXu+LeDufDMSN0E+PhRdzZHZdFkHLfK+VmpHtSOB8ImXgzdAsDYkq5ZlW6fMeq/1GZD47QpJcA==
X-Received: by 2002:ac8:481a:0:b0:3b0:3b56:58c9 with SMTP id
 g26-20020ac8481a000000b003b03b5658c9mr14711818qtq.30.1673598660301; 
 Fri, 13 Jan 2023 00:31:00 -0800 (PST)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com.
 [209.85.128.173]) by smtp.gmail.com with ESMTPSA id
 fu28-20020a05622a5d9c00b003a7f3c4dcdfsm10291385qtb.47.2023.01.13.00.30.58
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 00:30:59 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-4d0f843c417so161008177b3.7
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 00:30:58 -0800 (PST)
X-Received: by 2002:a05:690c:313:b0:37e:6806:a5f9 with SMTP id
 bg19-20020a05690c031300b0037e6806a5f9mr3492728ywb.47.1673598658639; Fri, 13
 Jan 2023 00:30:58 -0800 (PST)
MIME-Version: 1.0
References: <20230113062339.1909087-1-hch@lst.de>
 <20230113062339.1909087-12-hch@lst.de>
In-Reply-To: <20230113062339.1909087-12-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Jan 2023 09:30:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXYt4dNHUDsTnPa-RP+sdK=35nNa9xQzMChwK54qO44mA@mail.gmail.com>
Message-ID: <CAMuHMdXYt4dNHUDsTnPa-RP+sdK=35nNa9xQzMChwK54qO44mA@mail.gmail.com>
Subject: Re: [PATCH 11/22] mtd/nand: remove sh_flctl
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
>  drivers/mtd/nand/raw/Kconfig    |    8 -
>  drivers/mtd/nand/raw/Makefile   |    1 -
>  drivers/mtd/nand/raw/sh_flctl.c | 1234 -------------------------------
>  include/linux/mtd/sh_flctl.h    |  180 -----
>  4 files changed, 1423 deletions(-)
>  delete mode 100644 drivers/mtd/nand/raw/sh_flctl.c
>  delete mode 100644 include/linux/mtd/sh_flctl.h
>
> diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
> index 98ea1c9e65c8ef..20a4988ea418d5 100644
> --- a/drivers/mtd/nand/raw/Kconfig
> +++ b/drivers/mtd/nand/raw/Kconfig
> @@ -284,14 +284,6 @@ config MTD_NAND_MXC
>           This enables the driver for the NAND flash controller on the
>           MXC processors.
>
> -config MTD_NAND_SH_FLCTL
> -       tristate "Renesas SuperH FLCTL NAND controller"
> -       depends on SUPERH || COMPILE_TEST
> -       depends on HAS_IOMEM
> -       help
> -         Several Renesas SuperH CPU has FLCTL. This option enables support
> -         for NAND Flash using FLCTL.

FTR, this hardware block is also present on the ARM-based
SH-Mobile AG5 and R-Mobile A1 SoCs.
Again, no DT support.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
