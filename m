Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA48546699
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 14:27:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E4E81B1E;
	Fri, 10 Jun 2022 14:26:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E4E81B1E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654864035;
	bh=6VvB/TlWpsJQa652pZrSZHJbablnDYdsutOy9NV5/cQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VuUBQYmc6gzu7YYw39jDvkdcI9ei+fmatgqtb6/z6Qba2uWVISvK6faKCINLs9VNO
	 QWJdC8B6jifBwNdm7sCmEkHnCagHMnjUXq5Ql0VpAnMKnWZ1EAvN0tY0U7iDx0mSAO
	 M7+TuuGxRgJpwa2XKB7ZrmLShXfmqWXztj171RJk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A575F804D2;
	Fri, 10 Jun 2022 14:26:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25316F800E5; Fri, 10 Jun 2022 14:26:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F4F0F800E5
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 14:26:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F4F0F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="OOagvMXY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654863976; x=1686399976;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6VvB/TlWpsJQa652pZrSZHJbablnDYdsutOy9NV5/cQ=;
 b=OOagvMXYHHp7k2NnhLldtkHoQRuYDgXC+N/L05buNG55pdIr9bZvpQuS
 j1o/e3kez8cvTCCb5VgpEIA///WWA7NjE+VKuy4asuLM10Bp5pwnFKEOZ
 QhbDMgsxpfQKh4jIPVaJPKzFktsyltFWa9rBOyFxZokHZ8Z5586GKCjmX
 ieRTMdJg3K7PLupiQbnKCXChtc52fxhDXlBGRkSeTOhfltedrO5hPt+fh
 4kOrKeHBhRVfV/HhZbi0kk3lGppCdkl3ETqn263R4yNyOaivK8qMIyAbk
 Q9hfYRLQonbeV8oAXZnGjYsOpQCtus6F1DYppFWEIL8V6atz2LqoE6Kx+ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="278414319"
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; d="scan'208";a="278414319"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 05:26:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; d="scan'208";a="684517824"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga002.fm.intel.com with ESMTP; 10 Jun 2022 05:26:08 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 01/17] ASoC: Intel: Rename haswell source file to hsw_rt5640
Date: Fri, 10 Jun 2022 14:36:11 +0200
Message-Id: <20220610123627.1339985-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610123627.1339985-1-cezary.rojewski@intel.com>
References: <20220610123627.1339985-1-cezary.rojewski@intel.com>
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

