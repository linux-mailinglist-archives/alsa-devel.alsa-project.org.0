Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E37D230F618
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 16:23:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6981F1666;
	Thu,  4 Feb 2021 16:22:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6981F1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612452190;
	bh=uT9wUc3DPDe9PIH0wltlcHeaNWMbLdT1AjzUT8F+hCU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PohlrGy2Z0D7ZQmhqpEjhIxm5QrMduwrq8QALfzpnO6GxFMGSToh7EVXXkq8bs9bn
	 0OB6ygAVk+XDe/xlPfD63eOpv6tdYhHnL6G5mRBvelKBRWB/wzfW2kyGpYl/mY0SPc
	 Z33gL4Q8MPQ09wYylYGdq+xADwD4hzHx/gMx896s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EB85F801F7;
	Thu,  4 Feb 2021 16:21:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 356D7F80171; Thu,  4 Feb 2021 16:21:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15336F80152
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 16:21:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15336F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="VYti8uRm"
Received: by mail-wr1-x42d.google.com with SMTP id g10so4003935wrx.1
 for <alsa-devel@alsa-project.org>; Thu, 04 Feb 2021 07:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=vA/eQ2S58koKaVheuxAPbUo6pEs5SmDGNUESF9JP+0A=;
 b=VYti8uRm2dyw6UwX8aXW2oV2DL1UgHJ4rEUzb5RzcktTeGTufd/d6F/gqYPL+qhzzB
 RbultCZ8rdkXrfv4yvMuSztOX25uVckOuykH+d7JKM2/E0RpttgrVpR7SmHbJbdaeBJ1
 j7qGj70tVfcriTnXNOaSQrt+1q1Qrvnt6P8UBoZsGxK8S4ub/SJ7y8Mo39VuSUfceYnA
 k6jIo7seCmvdOutxrRx0GGY9pwUF3U2ToL1Yfyfl2WWbZ3lSuBhls/u4duYxDl2al/Kt
 hgubF2KfhfiQEVHRSCSUHhDHkP4mE/UguAVhkpWdzOLG1kicazqjfQPDUNSyqYIRBZ+c
 cHmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=vA/eQ2S58koKaVheuxAPbUo6pEs5SmDGNUESF9JP+0A=;
 b=AdGpIKPeUejC9vQvl8Uhe4v+7hRBOp+tFQfdSD2uI4tuDr1G8or0+nFrrB3PivNCz0
 mpuWVjqChPSTzUno3QhecVjOjCxXvru0VsrAMs34tWIphZglp+0lOliORZC6+B9O4KYd
 DL7zuuJX0ilYErj3FiZFgM9ECJKE6MYviSerIxuFbbNOoIz2wHPkKtJ6Q+oowEXuVAtv
 CEiZ3dG/gYoxhgvRCnrLYWvJAXCiTBDNxrTaGd3VZkHBLoH75k1rs2anvKJubU6ssFF7
 +ScwAIhc0Bp3asDiakLYke2ZRzUanJU5YwsdaD3yyDGVh9MFw7wXyOTy9ayB00YXWdFf
 sYUg==
X-Gm-Message-State: AOAM5304kfh8qQL/OEjCcuhJ+8iI/20robHYWiklDczgi9MGT22YQaOI
 BBbkKF+0369OaLYmESOi2S+qGA==
X-Google-Smtp-Source: ABdhPJy0TbSsLuS/p2WzRPai8cnyw5jXXrUIeWK7iACJ/7tWSzo8KmbSSE4PPpWjajdKad9sJhaTuA==
X-Received: by 2002:adf:ea51:: with SMTP id j17mr10448625wrn.382.1612452086502; 
 Thu, 04 Feb 2021 07:21:26 -0800 (PST)
Received: from dell ([91.110.221.188])
 by smtp.gmail.com with ESMTPSA id c18sm19955797wmk.0.2021.02.04.07.21.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 07:21:25 -0800 (PST)
Date: Thu, 4 Feb 2021 15:21:24 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 0/5] MFD/ASoC: Add support for Intel Bay Trail boards
 with WM5102 codec
Message-ID: <20210204152124.GO2789116@dell>
References: <20210120214957.140232-1-hdegoede@redhat.com>
 <249f1a7c-048e-d255-d860-68a97a0092c8@redhat.com>
 <20210204105748.GD2789116@dell>
 <7f53dede-946e-c38e-e871-3df1119f1faf@redhat.com>
 <20210204124335.GA4288@sirena.org.uk>
 <20210204134606.GH2789116@dell>
 <20210204150904.GD4288@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210204150904.GD4288@sirena.org.uk>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
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

On Thu, 04 Feb 2021, Mark Brown wrote:

> On Thu, Feb 04, 2021 at 01:46:06PM +0000, Lee Jones wrote:
> > On Thu, 04 Feb 2021, Mark Brown wrote:
> 
> > > The usual pattern here is that the MFD patches get merged and then I
> > > pull a shared branch in for any dependencies - at this point the series
> > > is now on the backlog of serieses where I'm waiting for the MFD to sort
> > > itself out before I really look at it again.
> 
> > I tend to push patches awaiting Acks to the back of the queue.
> 
> > Stalemate.
> 
> I'm only going to ack things if I expect to see them applied via another
> tree, that's generally what an ack means from a maintainer.  Especially
> with ASoC where we keep on having subsystem wide changes quite often I'm
> not likely to do that for things like new drivers unless it's very clear
> what the timelines are.
> 
> It would be enormously helpful to get the bits of the core MFDs that
> create dependencies committed while the rest of the series is still in
> process, as well as allowing things to be applied it also helps with
> knowing if the dependencies are stable.

The default point-of-view is; if a patch was submitted as part of a
set, it's likely that it makes the most sense to merge it as a set.

Very often sets will have inter-dependencies (usually headers) which
would otherwise require the base patches to be applied (perhaps the
MFD core and the headers) in one release, followed by the accompanying
child device changes during a subsequent release.  This doesn't scale
well and puts the contributor in an unfair position.

This is how we usually work together.  Why is ASoC so different?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
