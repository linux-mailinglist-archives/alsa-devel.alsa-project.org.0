Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E4F8BAE70
	for <lists+alsa-devel@lfdr.de>; Fri,  3 May 2024 16:06:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71089E72;
	Fri,  3 May 2024 16:05:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71089E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714745166;
	bh=LaMII0DgP3+9o1Vo9dJFUnKsEh8yopVg4k7tFxcIxYU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=A1fxsgbmm50McLQLPhjz+bhPhjtQGZIIV1ezgIi2eKgXnInc8qvyTicrZZj2iyToB
	 QOtzJB+8h6FL6lPUcIIj4kGnhDJSz8asFjj6S8KkZrcuureFtT7ZPeUw0X+xgKFPWT
	 AEsKW212xCUkVjp3afC54GTl/5wP9dByJpOZkJGo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88BC0F805FF; Fri,  3 May 2024 16:04:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D5D64F8049C;
	Fri,  3 May 2024 16:04:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 086B9F805EB; Fri,  3 May 2024 16:04:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C91C7F80269
	for <alsa-devel@alsa-project.org>; Fri,  3 May 2024 16:04:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C91C7F80269
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Hhu60HxZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714745070; x=1746281070;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LaMII0DgP3+9o1Vo9dJFUnKsEh8yopVg4k7tFxcIxYU=;
  b=Hhu60HxZWAeYwBlIJlFNzhTlcOBGa7IqYSkF1Ah/shRwn1nzl8lhgZ2W
   5CPJgLZsJboJG3KmW6De7gBS3XKOyGnzq5+/oUBUFvJPcVTF8oR8il2lZ
   qKRnLEEBaz9/r9WTmWT2kNV/+YVwl9UffAuxJj71ZsonZ/6BQdhpR+Cut
   wwVnHo207pb8Zxl6y+Q4SJd7CtTg9vcxl43lF0mraBW4zrGPbeLPu2Cvm
   oNtymrhxudbQbXoDYa62/ixQYhdN+ZTMdkgHYV3sGq24uiCfz+ooVRUTk
   uIjRleLx0fdqwCIUucPQFaJM8I5o5oeoGn2tHw8weunRmr7IKHQ4Vm8P+
   A==;
X-CSE-ConnectionGUID: e6lq6231S8uKM9njv8o6lQ==
X-CSE-MsgGUID: EkkWe92WRguQ501Z6811ng==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="14369503"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000";
   d="scan'208";a="14369503"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 07:04:17 -0700
X-CSE-ConnectionGUID: toobI02vQj2v07YGHBgaFA==
X-CSE-MsgGUID: df5OiSFpTGKnpjhVQZNsXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000";
   d="scan'208";a="64908064"
Received: from sjslinke-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.113.3])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 07:04:18 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 0/9] ALSA/ASoC: Intel: clarify Copyright information
Date: Fri,  3 May 2024 09:03:50 -0500
Message-Id: <20240503140359.259762-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UH3ZDDPRDRLDYTZ6UU5MJMTOZ4YPCTSJ
X-Message-ID-Hash: UH3ZDDPRDRLDYTZ6UU5MJMTOZ4YPCTSJ
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UH3ZDDPRDRLDYTZ6UU5MJMTOZ4YPCTSJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patchset does not change any functionality. It only clarifies the
Copyright information in ASoC/HDAudio contributions, where an "All
rights reserved" notice was mistakenly added in a number of files over
the years, likely due to copy/paste. The Intel template never included
this statement.

I chose to group all these patches together, they could be merged with
either of the ALSA or the ASoC tree.

Pierre-Louis Bossart (9):
  ASoC: SOF: Intel: clarify Copyright information
  ASoC: Intel: boards: clarify Copyright information
  ASoC: Intel: common: clarify Copyright information
  ASoC: codecs: Intel: clarify Copyright information
  ASoC: Intel: catpt: clarify Copyright information
  ASoC: Intel: avs: clarify Copyright information
  ASoC: soc-topology-test: clarify Copyright information
  ALSA: hda: clarify Copyright information
  ALSA/ASoC: include: clarify Copyright information

 include/sound/hda-mlink.h                           | 2 +-
 include/sound/soc-acpi-intel-match.h                | 2 +-
 include/sound/soc-acpi.h                            | 2 +-
 include/sound/sof.h                                 | 2 +-
 include/sound/sof/channel_map.h                     | 2 +-
 include/sound/sof/control.h                         | 2 +-
 include/sound/sof/dai-intel.h                       | 2 +-
 include/sound/sof/dai.h                             | 2 +-
 include/sound/sof/debug.h                           | 2 +-
 include/sound/sof/ext_manifest.h                    | 2 +-
 include/sound/sof/ext_manifest4.h                   | 2 +-
 include/sound/sof/header.h                          | 2 +-
 include/sound/sof/info.h                            | 2 +-
 include/sound/sof/ipc4/header.h                     | 2 +-
 include/sound/sof/pm.h                              | 2 +-
 include/sound/sof/stream.h                          | 2 +-
 include/sound/sof/topology.h                        | 2 +-
 include/sound/sof/trace.h                           | 2 +-
 include/sound/sof/xtensa.h                          | 2 +-
 include/trace/events/sof.h                          | 2 +-
 include/trace/events/sof_intel.h                    | 2 +-
 include/uapi/sound/intel/avs/tokens.h               | 2 +-
 include/uapi/sound/sof/abi.h                        | 2 +-
 include/uapi/sound/sof/fw.h                         | 2 +-
 include/uapi/sound/sof/header.h                     | 2 +-
 include/uapi/sound/sof/tokens.h                     | 2 +-
 sound/pci/hda/hda_controller.c                      | 2 +-
 sound/pci/hda/hda_intel.c                           | 2 +-
 sound/pci/hda/patch_hdmi.c                          | 2 +-
 sound/soc/codecs/hda-dai.c                          | 2 +-
 sound/soc/codecs/hda.c                              | 2 +-
 sound/soc/codecs/hda.h                              | 2 +-
 sound/soc/intel/avs/apl.c                           | 2 +-
 sound/soc/intel/avs/avs.h                           | 2 +-
 sound/soc/intel/avs/board_selection.c               | 2 +-
 sound/soc/intel/avs/boards/da7219.c                 | 2 +-
 sound/soc/intel/avs/boards/dmic.c                   | 2 +-
 sound/soc/intel/avs/boards/es8336.c                 | 2 +-
 sound/soc/intel/avs/boards/hdaudio.c                | 2 +-
 sound/soc/intel/avs/boards/i2s_test.c               | 2 +-
 sound/soc/intel/avs/boards/max98357a.c              | 2 +-
 sound/soc/intel/avs/boards/max98373.c               | 2 +-
 sound/soc/intel/avs/boards/max98927.c               | 2 +-
 sound/soc/intel/avs/boards/nau8825.c                | 2 +-
 sound/soc/intel/avs/boards/probe.c                  | 2 +-
 sound/soc/intel/avs/boards/rt274.c                  | 2 +-
 sound/soc/intel/avs/boards/rt286.c                  | 2 +-
 sound/soc/intel/avs/boards/rt298.c                  | 2 +-
 sound/soc/intel/avs/boards/rt5514.c                 | 2 +-
 sound/soc/intel/avs/boards/rt5663.c                 | 2 +-
 sound/soc/intel/avs/boards/rt5682.c                 | 2 +-
 sound/soc/intel/avs/boards/ssm4567.c                | 2 +-
 sound/soc/intel/avs/cldma.c                         | 2 +-
 sound/soc/intel/avs/cldma.h                         | 2 +-
 sound/soc/intel/avs/cnl.c                           | 2 +-
 sound/soc/intel/avs/control.c                       | 2 +-
 sound/soc/intel/avs/control.h                       | 2 +-
 sound/soc/intel/avs/core.c                          | 2 +-
 sound/soc/intel/avs/debugfs.c                       | 2 +-
 sound/soc/intel/avs/dsp.c                           | 2 +-
 sound/soc/intel/avs/icl.c                           | 2 +-
 sound/soc/intel/avs/ipc.c                           | 2 +-
 sound/soc/intel/avs/loader.c                        | 2 +-
 sound/soc/intel/avs/messages.c                      | 2 +-
 sound/soc/intel/avs/messages.h                      | 2 +-
 sound/soc/intel/avs/path.c                          | 2 +-
 sound/soc/intel/avs/path.h                          | 2 +-
 sound/soc/intel/avs/pcm.c                           | 2 +-
 sound/soc/intel/avs/probes.c                        | 2 +-
 sound/soc/intel/avs/registers.h                     | 2 +-
 sound/soc/intel/avs/skl.c                           | 2 +-
 sound/soc/intel/avs/sysfs.c                         | 2 +-
 sound/soc/intel/avs/tgl.c                           | 2 +-
 sound/soc/intel/avs/topology.c                      | 2 +-
 sound/soc/intel/avs/topology.h                      | 2 +-
 sound/soc/intel/avs/trace.c                         | 2 +-
 sound/soc/intel/avs/utils.c                         | 2 +-
 sound/soc/intel/avs/utils.h                         | 2 +-
 sound/soc/intel/boards/bdw_rt286.c                  | 2 +-
 sound/soc/intel/boards/bxt_da7219_max98357a.c       | 2 +-
 sound/soc/intel/boards/bxt_rt298.c                  | 2 +-
 sound/soc/intel/boards/hda_dsp_common.c             | 2 +-
 sound/soc/intel/boards/hsw_rt5640.c                 | 2 +-
 sound/soc/intel/boards/kbl_rt5663_max98927.c        | 2 +-
 sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c | 2 +-
 sound/soc/intel/boards/skl_nau88l25_max98357a.c     | 2 +-
 sound/soc/intel/boards/skl_nau88l25_ssm4567.c       | 4 ++--
 sound/soc/intel/boards/skl_rt286.c                  | 4 ++--
 sound/soc/intel/boards/sof_board_helpers.c          | 2 +-
 sound/soc/intel/boards/sof_maxim_common.c           | 2 +-
 sound/soc/intel/boards/sof_realtek_common.c         | 2 +-
 sound/soc/intel/boards/sof_ssp_amp.c                | 2 +-
 sound/soc/intel/catpt/core.h                        | 2 +-
 sound/soc/intel/catpt/device.c                      | 2 +-
 sound/soc/intel/catpt/dsp.c                         | 2 +-
 sound/soc/intel/catpt/ipc.c                         | 2 +-
 sound/soc/intel/catpt/loader.c                      | 2 +-
 sound/soc/intel/catpt/messages.c                    | 2 +-
 sound/soc/intel/catpt/messages.h                    | 2 +-
 sound/soc/intel/catpt/pcm.c                         | 2 +-
 sound/soc/intel/catpt/registers.h                   | 2 +-
 sound/soc/intel/catpt/sysfs.c                       | 2 +-
 sound/soc/intel/catpt/trace.h                       | 2 +-
 sound/soc/intel/common/soc-acpi-intel-lnl-match.c   | 2 +-
 sound/soc/intel/common/soc-acpi-intel-ssp-common.c  | 2 +-
 sound/soc/intel/common/sst-dsp-priv.h               | 2 +-
 sound/soc/intel/common/sst-dsp.c                    | 2 +-
 sound/soc/intel/common/sst-dsp.h                    | 2 +-
 sound/soc/intel/common/sst-ipc.c                    | 2 +-
 sound/soc/intel/common/sst-ipc.h                    | 2 +-
 sound/soc/soc-topology-test.c                       | 2 +-
 sound/soc/sof/control.c                             | 2 +-
 sound/soc/sof/core.c                                | 2 +-
 sound/soc/sof/debug.c                               | 2 +-
 sound/soc/sof/fw-file-profile.c                     | 2 +-
 sound/soc/sof/intel/apl.c                           | 2 +-
 sound/soc/sof/intel/atom.c                          | 2 +-
 sound/soc/sof/intel/atom.h                          | 2 +-
 sound/soc/sof/intel/bdw.c                           | 2 +-
 sound/soc/sof/intel/byt.c                           | 2 +-
 sound/soc/sof/intel/cnl.c                           | 2 +-
 sound/soc/sof/intel/ext_manifest.h                  | 2 +-
 sound/soc/sof/intel/hda-bus.c                       | 2 +-
 sound/soc/sof/intel/hda-codec.c                     | 2 +-
 sound/soc/sof/intel/hda-common-ops.c                | 2 +-
 sound/soc/sof/intel/hda-ctrl.c                      | 2 +-
 sound/soc/sof/intel/hda-dai-ops.c                   | 2 +-
 sound/soc/sof/intel/hda-dai.c                       | 2 +-
 sound/soc/sof/intel/hda-dsp.c                       | 2 +-
 sound/soc/sof/intel/hda-ipc.c                       | 2 +-
 sound/soc/sof/intel/hda-ipc.h                       | 2 +-
 sound/soc/sof/intel/hda-loader-skl.c                | 2 +-
 sound/soc/sof/intel/hda-loader.c                    | 2 +-
 sound/soc/sof/intel/hda-mlink.c                     | 2 +-
 sound/soc/sof/intel/hda-pcm.c                       | 2 +-
 sound/soc/sof/intel/hda-probes.c                    | 2 +-
 sound/soc/sof/intel/hda-stream.c                    | 2 +-
 sound/soc/sof/intel/hda-trace.c                     | 2 +-
 sound/soc/sof/intel/hda.c                           | 2 +-
 sound/soc/sof/intel/hda.h                           | 2 +-
 sound/soc/sof/intel/icl.c                           | 2 +-
 sound/soc/sof/intel/lnl.c                           | 2 +-
 sound/soc/sof/intel/lnl.h                           | 2 +-
 sound/soc/sof/intel/mtl.c                           | 2 +-
 sound/soc/sof/intel/mtl.h                           | 2 +-
 sound/soc/sof/intel/pci-apl.c                       | 2 +-
 sound/soc/sof/intel/pci-cnl.c                       | 2 +-
 sound/soc/sof/intel/pci-icl.c                       | 2 +-
 sound/soc/sof/intel/pci-lnl.c                       | 2 +-
 sound/soc/sof/intel/pci-mtl.c                       | 2 +-
 sound/soc/sof/intel/pci-skl.c                       | 2 +-
 sound/soc/sof/intel/pci-tgl.c                       | 2 +-
 sound/soc/sof/intel/pci-tng.c                       | 2 +-
 sound/soc/sof/intel/shim.h                          | 2 +-
 sound/soc/sof/intel/skl.c                           | 2 +-
 sound/soc/sof/intel/telemetry.c                     | 2 +-
 sound/soc/sof/intel/telemetry.h                     | 2 +-
 sound/soc/sof/intel/tgl.c                           | 2 +-
 sound/soc/sof/iomem-utils.c                         | 2 +-
 sound/soc/sof/ipc.c                                 | 2 +-
 sound/soc/sof/ipc3-control.c                        | 2 +-
 sound/soc/sof/ipc3-dtrace.c                         | 2 +-
 sound/soc/sof/ipc3-loader.c                         | 2 +-
 sound/soc/sof/ipc3-pcm.c                            | 2 +-
 sound/soc/sof/ipc3-priv.h                           | 2 +-
 sound/soc/sof/ipc3-topology.c                       | 2 +-
 sound/soc/sof/ipc3.c                                | 2 +-
 sound/soc/sof/ipc4-control.c                        | 2 +-
 sound/soc/sof/ipc4-fw-reg.h                         | 2 +-
 sound/soc/sof/ipc4-loader.c                         | 2 +-
 sound/soc/sof/ipc4-mtrace.c                         | 2 +-
 sound/soc/sof/ipc4-pcm.c                            | 2 +-
 sound/soc/sof/ipc4-priv.h                           | 2 +-
 sound/soc/sof/ipc4-telemetry.c                      | 2 +-
 sound/soc/sof/ipc4-telemetry.h                      | 2 +-
 sound/soc/sof/ipc4-topology.c                       | 2 +-
 sound/soc/sof/ipc4-topology.h                       | 2 +-
 sound/soc/sof/ipc4.c                                | 2 +-
 sound/soc/sof/loader.c                              | 2 +-
 sound/soc/sof/nocodec.c                             | 2 +-
 sound/soc/sof/ops.c                                 | 2 +-
 sound/soc/sof/ops.h                                 | 2 +-
 sound/soc/sof/pcm.c                                 | 2 +-
 sound/soc/sof/pm.c                                  | 2 +-
 sound/soc/sof/sof-acpi-dev.c                        | 2 +-
 sound/soc/sof/sof-acpi-dev.h                        | 2 +-
 sound/soc/sof/sof-audio.c                           | 2 +-
 sound/soc/sof/sof-audio.h                           | 2 +-
 sound/soc/sof/sof-client-ipc-flood-test.c           | 2 +-
 sound/soc/sof/sof-client-ipc-kernel-injector.c      | 2 +-
 sound/soc/sof/sof-client-ipc-msg-injector.c         | 2 +-
 sound/soc/sof/sof-client-probes-ipc3.c              | 2 +-
 sound/soc/sof/sof-client-probes-ipc4.c              | 2 +-
 sound/soc/sof/sof-client-probes.c                   | 2 +-
 sound/soc/sof/sof-client.c                          | 2 +-
 sound/soc/sof/sof-pci-dev.c                         | 2 +-
 sound/soc/sof/sof-pci-dev.h                         | 2 +-
 sound/soc/sof/sof-priv.h                            | 2 +-
 sound/soc/sof/sof-utils.c                           | 2 +-
 sound/soc/sof/sof-utils.h                           | 2 +-
 sound/soc/sof/stream-ipc.c                          | 2 +-
 sound/soc/sof/topology.c                            | 2 +-
 sound/soc/sof/trace.c                               | 2 +-
 sound/soc/sof/xtensa/core.c                         | 2 +-
 204 files changed, 206 insertions(+), 206 deletions(-)

-- 
2.40.1

