Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE47B232C81
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jul 2020 09:25:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 674651758;
	Thu, 30 Jul 2020 09:25:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 674651758
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596093953;
	bh=7xXoRZSe4Wsba5NdLSVhuFP6Sj3I1rSbHc6OeTXvYbQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tbx7+fq+kdbNgn8TKUzn2RkNC5cj444qhjRp95llMKN08bCXFPj0LsACv5X9kpP0X
	 szGkMjR0uZy9SKSpTT5UD7IO5dNpwp1LJjQziY4me5ErENXRKpFt58wgnbVxfDn582
	 /9Cob69TWGBcefkXpsfwbjw66zDoFLdbcBOgSqWA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C451F80111;
	Thu, 30 Jul 2020 09:24:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E978FF80111; Thu, 30 Jul 2020 09:24:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_14,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDF0CF80111
 for <alsa-devel@alsa-project.org>; Thu, 30 Jul 2020 09:23:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDF0CF80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="HXYQQMgf"
Received: by mail-qt1-x844.google.com with SMTP id v22so13728076qtq.8
 for <alsa-devel@alsa-project.org>; Thu, 30 Jul 2020 00:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UONcGtH87E3a5kjHLIWiuODkuzooKxlCqVfEhVFntOs=;
 b=HXYQQMgfzlVEj3WUkqkBrSxkEmTJohgn7cWeafHTC4o/k0JKSoPBxzLQZWVlUdWtSb
 /nP2n5lgXaR5sD9xSWYxzj4aw05lcL0G8vj1vYgxB5qViOBgNbPKMdj7Jfg+/recddQE
 xCgbYFo3KRM/t5/hPKE5YXNb3NYWa4OVLfs+HJ2WWSOyU8m1y4rXbZLUUruYm0QY6pd3
 shQtNvR2f9mvm8rok3XR5Aoj2nzJaqEIYlSXhjZX4d2Tnz1pDr2AKkBwHAANzATN5iDs
 TQFsqc3+O/EmhKFxilWouZ5mFNL2M9Vcib5o7lGLIeDAP4uCBujIJXoJwzXkIGVd7ehd
 xl5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UONcGtH87E3a5kjHLIWiuODkuzooKxlCqVfEhVFntOs=;
 b=KScoHxOraG5RhGGSYqtDDLWai5/jirhI7eepscLpB+scGlPej8YS27eL1G176vt6nl
 ZZ8oxU620u/ASWEpBsRvbAf5X5crv3r70q1CALsSAsCQmXMXYh7ZQ7C3Egwmp1liTtPy
 DGEVLaN6pT5yibVm4xjrmk15KgqmYfkOhj/GSs//gUOhUl7Px+mBaZSg4jfs8w+BZLkd
 F+Z9azw0ACYIJLplXmG4hHtNiQaPu40Ty4vD7mOt/y/dwMqmnGh/QnZ81ujWT0kBPWo2
 6Rio94ThLgnH6ncljhMfeDhEIkoSVtj3zy0EiE9Y1ug4QkasfKkAIhaCcV8IUuf6GPsd
 lSQQ==
X-Gm-Message-State: AOAM530X73MnKsQLUjkOPCga7883ued2mtXfUXac2urytXFTXfzHicJ9
 JAeRs6DoZEgapcRsucnM6Z23LQpJvzJSMuWcA94=
X-Google-Smtp-Source: ABdhPJwyTxUPfHh/W6tv9g29pHFtPJF1Ko5E5uzGhYAwkdfNZ3VBu0oUQIo+AE2x1GxX7qRobBU900hB2OKzukb53L4=
X-Received: by 2002:ac8:6d0f:: with SMTP id o15mr1543191qtt.121.1596093838176; 
 Thu, 30 Jul 2020 00:23:58 -0700 (PDT)
MIME-Version: 1.0
References: <1595762417-2190-1-git-send-email-shengjiu.wang@nxp.com>
 <20200727005558.GA30124@Asurada-Nvidia>
In-Reply-To: <20200727005558.GA30124@Asurada-Nvidia>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 30 Jul 2020 15:23:47 +0800
Message-ID: <CAA+D8AMiarV+FovE8ZTTe8zagSz8-XDcck7Z4W2TfbOvzgrLpw@mail.gmail.com>
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

will send v2 for this change.

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
