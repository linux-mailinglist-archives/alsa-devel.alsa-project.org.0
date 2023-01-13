Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E5B6690E4
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 09:29:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BAE29C19;
	Fri, 13 Jan 2023 09:28:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BAE29C19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673598564;
	bh=Kg35eqxuBn2GJ3bySEKpofFrCZe9a5VSlk/M723H96s=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=IghYX7sHBFVjHAy7XI2hBHO4nU7zxwAAvkECUWAWv5egj255I8+a5wqR9waUXdEYj
	 ajokY+wxbwGeirf5MPUZalQrdaWz48I8LQ8mFtXOvkAbdDEBRpNz/TLMROiJKviC+o
	 9fGPPQvr+ldgDzcTWslEWv1cOhIkXZPgOMe51Utw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EECBEF8016D;
	Fri, 13 Jan 2023 09:28:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 417ECF8030F; Fri, 13 Jan 2023 09:28:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no
 autolearn_force=no version=3.4.6
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6248F8019B
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 09:28:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6248F8019B
Received: by mail-qv1-f51.google.com with SMTP id o17so14394779qvn.4
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 00:28:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LXxq4tFDMaQ+gaSI4+XgAKyMbRpnWTuq4SxaohX01OI=;
 b=hY0e9NgdbP2/7midOAL2Ndm6Qmkst8lLodx93pZm1r2ChgGBsC+eevrmDbohB5D/lg
 PelNuxPhIQVeMb+FTj36JvK5EkED2eu+zQrGaII+WoWau814IcvDgGRKKV37b8j+54YH
 YcpfvG9LJWmBUyUrvswGtrXAO/2R860WX7gLrixo0cPWNrf7NNvX5HCO27iUgwU/NoXB
 LvgCf/qDWK6x6/JRmWC9biOK9Uq1j/mgvXVrUWEIrQle69wCJbZ9DIS6aTxt5pXx97VB
 8m5wJXVJw9RzBy0GKqJFpliImKKcqzEjX7G97Dpx9GZQrjqDDNWctLeBUaxF5H6ghJOF
 Cj/A==
X-Gm-Message-State: AFqh2kqHf5KmebfhW3EmjtmAfMcHU7F1fTvWzYnxLwoTATpN3bi9HsnE
 DYG5FL5g3JW+fojSrOZ/ZzBtH5GLgnO0kQ==
X-Google-Smtp-Source: AMrXdXsystE7uKsLbesAG7OUC3H5G6Alcy0uUy9SkOlD2SabVe6YFAHadfE2Ga3PlPcpKv/mFqGiBA==
X-Received: by 2002:a0c:90c5:0:b0:521:2df4:f467 with SMTP id
 p63-20020a0c90c5000000b005212df4f467mr151339240qvp.38.1673598500789; 
 Fri, 13 Jan 2023 00:28:20 -0800 (PST)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com.
 [209.85.128.171]) by smtp.gmail.com with ESMTPSA id
 m8-20020a05620a290800b006fb8239db65sm12427589qkp.43.2023.01.13.00.28.19
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 00:28:19 -0800 (PST)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-4bf16baa865so273915107b3.13
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 00:28:19 -0800 (PST)
X-Received: by 2002:a0d:fb81:0:b0:480:fa10:459e with SMTP id
 l123-20020a0dfb81000000b00480fa10459emr889474ywf.283.1673598499239; Fri, 13
 Jan 2023 00:28:19 -0800 (PST)
MIME-Version: 1.0
References: <20230113062339.1909087-1-hch@lst.de>
 <20230113062339.1909087-11-hch@lst.de>
In-Reply-To: <20230113062339.1909087-11-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Jan 2023 09:28:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVLT5G7spdbkB=sx6ZZraXzNFgENxLwg1PMrFnVERn_Tw@mail.gmail.com>
Message-ID: <CAMuHMdVLT5G7spdbkB=sx6ZZraXzNFgENxLwg1PMrFnVERn_Tw@mail.gmail.com>
Subject: Re: [PATCH 10/22] input: remove sh_keysc
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
 linux-sh@vger.kernel.org, linux-rtc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-arch@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, alsa-devel@alsa-project.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Jan 13, 2023 at 7:24 AM Christoph Hellwig <hch@lst.de> wrote:
> Now that arch/sh is removed this driver is dead code.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/input/keyboard/Kconfig    |  10 -
>  drivers/input/keyboard/Makefile   |   1 -
>  drivers/input/keyboard/sh_keysc.c | 334 ------------------------------
>  3 files changed, 345 deletions(-)
>  delete mode 100644 drivers/input/keyboard/sh_keysc.c
>
> diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
> index 84490915ae4d5a..882ec5fef214ac 100644
> --- a/drivers/input/keyboard/Kconfig
> +++ b/drivers/input/keyboard/Kconfig
> @@ -625,16 +625,6 @@ config KEYBOARD_SUNKBD
>           To compile this driver as a module, choose M here: the
>           module will be called sunkbd.
>
> -config KEYBOARD_SH_KEYSC
> -       tristate "SuperH KEYSC keypad support"
> -       depends on ARCH_SHMOBILE || COMPILE_TEST
> -       help
> -         Say Y here if you want to use a keypad attached to the KEYSC block
> -         on SuperH processors such as sh7722 and sh7343.

FTR, this hardware block is also present on the ARM-based
SH-Mobile AG5, and R-Mobile A1 and APE6 SoCs.
Again, no DT support.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
