Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D304F1DB16F
	for <lists+alsa-devel@lfdr.de>; Wed, 20 May 2020 13:24:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D79F17D4;
	Wed, 20 May 2020 13:23:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D79F17D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589973873;
	bh=saXS62aM5DoR6XRhBW8l0McmytiX79WnVlfDhs1aKSI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qts121LLtsSy7gW1feTUcUqGZINCf/r3Iv/6eaVeVGYVsRNLqAtjvV/SysXZx1t/I
	 h667Qg0FHjwkdh2/sqCcyjdYnvlLUHoUGzYasU/sqS0sAg1vnFXzYpvHO+/JuHtxpJ
	 t+mYd1d6MpImaTV6mtjpNuUar1cD7NLJDqOzCdPg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E318F80090;
	Wed, 20 May 2020 13:22:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22EC3F801F9; Wed, 20 May 2020 13:22:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26D6EF80132
 for <alsa-devel@alsa-project.org>; Wed, 20 May 2020 13:22:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26D6EF80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="LzRhD8IV"
Received: by mail-qk1-x741.google.com with SMTP id m11so3118372qka.4
 for <alsa-devel@alsa-project.org>; Wed, 20 May 2020 04:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZjqVhvVauJwxzdubRCxzpwyDgNZsr/jK/zmF2UGqkm0=;
 b=LzRhD8IVgnmIVQzzoYcQc9SGvryKW9AvjBv+5xt1U5TlXPqkgWZYhhLZ+fDOiIMJVE
 j8fn5+fABxBNdukYPVM+l0vF16UvWxzpEJBJLKCW56Z4DkC5xa0rvUGkgFzj9G0Agcbl
 CR4ePEwCrdO65XTKv1Q7qKPo1V5T2jQjs+MOPyTun845of6hg3kQqItmtboNDlREjJcu
 Z2pKrl+oLt5umJH0Z+pIMp+EXFb7tOaN6BDew0UWwQ+/7bg+moQfUGPSduuzZJPyI5/X
 2YFdC3nAFQopV7V8BMDEMRy8CAn1JlcOebH4yDfMrImRBq3nMNW49Dcoe93t2TjTRQsi
 5qvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZjqVhvVauJwxzdubRCxzpwyDgNZsr/jK/zmF2UGqkm0=;
 b=QQYSf7XhF3WneYwk9wpiMPYDVDKA9nnhhENGMuvRaNoeNtJo7tZzWaTK60y4TN/s5Z
 FhDcK5CaeIUqQT7ohtFugkVaPzX1DzcSavgkK6hrRAOvKqsJE9tA4jG5doLKau8orTln
 rCqVbb7dohXA2zM1/hRL3QikZJC9COcxz40jNt4B5uCZuXlhzQ594bY32IM+laHx9Fbt
 0gYKN7eftDCfZuZx2FviBeWoDy3ObOy4WiewdC6itSMLTh7Gka56Xhp/xxWTCZXXLtd1
 AJi8L73bIBBuO263vCb5CeJD7MV0Lxk4n0iYuuwOdRQld4KJ95FpGcKEy+6kAddMPP8F
 oKFw==
X-Gm-Message-State: AOAM532ZUN797x7CmSBNQUMTfAILZQd6VXZrq3gkTsaOriYBkMUiuaPz
 VlvE4GwOj/ECvwYODDDxxFzOn5kBZw+heuIbmHY=
X-Google-Smtp-Source: ABdhPJxBdmgJNCR88xlbXPGclNlO2GaIwRkfV+dyapGMbu4Q9RuUthOHvMqPP4yv8y1KdCvdCmqnj7BHtLVZZI62f64=
X-Received: by 2002:a37:a50d:: with SMTP id o13mr4087174qke.121.1589973760794; 
 Wed, 20 May 2020 04:22:40 -0700 (PDT)
MIME-Version: 1.0
References: <1589881301-4143-1-git-send-email-shengjiu.wang@nxp.com>
 <0866cd8cdb0c22f0b2a6814c4dafa29202aad5f3.camel@pengutronix.de>
 <CAA+D8APhHvA39wmCayeCsAEKmOJ0n7qOQiT1tZmFHr4+yASgTw@mail.gmail.com>
 <53258cd99caaf1199036737f8fad6cc097939567.camel@pengutronix.de>
In-Reply-To: <53258cd99caaf1199036737f8fad6cc097939567.camel@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 20 May 2020 19:22:19 +0800
Message-ID: <CAA+D8APAMRwtVneqFsuBgAhozmQo3R0AQi0bVdUCQO4Af4xVfw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl: imx-pcm-dma: Don't request dma channel in probe
To: Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: sumit.semwal@linaro.org, linaro-mm-sig@lists.linaro.org,
 Linux-ALSA <alsa-devel@alsa-project.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel <linux-kernel@vger.kernel.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, shawnguo@kernel.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-imx@nxp.com, kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>,
 s.hauer@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
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

Hi

On Wed, May 20, 2020 at 5:42 PM Lucas Stach <l.stach@pengutronix.de> wrote:
>
> Am Mittwoch, den 20.05.2020, 16:20 +0800 schrieb Shengjiu Wang:
> > Hi
> >
> > On Tue, May 19, 2020 at 6:04 PM Lucas Stach <l.stach@pengutronix.de> wr=
ote:
> > > Am Dienstag, den 19.05.2020, 17:41 +0800 schrieb Shengjiu Wang:
> > > > There are two requirements that we need to move the request
> > > > of dma channel from probe to open.
> > >
> > > How do you handle -EPROBE_DEFER return code from the channel request =
if
> > > you don't do it in probe?
> >
> > I use the dma_request_slave_channel or dma_request_channel instead
> > of dmaengine_pcm_request_chan_of. so there should be not -EPROBE_DEFER
> > return code.
>
> This is a pretty weak argument. The dmaengine device might probe after
> you try to get the channel. Using a function to request the channel
> that doesn't allow you to handle probe deferral is IMHO a bug and
> should be fixed, instead of building even more assumptions on top of
> it.
>

I see some driver also request dma channel in open() or hw_params().
how can they avoid the defer probe issue?
for example=EF=BC=9A
sound/arm/pxa2xx-pcm-lib.c
sound/soc/sprd/sprd-pcm-dma.c

> > > > - When dma device binds with power-domains, the power will
> > > > be enabled when we request dma channel. If the request of dma
> > > > channel happen on probe, then the power-domains will be always
> > > > enabled after kernel boot up,  which is not good for power
> > > > saving,  so we need to move the request of dma channel to .open();
> > >
> > > This is certainly something which could be fixed in the dmaengine
> > > driver.
> >
> > Dma driver always call the pm_runtime_get_sync in
> > device_alloc_chan_resources, the device_alloc_chan_resources is
> > called when channel is requested. so power is enabled on channel
> > request.
>
> So why can't you fix the dmaengine driver to do that RPM call at a
> later time when the channel is actually going to be used? This will
> allow further power savings with other slave devices than the audio
> PCM.
>
> Regards,
> Lucas
>

It seems the best place for calling pm_runtime_get_sync is the
device_alloc_chan_resources, and calling pm_runtime_put_sync
in the .device_free_chan_resources

For the slave_sg mode, the .device_prep_slave_sg and
.device_issue_pending  will be called many times after
.device_alloc_chan_resources. so it is not good to call
pm_runtime_get_sync in .device_prep_slave_sg or
.device_issue_pending

best regards
wang shengjiu
