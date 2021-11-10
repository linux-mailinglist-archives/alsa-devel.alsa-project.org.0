Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F2F44BEB7
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Nov 2021 11:31:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF6711673;
	Wed, 10 Nov 2021 11:30:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF6711673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636540277;
	bh=MPUcDVrgtINCZbaIv28RSFl+q9Pm9tWRPb4E17MLbas=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OVvAlMaixHjx4m+UPNQtvmzyIWDEYgIoHIMzicGRwYbDY7lMW+QSeALvgKOmKs4el
	 WyxasaURMY0FwJHv4vgIS90AV/1F4jYfxKYJHiNavt3AY+dS/JjPO5gZLVf4jdnPnC
	 WdwsVx77IOh0HNMiCDOZ8k6uXE4zTdougPEL9SUA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09A0FF804BC;
	Wed, 10 Nov 2021 11:29:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0803DF804BC; Wed, 10 Nov 2021 11:29:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC332F80227
 for <alsa-devel@alsa-project.org>; Wed, 10 Nov 2021 11:29:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC332F80227
X-IronPort-AV: E=McAfee;i="6200,9189,10163"; a="219539365"
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="219539365"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 02:28:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="452270768"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga006.jf.intel.com with ESMTP; 10 Nov 2021 02:28:51 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 0/4] ALSA: hda: New NHLT functions and cleanup
Date: Wed, 10 Nov 2021 11:31:13 +0100
Message-Id: <20211110103117.3142450-1-cezary.rojewski@intel.com>
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

Changes in v3:
- no code changes
- appended Mark's Acked-by tag for patch 4/4
- appended Pierre's Reviewed-by tag for all patches

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

