Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D19C9F7472
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Nov 2019 14:01:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65B651680;
	Mon, 11 Nov 2019 14:01:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65B651680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573477318;
	bh=8cfwEH3c2ioWdahz4aLIJVEoJL8fTVyFtK1JFPY5Tg8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=msLTOfNdr7TCPNlksQ3mXx0/7rS+t1pzW8UVw3kaEZNc4EmjtPwYlSJ1btU9H4pcY
	 VYFrK0lvUuXVGn6Cq2T5SiMnJjZl89ZVfksraQ008YvwfoQksHZMGekSJj7MdqxtjI
	 79HIa9101qiAVNOpE9gzyRimpZcCsHexHyUtZb3U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E75A0F80519;
	Mon, 11 Nov 2019 14:00:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D2E5F8053A; Mon, 11 Nov 2019 14:00:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9706EF804FF
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 14:00:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9706EF804FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gQIErTu0"
Received: by mail-wr1-x444.google.com with SMTP id p4so14522356wrm.8
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 05:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gEDRS3N08vMM5wC2R3aZvV9f5xQTSZhcB9bk4IB+bq0=;
 b=gQIErTu0/oszN8lDTz1psUNEDcAdWbU40K8KqpgGYE1+FklD6DWKZARx4jvikbe8hI
 IUbjoTaI7RCucaVZnq9rr+j5jZLuDrtmXsUZ9BjPrKScB1qgY6eLW1z4JLxu/dm2lv2/
 W4vok6LKeW+En4DLuNrPzcUwt48cyFCOmyuko9OkG3X0dRsdhoVovl1BFuzxIh2ydWB8
 tIU7Ygpzc6KjprZLKofyo2NkgvMsjaS7NQ0y81q/kdqNQihyTqzvSiYS64Ys/GRpmbDS
 2Z5q3nwlkf58Hrj2efnLn2nz/0P5TeevFXbfciBBR7nI2Z1xegr1gfkNjIEyflKNDXtc
 lw6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gEDRS3N08vMM5wC2R3aZvV9f5xQTSZhcB9bk4IB+bq0=;
 b=nndhtUFc01qyaSlE02S/IQNhFzHsw8Xs4I8QQKHAIk0pWbAO5vcZAHTQQHisIt44ZW
 /gvtsa7O5dKnQ6LTi5aELzP312Trt4ON/kNax+lg4eVb8EMWztCr8+Hn0WWJ/D+mk2qP
 gl6emr0/I+O6YQSJrb62X97uJG/DCGbYWbGHFKtWn+B6jCtd4graGT6c/YLKlGankx3P
 yjVf3k5dTejDNi4iiotII2WObCyu+HvsIKDsEmki3E5uuX8rU1ReU9Sp9Qe/9bNit02a
 vUrZcsuNOvFUKwQkJ+ZtLOXBehKK3v5ZIq3GrIo1sjW1V/unaKCirgsZyUOQO7gPCnSu
 J+ng==
X-Gm-Message-State: APjAAAVP6OIf/vEXl2aA5H+tXrqR85nFrynA6mGAloLoq8+69jib8OPm
 GMCRXEyaltFEdLAQNcUljQe/SgTurcEPU19DYkSuzBWQ
X-Google-Smtp-Source: APXvYqxJ8vep/IViuTx4QDVZatw0xHW0xWFo1DYsgxKISpGkP73DqHjKUsinqUDVA+MkD9zjNn8i2eYD0XNxvyZ4khk=
X-Received: by 2002:a5d:5306:: with SMTP id e6mr18900931wrv.187.1573477200508; 
 Mon, 11 Nov 2019 05:00:00 -0800 (PST)
MIME-Version: 1.0
References: <AM0PR04MB6468D4D15E471940B1906344E3780@AM0PR04MB6468.eurprd04.prod.outlook.com>
In-Reply-To: <AM0PR04MB6468D4D15E471940B1906344E3780@AM0PR04MB6468.eurprd04.prod.outlook.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 11 Nov 2019 14:59:49 +0200
Message-ID: <CAEnQRZBfOCH-R-QmY2gB5jEehea1Cn+RnyOkOhMj8=ZJoOADBg@mail.gmail.com>
To: "S.j. Wang" <shengjiu.wang@nxp.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Takashi Iwai <tiwai@suse.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: fsl_audmix: Add spin lock to protect
	tdms
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

On Thu, Nov 7, 2019 at 8:54 AM S.j. Wang <shengjiu.wang@nxp.com> wrote:
>
> Hi
> >
> > Hi Shengjiu,
> >
> > Comments inline.
> >
> > On Wed, Nov 6, 2019 at 9:30 AM Shengjiu Wang <shengjiu.wang@nxp.com>
> > wrote:
> > >
> > > Audmix support two substream, When two substream start to run, the
> > > trigger function may be called by two substream in same time, that the
> > > priv->tdms may be updated wrongly.
> > >
> > > The expected priv->tdms is 0x3, but sometimes the result is 0x2, or
> > > 0x1.
> > >
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > ---
> > >  sound/soc/fsl/fsl_audmix.c | 6 ++++++  sound/soc/fsl/fsl_audmix.h | 1
> > > +
> > >  2 files changed, 7 insertions(+)
> > >
> > > diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
> > > index c7e4e9757dce..a1db1bce330f 100644
> > > --- a/sound/soc/fsl/fsl_audmix.c
> > > +++ b/sound/soc/fsl/fsl_audmix.c
> > > @@ -286,6 +286,7 @@ static int fsl_audmix_dai_trigger(struct
> > snd_pcm_substream *substream, int cmd,
> > >                                   struct snd_soc_dai *dai)  {
> > >         struct fsl_audmix *priv = snd_soc_dai_get_drvdata(dai);
> > > +       unsigned long lock_flags;
> > >
> > >         /* Capture stream shall not be handled */
> > >         if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
> > > @@ -295,12 +296,16 @@ static int fsl_audmix_dai_trigger(struct
> > snd_pcm_substream *substream, int cmd,
> > >         case SNDRV_PCM_TRIGGER_START:
> > >         case SNDRV_PCM_TRIGGER_RESUME:
> > >         case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> > > +               spin_lock_irqsave(&priv->lock, lock_flags);
> >
> > Why do we need to disable interrupts here? I assume that lock is only
> > used in process context.
> >
> It is in atomic context, so I think it is ok to disable interrupt.

All right thanks for the explanation. Added my Reviewed-by to v2.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
