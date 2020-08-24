Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BEB2509CA
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Aug 2020 22:11:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94951167D;
	Mon, 24 Aug 2020 22:10:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94951167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598299877;
	bh=NP8zHIw+Xbyj/vLm94JcChWsj8kgMuBVED/ey7I6I6Y=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qkyCccP0JkPW5pUl+Tuc6AAyK1yrG35YNFYezEPvpbUhOv7wklbsi1M0CUblqZ9Ju
	 i33zTY1E5eJJqqeenodzaBa+CysvjDfOdDZZeQBKpfmweOrV2evvnozXGDSKMSPegM
	 D3sEqg201vJJV1d7FMIEa3CH+fvDPKbRlGNbitHs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D865F8026A;
	Mon, 24 Aug 2020 22:09:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DFA5F8026A; Mon, 24 Aug 2020 22:09:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA5CBF800EB
 for <alsa-devel@alsa-project.org>; Mon, 24 Aug 2020 22:09:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA5CBF800EB
IronPort-SDR: ssH0mLvxA4IXpTDh+z0C3O19WMYhuh9zLEdkaeR6jMQuaBewc8EBPqpR7AtHpWJb+OPbabnzpd
 ahNMm7OgNEOg==
X-IronPort-AV: E=McAfee;i="6000,8403,9723"; a="157033724"
X-IronPort-AV: E=Sophos;i="5.76,349,1592895600"; d="scan'208";a="157033724"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2020 13:09:21 -0700
IronPort-SDR: WCp/0hNRRI6XPE+6ANqhTqpKRuk5nAx63DJrQPBaWelJcabNWNNDU+AIHpQoPOy2hO5SJGoa/o
 o2o75fgc7Cow==
X-IronPort-AV: E=Sophos;i="5.76,349,1592895600"; d="scan'208";a="443351176"
Received: from dentoneb-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.223.13])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2020 13:09:20 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/8] ASoC: SOF: trivial code/log/comment improvements
Date: Mon, 24 Aug 2020 15:09:04 -0500
Message-Id: <20200824200912.46852-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Remove useless variable initialization and allocation, adjust log
levels to make support easier, and fix comments. No functional
changes.

Guennadi Liakhovetski (2):
  ASoC: SOF: topology: (cosmetic) remove redundant variable
    initialisations
  ASoC: SOF: (cosmetic) use the "bool" type where it makes sense

Pierre-Louis Bossart (4):
  ASoC: SOF: IPC: reduce verbosity of IPC pointer updates
  ASoC: SOF: acpi: add dev_dbg() log for probe completion
  ASoC: SOF: Intel: add dev_dbg log when driver is not selected
  ASoC: Intel: use consistent HDAudio spelling in comments/docs

Ranjani Sridharan (2):
  ASoC: SOF: topology: remove unnecessary memory alloc for sdev->private
  ASoC: SOF: topology: reduce the log level for unhandled widgets

 include/sound/soc-acpi.h      |  2 +-
 sound/soc/intel/Kconfig       |  2 +-
 sound/soc/intel/skylake/skl.c |  6 +++---
 sound/soc/sof/Kconfig         |  2 +-
 sound/soc/sof/intel/Kconfig   |  2 +-
 sound/soc/sof/ipc.c           | 16 +++++++++++-----
 sound/soc/sof/pcm.c           |  8 ++++----
 sound/soc/sof/sof-acpi-dev.c  |  2 ++
 sound/soc/sof/sof-pci-dev.c   |  6 +++---
 sound/soc/sof/sof-priv.h      | 10 +++++-----
 sound/soc/sof/topology.c      | 20 ++++----------------
 11 files changed, 36 insertions(+), 40 deletions(-)


base-commit: aafdeba5cbc14cecee3797e669473b70a2b3e81e
-- 
2.25.1

