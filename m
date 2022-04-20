Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D77D508498
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Apr 2022 11:11:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7C111A48;
	Wed, 20 Apr 2022 11:10:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7C111A48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650445891;
	bh=WHx3jxT1JXMyMJmJmEvAqFj3/tZa9Ogcbl+pGHk4Auw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qeWucj4AIfZ5nTlS6CkfO60YLU2gS2LE6xqfNlgZT96n/1VzaJLdSzGhXEVI2GVM3
	 uAU7bNbOEh6bCPEHwGAWOV9lBXQ/BEp/UqTWG8ezAkmRRioNU1FGK9zHRqo6YFO3Bp
	 rLlPqQI3mlsMjSSSYzoDv2aVUvugMLgRSw1SeBJA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26C86F800C1;
	Wed, 20 Apr 2022 11:10:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB60DF80125; Wed, 20 Apr 2022 11:10:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B813F8010B
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 11:10:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B813F8010B
Received: from mail-wr1-f41.google.com ([209.85.221.41]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MuVOM-1nxwW20QUM-00rV4A for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022
 11:10:24 +0200
Received: by mail-wr1-f41.google.com with SMTP id g18so1306253wrb.10
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 02:10:23 -0700 (PDT)
X-Gm-Message-State: AOAM530xCxWosSAXXHcYfWtPDjbxPcVjc9kKb8HkR7d9QYutmSgAKw8x
 ZMUS/znfPhY7yDMzem4cZtud0CLCRylgnnJvofc=
X-Google-Smtp-Source: ABdhPJwtLOp969nuzl2HcHrjTrE/8+7taAszNCD7/wMyEv6mWoZB/KbZc5q+V3PBrcZaYVxcH5WclGOcWViagO5a7ww=
X-Received: by 2002:a5d:6389:0:b0:207:a7d8:2b64 with SMTP id
 p9-20020a5d6389000000b00207a7d82b64mr14665624wru.12.1650445823721; Wed, 20
 Apr 2022 02:10:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220420084249.2186634-1-arnd@kernel.org>
In-Reply-To: <20220420084249.2186634-1-arnd@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 20 Apr 2022 11:10:07 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1mBdcGxV1nP15nY7sVfjya_VEeS78M5KQHjw66Kg+=Kg@mail.gmail.com>
Message-ID: <CAK8P3a1mBdcGxV1nP15nY7sVfjya_VEeS78M5KQHjw66Kg+=Kg@mail.gmail.com>
Subject: Re: [PATCH] [v3] m68k: coldfire: drop ISA_DMA_API support
To: Greg Ungerer <gerg@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:UBVedNgcbeAPFWD2FWO+B6tZrxrQ0grmr77pRsJCExpUsGmhDYD
 bCFHQg7s2lSY+aSR6eOFv5GYhZYFDDyE9tLXZRLZ/XXcqFAMpO2Plyh9eQ6PGlns+sgCOpp
 ZDQHz375fXsNTAt8aEK9YeGgY5mJsPnD0xZDThzcmzd28f0mfpS/TJ86Wto7J5vIgC11bIg
 9hNM8EFnGxy0DrSfBYenw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9Y7PYAI/LOo=:qO6cDnsvNoZmO3IACcZUoD
 EMhHz/NDC1B6SJG7TSiMXzoNjDE5ywHuAEabcf0yOiHIs0lbVb5G8xYOJhdgDf0sVBL5DYvbL
 Znnmuoa54yTCXOl2kpH7XFVfzjZP6Mggxeaos1aToeo4EG8gUcftoBgpFMLwXRJqKiIuTVNS2
 e3/KddvO4QIbWh7TtN1vwE/Ul1wJJ8uKgdv1uEo2/kiID3XkX0pRXjbHK3ioO6vCxYzf4jb2Z
 sPKmMceVAXZa/21BKdUvwTlsPwlWs/ApG7ueFJo418BxrXHxoJNiyz6tce+uR+7i/H18y22XD
 NPMRZP52BBUWQOJfVnXP4wO9bf+i91+7rIqq4sOT/1JNDEjpZfC8/iRv/lTkJ3alHOfRGMg/8
 e9HMyWX+NFOmmvjklqh6qqieIZJFZG497TpqKWxYa3d2frrcft85Wy93grQ/ikSHVWsYXz+Hs
 SGVOUdQaYnx6P7Hq79XFtk6obvWev/aGQ70DywEBS1nYbCMAsxryPggDz8q0AIqxaN3hkYjGt
 +wAKfqgqALX9FxEgjD8L8ixaiLf0HN9KVL1oTylUFImqMPb/ETKwkOGr02neuMnz1w7Ioglm7
 U5vgbu0yFi3TrpvBorkMjGXgzqXttkzDp36IEeOjKOyuNda5tuYOaFyStMM8102GbhEpX3u2G
 pwvAHq/UOOwggqBII2++vMLNPKzmZDK3gvaWc08A9n+2nZLMGeDhjQvXehEdbNE4YY3M=
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>
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

On Wed, Apr 20, 2022 at 10:42 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
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
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Acked-by: Ulf Hansson <ulf.hansson@linaro.org> # For MMC
> Acked-by: Greg Ungerer <gerg@linux-m68k.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Nevermind, this is the same as before, I forgot the 'git add' for the trivial
Makefile change.

       Arnd
