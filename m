Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 260ED6670FA
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Jan 2023 12:34:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82AF18B4E;
	Thu, 12 Jan 2023 12:33:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82AF18B4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673523241;
	bh=UDiUiT3qlTgsGXPSp1oemfNeBsCBX6ql2MPwxW3lg2E=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=XRHNpNWxBa0McPTx5Wt+oYiaPl00jOeqOanoFPxF55SfB3/4vTowcgodHstyyxKNf
	 uv0348CAhgz8snBInkN1YhHjRNvoMcqoCYz3IYx1SlzrixgxrK6S3xYPaNlNcRiyKn
	 P2sxGlD8J92m09Fjb1FOI5f6nuTszJnHg8TmkH+4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91938F804BD;
	Thu, 12 Jan 2023 12:33:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0CF42F804C1; Thu, 12 Jan 2023 12:33:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PP_MIME_FAKE_ASCII_TEXT,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 563EFF8016E
 for <alsa-devel@alsa-project.org>; Thu, 12 Jan 2023 12:32:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 563EFF8016E
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bQtx97jJ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 86E35B81E26;
 Thu, 12 Jan 2023 11:32:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86989C433EF;
 Thu, 12 Jan 2023 11:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673523174;
 bh=UDiUiT3qlTgsGXPSp1oemfNeBsCBX6ql2MPwxW3lg2E=;
 h=From:To:Cc:Subject:Date:From;
 b=bQtx97jJ7PKWc8gfTD5+IRm9L/CPfb3QOZQY5Jz8Wsenig5e/kzx/ev5bXwx4mLr0
 yeOWoVIvfJKT6Ym3LTcbKODK2/p1ayaiDlMOSvqLJSFCxydRfNNOXbuG0ogvfXDBmS
 g9QunqivAoVhbFDcySc+Ze5NmdnhF2FdnK3ydKZO7KmdN63rGBSU/H06J0rCQqZP8q
 jZ9lHEZ1U6wf9vzk0q3R+unwXwwNnHAVneFnQEuC0qYPzVHuvb1sNpZ+Q4FPBEu8f6
 e8OjzKtgsn26YY//o64pVgZyd3AI6PlaOnkLgSIsIdD7w5lWQnj6CITAKh9bGV05aI
 RwR6D5e5UssBw==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC fixes for v6.2-rc3
Date: Thu, 12 Jan 2023 11:32:35 +0000
Message-Id: <20230112113253.86989C433EF@smtp.kernel.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.2-rc3

for you to fetch changes up to 242fc66ae6e1e2b8519daacc7590a73cd0e8a6e4:

  ASoC: fsl-asoc-card: Fix naming of AC'97 CODEC widgets (2023-01-10 12:45:22 +0000)

----------------------------------------------------------------
ASoC: Fixes for v6.2

There's quite a few fixes here, mostly board specific apart from the SOF
power management ones.  We also have some new quirks and Kconfig tweaks
to enable existing code on new platforms, and a one liner which exposes
the SOF firmware state in debugfs to aid with debugging.

There's also a SPI fix that I mistakenly put in the wrong queue and
did some merges on top of before I noticed, it seemed more trouble than
it was worth to unpick things.  A copy of the same patch is also in the
spi tree.

----------------------------------------------------------------
Ajye Huang (1):
      ASoC: Intel: sof_nau8825: add variant with nau8318 amplifier.

Allen-KH Cheng (1):
      ASoC: mediatek: mt8186: Add machine support for max98357a

Aniol Martí (1):
      ASoC: amd: yc: Add ASUS M5402RA into DMI table

Arnd Bergmann (2):
      ASoC: Intel: fix sof-nau8825 link failure
      ASoC: Intel: sof-nau8825: fix module alias overflow

Brian Norris (1):
      ASoC: qcom: lpass-cpu: Fix fallback SD line index handling

Chancel Liu (1):
      ASoC: fsl_micfil: Correct the number of steps on SX controls

ChiYuan Huang (1):
      ASoC: rt9120: Make dev PM runtime bind AsoC component PM

Curtis Malainey (1):
      ASoC: SOF: Add FW state to debugfs

Emanuele Ghidoli (1):
      ASoC: wm8904: fix wrong outputs volume after power reactivation

Gongjun Song (2):
      ASoC: Intel: soc-acpi: add configuration for variant of 0C40 product
      ASoC: Intel: soc-acpi: add configuration for variant of 0C11 product

Krzysztof Kozlowski (2):
      ASoC: dt-bindings: qcom,lpass-wsa-macro: correct clocks on SM8250
      ASoC: dt-bindings: qcom,lpass-tx-macro: correct clocks on SC7280

Mark Brown (4):
      ASoC: SOF: Fixes for suspend after firmware crash
      Add new AMP MAX98360A for RT5682S
      ASoC: fsl_ssi: Rename AC'97 streams to avoid collisions with AC'97 CODEC
      ASoC: fsl-asoc-card: Fix naming of AC'97 CODEC widgets

Mars Chen (1):
      ASoC: support machine driver with max98360

Ranjani Sridharan (2):
      ASoC: SOF: pm: Set target state earlier
      ASoC: SOF: pm: Always tear down pipelines before DSP suspend

Ricardo Ribalda (1):
      spi: mediatek: Enable irq before the spi registration

Stephan Gerhold (1):
      ASoC: qcom: Fix building APQ8016 machine driver without SOUNDWIRE

Wim Van Boven (1):
      ASoC: amd: yc: Add Razer Blade 14 2022 into DMI table

tongjian (2):
      ASoC: mediatek: mt8186: support rt5682s_max98360
      ASoC: dt-bindings: mt8186-mt6366: add new compatible for max98360a

 .../sound/mt8186-mt6366-rt1019-rt5682s.yaml        |   1 +
 .../bindings/sound/qcom,lpass-tx-macro.yaml        |   4 +-
 .../bindings/sound/qcom,lpass-wsa-macro.yaml       |  58 ++++++++--
 drivers/spi/spi-mt65xx.c                           |  12 +-
 sound/soc/amd/yc/acp6x-mach.c                      |  14 +++
 sound/soc/codecs/rt9120.c                          |  12 ++
 sound/soc/codecs/wm8904.c                          |   7 ++
 sound/soc/fsl/fsl-asoc-card.c                      |   8 +-
 sound/soc/fsl/fsl_micfil.c                         |  16 +--
 sound/soc/fsl/fsl_ssi.c                            |   4 +-
 sound/soc/intel/boards/Kconfig                     |   2 +
 sound/soc/intel/boards/sof_nau8825.c               |  31 +++++-
 sound/soc/intel/common/soc-acpi-intel-adl-match.c  |  20 +++-
 sound/soc/intel/common/soc-acpi-intel-rpl-match.c  |  50 +++++++++
 sound/soc/mediatek/Kconfig                         |   4 +-
 .../mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c |  22 +++-
 sound/soc/qcom/Kconfig                             |  21 ++--
 sound/soc/qcom/Makefile                            |   2 +
 sound/soc/qcom/common.c                            | 114 -------------------
 sound/soc/qcom/common.h                            |  10 --
 sound/soc/qcom/lpass-cpu.c                         |   5 +-
 sound/soc/qcom/sc8280xp.c                          |   1 +
 sound/soc/qcom/sdw.c                               | 123 +++++++++++++++++++++
 sound/soc/qcom/sdw.h                               |  18 +++
 sound/soc/qcom/sm8250.c                            |   1 +
 sound/soc/sof/debug.c                              |   4 +-
 sound/soc/sof/pm.c                                 |   9 +-
 27 files changed, 389 insertions(+), 184 deletions(-)
 create mode 100644 sound/soc/qcom/sdw.c
 create mode 100644 sound/soc/qcom/sdw.h
