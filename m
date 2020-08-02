Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FDE2355BC
	for <lists+alsa-devel@lfdr.de>; Sun,  2 Aug 2020 08:46:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C39D516A4;
	Sun,  2 Aug 2020 08:45:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C39D516A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596350801;
	bh=X3mkD7RZZ1AgeK/4J92tDZwIJB1+lI9JjZ0GBWy5Zm4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uOf/pS+aTliawHIAOqO5RnckRk1650mcu12dnvetRBuE0+gRSjQIvufW6w2rt3YtL
	 JNzyb/FlDR/jr6FR9rokwPydm7BlsorA5iZm9SsbBOUqMzjebfgcC2PMy5OayueCk4
	 JxFesPDmANO0DabQy23IGyRZpWVZkXUgmA9/z1KY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0982FF8027D;
	Sun,  2 Aug 2020 08:44:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBE3FF8015D; Sun,  2 Aug 2020 08:44:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_13,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C6D3F800B7
 for <alsa-devel@alsa-project.org>; Sun,  2 Aug 2020 08:44:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C6D3F800B7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FwpZoje1"
Received: from localhost (unknown [122.171.202.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CB597207FB;
 Sun,  2 Aug 2020 06:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596350654;
 bh=X3mkD7RZZ1AgeK/4J92tDZwIJB1+lI9JjZ0GBWy5Zm4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FwpZoje1TbIJ68iQaOJPnkY+RgtH8WlN+xSMXPSBBaOn8oxBGhheVwuDc9JVBRnH4
 sla6un5LhRbtbsmAgUVFxkXufDH+UVzNk+nKL6TAaSm/vmHnPqI2ibQe/x9DWVTKhU
 rbaB+oQXX0/XzVKiuhiDzG59i/7Zb9XMrMIakM0c=
Date: Sun, 2 Aug 2020 12:14:09 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 0/3] Fix Kconfig dependency issue with DMAENGINES
 selection
Message-ID: <20200802064409.GH12965@vkoul-mobl>
References: <20200731152433.1297-1-laurent.pinchart@ideasonboard.com>
 <20200731164744.GF12965@vkoul-mobl>
 <20200731204206.GC24315@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200731204206.GC24315@pendragon.ideasonboard.com>
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

On 31-07-20, 23:42, Laurent Pinchart wrote:
> Hi Vinod,
> 
> On Fri, Jul 31, 2020 at 10:17:44PM +0530, Vinod Koul wrote:
> > On 31-07-20, 18:24, Laurent Pinchart wrote:
> > > Hello,
> > > 
> > > This small series fixes a Kconfig dependency issue with the recently
> > > merged Xilixn DPSUB DRM/KMS driver. The fix is in patch 3/3, but
> > > requires a separate fixes in patches 1/3 and 2/3 to avoid circular
> > > dependencies:
> > > 
> > >         drivers/i2c/Kconfig:8:error: recursive dependency detected!
> > >         drivers/i2c/Kconfig:8:  symbol I2C is selected by FB_DDC
> > >         drivers/video/fbdev/Kconfig:63: symbol FB_DDC depends on FB
> > >         drivers/video/fbdev/Kconfig:12: symbol FB is selected by DRM_KMS_FB_HELPER
> > >         drivers/gpu/drm/Kconfig:80:     symbol DRM_KMS_FB_HELPER depends on DRM_KMS_HELPER
> > >         drivers/gpu/drm/Kconfig:74:     symbol DRM_KMS_HELPER is selected by DRM_ZYNQMP_DPSUB
> > >         drivers/gpu/drm/xlnx/Kconfig:1: symbol DRM_ZYNQMP_DPSUB depends on DMA_ENGINE
> > >         drivers/dma/Kconfig:44: symbol DMA_ENGINE depends on DMADEVICES
> > >         drivers/dma/Kconfig:6:  symbol DMADEVICES is selected by SND_SOC_SH4_SIU
> > >         sound/soc/sh/Kconfig:30:        symbol SND_SOC_SH4_SIU is selected by SND_SIU_MIGOR
> > >         sound/soc/sh/Kconfig:60:        symbol SND_SIU_MIGOR depends on I2C
> > >         For a resolution refer to Documentation/kbuild/kconfig-language.rst
> > >         subsection "Kconfig recursive dependency limitations"
> > > 
> > > Due to the DPSUB driver being merged in v5.9, this is a candidate fix
> > > for v5.9 as well. 1/3 and 2/3 can be merged independently, 3/3 depends
> > > on the first two. What's the best course of action, can I merge this all
> > > in a single tree, or should the rapidio and ASoC patches be merged
> > > independently early in the -rc cycle, and the DRM patch later on top ? I
> > > don't expect conflicts (especially in 2/3 and 3/3), so merging the whole
> > > series in one go would be simpler in my opinion.
> > 
> > Acked-By: Vinod Koul <vkoul@kernel.org>
> 
> Thank you.
> 
> As Mark as queued the sound fix in his for-next branch for v5.9, could
> you queue the dmaengine fix for v5.9 too ?

Dmaengine? I see three patches none of which touch dmaengine..
Did I miss something?

Thanks

-- 
~Vinod
