Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 366BE4071B5
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Sep 2021 21:08:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D620169C;
	Fri, 10 Sep 2021 21:07:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D620169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631300880;
	bh=MiyB1vcPhoi3xWf6/59gBUYelLayH7jXyhUWr5vZkdA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jxmdRqUxQEZZi+uSwsph6ErJomml09YMFnUjOnPnLKD7tvrdzywUnVt1NKQzh9xu6
	 fNnG2TA21sSvp0gKcOAXQmcTNM/9U6HVetb02q52szTcBG0G+H2hpISkUMHKtYZ35c
	 9BgXynuDy040tUEvTpj8I8F0BSbk7XtqjF9HJpiA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0897BF8049C;
	Fri, 10 Sep 2021 21:06:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFA1DF802E7; Fri, 10 Sep 2021 21:06:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D323AF80166
 for <alsa-devel@alsa-project.org>; Fri, 10 Sep 2021 21:06:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D323AF80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="nMMBKXqh"
Received: by mail-il1-x131.google.com with SMTP id q14so3096281ils.5
 for <alsa-devel@alsa-project.org>; Fri, 10 Sep 2021 12:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6wOT3W8st8VyFtYraq9lYmP4EDxpZcSWSpshf+YkXJo=;
 b=nMMBKXqh/GpjCLje6GZegqgdQFWiXHjte2VgS9wbroiV24uvOv1R/iH29d+p+vYf1h
 PjrrPFluG3Dt8h+3HX1N27Wt2jmmppnPO6SrXv3wmx6wg+aZ5JZbqhBOaR4WRYkRMsIw
 YRNnvsJX3HDuMjC1BdbTfDMuBl7IKDcEAy+x06yEk4FNkBgX6FC3MrE8ltDTvFUDxDZb
 6n1iY+W5WXu1I0w7JXYZehccFbwUeR92oDCMyzNqbZRKYvY2xPtBESHJgP49uxUac1X9
 jCfqDkCIlnyohXwJhTXThUKZ/Np9PVD5iuzplyA4o8zHpz+QFL+nIX0tdJrdVfzTym/s
 MORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6wOT3W8st8VyFtYraq9lYmP4EDxpZcSWSpshf+YkXJo=;
 b=wbHIeX3tZkxySeYnEhxaoZyPgdnV9FTWFB3M5r7wkCH0sSC7KwJ925WBYr53xJxq8v
 MwbOjUuexeP17//hww3yvwauH9zJrO7FiLcthZWqmIijBsIG2KfHyKkoEHsuJLGfgLdw
 La6QiqSDFS03qz4sPSjH9kZdHpq6jOwnbrP78RyO3cF3ndZ6f0pIMhEVsqEHsooRWVhE
 5aaqdfBV2XJ64XReezIcF13eTDImVvo8nEqz7lCjzVh814/dHJyIrDd3Lr9lN44vo62F
 IKXdMXVxxiqID+qSf3WZWVPr6H7WUP/2tBML2hlvC2KVNjtZGgIu5fCnkaMrEwpsz3Hs
 ON5g==
X-Gm-Message-State: AOAM531lhjNtIZIDX/ZjT1oPZvxxx88kP9xAdOnwLcjMre+KjREOzE68
 zGm22PpQ+rh7P6RFL+HouwaxqFltQDzkvR8+T0M=
X-Google-Smtp-Source: ABdhPJwzIlr6U4U4iHq4OnTYxf0yZt03hr6kPsbQ6qvfrd52Hwjr+k6TxeWxs4oVh6BBM39WxOs5GmUkIADLTIXP5ho=
X-Received: by 2002:a05:6e02:102c:: with SMTP id
 o12mr7598011ilj.312.1631300792392; 
 Fri, 10 Sep 2021 12:06:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAPkENw_qS2fgP02RAJgoQHM1ROoio6Km5=bGPhi2R+h4vJQ79w@mail.gmail.com>
 <s5h35rzd8ox.wl-tiwai@suse.de>
 <CAPkENw-TFC+J6SvsOWLGOkqYr1im93khoKaaQQa1Hh1YOfSKUQ@mail.gmail.com>
In-Reply-To: <CAPkENw-TFC+J6SvsOWLGOkqYr1im93khoKaaQQa1Hh1YOfSKUQ@mail.gmail.com>
From: Alex Roberts <arob109@gmail.com>
Date: Fri, 10 Sep 2021 14:06:21 -0500
Message-ID: <CAPkENw_H-eMd=WvdxNGieT2NZr1CHBW3hBKyqfvOtiRAeqf-OA@mail.gmail.com>
Subject: Re: ASoC/ALSA Out of Memory Issue
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, kernelnewbies@kernelnewbies.org
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

I think I solved my issue. I reserved a block of memory for dma via
device tree following
/Documentation/devicetree/bindings/linux/reserved-memory.txt

Thanks,
Alex.

On Tue, Jul 27, 2021 at 10:05 PM Alex Roberts <arob109@gmail.com> wrote:
>
> It get's -ENOMEM.. which appears to be returned by the imx-sdma driver
> when it attempts to allocate memory with the dma_alloc_coherent(...)
> function. This seems to get called through a chain of functions
> starting back to pcm_dmaengine.c > snd_dmaengine_pcm_trigger(...),
> under the SNDDRV_PCM_TRIGGER_START case which calls
> dmaengine_pcm_prepare_and_submit(...)... then
> dmaengine_prep_dma_cyclic(...).. which will call
> device_prep_dma_cyclic(...). In my case, I'm running on an NXP
> IMX8M-Quad, hence hte imx-sdma driver.
>
> Alex.
>
> On Tue, Jul 27, 2021 at 11:26 AM Takashi Iwai <tiwai@suse.de> wrote:
> >
> > On Mon, 26 Jul 2021 17:07:52 +0200,
> > Alex Roberts wrote:
> > >
> > > Hello,
> > >
> > > I am developing a dummy codec to interface with an 8-channel, 24-bit
> > > ADC. I've got it working on an NXP imx8m through the fsl_sai driver on
> > > kernel 5.4.85. I can capture all 8 channels at varying sample rates
> > > using arecord, and I've verified correct data capture via opening the
> > > resulting .wav file in Audacity. The problem I am having is that
> > > occasionally, upon starting arecord - after a fresh power cycle - I
> > > get an out of memory error. Other times I get an out of memory after a
> > > non-deterministic period of capture. Starting capture again also
> > > reports out of memory, but if I wait several minutes and start capture
> > > it will start recording again. A power cycle usually helps, but as
> > > stated earlier, not 100% of the time.
> >
> > Do you mean that application gets -ENOMEM error from API, or the
> > system exhausts the memory?  The former is often some buffer
> > management issue (e.g. the buffer perallocation didn't happen and yet
> > the dynamic allocation failed), but the latter is rather about the
> > memory leaks.
> >
> >
> > Takashi
> >
> > > I'm trying to track down where the oom error is coming from, but
> > > haven't had much luck. My colleague tried running arecord with
> > > valgrind to check for memory leaks and nothing of note was observed.
> > > My suspicion is there's something going on with allocated memory for
> > > DMA, like fragmentation starts to happen and it can't get a contiguous
> > > region for operation. Reserving a larger pool - either via device tree
> > > or kernel cmdline arguments in the bootoader - did not seem to help.
> > >
> > > Another thought is that it's a boundary/alignment issue due to the
> > > 24-bit data, and the error is the result of trying to allocate a chunk
> > > of memory for DMA that doesn't align.
> > >
> > > I'm very new to ALSA dev with some exposure to kernel dev in general,
> > > so please correct me if I'm wrong or completely mis-understanding
> > > something.
> > >
> > > Any suggestions on where I should / how I can debug this memory error?
> > >
> > > Thanks,
> > > Alex.
> > >
> > > PS: Previously sent this to just alsa-devel mailing list on 7/21, but
> > > never saw it show up in the archives. Here is more info since then:
> > >
> > > The goal is 8-channel, 96k sampling rate. I've reduced sampling rate
> > > and still have the issue. Reducing down to 4-channels helps, but
> > > haven't tested long term enough to evaluate by how much.
> > >
> > > Narrowed it down to device_prep_dma_cyclic(..) returning NULL within
> > > dmaengine_prep_dma_cyclic(..)..... still tracing through source to
> > > learn exactly what is going on.
> > >
