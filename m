Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D642ED532
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jan 2021 18:11:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A672D168F;
	Thu,  7 Jan 2021 18:10:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A672D168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610039502;
	bh=7R3BgriIySJdGpeljG6bzvtnkMT3NbWwTliY/udQ8fM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=m7sDV5wTpGe9Id93TKV+Ssv+mak0ujmQVeET3oHms0WCNsiCA/evXNBtMI8l8lIOP
	 OHRE/B2s0NR7mznzfThoV9UycygCqrt3QbDHgEpgOhrLnB7TZ8S4c2qON7Al/eG4fB
	 LDpX9N9evgO4gGjoAp7vgYU/BcLIJaPTatCWKSI4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 149F5F80268;
	Thu,  7 Jan 2021 18:10:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B07F5F80258; Thu,  7 Jan 2021 18:10:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45396F800FD
 for <alsa-devel@alsa-project.org>; Thu,  7 Jan 2021 18:09:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45396F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eB8RkEEk"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 30AB52311E;
 Thu,  7 Jan 2021 17:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610039391;
 bh=7R3BgriIySJdGpeljG6bzvtnkMT3NbWwTliY/udQ8fM=;
 h=From:To:Cc:Subject:Date:From;
 b=eB8RkEEkzWYKpRHDY5fuj56YkbL9WN3WD+CFQB6IXalEolYkry3P4Nx9L7LOmO5HI
 zhzgEw2mUiYO453gok1uKJHPE9QzFVfyIIjFFHd0Xtml4rMBzwcHjoU/AzrLausWWC
 +KYrCwZ6LaWWUeQkiqXQ6d5CPoN5gkoI7R8kD1cwKKaVS/E9OB3NIp8EvmNEcec6Xm
 NX5fN8vpLhreTGSEwhRqOdUKCCCX9IWiy4GD14O+utHCe5UUVyi5C6NjQeqlTBiM8J
 E4mi56oaMmaSxJhUzkrbyrenap1wsmThEOCOw2Oh5KP7AuTjcp3CBhm5q2ryQlu8oT
 1BGSoe8n058Kg==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC fixes for v5.11-rc2
Date: Thu, 07 Jan 2021 17:09:09 +0000
Message-Id: <20210107170951.30AB52311E@mail.kernel.org>
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

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v5.11-rc2

for you to fetch changes up to 1f092d1c8819679d78a7d9c62a46d4939d217a9d:

  ASoC: AMD Renoir - add DMI entry for Lenovo ThinkPad X395 (2020-12-28 14:22:44 +0000)

----------------------------------------------------------------
ASoC: Fixes for v5.11

A collection of mostly driver specific fixes, plus a maintainership
update for TI and a fix for DAPM driver removal paths.

----------------------------------------------------------------
Bard Liao (1):
      ASoC: max98373: don't access volatile registers in bias level off

Cezary Rojewski (1):
      ASoC: Intel: haswell: Add missing pm_ops

Colin Ian King (3):
      ASoC: codecs: fix spelling mistake in Kconfig "comunicate" -> "communicate"
      ASoC: SOF: Fix spelling mistake in Kconfig "ond" -> "and"
      ASoC: atmel: fix spelling mistake in Kconfig "programable" -> "programmable"

Dan Carpenter (1):
      ASoC: Intel: fix error code cnl_set_dsp_D0()

Jaroslav Kysela (2):
      ASoC: AMD Renoir - add DMI entry for Lenovo ThinkPad E14 Gen 2
      ASoC: AMD Renoir - add DMI entry for Lenovo ThinkPad X395

Jerome Brunet (2):
      ASoC: meson: axg-tdmin: fix axg skew offset
      ASoC: meson: axg-tdm-interface: fix loopback

Kuninori Morimoto (1):
      ASoC: rsnd: don't call clk_disable_unprepare() if can't use

Mark Brown (3):
      Merge series "ASoC: ti: Maintainer mail address change" from Peter Ujfalusi <peter.ujfalusi@ti.com>:
      Merge series "Platform driver update to support playback recover after resume" from Srinivasa Rao Mandadapu <srivasam@codeaurora.org>:
      Merge tag 'v5.11-rc1' into asoc-5.11

Peter Ujfalusi (2):
      MAINTAINERS: Update email address for TI ASoC and twl4030 codec drivers
      ASoC: dt-bindings: ti, j721e: Update maintainer and author information

Ravulapati Vishnu vardhan rao (1):
      ASoC: amd: Replacing MSI with Legacy IRQ model

Shuming Fan (1):
      ASoC: rt711: mutex between calibration and power state changes

Srinivasa Rao Mandadapu (2):
      ASoC: qcom: Fix incorrect volatile registers
      ASoC: qcom: Add support for playback recover after resume

Thomas Hebb (1):
      ASoC: dapm: remove widget from dirty list on free

shengjiu wang (1):
      ASoC: imx-hdmi: Fix warning of the uninitialized variable ret

 .../bindings/sound/ti,j721e-cpb-audio.yaml         |  4 +-
 .../bindings/sound/ti,j721e-cpb-ivi-audio.yaml     |  4 +-
 MAINTAINERS                                        |  6 +--
 sound/soc/amd/raven/pci-acp3x.c                    | 16 ++-----
 sound/soc/amd/renoir/rn-pci-acp3x.c                | 14 ++++++
 sound/soc/atmel/Kconfig                            |  4 +-
 sound/soc/codecs/Kconfig                           |  2 +-
 sound/soc/codecs/max98373-i2c.c                    | 20 +++++++++
 sound/soc/codecs/max98373-sdw.c                    | 20 +++++++++
 sound/soc/codecs/max98373.c                        | 34 +++++++++++++--
 sound/soc/codecs/max98373.h                        |  8 ++++
 sound/soc/codecs/rt711.c                           |  6 +++
 sound/soc/fsl/imx-hdmi.c                           |  1 +
 sound/soc/intel/boards/haswell.c                   |  1 +
 sound/soc/intel/skylake/cnl-sst.c                  |  1 +
 sound/soc/meson/axg-tdm-interface.c                | 14 +++++-
 sound/soc/meson/axg-tdmin.c                        | 13 +-----
 sound/soc/qcom/lpass-cpu.c                         | 20 +--------
 sound/soc/qcom/lpass-platform.c                    | 50 +++++++++++++++-------
 sound/soc/sh/rcar/adg.c                            | 18 ++++----
 sound/soc/soc-dapm.c                               |  1 +
 sound/soc/sof/Kconfig                              |  2 +-
 22 files changed, 181 insertions(+), 78 deletions(-)
