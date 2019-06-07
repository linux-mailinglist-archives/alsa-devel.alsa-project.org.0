Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2F139831
	for <lists+alsa-devel@lfdr.de>; Sat,  8 Jun 2019 00:07:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AD50165E;
	Sat,  8 Jun 2019 00:06:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AD50165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559945229;
	bh=04yU7NdCF8Sj+3poQZeGkSO9GOKTo6QW42lOfWv8dZs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OsgC67vDJj9JdAjg5vUkUFxW0Rv8sxC1byb0/27ySXqU0q3bp3KjKvg/60mDJjX3K
	 AJqaiCEGzom+kFI7TB2+IHljrW+ayAoLnGi7KPD+kpCWUwQuoIyTslmLL3FP8sijBz
	 /ajYRX/tpO8XUTvHEX8LpecSmMIUrRDtxTvYDFns=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD9CCF80709;
	Sat,  8 Jun 2019 00:05:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD76CF896DD; Sat,  8 Jun 2019 00:05:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24CFBF896CE
 for <alsa-devel@alsa-project.org>; Sat,  8 Jun 2019 00:05:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24CFBF896CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="eQ8X5t7S"
Received: by mail-pl1-x643.google.com with SMTP id bi6so915301plb.12
 for <alsa-devel@alsa-project.org>; Fri, 07 Jun 2019 15:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=C3WCTEPJuMhnDtyj4nCQQWf8hst+6hFcFTW9HCjkuQc=;
 b=eQ8X5t7ShcbHZ2iAaeihT56yVGm93DJwoGdLe+RAL+T33ZJeM5dpHTBSOFHnV6exd2
 McjPg9HRK4VzL2d97TDKLdk4cgN6l4tkjv6zJgwUwj1poxqn1D4faGt9f0dgLEJvD4kI
 nlj2hFdkXuXE9V6dflG5xHbpe+pelkqjFJDVStQgh4TZr8C3CXVWdShiPtMOmz92io3F
 G/7PZiS1LCcwJLyHB6DMjE+r1mSTqQMSaVXt4uniH3d8iUxxoPLLsGtjpKOqkzsTcqbY
 izGdDivK3ySoKFH5HXbVfJ1MkBO+mwjFUh9lObsesRKIEoo/4P5NBkxPi/L9gGPIPE7F
 GoDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=C3WCTEPJuMhnDtyj4nCQQWf8hst+6hFcFTW9HCjkuQc=;
 b=Fg9DscO8oW55qIXFQ7qozcP1mAzy4Lj0M6aRiA70S7+63gZHdh62moPGZKKihXrfap
 Rw9PsBfK/BIwdQuB1Rl4Ozpu4mX9pQZxlfrnjiu9JAwcA2fXgtfCWFhH5zG+t/uE50rg
 13GbNJk1GiY5P3S/sL1+ep0+hCbeGroIrr/2t8kPlfuB6JRvT5OAOzHruSoDJtogXobO
 UANfmaCyw/g/XW+hNpE10Ez1pc+YV2s56AToAOmzg9YrgzWGBhJ4D6+acJ/D+zasScc9
 aVJdZK05ujn2yymxdP0D7NOCOwAM9gsoDfK0RpIl7i+75pFxPMQaUruJ9VQcEFSFpxDz
 hsFw==
X-Gm-Message-State: APjAAAV6BrUiYc4nel5EZtuPGdIy8lil2bYQXLkMiTIh1RX6AZU7Cs5R
 SaApJkNOuJTJl+X1P9paBgE=
X-Google-Smtp-Source: APXvYqw79sGEGu7vaJbDLnMprFiFeHzfXZWGcQnVHInNP3xeYbkjRgBIAgRsCI7J7qswMroRiib5FA==
X-Received: by 2002:a17:902:6ac6:: with SMTP id
 i6mr44253449plt.233.1559945116817; 
 Fri, 07 Jun 2019 15:05:16 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id d3sm3843748pfa.176.2019.06.07.15.05.15
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 07 Jun 2019 15:05:16 -0700 (PDT)
Date: Fri, 7 Jun 2019 15:05:18 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Mark Brown <broonie@kernel.org>
Message-ID: <20190607220517.GA3824@Asurada-Nvidia.nvidia.com>
References: <20190606230105.4385-1-nicoleotsuka@gmail.com>
 <20190607111244.GE2456@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190607111244.GE2456@sirena.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, shengjiu.wang@nxp.com, tiwai@suse.com,
 lgirdwood@gmail.com, festevam@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [RFC/RFT PATCH] Revert "ASoC: fsl_esai: ETDR and
 TX0~5 registers are non volatile"
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

Hello Mark,

On Fri, Jun 07, 2019 at 12:12:44PM +0100, Mark Brown wrote:
> On Thu, Jun 06, 2019 at 04:01:05PM -0700, Nicolin Chen wrote:
> > This reverts commit 8973112aa41b8ad956a5b47f2fe17bc2a5cf2645.
> 
> Please use subject lines matching the style for the subsystem.  This
> makes it easier for people to identify relevant patches.
> 
> > 1) Though ETDR and TX0~5 are not volatile but write-only registers,
> >    they should not be cached either. According to the definition of
> >    "volatile_reg", one should be put in the volatile list if it can
> >    not be cached.
> 
> There's no problem with caching write only registers, having a cache
> allows one to do read/modify/write cycles on them and can help with
> debugging.  The original reason we had cache code in ASoC was for write
> only devices.

Maybe because my paragraph doesn't state it clearly -- it's nothing
wrong with regmap caching write-only registers; but it caching data
registers would potentially cause dirty data or channel swap/shift.
So the reason (1) here is "cannot cached" == "should be volatile".

I will revise the commit message for review and fix the subject.

Thank you
Nicolin
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
