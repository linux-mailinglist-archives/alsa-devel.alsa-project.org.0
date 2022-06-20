Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D7D551249
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 10:15:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DAA318FA;
	Mon, 20 Jun 2022 10:14:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DAA318FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655712900;
	bh=o0Kok7wGPSNdLmm0aDT4JNZdUbDgMsPnAiN9aOQ2AiM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qIQuH+5zEx9oeTM3ua8tD8VG6Lcg9NgpmefftA2JxKqqHnmuv272KLm9iQaDMQsId
	 6hRCcJwsdb6CTMIXrWjwsA8/XMAN8qqLdjZK/Ok9p7xkpNq9vdnTQUZgecf8xZv0mR
	 6GGt+05rAt7ddSPIG3CjtYbY3osU3G0jvfEgMmew=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DC90F804E5;
	Mon, 20 Jun 2022 10:12:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91B9CF80557; Mon, 20 Jun 2022 10:12:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8D87F80542
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 10:12:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8D87F80542
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Llve7oz+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655712755; x=1687248755;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o0Kok7wGPSNdLmm0aDT4JNZdUbDgMsPnAiN9aOQ2AiM=;
 b=Llve7oz+dAMgXhqXSkyJH98MUZbOdSbG1IVM7M/4W9d5GXMY3jXFaYe6
 F1Y4Ff5gSgW1NfE7WTQEKvCqdyLI5ILxVaLJxnohFEg1737mIYXsRZuws
 LVp1D9UCm9g39CKg3sg8p1uI+yjvdwv0JYZqbJMCXqC3i9y00OO5eEpqa
 lVALp+D0PUzDQylM2HSj3IDL+tevfTwjFFCX4WvTudD+m76DKJokg8rsq
 ma4WiAqHdxYs4IYxWDwRyIB1Ltr5YzCCpaceIqVDgnoM7bVgkLghpR8rH
 Mki5evzQxK4FuRXUPrd3ZLmJ3+84MweV68xWR9Xn7yz5JXFeIgswzfGZe A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="305270901"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="305270901"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 01:12:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="591067404"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga007.fm.intel.com with ESMTP; 20 Jun 2022 01:12:32 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v3 08/17] ASoC: Intel: Rename broadwell source file to
 bdw_rt286
Date: Mon, 20 Jun 2022 10:22:17 +0200
Message-Id: <20220620082226.2489357-9-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620082226.2489357-1-cezary.rojewski@intel.com>
References: <20220620082226.2489357-1-cezary.rojewski@intel.com>
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
 sound/soc/intel/boards/Makefile                     | 2 +-
 sound/soc/intel/boards/{broadwell.c => bdw_rt286.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename sound/soc/intel/boards/{broadwell.c => bdw_rt286.c} (100%)

diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index e479546a3d4b..eea1e26acfda 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -2,7 +2,7 @@
 snd-soc-sst-haswell-objs := hsw_rt5640.o
 snd-soc-sst-bdw-rt5650-mach-objs := bdw-rt5650.o
 snd-soc-sst-bdw-rt5677-mach-objs := bdw-rt5677.o
-snd-soc-sst-broadwell-objs := broadwell.o
+snd-soc-sst-broadwell-objs := bdw_rt286.o
 snd-soc-sst-bxt-da7219_max98357a-objs := bxt_da7219_max98357a.o
 snd-soc-sst-bxt-rt298-objs := bxt_rt298.o
 snd-soc-sst-sof-pcm512x-objs := sof_pcm512x.o
diff --git a/sound/soc/intel/boards/broadwell.c b/sound/soc/intel/boards/bdw_rt286.c
similarity index 100%
rename from sound/soc/intel/boards/broadwell.c
rename to sound/soc/intel/boards/bdw_rt286.c
-- 
2.25.1

