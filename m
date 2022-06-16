Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE2254EAE5
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 22:19:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 190601B00;
	Thu, 16 Jun 2022 22:18:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 190601B00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655410789;
	bh=0c2/BPl7+D4O10xbbdWPakUbjHmez08T6kUVQmAHP8A=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hAvR05xPe7mNJFLHWUZ6TGpU63eHnQjOxvwhxXGTvGBGKlzRTVJSc7yuiRjvulLlY
	 asM7R7HWAAGXDj+tW0xxM2tspyKK9tJUv14OTCDTM5vYoqTsPLhFsm1ly5yNItceQ1
	 w+E8bi77Z5LepZJ5lCyZxId75Tuvn8RMSZ9Xq7TQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2161F8047C;
	Thu, 16 Jun 2022 22:18:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF7BEF800D3; Thu, 16 Jun 2022 22:18:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 522ADF800F0
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 22:18:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 522ADF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="aJO8I8rv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655410724; x=1686946724;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0c2/BPl7+D4O10xbbdWPakUbjHmez08T6kUVQmAHP8A=;
 b=aJO8I8rvTah77kOlGMje/mKVcwgYv+TFAff+2QIgBRb2lpadvSMSZF7f
 hCFwi5EEIAOAvnsTsV/8vo+5n3M0MOliWoglOk8oZH7aGejSDev1yz64o
 zNbi7VehVvJeg0ZlP2BnzBkD5M5ccQ8Q8vbVD3owiEPfZCWFIxIeYHlif
 CEb7PZ6EPZftdmFznFjU7YCNlTE2FRwGUU0wHN2cP8xn8Id5vA/uA7xTP
 eTTj+qlxhh/4fCseFN0rgRD+QesSRB0EegU3CltFOqc0/knCsBbMZeegL
 dhEglI0OLja912C8jnUrA1fy+khciF1KKxVejS2EI194jdZcXeF+yX8E2 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="259803604"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="259803604"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 13:18:38 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="583771732"
Received: from buckkenx-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.52.70])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 13:18:37 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/3] ASoC: SOF: Intel: fix resume from hibernate
Date: Thu, 16 Jun 2022 15:18:15 -0500
Message-Id: <20220616201818.130802-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The enablement of IMR-based DSP boot helped reduce resume latency, but
unfortunately the context is not saved in S4 and S5 which leads to
multiple reports of boot failures.

This patchset forces a full firmware reload/reboot when resuming from
S4/S5 and restores functionality.

Pierre-Louis Bossart (3):
  ASoC: SOF: pm: add explicit behavior for ACPI S1 and S2
  ASoC: SOF: pm: add definitions for S4 and S5 states
  ASoC: SOF: Intel: disable IMR boot when resuming from ACPI S4 and S5
    states

 sound/soc/sof/intel/hda-loader.c |  3 ++-
 sound/soc/sof/pm.c               | 21 ++++++++++++++++++++-
 sound/soc/sof/sof-priv.h         |  2 ++
 3 files changed, 24 insertions(+), 2 deletions(-)

-- 
2.34.1

