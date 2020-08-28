Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B086255524
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Aug 2020 09:28:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13F9E173B;
	Fri, 28 Aug 2020 09:27:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13F9E173B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598599729;
	bh=5VtJwAIqjRo8m3/A3PqgyBtUrnGNzj2MdnY7GmNZzkk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PE0plN5niZYg9Xvbngfjd5GFHbCgMMYtfonUGT/BxzQelV86d6UaMhcQGUPhZpc9m
	 cFBqUq5DOYS2Nt1qiFyzfbpy6L4htMlCNy937Ym0Ltcmpa5HsjTpgkZ82JdOk/POyk
	 Z/HZl5etarK8pwly5nxaeLLU7x+tr9c3/RKhY+tA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1562BF8016F;
	Fri, 28 Aug 2020 09:23:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A990DF801D9; Fri, 28 Aug 2020 09:23:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B309F80143
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 09:23:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B309F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TNN/QFPj"
Received: from localhost (unknown [122.171.38.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 18A4420DD4;
 Fri, 28 Aug 2020 07:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598599426;
 bh=5VtJwAIqjRo8m3/A3PqgyBtUrnGNzj2MdnY7GmNZzkk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TNN/QFPjKawKCVc1KEdQSFVrMU+dMWopIxw033y4WIIekyPMNFmP4dpLBZxDDSvqF
 ImIyBpxdq0uwaKkQZa4wc44w7bvUwxHKOB5iILNl4enoLGHfOPqc+5x6N3TUKF6CDN
 fgnH294NFFT9jv6tZ1f30CiUxDEmjFCX2U1U7F5w=
Date: Fri, 28 Aug 2020 12:53:42 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 4/4] regmap: sdw: add support for SoundWire 1.2 MBQ
Message-ID: <20200828072342.GK2639@vkoul-mobl>
References: <20200825171656.75836-1-pierre-louis.bossart@linux.intel.com>
 <20200825171656.75836-5-pierre-louis.bossart@linux.intel.com>
 <20200826090542.GZ2639@vkoul-mobl>
 <c5119781-bee0-f11b-eb73-cd2da6ab09f5@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5119781-bee0-f11b-eb73-cd2da6ab09f5@linux.intel.com>
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

On 26-08-20, 11:57, Pierre-Louis Bossart wrote:
> 
> > > +#include <linux/device.h>
> > > +#include <linux/errno.h>
> > > +#include <linux/mod_devicetable.h>
> > 
> > Curious why do you need this header?
> 
> I'll return the question back to you, since you added this header for
> regmap-sdw.c:
> 
> 7c22ce6e21840 (Vinod Koul           2018-01-08 15:50:59 +0530  6) #include
> <linux/mod_devicetable.h>

Looks like it should be removed :)

I could compile it without any issues on few archs I do. let me push the
patch on my tree and see if bots are happy, will send the patch

> 
> so I assumed it was needed here as well.
> 
> > > +MODULE_DESCRIPTION("Regmap SoundWire Module");
> > 
> > This is same of sdw module, pls make this one a bit different.
> 
> yes, fixed.

-- 
~Vinod
