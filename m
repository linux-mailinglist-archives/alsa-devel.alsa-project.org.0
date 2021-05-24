Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B09938E2ED
	for <lists+alsa-devel@lfdr.de>; Mon, 24 May 2021 11:04:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 905A41675;
	Mon, 24 May 2021 11:03:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 905A41675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621847088;
	bh=YPUZK5qVXvOAVUP0Nuwj04C153UhmaRZ567WIzT74LQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bh6QEdSyUDs/oAHroruP6pEDau6B6gA+D1d42UEVkwQ4/geBLD5dXMkBHKVCTPQ8y
	 0BP9iOEYiiTRLJsibOOex+dtT+1w6Ad7qM0JJmVQG/UW6SlYDBADcyaWsRNlNpzAgJ
	 xCehMJ32IisXNM98DAJGh4cIQyn3/jrt2ZDJiEqE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E38B5F8022D;
	Mon, 24 May 2021 11:03:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4174BF8022B; Mon, 24 May 2021 11:03:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FF0AF80149
 for <alsa-devel@alsa-project.org>; Mon, 24 May 2021 11:03:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FF0AF80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tMocmP4B"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 61BAA60698;
 Mon, 24 May 2021 09:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621846988;
 bh=YPUZK5qVXvOAVUP0Nuwj04C153UhmaRZ567WIzT74LQ=;
 h=From:To:Cc:Subject:Date:From;
 b=tMocmP4Btjao/U3TKu2+3cix2+0I6aNrMPUg5W9l+EbWZFGdEWnglwlrCqofCgKmu
 5WO8JhGpWQiWEv3a9lEmGtZ5Nj8myB6ck0XcF55FnV1NFtLMb+YH0vqtiONrX1GId/
 FJE/KzuqiolZG+PkMQ39yca0R78gjWlIWLCMSGgIiP4JgGyRQZS4tF0NFrlH8MzeDQ
 U43qLvBNG8oxyRMlz9UZ2PZ4lqpYifZ4wV1UOPe8pl7bqC83ZTsqN0WtPIojRE6xzR
 ZQ8pNcGS91oQvFvWBNJdfDKZYET4b8VmpNdrGoK6YGYvOFylPMedk8hn3/PhVbkGjc
 TgNBZm0lsoXJA==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC fixes for v5.13-rc3
Date: Mon, 24 May 2021 10:02:51 +0100
Message-Id: <20210524090307.61BAA60698@mail.kernel.org>
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

The following changes since commit 25c4a9b614f101bb9f3e687960815db7dc439c0f:

  ASoC: simple-card: Fix breakage on kontron-sl28-var3-ads2 (2021-04-23 18:13:32 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v5.13-rc3

for you to fetch changes up to af2702549d68519ac78228e915d9b2c199056787:

  ASoC: qcom: lpass-cpu: Use optional clk APIs (2021-05-21 13:12:29 +0100)

----------------------------------------------------------------
ASoC: Fixes for v5.13

A collection of fixes that have come in since the merge window, mainly
device specific things.  The fixes to the generic cards from
Morimoto-san are handling regressions that were introduced in the merge
window on at least the Kontron sl28-var3-ads2.

----------------------------------------------------------------
Arnd Bergmann (1):
      ASoC: fsl: fix SND_SOC_IMX_RPMSG dependency

Bixuan Cui (1):
      ASoC: codecs: lpass-tx-macro: add missing MODULE_DEVICE_TABLE

Charles Keepax (5):
      ASoC: cs53l30: Add missing regmap use_single config
      ASoC: cs42l73: Add missing regmap use_single config
      ASoC: cs35l34: Add missing regmap use_single config
      ASoC: cs35l32: Add missing regmap use_single config
      ASoC: cs42l52: Minor tidy up of error paths

Dan Carpenter (1):
      ASoC: cs35l33: fix an error code in probe()

Hans de Goede (2):
      ASoC: Intel: bytcr_rt5640: Add quirk for the Glavey TM800A550L tablet
      ASoC: Intel: bytcr_rt5640: Add quirk for the Lenovo Miix 3-830 tablet

Jerome Brunet (2):
      ASoC: stm32: do not request a new clock consummer reference
      ASoC: da7219: do not request a new clock consummer reference

Kuninori Morimoto (5):
      ASoC: simple-card: add simple_parse_node()
      ASoC: simple-card: add simple_link_init()
      ASoC: audio-graph: tidyup graph_dai_link_of_dpcm()
      ASoC: audio-graph: tidyup graph_parse_node()
      ASoC: soc-dai.h: Align the word of comment for SND_SOC_DAIFMT_CBC_CFC

Marco Felsch (1):
      ASoC: max98088: fix ni clock divider calculation

Mark Brown (2):
      Merge series "ASoC: Revert clk_hw_get_clk() cleanup" from Jerome Brunet <jbrunet@baylibre.com>:
      Merge series "ASoC: simple-card / audio-graph re-cleanup" from Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>:

Ranjani Sridharan (1):
      ASoC: SOF: Intel: hda: don't send DAI_CONFIG IPC for older firmware

Richard Fitzgerald (1):
      ASoC: cs42l42: Regmap must use_single_read/write

Shengjiu Wang (1):
      ASoC: ak5558: Correct the dai name for ak5552

Shuming Fan (1):
      ASoC: rt711-sdca: fix the function number of SDCA control for feature unit 0x1E

Srinivas Kandagatla (1):
      ASoC: codecs: lpass-rx-macro: add missing MODULE_DEVICE_TABLE

Stephen Boyd (1):
      ASoC: qcom: lpass-cpu: Use optional clk APIs

Vijendar Mukunda (1):
      ASoC: amd: fix for pcm_read() error

Zou Wei (1):
      ASoC: sti-sas: add missing MODULE_DEVICE_TABLE

 include/sound/soc-dai.h               |   2 +-
 sound/soc/amd/raven/acp3x-pcm-dma.c   |  10 --
 sound/soc/amd/raven/acp3x.h           |   1 +
 sound/soc/amd/raven/pci-acp3x.c       |  15 +++
 sound/soc/codecs/ak5558.c             |   2 +-
 sound/soc/codecs/cs35l32.c            |   3 +
 sound/soc/codecs/cs35l33.c            |   1 +
 sound/soc/codecs/cs35l34.c            |   3 +
 sound/soc/codecs/cs42l42.c            |   3 +
 sound/soc/codecs/cs42l56.c            |   7 +-
 sound/soc/codecs/cs42l73.c            |   3 +
 sound/soc/codecs/cs53l30.c            |   3 +
 sound/soc/codecs/da7219.c             |   5 +-
 sound/soc/codecs/lpass-rx-macro.c     |   1 +
 sound/soc/codecs/lpass-tx-macro.c     |   1 +
 sound/soc/codecs/max98088.c           |  13 ++-
 sound/soc/codecs/rt711-sdca.c         |   4 +-
 sound/soc/codecs/sti-sas.c            |   1 +
 sound/soc/fsl/Kconfig                 |   1 +
 sound/soc/generic/audio-graph-card.c  |  57 ++++++------
 sound/soc/generic/simple-card.c       | 168 +++++++++++++++++-----------------
 sound/soc/intel/boards/bytcr_rt5640.c |  25 +++++
 sound/soc/qcom/lpass-cpu.c            |  12 +--
 sound/soc/sof/intel/hda-dai.c         |   5 +
 sound/soc/stm/stm32_sai_sub.c         |   5 +-
 25 files changed, 202 insertions(+), 149 deletions(-)
