Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 976AB122820
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Dec 2019 11:01:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7467850;
	Tue, 17 Dec 2019 11:00:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7467850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576576871;
	bh=15zsIvLdGEzXXcF7wklrOAXznweeOl0CbPsf5LNdj5k=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MP19UN/DGXktt2BVTpQZ531ndHKO6BX8Pt2L4kuRM+30kaSUJjRhXOVUHn8kw5uxE
	 ieN0W1nSyc9A58fW8tMafNHEBiLR7tZ2LIfLCCsOMFO/0f6Gbq7CemKU346bwCuu8M
	 I5YjGjoRoVihzUbtthFYx/tZPbv4F8ndSSfo9Hag=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EEF0DF80268;
	Tue, 17 Dec 2019 10:59:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40C4FF80256; Tue, 17 Dec 2019 10:59:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C25B4F80100
 for <alsa-devel@alsa-project.org>; Tue, 17 Dec 2019 10:59:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C25B4F80100
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Dec 2019 01:59:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,325,1571727600"; d="scan'208";a="221716995"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga001.fm.intel.com with ESMTP; 17 Dec 2019 01:59:16 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 17 Dec 2019 10:58:44 +0100
Message-Id: <20191217095851.19629-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH 0/7] ALSA: hda: Enable HDAudio compress
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

This set of patches provides new interfaces - page allocation - and
runtime flow adjustments - PM support - for compress operations.
For HDA part, work has been done to account for compress streams when
servicing IRQs, setting up BDLs and assigning DMAs.

End goal is to make room for one of DSP debug features: data probing.
It takes advantage of compress streams when extracting data from
running audio pipeline.

Initial review and development of probes can be found under:
https://github.com/thesofproject/linux/pull/1276

with this very set of patches being separated and reviewed on:
https://github.com/thesofproject/linux/pull/1571


Cezary Rojewski (7):
  ALSA: hda: Allow for compress stream to hdac_ext_stream assignment
  ALSA: hda: Prepare for compress stream support
  ALSA: hda: Interrupt servicing and BDL setup for compress streams
  ALSA: core: Expand DMA buffer information
  ALSA: core: Implement compress page allocation and free routines
  ASoC: compress: Add pm_runtime support
  ASoC: SOF: Intel: Account for compress streams when servicing IRQs

 include/sound/compress_driver.h  | 40 ++++++++++++++++++------
 include/sound/hdaudio.h          |  2 ++
 include/sound/hdaudio_ext.h      |  2 ++
 sound/core/compress_offload.c    | 42 ++++++++++++++++++++++++++
 sound/hda/ext/hdac_ext_stream.c  | 46 +++++++++++++++++++++++++---
 sound/hda/hdac_controller.c      |  4 +--
 sound/hda/hdac_stream.c          | 52 ++++++++++++++++++++------------
 sound/soc/soc-compress.c         | 29 +++++++++++++++++-
 sound/soc/sof/intel/hda-stream.c | 26 ++++++++++++++--
 9 files changed, 205 insertions(+), 38 deletions(-)

-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
