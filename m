Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CED6506DCA
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 15:42:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B1DB18E1;
	Tue, 19 Apr 2022 15:41:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B1DB18E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650375754;
	bh=upNTPwFvptYy4pw0IAbTS+BIZybPbyEIYz+qLumFKsw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eZQ8bAQ9dNUS/vz9xf/HSHwuorxtp1PWDbYXTPhgvQhWkXrUrtqK3dF75zAaBrLP9
	 mWaH3vszehlSrXY90Mb7MjSZME+E7ERTCMB+VpBIrpkq5MOF5FfgIwzDwnudfObAFd
	 ZkvHfgEs6tEBRVPWVCsBLC84LDwPDm1eSNtids2w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6EF8F80237;
	Tue, 19 Apr 2022 15:41:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 285FEF80269; Tue, 19 Apr 2022 15:41:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12B4AF80116
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 15:41:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12B4AF80116
Received: by mail-qt1-f174.google.com with SMTP id hf18so11702902qtb.0
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 06:41:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jGm6guTALRSU5+PRnvbVJaHFz19D6EpgjjGAnT9VVE4=;
 b=7W3EyLiFNuXffvO7GYugRn8AexPM2Dl36uVZQGGuxrLy5ZKE1ce1xbBHsUiAcRkHY3
 QgMCwmKuCBFBjpCXj0QEP0sUK2IpLnY1WyjN6eUBhYSOFP/QJebq1ZuP2hXXKbJ35L+D
 TxSrHH9ZT5PtxIhH+0zSrc2JI92D3UopQ9gJWisuw4x+aGNXSMWDvo3Z3j2J+fwmJXhm
 5U1ZKEnNi21QjezOwZWHFhr6OBzEa6j2EJFrEQwwB6V6T51+2koko/BpGvVYgelgLI1p
 17+BS6YOZCydtRyYslP1IceghTON6YzhdHaqO0od0+XdKEooqS38bS7VN49xL9MSnY6R
 +PvQ==
X-Gm-Message-State: AOAM533i2c9xyhz4Ca6erhquxBeA8tFzxKPtVm1XN4/OyFqyg8G37EsY
 xUtazoM6H8dBr+7n5D2peoUz+sJb9aCrcg==
X-Google-Smtp-Source: ABdhPJwG6Kc6sd1DvNQ8oQqzudxoWGMTsvxtD5hchpIB400Ueu9zU/6D/IN9ephONGI1cxF75np7ag==
X-Received: by 2002:a05:622a:1989:b0:2f1:f23d:729f with SMTP id
 u9-20020a05622a198900b002f1f23d729fmr10194655qtc.137.1650375686900; 
 Tue, 19 Apr 2022 06:41:26 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com.
 [209.85.219.171]) by smtp.gmail.com with ESMTPSA id
 b22-20020a05620a0f9600b0069e8ab5034dsm30847qkn.1.2022.04.19.06.41.26
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 06:41:26 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id g34so31138449ybj.1
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 06:41:26 -0700 (PDT)
X-Received: by 2002:a05:6902:724:b0:644:c37b:4e21 with SMTP id
 l4-20020a056902072400b00644c37b4e21mr14534539ybt.6.1650375686021; Tue, 19 Apr
 2022 06:41:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220419132716.1392407-1-arnd@kernel.org>
In-Reply-To: <20220419132716.1392407-1-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Apr 2022 15:41:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUW+jPUJzdJ-xWQYxDy4SMJ1PDFbFDsBk9Km-+EObgsvA@mail.gmail.com>
Message-ID: <CAMuHMdUW+jPUJzdJ-xWQYxDy4SMJ1PDFbFDsBk9Km-+EObgsvA@mail.gmail.com>
Subject: Re: [PATCH] [v2] m68k: coldfire: drop ISA_DMA_API support
To: Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Finn Thain <fthain@linux-m68k.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux MMC List <linux-mmc@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Greg Ungerer <gerg@linux-m68k.org>
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

On Tue, Apr 19, 2022 at 3:27 PM Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> After a build regression report, I took a look at possible users of
> CONFIG_ISA_DMA_API on m68k and found none, which Greg confirmed. The
> CONFIG_GENERIC_ISA_DMA option in turn is only needed to implement
> ISA_DMA_API, and is clearly not used on the platforms with ISA support.
>
> The CONFIG_ISA support for AMIGA_PCMCIA is probably also unneeded,
> but this is less clear. Unlike other PCMCIA implementations, this one
> does not use the drivers/pcmcia subsystem at all and just supports
> the "apne" network driver. When it was first added, one could use
> ISA drivers on it as well, but this probably broke at some point.
>
> With no reason to keep this, let's just drop the corresponding files
> and prevent the remaining ISA drivers that use this from getting built.
>
> The remaining definitions in asm/dma.h are used for PCI support.
>
> Link: https://lore.kernel.org/lkml/9e5ee1c3-ca80-f343-a1f5-66f3dd1c0727@linux-m68k.org/
> Cc: Greg Ungerer <gerg@linux-m68k.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2: drop GENERIC_ISA_DMA as well, add some background on CONFIG_ISA.

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
