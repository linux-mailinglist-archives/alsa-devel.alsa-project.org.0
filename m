Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 785CB8D58C
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 16:04:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3D5A1671;
	Wed, 14 Aug 2019 16:03:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3D5A1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565791473;
	bh=0Sk7A2JmGyIriTTaDFUBJ9R5FsaEmIbHCpA860fj4wc=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ITiVnZs94PmBDMiMgRQD5F1TJSrp3E3m4F4r7vDqOnSiBaBQIH04D6t2S6m/3O6WQ
	 33h8rAjFbpoqYVB8MfWYoySo19nqduIe9/vTYGX5mFfcZFvK+95uI6SUN3v6XIH88F
	 O4FN2aUBg7yxWQl5EcnreN7pg893daI303VrRyf4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2171AF80268;
	Wed, 14 Aug 2019 16:02:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74393F80214; Wed, 14 Aug 2019 16:02:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7CE3F8015A
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 16:02:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7CE3F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hdGANqTQ"
Received: by mail-wr1-x441.google.com with SMTP id p17so111192821wrf.11
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 07:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9BCsaT/ypWtdhsmfXKzhWUE99AeirQdOEW2jeMnFuhQ=;
 b=hdGANqTQ9F21qw3u2Ego2JScgA5oHNpiXRoKNozB7yNZReqYDa7LJmrxWHn8/BjFZA
 VJcIcgSCiwFebMJ6Wtunw9n3td5KB8oF2KoPTxrozb5S9wPP2eysU9YFtFwLKO1ILLlG
 jQZKIyxO1J99qglc+9rCgLVT8PBm7dz6RLjVXXvvqyF5mNtqHCr7TVDtUNZuSWfLZIwy
 W7b58nIVz03ZjHRkydJi9TxhYyhV65qrJCm3UPE3NUxx8FS/tXQRvwTOGX92IlEb3a1r
 5d2ZPTWM+Js2wa1jV7NZysCGy2pKT1lHA9sYZZQOb4mAMnJn2ywplnG9+Nf5MB/bPrUr
 cShw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9BCsaT/ypWtdhsmfXKzhWUE99AeirQdOEW2jeMnFuhQ=;
 b=fMjoZDKZExKidFDnS0kAXSnT/O769EiEkIKFeQiRAa/3WyJQAUeYNtjZAGrhgMy7Su
 R1Tx0QtE8KO+TE9PFIfa613hUJOVxl7rRlhRxiszP++Oyq6W1mhOhyLE/IswH8ghouhl
 X0YmFEkNJPVDtGCQnb+g7176SBNFyg7egeoV8jEt/e7sBzpGt+jvA6xJHusOg6yuPpq7
 8vBt+XDiNn6wvxMUdg5D7ilQCSxR6207e/bz/vdnxs4+tTsrutbOhDVzz6qfuNvo0byr
 0lDcMwq3Iw1mQHj+oR0/N7GQS7PojuzpZaZzWoc8dP7fmP7s5g1qqJ9v+wXWUpyxiXJY
 UMkA==
X-Gm-Message-State: APjAAAWo6vJmXjx4vYGqZszJTnXyhrMFgsc6MWhjLBjVX3/fuFWrlRGb
 MSClfMTzEnKilynzKA7WWtWURwW9ZjhShvvM8Xs=
X-Google-Smtp-Source: APXvYqxrhrONJQxS57JXyI89+iJAt6ObBY3ZfCskyIyx9vmteh564auNmoefwSfggsdTluXOxALfO9/LgPUpUfVMun0=
X-Received: by 2002:a5d:4310:: with SMTP id h16mr45630912wrq.212.1565791362736; 
 Wed, 14 Aug 2019 07:02:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190811195545.32606-1-daniel.baluta@nxp.com>
 <20190814013916.GB13398@Asurada-Nvidia.nvidia.com>
In-Reply-To: <20190814013916.GB13398@Asurada-Nvidia.nvidia.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 14 Aug 2019 17:02:31 +0300
Message-ID: <CAEnQRZAQGdci_WtCKHqR-h9zid-COO1FaWWv-MPUkE_sYFszmg@mail.gmail.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Fabio Estevam <festevam@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [alsa-devel] [RFC PATCH] ASoC: fsl_sai: Enable data lines based
	on input channels
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

On Wed, Aug 14, 2019 at 4:39 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Sun, Aug 11, 2019 at 10:55:45PM +0300, Daniel Baluta wrote:
> > An audio data frame consists of a number of slots one for each
> > channel. In the case of I2S there are 2 data slots / frame.
> >
> > The maximum number of SAI slots / frame is configurable at
> > IP integration time. This affects the width of Mask Register.
> > SAI supports up to 32 slots per frame.
> >
> > The number of datalines is also configurable (up to 8 datalines)
> > and affects TCE/RCE and the number of data/FIFO registers.
> >
> > The number of needed data lines (pins) is computed as follows:
> >
> > * pins = channels / slots.
> >
> > This can be computed in hw_params function so lets move TRCE bits
> > seting from startup to hw_params.
> >
> > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> > ---
> >  sound/soc/fsl/fsl_sai.c | 34 +++++++++++++---------------------
> >  sound/soc/fsl/fsl_sai.h |  2 +-
> >  2 files changed, 14 insertions(+), 22 deletions(-)
> >
> > diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> > index 69cf3678c859..b70032c82fe2 100644
> > --- a/sound/soc/fsl/fsl_sai.c
> > +++ b/sound/soc/fsl/fsl_sai.c
>
> > @@ -480,13 +483,17 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
>
> > -     regmap_write(sai->regmap, FSL_SAI_xMR(tx), ~0UL - ((1 << channels) - 1));
> > +     regmap_write(sai->regmap, FSL_SAI_xMR(tx), ~0UL - ((1 << slots) - 1));
>
> Would this break mono channel audio?

Indeed, this isn't good for mono. I see in our internal tree that we
have min(channels, slots).
This would fix mono, let me think if this is really the right solution.

>
> >  static int fsl_sai_dai_probe(struct snd_soc_dai *cpu_dai)
>
> > @@ -881,6 +872,7 @@ static int fsl_sai_probe(struct platform_device *pdev)
> >               return -ENOMEM;
> >
> >       sai->pdev = pdev;
> > +
>
> Seemly unnecessary

Oh, ok. Will fix in next version.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
