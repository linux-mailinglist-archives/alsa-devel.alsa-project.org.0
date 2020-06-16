Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D578C1FA5BE
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jun 2020 03:50:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D6A21679;
	Tue, 16 Jun 2020 03:49:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D6A21679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592272246;
	bh=HiUxlRK7Ib7hRVNc2wg/SCQLGElm8hgaGFULgZiyx0k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bBI9sfUCThgcsJLcTvaNyjWxr+9DyBjNdUOR9vx+9kYfCdQefAlKgCWrlYu12pY19
	 xrDah0bIBlopN9MNCXPYQ+OkCUBEDqehjBJ1SQwu+rHGjhfRjkoLzIPbP/GxAtccdm
	 8ZKj38wZ9fJhWX8FbY2WJ+nLuIrwkHbbipKFnmGI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9858FF80217;
	Tue, 16 Jun 2020 03:49:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C229FF8022B; Tue, 16 Jun 2020 03:49:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00A07F80101
 for <alsa-devel@alsa-project.org>; Tue, 16 Jun 2020 03:48:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00A07F80101
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="X0b+d+p0"
Received: by mail-qk1-x741.google.com with SMTP id c14so17738602qka.11
 for <alsa-devel@alsa-project.org>; Mon, 15 Jun 2020 18:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u39E1LRrzCgMjU0O0Sb+j+YNM1W21dC73lEMxQ1Nkk4=;
 b=X0b+d+p0yRaEoImOfb10lbGhdmGfwUbYyTgUQLPymmole9zr7N5Ifz/RPoVX+hKW67
 ThlRaD0xNIhqfWhEorglmF0IHhgLHAQRZzdZRGsy8AXBsQcKCJ+YNsxSgKuT4Ke4z5fZ
 fuCOZ0rOwxh7qUxktLJJll/oWHG99UDKTntOjFVBcYevefZT6rEehvAvUVb5DYRfTkRN
 EHZCcEjhzkKOVElCtklv4kOXr7NeUMfH7Dd9jhUwqdtI41NZx0uwg4nk/CaAwmyqP4y5
 Elh8u4O6s5WyDuJfBUu+uCNJPpBZ/nWdQ4DKTTtndfbLW5+YEEp2iWCts6j04x8s5p7w
 xxgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u39E1LRrzCgMjU0O0Sb+j+YNM1W21dC73lEMxQ1Nkk4=;
 b=dEv/5Uk6Sxv2QhTVEHusl5cutMd+5HJLLtP9ZRI8HT+GzW052FTx039n+zKZvyRKMh
 SoC5nOJaygjNBOWDK2HHKLbZbYV52UzNZ2m1FjzIoNSnJYmQ5sx+cOOcaY49bgp1ZkQl
 D9AorfaLy2/nJ9F7t0nQzrFFqPAuwFU1dVdDK8FH4EWd6JGkBJpFSYeKBAK38yBUIs2T
 5GB3EzxU80aEceMtb91qhYnjzhHJP88aqDM2V12jx3q3KeNkX/ucO+H3Vtv0WJxUesuF
 7Q43ir4KKdhGZAFQskA6LVG4Km/tImL6Jyc6njJdfJSDOOCxf6Rf5pvxDNQZWqyg1E68
 OIIg==
X-Gm-Message-State: AOAM533M5+BXGpspa/kwa3LyAu+jUw9G/G4bSKYhTC6++LREnA9Oi+mg
 TSPyek9SAfRKFBgP6KybeGrydKINC+idxMTX/Ug=
X-Google-Smtp-Source: ABdhPJxUShOl3senI5evzMaIEbkeYfSdHaFU3btpJUGX2lUgo8jR8CctqYgFxkr/oCvPrixqJqyTtt/+71x7W8C6AXE=
X-Received: by 2002:a37:8a43:: with SMTP id m64mr17567223qkd.37.1592272130680; 
 Mon, 15 Jun 2020 18:48:50 -0700 (PDT)
MIME-Version: 1.0
References: <b5cf5e3cc39c62f6bb3660b7588b037ffc57f780.1592200690.git.shengjiu.wang@nxp.com>
 <20200615230912.GA16681@Asurada-Nvidia>
In-Reply-To: <20200615230912.GA16681@Asurada-Nvidia>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 16 Jun 2020 09:48:39 +0800
Message-ID: <CAA+D8ANK079rFL-_kwYKkn=nvrsBJPHW8bWMTwNCwDVzHt0PdA@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: fsl_ssi: Fix bclk calculation for mono channel
To: Nicolin Chen <nicoleotsuka@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
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

On Tue, Jun 16, 2020 at 7:11 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Mon, Jun 15, 2020 at 01:56:18PM +0800, Shengjiu Wang wrote:
> > For mono channel, SSI will switch to Normal mode.
> >
> > In Normal mode and Network mode, the Word Length Control bits
> > control the word length divider in clock generator, which is
> > different with I2S Master mode (the word length is fixed to
> > 32bit), it should be the value of params_width(hw_params).
> >
> > The condition "slots == 2" is not good for I2S Master mode,
> > because for Network mode and Normal mode, the slots can also
> > be 2. Then we need to use (ssi->i2s_net & SSI_SCR_I2S_MODE_MASK)
> > to check if it is I2S Master mode.
>
> The fsl_ssi_set_bclk is only called when fsl_ssi_is_i2s_master,
> though I agree that that line of comments sounds confusing now.

Actually I think fsl_ssi_is_i2s_master is not accurate, it just checks
the Master mode,  but didn't check the I2S mode.

>
> > So we refine the famula for mono channel, otherwise there
>
> famula => formula?
>
> > will be sound issue for S24_LE.
> >
> > Fixes: b0a7043d5c2c ("ASoC: fsl_ssi: Caculate bit clock rate using slot number and width")
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> > changes in v2
> > - refine patch for Network mode and Normal mode.
> >
> >  sound/soc/fsl/fsl_ssi.c | 15 +++++++++++----
> >  1 file changed, 11 insertions(+), 4 deletions(-)
> >
> > diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
> > index bad89b0d129e..cbf67d132fda 100644
> > --- a/sound/soc/fsl/fsl_ssi.c
> > +++ b/sound/soc/fsl/fsl_ssi.c
> > @@ -678,7 +678,8 @@ static int fsl_ssi_set_bclk(struct snd_pcm_substream *substream,
> >       struct regmap *regs = ssi->regs;
> >       u32 pm = 999, div2, psr, stccr, mask, afreq, factor, i;
> >       unsigned long clkrate, baudrate, tmprate;
> > -     unsigned int slots = params_channels(hw_params);
> > +     unsigned int channels = params_channels(hw_params);
> > +     unsigned int slots;
> >       unsigned int slot_width = 32;
> >       u64 sub, savesub = 100000;
> >       unsigned int freq;
> > @@ -688,9 +689,15 @@ static int fsl_ssi_set_bclk(struct snd_pcm_substream *substream,
> >       /* Override slots and slot_width if being specifically set... */
> >       if (ssi->slots)
> >               slots = ssi->slots;
> > -     /* ...but keep 32 bits if slots is 2 -- I2S Master mode */
> > -     if (ssi->slot_width && slots != 2)
> > -             slot_width = ssi->slot_width;
> > +     else
> > +             /* Apply two slots for mono channel, because DC = 2 */
> > +             slots = (channels == 1) ? 2 : channels;
> > +
> > +     /* ...but keep 32 bits if I2S Master mode */
> > +     if ((ssi->i2s_net & SSI_SCR_I2S_MODE_MASK) != SSI_SCR_I2S_MODE_MASTER ||
> > +         channels == 1)
> > +             slot_width = ssi->slot_width ? ssi->slot_width :
>
> This looks very complicated...can you review and try mine?
> (Basically, take 32-bit out of default but force it later)
>
> @@ -678,8 +678,9 @@ static int fsl_ssi_set_bclk(struct snd_pcm_substream *substream,
>         struct regmap *regs = ssi->regs;
>         u32 pm = 999, div2, psr, stccr, mask, afreq, factor, i;
>         unsigned long clkrate, baudrate, tmprate;
> -       unsigned int slots = params_channels(hw_params);
> -       unsigned int slot_width = 32;
> +       unsigned int channels = params_channels(hw_params);
> +       unsigned int slot_width = params_width(hw_params);
> +       unsigned int slots = 2;
>         u64 sub, savesub = 100000;
>         unsigned int freq;
>         bool baudclk_is_used;
> @@ -688,10 +689,16 @@ static int fsl_ssi_set_bclk(struct snd_pcm_substream *substream,
>         /* Override slots and slot_width if being specifically set... */
>         if (ssi->slots)
>                 slots = ssi->slots;
> -       /* ...but keep 32 bits if slots is 2 -- I2S Master mode */
> -       if (ssi->slot_width && slots != 2)
> +       if (ssi->slot_width)
>                 slot_width = ssi->slot_width;
>
> +       /*
> +        * ...but force 32 bits for stereo audio. Note that mono audio is also
> +        * sent in 2 slots via NORMAL mode, so check both slots and channels.
> +        */
> +       if (slots == 2 && channels == 2)
> +               slot_width = 32;

slots ==2 && channels ==2 does not mean the I2S Master mode.
For LEFT_J, it is also slots =2 & channels = 2, then the slot_width
should be params_width(hw_params).
and DSP_A/B also supports stereo.
