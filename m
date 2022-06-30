Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF20561A2A
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jun 2022 14:17:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFA1316B5;
	Thu, 30 Jun 2022 14:16:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFA1316B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656591421;
	bh=fSZKUwClzWwpjx8fSeecSCQMtCH8J1iBX2re+UWX7kU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZXzmx+fry2kZUeP1GMdaU62YjsZ1+NOvBL8DbPtQk9c6EEevLYjEFoAPVGNRoP/YV
	 11+zcsw4bKz0HDlKnra6E+bB/BFgLskrmbdGB0LXlqpgGgMEOyH9gkXobedrte610I
	 hQxFmeIEXQGWRtNUl54B09Pitkmhx/Hn8bukYY7M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 276C1F804DA;
	Thu, 30 Jun 2022 14:16:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A905F804D8; Thu, 30 Jun 2022 14:16:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7DE94F800F5
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 14:15:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DE94F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kVsu10QZ"
Received: by mail-lf1-x130.google.com with SMTP id a13so33378509lfr.10
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 05:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8FTw4MCFfuFSADhvkdsMGjKiW6HgFhQqoFSBrJRkTFE=;
 b=kVsu10QZCU5mvSFcGpiSud2USeqH+Dqt6dhIHOHhGvbJy2YfSZmU9KDI+xQ1rS/RsB
 eEi7cDf7UU+Ba1AwC07gIreMH6OygAOcZsBERjt2MRl/usw39NgOQrQX4rBF4FI1qeWW
 UaXOyQEbeIIQUV5CMuusKGl6Qh7kf1ZRvvP8gnj0Xtf5Jj2H8io8IprG6u3gitySF0fH
 iU9xLAhrCRDrUt3x9lHE94+AGq49dZSNiS+CuRYtLuLXgXCGErmTFvzx4t7T5XhRa1mR
 qW808mAVs3XtRYUza9GIFi7rJsqBpM/XTJEbwxhF42StMx5QVRT1M5sYQ2BCOykGUhxm
 QhsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8FTw4MCFfuFSADhvkdsMGjKiW6HgFhQqoFSBrJRkTFE=;
 b=xSPr8xq9HH4lq5wRb/OeZng7Ql8SFNt4HG6g6NNZEx7Avb0dQQLnU2CpVDcyLQ+Zae
 2jfaXbauLAumqM7JBgEqrcNgF2GNaLbDUfjccHezzMTqdiDA8trrkKEzG9PZ5JgDn20Y
 pFnQ4zwGcOcWG21Pm1IpKgDbbayoWvkyxunx01fk+R51KSbpwKa27WnUPqq1bnT7irnA
 z98CanaVijB5pNfxbUdxIqLldqRqDkfFjyAVwhHjXIb0JyOEH/XNJq2cd/4Po2O3CgwM
 JOEMEYITp7xlHx0FRhWWotgrsQfM9Nj5Fr3Uidd45i7Qkg/ykk0Hcw70+jOuSUOKv3KG
 qFDQ==
X-Gm-Message-State: AJIora/lFL1aB3rzh226zkYM6ErT+Dnmo9FS5jrHRN4d2Zz2yMwMhPp4
 sUTMPO0NFFUzF2wzI2FYzEWngVuOVA0nxnqpsxQ=
X-Google-Smtp-Source: AGRyM1vLC0PK4De5akrcRg8Y89ZcrUEGDelsIiW0sTj+BvMXfejNuwEHaX+9OjHUW5D9Z2I1M5RDPGENDDMXDYmeSxw=
X-Received: by 2002:a05:6512:3e05:b0:481:2bf2:db06 with SMTP id
 i5-20020a0565123e0500b004812bf2db06mr5236304lfv.408.1656591356116; Thu, 30
 Jun 2022 05:15:56 -0700 (PDT)
MIME-Version: 1.0
References: <1656567554-32122-1-git-send-email-shengjiu.wang@nxp.com>
 <1656567554-32122-4-git-send-email-shengjiu.wang@nxp.com>
 <Yr1842e42P4piYnE@sirena.org.uk>
In-Reply-To: <Yr1842e42P4piYnE@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 30 Jun 2022 20:15:44 +0800
Message-ID: <CAA+D8AMuOWgPooXGMUqtQOdzVZ60b0ud=wXkO+XYa-BD98o_+A@mail.gmail.com>
Subject: Re: [PATCH 3/6] ASoC: fsl_micfil: Add support for PLL switch at
 runtime
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, alsa-devel@alsa-project.org,
 Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
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

On Thu, Jun 30, 2022 at 6:37 PM Mark Brown <broonie@kernel.org> wrote:

> On Thu, Jun 30, 2022 at 01:39:11PM +0800, Shengjiu Wang wrote:
>
> > +static int fsl_micfil_reparent_rootclk(struct fsl_micfil *micfil,
> unsigned int sample_rate)
> > +{
> > +     struct device *dev = &micfil->pdev->dev;
> > +     u64 ratio = sample_rate;
> > +     struct clk *clk;
> > +     int ret;
> > +
> > +     /* Reparent clock if required condition is true */
> > +     if (!micfil->pll8k_clk || !micfil->pll11k_clk)
> > +             return 0;
> > +
> > +     ratio = do_div(ratio, 8000) ? CLK_11K_FREQ : CLK_8K_FREQ;
> > +
> > +     /* Get root clock */
> > +     clk = micfil->mclk;
> > +     if (IS_ERR_OR_NULL(clk)) {
> > +             dev_err(dev, "no mclk clock in devicetree\n");
> > +             return PTR_ERR(clk);
> > +     }
> > +
> > +     /* Disable clock first, for it was enabled by pm_runtime */
> > +     clk_disable_unprepare(clk);
> > +     fsl_asoc_reparent_pll_clocks(dev, clk, micfil->pll8k_clk,
> > +                                  micfil->pll11k_clk, ratio);
> > +     ret = clk_prepare_enable(clk);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return 0;
> > +}
>
> Seems like more of this logic could be factored out into the reparent
> function if the target sample rate is passed in?
>

Yes, let me update.

Best regards
Wang Shengjiu
