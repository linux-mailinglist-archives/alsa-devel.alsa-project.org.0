Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1447C1B76CB
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Apr 2020 15:20:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D130167A;
	Fri, 24 Apr 2020 15:19:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D130167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587734436;
	bh=FZfi9gaVWYgkdtReBSb6U4Js7jTOOAY4//rsCsHkyl4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Qx7HLG3/R1nNaZHAjW3l3Btcddg/Hyxbvss34Dhn62YDycrc9PwXF4X2QhHUsGS/g
	 OszKWZHECdJL8QmKc/P+7XpBanGvL2AX3O4jo4sx5z5Di3hnAsqzktckapyGvI44t0
	 cSlj/6LWraSkWeHsmA4YBNNAewkrwLNqX/jeaCMM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B344F800BE;
	Fri, 24 Apr 2020 15:18:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1806DF80142; Fri, 24 Apr 2020 15:18:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91E48F80116
 for <alsa-devel@alsa-project.org>; Fri, 24 Apr 2020 15:18:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91E48F80116
IronPort-SDR: pmt9LnzG3yB9wWwRbbwfzVpSiC2VEX/KxMN8OwUEiBQDgmYT8FGyV+/QJQR8wzRWiNb7CsQtVo
 UwTZ0MVQkCqw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2020 06:18:41 -0700
IronPort-SDR: X1CTEPEF5SB94aLlcjmZkYIELo7CqN/mUIY/i1BlI0WIvJgLGayQxHcgV/C/LIL9w8/WIM8N2j
 PsJXBxtOEhig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,311,1583222400"; d="scan'208";a="246589130"
Received: from mgorski-all-series.igk.intel.com ([10.237.149.201])
 by fmsmga007.fm.intel.com with ESMTP; 24 Apr 2020 06:18:40 -0700
From: Mateusz Gorski <mateusz.gorski@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v4 0/3] Add support for different DMIC configurations
Date: Fri, 24 Apr 2020 15:19:59 +0200
Message-Id: <20200424132002.3850-1-mateusz.gorski@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: Mateusz Gorski <mateusz.gorski@linux.intel.com>, cezary.rojewski@intel.com,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
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

Set of patches to enable DMIC capture on different hardware
configurations.
Information about supported DMIC configuration is read from NHLT and
correct pipeline configuration is selected automatically.
Also, adding additional option for topology binary name which is
based on used machine driver.

Changes in v2:
- removed patch 1/4 swapping machine device and platform device
  registration order
- alt_tplg_name creation now uses different field to read machine driver
  name
- including of <sound/soc-acpi.h> moved to different patch

Changes in v3:
- cosmetic changes in skl-topology.c file

Changes in v4:
- refactored patch 2/3 to use one common helper function to deal with both
  set and get pipe configuration operations, as suggested by Pierre
- adjusted patch 3/3 to also use this helper function for DMIC pipes
- added comment in patch 3/3 explaining the change of access rights for
  DMIC enums

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

Mateusz Gorski (3):
  ASoC: Intel: Skylake: Add alternative topology binary name
  ASoC: Intel: Multiple I/O PCM format support for pipe
  ASoC: Intel: Skylake: Automatic DMIC format configuration according to
    information from NHLT

 include/uapi/sound/skl-tplg-interface.h |   2 +
 sound/soc/intel/skylake/skl-topology.c  | 177 +++++++++++++++++++++++-
 sound/soc/intel/skylake/skl-topology.h  |   1 +
 3 files changed, 175 insertions(+), 5 deletions(-)

-- 
2.17.1

