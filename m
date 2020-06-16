Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E09431FA659
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jun 2020 04:15:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FD01167E;
	Tue, 16 Jun 2020 04:14:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FD01167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592273743;
	bh=DnFVmBL9PVq4A3mCRsexwwHwiYQ6fT0h+6KmkxCOz6k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MBsrcaEVXY5Rboua/5UYw3y/mAieQSSFm6+znvtNGanyI506ZT4hfBAVKhbMFE1qO
	 73U2g/yWmaVOJyxv1q7b7TsT5m1c6cyB5nk4groUQira6EEkblMUxaDYtJKP3/SSgy
	 hcnOr9bVDUntoEP1gvLnktFqvRdkEBycPK+avtfE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C8D1F80232;
	Tue, 16 Jun 2020 04:14:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5D4DF8022B; Tue, 16 Jun 2020 04:13:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65A16F80114
 for <alsa-devel@alsa-project.org>; Tue, 16 Jun 2020 04:13:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65A16F80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="A1eqm0h/"
Received: by mail-qt1-x841.google.com with SMTP id w9so14379109qtv.3
 for <alsa-devel@alsa-project.org>; Mon, 15 Jun 2020 19:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OqI1jdVPVllWwB4NQYQ7J/+T0Dl98wGQyoaCCb+8rkw=;
 b=A1eqm0h/GP6q72tEHOqCab4ATVdq2Q6uLZpx/Xhp71Ro6O7aRDM70rCqh/pOo8KDJH
 mEd9HvSWhmRUpJb4qU2qjhONldNnIvzGrahcL78IuyFLCFH0NhcVX2OOwfZnQfP8uUIs
 d0MCDL9OKYw7Gf/tAJhrOOY5Q+88w57quOY/2iub8KMGuGH4Qz32O0sGo9Zmu02MizsS
 CYJhgr3bwF4T+OQEZM/g2mSFGAxN3y60YgMPad6ONhcXMV0HtNSDfaeMaiSTn3k5s7PP
 cTlZmvd/iY3uIqeVTjbWO89bZxBU51rp/8xfiwMsUTOJW8iliL7xl494ywlyizBFr8FQ
 oY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OqI1jdVPVllWwB4NQYQ7J/+T0Dl98wGQyoaCCb+8rkw=;
 b=rtWjGEPDffYv9eA4WYh1hT6IzJxrL65ILiEeRVyvwb8/D0gzeErA0Fm9bnQMcGnVvf
 IbHTb720heuL6RSX/OjOtiQ9KPOfpm6+LDKi08cYqNkw85JoiGIZkDUZblU+sJsukimZ
 YGCUsR5qeaPsGOOe3n8red48Cwt4b02Rv4zXiP4kprAjizIAK/f3boZE8u27ajB2tma2
 tE7/QTkrtW3ehKa83s5Zb9JBBxzlQ216fvukiQRsh7phCC1SADA8/+5iruOKWNFJtIhL
 WkCcyq0VDzR5MerSmt6CdiNaZy3Qqdq0NnilWddOaK1FJqEyFz9ej7NcHdHnBqfy2xvV
 48xg==
X-Gm-Message-State: AOAM532wew/AjbZayKym8m3dtBF5L0Wo61f+UtzU0OgdYTcsmnQsIQea
 QBDYD2ZQKDN9iDDOlNRov4BiSXRX3A2dr76VhPI=
X-Google-Smtp-Source: ABdhPJz0+0CtDtLJkrHTp624DDNXLfR6VAyFcq0FqatfndTyBO9PgnwuqhUkx4nTwUMpNZlbh82IHvUGvqqfDQyCmlg=
X-Received: by 2002:ac8:f47:: with SMTP id l7mr18674103qtk.292.1592273626671; 
 Mon, 15 Jun 2020 19:13:46 -0700 (PDT)
MIME-Version: 1.0
References: <b5cf5e3cc39c62f6bb3660b7588b037ffc57f780.1592200690.git.shengjiu.wang@nxp.com>
 <20200615230912.GA16681@Asurada-Nvidia>
 <CAA+D8ANK079rFL-_kwYKkn=nvrsBJPHW8bWMTwNCwDVzHt0PdA@mail.gmail.com>
 <20200616015851.GA23235@Asurada-Nvidia>
In-Reply-To: <20200616015851.GA23235@Asurada-Nvidia>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 16 Jun 2020 10:13:35 +0800
Message-ID: <CAA+D8AMnCqzRRXFQ6rENbU5nTSuJpjd58t+Dhh+rpamoHjg7YA@mail.gmail.com>
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

On Tue, Jun 16, 2020 at 9:59 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Tue, Jun 16, 2020 at 09:48:39AM +0800, Shengjiu Wang wrote:
> > On Tue, Jun 16, 2020 at 7:11 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> > >
> > > On Mon, Jun 15, 2020 at 01:56:18PM +0800, Shengjiu Wang wrote:
> > > > For mono channel, SSI will switch to Normal mode.
> > > >
> > > > In Normal mode and Network mode, the Word Length Control bits
> > > > control the word length divider in clock generator, which is
> > > > different with I2S Master mode (the word length is fixed to
> > > > 32bit), it should be the value of params_width(hw_params).
> > > >
> > > > The condition "slots == 2" is not good for I2S Master mode,
> > > > because for Network mode and Normal mode, the slots can also
> > > > be 2. Then we need to use (ssi->i2s_net & SSI_SCR_I2S_MODE_MASK)
> > > > to check if it is I2S Master mode.
> > >
> > > The fsl_ssi_set_bclk is only called when fsl_ssi_is_i2s_master,
> > > though I agree that that line of comments sounds confusing now.
> >
> > Actually I think fsl_ssi_is_i2s_master is not accurate, it just checks
> > the Master mode,  but didn't check the I2S mode.
> >
> > >
> > > > So we refine the famula for mono channel, otherwise there
> > >
> > > famula => formula?
> > >
> > > > will be sound issue for S24_LE.
> > > >
> > > > Fixes: b0a7043d5c2c ("ASoC: fsl_ssi: Caculate bit clock rate using slot number and width")
> > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > ---
> > > > changes in v2
> > > > - refine patch for Network mode and Normal mode.
> > > >
> > > >  sound/soc/fsl/fsl_ssi.c | 15 +++++++++++----
> > > >  1 file changed, 11 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
> > > > index bad89b0d129e..cbf67d132fda 100644
> > > > --- a/sound/soc/fsl/fsl_ssi.c
> > > > +++ b/sound/soc/fsl/fsl_ssi.c
> > > > @@ -678,7 +678,8 @@ static int fsl_ssi_set_bclk(struct snd_pcm_substream *substream,
> > > >       struct regmap *regs = ssi->regs;
> > > >       u32 pm = 999, div2, psr, stccr, mask, afreq, factor, i;
> > > >       unsigned long clkrate, baudrate, tmprate;
> > > > -     unsigned int slots = params_channels(hw_params);
> > > > +     unsigned int channels = params_channels(hw_params);
> > > > +     unsigned int slots;
> > > >       unsigned int slot_width = 32;
> > > >       u64 sub, savesub = 100000;
> > > >       unsigned int freq;
> > > > @@ -688,9 +689,15 @@ static int fsl_ssi_set_bclk(struct snd_pcm_substream *substream,
> > > >       /* Override slots and slot_width if being specifically set... */
> > > >       if (ssi->slots)
> > > >               slots = ssi->slots;
> > > > -     /* ...but keep 32 bits if slots is 2 -- I2S Master mode */
> > > > -     if (ssi->slot_width && slots != 2)
> > > > -             slot_width = ssi->slot_width;
> > > > +     else
> > > > +             /* Apply two slots for mono channel, because DC = 2 */
> > > > +             slots = (channels == 1) ? 2 : channels;
> > > > +
> > > > +     /* ...but keep 32 bits if I2S Master mode */
> > > > +     if ((ssi->i2s_net & SSI_SCR_I2S_MODE_MASK) != SSI_SCR_I2S_MODE_MASTER ||
> > > > +         channels == 1)
> > > > +             slot_width = ssi->slot_width ? ssi->slot_width :
> > >
> > > This looks very complicated...can you review and try mine?
> > > (Basically, take 32-bit out of default but force it later)
> > >
> > > @@ -678,8 +678,9 @@ static int fsl_ssi_set_bclk(struct snd_pcm_substream *substream,
> > >         struct regmap *regs = ssi->regs;
> > >         u32 pm = 999, div2, psr, stccr, mask, afreq, factor, i;
> > >         unsigned long clkrate, baudrate, tmprate;
> > > -       unsigned int slots = params_channels(hw_params);
> > > -       unsigned int slot_width = 32;
> > > +       unsigned int channels = params_channels(hw_params);
> > > +       unsigned int slot_width = params_width(hw_params);
> > > +       unsigned int slots = 2;
> > >         u64 sub, savesub = 100000;
> > >         unsigned int freq;
> > >         bool baudclk_is_used;
> > > @@ -688,10 +689,16 @@ static int fsl_ssi_set_bclk(struct snd_pcm_substream *substream,
> > >         /* Override slots and slot_width if being specifically set... */
> > >         if (ssi->slots)
> > >                 slots = ssi->slots;
> > > -       /* ...but keep 32 bits if slots is 2 -- I2S Master mode */
> > > -       if (ssi->slot_width && slots != 2)
> > > +       if (ssi->slot_width)
> > >                 slot_width = ssi->slot_width;
> > >
> > > +       /*
> > > +        * ...but force 32 bits for stereo audio. Note that mono audio is also
> > > +        * sent in 2 slots via NORMAL mode, so check both slots and channels.
> > > +        */
> > > +       if (slots == 2 && channels == 2)
> > > +               slot_width = 32;
> >
> > slots ==2 && channels ==2 does not mean the I2S Master mode.
> > For LEFT_J, it is also slots =2 & channels = 2, then the slot_width
> > should be params_width(hw_params).
> > and DSP_A/B also supports stereo.
>
> I think you have a point. Then would this condition work?
>
> +       /* ...but force 32 bits for stereo audio using I2S Master Mode */
> +       if (channels == 2 &&
> +           ssi->i2s_net & SSI_SCR_I2S_MODE_MASK == SSI_SCR_I2S_MODE_MASTER)
>
> Similar to yours but the code above it could look straightforward.

I think it should work.
