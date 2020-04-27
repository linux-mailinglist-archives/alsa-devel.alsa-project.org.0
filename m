Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DF41BA4C4
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Apr 2020 15:31:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2582316A8;
	Mon, 27 Apr 2020 15:30:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2582316A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587994269;
	bh=PMU3YBXyht3LAgGm5uDFSU6V1AMNjwJT/UPxFla0b0A=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=S7VW75+zYAhG/dfQi6owF7oqIyhmtNK7ygWZnbDcl+0agXz/sPXXbevy8gEoaudb1
	 GCXhtwZal/EhWL17ry/2fvD3ic40fZpsUC+SSQ21vYYcOD6RNzmkogtnTtCUJSbrpu
	 uVTDx91hbmMTwM0JcjPO/77gztej2d6FJXg3Drm8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35FBBF80290;
	Mon, 27 Apr 2020 15:27:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20C6DF8010A; Mon, 27 Apr 2020 15:27:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0365F8010A
 for <alsa-devel@alsa-project.org>; Mon, 27 Apr 2020 15:27:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0365F8010A
IronPort-SDR: kgkNDhmYIqCEkWqoEnkSC0yICH4rvJkYCf2JEvfDx0hbVQ4e6gzeS2kMb2S4+vFZ4skAE09KUE
 zeyox25T8qug==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2020 06:27:33 -0700
IronPort-SDR: W9O6UrsqzuUQJRNlfTjwUI5dEJvtAFgzAS0TMwVF5vJVlPaBv5e1tzH7OC9QfYu0Ts5/sCcbKT
 GEvC9Na+d5Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,324,1583222400"; d="scan'208";a="458856198"
Received: from mgorski-all-series.igk.intel.com ([10.237.149.201])
 by fmsmga006.fm.intel.com with ESMTP; 27 Apr 2020 06:27:32 -0700
From: Mateusz Gorski <mateusz.gorski@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v6 0/3] Add support for different DMIC configurations
Date: Mon, 27 Apr 2020 15:27:24 +0200
Message-Id: <20200427132727.24942-1-mateusz.gorski@linux.intel.com>
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

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

Mateusz Gorski (3):
  ASoC: Intel: Skylake: Add alternative topology binary name
  ASoC: Intel: Multiple I/O PCM format support for pipe
  ASoC: Intel: Skylake: Automatic DMIC format configuration according to
    information from NHLT

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

Changes in v5:
- fixed alignment issue in patch 2/3
- addressed "checkpatch.pl --strict" warnings in patches

Changes in v6:
- fixed commit message in patch 2/3

 include/uapi/sound/skl-tplg-interface.h |   2 +
 sound/soc/intel/skylake/skl-topology.c  | 178 +++++++++++++++++++++++-
 sound/soc/intel/skylake/skl-topology.h  |   1 +
 3 files changed, 176 insertions(+), 5 deletions(-)

-- 
2.17.1

