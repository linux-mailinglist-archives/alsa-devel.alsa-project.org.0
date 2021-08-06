Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2784D3E2D07
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Aug 2021 16:57:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACD0216DA;
	Fri,  6 Aug 2021 16:56:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACD0216DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628261825;
	bh=yxabeCfnVvrkffpWQXHnO/v23Azt3ytkH5vyZUGPVN8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nDxfuYVbfP5YGADWgWmi9Vwji7A1LP+N7Of3CCC+lJLKjC5O7GJ62cEZpzGKMHMol
	 SAUYu4VJ+SpAfpX3+Tk4iEoBNPIYSe0vUP3rAyNkOBQWC0pe8u4rdi/1d5hJf01LkV
	 SrWQ7kKM2xB6lLfja/LidTLNNblXZywkhcqsvQnk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 181A0F80268;
	Fri,  6 Aug 2021 16:55:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17127F8025F; Fri,  6 Aug 2021 16:55:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65C55F80108
 for <alsa-devel@alsa-project.org>; Fri,  6 Aug 2021 16:55:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65C55F80108
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="e5QPKuv7"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 329436105A;
 Fri,  6 Aug 2021 14:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628261724;
 bh=yxabeCfnVvrkffpWQXHnO/v23Azt3ytkH5vyZUGPVN8=;
 h=From:To:Cc:Subject:Date:From;
 b=e5QPKuv7XYBFAFzSx49E4aTU93L0zfmmDBDMfcmYoBFG8w9JUKtFhBgnVN+fxGQEm
 E6k/L9ggXFG+P8gBf/8/1Z53ihj/cYVpJ0vwqPPuEQvbE49b3JCOLdbWfYJrY5+Brb
 ov1T70Cqw3m2KMPe9Uvqaz059ppf4ZNgRr8JgH6LqFgmiwGwOmmESZTxh1vM1JrELd
 HrNNzAdIJzygx1IH7UGuqKF8w0SepmfUI8nhbgFeVYvdAbH6Uj8E8HO78CN/flrGwR
 DEkHHMkboTjnUyMrmRT4YGgpThKxHmvnSKH/0KzHlz1DysLvkSSQC0QjkKOA0Oykxb
 xwV3LEYchRIcg==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC fixes for v5.14-rc4
Date: Fri, 06 Aug 2021 15:54:53 +0100
Message-Id: <20210806145524.329436105A@mail.kernel.org>
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

The following changes since commit 82d28b67f780910f816fe1cfb0f676fc38c4cbb3:

  ASoC: ti: j721e-evm: Check for not initialized parent_clk_id (2021-07-19 12:58:42 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v5.14-rc4

for you to fetch changes up to e5ada3f6787a4d6234adc6f2f3ae35c6d5b71ba0:

  ASoC: cs42l42: Fix mono playback (2021-08-05 20:17:16 +0100)

----------------------------------------------------------------
ASoC: Fixes for v5.14

Quite a lot of fixes here, the biggest set being for the cs42l42 driver
which is reasonably old but has seen a sudden uptick in activity.
There's also some fixes for correctly referencing PCM buffer addresses
and the removal of some driver-local bodges that had been done for the
lack of prefix handling in DAPM which were broken by the core handling
that as expected.

----------------------------------------------------------------
Arnd Bergmann (1):
      ASoC: codecs: wcd938x: fix wcd module dependency

Brent Lu (1):
      ASoC: Intel: sof_da7219_mx98360a: fail to initialize soundcard

Derek Fang (1):
      ASoC: rt5682: Adjust headset volume button threshold

Guennadi Liakhovetski (1):
      ASoC: SOF: Intel: hda-ipc: fix reply size checking

Lucas Tanure (1):
      ASoC: wm_adsp: Let soc_cleanup_component_debugfs remove debugfs

Marek Vasut (1):
      ASoC: tlv320aic32x4: Fix TAS2505/TAS2521 processing block selection

Mario Limonciello (1):
      ASoC: amd: renoir: Run hibernation callbacks

Mark Brown (3):
      ASoC: tlv320aic31xx: Fix jack detection after suspend
      ASoC: component: Remove misplaced prefix handling in pin control functions
      ASoC: nau8824: Fix open coded prefix handling

Peter Ujfalusi (1):
      ASoC: topology: Select SND_DYNAMIC_MINORS

Pierre-Louis Bossart (2):
      ASoC: SOF: Intel: hda: enforce exclusion between HDaudio and SoundWire
      ASoC: SOF: Intel: Kconfig: fix SoundWire dependencies

Richard Fitzgerald (10):
      MAINTAINERS: Add sound devicetree bindings for Wolfson Micro devices
      ASoC: cs42l42: Correct definition of ADC Volume control
      ASoC: cs42l42: Don't allow SND_SOC_DAIFMT_LEFT_J
      ASoC: cs42l42: Fix bclk calculation for mono
      ASoC: cs42l42: Fix inversion of ADC Notch Switch control
      ASoC: cs42l42: Remove duplicate control for WNF filter frequency
      ASoC: cs42l42: PLL must be running when changing MCLK_SRC_SEL
      ASoC: cs42l42: Fix LRCLK frame start edge
      ASoC: cs42l42: Constrain sample rate to prevent illegal SCLK
      ASoC: cs42l42: Fix mono playback

Takashi Iwai (5):
      ASoC: intel: atom: Fix reference to PCM buffer address
      ASoC: xilinx: Fix reference to PCM buffer address
      ASoC: uniphier: Fix reference to PCM buffer address
      ASoC: kirkwood: Fix reference to PCM buffer address
      ASoC: amd: Fix reference to PCM buffer address

Vijendar Mukunda (1):
      ASoC: amd: enable stop_dma_first flag for cz_dai_7219_98357 dai link

 MAINTAINERS                                  |   3 +-
 sound/soc/Kconfig                            |   1 +
 sound/soc/amd/acp-da7219-max98357a.c         |   5 ++
 sound/soc/amd/acp-pcm-dma.c                  |   2 +-
 sound/soc/amd/raven/acp3x-pcm-dma.c          |   2 +-
 sound/soc/amd/renoir/acp3x-pdm-dma.c         |   2 +-
 sound/soc/amd/renoir/rn-pci-acp3x.c          |   2 +
 sound/soc/codecs/Kconfig                     |   1 +
 sound/soc/codecs/Makefile                    |   5 +-
 sound/soc/codecs/cs42l42.c                   | 104 ++++++++++++++++++---------
 sound/soc/codecs/cs42l42.h                   |   3 +
 sound/soc/codecs/nau8824.c                   |  42 ++---------
 sound/soc/codecs/rt5682.c                    |   1 +
 sound/soc/codecs/tlv320aic31xx.c             |  10 +++
 sound/soc/codecs/tlv320aic32x4.c             |  33 +++++++--
 sound/soc/codecs/wm_adsp.c                   |   1 -
 sound/soc/intel/atom/sst-mfld-platform-pcm.c |   3 +-
 sound/soc/intel/boards/sof_da7219_max98373.c |   2 +-
 sound/soc/kirkwood/kirkwood-dma.c            |  26 ++++---
 sound/soc/soc-component.c                    |  63 +++++++---------
 sound/soc/sof/intel/Kconfig                  |   4 +-
 sound/soc/sof/intel/hda-ipc.c                |   4 +-
 sound/soc/sof/intel/hda.c                    |  12 ++++
 sound/soc/uniphier/aio-dma.c                 |   2 +-
 sound/soc/xilinx/xlnx_formatter_pcm.c        |   4 +-
 25 files changed, 200 insertions(+), 137 deletions(-)
