Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B483B50B944
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 15:56:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A9131816;
	Fri, 22 Apr 2022 15:55:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A9131816
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650635790;
	bh=eFdO01VtCckAVg6Fzq0HhUu+tFlhXF5eNuzk7TqfMaI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rFM5L9c6qaLX42Zm7kkb2h6FQTeBdvo75PArHY4kn4f34Tad6LrmfOKl+iLsjjyiO
	 TF62sFhdl+hJz0WRvybMkJ7tGAAC9F3Gn3pvAL3lQLGY+ZQq6avktw2KF2uA+s/XCA
	 k146dDzQmIkrLV38YJINeu/r4gqrTmLOq5OAq3DI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44D24F80C6D;
	Fri, 22 Apr 2022 15:32:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4E9BF8032D; Thu, 21 Apr 2022 17:29:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 387CDF80279
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 17:29:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 387CDF80279
Received: from mail-wr1-f45.google.com ([209.85.221.45]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MLyvH-1nPcLu2Hjd-00Hx6Z for <alsa-devel@alsa-project.org>; Thu, 21 Apr
 2022 17:29:19 +0200
Received: by mail-wr1-f45.google.com with SMTP id b19so7178224wrh.11
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 08:29:19 -0700 (PDT)
X-Gm-Message-State: AOAM531AbLxCe2o5ZeAHCdftcXHnJU1Jp4jGGZ183btiV674BxfoMWWW
 /RzXDKRw6FS+2Ahb7dbTbTjJNGto3S/p65uk94w=
X-Google-Smtp-Source: ABdhPJxKpospiPlAgrLUewrHWmh0snRbQc7E1OFrJMr7NkFWoVWNdjC/+qxZuhyVxJOjyOGXkiqrvZW6ZgPa03gRamE=
X-Received: by 2002:adf:e106:0:b0:20a:b31b:213d with SMTP id
 t6-20020adfe106000000b0020ab31b213dmr199757wrz.219.1650554959163; Thu, 21 Apr
 2022 08:29:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org>
In-Reply-To: <20220419163810.2118169-1-arnd@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 21 Apr 2022 17:29:03 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1s_8_hfZdFN9-H_PoCMQSjhYcaS3peDqc7LWBUj_YqbA@mail.gmail.com>
Message-ID: <CAK8P3a1s_8_hfZdFN9-H_PoCMQSjhYcaS3peDqc7LWBUj_YqbA@mail.gmail.com>
Subject: Re: [PATCH v2 00/48] ARM: PXA multiplatform support
To: Robert Jarzmik <robert.jarzmik@free.fr>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:lAW6y4LoAAhXNevxm4+BYx6+rcjVGNSK5woFK8cEQqEAVoo3/7O
 9+japdVAYA89LWNMJmIJn3GFkEqErldgXZnNZ99ORRhAItFbJ6njUqe+FtHr0gDnTZnIQKg
 La+oN6Nxz4e7zIh2ImHD5FzBWIm7kNcn1ttdavosI8aoJzCsVf9oBkiZ1W2cAQGuP8oU6YK
 3+7TADtxdk9Cdcws+g7sg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:AzxSQGaHV1g=:qk3sjXLnZbVDuf8jZtZpDF
 K+yxt30fVt+RzKjXsAIfHVHIczlHsgdFavFw/N5DDTyJVI8WJFHsupJkIlxPLRsuGVM0gD9ja
 /BSzDHj9cZ4GGILw+QESszf5j5P2cX1g4GlszW8D8Rd7JAMKyPc0YlQ9KTPbKTea3s8VxZaPF
 HERtuTl3sSao7vHDzzvFihzk2kWlKy2dKLzhhdV4OnlN/QgUTMHQh+ToIRckzotZkhPdSKR4s
 QCY2Ern4qEZddPMR+EX1LZDhvQOPh5B2YUNlipzhoC6RMM4Mrg1fHD+JTwdi9/M33oyL98DVs
 AMeprIeajfJqKbN49O5A0mynDQxo2Kr/DNqlGI17Zmo15xgnB4W0IS711wRn84ZfC5jX6EcX4
 VvkdHy5x9OPm+MQVbWAgXAK4n+s/7KcsFxWGRbbBWllU5eLE4OsLRYdtGyMeM/ch2ZNaqAkjS
 ALPxH61H+ige0twnJcJHUlCFcBE/hW4FHdsmf7lmVDoIIZLCVVQtXZu7JFfV4mUvgRAJrS0M/
 WHTysjFHGbY/PKBWQR41ak4cVwxKWzYLSPrdJQ4JsNdyoRFKn9FiTy8neQw1fk/psoEaBFVkv
 /cttrmiU5DppnXJyS6DWpYZm57ouMDUtw2w3mgcQkZQmSnVwVSLm+aa22m1Oma2k5vT+OcMNV
 TJX3h0s1v7oHdTXHDCWc3tB1TVcb21WJzJf3TrLEIUSoxLC0myRP72xVFuFR5HHKUsSYzFgJz
 qhWRK0Zul6kFP6bNM3+w3ap4oUA1Bxu5PpY/Hjab1kU68DLtcQxIXh5zOlwpm5ZbUVSZauJFd
 3ynehcUZT7Kp1Dkf7A13wnhtlkYHGSzK89cTyNyP9aOcIZ0Y+s=
X-Mailman-Approved-At: Fri, 22 Apr 2022 15:31:41 +0200
Cc: Ulf Hansson <ulf.hansson@linaro.org>, USB list <linux-usb@vger.kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Sergey Lapin <slapin@ossfans.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 IDE-ML <linux-ide@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>,
 Philipp Zabel <philipp.zabel@gmail.com>, linux-clk <linux-clk@vger.kernel.org>,
 linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org,
 Helge Deller <deller@gmx.de>, Marek Vasut <marek.vasut@gmail.com>,
 Paul Parsons <lost.distance@yahoo.com>,
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Linux PM list <linux-pm@vger.kernel.org>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Mark Brown <broonie@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Daniel Mack <daniel@zonque.org>
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

On Tue, Apr 19, 2022 at 6:37 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> This revisits a series I sent a few years ago:
>
> https://lore.kernel.org/lkml/20191018154052.1276506-1-arnd@arndb.de/
>
> All the other ARMv5 conversions are under way now, with
> OMAP1 being the only one still not in linux-next yet,
> and PXA completing the set.
>
> Most of the patches are unchanged from before, furtunately
> the PXA code is fairly stable. I addressed Robert's comments,
> pulled in two patches from Dmitry, and added the last a the
> final four patches to finish off the multiplatform conversion.
>
> I hope someone is left to test these on PXA: if this works,
> I'd like to merge it for 5.19. A git tree with these is available
> for testing at
>
> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/log/?h=pxa-multiplatform-5.18

I have updated the branch based on the feedback I got, and
done a preliminary merge into the for-next branch, so this work
should show up in linux-next. I expect to rebase this particular
branch before the merge window, to add further Acks or
fix regressions in place. (I don't do this for the other branches).

Let me know if there are any show-stoppers or patches that need
more work. I realize that this is a lot to review and that there is
limited reviewer bandwidth as most of the original developers
have moved on from PXA a long time ago.

       Arnd
