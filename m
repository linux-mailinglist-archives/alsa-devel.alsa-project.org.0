Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F1E170FFB
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Feb 2020 06:12:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D2F81693;
	Thu, 27 Feb 2020 06:11:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D2F81693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582780340;
	bh=4nD5h+GTMtWo3PzuCs03UW3x2LKEkPxAs4mDOI7V6Og=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Pla2idzcV51OobFe700bzosX4CSz7ck4iEoy7QRgojErk4vaUNHOAuBEk7rQSsV1M
	 Ho92MprLcBBX8utOU5wg2iWIx3W/rk9HMafXusM+FIYnLj5RhKAM3rTgXqUBfdO6IK
	 glCPyxpWEUZmCrhRH3VUL3Cpf+5hSD6GAeHa20A8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 444A4F80143;
	Thu, 27 Feb 2020 06:10:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4965DF800E8; Thu, 27 Feb 2020 06:10:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C26BF800E8
 for <alsa-devel@alsa-project.org>; Thu, 27 Feb 2020 06:10:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C26BF800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="H4jCUaLf"
Received: by mail-qt1-x843.google.com with SMTP id g21so1373448qtq.10
 for <alsa-devel@alsa-project.org>; Wed, 26 Feb 2020 21:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pivyxHSyqwryDPI9Gp60bBQcqgh4EowGAu7KJlQgz8E=;
 b=H4jCUaLfJYUfLLqA3eJUJTu4b5XveFIshSWzC8Y9ln+QPHPxLUrzmrpESy/4akroJp
 Z1nDx07X+MlLtNHzVPHE0eRY5Ki3r78WV31qoXhY51kbpvG/tDwciXC480UedUkCVCLI
 CfSE9KcQk9zWNnCwGGaiXi0+XGAOA+cUPGSLF1Kl8WM911mYZ5WBeZjtQ4p7/trNAmiG
 lee0S5ks436Q82ah/K+yp4MxHyjN4E9/4sbSeYHC8ECGGPVvAIYYtbLsEKwL6P41B1Jg
 5juA7vU9RxBBlarCdwpP1F6wZhIcVRvZZ8LOzUBwNwcutzQsS1no+Zbav7A+e8MY9XBO
 f9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pivyxHSyqwryDPI9Gp60bBQcqgh4EowGAu7KJlQgz8E=;
 b=gs3gHaUYMMt1W8tiajOXV+Y0GRNmsf9mO1C9vHBl0TMXU9gSk6GzU15oZDegKlE2xy
 M/bZocYKzJvrE6u2CydYIM2O0qyJ0GX6j3AabB88s5K1EybUhzQINr1u8Fzg6Cy5cdCZ
 0tbqBf13TJY7V/7peygV6EsjSNkTN1aQpF6YNytetfANE9D1iTTHB9GFkMk4RXFCsP96
 7vqT7OQN0+Y127GqXJgIPGeiolJeYd8KtE/BB4M+5pdHRmDcKsFW6d+S11ARN3Fi1NIv
 GCjGOdgLxcXnEfpS2PS0/h0Da7GDGliVJjrRVnc2vKOhIjj1pdCZf8//mmmJQn0Dp65d
 2Zuw==
X-Gm-Message-State: APjAAAVRWHbHSLVGOONdPFNGoInH0OZv4DZdAJjUb9XnFuBWAtjbPgHb
 GgmSaSuQxDO43MHCS4XxXj6lMdJTP5zMnwfEHGo=
X-Google-Smtp-Source: APXvYqycq8WwBFtqjVUYzXazfM0rpHuJEyxghtCnM5oaWtr3OyjFzAOxbLU+lLoU9oiDrDjLlu176P4wnMzSmLHlnG0=
X-Received: by 2002:ac8:5298:: with SMTP id s24mr2831317qtn.54.1582780230751; 
 Wed, 26 Feb 2020 21:10:30 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582770784.git.shengjiu.wang@nxp.com>
 <ffd5ff2fd0e8ad03a97f6a640630cff767d73fa7.1582770784.git.shengjiu.wang@nxp.com>
 <20200227034121.GA20540@Asurada-Nvidia.nvidia.com>
In-Reply-To: <20200227034121.GA20540@Asurada-Nvidia.nvidia.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 27 Feb 2020 13:10:19 +0800
Message-ID: <CAA+D8AMzqpC35_CR2dCG6a_h4FzvZ6orXkPSYh_1o1d8hv+BMg@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] ASoC: fsl_asrc: Change asrc_width to asrc_format
To: Nicolin Chen <nicoleotsuka@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
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

On Thu, Feb 27, 2020 at 11:43 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Thu, Feb 27, 2020 at 10:41:55AM +0800, Shengjiu Wang wrote:
> > asrc_format is more inteligent variable, which is align
> > with the alsa definition snd_pcm_format_t.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  sound/soc/fsl/fsl_asrc.c     | 23 +++++++++++------------
> >  sound/soc/fsl/fsl_asrc.h     |  4 ++--
> >  sound/soc/fsl/fsl_asrc_dma.c |  2 +-
> >  3 files changed, 14 insertions(+), 15 deletions(-)
> >
> > diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> > index 0dcebc24c312..2b6a1643573c 100644
> > --- a/sound/soc/fsl/fsl_asrc.c
> > +++ b/sound/soc/fsl/fsl_asrc.c
>
> > @@ -600,11 +599,6 @@ static int fsl_asrc_dai_hw_params(struct snd_pcm_substream *substream,
> >
> >       pair->config = &config;
> >
> > -     if (asrc_priv->asrc_width == 16)
> > -             format = SNDRV_PCM_FORMAT_S16_LE;
> > -     else
> > -             format = SNDRV_PCM_FORMAT_S24_LE;
>
> It feels better to me that we have format settings in hw_params().
>
> Why not let fsl_easrc align with this? Any reason that I'm missing?

because the asrc_width is not formal,  in the future we can direct
input the format from the dts. format involve the info about width.

best regards
wang shengjiu
