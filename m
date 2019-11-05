Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B42D1F04EC
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 19:19:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3027C16E1;
	Tue,  5 Nov 2019 19:18:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3027C16E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572977981;
	bh=dbKsmn31xo2WtOwSoA3zIVcRyjtAr+dm1i4xqj35y0I=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CcvbZ4jjOQD9CrizgI/KgaZ0iqhrEezKyKIRhIFCueuDBmVlVVO+wjlaWd1o7pdug
	 eqBSVzIFIhZNN1qXDt0PKdZd9sH7w8iHAmXqI2/Pn+4039RE5PQ0o9vvInWZJOMu0n
	 pbR6+K6rCCTHbXNjCArPSPg14IO+nN2VaFxf+Adk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6886FF800F3;
	Tue,  5 Nov 2019 19:17:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11B0AF80446; Tue,  5 Nov 2019 19:17:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A922EF800F3
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 19:17:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A922EF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="ciau2OBW"
Received: by mail-io1-xd43.google.com with SMTP id r144so23707987iod.8
 for <alsa-devel@alsa-project.org>; Tue, 05 Nov 2019 10:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u68yfuXhUPLuQ2TW1V6WPFyBZ0Qw5hE5Mro6+mD3+nM=;
 b=ciau2OBW1rmKyUiAVg80xxJx2Q4sIpsalJIMd0eydI6EwT+AceyECutn9xLUWEwHce
 RIDTmEcInAadhtWIB/tUmCHaDPdqpruptU7sRwxWRU3HRa8yHZfOfoXU68RLcey7NuFk
 rFmZGW3836jg2RNUndbNjRbsYEtJg3sL8wiAe1sw5xpse9GlJSjstGyarGNy3Oz/jGCN
 uj7kQm85yj2ZLO2Di5GESLrbUKmbDTmxPkYsDQdl6hC47H8mcxXGY5659RZrS3iBelVs
 WFlKQZNHgGiecxFt27ChRsbqaldK50QNtFf4r0tlgfWEnLaQvhAOo/i7Rzq/ZOTUm/ZB
 mo6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u68yfuXhUPLuQ2TW1V6WPFyBZ0Qw5hE5Mro6+mD3+nM=;
 b=nlxy0fKdb5L4LY92KOdOPT6ODl6o3ChtrQBBAd89ghmQegsdHJ00SOOiAXWqs0f1zw
 EIMrVGhzd6joAWWvc8VwtPDk5h/FsGRMpJ1sZGVd/eCkiwqWQYtgAKHGud/tLQ4fXC+a
 FlIVTY/hfdu6da7hm2p416PHR7DfD+pbW+yI5kHeE2no8FV3tbkMfFelhgCzY5XTqLm9
 hRApOGSUkoMaqwuy6He2Gg9ul2y8wl59JEhSPI+LFhbQ7bRijvTs1TOyoh8iUgyt09B8
 oBsb4UJN59IYIB/GaPeckJIRGhaeiYbtDYT7HHNWSUOSOu76LKt7eE6WwEPxgEpOP2Ru
 l3XQ==
X-Gm-Message-State: APjAAAVR9RYnl7a1L0tcPzkfE98LifWbL3m3LN9LBfIi787AJq+dcPpj
 zRg6q9formFfAnvQI4C0lscP1deO8ZEISHKtjBLaFQ==
X-Google-Smtp-Source: APXvYqzTHc1j25DKCVzqAKjGguLuf0zGRN0Bcs5Mf7b5JqI5Ew2ApsgJtIUL2gjZXkou2G/MQRWbXQN40bsjkRhOQKE=
X-Received: by 2002:a02:5846:: with SMTP id f67mr2654449jab.121.1572977867001; 
 Tue, 05 Nov 2019 10:17:47 -0800 (PST)
MIME-Version: 1.0
References: <20191105080138.1260-1-tiwai@suse.de>
 <20191105080138.1260-2-tiwai@suse.de>
 <5d05a1419c6acee8adc8184751e42616898ea28c.camel@linux.intel.com>
 <s5hsgn29ost.wl-tiwai@suse.de>
In-Reply-To: <s5hsgn29ost.wl-tiwai@suse.de>
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Date: Tue, 5 Nov 2019 10:17:40 -0800
Message-ID: <CAFQqKeWb9VtJa6cNuN82w6f83CWMr2ZPG9ethKBsxo5oyNfbpQ@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 1/4] ALSA: memalloc: Allow NULL device for
 SNDRV_DMA_TYPE_CONTINOUS type
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

>
> > >
> > Hi Takashi,
> >
> > I have a question about the usage of snd_dma_alloc_pages() with the
> > SNDRV_DMA_TYPE_DEV type. I am working on adding a platform-device for
> > audio which is a child device of the top-level PCI device in SOF.
> > When I use the handle for the platform-device as the "dev" argument for
> > snd_dma_alloc_pages(), the dma alloc fails on some platforms (ex: Ice
> > Lake). But it works fine if I use the top-level PCI device instead.
> > Why would that be? Are there any restrictions to what devices can be
> > used for dma alloc?
>
> This pretty much depends on the device.  Basically the ALSA memalloc
> stuff simply calls dma_alloc_coherent() if the buffer type is
> SNDRV_DMA_TYPE_DEV, and the rest goes deeply into the code in
> kernel/dma/*.
>
> My wild guess is that the significant difference in your case is about
> the DMA coherence mask set on the device.  As default the platform
> device keeps 32bit DMA while the modern PCI drivers often sets up
> 64bit DMA mask.
>

Thanks, Takashi. So, in this case, would you recommend to always use the
PCI device for dma alloc?

Thanks,
Ranjani
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
