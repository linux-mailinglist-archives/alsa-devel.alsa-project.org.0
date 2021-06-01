Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5708B397965
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Jun 2021 19:43:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0295016EA;
	Tue,  1 Jun 2021 19:42:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0295016EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622569407;
	bh=pvsJKbGHDrbmKM6MGiHHEhxvVcd5x1ErIIHIUNALNr4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b3qBBNBH6LS7f/Opce2yDjMTBwwSrIozEtAIHvwsuAewj8vFFqi3/eWjJ2+eIEO1L
	 Pt3BkQ9XBTA1EMjGOPRWi3rx5yKwaS6auz9ZO1nzpJn9AhUkOLVtwxLSivlPX7z6p0
	 zRSlbAdahsEoOG6sroCkLTSEzsgTWr1CnA2SIfsg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1E47F804ED;
	Tue,  1 Jun 2021 19:39:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C618F804ED; Tue,  1 Jun 2021 19:39:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72D61F80253
 for <alsa-devel@alsa-project.org>; Tue,  1 Jun 2021 19:39:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72D61F80253
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="hCdIvaZ3"
Received: by mail-wm1-x329.google.com with SMTP id
 l11-20020a05600c4f0bb029017a7cd488f5so153288wmq.0
 for <alsa-devel@alsa-project.org>; Tue, 01 Jun 2021 10:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ckX1hE1X5h3eT0h/m87roO0T13qKCf4f5KvdLUNsq4o=;
 b=hCdIvaZ3ggx8MJWwoI0wdAuLtfW3Tu9VYnkPDYEyLybyzS91y4mMITNwwa3QL/4Mht
 oqjHcCf6UcjMyDqtkLezt7g4DiJvUGzl1UOXKkNC5NNxDoU5b/GKM6bC4Uix0LLXRGuf
 kkA5TROosspb4tYpPJKYmIDMAGXmGls5jkGPEoCPOvPZRAIVpgGuQn9WM0T5kBApiJY4
 UP7wcZ3qL1dlssEPeUuhP42iAUlffeFRSEj6I8T+qUd7Wds2iIpTTG5XwxueqIO52AQ9
 0vIkWml2TMbGzeVvKYxoEqFPe/vS1dEP/4n2GuCBA9g8mW1yN4hnbCs+R29cj4ciBhm8
 Opww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ckX1hE1X5h3eT0h/m87roO0T13qKCf4f5KvdLUNsq4o=;
 b=DU+ODcpNcmOeBdn2zbj+P2ucfn5uM/a+UzXcWnCiF6J/ihLBAEgZIGbF6cxnBz3vGC
 G7uBulRj4a3VJs38sGdODd5Hp6WnHG6/rgTo59B9jfmdLHFt/bM1g6lJT7H7LSxBICsm
 XYGwMiv2aFoC7XsbHbCfPEvgmEN0EIK6DzazsJtbcDQ521ykEfS/sOtEJn4CqpsM4BR1
 6ZtTSSYaWL3joyCSXHBajyf89l+8ufZ8au5wJCmgISn05qCxNnIDmabbtQQfVCIy2X9Q
 kflUHEzgH1PrNuBp7hhglwD1Pw70/s+ulyd/cHdtOQs1BIe3Bycorst6xLADfCay76YW
 RAqA==
X-Gm-Message-State: AOAM531LbWpsE1rBMgVum7LZ17YLGh+4R5e4CH47F+VcpXL/kF8PfVyB
 KKuwMf1J4m+VWildNDV6jA7weQ==
X-Google-Smtp-Source: ABdhPJxdYv0jyO7O9FAIymUSdidBrGWPRyusB38lpaRJIWB099ppNWFyLEdGstcGhIf1QxHTUYR1vQ==
X-Received: by 2002:a1c:4d09:: with SMTP id o9mr6206006wmh.149.1622569186491; 
 Tue, 01 Jun 2021 10:39:46 -0700 (PDT)
Received: from dell ([91.110.221.249])
 by smtp.gmail.com with ESMTPSA id h46sm4352686wrh.44.2021.06.01.10.39.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 10:39:45 -0700 (PDT)
Date: Tue, 1 Jun 2021 18:39:44 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Chris Morgan <macroalpha82@gmail.com>
Subject: Re: [GIT PULL] Immutable branch between MFD and ASoC due for the
 v5.14 merge window
Message-ID: <20210601173944.GA2173308@dell>
References: <20210519203754.27184-1-macroalpha82@gmail.com>
 <20210601140145.GH543307@dell> <20210601155832.GC2165650@dell>
 <20210601171708.GA3529@wintermute.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210601171708.GA3529@wintermute.localdomain>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 heiko@sntech.de, devicetree@vger.kernel.org, tiwai@suse.com,
 robh+dt@kernel.org, lgirdwood@gmail.com, linux-rockchip@lists.infradead.org,
 broonie@kernel.org, Chris Morgan <macromorgan@hotmail.com>, jbx6244@gmail.com,
 maccraft123mc@gmail.com
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

On Tue, 01 Jun 2021, Chris Morgan wrote:

> On Tue, Jun 01, 2021 at 04:58:32PM +0100, Lee Jones wrote:
> > On Tue, 01 Jun 2021, Lee Jones wrote:
> > 
> > > I've applied the non-Arm patches.
> > > 
> > > The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:
> > > 
> > >   Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)
> > > 
> > > are available in the Git repository at:
> > > 
> > >   git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tb-mfd-asoc-v5.14
> > > 
> > > for you to fetch changes up to 437faaa6cebadf8ff4c2c28d7cb26ed4e34aeb14:
> > > 
> > >   dt-bindings: Add Rockchip rk817 audio CODEC support (2021-06-01 13:40:41 +0100)
> > > 
> > > ----------------------------------------------------------------
> > > Immutable branch between MFD and ASoC due for the v5.14 merge window
> > > 
> > > ----------------------------------------------------------------
> > > Chris Morgan (3):
> > >       mfd: Add Rockchip rk817 audio CODEC support
> > >       ASoC: Add Rockchip rk817 audio CODEC support
> > >       dt-bindings: Add Rockchip rk817 audio CODEC support
> > > 
> > >  Documentation/devicetree/bindings/mfd/rk808.txt | 188 +++++++++
> > >  drivers/mfd/rk808.c                             |  81 ++++
> > >  include/linux/mfd/rk808.h                       |  81 ++++
> > >  sound/soc/codecs/Kconfig                        |   6 +
> > >  sound/soc/codecs/Makefile                       |   2 +
> > >  sound/soc/codecs/rk817_codec.c                  | 539 ++++++++++++++++++++++++
> > >  6 files changed, 897 insertions(+)
> > >  create mode 100644 sound/soc/codecs/rk817_codec.c
> > 
> > Looks like the builders reported a W=1 warning introduced by the set.
> > 
> > Would you like me to fix it and submit a patch?
> 
> I can't seem to reproduce the warning, are there more details as to
> what is causing it?

Yes, it's a W=1 warning.  Put that on your command line.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
