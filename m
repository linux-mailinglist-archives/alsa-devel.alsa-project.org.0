Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BFB476956
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Dec 2021 06:04:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE7821A74;
	Thu, 16 Dec 2021 06:03:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE7821A74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639631049;
	bh=nyc0HbH7xUohJyZPvZzPv1FDVXKFrrzDgz92MgUDLQc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XNx8C0LJ2vbwQaFCAHIsyA/YPgoyyDmc/p+0DgwojQ8daIhD82kmECEU46vhl2rPR
	 SbYeZjIndrfCnkaFLrw6Sdv8VDWhRpZcmq2AafO3ZN/Q7ZGw6F/2sRbSP67y88jWjC
	 z8XuE6+Kmas3akcqYpQu/l6WHtPPgiKBenm3X1VU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CF28F800DE;
	Thu, 16 Dec 2021 06:03:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4AFB3F8014C; Thu, 16 Dec 2021 06:02:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FSL_HELO_FAKE,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26873F800B0
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 06:02:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26873F800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="mQ60iAZH"
Received: by mail-pg1-x534.google.com with SMTP id j11so21996083pgs.2
 for <alsa-devel@alsa-project.org>; Wed, 15 Dec 2021 21:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=pfDndh5e7Tg9q69/YQCj2DgRuK6iAt8tciGnd8xjSmI=;
 b=mQ60iAZHmviFhEZtFnaYnuwg7xBPRGJJ8/24Gz5sxtDAv4ZjLaJWmxB+KO0MAA13tO
 Qd1nmvYJFU8zT5YOa1qI7rWVU4gKTR3/dJHiPA7L7fdo2Wjfu2vHT7klLTbcde6k8HVX
 2009CeKdaus3+e1oCfWW3eZDD1BwKTMVXB3+foDdqUGH+nbAyjyQbo5I7KliLtVRCRkA
 +Cn8geXx9lHF5vZv6SepQssTvui2xIxZSOEU4EFH+kg+7OfgAROubebzmmfGsOQo/hSq
 ivD92P1tFRDCCukstrweUvb/gdLH3WJ0jK/fA990hefh/eT/yV6CSscXz3DBV0Qnc+OW
 Asaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pfDndh5e7Tg9q69/YQCj2DgRuK6iAt8tciGnd8xjSmI=;
 b=7v/XSfS1lGWGV7WwqYEO/yBq/T6M+wGPhBuONZG8s1VxWtyImECv/qr+InVpy9XtFs
 1ACK9mpg5A3eqeNqdH6Czji7T2eKXDpYcm/hVKV7offuXNKSAtM84fzaJ45pr6nL58Ko
 sPEab5h6Da1xElFYnnCnRpAYBZwC4bMN9y7vFuSiJ7aHiqxSKt24IFL2hY3oiiWTZX1c
 hnJbV15bjLKh0iA58f+r63sdN/AKOXIgx4V/RRdb9C3sIo97aiqR9v2+5nd5D3wNxi7J
 Ktmxxn/veAzL9O1ah3S5cJ3mjElKKRh0gqeoyDxBgbU7HS50pogX6ScwD5HZ73t7vS6X
 0Ltg==
X-Gm-Message-State: AOAM532m95Tqseh46gL9qSD0AM7DP0/n99gB0MA0OeEpcQuWf+wFLk04
 zd8P238S/Ug0/ptENiY6tLeS1w==
X-Google-Smtp-Source: ABdhPJwVq8Jr3aN71SKClzCOk34eBWZvVcMoOmFxHXjyNBwML3uULOKbn6p3eon3jHFwIvPuypS/8w==
X-Received: by 2002:a63:5a18:: with SMTP id o24mr10519774pgb.459.1639630970703; 
 Wed, 15 Dec 2021 21:02:50 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:af33:9cc2:c307:ce8c])
 by smtp.gmail.com with ESMTPSA id j22sm4599968pfj.130.2021.12.15.21.02.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 21:02:50 -0800 (PST)
Date: Thu, 16 Dec 2021 13:02:47 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Trevor Wu <trevor.wu@mediatek.com>
Subject: Re: [PATCH 1/2] ASoC: mediatek: mt8195: update control for RT5682
 series
Message-ID: <YbrId5gnJSjeT1Ni@google.com>
References: <20211215065835.3074-1-trevor.wu@mediatek.com>
 <YbmlT+OSwpGuylsx@google.com>
 <0b99c46f84c98c56e8fc99b2e103f52f756b5bf9.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b99c46f84c98c56e8fc99b2e103f52f756b5bf9.camel@mediatek.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org, shumingf@realtek.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org, jiaxin.yu@mediatek.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
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

On Thu, Dec 16, 2021 at 11:37:34AM +0800, Trevor Wu wrote:
> On Wed, 2021-12-15 at 16:20 +0800, Tzung-Bi Shih wrote:
> > On Wed, Dec 15, 2021 at 02:58:34PM +0800, Trevor Wu wrote:
> > > @@ -1072,6 +1119,19 @@ static int
> > > mt8195_mt6359_rt1011_rt5682_dev_probe(struct platform_device *pdev)
> > >  		return -EINVAL;
> > >  	}
> > >  
> > > +	priv->i2so1_mclk = devm_clk_get(&pdev->dev, "i2so1_mclk");
> > > +	if (IS_ERR(priv->i2so1_mclk)) {
> > > +		ret = PTR_ERR(priv->i2so1_mclk);
> > > +		if (ret == -ENOENT) {
> > > +			dev_dbg(&pdev->dev,
> > > +				"Failed to get i2so1_mclk, defer
> > > probe\n");
> > > +			return -EPROBE_DEFER;
> > > +		}
> > 
> > Does devm_clk_get_optional() could make the block more concise?
> 
> Even though we use devm_clk_get_optional, we still have to handle the
> (-ENOENT) case in probe function. In my opinion, original
> implementation could be kept.

I am neutral to my original suggestion but devm_clk_get_optional() returns NULL if -ENONENT.
