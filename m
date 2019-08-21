Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E88975EB
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2019 11:21:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D3321607;
	Wed, 21 Aug 2019 11:20:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D3321607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566379269;
	bh=5VC04490V3dXKWvSnNRXttsHopTIG4TCBKIEynHj9dI=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IGcNe1GpXyGc0u5fALwLhpUZem51X2MJLkMGDG7Q7mU91BFBgPU/Hsuxyy5ZkaNkK
	 xQLuFT8v9X/A0p567M8nt5c6c3N3r9DCZYZWPNC+wDOsngGMyw/clwCOEXIrr3EQOE
	 tpSrBXZ7XFd1YJDRCU925/FkumgOQHeDN/7F1BiA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEF40F80322;
	Wed, 21 Aug 2019 11:19:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 737F4F80306; Wed, 21 Aug 2019 11:19:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 777D5F80157
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 11:19:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 777D5F80157
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NmFr7nxD"
Received: by mail-lj1-x241.google.com with SMTP id e24so1429714ljg.11
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 02:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7tEQ31WOSLuQ3JEBF9cV8gIJ36Fz5CZ1Zb7GBPfj32s=;
 b=NmFr7nxDxcBSv+uW4e7+vOU6sf2roLBf2V03NMTBhvA8HsbJuDjuF6SfhiqpB9nTHE
 fR+OaPMsCKLJ7NobySSrkj3ygxdF+UbQFTYp10jJwkYhe3u7d4VDj0SNJHOsgLX2bNKC
 UCj73zuWvfPcmvRIg1dGnFzky8Ud54Lzq3z0YH3+ZD4ZJgK6cC/hcUvBcrx3IpKzxFAW
 AKK+8ukGQkwMaiKxjiW91h3sMTIz5qNaUWdiQAU8rS+YGdVuRqv8VNXbaPlCyHFApjMG
 6rRc9FbKry+rKOrUZtXHAYBymjAL11ozmQrBmF9WdBY2Z3QOKqPBC40ikCNvC/qqv5Gf
 RU5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7tEQ31WOSLuQ3JEBF9cV8gIJ36Fz5CZ1Zb7GBPfj32s=;
 b=YJldXiclBAQKB3uGadwxndECMg/yKs7NccF307jwfmJ6yWqOxQhFA89CQojjNz6f8W
 m9/c+Vaf8JXn7rxE7jc/suN6pVrs9tc+Kny+tHC4B8HJtyjd1ygs4yEM5bHCEJsTJAG4
 gJOjNiU9zZoa6gtGxy2b9HLheQS25991PtAE4ikGrJEw3ApJ2VidZ+tuNPu867jNCBd8
 wqJCGPI3Fhy2FO4eZgPAyn2guDYyqD3c4K676uGmweJDsmP+r11Pf3+/bpF8FZrrqOFV
 al51cFuW7j0RyIwtgxk3HaxddCT5xT5jVdUDl88dMHThltWUqK7i5pMOLk7K6tEmBqwE
 2bmA==
X-Gm-Message-State: APjAAAURHhIAneXcMyoQXnigK1bEVQ4cT6FOFmaSNOaw5Cwqq+SGVyEz
 efMnJbZ2BVVikLXTCgnyf1QYRHi6S4jxc8QmcbY=
X-Google-Smtp-Source: APXvYqyMvMP7WpKv2AQSCUyxhmpTSTKtEUxHamxuC1vWlEJy7y4MvakGKiV9JeryByhHBufUiM7n40VZzjuQKwrf178=
X-Received: by 2002:a2e:5bc6:: with SMTP id m67mr15204586lje.53.1566379158109; 
 Wed, 21 Aug 2019 02:19:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190814060854.26345-1-codekipper@gmail.com>
 <20190814060854.26345-10-codekipper@gmail.com>
In-Reply-To: <20190814060854.26345-10-codekipper@gmail.com>
From: Code Kipper <codekipper@gmail.com>
Date: Wed, 21 Aug 2019 11:19:05 +0200
Message-ID: <CAEKpxB=9NNoZgZoY_GpcEuDYoMUGzb+ATgZOSM64qy9tirC_MQ@mail.gmail.com>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-sunxi <linux-sunxi@googlegroups.com>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "Andrea Venturi \(pers\)" <be17068@iperbole.bo.it>,
 Mark Brown <broonie@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH v5 09/15] clk: sunxi-ng: h6: Allow I2S to
	change parent rate
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

On Wed, 14 Aug 2019 at 08:09, <codekipper@gmail.com> wrote:
>
> From: Jernej Skrabec <jernej.skrabec@siol.net>
>
> I2S doesn't work if parent rate couldn't be change. Difference between
> wanted and actual rate is too big.
>
> Fix this by adding CLK_SET_RATE_PARENT flag to I2S clocks.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

Signed-off-by: Marcus Cooper <codekipper@gmail.com>

> ---
>  drivers/clk/sunxi-ng/ccu-sun50i-h6.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
> index aebef4af9861..d89353a3cdec 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
> @@ -505,7 +505,7 @@ static struct ccu_div i2s3_clk = {
>                 .hw.init        = CLK_HW_INIT_PARENTS("i2s3",
>                                                       audio_parents,
>                                                       &ccu_div_ops,
> -                                                     0),
> +                                                     CLK_SET_RATE_PARENT),
>         },
>  };
>
> @@ -518,7 +518,7 @@ static struct ccu_div i2s0_clk = {
>                 .hw.init        = CLK_HW_INIT_PARENTS("i2s0",
>                                                       audio_parents,
>                                                       &ccu_div_ops,
> -                                                     0),
> +                                                     CLK_SET_RATE_PARENT),
>         },
>  };
>
> @@ -531,7 +531,7 @@ static struct ccu_div i2s1_clk = {
>                 .hw.init        = CLK_HW_INIT_PARENTS("i2s1",
>                                                       audio_parents,
>                                                       &ccu_div_ops,
> -                                                     0),
> +                                                     CLK_SET_RATE_PARENT),
>         },
>  };
>
> @@ -544,7 +544,7 @@ static struct ccu_div i2s2_clk = {
>                 .hw.init        = CLK_HW_INIT_PARENTS("i2s2",
>                                                       audio_parents,
>                                                       &ccu_div_ops,
> -                                                     0),
> +                                                     CLK_SET_RATE_PARENT),
>         },
>  };
>
> --
> 2.22.0
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
