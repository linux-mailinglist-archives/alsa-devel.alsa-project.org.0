Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0772D640901
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Dec 2022 16:12:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 939A61786;
	Fri,  2 Dec 2022 16:11:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 939A61786
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669993958;
	bh=ib1GHpO28N/yLvN2OAyvyucej6LL1ssA2+MGEP15um0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=j3WaLL0F8G2i5fkMHt8/GwkpuZQ432uLahs0NgtrXdgIkRrwsQfWvlggWvqtR0yZF
	 KuoJjrHdKNcgvBuwCuBCJnQUBMC6zBOp631k588lOzNsxXNzJP1u1fqt+bbLXhYlsl
	 4DQIkYzxW930n7DapoPMnSPZpcLw1biut0f9Ri4E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38752F804FC;
	Fri,  2 Dec 2022 16:11:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DAF7EF804D6; Fri,  2 Dec 2022 16:11:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 324A8F800BD
 for <alsa-devel@alsa-project.org>; Fri,  2 Dec 2022 16:11:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 324A8F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="TseWZaNs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669993897; x=1701529897;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ib1GHpO28N/yLvN2OAyvyucej6LL1ssA2+MGEP15um0=;
 b=TseWZaNskF5mmIkyekBtFfF74Lw04VaHXzi7oocuG96+cnXLyaEaiwCC
 sOdMMIM2jsEItn2ge3CpPFrwgszTAHDHcWLPL/QWFcH8mMMKkUiIMayYc
 ukhZ1Y6KDOM1AB0s/JL8gSZIIQidTqTJzxFAUNHjvdCRaF9tkconBxPpK
 WWu0p/SqjrfhrZuHlQf4vGeEx9EGetLNGH4u0BNXihg84jbxI0IUpbhMz
 0T0ISAGksZyu05sgtyqykBuiNY9cEDwQ7gFcRnJb4coUn5EZk5PdcdQrE
 f5gZZLGhpgtpON17gbnDTChr7Jnis1prbdoJwlWY6EopLNhhl2AnCDQNn Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="402251671"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; d="scan'208";a="402251671"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2022 07:11:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="708504634"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; d="scan'208";a="708504634"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga008.fm.intel.com with ESMTP; 02 Dec 2022 07:11:29 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 00/16] ASoC: Intel: avs: Data probing and fw logging
Date: Fri,  2 Dec 2022 16:28:25 +0100
Message-Id: <20221202152841.672536-1-cezary.rojewski@intel.com>
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


Changes in v2:
- reordered sign offs in patch 03 as reported by Takashi
- fixed issue reported by ikp - unintilialized 'runtime' variable in
  patch 03
- added missing module_get_upon_open in component driver declaration

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
 sound/hda/hdac_stream.c               |  51 +--
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
 sound/soc/intel/avs/probes.c          | 313 ++++++++++++++++++
 sound/soc/intel/avs/registers.h       |   3 +-
 sound/soc/intel/avs/skl.c             |  17 +-
 sound/soc/intel/avs/utils.c           |  22 --
 22 files changed, 1172 insertions(+), 100 deletions(-)
 create mode 100644 sound/soc/intel/avs/boards/probe.c
 create mode 100644 sound/soc/intel/avs/debugfs.c
 create mode 100644 sound/soc/intel/avs/probes.c

-- 
2.25.1

