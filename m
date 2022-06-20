Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F8A551535
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 12:05:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7209418C5;
	Mon, 20 Jun 2022 12:04:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7209418C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655719527;
	bh=6VvB/TlWpsJQa652pZrSZHJbablnDYdsutOy9NV5/cQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YOYPGueU3XRNitoU6B3TvMbS7KQvP5If+oRvVcxdxjTA0vz9ed0lZpuL1hvg3xbzm
	 61oPeiJ1l91oqHWXTGPiB8zt0qO+7Eph4x+fqNPhAMAUDIhfRvAj3JKxLhn8Sj0urm
	 Qwixtq3XUEcDYBP2kVeS2eXYCUONSdTkkt3jzqxY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86757F804E5;
	Mon, 20 Jun 2022 12:03:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A17B6F804D8; Mon, 20 Jun 2022 12:03:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B277EF804CF
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 12:03:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B277EF804CF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="lqM01RU0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655719433; x=1687255433;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6VvB/TlWpsJQa652pZrSZHJbablnDYdsutOy9NV5/cQ=;
 b=lqM01RU0Z/kjyZqjY0HN5Y4QM1bvWuqUDY3eQ4OWLk0ogOvBauCTJX0f
 9lpAduyyscBSLVWvAUEnbuXcAD0YxuLozbshPYLy0z1Th+8v3KT/PQnr1
 Z8bO/9y/owRAV4bb/SieIj21h0cU20J9lbUbTJX9uw/e+JBI1DaBUItwa
 Iv+RBKFyc8P/Z/HFvVqMjO9tum2V96nKv5mwX2pOIJ+3inHhN896UorvO
 Q7nBcyN7DNtQZNJt6rVxoxtM1lG4L7dpnO90etFRiAdyc5mdQmWaQyBkY
 1jOk/eGhGoNPj5o1Lke80qObET+Qibky5eoWq3So096HwkFC/Hbjn721N A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="366180643"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="366180643"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 03:03:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="643046252"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga008.fm.intel.com with ESMTP; 20 Jun 2022 03:03:47 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v4 01/17] ASoC: Intel: Rename haswell source file to hsw_rt5640
Date: Mon, 20 Jun 2022 12:13:46 +0200
Message-Id: <20220620101402.2684366-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620101402.2684366-1-cezary.rojewski@intel.com>
References: <20220620101402.2684366-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

Rename source file to drop any ambiguity.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/boards/Makefile                    | 2 +-
 sound/soc/intel/boards/{haswell.c => hsw_rt5640.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename sound/soc/intel/boards/{haswell.c => hsw_rt5640.c} (100%)

diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index 40c0c3d1c500..e479546a3d4b 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-snd-soc-sst-haswell-objs := haswell.o
+snd-soc-sst-haswell-objs := hsw_rt5640.o
 snd-soc-sst-bdw-rt5650-mach-objs := bdw-rt5650.o
 snd-soc-sst-bdw-rt5677-mach-objs := bdw-rt5677.o
 snd-soc-sst-broadwell-objs := broadwell.o
diff --git a/sound/soc/intel/boards/haswell.c b/sound/soc/intel/boards/hsw_rt5640.c
similarity index 100%
rename from sound/soc/intel/boards/haswell.c
rename to sound/soc/intel/boards/hsw_rt5640.c
-- 
2.25.1

