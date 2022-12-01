Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAAC63F647
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Dec 2022 18:40:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB57E179F;
	Thu,  1 Dec 2022 18:39:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB57E179F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669916424;
	bh=MmQwQE7hcEXECQySfRHy5jF9fo7rBkiTbbovbD1zMM8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=isvLm6we1N0rI0a+66fx+eaheDPummDCC39B3EAS2qIvLW1eAIS847IHkHmKdHiPf
	 StsgpDOkg8EVbpr4MTOKH25PRR3/wRyc9G6amqrLw636iVg/hviPF+uTTaXFh85Mb7
	 FKaeVZm8lMTQLqKd1/r8k2L1Mp9ludB5ILlFt0yQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E2E0F80557;
	Thu,  1 Dec 2022 18:39:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE03DF804ED; Thu,  1 Dec 2022 18:39:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49A18F80116
 for <alsa-devel@alsa-project.org>; Thu,  1 Dec 2022 18:39:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49A18F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Dt52fL9p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669916362; x=1701452362;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MmQwQE7hcEXECQySfRHy5jF9fo7rBkiTbbovbD1zMM8=;
 b=Dt52fL9pDKFpQijHwF2MKPY7gLmsdriN6HNnpg/NFM+mrRefmPQCLi+1
 7cocPo7eQuzmFXSw+4aOR1BBIE4kUndtUFWcDDot90uitFW07rx9CIy29
 6ryjaxa8gYhrTLOkRf0+071I9TkWKwhtLCmIodLQhMVj5ZCO3GSHHr+1a
 t8oDx11UkyzzYEdkxwHXeIL6TbEuzWj+kgrkA4jA/cr/OHoT7KHV2DW2m
 ofkLDEsL32SRK0MfJd9pQHZ1EkqCwTVMRV/91OonosQ4P53JKKtUyWnTA
 03yb5X+WmST6a4HM5Tdqn9SWq6pihpBboQamQyVk4DTKGhCHpscQdkHxg g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="377908288"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; d="scan'208";a="377908288"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 09:39:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="889823896"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; d="scan'208";a="889823896"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga006.fm.intel.com with ESMTP; 01 Dec 2022 09:39:14 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 00/16] ASoC: Intel: avs: Data probing and fw logging
Date: Thu,  1 Dec 2022 18:56:03 +0100
Message-Id: <20221201175619.504758-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

The patchset focuses on debug functionality for the avs-driver.
Two major blocks are covered here: data probing and AudioDSP firmware
logging. Both are configured and controlled through debugfs.

Data probing is a AudioDSP debug functionality which allows for
gathering the actual data that is being routed to or from a module.
Helps in debugging its processing capabilities - navigate to a specific
module which may have caused a glitch within a pipeline (set of modules
bound together).

First few allow for assigning compress stream to a HDAudio stream, what
is currently limited to pcm substreams only. These patches were already
present on this list and reviewed in the past [1].

The next few tidy existing debug-related code up so it's ready for
addition of new functionalities and make it clear which part of the avs
is debug related and which is not. These also simplify the existing
locking around the trace fifo.

Afterward, debug-related IPCs are defined along with stub soc-component
and compress DAI operations. Not much is done there as it's not a
standard PCM streaming scenario. Most code found in compress operations
is inherited from the HOST side of HDAudio streaming found in pcm.c
file of the driver.

Finally, a debugfs file operations are defined. These facilitate
connecting to DSP modules from which the data shall be gathered as well
as control and configuration of firmware logging. Additionally, entries
are added to allow for dumping snapshots of key memory windows.


[1]: https://lore.kernel.org/alsa-devel/20200124190413.18154-1-cezary.rojewski@intel.com/

Cezary Rojewski (16):
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

 include/sound/hdaudio_ext.h           |   2 +
 sound/hda/ext/hdac_ext_stream.c       |  41 +++
 sound/hda/hdac_controller.c           |   4 +-
 sound/hda/hdac_stream.c               |  52 +--
 sound/soc/intel/Kconfig               |   1 +
 sound/soc/intel/avs/Makefile          |   4 +
 sound/soc/intel/avs/apl.c             |  24 +-
 sound/soc/intel/avs/avs.h             |  80 ++++-
 sound/soc/intel/avs/board_selection.c |  33 ++
 sound/soc/intel/avs/boards/Kconfig    |   8 +
 sound/soc/intel/avs/boards/Makefile   |   2 +
 sound/soc/intel/avs/boards/probe.c    |  64 ++++
 sound/soc/intel/avs/core.c            |   2 +
 sound/soc/intel/avs/debugfs.c         | 436 ++++++++++++++++++++++++++
 sound/soc/intel/avs/ipc.c             |   2 +-
 sound/soc/intel/avs/messages.c        | 104 +++++-
 sound/soc/intel/avs/messages.h        |  53 ++++
 sound/soc/intel/avs/pcm.c             |   6 +-
 sound/soc/intel/avs/probes.c          | 312 ++++++++++++++++++
 sound/soc/intel/avs/registers.h       |   3 +-
 sound/soc/intel/avs/skl.c             |  17 +-
 sound/soc/intel/avs/utils.c           |  22 --
 22 files changed, 1172 insertions(+), 100 deletions(-)
 create mode 100644 sound/soc/intel/avs/boards/probe.c
 create mode 100644 sound/soc/intel/avs/debugfs.c
 create mode 100644 sound/soc/intel/avs/probes.c

-- 
2.25.1

