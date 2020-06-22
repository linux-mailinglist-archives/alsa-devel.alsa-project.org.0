Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E672035E4
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jun 2020 13:40:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAE5116A0;
	Mon, 22 Jun 2020 13:39:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAE5116A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592826027;
	bh=OKCh/fWODx2ctvMsdy/gZmZCiu5KkfATF56rBs0BwQU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WuMz9PN1lafP8AphmLnQ2c0C/9qxVcGxrZIWgFoGqEhorHbr6MNaasBjcdAK46Q7B
	 H4nS1dCK/XrbEQkx0fkXkz7ClD8J/kBmh7CG+RgNughAnMT57A4GsOJaVYoGpaNOlY
	 ASlN48y/U6O1cS9819i0t6R8SeBK1VZCnzpQ/V0I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C51ADF8010E;
	Mon, 22 Jun 2020 13:39:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53BA9F801DB; Mon, 22 Jun 2020 13:39:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BCFCF8010E
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 13:39:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BCFCF8010E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kMy4aO6L"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A31332070E;
 Mon, 22 Jun 2020 11:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592825950;
 bh=OKCh/fWODx2ctvMsdy/gZmZCiu5KkfATF56rBs0BwQU=;
 h=From:To:Cc:Subject:Date:From;
 b=kMy4aO6LUmcLtyBQQQoUWyZtuSB7BhC6r+bM6PHYukYYvNSbPpbtvyApJGqTIJFUy
 KNEfwHlI0TaNZSGgI46uLVjKF4tDJYAIGjq0pnVFDMWIma+8zLnlc1mZ6ksH7mu5lF
 vqU/CWkIkZsb5OgnxD7jaJDZ0ITvJM0qaA64pK9c=
From: broonie@kernel.org
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC fixes for v5.8-rc2
Date: Mon, 22 Jun 2020 12:39:01 +0100
Message-Id: <20200622113909.A31332070E@mail.kernel.org>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
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

The following changes since commit 44ce45f866c1606f03a411fb2d2c0db4626403a6:

  Merge series "ASoC: Fix dailink checks for DPCM" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>: (2020-06-09 15:46:20 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v5.8-rc2

for you to fetch changes up to f141a422159a199f4c8dedb7e0df55b3b2cf16cd:

  ASoC: rockchip: Fix a reference count leak. (2020-06-18 17:21:58 +0100)

----------------------------------------------------------------
ASoC: Fixes for v5.8

This is a collection of mostly small fixes, mostly fixing fallout from
some of the DPCM changes that went in last time around which shook out
some issues on i.MX and Qualcomm platforms.  The addition of a managed
version of snd_soc_register_dai() is to fix resource leaks.

There's also a few new device IDs for x86 systems.

----------------------------------------------------------------
Brent Lu (1):
      ASoC: SOF: Intel: hda: Clear RIRB status before reading WP

Jack Yu (1):
      ASoC: rt1015: Update rt1015 default register value according to spec modification.

Mark Brown (2):
      Merge series "ASoC: topology: fix use-after-free when removing components" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "ASoC: SOF: Intel: update PCI IDs" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:

Pierre-Louis Bossart (7):
      ASoC: soc-devres: add devm_snd_soc_register_dai()
      ASoC: soc-topology: use devm_snd_soc_register_dai()
      ASoC: soc-pcm: fix checks for multi-cpu FE dailinks
      ASoC: Intel: SOF: merge COMETLAKE_LP and COMETLAKE_H
      ASoC: SOF: Intel: add PCI ID for CometLake-S
      ASoC: SOF: Intel: add PCI IDs for ICL-H and TGL-H
      ASoC: hdac_hda: fix memleak with regmap not freed on remove

Qiushi Wu (1):
      ASoC: rockchip: Fix a reference count leak.

Ravulapati Vishnu vardhan rao (1):
      ASoC: amd: closing specific instance.

Shengjiu Wang (5):
      ASoC: soc-card: export snd_soc_lookup_component_nolocked
      ASoC: dmaengine_pcm: export soc_component_to_pcm
      ASoC: fsl_asrc_dma: Reuse the dma channel if available in Back-End
      ASoC: fsl_asrc_dma: Fix data copying speed issue with EDMA
      ASoC: fsl_ssi: Fix bclk calculation for mono channel

Srinivas Kandagatla (3):
      ASoC: q6asm: handle EOS correctly
      ASoc: q6afe: add support to get port direction
      ASoC: qcom: common: set correct directions for dailinks

Steve Lee (1):
      ASoC: max98390: Update regmap readable reg and volatile

derek.fang (1):
      ASoC: rt5682: Let dai clks be registered whether mclk exists or not

 include/sound/dmaengine_pcm.h         |  11 +++
 include/sound/soc.h                   |   6 ++
 sound/hda/intel-dsp-config.c          |   4 +-
 sound/soc/amd/raven/acp3x-pcm-dma.c   |  30 ++++++--
 sound/soc/codecs/hdac_hda.c           |  16 +++--
 sound/soc/codecs/max98390.c           |   6 +-
 sound/soc/codecs/rt1015.c             | 124 ++++++++++++++++++++--------------
 sound/soc/codecs/rt1015.h             |  15 +++-
 sound/soc/codecs/rt5682.c             |  11 +--
 sound/soc/fsl/fsl_asrc_common.h       |   2 +
 sound/soc/fsl/fsl_asrc_dma.c          |  47 +++++++++----
 sound/soc/fsl/fsl_ssi.c               |  13 ++--
 sound/soc/intel/boards/Kconfig        |   4 +-
 sound/soc/qcom/common.c               |  14 +++-
 sound/soc/qcom/qdsp6/q6afe.c          |   8 +++
 sound/soc/qcom/qdsp6/q6afe.h          |   1 +
 sound/soc/qcom/qdsp6/q6asm.c          |   7 +-
 sound/soc/rockchip/rockchip_pdm.c     |   4 +-
 sound/soc/soc-core.c                  |   3 +-
 sound/soc/soc-devres.c                |  37 ++++++++++
 sound/soc/soc-generic-dmaengine-pcm.c |  12 ----
 sound/soc/soc-pcm.c                   |   6 +-
 sound/soc/soc-topology.c              |   3 +-
 sound/soc/sof/intel/Kconfig           |  29 +++-----
 sound/soc/sof/intel/hda-stream.c      |   9 ++-
 sound/soc/sof/sof-pci-dev.c           |  24 ++++---
 26 files changed, 295 insertions(+), 151 deletions(-)
