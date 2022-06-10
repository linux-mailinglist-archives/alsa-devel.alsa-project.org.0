Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 591245466A4
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 14:29:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3BB31EEA;
	Fri, 10 Jun 2022 14:28:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3BB31EEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654864168;
	bh=o0Kok7wGPSNdLmm0aDT4JNZdUbDgMsPnAiN9aOQ2AiM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LJ23okg9TTTAfgkbStozA92YA2lR8ojITLG+qBotonsjU6elpBI/UIsTMhKjzqC1q
	 6vSNDkAjUR56Zo3XqUzoFSZEYHqrdPOgeal6Ig0uA0Uu1kevurB/rieLyC4iFNXS8o
	 Epvf9OSPFsPwtEII6MWh06lsDv35COcUM5mEq5mU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23C95F8055A;
	Fri, 10 Jun 2022 14:26:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DA34F80543; Fri, 10 Jun 2022 14:26:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04D08F800C7
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 14:26:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04D08F800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="GNL7oQFZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654863986; x=1686399986;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o0Kok7wGPSNdLmm0aDT4JNZdUbDgMsPnAiN9aOQ2AiM=;
 b=GNL7oQFZc8hvXRAvTtvQH+ut0uw31pyMQpMIBEvXddHhuTsfiXIhaLGN
 SpndUA8IoURRL/rFa9lGSPQ47KdLcbpBFFumflukWljLW3xGFUd3pZSG3
 tyvUpPgPq8v6zjwGcBmFKVnoJuaoxozpeYgOkNdSbaesy4ILaSyAs0wnN
 RtdvjC1Oz0a6ZlLv2YsHEC5gNLqHQaxpajy8TUQcXdRgZ4olJF0osWKEG
 G7ZA7sAM+xx9+WLiAq1rijjGFtxlgn92TEUgK/OPbWtAJ4l2nZecOipP+
 7WXyYmdIzMcKCHZqsxxDk5+IG+5HNV4gqOOjhhkMkRTv3SgnzBYgpt9f/ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="278414423"
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; d="scan'208";a="278414423"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 05:26:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; d="scan'208";a="684517896"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga002.fm.intel.com with ESMTP; 10 Jun 2022 05:26:22 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 08/17] ASoC: Intel: Rename broadwell source file to bdw_rt286
Date: Fri, 10 Jun 2022 14:36:18 +0200
Message-Id: <20220610123627.1339985-9-cezary.rojewski@intel.com>
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

