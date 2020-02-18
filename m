Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA9D1628B6
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Feb 2020 15:41:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1E281699;
	Tue, 18 Feb 2020 15:41:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1E281699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582036911;
	bh=gqApo8SVa2Fdcj9OvFDZIyURdyWIJWchnUJ1CnYgwrQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FbFSofrp5uBRHDeFbewbW1w+ZQ27r6Xq8WsMJgAmNCu4+8HicISTrJ6pX+OeCoD0g
	 hsZY8NX6DL/4LG0JEUqWTfMNs29TtzK77cjjBedOfJSnKWZbaVI25ks1smbPKcFHiN
	 KG8pvbMFqdHEe23bg/tYsaNj8YbheFUTWxIyJhwg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BA55F80145;
	Tue, 18 Feb 2020 15:40:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4BBA5F8014A; Tue, 18 Feb 2020 15:40:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E00AAF80137
 for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2020 15:40:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E00AAF80137
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Feb 2020 06:39:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,456,1574150400"; d="scan'208";a="235549758"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga003.jf.intel.com with ESMTP; 18 Feb 2020 06:39:57 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v5 0/9] ASoC: SOF: Data probing
Date: Tue, 18 Feb 2020 15:39:15 +0100
Message-Id: <20200218143924.10565-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, lgirdwood@gmail.com,
 tiwai@suse.com, vkoul@kernel.org, broonie@kernel.org
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

This set of patches achieves few goals in order to enable data probing
feature for audio DSP.

First, provide new and alter existing interfaces (page allocation,
runtime flow adjustments) to make them compress friendly.

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

Cahnges in v5:
- Removed SND_SOC_SOF_HDA_LINK requirement for hda probes. Instead of
  sound/hda/ext, sof hda operations are used
- In consequence of above, patches:
    ALSA: hda: Allow for compress stream to hdac_ext_stream assignment
    ALSA: hda: Prepare for compress stream support
    ALSA: hda: Interrupt servicing and BDL setup for compress streams
  have been dropped.

- In order to reuse pcm utility functions for hda compress, new patch
  has been added:
    ASoC: SOF: Intel: Expose SDnFMT helpers
- Addressed u64/ u32 concerns from Pierre when calculating bytes
  transferred during runtime

Changes in v4:
- No changes to ALSA core and hda patches

- 'probe' source added in patch "ASoC: SOF: Implement Probe IPC API" now
  only compiled if SND_SOC_SOF_DEBUG_PROBES is enabled. Said kconfig
  initial declaration has been moved to that patch too
- 'extractor_stream_tag' field now decorated with _DEBUG_PROBES to
  account for the change above
- Debugfs probe handlers now check if extractor stream is running before
  continuing. To achieve this, 'extractor_stream_tag' is both initialized
  and set to SOF_PROBE_INVALID_NODE_ID on sof_probe_compr_free().
  Suggestion provided by Pierre

- Reverted SND_SOC_SOF_HDA_LINK requirement-removal change for HDA probes.
  Code requires SND_HDA_EXT_CORE in order to function on Intel platforms
- Relocated probe-compress related code from /sof/pcm.c directly to
  /sof/compress.c as requested by Daniel

Changes in v3:
- No changes to ALSA core and hda patches

- Addressed sparse and all doc related warnings as reported by Pierre
- Moved _DEBUG_PROBES config outside of _DEVELOPER_SUPPORT block
- Renamed 'extractor' field to 'extractor_stream_tag' as requested
- Relocated 'extractor_stream_tag' declaration from patch 07 to 08

Changes in v2:
- No changes to ALSA core and hda patches

- Removed "ASoC: Intel: sof_rt5682: Add compress probe DAI links" from
  the patchset list as requested by Pierre
- updated copyright header for newly added files (dates)
- probes over HDA no longer require SND_SOC_SOF_HDA_LINK enabled
- renamed debugfs probe functions as requested by Pierre

- probe IPC API has been updated to align with newest SOF FW & probe
  debug app (struct_size macro has been enlisted to make the size
  calculations transparent). This targets only "ASoC: SOF: Implement
  Probe IPC API" patch

Cezary Rojewski (9):
  ALSA: core: Expand DMA buffer information
  ALSA: core: Implement compress page allocation and free routines
  ASoC: SOF: Intel: Account for compress streams when servicing IRQs
  ASoC: SOF: Implement Probe IPC API
  ASoC: SOF: Generic probe compress operations
  ASoC: SOF: Intel: Expose SDnFMT helpers
  ASoC: SOF: Intel: Probe compress operations
  ASoC: SOF: Provide probe debugfs support
  ASoC: SOF: Intel: Add Probe compress CPU DAIs

 include/sound/compress_driver.h    |  40 +++-
 include/sound/hdaudio.h            |   2 +
 include/sound/sof/header.h         |  11 ++
 sound/core/compress_offload.c      |  42 +++++
 sound/soc/sof/Kconfig              |   9 +
 sound/soc/sof/Makefile             |   1 +
 sound/soc/sof/compress.c           | 146 +++++++++++++++
 sound/soc/sof/compress.h           |  31 ++++
 sound/soc/sof/core.c               |   6 +
 sound/soc/sof/debug.c              | 226 +++++++++++++++++++++++
 sound/soc/sof/intel/Kconfig        |   9 +
 sound/soc/sof/intel/Makefile       |   1 +
 sound/soc/sof/intel/apl.c          |   9 +
 sound/soc/sof/intel/cnl.c          |   9 +
 sound/soc/sof/intel/hda-compress.c | 114 ++++++++++++
 sound/soc/sof/intel/hda-dai.c      |  28 +++
 sound/soc/sof/intel/hda-ipc.c      |   4 +-
 sound/soc/sof/intel/hda-pcm.c      |   8 +-
 sound/soc/sof/intel/hda-stream.c   |  25 ++-
 sound/soc/sof/intel/hda.h          |  32 ++++
 sound/soc/sof/ops.h                |  43 +++++
 sound/soc/sof/pcm.c                |   7 +
 sound/soc/sof/probe.c              | 286 +++++++++++++++++++++++++++++
 sound/soc/sof/probe.h              |  85 +++++++++
 sound/soc/sof/sof-priv.h           |  25 +++
 25 files changed, 1183 insertions(+), 16 deletions(-)
 create mode 100644 sound/soc/sof/compress.c
 create mode 100644 sound/soc/sof/compress.h
 create mode 100644 sound/soc/sof/intel/hda-compress.c
 create mode 100644 sound/soc/sof/probe.c
 create mode 100644 sound/soc/sof/probe.h

-- 
2.17.1

