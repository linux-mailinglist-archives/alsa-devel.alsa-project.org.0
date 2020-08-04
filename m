Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E03F423B626
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Aug 2020 09:55:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EA591662;
	Tue,  4 Aug 2020 09:55:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EA591662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596527759;
	bh=yQ5tnOz6tG77VvP8KQyk7mt7nB31jzSKV8GnHy8Ai1M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jYWibKuUXlD1F1AwTfhSqPrglMizQ8852yFij/6yjQ/WOr4K56zp4Sb1iZQleK0Mu
	 mcqBIuDItcc44o8gXPlOG+pWD1DGDw0zRL/1dbONU7WB98wUXLEsUGMiwJvN19nsyV
	 Jd8+BFoHEnw1PzhP6Igo/izL7lL/e3k//7Iotk/k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91175F800B7;
	Tue,  4 Aug 2020 09:54:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BEE4F80150; Tue,  4 Aug 2020 09:54:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E962F80124
 for <alsa-devel@alsa-project.org>; Tue,  4 Aug 2020 09:54:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E962F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="eysYRozR"
Received: by mail-qt1-x842.google.com with SMTP id v22so24316616qtq.8
 for <alsa-devel@alsa-project.org>; Tue, 04 Aug 2020 00:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pvk2qNJvO4GyMY2u27NANNM906H79e7FKsYTERAdnHs=;
 b=eysYRozRxiQ0O/eMhXGkxC1m3FgN4Jt0xHrm4uYJtWyGG7WjOqRIlTB8gdny8xLP6A
 u7Cn8L1W3Mc7uu+D5/u3m+yx9DXNuA2huNax+By2Pxi1IsNpncHuICg0rCObHzZsTBOS
 QQFQ889zRHK9ooUTBzN+nToW6VypY+rY8vnkUoPeWav2WnOadMVqNsMVYTp2jYFTKqMe
 qrR2wNv7IO3bzcXN0Ao6N8NkLzEMfov2TG1XAcCtd2u45HkZeZJDmtvxP+5x6G3GqOcc
 JSmW+9liUjRTPh6nU2ienoROfCE0FU1PRm+ZDnyqgzo/htm4F1SpTs+10d5Qt9SHnjix
 1EQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pvk2qNJvO4GyMY2u27NANNM906H79e7FKsYTERAdnHs=;
 b=kM9TjwJYVWvq/SATzwGhuj15/bq0ifhSBmkglCoKPwDkHzE5HX3CejfCsGeJ3eedEY
 t5B6hy/rD46xHRG6vXp9RO31/zgE3UxzSvROklTAhm+0drkfVqkbBToMxTOTCC5ppKdH
 EV9LB/2c/Ocb79kU0Wjmj7U54Q8oX80wDb5KU8Hm/y+hKw8RDPAOzNzsk3Gc5YMm3B1Q
 kxEWwXFNYVHZpdNHJ5P8zw96Uk8pFE4AfbULoPBNufxJm8WS1L45uEqZH1O1M3uw0dnX
 NjRIxvfPkGVtMpbrL9bGV0G66l4JQXWqWyqwWTrmqIlme39Gk4t9FynuyR7/eUttt68D
 ajsw==
X-Gm-Message-State: AOAM532RmjRcC72FxbJyNifsGbonFXnbb23EO1sDTb5lUJeP56qI7+iT
 VMLsH2/EERTrgODupruUTBUpUVD06zVlewE1Ghg=
X-Google-Smtp-Source: ABdhPJwoa5DLrSm+W2b1xh4wQw7NjhToyJBBLi3p9xIFguNDLPkDzaHtItg0/IPC5AOH6cXxxN5AKvNEE3xnih+beLw=
X-Received: by 2002:ac8:564f:: with SMTP id 15mr20407066qtt.54.1596527642821; 
 Tue, 04 Aug 2020 00:54:02 -0700 (PDT)
MIME-Version: 1.0
References: <1596424674-32127-1-git-send-email-shengjiu.wang@nxp.com>
 <20200803054037.GA1056@Asurada-Nvidia>
 <CAA+D8AOGF44UUq=P1S-M5TUwDUaOnqVmHJKPDBM9DAzt1nVzmQ@mail.gmail.com>
 <20200803215735.GA5461@Asurada-Nvidia>
 <CAA+D8ANQxnvR2bOyHVRs5h2NJhMeVh4gjLPknaz7aQ86MtL0sQ@mail.gmail.com>
 <20200804021114.GA15390@Asurada-Nvidia>
 <CAA+D8ANagfMXPAkK4-vBDY9rZMukVUXs8FfBCHS0avXt57pekA@mail.gmail.com>
 <20200804030004.GA27028@Asurada-Nvidia>
 <CAA+D8ANuLQuUO+VsABjt2t1ccK+LGayq13d6EEcV18=4KNaC+w@mail.gmail.com>
 <CAA+D8AP=27SdR68T-LiQHkJ0_dJaqtgcS-oi9d8arUzvTz5GwA@mail.gmail.com>
 <20200804070345.GA27658@Asurada-Nvidia>
In-Reply-To: <20200804070345.GA27658@Asurada-Nvidia>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 4 Aug 2020 15:53:51 +0800
Message-ID: <CAA+D8ANodghXDbUVOqpf9uq8A5FVbDFEFkf4dWdyMUNDTPaJ7A@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Clean code for synchronize mode
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

On Tue, Aug 4, 2020 at 3:04 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Tue, Aug 04, 2020 at 12:22:53PM +0800, Shengjiu Wang wrote:
>
> > > > Btw, do we need similar change for TRIGGER_STOP?
> > >
> > > This is a good question. It is better to do change for STOP,
> > > but I am afraid that there is no much test to guarantee the result.
>
> > Maybe we can do this change for STOP.
>
> The idea looks good to me...(check inline comments)
>
> > diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> > index 1c0e06bb3783..6e4be398eaee 100644
> > --- a/sound/soc/fsl/fsl_sai.c
> > +++ b/sound/soc/fsl/fsl_sai.c
> > @@ -517,6 +517,37 @@ static int fsl_sai_hw_free(struct
> > snd_pcm_substream *substream,
> >         return 0;
> >  }
> >
> > +static void fsl_sai_config_disable(struct fsl_sai *sai, bool tx)
> > +{
> > +       unsigned int ofs = sai->soc_data->reg_offset;
> > +       u32 xcsr, count = 100;
> > +
> > +       regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
> > +                          FSL_SAI_CSR_TERE, 0);
> > +
> > +       /* TERE will remain set till the end of current frame */
> > +       do {
> > +               udelay(10);
> > +               regmap_read(sai->regmap, FSL_SAI_xCSR(tx, ofs), &xcsr);
> > +       } while (--count && xcsr & FSL_SAI_CSR_TERE);
> > +
> > +       regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
> > +                          FSL_SAI_CSR_FR, FSL_SAI_CSR_FR);
> > +
> > +       /*
> > +        * For sai master mode, after several open/close sai,
> > +        * there will be no frame clock, and can't recover
> > +        * anymore. Add software reset to fix this issue.
> > +        * This is a hardware bug, and will be fix in the
> > +        * next sai version.
> > +        */
> > +       if (!sai->is_slave_mode) {
> > +               /* Software Reset for both Tx and Rx */
>
> Remove "for both Tx and Rx"
>
> >                 /* Check if the opposite FRDE is also disabled */
> >                 regmap_read(sai->regmap, FSL_SAI_xCSR(!tx, ofs), &xcsr);
> > +               if (sai->synchronous[tx] && !sai->synchronous[!tx] && !(xcsr & FSL_SAI_CSR_FRDE))
> > +                       fsl_sai_config_disable(sai, !tx);
>
> > +               if (sai->synchronous[tx] || !sai->synchronous[!tx] || !(xcsr & FSL_SAI_CSR_FRDE))
> > +                       fsl_sai_config_disable(sai, tx);
>
> The first "||" should probably be "&&".

No. it is !(!sai->synchronous[tx] && sai->synchronous[!tx] && (xcsr &
FSL_SAI_CSR_FRDE))
so then convert to
(sai->synchronous[tx] || !sai->synchronous[!tx] || !(xcsr & FSL_SAI_CSR_FRDE))

if change to &&, then it won't work for:
sai->synchronous[tx] = false, sai->synchronous[!tx]=false.
or
sai->synchronous[tx] = true, sai->synchronous[!tx]=true.
(even we don't have such a case).

>
> The trigger() logic is way more complicated than a simple cleanup
> in my opinion. Would suggest to split RMR part out of this change.
>
> And for conditions like "sync[tx] && !sync[!tx]", it'd be better
> to have a helper function to improve readability:
>
> /**
>  * fsl_sai_dir_is_synced - Check if stream is synced by the opposite stream
>  *
>  * SAI supports synchronous mode using bit/frame clocks of either Transmitter's
>  * or Receiver's for both streams. This function is used to check if clocks of
>  * current stream's are synced by the opposite stream.
>  *
>  * @sai: SAI context
>  * @dir: direction of current stream
>  */
> static inline bool fsl_sai_dir_is_synced(struct fsl_sai *sai, int dir)
> {
>         int adir = (dir == TX) ? RX : TX;
>
>         /* current dir in async mode while opposite dir in sync mode */
>         return !sai->synchronous[dir] && sai->synchronous[adir];
> }
>
> Then add more comments in trigger:
>
> static ...trigger()
> {
>         bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
>         int adir = tx ? RX : TX;
>         int dir = tx ? TX : RX;
>
>         // ....
>         {
>                 // ...
>
>                 /* Check if the opposite FRDE is also disabled */
>                 regmap_read(sai->regmap, FSL_SAI_xCSR(!tx, ofs), &xcsr);
>
>                 /*
>                  * If opposite stream provides clocks for synchronous mode and
>                  * it is inactive, disable it before disabling the current one
>                  */
>                 if (fsl_sai_dir_is_synced(adir) && !(xcsr & FSL_SAI_CSR_FRDE))
>                         fsl_sai_config_disable(sai, adir);
>
>                 /*
>                  * Disable current stream if either of:
>                  * 1. current stream doesn't provide clocks for synchronous mode
>                  * 2. current stream provides clocks for synchronous mode but no
>                  *    more stream is active.
>                  */
>                 if (!fsl_sai_dir_is_synced(dir) || !(xcsr & FSL_SAI_CSR_FRDE))
>                         fsl_sai_config_disable(sai, dir);
>
>                 // ...
>         }
>         // ....
> }
>
> Note, in fsl_sai_config_disable(sai, dir):
>         bool tx = dir == TX;
>
> Above all, I am just drafting, so please test it thoroughly :)
