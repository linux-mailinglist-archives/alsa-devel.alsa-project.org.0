Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DBA25BA2F
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 07:40:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C822B18C0;
	Thu,  3 Sep 2020 07:39:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C822B18C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599111635;
	bh=fuwbIhCeJFjZbxpIwZMmJPs+11W5MZFaxtAlSEmPnsQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e1cCXOhUNdKAt//bJsvoIUCK8OBY/bOETInzMmKf4aIleBxrK5FD6rj+G/PlJLEK9
	 4kMzvWS3gh5+lrRlbsxWxXXLirpHXMjPTxwg7pZK070iwxuJZw8yOZnfUwjJbpN2Ww
	 AU3D5pmLefXkYxjWLNB+ySGjMV89LGncrQ4bR/9Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC576F801DA;
	Thu,  3 Sep 2020 07:38:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D298FF80217; Thu,  3 Sep 2020 07:38:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C243F801DA
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 07:38:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C243F801DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="BlG2wNJP"
Received: by mail-qt1-x842.google.com with SMTP id b3so1036037qtg.13
 for <alsa-devel@alsa-project.org>; Wed, 02 Sep 2020 22:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/srxmXOQUdGOTgQu2IuqE2j58tt26cmpQAGEQoUfF/k=;
 b=BlG2wNJPYLR+rFryCKSetR5cKCniB4g/4HijU9okP0ui0rIsM3wxVymFTj14GFBX6q
 pK5+3rG4FJjOIgBAIpAjbQVoXniXWSV0TdHquceFaLdMTu8y7tro9mpkEiFR+UX5OlXU
 FmrMJRd16wseT1va/r33k5gJEc7XwRoD2CVA8REXK0RmYehVgri6Wsm8Wrsw31hc/BAo
 O+Va8jlRuamwJ81xgknpaV/yP8nR2C2oRaC32NUaqJxSUwmLsvx1W0uTxBP7Tv+NOj5Q
 MyLctmJl7IfP+gDw0n0DhQtOdg4Q3DG6Tm/GmE/zgu9UqsqiPeH5aB0lP77qRuuxhuWq
 8lCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/srxmXOQUdGOTgQu2IuqE2j58tt26cmpQAGEQoUfF/k=;
 b=ihQPIdWa3Kx67TYJXIrKeQqtuIchar7JoeS6LbzwttAnatSkYRxoDnyVlDFvVZ8ADP
 vmW64hdxSkL+1Q54aBEnZ0szkvYX9d2yyUctprr/maFWAPqf7RKeciMBmj3aHW9B0cD8
 kmgZsq6BWT1GF144CnLGEs4JGtq3yK65sT44paR7/ucupTLlbPrao2DEQqiX5LtQOb2K
 9BsXxxADUzr0zmu1ExrQ7KyrEiIpXbMtzgE2XK9NIkPN9j4DVADt8EGoZI8EDSNQagHS
 DZ7YtiI5Pku6J5cK8WG3bsm/BFYr9YL+yPSC7yaIO8qIGKvQQJ7v4xWSS6fWjMq/6Sst
 bkjA==
X-Gm-Message-State: AOAM530mJMfcDbEQWBYb4EUo4RgkaN417wN8pfMPimSJEokLlrYgy5B3
 2Te2j+IojElvkZhCPk1Kp8/QemUrkeozQtUA+Zg=
X-Google-Smtp-Source: ABdhPJzaK6BoZepXoJ10dK0NPS4TvabWN2zlZEZXM5iY2qiaE4SmYwSpCXEsJMm/APS6kZyYQg8zAMlaCjyRxI4OR/8=
X-Received: by 2002:ac8:67ca:: with SMTP id r10mr1883306qtp.54.1599111521573; 
 Wed, 02 Sep 2020 22:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <1599102555-17178-1-git-send-email-shengjiu.wang@nxp.com>
 <20200903034018.GC4517@Asurada-Nvidia>
In-Reply-To: <20200903034018.GC4517@Asurada-Nvidia>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 3 Sep 2020 13:38:30 +0800
Message-ID: <CAA+D8AOJGH77cpbC9dqaE_BES208sgEPDNPWbZ8HGpfom_FoRg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Set SAI Channel Mode to Output Mode
To: Nicolin Chen <nicoleotsuka@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
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

On Thu, Sep 3, 2020 at 11:42 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Thu, Sep 03, 2020 at 11:09:15AM +0800, Shengjiu Wang wrote:
> > Transmit data pins will output zero when slots are masked or channels
> > are disabled. In CHMOD TDM mode, transmit data pins are tri-stated when
> > slots are masked or channels are disabled. When data pins are tri-stated,
> > there is noise on some channels when FS clock value is high and data is
> > read while fsclk is transitioning from high to low.
> >
> > Signed-off-by: Cosmin-Gabriel Samoila <cosmin.samoila@nxp.com>
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
>
> Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
>
> Though one nit inline:
>
> > ---
> >  sound/soc/fsl/fsl_sai.c | 12 ++++++++++--
> >  sound/soc/fsl/fsl_sai.h |  2 ++
> >  2 files changed, 12 insertions(+), 2 deletions(-)
> >
> > diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> > index 62c5fdb678fc..33b194a5c1dc 100644
> > --- a/sound/soc/fsl/fsl_sai.c
> > +++ b/sound/soc/fsl/fsl_sai.c
> > @@ -486,6 +486,12 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
> >
> >       val_cr4 |= FSL_SAI_CR4_FRSZ(slots);
> >
> > +     /* Output Mode - data pins transmit 0 when slots are masked
> > +      * or channels are disabled
> > +      */
>
> Coding style for multi-line comments. Yet, probably can simplify?
>
>         /* Set to output mode to avoid tri-stated data pins */
Ok, will update in v2.

best regards
wang shengjiu
