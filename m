Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 369422F135C
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jan 2021 14:08:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8D7116DF;
	Mon, 11 Jan 2021 14:07:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8D7116DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610370500;
	bh=ADI0+Mi4lZGXFyg33NjPYSC/4ySofakTg23lOClaknE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=co1CvDXFkivm3V2bkDBoIfUp8MWnu/lTXOV9vvADTRTfwZtAM9uEHf9goNgqt608W
	 tjsiwuqx5rgziRD3UobygWT5ydpCklMCnjHFegeZ9vGuS+7NJ/29mVeICarCZUITNk
	 GHZMunDCFXTw2OtSq5visk5ZMIweGNrNbtP783zY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B209F80290;
	Mon, 11 Jan 2021 14:06:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 167F5F80258; Thu,  7 Jan 2021 09:05:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41A7DF80096
 for <alsa-devel@alsa-project.org>; Thu,  7 Jan 2021 09:04:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41A7DF80096
Received: by mail-ot1-f54.google.com with SMTP id j20so5542149otq.5
 for <alsa-devel@alsa-project.org>; Thu, 07 Jan 2021 00:04:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0TPseVwGCXsOzziJOFXy0csIKxTAA1WaNx2ZI4idEKY=;
 b=cfIB4YjxQyDUao5caxYGKdujMauVYlBzYIm2adfxoaxmP+m3lmFNoOpMOkfF0Ecnq4
 L05a6siJ01tuuAJosPmV+zzTBTbFz2hXz3fnFRQADJbCpSmAA8szQsyAn/TpKwV9DPKo
 OoRvINdOzjRXFXt8F0D2yPVyDK1ZE3BZgSSMQqJbV1amiajsji6J9mnfPAi5dFyKBTt+
 AzjU4Y8lOsd9eirf9urWpfnFo+1EKNUzmMwtCNvfTxFgxWQDy4GZ6PtE4UcCDwSNYD01
 915k6ItkfWTM5TdFohiCcEM/EGYTVbANKisQWYXbz5VSR6JQNfqTaY16NdnzsRnv3mAB
 eYMw==
X-Gm-Message-State: AOAM5314bfcOS5K+9HX89zxOrMo4uG7eITfRY3guWDD2mQwoCvMekdca
 kiIRBuwfi/+os0leUq1fA1swuUBccKYLRYMLq8w=
X-Google-Smtp-Source: ABdhPJzVAPf8/NQQQzT3zzrkoDzUv+P+SG+XgCFUWTKsU/u1ByX8ezoz8GuB2nVGz7LNk3BFgEKDp8LcWHb42uaO/Sc=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id
 u26mr5905584oth.250.1610006693990; 
 Thu, 07 Jan 2021 00:04:53 -0800 (PST)
MIME-Version: 1.0
References: <CAMuHMdX=trGqj8RzV7r1iTneqDjWOc4e1T-X+R_B34rxxhJpbg@mail.gmail.com>
 <20210106184839.GA7773@alpha.franken.de>
 <CAMuHMdV86BES7dmWr-7j1jbtoSy0bH1J0e5W41p8evagi0Nqcw@mail.gmail.com>
 <20210107.101729.1936921832901251107.anemo@mba.ocn.ne.jp>
In-Reply-To: <20210107.101729.1936921832901251107.anemo@mba.ocn.ne.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 Jan 2021 09:04:43 +0100
Message-ID: <CAMuHMdX6ptaO3r=b55zqwrrK8ADfSRWdunwHA5DYD08PMCAPaA@mail.gmail.com>
Subject: Re: [PATCH 00/10] Remove support for TX49xx
To: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 11 Jan 2021 14:06:42 +0100
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, "R,
 Vignesh" <vigneshr@ti.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-ide@vger.kernel.org,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-rtc@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>, Richard Weinberger <richard@nod.at>,
 Jakub Kicinski <kuba@kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Matt Mackall <mpm@selenic.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 netdev <netdev@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 linux-spi <linux-spi@vger.kernel.org>, Vinod <vkoul@kernel.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 dmaengine <dmaengine@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>
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

Hi Nemoto-san,

On Thu, Jan 7, 2021 at 2:18 AM Atsushi Nemoto <anemo@mba.ocn.ne.jp> wrote:
> On Wed, 6 Jan 2021 21:41:24 +0100, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >> > Is that sufficient to keep it?
> >>
> >> for me it is. But now we probaly need some reverts then...
> >
> > Indeed. Fortunately not all of it, as some removals were TX4938-only.
>
> These patches should not break RBTX4927:
>
>   net: tc35815: Drop support for TX49XX boards
>   spi: txx9: Remove driver
>   mtd: Remove drivers used by TX49xx
>   char: hw_random: Remove tx4939 driver
>   rtc: tx4939: Remove driver
>   ide: tx4938ide: Remove driver

Indeed.

> And these patches just break audio-support only.
>
>   dma: tx49 removal
>   ASoC: txx9: Remove driver
>
> I think dma and ASoC drivers are hard to maintain now, and can be
> dropped for basic support for RBTX4927.
> (TX39 boards does not have audio-support, so dma txx9 driver can be
> dropped too)

Agreed, I don't test audio anyway, but I know it used to work (I had
intended to use the board as an MPD media server, but never got beyond
the prototyping phase).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
