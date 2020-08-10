Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E28924039E
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Aug 2020 10:52:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6E421663;
	Mon, 10 Aug 2020 10:51:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6E421663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597049535;
	bh=Muwqp58nFxGSe/rxtwJHMXTSB8FGZF7wIdgKL/IiZhE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CEtA1iHXlLW3kJoTIVLpqXHZBDzyGuf30NODznrPeFkPedGrhz2+I6lch5azmYkyc
	 OYVAY+9eA/UtuwFeWXA2T9xleQTc5CJo8wzZMBeI/ldg4gs8aXzhpkAFLJVffcr++q
	 fQizJZjDKDRPotLBfkiqhbP9iD+kBI1NFuhGWkSQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFDF5F8022D;
	Mon, 10 Aug 2020 10:50:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E544F8022B; Mon, 10 Aug 2020 10:50:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 310EDF800BC
 for <alsa-devel@alsa-project.org>; Mon, 10 Aug 2020 10:50:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 310EDF800BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="de+5jf2K"
Received: by mail-qt1-x841.google.com with SMTP id w9so6152622qts.6
 for <alsa-devel@alsa-project.org>; Mon, 10 Aug 2020 01:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nd+KGdIV03ZDNVLVq/+Q/ATX3ww0wvxrVThg94dncCE=;
 b=de+5jf2K1ZqwDSsbSIkMiHfDdBuBPN1wwq2KpeqVKD3Dn8C++08xSBeuzhqHRqsh3k
 A//1yK1EsW31DJmZQg8bOZfon/fjhmRXanUEY81Nd+9akPoto21VQQFBH+5ySmgasI8v
 6O1mIDiPj1QpwalGOW1HlLJCva8THeH7PcceRnSnH3OHEKgvJWV8AXR8D3nz6bhvo9V6
 1S+n+IMWxrUWwbrDnPdsOlYiw7pX6UikVtIqgzqHJdyrGDuQmdIiXyr6KS3ICvA3SF2Q
 0Um8jB4/ps3KjbdgcNMbxXrkeW64BxD+atuwdFxHO7d2KQ9R75OJ+HIfLu4QpXR61Vfs
 U+RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nd+KGdIV03ZDNVLVq/+Q/ATX3ww0wvxrVThg94dncCE=;
 b=qsB55KqooLpSZyehkD/T8YGScWNwO4lX7WIVLSV/AwmRgzpUVo1/6aTgybnnL8ACxX
 TOx8slj2xTwpFwua80ZSZiAdEmHoyD59P+yuTJUpO6NLVaNjqbnKrV9vMzSe8RYQi0g6
 +qImuELQznEhwd5GG0T46OMyyAEaMG/I2uo5nvDZBRgxfSUFqaqW2ogMYUzN0N9hfawo
 TX91sWO6CMNOB3K85fS7qBjg4SXc9uWVhtCVwAo+6L1yf/Iuhbqn7u5b1hk4ffigRkUk
 JrEFTgaMK2r7zVDGVEsvfA3zS6zRhvV4FIy7e/QeUhFjwWsGmepho3jCI/n29V1FAykw
 swow==
X-Gm-Message-State: AOAM531D3aBeF7JC0aO/mEEzkLMFC6FWxyOnfzmSprHaeERWuE1wXY+Q
 nMr2hCTqpI5Rq0MxJrPmEiB8EWWjOp5UlXxlU6g=
X-Google-Smtp-Source: ABdhPJwQZN3wjUk9e2RerROvjSA6KbTeAzJFLgIrN6bfeIV50G58IGJM27E6joMW6fVh+7DW7jJ1yMB19OH8aYMwSRo=
X-Received: by 2002:ac8:6d0f:: with SMTP id o15mr25763620qtt.121.1597049421042; 
 Mon, 10 Aug 2020 01:50:21 -0700 (PDT)
MIME-Version: 1.0
References: <1597047103-6863-1-git-send-email-shengjiu.wang@nxp.com>
 <20200810083728.GA7560@Asurada-Nvidia>
In-Reply-To: <20200810083728.GA7560@Asurada-Nvidia>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 10 Aug 2020 16:50:10 +0800
Message-ID: <CAA+D8ANmEMnRR1N4QRh7y4=+XUpKYnXRQ4LRKw6VG=totd8rwA@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: fsl-asoc-card: Get "extal" clock rate by
 clk_get_rate
To: Nicolin Chen <nicoleotsuka@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>
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

On Mon, Aug 10, 2020 at 4:39 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Mon, Aug 10, 2020 at 04:11:43PM +0800, Shengjiu Wang wrote:
> > On some platform(.e.g. i.MX8QM MEK), the "extal" clock is different
> > with the mclk of codec, then the clock rate is also different.
> > So it is better to get clock rate of "extal" rate by clk_get_rate,
> > don't reuse the clock rate of mclk.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> > changes in v2
> > - add defer probe handler
> >
> >  sound/soc/fsl/fsl-asoc-card.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
> > index 52adedc03245..32f8f756e6bb 100644
> > --- a/sound/soc/fsl/fsl-asoc-card.c
> > +++ b/sound/soc/fsl/fsl-asoc-card.c
> > @@ -696,6 +696,17 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
> >                       goto asrc_fail;
> >               }
> >       } else if (of_node_name_eq(cpu_np, "esai")) {
> > +             struct clk *esai_clk = clk_get(&cpu_pdev->dev, "extal");
> > +
> > +             if (!IS_ERR(esai_clk)) {
> > +                     priv->cpu_priv.sysclk_freq[TX] = clk_get_rate(esai_clk);
> > +                     priv->cpu_priv.sysclk_freq[RX] = clk_get_rate(esai_clk);
>
> Will it break existing imx-audio-cs42888 on older i.MX platforms?
> 'cause it overwrites cpu_priv.sysclk_freq[] that are set in "card
> configurations" section.

Tested,  no break for imx6.

best regards
wang shengjiu
