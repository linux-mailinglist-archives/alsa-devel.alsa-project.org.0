Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E632920ED96
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jun 2020 07:33:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 856DE1612;
	Tue, 30 Jun 2020 07:32:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 856DE1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593495201;
	bh=uHSBAoMdPqzqrU8vvSIlj99v/fPVeQCADJiUncZbsB4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SPqH8J3k5UjKGOJ2Tef6YlTJCoynJQLjXh5pYGwRG+773PCFpybdEE1q4pNe9N5rx
	 aS9vpaCTp0q4xzLy+4H2SqL3YIs5yNQb85CxTWUYMtVMvd1tZlvD70JUow+i/Zd2P8
	 5dKlDmJ6M359i75l4iV0epJashYTPjMudAj74SQ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7EECF800EA;
	Tue, 30 Jun 2020 07:31:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EFB1CF801F2; Tue, 30 Jun 2020 07:31:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F74CF80135
 for <alsa-devel@alsa-project.org>; Tue, 30 Jun 2020 07:31:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F74CF80135
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="H/Y2LEm0"
Received: by mail-qt1-x843.google.com with SMTP id e12so14675475qtr.9
 for <alsa-devel@alsa-project.org>; Mon, 29 Jun 2020 22:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RQ4+/e636DjU53ZutFkneDCxV7N9AiA63WewmD4xQRo=;
 b=H/Y2LEm0lur0oZA8cMF+qOfMdmDEufwHt8gopg4rg6MJFdWZkdZjG5EJjRH3nfkJDF
 DKMJqCadNNnqvKBtaN3rHZkQVyKtfXSz4U90upgH1YbAExNl/mdq46fT9HMq7Wd9JQjY
 0kx7V1ODrnNe93ASuiXATDjIk8RNPyGXqBDgrrEwUKHITq9bmkpjSfcpBWjJi6o7mR8L
 MFMgZGfxkogIeoUm2AsGug0PM1LeGfBhG4P9xC3agZ0WkGRyLxJiPRPKjl4nIW5pjQSM
 M4+K92DwUmXuiwAOKUFqO0Vf1wnCac1Gynjv5OLh30l+ftlAydyu9xSZj5WJGqxFcfXS
 o46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RQ4+/e636DjU53ZutFkneDCxV7N9AiA63WewmD4xQRo=;
 b=lRzEYUUIN47jXCPLizuiycynD/FeofFlnbkQSMIhrqmvTz6PcZrY0rzrOzs4WwoPwE
 cEbqJzE+NP9PD0VK7xLvvCagL5H0dVn2uZVkWryQBLyX/py+MXUJkhZSDEUQk4CDu6kv
 +y/DnO4ibYEntUwigflVjeQVf8Lx6oLZlkrAvLHoJaI1zwjSa0c01G3p+1YN7LYE7pgs
 K06jqf82OL00aGmJlysMhRWk1pt8VanFZQ22Lvo7pZUPEaDv29pCRcqOSBVioOlm23KH
 f7AefZnKaiNvpUAnNAuMvoGLtRjb7m0EyvEgKAzWIPcwp+ixTrS0IMotLfBQMawL9oRb
 mqBA==
X-Gm-Message-State: AOAM530acqouCRwPavEvFJ/6uhjBrM1oL8nBFpvrQqqE5+81h4fe8FXV
 1WfVsV31E0IhvqW4bz2jA1cUTxKB+R2fhMjAxkk=
X-Google-Smtp-Source: ABdhPJw/wlWIPyYhzzU13zpDaxH5qYo/b+CmHKJa4nXgPZmta/pNIYYI8YVXbPlxwfzKQtXmUfA37/tLflAUu6/Nsac=
X-Received: by 2002:ac8:33d7:: with SMTP id d23mr19287396qtb.204.1593495086854; 
 Mon, 29 Jun 2020 22:31:26 -0700 (PDT)
MIME-Version: 1.0
References: <1593439115-19282-1-git-send-email-shengjiu.wang@nxp.com>
 <20200629200813.GB27967@Asurada-Nvidia>
In-Reply-To: <20200629200813.GB27967@Asurada-Nvidia>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 30 Jun 2020 13:31:15 +0800
Message-ID: <CAA+D8APOd2MxO08nnK9UE03bMj25fyMfMnF-neBzdyoykbjAKA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_asrc: Add an option to select internal ratio
 mode
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

On Tue, Jun 30, 2020 at 4:09 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Mon, Jun 29, 2020 at 09:58:35PM +0800, Shengjiu Wang wrote:
> > The ASRC not only supports ideal ratio mode, but also supports
> > internal ratio mode.
> >
> > For internal rato mode, the rate of clock source should be divided
> > with no remainder by sample rate, otherwise there is sound
> > distortion.
> >
> > Add function fsl_asrc_select_clk() to find proper clock source for
> > internal ratio mode, if the clock source is available then internal
> > ratio mode will be selected.
> >
> > With change, the ideal ratio mode is not the only option for user.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
>
> > +static int fsl_asrc_select_clk(struct fsl_asrc_priv *asrc_priv,
> > +                            struct fsl_asrc_pair *pair,
> > +                            int in_rate,
> > +                            int out_rate)
> > +{
> > +     struct fsl_asrc_pair_priv *pair_priv = pair->private;
> > +     struct asrc_config *config = pair_priv->config;
> > +     int rate[2], select_clk[2]; /* Array size 2 means IN and OUT */
> > +     int clk_rate, clk_index;
> > +     int i = 0, j = 0;
> > +     bool clk_sel[2];
> > +
> > +     rate[0] = in_rate;
> > +     rate[1] = out_rate;
> > +
> > +     /* Select proper clock source for internal ratio mode */
> > +     for (j = 0; j < 2; j++) {
> > +             for (i = 0; i < ASRC_CLK_MAP_LEN; i++) {
> > +                     clk_index = asrc_priv->clk_map[j][i];
> > +                     clk_rate = clk_get_rate(asrc_priv->asrck_clk[clk_index]);
>
> +                       /* Only match a perfect clock source with no remainder */
>
> > +                     if (clk_rate != 0 && (clk_rate / rate[j]) <= 1024 &&
> > +                         (clk_rate % rate[j]) == 0)
> > +                             break;
> > +             }
> > +
> > +             if (i == ASRC_CLK_MAP_LEN) {
> > +                     select_clk[j] = OUTCLK_ASRCK1_CLK;
> > +                     clk_sel[j] = false;
> > +             } else {
> > +                     select_clk[j] = i;
> > +                     clk_sel[j] = true;
> > +             }
> > +     }
> > +
> > +     /* Switch to ideal ratio mode if there is no proper clock source */
> > +     if (!clk_sel[IN] || !clk_sel[OUT])
> > +             select_clk[IN] = INCLK_NONE;
>
> Could get rid of clk_set:
>
>         for (j) {
>                 for (i) {
>                         if (match)
>                                 break;
>                 }
>
>                 clk[j] = i;
>         }
>
>         if (clk[IN] == ASRC_CLK_MAP_LEN || clk[OUT] == ASRC_CLK_MAP_LEN)
>
> And it only overrides clk[IN] setting but leaving clk[OUT] to
> to the searching result. This means that clk[OUT] may be using
> a clock source other than OUTCLK_ASRCK1_CLK if sel[IN] happens
> to be false while sel[OUT] happens to be true. Not sure if it
> is intended...but I feel it would probably be safer to use the
> previous settings: INCLK_NONE + OUTCLK_ASRCK1_CLK?

ok, will update the patch.

best regards
wang shengjiu
