Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B4C45EF61
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Nov 2021 14:46:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4EC9192E;
	Fri, 26 Nov 2021 14:45:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4EC9192E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637934398;
	bh=rLbf6WnJK1EE/Xx+mmqf8PdAXSZs6DP6rUiMD5QcB6U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FLy0l8H3yfjsEr6XfG/YX3i97xKpsN6n0L3ivgEYD7A+08d9jystEMwqbOgj7Vog7
	 d8KLyFAqBgaz45YqQng3jyjzKISwl3eDXMKOftCPpBp0e+BJRplF3IenbFuZp0xvai
	 HDSM1kYYxz9EbRa9L50ksPta87h0eGkz3lZFMgfw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13E3AF80302;
	Fri, 26 Nov 2021 14:45:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4985BF80166; Fri, 26 Nov 2021 14:45:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 393EBF80166
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 14:45:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 393EBF80166
X-IronPort-AV: E=McAfee;i="6200,9189,10179"; a="215689416"
X-IronPort-AV: E=Sophos;i="5.87,266,1631602800"; d="scan'208";a="215689416"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2021 05:45:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,266,1631602800"; d="scan'208";a="675566575"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga005.jf.intel.com with ESMTP; 26 Nov 2021 05:45:09 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v4 0/3] ALSA: hda: New NHLT functions and cleanup
Date: Fri, 26 Nov 2021 14:47:36 +0100
Message-Id: <20211126134739.1041596-1-cezary.rojewski@intel.com>
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

Outside of that, "is DMIC in NHLT?" check is being re-visited. No need
to check for channel count or anything DMIC-configuration related, just
straight up verify link_type presence.

Changes in v4:
- patch renaming nhlt_acpi_table struct to acpi_nhlt_table has been
  dropped due to naming conflicts with other parts of the kernel
- revoked previously appended tags from Mark and Pierre as every patch
  required an update due to above

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

Amadeusz Sławiński (3):
  ALSA: hda: Fill gaps in NHLT endpoint-interface
  ALSA: hda: Simplify DMIC-in-NHLT check
  ASoC: Intel: Skylake: Use NHLT API to search for blob

 include/sound/intel-nhlt.h             |  37 +++++++--
 sound/hda/intel-dsp-config.c           |   2 +-
 sound/hda/intel-nhlt.c                 | 102 +++++++++++++++++++++++++
 sound/soc/intel/skylake/skl-nhlt.c     | 102 -------------------------
 sound/soc/intel/skylake/skl-pcm.c      |   3 +
 sound/soc/intel/skylake/skl-topology.c |  29 ++++---
 sound/soc/intel/skylake/skl-topology.h |   1 +
 sound/soc/intel/skylake/skl.h          |   4 -
 8 files changed, 153 insertions(+), 127 deletions(-)

-- 
2.25.1

