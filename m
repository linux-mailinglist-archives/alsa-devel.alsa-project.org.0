Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1AD23486B
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jul 2020 17:27:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4B3B1699;
	Fri, 31 Jul 2020 17:26:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4B3B1699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596209251;
	bh=1jEtHKBuUmX31jIArrukyhniEPcaJWdiV6IZDK8bqvw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=O6E46xt9yCzo3c/CvzpPCNRGDFFSgsw9enTdHbGKcPP+LzZS/fCQdR2wJXCvvO+1a
	 kYJVOIWCH2cOTABz5cxhfIq2kfPLH/80OY2+mPSfRZtvolmyy7OQkOt8eeMZFOMX2e
	 DDy+ceIpISIjYEJbjZlt2gEaOVtX2VUSJmcMJp8w=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E9EEF801ED;
	Fri, 31 Jul 2020 17:25:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06058F801EB; Fri, 31 Jul 2020 17:24:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_13,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90CC8F8015C
 for <alsa-devel@alsa-project.org>; Fri, 31 Jul 2020 17:24:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90CC8F8015C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.b="iyJx/eGq"
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C613253C;
 Fri, 31 Jul 2020 17:24:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1596209086;
 bh=1jEtHKBuUmX31jIArrukyhniEPcaJWdiV6IZDK8bqvw=;
 h=From:To:Cc:Subject:Date:From;
 b=iyJx/eGqicVHgTfLJWVe2f9ocLWfDcpHSnQDW1pebeN7jD6i8NTbEvHT7wp43zXwO
 mbAw7UCwQQYGN+9a7plPjP4rkwoX1XXpiQAsu59LTJmmGqr5ZlWqNilszpZpLr4G/g
 Gqxqo8OaSXK79KUt7SrOEyvpPNjoy/mthyhKdrbI=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org,
 alsa-devel@alsa-project.org
Subject: [PATCH v2 0/3] Fix Kconfig dependency issue with DMAENGINES selection
Date: Fri, 31 Jul 2020 18:24:30 +0300
Message-Id: <20200731152433.1297-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Hyun Kwon <hyun.kwon@xilinx.com>, Randy Dunlap <rdunlap@infradead.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Michal Simek <michal.simek@xilinx.com>,
 Alexandre Bounine <alex.bou9@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>, Matt Porter <mporter@kernel.crashing.org>
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

Hello,

This small series fixes a Kconfig dependency issue with the recently
merged Xilixn DPSUB DRM/KMS driver. The fix is in patch 3/3, but
requires a separate fixes in patches 1/3 and 2/3 to avoid circular
dependencies:

        drivers/i2c/Kconfig:8:error: recursive dependency detected!
        drivers/i2c/Kconfig:8:  symbol I2C is selected by FB_DDC
        drivers/video/fbdev/Kconfig:63: symbol FB_DDC depends on FB
        drivers/video/fbdev/Kconfig:12: symbol FB is selected by DRM_KMS_FB_HELPER
        drivers/gpu/drm/Kconfig:80:     symbol DRM_KMS_FB_HELPER depends on DRM_KMS_HELPER
        drivers/gpu/drm/Kconfig:74:     symbol DRM_KMS_HELPER is selected by DRM_ZYNQMP_DPSUB
        drivers/gpu/drm/xlnx/Kconfig:1: symbol DRM_ZYNQMP_DPSUB depends on DMA_ENGINE
        drivers/dma/Kconfig:44: symbol DMA_ENGINE depends on DMADEVICES
        drivers/dma/Kconfig:6:  symbol DMADEVICES is selected by SND_SOC_SH4_SIU
        sound/soc/sh/Kconfig:30:        symbol SND_SOC_SH4_SIU is selected by SND_SIU_MIGOR
        sound/soc/sh/Kconfig:60:        symbol SND_SIU_MIGOR depends on I2C
        For a resolution refer to Documentation/kbuild/kconfig-language.rst
        subsection "Kconfig recursive dependency limitations"

Due to the DPSUB driver being merged in v5.9, this is a candidate fix
for v5.9 as well. 1/3 and 2/3 can be merged independently, 3/3 depends
on the first two. What's the best course of action, can I merge this all
in a single tree, or should the rapidio and ASoC patches be merged
independently early in the -rc cycle, and the DRM patch later on top ? I
don't expect conflicts (especially in 2/3 and 3/3), so merging the whole
series in one go would be simpler in my opinion.

Compared to v1, commit messages have been fixed to mention DMADEVICES
instead of DMAENGINES.

Laurent Pinchart (3):
  rapidio: Replace 'select' DMADEVICES 'with depends on'
  ASoC: sh: Replace 'select' DMADEVICES 'with depends on'
  drm: xlnx: dpsub: Fix DMADEVICES Kconfig dependency

 drivers/gpu/drm/xlnx/Kconfig | 1 +
 drivers/rapidio/Kconfig      | 2 +-
 sound/soc/sh/Kconfig         | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

-- 
Regards,

Laurent Pinchart

