Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F33A24B0EA
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Aug 2020 10:17:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AD3D167B;
	Thu, 20 Aug 2020 10:16:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AD3D167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597911445;
	bh=tddAiBcBg636YsUky6xQnxC3WBTnjkIrM7gdFJfAUQg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cyHJwxzPqJLjdlghbMI2JiSeYlkjtfT1qIwMU2w4bsHr2kmfewLo4xXHzHT44erhy
	 IqsHERRoziz0X21qTU6dF3eWjPSPShgm6zBLW/Z0SXEE/oC08KvCY++k8FtfUaFb2Z
	 o2sI2Yqklvlszr3KgPBWPvzuy7KeQsg0TyGxUsAM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89AA9F80114;
	Thu, 20 Aug 2020 10:15:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44617F80228; Thu, 20 Aug 2020 10:15:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,SUBJECT_DRUG_GAP_L,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18F3EF800D3
 for <alsa-devel@alsa-project.org>; Thu, 20 Aug 2020 10:15:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18F3EF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="10zAw+Ky"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8C9B1207DE;
 Thu, 20 Aug 2020 08:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597911323;
 bh=tddAiBcBg636YsUky6xQnxC3WBTnjkIrM7gdFJfAUQg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=10zAw+KyLlJbU0S3r/KJWy2PL+yM+t4glZ2QgmyYfdlogEd4NbDUBsbLnXFQR56Jr
 e2PIFfkXvrammwnmgiRoUtClVNl96hWnxw3oe3LyGyKuxzMsIxD5WHh54UM9n4h1h4
 P3A5ds6L1Y5s0hoqITiwVO67+1XDHV5ygnD11obI=
Date: Thu, 20 Aug 2020 10:15:43 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: Request to pick up couple NVIDIA Tegra ASoC patches into 5.7
 kernel
Message-ID: <20200820081543.GG4049659@kroah.com>
References: <2db6e1ef-5cea-d479-8a7a-8f336313cb1d@gmail.com>
 <20200813000800.GM2975990@sasha-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200813000800.GM2975990@sasha-vm>
Cc: alsa-devel@alsa-project.org, Erik Faye-Lund <kusmabite@gmail.com>,
 Mark Brown <broonie@kernel.org>, Stable <stable@vger.kernel.org>,
 Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Dmitry Osipenko <digetx@gmail.com>
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

On Wed, Aug 12, 2020 at 08:08:00PM -0400, Sasha Levin wrote:
> On Wed, Aug 12, 2020 at 10:14:34PM +0300, Dmitry Osipenko wrote:
> > Hello, stable-kernel maintainers!
> > 
> > Could you please cherry-pick these commits into the v5.7.x kernel?
> > 
> > commit 0de6db30ef79b391cedd749801a49c485d2daf4b
> > Author: Sowjanya Komatineni <skomatineni@nvidia.com>
> > Date:   Mon Jan 13 23:24:17 2020 -0800
> > 
> >    ASoC: tegra: Use device managed resource APIs to get the clock
> > 
> > commit 1e4e0bf136aa4b4aa59c1e6af19844bd6d807794
> > Author: Sowjanya Komatineni <skomatineni@nvidia.com>
> > Date:   Mon Jan 13 23:24:23 2020 -0800
> > 
> >    ASoC: tegra: Add audio mclk parent configuration
> > 
> > commit ff5d18cb04f4ecccbcf05b7f83ab6df2a0d95c16
> > Author: Sowjanya Komatineni <skomatineni@nvidia.com>
> > Date:   Mon Jan 13 23:24:24 2020 -0800
> > 
> >    ASoC: tegra: Enable audio mclk during tegra_asoc_utils_init()
> > 
> > It will fix a huge warnings splat during of kernel boot on NVIDIA Tegra
> > SoCs. For some reason these patches haven't made into 5.7 when it was
> > released and several people complained about the warnings. Thanks in
> > advance!
> 
> They never made it in because they don't have a stable tag, a fixes tag,
> or do they sound like they fix a problem :)
> 
> Do you have a reference to the issue at hand here?
> 
> Either way, 5.7 is alive for only about 1 or 2 weeks, is anyone still
> stuck on 5.7?

What's a few more patches :)

I've queued them up now, but people really should be moving to 5.8.y
now...

thanks,

gre gk-h
