Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9234B118C25
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 16:11:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A78116AE;
	Tue, 10 Dec 2019 16:11:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A78116AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575990719;
	bh=yrCCA9y2feAaaNZRypVRAP6UKDL84nNw8BTOl9RY6rw=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tk21BjgAGR0sEx8coN2W5zeTjDW1CWjrdWgRL/bq7dGYTHYUAwhFT1NeEZ59+Lq4L
	 iscwtHcpPFzOLi7NgP3RmzMfK8idiQ34A67vUFX2txBWhHcR5ILchy2k+RAlvyHQvt
	 LHL9+3Watdwflrr6QqJ+fyTmIzPNtF/CIv1onBwY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FB98F80269;
	Tue, 10 Dec 2019 15:58:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 842A9F8020C; Tue, 10 Dec 2019 15:54:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70933F8024A
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 15:54:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70933F8024A
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2CD32AB92;
 Tue, 10 Dec 2019 14:54:12 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Date: Tue, 10 Dec 2019 15:53:43 +0100
Message-Id: <20191210145406.21419-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
X-Mailman-Approved-At: Tue, 10 Dec 2019 15:58:25 +0100
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Banajit Goswami <bgoswami@codeaurora.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Jerome Brunet <jbrunet@baylibre.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Patrick Lai <plai@codeaurora.org>, Michal Simek <michal.simek@xilinx.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Orson Zhai <orsonzhai@gmail.com>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 alsa-devel@alsa-project.org, Ray Jui <rjui@broadcom.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Timur Tabi <timur@kernel.org>,
 Scott Branden <sbranden@broadcom.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Sangbeom Kim <sbkim73@samsung.com>, Kevin Hilman <khilman@baylibre.com>,
 Baolin Wang <baolin.wang7@gmail.com>, Daniel Mack <daniel@zonque.org>
Subject: [alsa-devel] [PATCH for-5.6 00/23] ASoC: PCM API updates (part II)
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

this is the second part of PCM API updates for ASoC.
This one just removes the superfluous PCM ioctl ops (and relevant
cleanups).  Applicable on top of the previous patch set.


thanks,

Takashi

===

Takashi Iwai (23):
  ASoC: amd: Drop superfluous ioctl PCM ops
  ASoC: atmel: Drop superfluous ioctl PCM ops
  ASoC: au1x: Drop superfluous ioctl PCM ops
  ASoC: bcm: Drop superfluous ioctl PCM ops
  ASoC: dwc: Drop superfluous ioctl PCM ops
  ASoC: fsl: Drop superfluous ioctl PCM ops
  ASoC: intel: Drop superfluous ioctl PCM ops
  ASoC: kirkwood: Drop superfluous ioctl PCM ops
  ASoC: mediatek: Drop superfluous ioctl PCM ops
  ASoC: meson: Drop superfluous ioctl PCM ops
  ASoC: pxa: Drop superfluous ioctl PCM ops
  ASoC: qcom: Drop superfluous ioctl PCM ops
  ASoC: samsung: Drop superfluous ioctl PCM ops
  ASoC: sh: Drop superfluous ioctl PCM ops
  ASoC: generic-dmaengine: Drop superfluous ioctl PCM ops
  ASoC: SOF: Drop superfluous ioctl PCM ops
  ASoC: sprd: Drop superfluous ioctl PCM ops
  ASoC: txx9: Drop superfluous ioctl PCM ops
  ASoC: uniphier: Drop superfluous ioctl PCM ops
  ASoC: xilinx: Drop superfluous ioctl PCM ops
  ASoC: xtensa: Drop superfluous ioctl PCM ops
  ASoC: utils: Drop superfluous ioctl PCM ops
  ASoC: Drop snd_soc_pcm_lib_ioctl()

 include/sound/soc.h                                 |  5 -----
 sound/soc/amd/acp-pcm-dma.c                         |  1 -
 sound/soc/amd/raven/acp3x-pcm-dma.c                 |  1 -
 sound/soc/atmel/atmel-pcm-pdc.c                     |  1 -
 sound/soc/au1x/dbdma2.c                             |  1 -
 sound/soc/au1x/dma.c                                |  1 -
 sound/soc/bcm/cygnus-pcm.c                          |  1 -
 sound/soc/dwc/dwc-pcm.c                             |  1 -
 sound/soc/fsl/fsl_asrc_dma.c                        |  1 -
 sound/soc/fsl/fsl_dma.c                             |  1 -
 sound/soc/fsl/imx-pcm-fiq.c                         |  1 -
 sound/soc/fsl/mpc5200_dma.c                         |  1 -
 sound/soc/intel/atom/sst-mfld-platform-pcm.c        |  1 -
 sound/soc/intel/baytrail/sst-baytrail-pcm.c         |  1 -
 sound/soc/intel/haswell/sst-haswell-pcm.c           |  1 -
 sound/soc/intel/skylake/skl-pcm.c                   |  1 -
 sound/soc/kirkwood/kirkwood-dma.c                   |  1 -
 sound/soc/mediatek/common/mtk-afe-platform-driver.c |  1 -
 sound/soc/mediatek/common/mtk-btcvsd.c              |  1 -
 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c          |  1 -
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c          |  1 -
 sound/soc/meson/axg-frddr.c                         |  3 ---
 sound/soc/meson/axg-toddr.c                         |  3 ---
 sound/soc/pxa/mmp-pcm.c                             |  1 -
 sound/soc/pxa/pxa-ssp.c                             |  1 -
 sound/soc/pxa/pxa2xx-ac97.c                         |  1 -
 sound/soc/pxa/pxa2xx-i2s.c                          |  1 -
 sound/soc/pxa/pxa2xx-pcm.c                          |  1 -
 sound/soc/qcom/lpass-platform.c                     |  1 -
 sound/soc/qcom/qdsp6/q6asm-dai.c                    |  1 -
 sound/soc/samsung/idma.c                            |  1 -
 sound/soc/sh/dma-sh7760.c                           |  1 -
 sound/soc/sh/fsi.c                                  |  1 -
 sound/soc/sh/rcar/core.c                            |  1 -
 sound/soc/sh/siu_pcm.c                              |  1 -
 sound/soc/soc-core.c                                | 12 ------------
 sound/soc/soc-generic-dmaengine-pcm.c               |  2 --
 sound/soc/soc-utils.c                               |  1 -
 sound/soc/sof/pcm.c                                 |  1 -
 sound/soc/sprd/sprd-pcm-dma.c                       |  1 -
 sound/soc/txx9/txx9aclc.c                           |  1 -
 sound/soc/uniphier/aio-dma.c                        |  1 -
 sound/soc/xilinx/xlnx_formatter_pcm.c               |  1 -
 sound/soc/xtensa/xtfpga-i2s.c                       |  1 -
 44 files changed, 64 deletions(-)

-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
