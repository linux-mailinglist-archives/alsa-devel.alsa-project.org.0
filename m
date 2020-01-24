Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B58B148E86
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jan 2020 20:13:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0B10167F;
	Fri, 24 Jan 2020 20:13:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0B10167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579893235;
	bh=cMbAJHKMlVkLSeVGNN3qZaBgwnaZRqhGWjWZfkq5/Lc=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DddQUntwE0CahbXYvr5QBjV9Q/dTW0feaSZQuxEFB8l7TUMh2UYxv1s0Sxql9pTo1
	 3IkrmYlY25UnflKK/AHegUl8Fj6ecKbPhezEfuAFUqTpxOtf/6s1KC1wdlHCKdIx9c
	 DHW9I/WqyGAx+EUNot4jxBEZXWKJjlEDtfCk/Ja0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADE30F80272;
	Fri, 24 Jan 2020 20:12:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4AC3F80229; Fri, 24 Jan 2020 20:12:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C249BF800F5
 for <alsa-devel@alsa-project.org>; Fri, 24 Jan 2020 20:12:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C249BF800F5
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jan 2020 11:04:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,358,1574150400"; d="scan'208";a="260337114"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga002.fm.intel.com with ESMTP; 24 Jan 2020 11:04:19 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 24 Jan 2020 20:04:01 +0100
Message-Id: <20200124190413.18154-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH 00/12] ASoC: SOF: Data probing
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This set of patches achieves few goals in order to enable data probing
feature for audio DSP.

First, provide new and alter existing interfaces (page allocation,
runtime flow adjustments) to make them compress friendly.

For HDA part, work has been done to account for compress streams when
servicing IRQs, setting up BDLs and assigning DMAs.

Finally, the end goal which are the probe APIs and usage itself. Probes
can be treated as endpoints which allow for data extraction from or
injection to target module - a great ally when debugging problematic
audio issues such as distortions, glitches or gaps.
Compress streams are a weapon of choice here to provide a lightweight
implementation.

While all available IPCs have been defined, current implementation
covers extraction only, with injection scheduled for a later date.

Initial review and development of probes can be found under:
https://github.com/thesofproject/linux/pull/1276

with the hda-compress-enable set of patches being separated and
reviewed on:
https://github.com/thesofproject/linux/pull/1571

Tested on CML-U with rt5682 i2s board.

Cezary Rojewski (12):
  ALSA: hda: Allow for compress stream to hdac_ext_stream assignment
  ALSA: hda: Prepare for compress stream support
  ALSA: hda: Interrupt servicing and BDL setup for compress streams
  ALSA: core: Expand DMA buffer information
  ALSA: core: Implement compress page allocation and free routines
  ASoC: SOF: Intel: Account for compress streams when servicing IRQs
  ASoC: SOF: Implement Probe IPC API
  ASoC: SOF: Generic probe compress operations
  ASoC: SOF: Intel: Probe compress operations
  ASoC: SOF: Provide probe debugfs support
  ASoC: SOF: Intel: Add Probe compress CPU DAIs
  ASoC: Intel: sof_rt5682: Add compress probe DAI links

 include/sound/compress_driver.h     |  40 +++-
 include/sound/hdaudio.h             |   2 +
 include/sound/hdaudio_ext.h         |   2 +
 include/sound/sof/header.h          |  11 ++
 sound/core/compress_offload.c       |  42 ++++
 sound/hda/ext/hdac_ext_stream.c     |  49 ++++-
 sound/hda/hdac_controller.c         |   4 +-
 sound/hda/hdac_stream.c             |  52 +++--
 sound/soc/intel/boards/sof_rt5682.c |  20 +-
 sound/soc/sof/Kconfig               |   9 +
 sound/soc/sof/Makefile              |   3 +-
 sound/soc/sof/compress.c            | 139 ++++++++++++++
 sound/soc/sof/compress.h            |  29 +++
 sound/soc/sof/debug.c               | 208 ++++++++++++++++++++
 sound/soc/sof/intel/Kconfig         |  10 +
 sound/soc/sof/intel/Makefile        |   1 +
 sound/soc/sof/intel/apl.c           |   9 +
 sound/soc/sof/intel/cnl.c           |   9 +
 sound/soc/sof/intel/hda-compress.c  | 132 +++++++++++++
 sound/soc/sof/intel/hda-dai.c       |  28 +++
 sound/soc/sof/intel/hda-ipc.c       |   4 +-
 sound/soc/sof/intel/hda-stream.c    |  26 ++-
 sound/soc/sof/intel/hda.h           |  30 +++
 sound/soc/sof/ops.h                 |  43 +++++
 sound/soc/sof/pcm.c                 |  11 +-
 sound/soc/sof/probe.c               | 287 ++++++++++++++++++++++++++++
 sound/soc/sof/probe.h               |  85 ++++++++
 sound/soc/sof/sof-priv.h            |  24 +++
 28 files changed, 1266 insertions(+), 43 deletions(-)
 create mode 100644 sound/soc/sof/compress.c
 create mode 100644 sound/soc/sof/compress.h
 create mode 100644 sound/soc/sof/intel/hda-compress.c
 create mode 100644 sound/soc/sof/probe.c
 create mode 100644 sound/soc/sof/probe.h

-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
