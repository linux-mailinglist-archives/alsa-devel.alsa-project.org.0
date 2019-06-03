Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A35A32921
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 09:09:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A21EB1660;
	Mon,  3 Jun 2019 09:09:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A21EB1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559545797;
	bh=oYXQPAp6uyQkzP2Nt18c9kF101Go3OIJvhu9a1F3k5I=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OCubRePyPIWht8yU1UC6fwOWY6P3Xp3Wn0JchR53TV6OACryO+6FWo4a81DPDFgJT
	 uKf3JLO1h/BpfAKZE0RRw5xCkCY6wvKaUFYk5AVoo9luyDmGCZPhndnkT6RNahtwGS
	 Wc+JEmhJMytOcaPGqRM/M86EsZdi8SJ7jEF3AxKg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A1C7F896ED;
	Mon,  3 Jun 2019 09:08:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41CA9F896DD; Mon,  3 Jun 2019 09:08:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89ABDF80774
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 09:08:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89ABDF80774
Received: by mail-lj1-f196.google.com with SMTP id h11so15139265ljb.2
 for <alsa-devel@alsa-project.org>; Mon, 03 Jun 2019 00:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WQJinh/xC2bOeYFsYlUlkNYdlsn0JSMzJ6+7ugAlLz8=;
 b=NegaiOR9ybf9GL7EA90YbwSApp1G7PmH/Hf5Akc3jOpXhyOXB8m7ySKrE8nj9SzC3T
 bJM2reueb5Bk7ZIdTDG1lT8O2uJNhC8PVrTmPys8BeH+bqc4g1vIHeaq1B7sQM2QkhF6
 2nkT8xA73qFLVvAY9hVI56LuX4ag0cDaQhnlMW9atoJiFE516CevT1jo3Uag0Odw2qrD
 OvNBSKIqLNc/2V8w/f86CLnDk6Y1sH5SiyBL8rpalWW07VtxLRu2I6qCrx5qhyWOmxp9
 JTerdZtkbcdpgCBBnpvkWUmx32JlOebzntTpsrETBbxaHiZ3DkwhsJlNU0Mq+ovxSChc
 dxjw==
X-Gm-Message-State: APjAAAWvlKGFmT5A6jzZrABnzyTiUVxoPVbkVygT+t5x6xOTn9AUwukt
 OP+BFb/n9pSd5p97VvvuM8imBYY90wOirKWtBj4=
X-Google-Smtp-Source: APXvYqypxYOxQMw1wVILyzLBXGz+DJuPq5TH5W+toycfqpB93xioye3d2NaNp9HP84cOJVmXrpIamDZiegLE7qs7sEM=
X-Received: by 2002:a2e:91c5:: with SMTP id u5mr1410332ljg.65.1559545686497;
 Mon, 03 Jun 2019 00:08:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190601032242.10405-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190601032242.10405-1-yamada.masahiro@socionext.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 3 Jun 2019 09:07:54 +0200
Message-ID: <CAMuHMdXXbEr=oU0amKLbEkTm3cZ=jyQuk1-aZa5L4JL_dUmYMw@mail.gmail.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Kees Cook <keescook@chromium.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Takashi Iwai <tiwai@suse.com>,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joe Perches <joe@perches.com>, linux-spdx@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [alsa-devel] [PATCH] treewide: fix typos of
	SPDX-License-Identifier
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Yamada-san,

On Sat, Jun 1, 2019 at 5:24 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Prior to the adoption of SPDX, it was difficult for tools to determine
> the correct license due to incomplete or badly formatted license text.
> The SPDX solves this issue, assuming people can correctly spell
> "SPDX-License-Identifier" although this assumption is broken in some
> places.
>
> Since scripts/spdxcheck.py parses only lines that exactly matches to
> the correct tag, it cannot (should not) detect this kind of error.
>
> If the correct tag is missing, scripts/checkpatch.pl warns like this:
>
>  WARNING: Missing or malformed SPDX-License-Identifier tag in line *
>
> So, people should notice it before the patch submission, but in reality
> broken tags sometimes slip in. The checkpatch warning is not useful for
> checking the committed files globally since large number of files still
> have no SPDX tag.
>
> Also, I am not sure about the legal effect when the SPDX tag is broken.
>
> Anyway, these typos are absolutely worth fixing. It is pretty easy to
> find suspicious lines by grep.
>
>   $ git grep --not -e SPDX-License-Identifier --and -e SPDX- -- \
>     :^LICENSES :^scripts/spdxcheck.py :^*/license-rules.rst
>   arch/arm/kernel/bugs.c:// SPDX-Identifier: GPL-2.0
>   drivers/phy/st/phy-stm32-usbphyc.c:// SPDX-Licence-Identifier: GPL-2.0
>   drivers/pinctrl/sh-pfc/pfc-r8a77980.c:// SPDX-Lincense-Identifier: GPL 2.0
>   lib/test_stackinit.c:// SPDX-Licenses: GPLv2
>   sound/soc/codecs/max9759.c:// SPDX-Licence-Identifier: GPL-2.0
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Thanks for your patch!

>  drivers/pinctrl/sh-pfc/pfc-r8a77980.c | 2 +-

For the sh-pfc change:
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
