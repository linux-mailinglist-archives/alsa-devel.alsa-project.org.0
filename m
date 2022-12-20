Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6602651FDB
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Dec 2022 12:43:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7565718FE;
	Tue, 20 Dec 2022 12:42:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7565718FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671536583;
	bh=/79z7AC8dBpBk3qALNE/x+S+yysUY3xhRTtocwBLFAw=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=LMDk/xUxcy4rMwYnaAPyEAZ1FRCly7GQutSqn91nIV29Py6siPd6Sf9q3Sp1EfCZy
	 HX5B2eETC37hVZxvCPa6ghBiHJK82TTSgcX5hS1oV7xhTKIgldgyYXQinUPlQhxi6G
	 ivZw9cf8TdSulaWzFxs08ZtQGxgThrcMTtYbOV2Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFFE6F8045D;
	Tue, 20 Dec 2022 12:42:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C52D9F804AD; Tue, 20 Dec 2022 12:41:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9DDCF8045D
 for <alsa-devel@alsa-project.org>; Tue, 20 Dec 2022 12:41:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9DDCF8045D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qk35mPCz
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EB6886134C;
 Tue, 20 Dec 2022 11:41:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01CE2C433D2;
 Tue, 20 Dec 2022 11:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671536513;
 bh=/79z7AC8dBpBk3qALNE/x+S+yysUY3xhRTtocwBLFAw=;
 h=From:To:Cc:Subject:Date:From;
 b=qk35mPCzIresWldSn7hvSCjlGws1JIuCL4K825uWI9PBXNSsI0JtmrI6ZHqRE0KnT
 G5HOk0omx/k/Vl4D7IqK87AgaWsQwqH58MGcJwVhu1VRT6dKTWkdZBkxmEQeMdT0i4
 Le0yW6ZNk8t+Hik9z29lK/XgRPecwggZIOwWc2KwAlCCMtWIXcgNPWg3wYVbcG8W06
 lH4mhRJuVsL0NLFTe8AxXDQLEbXpIk1TOtT//FSLL3Kk2wcO4MUDNH0I3rlrCYmR6R
 z8yoA8guUeg274Co8ykp5AUCY1kODpi467VfQmYTxu9JzaYD+EEqu0pbGfQQctEueB
 xXsamkPuCjdoQ==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC updates for v6.2-3
Date: Tue, 20 Dec 2022 11:41:42 +0000
Message-Id: <20221220114153.01CE2C433D2@smtp.kernel.org>
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

The following changes since commit 9472382db38452df15f9f2f74b1dff34848e56b2:

  Add SOF panic dump support for AMD platform. (2022-12-05 17:28:07 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v6.2-3

for you to fetch changes up to a12a383e59ce486abd719b6bda33c353a3b385e7:

  ASoC: lochnagar: Fix unused lochnagar_of_match warning (2022-12-15 13:53:00 +0000)

----------------------------------------------------------------
ASoC: Updates for v6.2

Some more small fixes and board quirks that came in since my last
update, the main one being the fixes from Kai for issues around the
attempts to get kexec working well on SOF based systems.

----------------------------------------------------------------
Bard Liao (1):
      ASoC: Intel: sof_realtek_common: set ret = 0 as initial value

Brent Lu (1):
      ASoC: Intel: sof_rt5682: add jsl_rt5682 board config

Cezary Rojewski (22):
      ALSA: hda: Allow for compress stream to hdac_ext_stream assignment
      ALSA: hda: Prepare for compress stream support
      ALSA: hda: Interrupt servicing and BDL setup for compress streams
      ASoC: Intel: avs: Introduce avs_log_buffer_status_locked()
      ASoC: Intel: avs: Drop fifo_lock
      ASoC: Intel: avs: Introduce debug-context aware helpers
      ASoC: Intel: avs: Make enable_logs() dependent on DEBUG_FS
      ASoC: Intel: avs: Drop usage of debug members in non-debug code
      ASoC: Intel: avs: Add data probing requests
      ASoC: Intel: avs: Probe compress operations
      ASoC: Intel: avs: Data probing soc-component
      ASoC: Intel: avs: Add probe machine board
      ASoC: Intel: avs: Probing and firmware tracing over debugfs
      ASoC: Intel: avs: Gather remaining logs on strace_release()
      ASoC: Intel: avs: Allow for dumping FW_REGS area
      ASoC: Intel: avs: Allow for dumping debug window snapshot
      ASoC: Intel: Skylake: Update pipe_config_idx before filling BE params
      ASoC: Intel: Skylake: Remove skl_tplg_is_multi_fmt()
      ASoC: Intel: Skylake: Drop pipe_config_idx
      ASoC: Intel: Skylake: Introduce single place for pipe-config selection
      ASoC: Intel: Skylake: Fix driver hang during shutdown
      ASoC: Intel: Skylake: Use SG allocation for SKL-based firmware load

Chancel Liu (1):
      ASoC: soc-pcm.c: Clear DAIs parameters after stream_active is updated

Gongjun Song (2):
      ASoC: Intel: sof_sdw: use common helpers for all Realtek amps
      ASoC: Intel: soc-acpi: update codec addr on 0C11/0C4F product

Hans de Goede (2):
      ASoC: Intel: bytcr_rt5640: Add quirk for the Advantech MICA-071 tablet
      ASoC: rt5670: Remove unbalanced pm_runtime_put()

Jiapeng Chong (1):
      ASoC: codecs: wcd-clsh: Remove the unused function

Kai Vehmanen (2):
      ASoC: SOF: Intel: pci-tgl: unblock S5 entry if DMA stop has failed"
      ASoC: SOF: Revert: "core: unregister clients and machine drivers in .shutdown"

Krzysztof Kozlowski (1):
      ASoC: lochnagar: Fix unused lochnagar_of_match warning

Marek Szyprowski (1):
      ASoC: wm8994: Fix potential deadlock

Marek Vasut (1):
      ASoC: dt-bindings: fsl-sai: Reinstate i.MX93 SAI compatible string

Mark Brown (4):
      ASoC: Intel: avs: Data probing and fw logging
      ASoC: Intel: Skylake: Topology and shutdown fixes
      ASoC: Intel: boards: updates for SOF boards
      ASoC: SOF: remove unregister calls from shutdown

Moises Cardona (1):
      ASoC: Intel: Add HP Stream 8 to bytcr_rt5640.c

Wang Jingjin (2):
      ASoC: rockchip: pdm: Add missing clk_disable_unprepare() in rockchip_pdm_runtime_resume()
      ASoC: rockchip: spdif: Add missing clk_disable_unprepare() in rk_spdif_runtime_resume()

Wang Yufen (3):
      ASoC: mediatek: mt8173-rt5650-rt5514: fix refcount leak in mt8173_rt5650_rt5514_dev_probe()
      ASoC: audio-graph-card: fix refcount leak of cpu_ep in __graph_for_each_link()
      ASoC: mediatek: mt8183: fix refcount leak in mt8183_mt6358_ts3a227_max98357_dev_probe()

YC Hung (2):
      ASoC: mediatek: mt8195: add sof be ops to check audio active
      ASoC: SOF: mediatek: initialize panic_info to zero

Yang Yingliang (1):
      ASoC: sof_es8336: fix possible use-after-free in sof_es8336_remove()

ye xingchen (1):
      ASoC: imx-audmux: use sysfs_emit() to instead of scnprintf()

 .../devicetree/bindings/sound/fsl,sai.yaml         |   1 +
 include/sound/hdaudio_ext.h                        |   2 +
 sound/hda/ext/hdac_ext_stream.c                    |  41 ++
 sound/hda/hdac_controller.c                        |   4 +-
 sound/hda/hdac_stream.c                            |  51 ++-
 sound/soc/codecs/lochnagar-sc.c                    |   2 +-
 sound/soc/codecs/rt5670.c                          |   2 -
 sound/soc/codecs/wcd-clsh-v2.c                     |   6 -
 sound/soc/codecs/wm8994.c                          |   5 +
 sound/soc/fsl/imx-audmux.c                         |   3 +-
 sound/soc/generic/audio-graph-card.c               |   4 +-
 sound/soc/intel/Kconfig                            |   1 +
 sound/soc/intel/avs/Makefile                       |   4 +
 sound/soc/intel/avs/apl.c                          |  24 +-
 sound/soc/intel/avs/avs.h                          |  80 +++-
 sound/soc/intel/avs/board_selection.c              |  33 ++
 sound/soc/intel/avs/boards/Kconfig                 |   8 +
 sound/soc/intel/avs/boards/Makefile                |   2 +
 sound/soc/intel/avs/boards/probe.c                 |  64 +++
 sound/soc/intel/avs/core.c                         |   2 +
 sound/soc/intel/avs/debugfs.c                      | 436 +++++++++++++++++++++
 sound/soc/intel/avs/ipc.c                          |   2 +-
 sound/soc/intel/avs/messages.c                     | 104 ++++-
 sound/soc/intel/avs/messages.h                     |  53 +++
 sound/soc/intel/avs/pcm.c                          |   6 +-
 sound/soc/intel/avs/probes.c                       | 313 +++++++++++++++
 sound/soc/intel/avs/registers.h                    |   3 +-
 sound/soc/intel/avs/skl.c                          |  17 +-
 sound/soc/intel/avs/utils.c                        |  22 --
 sound/soc/intel/boards/Makefile                    |   3 +-
 sound/soc/intel/boards/bytcr_rt5640.c              |  25 ++
 sound/soc/intel/boards/sof_es8336.c                |   2 +-
 sound/soc/intel/boards/sof_realtek_common.c        |   3 +-
 sound/soc/intel/boards/sof_rt5682.c                |   6 +
 sound/soc/intel/boards/sof_sdw.c                   |  10 +-
 sound/soc/intel/boards/sof_sdw_common.h            |  20 +-
 sound/soc/intel/boards/sof_sdw_rt1316.c            | 239 -----------
 sound/soc/intel/boards/sof_sdw_rt1318.c            | 120 ------
 .../boards/{sof_sdw_rt1308.c => sof_sdw_rt_amp.c}  | 139 +++++--
 sound/soc/intel/common/soc-acpi-intel-jsl-match.c  |   5 +
 sound/soc/intel/common/soc-acpi-intel-rpl-match.c  |   2 +-
 sound/soc/intel/skylake/skl-sst-cldma.c            |  27 +-
 sound/soc/intel/skylake/skl-topology.c             |  73 ++--
 sound/soc/intel/skylake/skl-topology.h             |   1 -
 sound/soc/intel/skylake/skl.c                      |   5 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c   |   7 +-
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c        |  14 +-
 sound/soc/mediatek/mt8195/mt8195-mt6359.c          |  30 ++
 sound/soc/rockchip/rockchip_pdm.c                  |   1 +
 sound/soc/rockchip/rockchip_spdif.c                |   1 +
 sound/soc/soc-pcm.c                                |  20 +-
 sound/soc/sof/core.c                               |   9 -
 sound/soc/sof/intel/hda-dsp.c                      |  72 ++++
 sound/soc/sof/intel/hda.h                          |   1 +
 sound/soc/sof/intel/tgl.c                          |   2 +-
 sound/soc/sof/mediatek/mtk-adsp-common.c           |   2 +-
 56 files changed, 1519 insertions(+), 615 deletions(-)
 create mode 100644 sound/soc/intel/avs/boards/probe.c
 create mode 100644 sound/soc/intel/avs/debugfs.c
 create mode 100644 sound/soc/intel/avs/probes.c
 delete mode 100644 sound/soc/intel/boards/sof_sdw_rt1316.c
 delete mode 100644 sound/soc/intel/boards/sof_sdw_rt1318.c
 rename sound/soc/intel/boards/{sof_sdw_rt1308.c => sof_sdw_rt_amp.c} (59%)
