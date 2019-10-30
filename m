Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B1DE9846
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Oct 2019 09:40:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B6AF230B;
	Wed, 30 Oct 2019 09:39:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B6AF230B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572424828;
	bh=3ydsDE+T1n0f77RRKRv7u5Qt54EJl+0Ziq3awD1kVTY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fprrBotSSXscJKu3MPuiaRP+FgrlT4QaulnJAFiTxTZjkJeGV96GGWqX8f1bC/Uis
	 YbXA5dfDkNMpwdnGwZtNlTWK7mRPfHM228kVGx6vi0V42VJZUDSBMU3BKSEHqUZ49c
	 SR5QRvHr1xMOe1p4NDcKWfl8tz45qttkjNBIlt38=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB87DF80361;
	Wed, 30 Oct 2019 09:38:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DA37F80361; Wed, 30 Oct 2019 09:38:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35CE7F8015A
 for <alsa-devel@alsa-project.org>; Wed, 30 Oct 2019 09:38:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35CE7F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="O0eRAHdD"
Received: by mail-pg1-x541.google.com with SMTP id e4so1019021pgs.1
 for <alsa-devel@alsa-project.org>; Wed, 30 Oct 2019 01:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=v2hRD77Xa+8VszcX+WELl2gUUJHpsHwPoC3bm/BbZJM=;
 b=O0eRAHdD3DBS5qT2uOGdJxD2ejyrVV4ujntxZVDXHK2ooTcUnKP/k7bUbI0NaeUM1u
 YdR7lGqW/eh/55fHGUltUpJYU583TNyN5vHE2+2RMDKHOhEJLyHilGDL7KR8Bt4N0iJg
 YXUQQ6iF3vSXDedenuRHCs6BVYYKCd2PAPbJvDtwVLgafZ82mnpo5yazIPYEjo5+0ESQ
 QTvFjFmodYnnwwZzV/mkcPJDMrgCHFfn9yPlsg27NkywsIll1sk0i4eWYlZb+HazgjpP
 1rPrIafhLPFMcndMvBiGq3ANbJxOMBZcimO8VkU0ZFyMePGUEZ1ygvBIM91Ik+Ezq07A
 arCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=v2hRD77Xa+8VszcX+WELl2gUUJHpsHwPoC3bm/BbZJM=;
 b=sKvFrxLL9DtFDo756vq+jAEQV93TFhcOx8pi7TLV3Pn1IdfQ1lzn7pDQ3frVky2H7p
 x7YACbnCt8OK8yIfmAdZR63vnb1VtcNyp8zYRk4y4E8ipbPWPB1p0HFR6drJuR/fonOl
 zhVyLBNTc4zZ6AqEKkbOMdtW/xJMQ+542B+TYRSXylhgocwYIClCGNLoWCljgREwtbD5
 JvroR8ze5JVE1DviA5ZLI34f7qUaxLo/6jdDc1BNaT/IjTLfuBR5BurGCZlB41DY7+6c
 6wZxKBboo4dpelJxwIhvltLfR5FxQ0ExmNj9xcTdIkjm/B+jthk49wbqVq05GbGiEeBd
 YblA==
X-Gm-Message-State: APjAAAXazsPWxvv69DjBVNA+Nl7kFJxx5M4sGVOniS8KRrQaYJMj1vPz
 zX9aUSr3O/s8wTHHPOQuVJk=
X-Google-Smtp-Source: APXvYqwahN/PAT9+SXrRtJkw50qD6UZNdHbCE8Z8QKgQmJfmTZRDGvMaddupYSRIAemYyM1TezVClw==
X-Received: by 2002:a65:6713:: with SMTP id u19mr5515149pgf.358.1572424716728; 
 Wed, 30 Oct 2019 01:38:36 -0700 (PDT)
Received: from Asurada (c-73-162-191-63.hsd1.ca.comcast.net. [73.162.191.63])
 by smtp.gmail.com with ESMTPSA id
 b26sm1617680pfo.179.2019.10.30.01.38.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 30 Oct 2019 01:38:36 -0700 (PDT)
Date: Wed, 30 Oct 2019 01:38:13 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: "S.j. Wang" <shengjiu.wang@nxp.com>
Message-ID: <20191030083813.GA9924@Asurada>
References: <VE1PR04MB64795758EBC0C898FBFFB3A5E3600@VE1PR04MB6479.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <VE1PR04MB64795758EBC0C898FBFFB3A5E3600@VE1PR04MB6479.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH 2/2] ASoC: fsl_asrc: Add support for imx8qm
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

On Wed, Oct 30, 2019 at 03:20:35AM +0000, S.j. Wang wrote:
> Hi
> 
> > 
> > On Tue, Oct 29, 2019 at 05:17:09PM +0800, Shengjiu Wang wrote:
> > > There are two asrc module in imx8qm, each module has different clock
> > > configuration, and the DMA type is EDMA.
> > >
> > > So in this patch, we define the new clocks, refine the clock map, and
> > > include struct fsl_asrc_soc_data for different soc usage.
> > >
> > > The EDMA channel is fixed with each dma request, one dma request
> > > corresponding to one dma channel. So we need to request dma channel
> > > with dma request of asrc module.
> > >
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > ---
> > >  sound/soc/fsl/fsl_asrc.c     | 91 +++++++++++++++++++++++++++++-------
> > >  sound/soc/fsl/fsl_asrc.h     | 65 +++++++++++++++++++++++++-
> > >  sound/soc/fsl/fsl_asrc_dma.c | 39 ++++++++++++----
> > >  3 files changed, 167 insertions(+), 28 deletions(-)
> > 
> > > diff --git a/sound/soc/fsl/fsl_asrc_dma.c
> > > b/sound/soc/fsl/fsl_asrc_dma.c index d6146de9acd2..dbb07a486504
> > 100644
> > > --- a/sound/soc/fsl/fsl_asrc_dma.c
> > > +++ b/sound/soc/fsl/fsl_asrc_dma.c
> > > @@ -199,19 +199,40 @@ static int fsl_asrc_dma_hw_params(struct
> > > snd_soc_component *component,
> > >
> > >       /* Get DMA request of Back-End */
> > >       tmp_chan = dma_request_slave_channel(dev_be, tx ? "tx" : "rx");
> > > -     tmp_data = tmp_chan->private;
> > > -     pair->dma_data.dma_request = tmp_data->dma_request;
> > > -     dma_release_channel(tmp_chan);
> > > +     /* tmp_chan may be NULL for it is already allocated by Back-End */
> > > +     if (tmp_chan) {
> > > +             tmp_data = tmp_chan->private;
> > > +             if (tmp_data)
> > > +                     pair->dma_data.dma_request =
> > > + tmp_data->dma_request;
> > 
> > If this patch is supposed to add a !tmp_chan case for EDMA, we probably
> > shouldn't mute the !tmp_data case because dma_request will be NULL,
> > although the code previously didn't have a check either. I mean we might
> > need to error-out for !tmp_chan. Or...
> > is this intentional?
> > 
> 
> Yes, intentional. May be we can change to 
> 
>         if (!asrc_priv->soc->use_edma) {
>                 /* Get DMA request of Back-End */
>                 tmp_chan = dma_request_slave_channel(dev_be, tx ? "tx" : "rx");
>                 tmp_data = tmp_chan->private;
>                 pair->dma_data.dma_request = tmp_data->dma_request;
>                 dma_release_channel(tmp_chan);
> 
>                 /* Get DMA request of Front-End */
>                 tmp_chan = fsl_asrc_get_dma_channel(pair, dir);
>                 tmp_data = tmp_chan->private;
>                 pair->dma_data.dma_request2 = tmp_data->dma_request;
>                 pair->dma_data.peripheral_type = tmp_data->peripheral_type;
>                 pair->dma_data.priority = tmp_data->priority;
>                 dma_release_channel(tmp_chan);
>         }

Oh...now I understand..yea, I think this would be better.

Would you please change it in v2?

I am fine with other places, so may add:

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

Thanks
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
