Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6D93D8601
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jul 2021 05:07:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BDB817B4;
	Wed, 28 Jul 2021 05:06:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BDB817B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627441631;
	bh=YDeTYgqLOsgPqG2bDMVi1zVwUUX/v7P4TWkZ+fr0CZQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tGN1znZAgCVN8W5Wx+mZ5NL/+KE9mwi3HsxSEVT+FV1x1zCeJktSTuSk1LmWuJuwz
	 44B7sj1Y9gQ1zITDclWv1vJ5nU9tNlymI6HqZdn2gRPuXCgBcg3QMuCIMAjnOGHMBn
	 XWQvu93yY9CDUbroeyu7BmEoMrqQn5xTWnYkwDsc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CEBA4F8020D;
	Wed, 28 Jul 2021 05:05:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1E5BF8025A; Wed, 28 Jul 2021 05:05:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3B9BF80127
 for <alsa-devel@alsa-project.org>; Wed, 28 Jul 2021 05:05:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3B9BF80127
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NZKVWksc"
Received: by mail-il1-x12c.google.com with SMTP id h18so1323065ilc.5
 for <alsa-devel@alsa-project.org>; Tue, 27 Jul 2021 20:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V5nPCs+zgVEjaQ1xdYF8e69Qx09PyfhWtj+zgOWWG5U=;
 b=NZKVWksc/qFH992W7kqhkPxQGdijfLILV7coYYb3d0diNcvp5ZquSkOx7OU+UmCemp
 NeHgY2spQWEFoznwWG3vmkoBsTeuWUhnLGsCqpWXda8WHE54erLlT8rlfdaXgWMx2DwZ
 H4b+E/nS1oeV6tTRyyXwuNNixbz2q2/hGHbyGYGpDKWa5HoOz5HUjFY5gAV6Bm4ZY4wv
 y/CaKZskVC6AadxFsVCeffIo0D6fHjs88r2r1+QJaPqVpvvz+Zl+ZnegimTSG3Lw8rT5
 cFlExVqjVhZ64p7S0Ug+mv3RJbd3+e2lOVXBS0hA3EuVC6bdjQaC7WGl0gyW/0If0F/y
 W+sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V5nPCs+zgVEjaQ1xdYF8e69Qx09PyfhWtj+zgOWWG5U=;
 b=GmLyl7ieKzA9Mw+lWWohPFZm4YQ5kIphqTaCW0yNzuSFlhV6/MN1PNyHW2W9Nqo2Ki
 Kx7zZoYgThR8ltFmq/QNqKo7t1c53iJPVrn8GIlvE469nSGD4iq2v4j+hprVdcFNIXhW
 irMVaqgNQK53SZVwksVZUsEjzF0j9NGc91qvsuwniEoEMPTz2ifKuckd5Sfu42E/ocvf
 D9e4V8UGw/EQxH+6XAwCo88mptqGMJ7SUf4lHtkSw4zUBx5O6SuNI0jgDnNhmq2gjlDI
 GGoGzv4YlD2YIef3eFtx1qpqlDkAokx7frHR7fK3fil4Vi6+VJnOMzFu//DW8DhK00R5
 9iHQ==
X-Gm-Message-State: AOAM533bn4/a1cWxaL8o8pPmWBFV8dX6lHgoAoyYIXbSX1JFLFS/vUjz
 rPFzMTDAwUpq9qXJtWy8Z+BWkbVisbgJcNj8vIs=
X-Google-Smtp-Source: ABdhPJxfKgIeA9p2fd88dHJlKA3RVfs7Vu9WYz/WQo20hBH4KCjYB3J7EVoppG3j/88ZEyNksf7CgbpXqpFCzPkkR+Q=
X-Received: by 2002:a05:6e02:f53:: with SMTP id
 y19mr20203659ilj.181.1627441528152; 
 Tue, 27 Jul 2021 20:05:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAPkENw_qS2fgP02RAJgoQHM1ROoio6Km5=bGPhi2R+h4vJQ79w@mail.gmail.com>
 <s5h35rzd8ox.wl-tiwai@suse.de>
In-Reply-To: <s5h35rzd8ox.wl-tiwai@suse.de>
From: Alex Roberts <arob109@gmail.com>
Date: Tue, 27 Jul 2021 22:05:17 -0500
Message-ID: <CAPkENw-TFC+J6SvsOWLGOkqYr1im93khoKaaQQa1Hh1YOfSKUQ@mail.gmail.com>
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

It get's -ENOMEM.. which appears to be returned by the imx-sdma driver
when it attempts to allocate memory with the dma_alloc_coherent(...)
function. This seems to get called through a chain of functions
starting back to pcm_dmaengine.c > snd_dmaengine_pcm_trigger(...),
under the SNDDRV_PCM_TRIGGER_START case which calls
dmaengine_pcm_prepare_and_submit(...)... then
dmaengine_prep_dma_cyclic(...).. which will call
device_prep_dma_cyclic(...). In my case, I'm running on an NXP
IMX8M-Quad, hence hte imx-sdma driver.

Alex.

On Tue, Jul 27, 2021 at 11:26 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Mon, 26 Jul 2021 17:07:52 +0200,
> Alex Roberts wrote:
> >
> > Hello,
> >
> > I am developing a dummy codec to interface with an 8-channel, 24-bit
> > ADC. I've got it working on an NXP imx8m through the fsl_sai driver on
> > kernel 5.4.85. I can capture all 8 channels at varying sample rates
> > using arecord, and I've verified correct data capture via opening the
> > resulting .wav file in Audacity. The problem I am having is that
> > occasionally, upon starting arecord - after a fresh power cycle - I
> > get an out of memory error. Other times I get an out of memory after a
> > non-deterministic period of capture. Starting capture again also
> > reports out of memory, but if I wait several minutes and start capture
> > it will start recording again. A power cycle usually helps, but as
> > stated earlier, not 100% of the time.
>
> Do you mean that application gets -ENOMEM error from API, or the
> system exhausts the memory?  The former is often some buffer
> management issue (e.g. the buffer perallocation didn't happen and yet
> the dynamic allocation failed), but the latter is rather about the
> memory leaks.
>
>
> Takashi
>
> > I'm trying to track down where the oom error is coming from, but
> > haven't had much luck. My colleague tried running arecord with
> > valgrind to check for memory leaks and nothing of note was observed.
> > My suspicion is there's something going on with allocated memory for
> > DMA, like fragmentation starts to happen and it can't get a contiguous
> > region for operation. Reserving a larger pool - either via device tree
> > or kernel cmdline arguments in the bootoader - did not seem to help.
> >
> > Another thought is that it's a boundary/alignment issue due to the
> > 24-bit data, and the error is the result of trying to allocate a chunk
> > of memory for DMA that doesn't align.
> >
> > I'm very new to ALSA dev with some exposure to kernel dev in general,
> > so please correct me if I'm wrong or completely mis-understanding
> > something.
> >
> > Any suggestions on where I should / how I can debug this memory error?
> >
> > Thanks,
> > Alex.
> >
> > PS: Previously sent this to just alsa-devel mailing list on 7/21, but
> > never saw it show up in the archives. Here is more info since then:
> >
> > The goal is 8-channel, 96k sampling rate. I've reduced sampling rate
> > and still have the issue. Reducing down to 4-channels helps, but
> > haven't tested long term enough to evaluate by how much.
> >
> > Narrowed it down to device_prep_dma_cyclic(..) returning NULL within
> > dmaengine_prep_dma_cyclic(..)..... still tracing through source to
> > learn exactly what is going on.
> >
