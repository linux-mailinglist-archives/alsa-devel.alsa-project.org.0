Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1B2224074
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 18:19:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A47D9165E;
	Fri, 17 Jul 2020 18:18:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A47D9165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595002742;
	bh=DYM5m91sWGzfs9Yo7EHa4E4EVDTbB5Pxh7cc8i6/6Vo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UDGd0MQfOPKEfxwBr5odhR4ZG7g8P2hangGaqvqPQ11ZwG82q51iFCyPaOqUDwjEs
	 6y+rGU/1X4VwEW+V3zO2Jq7Pn/mfwES8/ZixBv5D08Y6kO1NRgspRwuGayOvi4/M6E
	 XLKitBICgtczDAzj64dWscO6Jfr4t2GJJM2vQsNI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98429F801D8;
	Fri, 17 Jul 2020 18:17:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E426F80217; Fri, 17 Jul 2020 18:17:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C7C3F800E4
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 18:17:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C7C3F800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="xG+ltK3y"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 702AB2076D;
 Fri, 17 Jul 2020 16:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595002625;
 bh=DYM5m91sWGzfs9Yo7EHa4E4EVDTbB5Pxh7cc8i6/6Vo=;
 h=From:To:Cc:Subject:Date:From;
 b=xG+ltK3yKPKP+COt8iWjE+baHDukISjzexidP4Yb6IDVe4KqqquOEQMYhu95GTgiS
 H+c6z7BylbbM3Z07NLgGkY0Ided/jWJLs919s+0GmKaWsdXyMOu37p7G0udrtRHKIA
 NPIjClYu23VQwrb1px3Q4o2sgYzaFlIpGlhEYjIY=
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC fixes for v5.8-rc5
Date: Fri, 17 Jul 2020 17:16:53 +0100
Message-Id: <20200717161705.702AB2076D@mail.kernel.org>
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

The following changes since commit bc5c7f55f5ea91e137fc7939435ed2e2bb6e5a15:

  AsoC: amd: add missing snd- module prefix to the acp3x-rn driver kernel module (2020-06-25 15:06:56 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v5.8-rc5

for you to fetch changes up to fe0a53044b4bce947045eadd7fa1adbc4685afab:

  ASoC: rt5682: Report the button event in the headset type only (2020-07-16 20:29:09 +0100)

----------------------------------------------------------------
ASoC: Fixes for v5.8

An awful lot of mostly small fixes here, mainly for x86 based platforms
and the CODEC drivers mainly used on them.  For the most part this is
either minor device specific stuff which seems to come from detailed
testing or robustness against errors which comes from people having done
some fuzzing runs aginst the topology code.

----------------------------------------------------------------
Daniel Baluta (1):
      ASoC: SOF: imx: add min/max channels for SAI/ESAI on i.MX8/i.MX8M

Fabio Estevam (1):
      ASoC: dt-bindings: simple-card: Fix 'make dt_binding_check' warnings

Geert Uytterhoeven (1):
      ASoC: qcom: Drop HAS_DMA dependency to fix link failure

Hans de Goede (4):
      ASoC: Intel: cht_bsw_rt5672: Change bus format to I2S 2 channel
      ASoC: rt5670: Correct RT5670_LDO_SEL_MASK
      ASoC: rt5670: Add new gpio1_is_ext_spk_en quirk and enable it on the Lenovo Miix 2 10
      ASoC: rt5670: Fix dac- and adc- vol-tlv values being off by a factor of 10

Jing Xiangfeng (1):
      ASoC: Intel: bytcht_es8316: Add missed put_device()

Mark Brown (3):
      Merge series "ASoC: codecs: add MAX98373 Soundwire driver" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "ASoC: topology: fix error handling flow" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "ASoC: more fixes for dpcm checks" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:

Maxime Ripard (1):
      ASoC: core: Remove only the registered component in devm functions

Nicolas Ferre (1):
      MAINTAINERS: Change Maintainer for some at91 drivers

Nicolin Chen (1):
      MAINTAINERS: Add Shengjiu to reviewer list of sound/soc/fsl

Oder Chiou (2):
      ASoC: rt5682: cancel jack_detect_work if hs_jack is set to null even soundwire mode
      ASoC: rt5682: Report the button event in the headset type only

Pierre-Louis Bossart (4):
      ASoC: soc-dai: set dai_link dpcm_ flags with a helper
      ASoC: Intel: bdw-rt5677: fix non BE conversion
      ASoC: topology: fix kernel oops on route addition error
      ASoC: topology: fix tlvs in error handling for widget_dmixer

Puyou Lu (2):
      ASoC: wm8974: fix Boost Mixer Aux Switch
      ASoC: wm8974: remove unsupported clock mode

Ranjani Sridharan (1):
      ASoC: SOF: core: fix null-ptr-deref bug during device removal

Ravulapati Vishnu vardhan rao (1):
      ASoC: amd: Rectifying Unbalanced pm_runtime_enable! issue

Ryan Lee (1):
      ASoC: codecs: max98373: Removed superfluous volume control from chip default

Shuming Fan (1):
      ASoC: rt286: fix unexpected interrupt happens

Yu-Hsuan Hsu (1):
      ASoC: rockchip: add format and rate constraints on rk3399

derek.fang (1):
      ASoC: rt5682: Enable Vref2 under using PLL2

randerwang (1):
      ASoc: codecs: max98373: remove Idle_bias_on to let codec suspend

 .../devicetree/bindings/sound/simple-card.yaml     | 17 +++--
 MAINTAINERS                                        |  7 +-
 include/sound/rt5670.h                             |  1 +
 include/sound/soc-dai.h                            |  1 +
 include/sound/soc.h                                |  2 +
 sound/soc/amd/raven/pci-acp3x.c                    |  4 +-
 sound/soc/codecs/max98373.c                        |  8 ---
 sound/soc/codecs/rt286.c                           |  8 +--
 sound/soc/codecs/rt5670.c                          | 75 +++++++++++++++++-----
 sound/soc/codecs/rt5670.h                          |  2 +-
 sound/soc/codecs/rt5682.c                          | 46 ++++++++-----
 sound/soc/codecs/wm8974.c                          |  6 +-
 sound/soc/generic/audio-graph-card.c               |  4 +-
 sound/soc/generic/simple-card.c                    |  4 +-
 sound/soc/intel/boards/bdw-rt5677.c                |  1 +
 sound/soc/intel/boards/bytcht_es8316.c             |  4 +-
 sound/soc/intel/boards/cht_bsw_rt5672.c            | 23 ++++---
 sound/soc/qcom/Kconfig                             |  2 +-
 sound/soc/rockchip/rk3399_gru_sound.c              | 13 ++++
 sound/soc/soc-core.c                               | 27 ++++++++
 sound/soc/soc-dai.c                                | 38 +++++++++++
 sound/soc/soc-devres.c                             |  8 ++-
 sound/soc/soc-generic-dmaengine-pcm.c              |  2 +-
 sound/soc/soc-topology.c                           | 24 +++++--
 sound/soc/sof/core.c                               | 10 +--
 sound/soc/sof/imx/imx8.c                           |  8 +++
 sound/soc/sof/imx/imx8m.c                          |  8 +++
 27 files changed, 262 insertions(+), 91 deletions(-)
