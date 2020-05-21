Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 612831DCC27
	for <lists+alsa-devel@lfdr.de>; Thu, 21 May 2020 13:32:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D56D91815;
	Thu, 21 May 2020 13:31:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D56D91815
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590060736;
	bh=jcaWu+akgBksgemcnhImuWq+XQDwj7Yn5GhLPQnDb/M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pBOCKZAr8tuTroHwhXs7OykOgOiNw39ggp49Db4dNH5YGgHQoF8QHE8zRpuDKkJfR
	 28Xo8kVffKBhROPHY17esE0agut83NPe7zKwSmfsWSB+JCvLpwwy8QzIKO8BodUyI4
	 jj2ybUVxbVuQkNCPgL8t5pCsQB/uPulkfO+yyEqo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECF1FF801F8;
	Thu, 21 May 2020 13:30:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D382FF801D8; Thu, 21 May 2020 13:30:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 973C3F80111
 for <alsa-devel@alsa-project.org>; Thu, 21 May 2020 13:30:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 973C3F80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="MqYN+vMi"
Received: by mail-qk1-x744.google.com with SMTP id f189so6812790qkd.5
 for <alsa-devel@alsa-project.org>; Thu, 21 May 2020 04:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mVnGuA/c41po031/Zyo9z05iki6LpXCl3bw26UlV5Og=;
 b=MqYN+vMiHTEaW4UwLRy16WRoYfu+LJ4pOncpItD4O1GRnxH8TmktN6T6b2PcHxyEwB
 /Ls2IApWVfXgN0RNquNulhQ49MIzfMO2KbQlpew/gmesTLhSAFACIhd9NN5hvF8aTXrJ
 9dGZyhMELfyMK2fbiMTxbSKpZ8EVlDN75FSZjN4lYOI29EfHTi0l6te+3DGNqlishUcI
 ufFCYzDFtCRCTDhyOG4tSbItgT3oIdpuWbG9YF8aGWnFAtPl3K8qizsCVOk3/weuXndt
 nd8yUP/5mHGC7HDR1cjV9fJCWbl4EUH4bqfDeIq+Fhmmrdj99nMfB4lAH2i7rVf5TT9v
 sLsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mVnGuA/c41po031/Zyo9z05iki6LpXCl3bw26UlV5Og=;
 b=FQsG4BJVoNuYrhD3fZwV0SWNGc2l2llY7rZgdwQfEzGuWeJ8ibwnRF9yKfJ7QudHor
 OUCvdqtlJ4eb3aMNxlb+4zvmjqC8qisuYj9S28tquEJRGTxx+YYbf10YjVytFUpPuLVa
 dqcwiLOyUj6az3ruFwYiCa3PeFxW2NNR3bz18UQfqaBPGAdsA8uBHUr/f5dnuIG9Ndcd
 5alUWFHBF4nDcxEDGN0x/Z3WqfIU3InvYXDRDL0ABBlQdOrsD4k3cpuAAbuX4JlY4KEI
 wk0iRCpkRFuIilmlbEKniokNyLCzO3SzFM2ow8Y4X3bCbdrsjpZJFKTsd3QNQGXS/6X5
 H2gg==
X-Gm-Message-State: AOAM531fMhk3bdwcFR5DdBq0Rkw+v1pZ32mLVutbuQIMfK2YeH1CkVwi
 o2c2wfkmimwNRWDuMKoC1rfF5FqAOVfsg0VuL0k=
X-Google-Smtp-Source: ABdhPJyt/PrPu0HyLCBNIAlcBPVwQP3EdSaZpX3l0+ThMZQ3Nc11G0djVdAg3aM+jm8BukBsG/8Iq0VgME50WXdM3Aw=
X-Received: by 2002:a37:a50d:: with SMTP id o13mr9327701qke.121.1590060626064; 
 Thu, 21 May 2020 04:30:26 -0700 (PDT)
MIME-Version: 1.0
References: <1589881301-4143-1-git-send-email-shengjiu.wang@nxp.com>
 <0866cd8cdb0c22f0b2a6814c4dafa29202aad5f3.camel@pengutronix.de>
 <CAA+D8APhHvA39wmCayeCsAEKmOJ0n7qOQiT1tZmFHr4+yASgTw@mail.gmail.com>
 <53258cd99caaf1199036737f8fad6cc097939567.camel@pengutronix.de>
 <CAA+D8APAMRwtVneqFsuBgAhozmQo3R0AQi0bVdUCQO4Af4xVfw@mail.gmail.com>
 <20200520123850.GE4823@sirena.org.uk>
In-Reply-To: <20200520123850.GE4823@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 21 May 2020 19:30:04 +0800
Message-ID: <CAA+D8AOiVVi3B4dzU8r=rCMz=6w9R=wxBkzAQ=0=RAQLKCWy8Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl: imx-pcm-dma: Don't request dma channel in probe
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 Linux-ALSA <alsa-devel@alsa-project.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel <linux-kernel@vger.kernel.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, shawnguo@kernel.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 Nicolin Chen <nicoleotsuka@gmail.com>, linux-imx@nxp.com,
 kernel@pengutronix.de, linux-media@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, s.hauer@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, Lucas Stach <l.stach@pengutronix.de>
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

On Wed, May 20, 2020 at 8:38 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, May 20, 2020 at 07:22:19PM +0800, Shengjiu Wang wrote:
>
> > I see some driver also request dma channel in open() or hw_params().
> > how can they avoid the defer probe issue?
> > for example=EF=BC=9A
> > sound/arm/pxa2xx-pcm-lib.c
> > sound/soc/sprd/sprd-pcm-dma.c
>
> Other drivers having problems means those drivers should be fixed, not
> that we should copy the problems.  In the case of the PXA driver that's
> very old code which predates deferred probe by I'd guess a decade.

Thanks.

For the FE-BE case, do you have any suggestion for how fix it?

With DMA1->ASRC->DMA2->ESAI case, the DMA1->ASRC->DMA2
is in FE,  ESAI is in BE.  When ESAI drvier probe,  DMA3 channel is
created with ESAI's "dma:tx" (DMA3 channel
is not used in this FE-BE case).    When FE-BE startup, DMA2
channel is created, it needs the ESAI's "dma:tx", so the warning
comes out.

best regards
wang shengjiu
