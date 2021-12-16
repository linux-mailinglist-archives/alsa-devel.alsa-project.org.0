Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 009F0478081
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Dec 2021 00:26:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42FC4839;
	Fri, 17 Dec 2021 00:25:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42FC4839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639697193;
	bh=XM3s03kg3MX5qnHroGCondBz3x4ysUdtYRdcYMdVm3A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XUhfMCC0QdT11beEouZlNG0O8xYWaFZ6yPfa68GbopSvDCEeNYGA6CoMvI3RyQ1uP
	 pM+xNyd0pKCuieZfgZaxNR5OgQDrxqoEptGaBQJdZITg2PGjhrSBXWN42rKnxwhfgk
	 6vQshdiWy1Q2nhZYv7RsO1vUbGbctXVsgUX54B1g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DAFAF804CA;
	Fri, 17 Dec 2021 00:24:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6B2DF8016E; Fri, 17 Dec 2021 00:24:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6216DF8016E
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 00:24:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6216DF8016E
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="239439665"
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; d="scan'208";a="239439665"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 15:24:44 -0800
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; d="scan'208";a="605702545"
Received: from priyosmi-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.100.174])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 15:24:44 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/3] ipc: debug: Add shared memory heap to memory scan
Date: Thu, 16 Dec 2021 17:24:22 -0600
Message-Id: <20211216232422.345164-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211216232422.345164-1-pierre-louis.bossart@linux.intel.com>
References: <20211216232422.345164-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Liam Girdwood <liam.r.girdwood@intel.com>,
 Karol Trzcinski <karolx.trzcinski@linux.intel.com>
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

From: Karol Trzcinski <karolx.trzcinski@linux.intel.com>

Newly added shared heap zones should be taken into account during
memory usage scanning.

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Signed-off-by: Karol Trzcinski <karolx.trzcinski@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/sof/debug.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/sound/sof/debug.h b/include/sound/sof/debug.h
index 3ecb5793789d..38693e3fb514 100644
--- a/include/sound/sof/debug.h
+++ b/include/sound/sof/debug.h
@@ -19,6 +19,8 @@ enum sof_ipc_dbg_mem_zone {
 	SOF_IPC_MEM_ZONE_SYS_RUNTIME	= 1,	/**< System-runtime zone */
 	SOF_IPC_MEM_ZONE_RUNTIME	= 2,	/**< Runtime zone */
 	SOF_IPC_MEM_ZONE_BUFFER		= 3,	/**< Buffer zone */
+	SOF_IPC_MEM_ZONE_RUNTIME_SHARED	= 4,	/**< System runtime zone */
+	SOF_IPC_MEM_ZONE_SYS_SHARED	= 5,	/**< System shared zone */
 };
 
 /** ABI3.18 */
-- 
2.25.1

