Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D062772AEA
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jul 2019 11:00:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 645EF1931;
	Wed, 24 Jul 2019 10:59:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 645EF1931
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563958807;
	bh=e59SFLtQUwoF/0N1TyQG5qkkIBhs3dDTUwuexRldf+s=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p6l3sE8l01eCfL5MXAt/+eSnmdnUDU8kM2pH4+mxTWmjKzYI4t50kfgZDMBLTObSJ
	 fgMAlxZxe9CRUoqBsrsPu5pWc7iJrHQ4jmqR090HQMqYLSxQl7mYrcxSvTmF1UBuyc
	 Xji/Yo4EaV/eY0LGNmEeRSsg3aBPTxFmHVyUpJwU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C39F6F803D6;
	Wed, 24 Jul 2019 10:58:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB641F803D1; Wed, 24 Jul 2019 10:58:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8600F800E8
 for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2019 10:58:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8600F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gKSuVhkA"
Received: by mail-wr1-x442.google.com with SMTP id x4so46012805wrt.6
 for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2019 01:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+RGbZm1eciu20PQ8K6tF6H+QNRIWNrVYIPAsS3IZOGw=;
 b=gKSuVhkAPXEHjSfyv7hCFaAwcimAC12QQb//SoVNMVfDYgdlJh0/u6za13CaJi1KNK
 Yhe88wKGs1Fbw0gsRtEV6VwOjTePgaWP/LBYhE4HSiflOGU6ocw7DnSkFBw1tJ2s0VSx
 tEydSi1ZE1R1YiURro6utx0GyKHQRRMB0pLSWCLDMj9Qyx6eY+pyAW1J5EfnmGFYg3bF
 SrnWQ9tzbl4Kj2f79Yhig7nDPqX6Dnvre4xtHcPQyGLjuYeL78NLKifDFMaFaJUSHVOw
 RK/dqeONWggH88EXgWfSIM15ssSrMYL82V7or3/mdcA2sb8ZPv5NlG+UwtSmYOB0Mxhd
 bZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+RGbZm1eciu20PQ8K6tF6H+QNRIWNrVYIPAsS3IZOGw=;
 b=j/aEoYEynQjJJcs1sXEJTM+C32WdA3pBC3U+7RAfKHHJhK8557thG8CBabXwNR3JlP
 sIOWjuCzoL+VBueDluhrByA7oMISWiF1f0xhDLIfZtCbTDvx2hiayOWPKi55yd1EMySV
 WW7AYHfE5go/2lX9m/v9+lv5kIHLuznPvD7hzl0lw5x/q9jt67YGhTSRvBTZTu8t/5u6
 RieArWVO1m8K79Ge2m1oLXE2o3wFGA3J0fVspD+LbR99/QVgLRzlj7yJ0ddIfTW2al/Z
 bSh58CPHUMu6wEydGmKuibZ6oz3j5y7e7ikO5UqZzod2DHTCp9g2QNRJPfSxl+wRkbge
 JvWw==
X-Gm-Message-State: APjAAAW8QLpt1L45FnWxVZJH9rfGvVeCVRbTQTDGB3rlSDsa50Z9fjSA
 b2B7hBu9wdtlHy+ntL17h4g4nITjqNXMzul7bc0=
X-Google-Smtp-Source: APXvYqyPfV+wRoNminVBPIYU0k3mTByronNa0d5GsaFz0875MLgxFgsfvzSD0QjUkklYPTRcf4r/DD3UHxMnXvpGh2w=
X-Received: by 2002:adf:db46:: with SMTP id f6mr35916182wrj.212.1563958695456; 
 Wed, 24 Jul 2019 01:58:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190722124833.28757-1-daniel.baluta@nxp.com>
 <20190722124833.28757-6-daniel.baluta@nxp.com>
 <1563800148.2311.9.camel@pengutronix.de>
In-Reply-To: <1563800148.2311.9.camel@pengutronix.de>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 24 Jul 2019 11:58:04 +0300
Message-ID: <CAEnQRZB+g0pmv_Kkf37Vj_Ln_gPSc6cq77yAZQQ+9yUzhhMT5A@mail.gmail.com>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 "S.j. Wang" <shengjiu.wang@nxp.com>,
 "Angus Ainslie \(Purism\)" <angus@akkea.ca>, Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 dl-linux-imx <linux-imx@nxp.com>, Viorel Suman <viorel.suman@nxp.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [alsa-devel] [PATCH 05/10] ASoC: fsl_sai: Add support to enable
 multiple data lines
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

On Mon, Jul 22, 2019 at 3:58 PM Lucas Stach <l.stach@pengutronix.de> wrote:
>
> Am Montag, den 22.07.2019, 15:48 +0300 schrieb Daniel Baluta:
> > SAI supports up to 8 Rx/Tx data lines which can be enabled
> > using TCE/RCE bits of TCR3/RCR3 registers.
> >
> > Data lines to be enabled are read from DT fsl,dl_mask property.
> > By default (if no DT entry is provided) only data line 0 is enabled.
> >
> > Note:
> > We can only enable consecutive data lines starting with data line #0.
>
> Why is the property a bitmask then? To me this sounds like we want to
> have the number of lanes in the DT and convert to the bitmask inside
> the driver.

Actually my comment might be wrong. I have read the documentation again
and it seems that: We can only enable consecutive data lines
*ONLY* if combine mode is enabled.

Thus, if combine mode is disabled we can independently enable any data
line. I will clarify this with IP owner and correct the patch accordingly.

>
> > > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> > ---
> >  sound/soc/fsl/fsl_sai.c | 10 +++++++++-
> >  sound/soc/fsl/fsl_sai.h |  6 ++++--
> >  2 files changed, 13 insertions(+), 3 deletions(-)
> >
> > diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> > index 768341608695..d0fa02188b7c 100644
> > --- a/sound/soc/fsl/fsl_sai.c
> > +++ b/sound/soc/fsl/fsl_sai.c
> > @@ -601,7 +601,7 @@ static int fsl_sai_startup(struct snd_pcm_substream *substream,
> >
> > >     regmap_update_bits(sai->regmap, FSL_SAI_xCR3(tx),
> > >                        FSL_SAI_CR3_TRCE_MASK,
> > > -                      FSL_SAI_CR3_TRCE);
> > > +                      FSL_SAI_CR3_TRCE(sai->soc_data->dl_mask[tx]);
> >
> > >     ret = snd_pcm_hw_constraint_list(substream->runtime, 0,
> > >                     SNDRV_PCM_HW_PARAM_RATE, &fsl_sai_rate_constraints);
> > @@ -887,6 +887,14 @@ static int fsl_sai_probe(struct platform_device *pdev)
> > >             }
> > >     }
> >
> > > +   /* active data lines mask for TX/RX, defaults to 1 (only the first
> > > +    * data line is enabled
> > +      */
>
> Comment style not in line with Linux coding style.

Will fix. Thanks Lucas for review.
Should be like this, right?
/*
 * comment
 */

checkpatch.pl warned me only about the end of the comment :).
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
