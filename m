Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FAC11C74
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 17:17:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C91817CC;
	Thu,  2 May 2019 17:16:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C91817CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556810223;
	bh=UspU1c4hN6g9YqlFTidyAr96rArUfNmVDrjUdBf+qAM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JEGn5XQ1h2C8YCYzS6J0j/p6aBtWt2tMRMqZ5eWGhDcgnEdZnE8V4U9hb/A+aCqWJ
	 L8lRWhXfB3rASGsU0luHZ95rLtSaQEdMlSsp18f+Tt6RstyLvylsgkL+SOPjFmSvDg
	 RnufZ6sMQtU/sLgAJ02IE9owJGd5iKygj5zTXcno=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F113F896AA;
	Thu,  2 May 2019 17:15:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 564C9F8075A; Thu,  2 May 2019 17:15:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2A09F8075A
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 17:15:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2A09F8075A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EPo1FtKg"
Received: from localhost (unknown [171.76.113.243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EE6DD20675;
 Thu,  2 May 2019 15:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556810112;
 bh=OggtsDeCoyhCYtPt9b8NNbr9ahOB+qZRIcooSiSW/78=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EPo1FtKgC5Nj5tElq36FtQhcHUPZduOZZ7H/ZnqddUx8OFNE9ay6IH1eesK0fm2Qs
 Yh+JEFrRBs1LKq+uFN3C7M52Iq2pfKvmKdIQRlJwbH4KZ7mORdVCPNhz39PLQI+aSY
 EiNXVMRxjggefHeDQCCjnCs4Oz5o8KIJ6ZLU5t/M=
Date: Thu, 2 May 2019 20:45:02 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <20190502151502.GR3845@vkoul-mobl.Dlink>
References: <20190502105930.9889-1-vkoul@kernel.org>
 <20190502105930.9889-2-vkoul@kernel.org>
 <20190502150754.GA17197@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190502150754.GA17197@kroah.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: alsa-devel@alsa-project.org, Shreyas NC <shreyas.nc@intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 01/14] soundwire: fix kconfig help format
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

On 02-05-19, 17:07, Greg KH wrote:
> On Thu, May 02, 2019 at 04:29:17PM +0530, Vinod Koul wrote:
> > Move to help format instead of --help-- as that is not recommended and
> > this makes file consistent with other instance
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  drivers/soundwire/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/soundwire/Kconfig b/drivers/soundwire/Kconfig
> > index 84876a74874f..53b55b79c4af 100644
> > --- a/drivers/soundwire/Kconfig
> > +++ b/drivers/soundwire/Kconfig
> > @@ -28,7 +28,7 @@ config SOUNDWIRE_INTEL
> >  	select SOUNDWIRE_CADENCE
> >  	select SOUNDWIRE_BUS
> >  	depends on X86 && ACPI && SND_SOC
> > -	---help---
> > +	help
> >  	  SoundWire Intel Master driver.
> >  	  If you have an Intel platform which has a SoundWire Master then
> >  	  enable this config option to get the SoundWire support for that
> > -- 
> > 2.20.1
> > 
> 
> Huh?
> 
> Pierre-Louis sent this patch before you did.  Why did you just rewrite
> the changelog text a bit and then ignore his authorship and
> signed-off-by?

This is not *that* instance! The one Pierre changed was for symbol
"SOUNDWIRE" and is already applied [1] this is for SOUNDWIRE_INTEL which
is another instance. If you have looked or cared, even the log mentions
"makes file consistent with other instance" 

This series is on *top* on the "whole" series from Pierre

> That's a really really shitty thing to do, I'm going to go take his
> version of these patches instead, let me see how they line up...

Honestly, this is a terrible accusation, seems everyone is quick to jump
and yell at others. I asking for an apology.

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
