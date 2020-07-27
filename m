Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AACB22E5EC
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jul 2020 08:35:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FEE91696;
	Mon, 27 Jul 2020 08:34:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FEE91696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595831721;
	bh=3m2hFBuhO+Y1VlNopcaKLIyJnkVeNxy3chpIXrOo0bw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MMDbNiFmFt86+9ScYDOLhiM2mIIsH0NDBcp0vDzsNnP/XgmITRJ1h9Ap2pcolP/nF
	 GrOcwL1w9WP1qjQJIXr2ElxABVDFcoUXLARt4SRZVHThyPLqEz6o8V4iSjxdIxR/Rh
	 g2OhAkO6t4+JRvRHmkM8k4YZMh/N7+TfOnl+ypbE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CDE0F800AD;
	Mon, 27 Jul 2020 08:33:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D496F80171; Mon, 27 Jul 2020 08:33:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_14,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0400AF8013C
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 08:33:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0400AF8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fb9XUO9z"
Received: by mail-qt1-x844.google.com with SMTP id 6so11459252qtt.0
 for <alsa-devel@alsa-project.org>; Sun, 26 Jul 2020 23:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w03YsC20p+dHNFM0U+uQthrGb6bTfy1HNpPAv/xPssM=;
 b=fb9XUO9zYs7ABnO/X0liXVU0exs845LVf7rzCAGArl4oIBDv6nRZMmTaLM/ad3gxfr
 WxjqZ69tAQlIm5FmiqeZkuPVAJfSDEV+FMiAAuvtJpUM2aAR0g/g/pCReUQikOfSIfUn
 Yonte7RtlVRG7RLZAJgn6vi89u2VC+MUH19PQZUD1dafIYgRzOMpC9pxj0z93j2BgFqA
 B26cuaNWywhMWJTYlfEdX57GNU//HWAZ3MbixzXamt96ER2zJiMBXpKweR2PC6xyepYh
 wI0Jf7tQG79YfUoegG5+Lwp3huwydPO2HasvcGqsiOVgIEsYpumF/InSmusZXpeawmM7
 ZSxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w03YsC20p+dHNFM0U+uQthrGb6bTfy1HNpPAv/xPssM=;
 b=iwYeRA3EVSiikfsKhULaEr505V5bqa1r+jNbTs9BnydSWY19dwuZxBv6uckUA+H8Yh
 oiQzbQ8IAjJsBLfcc0B6vTXGP1fDKoGWnI1ZNTSYBi444QbjBMpXfW2nAGsRy61AdJ4S
 nXjf5ATwQBTNFPVZhYTAmhN80+AUEgWQOSzjdnVNC2dxXP9A9ebXEofVYH8wLr56i/L3
 5z8Ch66TIESdOyRnW2ST1OQSdJ+zRaYXAWNlYjU0XR2AyoCJnwUxpeljeDqVdIFbR6Qv
 ZaedJ6Oi74Dp/LQvb1QCTGJ9YDuKitd27rKLNm6+NV93LXsdWZ7oJMLN4LLAH/wZVtgE
 7Y2g==
X-Gm-Message-State: AOAM533owhHZw1P3I3HzIJP2jtxI++NDDavM3hegRWUm4Xm83XzyntZZ
 rWHaHFdDyAx1sXTIoKw/lP8kZASiyP8saVugvXg=
X-Google-Smtp-Source: ABdhPJxAach4+q/kZpihLnqh0Vmpd7JeL6MA+Nyc9iccYws64hNeTYJWYJ30qASwfI5ZNQ2LrtckCQGMba3t1dGXCXI=
X-Received: by 2002:aed:2946:: with SMTP id s64mr442181qtd.204.1595831609481; 
 Sun, 26 Jul 2020 23:33:29 -0700 (PDT)
MIME-Version: 1.0
References: <1595762417-2190-1-git-send-email-shengjiu.wang@nxp.com>
 <20200727005558.GA30124@Asurada-Nvidia>
In-Reply-To: <20200727005558.GA30124@Asurada-Nvidia>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 27 Jul 2020 14:33:18 +0800
Message-ID: <CAA+D8AOfh1gDec=0BPk6SUutqtY_gL1Rm1-Uc4Dv4s-86LAwPA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl-asoc-card: Remove fsl_asoc_card_set_bias_level
 function
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

On Mon, Jul 27, 2020 at 8:58 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Sun, Jul 26, 2020 at 07:20:17PM +0800, Shengjiu Wang wrote:
> > With this case:
> > aplay -Dhw:x 16khz.wav 24khz.wav
> > There is sound distortion for 24khz.wav. The reason is that setting
> > PLL of WM8962 with set_bias_level function, the bias level is not
> > changed when 24khz.wav is played, then the PLL won't be reset, the
> > clock is not correct, so distortion happens.
> >
> > The resolution of this issue is to remove fsl_asoc_card_set_bias_level.
> > Move PLL configuration to hw_params and hw_free.
>
> Hmm...using set_bias_level() instead of hw_params/hw_free() was
> strongly suggested by Mark when I got imx-wm8962 machine driver
> upstream. So we will need his input here, although I personally
> don't have a problem with it...
>
> > After removing fsl_asoc_card_set_bias_level, also test WM8960 case,
> > it can work.
> >
> > Fixes: 708b4351f08c ("ASoC: fsl: Add Freescale Generic ASoC Sound Card with ASRC support")
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  sound/soc/fsl/fsl-asoc-card.c | 149 +++++++++++++++-------------------
> >  1 file changed, 66 insertions(+), 83 deletions(-)
> >
> > diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
> > index 4848ba61d083..0517dbb3e908 100644
> > --- a/sound/soc/fsl/fsl-asoc-card.c
> > +++ b/sound/soc/fsl/fsl-asoc-card.c
> > @@ -73,6 +73,7 @@ struct cpu_priv {
> >   * @codec_priv: CODEC private data
> >   * @cpu_priv: CPU private data
> >   * @card: ASoC card structure
> > + * @is_stream_in_use: flags for release resource in hw_free
>
> Would love to see something shorter... Could we reuse similar
> one below, borrowing from fsl_ssi driver?
>
>  * @streams: Mask of current active streams: BIT(TX) and BIT(RX)
>
> >  static int fsl_asoc_card_audmux_init(struct device_node *np,
> >                                    struct fsl_asoc_card_priv *priv)
> >  {
> > @@ -611,7 +600,6 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
> >       /* Diversify the card configurations */
> >       if (of_device_is_compatible(np, "fsl,imx-audio-cs42888")) {
> >               codec_dai_name = "cs42888";
> > -             priv->card.set_bias_level = NULL;
>
> Can check if set_bias_level is still being used with this change.

Do you mean to keep this line:
priv->card.set_bias_level = NULL; ?

best regards
wang shengjiu
