Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C5067B1DF
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Jan 2023 12:47:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD64683A;
	Wed, 25 Jan 2023 12:47:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD64683A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674647276;
	bh=7wyeC/VdUZSwK1TsdTCPu82keY60B63Zr0PsdtBFRYM=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=V4RmdaNzqM0JeR6GCh+g/OUjGArBRnjd/Zt/hHu7tGFQsHdSq5goyC84Sfk3yFy9l
	 g6wmnqP8px7A92HAH5b1cz6Hi1/0q41jgzUNCQggQRYA6biuXmJO3qTvMs+rmw6gUr
	 HBbTwW6WXl9JdaaIEQqaS+8w1tIdNrdOb/0ZPSfw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78B4AF80552;
	Wed, 25 Jan 2023 12:46:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91E1BF80539; Wed, 25 Jan 2023 12:46:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24173F802E8
 for <alsa-devel@alsa-project.org>; Wed, 25 Jan 2023 12:46:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24173F802E8
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NIqfz7UJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674647168; x=1706183168;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7wyeC/VdUZSwK1TsdTCPu82keY60B63Zr0PsdtBFRYM=;
 b=NIqfz7UJm0llKaoYGE+vGF20KIzTVoiQl3DlYlHAOCD3qDYCL+x/Mhty
 VLBiKwK5isHnqbxXoo+f0XvC/Uyy1H8ktWS2librsjyYh5w7tbUxfpDkw
 hRlETYGzLih9ALtv0Pi6STj1sRrKbLOgW4L5z7jY/eow57yISwZXC5ls0
 JktRAzV+BevM9DsNYwGmViVrIO1fdVNvmKZ9yRlwRhdgALR2CEahRqAbP
 xFe7gjN2XL8XsNVwlCQXMYs0kumLXFypKPYgB7/S5a0slrD1GKpOeaoYo
 mzjEvC4HCB5nxDFs4oTVJz/f91qbw/wvG1mowSr6rUXwigkQqDtB69/BF g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="324234173"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; d="scan'208";a="324234173"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 03:46:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="612393943"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; d="scan'208";a="612393943"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by orsmga003.jf.intel.com with ESMTP; 25 Jan 2023 03:46:00 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 02/11] ASoC: topology: Remove unused SOC_TPLG_PASS_PINS
 constant
Date: Wed, 25 Jan 2023 20:46:40 +0100
Message-Id: <20230125194649.3485731-3-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230125194649.3485731-1-amadeuszx.slawinski@linux.intel.com>
References: <20230125194649.3485731-1-amadeuszx.slawinski@linux.intel.com>
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
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The constant is unused, so it can be safely removed.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-topology.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index b9addbab2b3d..e9138ec4df8f 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -44,9 +44,8 @@
 #define SOC_TPLG_PASS_WIDGET		3
 #define SOC_TPLG_PASS_PCM_DAI		4
 #define SOC_TPLG_PASS_GRAPH		5
-#define SOC_TPLG_PASS_PINS		6
-#define SOC_TPLG_PASS_BE_DAI		7
-#define SOC_TPLG_PASS_LINK		8
+#define SOC_TPLG_PASS_BE_DAI		6
+#define SOC_TPLG_PASS_LINK		7
 
 #define SOC_TPLG_PASS_START	SOC_TPLG_PASS_MANIFEST
 #define SOC_TPLG_PASS_END	SOC_TPLG_PASS_LINK
-- 
2.25.1

