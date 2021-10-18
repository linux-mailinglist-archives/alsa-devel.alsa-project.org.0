Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53553432011
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Oct 2021 16:40:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E52191788;
	Mon, 18 Oct 2021 16:39:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E52191788
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634568048;
	bh=jALASQWXWTe9pf+gs/r2jiEaSo++i/lSIsA+2kgY2oE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=l/XzuJXAh1l0rCQvLhN6wNHcGG6lRs02fnpgEQTvpgtq5/r0/9CyxWtq7hR0EjCmL
	 hnzaMbpVnO0fUHS6eX3ffMSopZ23ZG98HFCM4RM+ZQ2dj2nGj6sooJkNUWq/rWR0vT
	 j2qmPe9VeAxxhceKxNMJf5cMyda89zHTmgjOshIM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52E90F80224;
	Mon, 18 Oct 2021 16:39:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6680F80111; Mon, 18 Oct 2021 16:39:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 964DFF80111
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 16:39:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 964DFF80111
X-IronPort-AV: E=McAfee;i="6200,9189,10140"; a="291731889"
X-IronPort-AV: E=Sophos;i="5.85,382,1624345200"; d="scan'208";a="291731889"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2021 07:39:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,382,1624345200"; d="scan'208";a="629218913"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga001.fm.intel.com with ESMTP; 18 Oct 2021 07:39:20 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 0/4] ALSA: hda: New NHLT functions and cleanup
Date: Mon, 18 Oct 2021 16:40:50 +0200
Message-Id: <20211018144054.286268-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.com,
 hdegoede@redhat.com, broonie@kernel.org
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

Changes add two crucial functions: endpoint presence-check and
retrieval of endpoint's BLOB (hardware configuration) to NHLT API.

Few cleanups accompany the above:
Work is done to align NHLT-struct naming with other, commonly used
ACPI-structs. While cleaning up, don't forget about "is DMIC in NHLT?"
check. No need to check for channel count or anything DMIC-configuration
related, just straight up verify link_type presence.

Changes in v2:
- patch "ALSA hda: Drop device-argument in NHLT functions" has been
  dropped
- updated newly added declarations in intel-nhlt.h so warning:
  "no-previous-prototype-for-function" and error:
  "use-of-undeclared-identifier" are no longer observed when
  CONFIG_SND_INTEL_NHLT is not enabled
- added Mark's tag to the last patch of the series

Amadeusz Sławiński (4):
  ALSA: hda: Follow ACPI convention in NHLT struct naming
  ALSA: hda: Fill gaps in NHLT endpoint-interface
  ALSA: hda: Simplify DMIC-in-NHLT check
  ASoC: Intel: Skylake: Use NHLT API to search for blob

 include/sound/intel-nhlt.h             |  53 ++++++++----
 sound/hda/intel-dsp-config.c           |   4 +-
 sound/hda/intel-nhlt.c                 | 110 ++++++++++++++++++++++++-
 sound/soc/intel/skylake/skl-nhlt.c     | 108 +-----------------------
 sound/soc/intel/skylake/skl-pcm.c      |   3 +
 sound/soc/intel/skylake/skl-topology.c |  29 ++++---
 sound/soc/intel/skylake/skl-topology.h |   1 +
 sound/soc/intel/skylake/skl.h          |   6 +-
 sound/soc/sof/intel/hda.c              |   2 +-
 9 files changed, 171 insertions(+), 145 deletions(-)

-- 
2.25.1

