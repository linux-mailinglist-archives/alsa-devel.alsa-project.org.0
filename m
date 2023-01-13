Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 497E0669213
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 10:00:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FBF5A502;
	Fri, 13 Jan 2023 09:59:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FBF5A502
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673600417;
	bh=1I0+/jhCo9D7vNPV/eLpWQmnR1UGppvsFhnQYX2UELA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=fjTnMt9tCYqxC5ht81ujPP5vbuVrLYPyA86nShPNuxysGBnTUynC3StgY9DiL5abP
	 tid4H7SVeZ6bGbEKtL6QSsWvizXNeFmcqEsBxXd6Nqy9xt3uUifnxGLp+AXpQHvVYp
	 ygpvz1qa0aFnza+bauOBuljhHv/jr53wLhVqJj9U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 392C2F8016D;
	Fri, 13 Jan 2023 09:59:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61313F8030F; Fri, 13 Jan 2023 09:59:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C61D4F8019B
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 09:59:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C61D4F8019B
Received: by mail-qt1-f181.google.com with SMTP id y7so87606qtv.5
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 00:59:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HIx/98EgJxXRPw6eabRyCtMqFo85a6og6EquEgJiRDY=;
 b=1l8bh2kil0/jOnrQ3dyCZudeR9VxC7L2/Db06pDn/VuTdrM8Cju5TA1CgoAbPRx2AP
 GmWWgJVv933LBRh9rmsCLGafyUD+Hy2+hy8gOvGX8q/83UXcwR728I5naGn4vfA0a2yt
 vL6MwymSK7yZFFk38/xNSlL5vYXHwB6ypsj4eUvpGxyMLcsshXZdQb4Yx4a4/jh9Vvhz
 jIERAi38IvZXPhzOibTAy9CCU6ebzs9gbGvRr3r41JSyQJ+EnZ8JrL774Me9EFh5RMXO
 k+Ld2sEXTsEGQc3gqMKVBJH59rbAgiRsCvFUSugx6lieBKGhBuhZdM2Yyy/xufpTma5y
 V+tA==
X-Gm-Message-State: AFqh2krbUG7Pajt+LERJCsVWEBcZ51iKFDLfa69x2zfaPq3hvEXFwigR
 YgBPIZk0/i/k7R6FZ5zRQ4X30/7tXTGs/g==
X-Google-Smtp-Source: AMrXdXtFZF9ju6HjpoFd/bwNdIwnf0hFfm/tkLt8v3i3YDZihAwrJ63WVFvO6Hemu7HxsTGjPq55Iw==
X-Received: by 2002:ac8:4919:0:b0:3a8:16d:ea4c with SMTP id
 e25-20020ac84919000000b003a8016dea4cmr17311852qtq.31.1673600354124; 
 Fri, 13 Jan 2023 00:59:14 -0800 (PST)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com.
 [209.85.219.172]) by smtp.gmail.com with ESMTPSA id
 i14-20020ac871ce000000b003a4f22c6507sm10342435qtp.48.2023.01.13.00.59.13
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 00:59:13 -0800 (PST)
Received: by mail-yb1-f172.google.com with SMTP id t15so21642529ybq.4
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 00:59:13 -0800 (PST)
X-Received: by 2002:a25:7:0:b0:7c1:b2e9:7e71 with SMTP id
 7-20020a250007000000b007c1b2e97e71mr838217yba.604.1673600353257; 
 Fri, 13 Jan 2023 00:59:13 -0800 (PST)
MIME-Version: 1.0
References: <20230113062339.1909087-1-hch@lst.de>
 <20230113062339.1909087-3-hch@lst.de>
In-Reply-To: <20230113062339.1909087-3-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Jan 2023 09:59:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVM3BpvVD3c4gp1OidnwF5zFd4MJecij7zWBnahzNaSNw@mail.gmail.com>
Message-ID: <CAMuHMdVM3BpvVD3c4gp1OidnwF5zFd4MJecij7zWBnahzNaSNw@mail.gmail.com>
Subject: Re: [PATCH 02/22] usb: remove the dead USB_OHCI_SH option
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

Hi Christoph,

On Fri, Jan 13, 2023 at 7:23 AM Christoph Hellwig <hch@lst.de> wrote:
> USB_OHCI_SH is a dummy option that never builds any code, remove it.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Thanks for your patch!
Nice catch!

> --- a/drivers/usb/host/Kconfig
> +++ b/drivers/usb/host/Kconfig
> @@ -548,17 +548,6 @@ config USB_OHCI_HCD_SSB
>
>           If unsure, say N.
>
> -config USB_OHCI_SH
> -       bool "OHCI support for SuperH USB controller (DEPRECATED)"
> -       depends on SUPERH || COMPILE_TEST
> -       select USB_OHCI_HCD_PLATFORM
> -       help
> -         This option is deprecated now and the driver was removed, use
> -         USB_OHCI_HCD_PLATFORM instead.
> -
> -         Enables support for the on-chip OHCI controller on the SuperH.
> -         If you use the PCI OHCI controller, this option is not necessary.
> -

At this point in the series, there are still selects and enablements of
USB_OHCI_SH in arch/sh/Kconfig and arch/sh/configs/sh7757lcr_defconfig.
I think it would be good to replace them by USB_OHCI_HCD_PLATFORM first,
to decouple the fate of this patch from the rest of the series.

>  config USB_OHCI_EXYNOS
>         tristate "OHCI support for Samsung S5P/Exynos SoC Series"
>         depends on ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
