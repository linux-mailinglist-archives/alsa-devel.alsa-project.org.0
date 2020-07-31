Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 754D9234B5F
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jul 2020 20:57:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 261D9168F;
	Fri, 31 Jul 2020 20:56:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 261D9168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596221848;
	bh=jS1U4zFDamDkVxZwKJMZWoe2ooesb2SZQVbitfvRu1I=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c/bUl2IYtAGLtaK6HQ9fF7PJGvkVehxpEqcvz1JOMGRgyxQNZ04MehzxM9AriR7IR
	 v8EEnmPFvqiG4Ga+P0pIG+GNKufIm+1yB8vWGVgtfbGEbKvOl2DXp2WIdMPhkrr/J1
	 uWQIRataWSpsv+C/TnXVeMoxGupRjmQJ8w12eBaM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07957F802C2;
	Fri, 31 Jul 2020 20:55:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3A2DF802BE; Fri, 31 Jul 2020 20:55:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_13,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E93D4F80292
 for <alsa-devel@alsa-project.org>; Fri, 31 Jul 2020 20:54:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E93D4F80292
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ln8yi3GE"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DB7232076B;
 Fri, 31 Jul 2020 18:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596221698;
 bh=jS1U4zFDamDkVxZwKJMZWoe2ooesb2SZQVbitfvRu1I=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=ln8yi3GE3vhvcFG2k8S9Qjp3IZpII2VUpDPaxJMt85QZbFtefUTPoh4c0W3r4L6u6
 LEFS0v4TnWyC7TkC3a7BVRgu6VNZBTWuzWD+9X+QJmyxEiH2FTesoleWY1/3vjBt2C
 87g5UvNf8U3KZsdN2cuUhVd1L5RBM22z7eURZ89w=
Date: Fri, 31 Jul 2020 19:54:38 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20200729162910.13196-1-laurent.pinchart@ideasonboard.com>
References: <20200729162910.13196-1-laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 0/3] Fix Kconfig dependency issue with DMAENGINES selection
Message-Id: <159622167149.22822.4163044113413538310.b4-ty@kernel.org>
Cc: Hyun Kwon <hyun.kwon@xilinx.com>, Randy Dunlap <rdunlap@infradead.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Michal Simek <michal.simek@xilinx.com>,
 Alexandre Bounine <alex.bou9@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Matt Porter <mporter@kernel.crashing.org>
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

On Wed, 29 Jul 2020 19:29:07 +0300, Laurent Pinchart wrote:
> This small series fixes a Kconfig dependency issue with the recently
> merged Xilixn DPSUB DRM/KMS driver. The fix is in patch 3/3, but
> requires a separate fixes in patches 1/3 and 2/3 to avoid circular
> dependencies:
> 
> 	drivers/i2c/Kconfig:8:error: recursive dependency detected!
> 	drivers/i2c/Kconfig:8:  symbol I2C is selected by FB_DDC
> 	drivers/video/fbdev/Kconfig:63: symbol FB_DDC depends on FB
> 	drivers/video/fbdev/Kconfig:12: symbol FB is selected by DRM_KMS_FB_HELPER
> 	drivers/gpu/drm/Kconfig:80:     symbol DRM_KMS_FB_HELPER depends on DRM_KMS_HELPER
> 	drivers/gpu/drm/Kconfig:74:     symbol DRM_KMS_HELPER is selected by DRM_ZYNQMP_DPSUB
> 	drivers/gpu/drm/xlnx/Kconfig:1: symbol DRM_ZYNQMP_DPSUB depends on DMA_ENGINE
> 	drivers/dma/Kconfig:44: symbol DMA_ENGINE depends on DMADEVICES
> 	drivers/dma/Kconfig:6:  symbol DMADEVICES is selected by SND_SOC_SH4_SIU
> 	sound/soc/sh/Kconfig:30:        symbol SND_SOC_SH4_SIU is selected by SND_SIU_MIGOR
> 	sound/soc/sh/Kconfig:60:        symbol SND_SIU_MIGOR depends on I2C
> 	For a resolution refer to Documentation/kbuild/kconfig-language.rst
> 	subsection "Kconfig recursive dependency limitations"
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sh: Replace 'select' DMADEVICES 'with depends on'
      commit: 2dbf11ec7d3a63ebde946b5747ad6bd74d45adb1

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
