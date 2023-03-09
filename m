Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC626B2FC1
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Mar 2023 22:42:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D98BF1897;
	Thu,  9 Mar 2023 22:41:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D98BF1897
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678398120;
	bh=lqGfgEq3l3aLEJ6bfxdfuckCr/91DD+IV/kyc6FUILU=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=S1hGfp04t2j9B4WmymPh/7rbMwFIJoeAFdvB60QGo+eF39Oiod0ZX85z6Sdmu2gFn
	 imEjUu2AmJNveuwEYhsKCMEdzNc6aI1Eg3D0o8AeBZQLhAnwqK3Bb139VFd0lqj+Q/
	 0FtLo/shS6njh4t2RTbnEiYpcQk3NbLmqqGEM/nM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 25394F80093;
	Thu,  9 Mar 2023 22:41:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1679F8042F; Thu,  9 Mar 2023 22:41:05 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 58CEDF80093
	for <alsa-devel@alsa-project.org>; Thu,  9 Mar 2023 22:40:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58CEDF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OCnZCx9m
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 56A9FB82086;
	Thu,  9 Mar 2023 21:40:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7739C433D2;
	Thu,  9 Mar 2023 21:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678398054;
	bh=lqGfgEq3l3aLEJ6bfxdfuckCr/91DD+IV/kyc6FUILU=;
	h=From:To:Cc:Subject:Date:From;
	b=OCnZCx9mq2mRvJtzbHnPRWn5dV1fnVU1rMAs9GRkUjOAJpSfogIxrYaBp5u2dnDDl
	 ttf6/wQB7y/Q4kxRNuiLtOgIPP83lG+hWP/I3XW2BB9EZ6Kh5dDQJ/n4T0RepPDMYc
	 lQHu3kcYA+xv/+dRaAq/XdYv0Zbgde/p1UhaM7tQpvA7QkJipddJBF4zR9SgoUgHs4
	 T2vmI5ZWOwRxrOP5+Hu0QzZfCbTl1vkmSU6ODK/paYDajJXI80nJVzfPR5rXE2WTVz
	 NyMHcxWXJeG5f4t7wWIUbZZtONKt0ogZHdScFRGNX1go6BDITZtLX05+jXeo/b2Zlk
	 ttmqHmBHHHV5w==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC fixes for v6.3-rc1
Date: Thu, 09 Mar 2023 21:40:44 +0000
Message-Id: <20230309214053.A7739C433D2@smtp.kernel.org>
Message-ID-Hash: WVW7JLDBJ336KKURIV4OQIECS44JBLEO
X-Message-ID-Hash: WVW7JLDBJ336KKURIV4OQIECS44JBLEO
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WVW7JLDBJ336KKURIV4OQIECS44JBLEO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.3-rc1

for you to fetch changes up to e041a2a550582106cba6a7c862c90dfc2ad14492:

  ASoC: hdmi-codec: only startup/shutdown on supported streams (2023-03-09 13:45:31 +0000)

----------------------------------------------------------------
ASoC: Fixes for v6.3

More fixes that came in since -rc1, a lot from Intel - looks like
they've been busy test.  Everything is driver specific.

----------------------------------------------------------------
Amadeusz Sławiński (3):
      ASoC: Intel: avs: max98357a: Explicitly define codec format
      ASoC: Intel: avs: da7219: Explicitly define codec format
      ASoC: Intel: avs: rt5682: Explicitly define codec format

Cezary Rojewski (2):
      ASoC: Intel: avs: ssm4567: Remove nau8825 bits
      ASoC: Intel: avs: nau8825: Adjust clock control

Emil Abildgaard Svendsen (1):
      ASoC: hdmi-codec: only startup/shutdown on supported streams

Guenter Roeck (1):
      ASoC: da7219: Initialize jack_det_mutex

Jaska Uimonen (1):
      ASoC: SOF: ipc4-topology: set dmic dai index from copier

Krzysztof Kozlowski (1):
      ASoC: qcom: q6prm: fix incorrect clk_root passed to ADSP

Luca Ceresoli (1):
      ASoC: clarify that SND_SOC_IMX_SGTL5000 is the old driver

Mark Brown (2):
      ASoC: Intel: avs: Machine board fixes
      SoC: SOF: Intel: FIx device descriptions (missing

Peter Ujfalusi (1):
      ASoC: SOF: ipc3: Check for upper size limit for the received message

Pierre-Louis Bossart (4):
      ASoC: Intel: soc-acpi: fix copy-paste issue in topology names
      ASoC: SOF: Intel: pci-tng: revert invalid bar size setting
      ASoC: SOF: Intel: hda-ctrl: re-add sleep after entering and exiting reset
      ASoC: SOF: sof-audio: don't squelch errors in WIDGET_SETUP phase

Rander Wang (2):
      ASoC: SOF: Intel: hda-dsp: harden D0i3 programming sequence
      ASoC: SOF: IPC4: update gain ipc msg definition to align with fw

Ranjani Sridharan (6):
      ASoC: SOF: Intel: MTL: Fix the device description
      ASoC: SOF: Intel: HDA: Fix device description
      ASoC: SOF: Intel: SKL: Fix device description
      ASOC: SOF: Intel: pci-tgl: Fix device description
      ASoC: SOF: topology: Fix error handling in sof_widget_ready()
      ASoC: SOF: sof-audio: Fix broken early bclk feature for SSP

Ravulapati Vishnu Vardhan Rao (1):
      ASoC: codecs: tx-macro: Fix for KASAN: slab-out-of-bounds

Seppo Ingalsuo (1):
      ASoC: SOF: ipc4-topology: Fix incorrect sample rate print unit

 sound/soc/codecs/da7219-aad.c                     |  2 ++
 sound/soc/codecs/hdmi-codec.c                     | 11 ++++++++
 sound/soc/codecs/lpass-tx-macro.c                 | 11 ++++----
 sound/soc/fsl/Kconfig                             |  4 +++
 sound/soc/intel/avs/boards/da7219.c               | 21 ++++++++++++++
 sound/soc/intel/avs/boards/max98357a.c            | 22 +++++++++++++++
 sound/soc/intel/avs/boards/nau8825.c              | 14 +++++-----
 sound/soc/intel/avs/boards/rt5682.c               | 22 +++++++++++++++
 sound/soc/intel/avs/boards/ssm4567.c              | 31 ---------------------
 sound/soc/intel/common/soc-acpi-intel-adl-match.c |  2 +-
 sound/soc/qcom/qdsp6/q6prm.c                      |  4 +--
 sound/soc/sof/intel/hda-ctrl.c                    |  3 ++
 sound/soc/sof/intel/hda-dsp.c                     | 12 ++++++++
 sound/soc/sof/intel/pci-apl.c                     |  1 +
 sound/soc/sof/intel/pci-cnl.c                     |  2 ++
 sound/soc/sof/intel/pci-icl.c                     |  1 +
 sound/soc/sof/intel/pci-mtl.c                     |  1 +
 sound/soc/sof/intel/pci-skl.c                     |  2 ++
 sound/soc/sof/intel/pci-tgl.c                     |  7 +++++
 sound/soc/sof/intel/pci-tng.c                     |  6 +---
 sound/soc/sof/ipc3-topology.c                     | 32 +++++++++++++++++++--
 sound/soc/sof/ipc3.c                              |  5 ++--
 sound/soc/sof/ipc4-control.c                      |  3 +-
 sound/soc/sof/ipc4-topology.c                     | 21 ++++++++++----
 sound/soc/sof/ipc4-topology.h                     |  8 ++++--
 sound/soc/sof/sof-audio.c                         | 32 +++++++++++++++++----
 sound/soc/sof/topology.c                          | 34 +++++++++++------------
 27 files changed, 228 insertions(+), 86 deletions(-)
