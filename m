Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDFA507198
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 17:23:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C784B1AFC;
	Tue, 19 Apr 2022 17:22:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C784B1AFC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650381786;
	bh=cH8gyCG2M5cv/ReYx3kTWfj99muwYw0IE0MHkwfQquQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ayIPz+po59wkzEkPpmMJ0CNtF69wGdj6O9NmxXEITLRgcWIL7kSIYknDxNGZzmzi7
	 s+YBapLJoFDvcMcpo/jzOFk0xwNcY+6AH+fFleuNm08E0n4291j4nVvO7uOeE/trXQ
	 DAQp+q3YBsXCt3L9IOEoQfSCZAEkL7v0jcudgxBc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4259EF80269;
	Tue, 19 Apr 2022 17:22:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08C9BF800C1; Tue, 19 Apr 2022 17:22:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B793F800C1
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 17:22:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B793F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jmZMpcjJ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 700CA61582;
 Tue, 19 Apr 2022 15:22:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AA2BC385A7;
 Tue, 19 Apr 2022 15:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650381720;
 bh=cH8gyCG2M5cv/ReYx3kTWfj99muwYw0IE0MHkwfQquQ=;
 h=From:To:Cc:Subject:Date:From;
 b=jmZMpcjJTPrj1CsgP3NgQnFuzkhq3anWm8GtOvWcUvD38F9B/mvT9IuU/7TjGPkFw
 FuJGUgen1baiMvOhZ/ciQZLeUqcOLLWGdM3d5uRotJUkEtrZVNA6kofbib51Vs/IKm
 O5vex+8X+0JHuLvF3/Gxhmj3hPY74ToQjxdmLd2tL9KYRBVR/GghgOTkWvNd0R1oe9
 D1kbnfEWwIlZnGhro0JDEPE6njq0jVGshmSi7RXW9d6ams9Ptsgzgg33kxVlOwWLFo
 hds8kbnGbqxr4bqIvpavLiGnzN3SybbSJZModZJ9hi4iI0n9NllyPvNlwBo1WBWbs4
 CA/xJTcBvQhyw==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC fixes for v5.18-rc3
Date: Tue, 19 Apr 2022 16:21:45 +0100
Message-Id: <20220419152200.7AA2BC385A7@smtp.kernel.org>
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

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v5.18-rc3

for you to fetch changes up to 5b933c7262c5b0ea11ea3c3b3ea81add04895954:

  firmware: cs_dsp: Fix overrun of unterminated control name string (2022-04-12 17:57:04 +0100)

----------------------------------------------------------------
ASoC: Fixes for v5.18

A collection of fixes that came in since the merge window, plus one new
device ID for an x86 laptop.  Nothing that really stands out with
particularly big impact outside of the affected device.

----------------------------------------------------------------
Ahmad Fatoum (1):
      ASoC: fsl_sai: fix 1:1 bclk:mclk ratio support

Ajye Huang (1):
      ASoC: Intel: sof_rt5682: Add support for max98360a speaker amp on SSP2

Chao Song (1):
      ASoC: Intel: soc-acpi: correct device endpoints for max98373

Christophe JAILLET (2):
      ASoC: soc-pcm: use GFP_KERNEL when the code is sleepable
      ASoC: codecs: Fix an error handling path in (rx|tx|va)_macro_probe()

Heiner Kallweit (2):
      ASoC: soc-core: add debugfs_prefix member to snd_soc_component_driver
      ASoC: meson: aiu: fix duplicate debugfs directory error

Hui Wang (2):
      ASoC: cs35l41: Add one more variable in the debug log
      ASoC: cs35l41: Fix a shift-out-of-bounds warning found by UBSAN

Mark Brown (3):
      ASoC: atmel: Remove system clock tree configuration for at91sam9g20ek
      ASoC: meson: aiu: fix duplicate debugfs directory error
      Make headphone work on Huawei Matebook D15

Mauro Carvalho Chehab (3):
      ASoC: Intel: sof_es8336: support a separate gpio to control headphone
      ASoC: Intel: sof_es8336: add a quirk for headset at mic1 port
      ASoC: Intel: sof_es8336: Add a quirk for Huawei Matebook D15

Miaoqian Lin (2):
      ASoC: rk817: Use devm_clk_get() in rk817_platform_probe
      ASoC: msm8916-wcd-digital: Check failure for devm_snd_soc_register_component

Peter Ujfalusi (2):
      ASoC: topology: Correct error handling in soc_tplg_dapm_widget_create()
      ASoC: SOF: topology: Fix memory leak of scontrol->name

Pierre-Louis Bossart (3):
      ASoC: rt711/5682: check if bus is active before deferred jack detection
      ASoC: SOF: topology: cleanup dailinks on widget unload
      ASoC: Intel: sof_es8336: simplify speaker gpio naming

Richard Fitzgerald (2):
      ASoC: simple-card-utils: Avoid NULL deref in asoc_simple_set_tdm()
      firmware: cs_dsp: Fix overrun of unterminated control name string

Srinivas Kandagatla (1):
      ASoC: codecs: wcd934x: do not switch off SIDO Buck when codec is in use

Xiaomeng Tong (3):
      codecs: rt5682s: fix an incorrect NULL check on list iterator
      ASoC: soc-dapm: fix two incorrect uses of list iterator
      ASoC: rt5682: fix an incorrect NULL check on list iterator

Yu Liao (1):
      ASoC: SOF: topology: Fix memory leak in sof_control_load()

Zheyu Ma (1):
      ASoC: wm8731: Disable the regulator when probing fails

 drivers/firmware/cirrus/cs_dsp.c                  |   3 +-
 include/sound/soc-component.h                     |   4 +
 sound/soc/atmel/sam9g20_wm8731.c                  |  61 -----------
 sound/soc/codecs/cs35l41-lib.c                    |  10 +-
 sound/soc/codecs/lpass-rx-macro.c                 |  14 ++-
 sound/soc/codecs/lpass-tx-macro.c                 |  14 ++-
 sound/soc/codecs/lpass-va-macro.c                 |   8 +-
 sound/soc/codecs/msm8916-wcd-digital.c            |   9 +-
 sound/soc/codecs/rk817_codec.c                    |   2 +-
 sound/soc/codecs/rt5682.c                         |  20 ++--
 sound/soc/codecs/rt5682s.c                        |  11 +-
 sound/soc/codecs/rt711.c                          |   7 ++
 sound/soc/codecs/wcd934x.c                        |  26 +----
 sound/soc/codecs/wm8731.c                         |  19 ++--
 sound/soc/fsl/fsl_sai.c                           |   2 +-
 sound/soc/generic/simple-card-utils.c             |   6 +-
 sound/soc/intel/boards/sof_es8336.c               | 117 ++++++++++++++++------
 sound/soc/intel/boards/sof_rt5682.c               |  13 +++
 sound/soc/intel/common/soc-acpi-intel-tgl-match.c |   4 +-
 sound/soc/meson/aiu-acodec-ctrl.c                 |   3 +
 sound/soc/meson/aiu-codec-ctrl.c                  |   3 +
 sound/soc/meson/aiu.c                             |   3 +
 sound/soc/soc-core.c                              |   5 +
 sound/soc/soc-dapm.c                              |   6 +-
 sound/soc/soc-pcm.c                               |   2 +-
 sound/soc/soc-topology.c                          |   4 +-
 sound/soc/sof/sof-pci-dev.c                       |   9 +-
 sound/soc/sof/topology.c                          |  50 ++++++++-
 28 files changed, 267 insertions(+), 168 deletions(-)
