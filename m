Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FF3456172
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 18:27:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43AAE1832;
	Thu, 18 Nov 2021 18:26:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43AAE1832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637256422;
	bh=Nc68xvQ6r/s5N4ouJ3iZidz6/slmLElMSkl7siAgKls=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iKfCmO9l6VCsTGKY7LwM18m+a1W3eR7PPHHDSYKP8imLiAvWGeYZnqPeV5Gi9Q/y7
	 1W2G8jyzeHvguLB7ZQFJw9hI13nVbEhgTkzi+q1iZPVQ0mULVS8+T+67Wp96Ivct/z
	 Yrcz0kRi9CRPw9S+TGx+2BKt4zDqk95GLW6++atI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85F35F80115;
	Thu, 18 Nov 2021 18:25:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59FF1F80115; Thu, 18 Nov 2021 18:25:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 PRX_BODY_65,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9AEF5F80115
 for <alsa-devel@alsa-project.org>; Thu, 18 Nov 2021 18:25:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AEF5F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZFXHRGNG"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7523861284;
 Thu, 18 Nov 2021 17:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637256330;
 bh=Nc68xvQ6r/s5N4ouJ3iZidz6/slmLElMSkl7siAgKls=;
 h=From:To:Cc:Subject:Date:From;
 b=ZFXHRGNGzIXgPI9FOYsxqmRU9sNDyXzoxd/4HbR7DNYtM/PgP1h4D5156zr4NIUAw
 PmPv2/sfIKBepM2brC0bBYgdXT0Uttm2i2J3ATvwmiMjFTi4FNmRhD5f5Tq/jWvYne
 5ZmKfQ4R+t6HcAGV7bMjFztkW7c5b0uAiIBRW84V37CHclbpBA2SyaR6zoOLaoEZ1s
 GaMRxoYhxPdARUOIyqUXarzi4QeElf9bJhLAfdoDJDzN4VcH5QTTTYpH5OnRbwXIDh
 0F+/TAR+ZPbBfC8mP8RuYcZat6XVD0lzDDpLGFov3RQEmypH/gucMNYSjodbkvUQvf
 cp5O3K7iC0+ug==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC fixes for v5.16-rc1
Date: Thu, 18 Nov 2021 17:25:13 +0000
Message-Id: <20211118172529.7523861284@mail.kernel.org>
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

The following changes since commit 6195eb15f6d60dd92d1644dc11f1c1c2e84ebfeb:

  Merge series "Multiple headphone codec driver support" from Brent Lu <brent.lu@intel.com>: (2021-10-29 21:53:41 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v5.16-rc1

for you to fetch changes up to 424fe7edbed18d47f7b97f7e1322a6f8969b77ae:

  ASoC: stm32: i2s: fix 32 bits channel length without mclk (2021-11-17 13:04:38 +0000)

----------------------------------------------------------------
ASoC: Fixes for v5.16

A relatively large collection of fixes that came in since the merge
window, though a lot of this is just a collection of new machine quirks
for x86 platforms.

----------------------------------------------------------------
AngeloGioacchino Del Regno (2):
      ASoC: mediatek: mt8173-rt5650: Rename Speaker control to Ext Spk
      ASoC: mediatek: mt8173: Fix debugfs registration for components

Arnd Bergmann (1):
      ASoC: SOF: build compression interface into snd_sof.ko

Charles Keepax (1):
      ASoC: cs35l41: Change monitor widgets to siggens

ChiYuan Huang (3):
      ASoC: rt9120: Update internal ocp level to the correct value
      ASoC: rt9120: Fix clock auto sync issue when fs is the multiple of 48
      ASoC: rt9120: Add the compatibility with rt9120s

Derek Fang (2):
      ASoC: rt5682: Avoid the unexpected IRQ event during going to suspend
      ASoC: rt5682: Re-detect the combo jack after resuming

Gongjun Song (9):
      ASoC: Intel: sof_sdw: Add support for SKU 0AF3 product
      ASoC: Intel: soc-acpi: add SKU 0AF3 SoundWire configuration
      ASoC: Intel: sof_sdw: Add support for SKU 0B00 and 0B01 products
      ASoC: Intel: sof_sdw: Add support for SKU 0B11 product
      ASoC: Intel: sof_sdw: Add support for SKU 0B13 product
      ASoC: Intel: soc-acpi: add SKU 0B13 SoundWire configuration
      ASoC: Intel: sof_sdw: Add support for SKU 0B29 product
      ASoC: Intel: soc-acpi: add SKU 0B29 SoundWire configuration
      ASoC: Intel: sof_sdw: Add support for SKU 0B12 product

Jack Yu (1):
      ASoC: rt1011: revert 'I2S Reference' to SOC_ENUM_EXT

Kai Vehmanen (1):
      ASoC: SOF: Intel: hda: fix hotplug when only codec is suspended

Kuninori Morimoto (1):
      ASoC: rsnd: fixup DMAEngine API

Mark Brown (1):
      ASoC: Merge rt9120 series from ChiYuan Huang:

Olivier Moysan (1):
      ASoC: stm32: i2s: fix 32 bits channel length without mclk

Peter Ujfalusi (1):
      ASoC: SOF:control: Fix variable type in snd_sof_refresh_control()

Simon Trimmer (1):
      ASoC: wm_adsp: wm_adsp_control_add() error: uninitialized symbol 'ret'

Srinivas Kandagatla (8):
      ASoC: qdsp6: qdsp6: q6prm: handle clk disable correctly
      ASoC: qdsp6: q6routing: Conditionally reset FrontEnd Mixer
      ASoC: qdsp6: q6asm: fix q6asm_dai_prepare error handling
      ASoC: qdsp6: q6adm: improve error reporting
      ASoC: qdsp6: q6routing: validate port id before setting up route
      ASoC: codecs: wcd938x: fix volatile register range
      ASoC: codecs: wcd934x: return error code correctly from hw_params
      ASoC: codecs: lpass-rx-macro: fix HPHR setting CLSH mask

Takashi Iwai (2):
      ASoC: DAPM: Cover regression by kctl change notification fix
      ASoC: topology: Add missing rwsem around snd_ctl_remove() calls

 sound/soc/codecs/cs35l41.c                        |  14 +--
 sound/soc/codecs/lpass-rx-macro.c                 |   2 +-
 sound/soc/codecs/rt1011.c                         |  55 ++++++++++--
 sound/soc/codecs/rt1011.h                         |   7 ++
 sound/soc/codecs/rt5682-i2c.c                     |   1 +
 sound/soc/codecs/rt5682.c                         |  38 ++++++--
 sound/soc/codecs/rt5682.h                         |   1 +
 sound/soc/codecs/rt9120.c                         |  58 +++++++++---
 sound/soc/codecs/wcd934x.c                        |   3 +-
 sound/soc/codecs/wcd938x.c                        |   3 +
 sound/soc/codecs/wm_adsp.c                        |   5 +-
 sound/soc/intel/boards/sof_sdw.c                  |  69 ++++++++++++++
 sound/soc/intel/common/soc-acpi-intel-adl-match.c | 105 ++++++++++++++++++++++
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c        |  51 +++++++++--
 sound/soc/mediatek/mt8173/mt8173-rt5650.c         |   8 +-
 sound/soc/qcom/qdsp6/audioreach.h                 |   4 +
 sound/soc/qcom/qdsp6/q6adm.c                      |   4 +-
 sound/soc/qcom/qdsp6/q6asm-dai.c                  |  19 ++--
 sound/soc/qcom/qdsp6/q6prm.c                      |  53 ++++++++++-
 sound/soc/qcom/qdsp6/q6routing.c                  |  12 ++-
 sound/soc/sh/rcar/dma.c                           |   2 +-
 sound/soc/soc-dapm.c                              |  29 ++++--
 sound/soc/soc-topology.c                          |   3 +
 sound/soc/sof/Kconfig                             |   2 +-
 sound/soc/sof/control.c                           |   8 +-
 sound/soc/sof/intel/hda-bus.c                     |  17 ++++
 sound/soc/sof/intel/hda-dsp.c                     |   3 +-
 sound/soc/sof/intel/hda.c                         |  16 ++++
 sound/soc/stm/stm32_i2s.c                         |   2 +-
 29 files changed, 519 insertions(+), 75 deletions(-)
