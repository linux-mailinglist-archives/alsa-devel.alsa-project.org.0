Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B061489D0E
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jan 2022 17:05:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 002D21898;
	Mon, 10 Jan 2022 17:04:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 002D21898
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641830705;
	bh=9DSwb6DPXJEmil7DzBN1gdlsXvBxlf6zynBkyUh+JAM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H+SV77vtuRBdB5gYmYs4Z/smdJvBPal8jztpqVwXU4Le94ku0NkQxm6FI0OCJItRk
	 J6d828MC48RMM3v6+KJCxzrZOF4VPl8UHRaIZFs5dDFEVNfee2Vk2JnDFeWhL+Js+r
	 88bXd8V0Q/NJ7dFU0mE60WfM/uSDRnsyiztXdWjc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53BF6F80134;
	Mon, 10 Jan 2022 17:03:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE9F2F8012E; Mon, 10 Jan 2022 17:03:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06D36F800B6
 for <alsa-devel@alsa-project.org>; Mon, 10 Jan 2022 17:03:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06D36F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qfg98qt3"
Received: by mail-yb1-xb2d.google.com with SMTP id v186so29910297ybg.1
 for <alsa-devel@alsa-project.org>; Mon, 10 Jan 2022 08:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iNiCbDbHCeiPxM6ovkMLFr7g6s8ppuv8iXRHsUZEvME=;
 b=qfg98qt32yG91fw8s7UPN9F3sFioZ8oUdRJHyJBA5pRV78LhF7a2X8j+H3A6SLii1V
 nUq0V2Zx7iD4KgzhR4yiCe/byQVGeWqoZ+BRfPu6jiUtTMGXfVyKECswCx10/wosZbay
 DPsTjQQKR0jewr4iEWe6OXN/mXAf+4tzdYsgB/ONq4P3BrF2atPN6uDMCJD4INIj0S7m
 8OWaFE2AH39kuVGr/zTgddR9pfLIrpjPnEZhakZqb3Brp4Nqjun2grw3zYNy5eOq9YKw
 rPWwjxLCKP1N4E6Sj6RXW/2KierivtTXrpLD7jK8eQQLEhVVEp/Ym+FHEB93Li4LCn4R
 8QuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iNiCbDbHCeiPxM6ovkMLFr7g6s8ppuv8iXRHsUZEvME=;
 b=zAzsIEwPDANqTT5Itpix3WeB+oGPbCYP2Yxsv0k6GKCltKlDxZ4L9G+1YlL0exz+1I
 hCJGYKDrb582rnJglyYCEgd2FJ9wb7BCfG6GiUyhmYPxCa1l/6+FcZCCBpS+4JKD05/r
 VHMfJr/bdCBFPkjp+PUoIjkkDihF5i8z2iQJjJHpCE/bycGwUE6s/SMYpjwSjvX5CwT0
 fwBY6EET/d9eI4e7Oxl/vS9PIT+iDWEl2hlfTlRVhNryMhOl872fP+8FnoBT4PCTphjO
 F9xW1cCIfWcVtnRFKtjwZOlqO00Uha8LMrVQcSN/j1hBOijwJnRjVEaKKVt5ucsResRd
 /68Q==
X-Gm-Message-State: AOAM531FTh+Wo7rmtWcnUSJnxjZMTl+7tImTydy3t1GFfihi1dKjWeFC
 pMTx6epkmuKRIS0LA6hUAiLIte6YoZYe+1UX0qI=
X-Google-Smtp-Source: ABdhPJzCMeCtb/Dbwxm9+cgpq4Flh/z7O0LjVZI4c1yWTSjd1phU0uJUpCUoEAPrDxgd4MxB/NIePuffqUN6WPw6Myo=
X-Received: by 2002:a25:874a:: with SMTP id e10mr320498ybn.422.1641830623591; 
 Mon, 10 Jan 2022 08:03:43 -0800 (PST)
MIME-Version: 1.0
References: <20220110094711.8574-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220110094711.8574-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <2f338a37-f2ca-33e4-284e-5d263f7b93da@intel.com>
In-Reply-To: <2f338a37-f2ca-33e4-284e-5d263f7b93da@intel.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 10 Jan 2022 16:03:17 +0000
Message-ID: <CA+V-a8vz25B=cw_C4YMBRdDxeq7mi8Zc+noqpdHqfMP8eNHYFg@mail.gmail.com>
Subject: Re: [PATCH 1/5] ASoC: sh: rz-ssi: Drop calling rz_ssi_pio_recv()
 recursively
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Pavel Machek <pavel@denx.de>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Takashi Iwai <tiwai@suse.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>
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

Hi Cezary,

Thank you for the review.

On Mon, Jan 10, 2022 at 3:48 PM Cezary Rojewski
<cezary.rojewski@intel.com> wrote:
>
> On 2022-01-10 10:47 AM, Lad Prabhakar wrote:
> > Instead of recursively calling rz_ssi_pio_recv() use a while loop
> > to read the samples from RX fifo.
>
> Recursion and loops are means for doing something repeatedly. Could you
> specify _why_ such change was made i.e. the conversion from one method
> into the other? I bet the code is not being changed for the sake of
> changing it, the reason is simply missing in the commit message.
>
I had feedback from Pavel "recursion is unwelcome in kernel due to
limited stack use." which I did agree with as a result I have come up
with this patch. Also to add this driver will later be used on Renesas
RZ/A2 SoC's which runs with limited memory.

> Please note that refactoring below function into while-loop has a side
> effect: everything had to be indented by additional tab. Generally,
> readability increases if function is shaped 'linearly'.
>
I do agree, my initial patch just added a jump back to the start of
the function if there are more samples, but Biju suggested to use a
while loop instead.

> > This also fixes an issue where the return value of rz_ssi_pio_recv()
> > was ignored when called recursively.
> >
> > Fixes: 03e786bd4341 ("ASoC: sh: Add RZ/G2L SSIF-2 driver")
> > Reported-by: Pavel Machek <pavel@denx.de>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >   sound/soc/sh/rz-ssi.c | 68 ++++++++++++++++++++++---------------------
> >   1 file changed, 35 insertions(+), 33 deletions(-)
> >
> > diff --git a/sound/soc/sh/rz-ssi.c b/sound/soc/sh/rz-ssi.c
> > index fa0cc08f70ec..37466f65c2b0 100644
> > --- a/sound/soc/sh/rz-ssi.c
> > +++ b/sound/soc/sh/rz-ssi.c
> > @@ -411,54 +411,56 @@ static int rz_ssi_pio_recv(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
> >   {
> >       struct snd_pcm_substream *substream = strm->substream;
> >       struct snd_pcm_runtime *runtime;
> > +     bool done = false;
> >       u16 *buf;
> >       int fifo_samples;
> >       int frames_left;
> > -     int samples = 0;
> > +     int samples;
> >       int i;
> >
> >       if (!rz_ssi_stream_is_valid(ssi, strm))
> >               return -EINVAL;
> >
> >       runtime = substream->runtime;
> > -     /* frames left in this period */
> > -     frames_left = runtime->period_size - (strm->buffer_pos %
> > -                                           runtime->period_size);
> > -     if (frames_left == 0)
> > -             frames_left = runtime->period_size;
> >
> > -     /* Samples in RX FIFO */
> > -     fifo_samples = (rz_ssi_reg_readl(ssi, SSIFSR) >>
> > -                     SSIFSR_RDC_SHIFT) & SSIFSR_RDC_MASK;
> > -
> > -     /* Only read full frames at a time */
> > -     while (frames_left && (fifo_samples >= runtime->channels)) {
> > -             samples += runtime->channels;
> > -             fifo_samples -= runtime->channels;
> > -             frames_left--;
> > -     }
> > +     while (!done) {
>
> I wonder if converting this into do-while isn't a better option. Maybe
> I'm missing something but 'done' flag seems to be changed only as an
> outcome of the last if-statement (last step) in this entire procedure.
> Perhaps condition from said if-statement could also be moved into
> 'while' portion of do-while loop.
>
Agreed.

> > +             /* frames left in this period */
> > +             frames_left = runtime->period_size -
> > +                           (strm->buffer_pos % runtime->period_size);
> > +             if (!frames_left)
> > +                     frames_left = runtime->period_size;
> > +
> > +             /* Samples in RX FIFO */
> > +             fifo_samples = (rz_ssi_reg_readl(ssi, SSIFSR) >>
> > +                             SSIFSR_RDC_SHIFT) & SSIFSR_RDC_MASK;
> > +
> > +             /* Only read full frames at a time */
> > +             samples = 0;
> > +             while (frames_left && (fifo_samples >= runtime->channels)) {
> > +                     samples += runtime->channels;
> > +                     fifo_samples -= runtime->channels;
> > +                     frames_left--;
> > +             }
> >
> > -     /* not enough samples yet */
> > -     if (samples == 0)
> > -             return 0;
> > +             /* not enough samples yet */
> > +             if (!samples)
> > +                     break;
> >
> > -     /* calculate new buffer index */
> > -     buf = (u16 *)(runtime->dma_area);
> > -     buf += strm->buffer_pos * runtime->channels;
> > +             /* calculate new buffer index */
> > +             buf = (u16 *)(runtime->dma_area);
>
> Is the second pair of brackets needed?
>
Nope can be dropped.

Cheers,
Prabhakar
