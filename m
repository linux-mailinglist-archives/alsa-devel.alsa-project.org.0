Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E10642C2F8B
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Nov 2020 19:05:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70774174A;
	Tue, 24 Nov 2020 19:04:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70774174A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606241118;
	bh=xwM3Flh7bSo8l8sbdnQVzPStIQ9OOnvetxWcGC5+gsI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k7foKzOYMJHFp/wKFdlaiv899AI5wq/i9ftSyq697v0Y5KOc+yMMDqj54pRgbgpeM
	 w+ZY66pUq2kc+JDICQaouxp/Glt18tzxegPEnCjWGXgSrloR+Kkdvx4nq3pbwJ83M3
	 rRtu9OPs94eXqb8iIP71uGr4hYYQWoNHGDj1z79Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3622CF804B4;
	Tue, 24 Nov 2020 19:03:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5A70F80165; Tue, 24 Nov 2020 19:03:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47D05F80165
 for <alsa-devel@alsa-project.org>; Tue, 24 Nov 2020 19:02:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47D05F80165
IronPort-SDR: DKKiw5JkPp1fGHa3R3RPTN4mM50KZesttUHxjpb+lRsEWg7yJ0fO0Q9SV6m25ioAsDeJLS62lI
 jlhd/+8RI/4A==
X-IronPort-AV: E=McAfee;i="6000,8403,9815"; a="151830605"
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; d="scan'208";a="151830605"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 10:02:53 -0800
IronPort-SDR: 80iEofN5IGndJSSwRNUhMuUn/nD5Mb+PkjcUXTC8OxjnsxRfv/69lsVRdFTaie2rhOonCTstSX
 ESThvbyrF55g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; d="scan'208";a="478585024"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga004.jf.intel.com with ESMTP; 24 Nov 2020 10:02:50 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 2/4] ASoC: SOF: Improve code alignment in header.h
Date: Tue, 24 Nov 2020 20:00:15 +0200
Message-Id: <20201124180017.2232128-3-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201124180017.2232128-1-kai.vehmanen@linux.intel.com>
References: <20201124180017.2232128-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 Karol Trzcinski <karolx.trzcinski@linux.intel.com>, daniel.baluta@nxp.com
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

Each define value in series should be aligned and tabs should
be used instead of spaces to follow code-style.

Signed-off-by: Karol Trzcinski <karolx.trzcinski@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 include/sound/sof/header.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/sound/sof/header.h b/include/sound/sof/header.h
index 571e1dd54b89..ece6d48dd007 100644
--- a/include/sound/sof/header.h
+++ b/include/sound/sof/header.h
@@ -49,7 +49,7 @@
 #define SOF_IPC_FW_READY			SOF_GLB_TYPE(0x7U)
 #define SOF_IPC_GLB_DAI_MSG			SOF_GLB_TYPE(0x8U)
 #define SOF_IPC_GLB_TRACE_MSG			SOF_GLB_TYPE(0x9U)
-#define SOF_IPC_GLB_GDB_DEBUG                   SOF_GLB_TYPE(0xAU)
+#define SOF_IPC_GLB_GDB_DEBUG			SOF_GLB_TYPE(0xAU)
 #define SOF_IPC_GLB_TEST_MSG			SOF_GLB_TYPE(0xBU)
 #define SOF_IPC_GLB_PROBE			SOF_GLB_TYPE(0xCU)
 
@@ -109,7 +109,7 @@
 #define SOF_IPC_PROBE_DMA_ADD			SOF_CMD_TYPE(0x003)
 #define SOF_IPC_PROBE_DMA_INFO			SOF_CMD_TYPE(0x004)
 #define SOF_IPC_PROBE_DMA_REMOVE		SOF_CMD_TYPE(0x005)
-#define SOF_IPC_PROBE_POINT_ADD		SOF_CMD_TYPE(0x006)
+#define SOF_IPC_PROBE_POINT_ADD			SOF_CMD_TYPE(0x006)
 #define SOF_IPC_PROBE_POINT_INFO		SOF_CMD_TYPE(0x007)
 #define SOF_IPC_PROBE_POINT_REMOVE		SOF_CMD_TYPE(0x008)
 
@@ -119,7 +119,7 @@
 #define SOF_IPC_TRACE_DMA_PARAMS_EXT		SOF_CMD_TYPE(0x003)
 
 /* debug */
-#define SOF_IPC_TEST_IPC_FLOOD                  SOF_CMD_TYPE(0x001)
+#define SOF_IPC_TEST_IPC_FLOOD			SOF_CMD_TYPE(0x001)
 
 /* Get message component id */
 #define SOF_IPC_MESSAGE_ID(x)			((x) & 0xffff)
-- 
2.28.0

