Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9830267E926
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 16:13:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 861A1E9C;
	Fri, 27 Jan 2023 16:12:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 861A1E9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674832402;
	bh=c8ILVtNNmJQWo7vrskMPEAqhtWXqqQZMWAdnFedFvsY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=k1PYjISJMbw5JP1F9Nda0+Dt8WNgTDwwv4blZf7VxlhADcd1BsIwAYJd1thkO4jOH
	 INjdct1on/wOZ9VOTraXBGKulf9UmAOamg6ZCsHUpI7Gy0VOJ8GypAscwQ0U0FYzRx
	 RAUUutj/T7hYGGCUyAr9J47pT8BbJMCUeKCpglBE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EA33F80552;
	Fri, 27 Jan 2023 16:10:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49D9AF80553; Fri, 27 Jan 2023 16:10:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D377EF80548
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 16:10:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D377EF80548
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cqardbZU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674832225; x=1706368225;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c8ILVtNNmJQWo7vrskMPEAqhtWXqqQZMWAdnFedFvsY=;
 b=cqardbZU12+H50iWABnptSPEbn2YrnFNWZ6aB0vlVSu2RHjwoIkHdv6N
 rJJHL51jPly2j+esBfoKEJEogd4hyLPWK4QYvdsW1WaZJCWfQFmxQqCsQ
 /lnuZ7PTdaVJPcpvxAaNLSyLX8OtsznXma6Ra5qDda03PalmiHGmrUaGJ
 f4bXFaer63Txqp77BOWJyO8eNP4RRKLr1OuuKFs3aYqzV7aFkdYCMQKCg
 70suyMcXrj8cwLwGJ1DkT42vAwqs2i78a/1yUFQGqRALYEHZCHIlZFBSP
 CK3tR6DDyB2jpgg4OYhc4V/YRvQDD84GVlNMdZQF/a9pNSihRVATcRNHA g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="324795825"
X-IronPort-AV: E=Sophos;i="5.97,251,1669104000"; d="scan'208";a="324795825"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 07:10:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="908709019"
X-IronPort-AV: E=Sophos;i="5.97,251,1669104000"; d="scan'208";a="908709019"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by fmsmga006.fm.intel.com with ESMTP; 27 Jan 2023 07:10:21 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 06/11] ASoC: topology: Remove unnecessary forward declarations
Date: Sat, 28 Jan 2023 00:11:06 +0100
Message-Id: <20230127231111.937721-7-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230127231111.937721-1-amadeuszx.slawinski@linux.intel.com>
References: <20230127231111.937721-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

There is no need to forward declare functions if their use is after
their definition.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-topology.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index a952f7eaa646..766de161aa4a 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -76,9 +76,6 @@ struct soc_tplg {
 	struct snd_soc_tplg_ops *ops;
 };
 
-static int soc_tplg_process_headers(struct soc_tplg *tplg);
-static int soc_tplg_complete(struct soc_tplg *tplg);
-
 /* check we dont overflow the data for this control chunk */
 static int soc_tplg_check_elem_count(struct soc_tplg *tplg, size_t elem_size,
 	unsigned int count, size_t bytes, const char *elem_type)
-- 
2.25.1

