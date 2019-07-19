Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 587D66EBAB
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jul 2019 22:39:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE4B316E8;
	Fri, 19 Jul 2019 22:38:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE4B316E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563568788;
	bh=Vbm9gzmcuCNL6k4FSuivUwPJKUIiMoOO6/aL6cF1pSw=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SRh6mG9gH31/I2xTYUjP/58m0XbKgBZSREQZWV9mzVQZf2J1yjNieWlyG5K8r2ly8
	 Esbgfp3NTCjXW+m5fhLoxauDFUVfT5CoB1JQyaLvPg2SkLlFOlxduZEPheYkKN+l3j
	 rVP9zkWog+5R9ppXCIBUcUHi4QW339EARGljsWx8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDB29F80369;
	Fri, 19 Jul 2019 22:38:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AB0DF8015B; Fri, 19 Jul 2019 22:38:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F0B1F8015B
 for <alsa-devel@alsa-project.org>; Fri, 19 Jul 2019 22:37:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F0B1F8015B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jul 2019 13:37:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,283,1559545200"; d="scan'208";a="176389784"
Received: from hesheppa-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.255.92.1])
 by FMSMGA003.fm.intel.com with ESMTP; 19 Jul 2019 13:37:53 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 19 Jul 2019 15:37:47 -0500
Message-Id: <20190719203752.11151-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Daniel Drake <drake@endlessm.com>, Hui Wang <hui.wang@canonical.com>,
 Curtis Malainey <cujomalainey@google.com>, broonie@kernel.org
Subject: [alsa-devel] [PATCH v2 0/5] ALSA/HDA: abort probe when DMICs are
	detected
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

This is the second take on same problem of detecting when the HDaudio
legacy driver can be used and when the SST or SOF drivers are
required.

The previous attempt based on a the PCI Class information was a
resounding failure and broke audio on Linus' laptop, so we need
additional information to avoid enabling a DSP-based driver without a
good reason to do so.

This patchset suggests the use of the NHLT information which *in
theory* exposes DMIC endpoints. The legacy HDaudio driver cannot
handle DMICs and will not provide any capture capabilities. Since it's
typically the first one to probe due to the Makefile order, aborting
the probe will let the PCI subsystem look for the next driver which
hopefully will support this capability.

I tested this patch on 5 devices (SKL, KBL, APL, GLK, WHL), three
without DMICs and two with, and the detection seems to work as
planned. Additional testing by Canonical and Endless folks did not
expose any issues.

Changes since v1 (Feedback from Takashi):
Squashed patch3 in patch2
Changed log to dbg_info
Fixed module parameter handling

Changes since RFC:
Cosmetic code improvements
Moved intel-nhlt.h to include/sound
Moved intel-nhlt.c to sound/hda
Removed SOC prefixes
Added full-support for vendor-defined geometries
Added Kconfig and kernel module parameter to opt-in

Pierre-Louis Bossart (5):
  ASoC: Intel: Skylake: move NHLT header to common directory
  ALSA: hda: move parts of NHLT code to new module
  ALSA: hda: intel-nhlt: handle NHLT VENDOR_DEFINED DMIC geometry
  ASoC: Intel: Skylake: use common NHLT module
  ALSA: hda/intel: stop probe if DMICS are detected on Skylake+
    platforms

 .../skl-nhlt.h => include/sound/intel-nhlt.h  |  51 +++++++--
 sound/hda/Kconfig                             |   3 +
 sound/hda/Makefile                            |   3 +
 sound/hda/intel-nhlt.c                        | 102 ++++++++++++++++++
 sound/pci/hda/Kconfig                         |  10 ++
 sound/pci/hda/hda_intel.c                     |  34 ++++++
 sound/soc/intel/Kconfig                       |   1 +
 sound/soc/intel/skylake/skl-nhlt.c            |  91 +---------------
 sound/soc/intel/skylake/skl-ssp-clk.c         |   1 +
 sound/soc/intel/skylake/skl-topology.c        |   1 +
 sound/soc/intel/skylake/skl.c                 |  12 ++-
 sound/soc/intel/skylake/skl.h                 |   4 -
 12 files changed, 205 insertions(+), 108 deletions(-)
 rename sound/soc/intel/skylake/skl-nhlt.h => include/sound/intel-nhlt.h (65%)
 create mode 100644 sound/hda/intel-nhlt.c

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
