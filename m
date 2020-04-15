Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D41691AB28D
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 22:35:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79D351657;
	Wed, 15 Apr 2020 22:34:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79D351657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586982909;
	bh=U6THAMhw0CDfCF5W/e1Y91sC+QkKGGuiYHWs1FIfTUs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cK/YQojEdryLBT464AVfThHi75tCUC+QZFiJpLN5bEMPeeHhfLnFZlT8naGEM/JPD
	 zJydgzizW2oR2o0MyonUNkPNAnsvF22lCLAxXx0RRC1j0wYf8wb6LU0sup724XLcNu
	 FkkOeHAwWOiUV4RFO1zn2lqKVhB9JCZv3vp7+xfc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45290F802E1;
	Wed, 15 Apr 2020 22:29:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F15ABF802A0; Wed, 15 Apr 2020 22:29:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A425F8027D
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 22:29:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A425F8027D
IronPort-SDR: WOygsJKFt2CpKO2dinSiowqPOGXVnl8wF7eDoZWVcGOlBDudG6G6A6KqHk5Yfkd7C0FyB4pNP4
 i8uXcaMIASCg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 13:29:01 -0700
IronPort-SDR: UQbY0ruZZhmsAQCPWxq3k9GL4AjjyF5+hNdAa36POLpPPextNoCqTaYN3cwvABvBMSE9mAfqiX
 6+lVCaQdJ0TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,388,1580803200"; d="scan'208";a="288656283"
Received: from jplam-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.82.197])
 by fmsmga002.fm.intel.com with ESMTP; 15 Apr 2020 13:29:00 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 08/24] ASoC: SOF: topology: Add support for DC Blocker
Date: Wed, 15 Apr 2020 15:28:00 -0500
Message-Id: <20200415202816.934-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200415202816.934-1-pierre-louis.bossart@linux.intel.com>
References: <20200415202816.934-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Seppo Ingalsuo <seppo.ingalsuo@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Sebastiano Carlucci <scarlucci@google.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Curtis Malainey <curtis@malainey.com>, broonie@kernel.org
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

From: Sebastiano Carlucci <scarlucci@google.com>

This commit adds the enumerations to support the dc blocker component
from SOF.

Reviewed-by: Curtis Malainey <curtis@malainey.com>
Reviewed-by: Seppo Ingalsuo <seppo.ingalsuo@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Sebastiano Carlucci <scarlucci@google.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/sof/topology.h | 2 ++
 sound/soc/sof/topology.c     | 1 +
 2 files changed, 3 insertions(+)

diff --git a/include/sound/sof/topology.h b/include/sound/sof/topology.h
index 402e0250c508..8f8d1cf649f2 100644
--- a/include/sound/sof/topology.h
+++ b/include/sound/sof/topology.h
@@ -37,6 +37,7 @@ enum sof_comp_type {
 	SOF_COMP_SELECTOR,		/**< channel selector component */
 	SOF_COMP_DEMUX,
 	SOF_COMP_ASRC,		/**< Asynchronous sample rate converter */
+	SOF_COMP_DCBLOCK,
 	/* keep FILEREAD/FILEWRITE as the last ones */
 	SOF_COMP_FILEREAD = 10000,	/**< host test based file IO */
 	SOF_COMP_FILEWRITE = 10001,	/**< host test based file IO */
@@ -206,6 +207,7 @@ enum sof_ipc_process_type {
 	SOF_PROCESS_CHAN_SELECTOR,	/**< Channel Selector */
 	SOF_PROCESS_MUX,
 	SOF_PROCESS_DEMUX,
+	SOF_PROCESS_DCBLOCK,
 };
 
 /* generic "effect", "codec" or proprietary processing component */
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 3386886fd743..e988e6b1a594 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -430,6 +430,7 @@ static const struct sof_process_types sof_process[] = {
 	{"CHAN_SELECTOR", SOF_PROCESS_CHAN_SELECTOR, SOF_COMP_SELECTOR},
 	{"MUX", SOF_PROCESS_MUX, SOF_COMP_MUX},
 	{"DEMUX", SOF_PROCESS_DEMUX, SOF_COMP_DEMUX},
+	{"DCBLOCK", SOF_PROCESS_DCBLOCK, SOF_COMP_DCBLOCK},
 };
 
 static enum sof_ipc_process_type find_process(const char *name)
-- 
2.20.1

