Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D32C9242473
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Aug 2020 06:01:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62713166D;
	Wed, 12 Aug 2020 06:00:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62713166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597204884;
	bh=Sb4NHeOvwvLl7zWwn8/9QvmOut296xUPDSZPKp9RxUE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CGYMd9cT+yJsDZxfrr4aeu5mP+gSFmx68QBqtGcO4Q4pyBT9yHIJp7HHReyVulWKI
	 aBxCvSBmj5rJVQsWDqL65j2N2NKaaG4I0VPHLiWg3OqaFPgysi7GZAo93SbBm14yhu
	 cFc5PBLXNUt7gXd6W4KiaTL+LbveKfsk7tQTtMTs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97C4BF800F4;
	Wed, 12 Aug 2020 05:59:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83012F8022B; Wed, 12 Aug 2020 05:59:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_13,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1205EF800F4
 for <alsa-devel@alsa-project.org>; Wed, 12 Aug 2020 05:59:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1205EF800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XWD91RYe"
Received: from localhost (unknown [122.171.202.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3F65C207F7;
 Wed, 12 Aug 2020 03:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597204774;
 bh=Sb4NHeOvwvLl7zWwn8/9QvmOut296xUPDSZPKp9RxUE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XWD91RYe9OFSYn0TYx+/w89WfcYtoPO3ZO14hOTtCZkDZ8mFfKARWd6sCbwtr1TEU
 azXSCU0fHjHdlXHwSG2fh/wCEvPh7WTFY7yGGX+57qBjy8ZJo2kXJsVQBpfytmoR/8
 7H2xPmpaMZkBRziHqH9qOH9jqaSJVW8DYDeQxZwc=
Date: Wed, 12 Aug 2020 09:29:29 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 0/3] Fix Kconfig dependency issue with DMAENGINES
 selection
Message-ID: <20200812035929.GS12965@vkoul-mobl>
References: <20200731152433.1297-1-laurent.pinchart@ideasonboard.com>
 <20200731164744.GF12965@vkoul-mobl>
 <20200731204206.GC24315@pendragon.ideasonboard.com>
 <20200802064409.GH12965@vkoul-mobl>
 <20200811225203.GG17446@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200811225203.GG17446@pendragon.ideasonboard.com>
Cc: alsa-devel@alsa-project.org, Hyun Kwon <hyun.kwon@xilinx.com>,
 Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, Michal Simek <michal.simek@xilinx.com>,
 Alexandre Bounine <alex.bou9@gmail.com>, Mark Brown <broonie@kernel.org>,
 dmaengine@vger.kernel.org, Matt Porter <mporter@kernel.crashing.org>
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

HI Laurent,

On 12-08-20, 01:52, Laurent Pinchart wrote:
> Hi Vinod,
> 
> On Sun, Aug 02, 2020 at 12:14:09PM +0530, Vinod Koul wrote:
> > On 31-07-20, 23:42, Laurent Pinchart wrote:
> > > On Fri, Jul 31, 2020 at 10:17:44PM +0530, Vinod Koul wrote:
> > > > On 31-07-20, 18:24, Laurent Pinchart wrote:
> > > > > Hello,
> > > > > 
> > > > > This small series fixes a Kconfig dependency issue with the recently
> > > > > merged Xilixn DPSUB DRM/KMS driver. The fix is in patch 3/3, but
> > > > > requires a separate fixes in patches 1/3 and 2/3 to avoid circular
> > > > > dependencies:
> > > > > 
> > > > >         drivers/i2c/Kconfig:8:error: recursive dependency detected!
> > > > >         drivers/i2c/Kconfig:8:  symbol I2C is selected by FB_DDC
> > > > >         drivers/video/fbdev/Kconfig:63: symbol FB_DDC depends on FB
> > > > >         drivers/video/fbdev/Kconfig:12: symbol FB is selected by DRM_KMS_FB_HELPER
> > > > >         drivers/gpu/drm/Kconfig:80:     symbol DRM_KMS_FB_HELPER depends on DRM_KMS_HELPER
> > > > >         drivers/gpu/drm/Kconfig:74:     symbol DRM_KMS_HELPER is selected by DRM_ZYNQMP_DPSUB
> > > > >         drivers/gpu/drm/xlnx/Kconfig:1: symbol DRM_ZYNQMP_DPSUB depends on DMA_ENGINE
> > > > >         drivers/dma/Kconfig:44: symbol DMA_ENGINE depends on DMADEVICES
> > > > >         drivers/dma/Kconfig:6:  symbol DMADEVICES is selected by SND_SOC_SH4_SIU
> > > > >         sound/soc/sh/Kconfig:30:        symbol SND_SOC_SH4_SIU is selected by SND_SIU_MIGOR
> > > > >         sound/soc/sh/Kconfig:60:        symbol SND_SIU_MIGOR depends on I2C
> > > > >         For a resolution refer to Documentation/kbuild/kconfig-language.rst
> > > > >         subsection "Kconfig recursive dependency limitations"
> > > > > 
> > > > > Due to the DPSUB driver being merged in v5.9, this is a candidate fix
> > > > > for v5.9 as well. 1/3 and 2/3 can be merged independently, 3/3 depends
> > > > > on the first two. What's the best course of action, can I merge this all
> > > > > in a single tree, or should the rapidio and ASoC patches be merged
> > > > > independently early in the -rc cycle, and the DRM patch later on top ? I
> > > > > don't expect conflicts (especially in 2/3 and 3/3), so merging the whole
> > > > > series in one go would be simpler in my opinion.
> > > > 
> > > > Acked-By: Vinod Koul <vkoul@kernel.org>
> > > 
> > > Thank you.
> > > 
> > > As Mark as queued the sound fix in his for-next branch for v5.9, could
> > > you queue the dmaengine fix for v5.9 too ?
> > 
> > Dmaengine? I see three patches none of which touch dmaengine..
> > Did I miss something?
> 
> I'm not sure what I was thinking... It's the rapidio patch that needs to
> be merged.

No worries :)

> Matt, Alexandre, can you either merge the patch as a v5.9 fix, or give
> me an ack to get it merged through the DRM tree ?
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
~Vinod
