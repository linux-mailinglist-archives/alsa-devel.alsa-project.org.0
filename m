Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 428B2746C3
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2019 08:04:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA18E1AA4;
	Thu, 25 Jul 2019 08:03:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA18E1AA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564034664;
	bh=oieQGuoXLWgwqL3frKKPp3tHQLyqhy0mqA3KgfMX4mo=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JiZg5Q1yJvrvMqpC6dC4K26ZAbTI6yqiXfhU2YtzHI+bLqBidO/a9Bdj3IcNgBS94
	 jFs4aoZOX12zCaolbeDQrgOGMyh5TmGRygNsnDLVA/hzbBUQvukgVp+/uEykqjPmJT
	 g5qBKhZqXABicxNoLBbv9d5FtEboxfjdDNjsdSm0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04D04F80448;
	Thu, 25 Jul 2019 08:02:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FDC3F803D0; Thu, 25 Jul 2019 08:02:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 343EBF800E8
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 08:02:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 343EBF800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="tjDMGaLu"
Received: by mail-wr1-x444.google.com with SMTP id 31so49362657wrm.1
 for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2019 23:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pU+mAWOKuT+1icWHPxBVuENuKDz0OQKOsIOlqLtN9d4=;
 b=tjDMGaLuEFwmnP5PNPyUU25EqT5kbEnRrw6KDGkV6Gb97e+iP5mC5KKgA/9r+l4VJf
 VzlSPmG+ybqde7hYfyiy8wQ15slKfYBqHc8co2TKeF5bNk29sNEiSCuIxIe8RmiMtckl
 ruT832weiB0FIxU08Z056Z5OTH0fbtYlNsfC7zBvhggV2X5Cd6Ep4w2ty6eTQo4qn6Mw
 TNoqdzn/0fNab2feocd7K0N9ekjF4zwAVTIa2IzxaUhlUDE4lTANZnmzQaFqbd3IWljy
 88lR2KUYkwMOQS6i3w+XqHHBBQE7raT55qqJKS5V4zfYicQPto5wOsmF4FiwyV1MUQs2
 Di8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pU+mAWOKuT+1icWHPxBVuENuKDz0OQKOsIOlqLtN9d4=;
 b=uBPsAsYv6ggcN+GMJ0eBVTovVo35fSROWdWSg/Lqxg1arQB7AUKdn9TXJ9PnLCvbhC
 kCYcvS/b4zJEltyIFY2FyYQiT/Fko1RP9bElVydEsZkne4a4Gs9ka8TpXz2VLLsQCYVP
 JsU0bDNvzKofzG4jLxCT72Y1O3rbAIhT3jRuMpqbwSkAkCN2Py9/29q/GL2nbw7ip3vJ
 GXRNjHKqHzU89r7L00EPi81El9qgJJbQxVhV+wJ3eVZyHOChk++eTchxTsfZSyGy2ogm
 G/4ksXtJZP5BVsa006i6kkoIykY2GwvigUHb8CVwOxCuaZAMdCw9wRbFQjwb09mIEb6g
 h9jw==
X-Gm-Message-State: APjAAAVBit5Js7Rfa1Z7IwTqRZd0mbHQrT8JjPUy3IgPqD6ZBn9kr3XA
 geqIxJTXG9yVFwQ3Jwqy35Mu+wFg9brKJvzTVfs=
X-Google-Smtp-Source: APXvYqyyHKiyF0F/r/FwIu7Qxo19mAVSEFeS5FNJ3bM5+0ZtoFzpwVF+0XlzchviCc8j+UG6zqtZKP7V/9kKChSpYiA=
X-Received: by 2002:adf:c70e:: with SMTP id k14mr95081636wrg.201.1564034554176; 
 Wed, 24 Jul 2019 23:02:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190722124833.28757-1-daniel.baluta@nxp.com>
 <20190722124833.28757-9-daniel.baluta@nxp.com>
 <20190724232209.GC6859@Asurada-Nvidia.nvidia.com>
In-Reply-To: <20190724232209.GC6859@Asurada-Nvidia.nvidia.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 25 Jul 2019 09:02:22 +0300
Message-ID: <CAEnQRZBW7LNZ7=c_h_ef4ZDcbFzEt61h4VAJSLo2Fb80kBqtpw@mail.gmail.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 "S.j. Wang" <shengjiu.wang@nxp.com>,
 "Angus Ainslie \(Purism\)" <angus@akkea.ca>, Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 Viorel Suman <viorel.suman@nxp.com>, linuxppc-dev@lists.ozlabs.org,
 Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [alsa-devel] [PATCH 08/10] ASoC: dt-bindings: Document
	fcomb_mode property
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

On Thu, Jul 25, 2019 at 2:22 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Mon, Jul 22, 2019 at 03:48:31PM +0300, Daniel Baluta wrote:
> > This allows combining multiple-data-line FIFOs into a
> > single-data-line FIFO.
> >
> > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/sound/fsl-sai.txt | 4 ++++
>
> This should be sent to devicetree mail-list also.
>
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl-sai.txt b/Documentation/devicetree/bindings/sound/fsl-sai.txt
> > index 59f4d965a5fb..ca27afd840ba 100644
> > --- a/Documentation/devicetree/bindings/sound/fsl-sai.txt
> > +++ b/Documentation/devicetree/bindings/sound/fsl-sai.txt
> > @@ -54,6 +54,10 @@ Optional properties:
> >                         represents first data line, bit 1 represents second
> >                         data line and so on. Data line is enabled if
> >                         corresponding bit is set to 1.
> > +  - fsl,fcomb_mode   : list of two integers (first for RX, second for TX)
> > +                       representing FIFO combine mode. Possible values for
> > +                       combined mode are: 0 - disabled, 1 - Rx/Tx from shift
> > +                       registers, 2 - Rx/Tx by software, 3 - both.
>
> Looks like a software configuration to me, instead of a device
> property. Is this configurable by user case, or hard-coded by
> SoC/hardware design?

Indeed this is a software configuration and configurable by user case.
Will think of a another way to specify it.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
