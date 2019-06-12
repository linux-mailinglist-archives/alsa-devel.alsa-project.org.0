Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7025242D68
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 19:25:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F338917B5;
	Wed, 12 Jun 2019 19:24:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F338917B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560360345;
	bh=+0Y3rMiaBk/mvR49TSb2NPJfqoYU486KcRazeGlf/gU=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mPO3A6uWfaZpt5tKhPdYwP3fvQK4+GE7uRDtlRd9fVVKJhdZULwwGrm+OfeKf7cBz
	 oZ/Q4DcG3F0e9kQ39V88jTHcl7vR7iUCG/Q+yzBjlkb/ff2zqoiZMSsppzuYOCHKPH
	 30ReX9AePDpKrTzDpbZeXwnTWuYT1aPzxr9nAa3g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B774F8972F;
	Wed, 12 Jun 2019 19:24:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE392F8970C; Wed, 12 Jun 2019 19:23:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7802BF806F5
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 19:23:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7802BF806F5
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Jun 2019 10:23:51 -0700
X-ExtLoop1: 1
Received: from adorrell-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.133.122])
 by fmsmga008.fm.intel.com with ESMTP; 12 Jun 2019 10:23:51 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 12 Jun 2019 12:23:32 -0500
Message-Id: <20190612172347.22338-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 00/15] ASoC: SOF: Intel: HDaudio fixes and
	improvements
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This is unfortunately a rather large patchset tied to hardware
enablement. While productizing HDAudio+DMIC-based platforms, which is
a common design starting with CoffeLake platforms, the SOF team
encountered a combination of issues with host/link DMA coupling,
interrupt handling and other bits not getting properly cleared. The
patches in this series provide significant reliability and usage
improvements. They are viewed as mandatory for any product based on
HDaudio.

There will be a smaller series to fix HDaudio wake. It's almost ready
but didn't make the cut for this week and there's no reason to delay
reviews on the main changes further.

The remaining topics to complete are autodetection of the number of
microphones, for which an ACPI-based solution exists, and
autodetection of which platforms need to rely on a signed firmware,
for which DMI quirks will be required. This will be provided later in
July (after travel+vacation break for a number of contributors).

Keyon Jie (1):
  ASoC: SOF: Intel: hda-stream: fix a deadlock with bus->reg_lock

Ranjani Sridharan (9):
  ASoC: SOF: Intel: hda: save handle to sdev in sof_intel_hda_stream
  ASoC: SOF: Intel: hda: add new macro hstream_to_sof_hda_stream()
  ASoC: SOF: topology: add cpu_dai_name for DAIs
  ASoC: SOF: Intel: hda: assign link DMA channel at run-time
  ASoC: SOF: Intel: hda: reserve host DMA channel for hostless streams
  ASoC: SOF: Intel: hda: release link DMA for paused streams during
    suspend
  ASoC: SOF: Intel: hda: couple host and link DMA during FE hw_free
  ASoC: SOF: Intel: hda: modify stream interrupt handler
  ASoC: SOF: Intel: hda: clear stream status and wakests properly

Zhu Yingjiang (5):
  ASoC: SOF: Intel: hda: use the SOF defined ppcap functions
  ASoC: SOF: Intel: hda: add function for hda stop chip
  ASoC: SOF: Intel: hda: use the defined stop chip in suspend
  ASoC: SOF: Intel: hda: make sure DMA is start/stop by read the RUN bit
  ASoC: SOF: Intel: hda: make sure RUN bit setting to 0 during clear
    stream status

 sound/soc/sof/intel/apl.c        |   1 +
 sound/soc/sof/intel/cnl.c        |   1 +
 sound/soc/sof/intel/hda-ctrl.c   |  77 +++++++-
 sound/soc/sof/intel/hda-dai.c    | 293 ++++++++++++++++++++-----------
 sound/soc/sof/intel/hda-dsp.c    |  50 ++++--
 sound/soc/sof/intel/hda-stream.c | 157 ++++++++++++++---
 sound/soc/sof/intel/hda.h        |  17 +-
 sound/soc/sof/ops.h              |  16 +-
 sound/soc/sof/pcm.c              |   7 +
 sound/soc/sof/pm.c               |  24 ++-
 sound/soc/sof/sof-priv.h         |   9 +-
 sound/soc/sof/topology.c         |  56 +-----
 12 files changed, 495 insertions(+), 213 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
