Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FCD47804A
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Dec 2021 00:05:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0D331F36;
	Fri, 17 Dec 2021 00:04:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0D331F36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639695938;
	bh=gwXz0dma/s1TQamn1qs+92yYoKDPBxSOaVB8qcWH9ZQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=U2IWrS/243j5SthzuYqx6KmKLqV5rvBeSJcf0IFbSGKHPdxadGBs0enzwaKj4pE7F
	 BzYQg6zJ6oWmrhKbkV72oHlsxtgfFpD6W0dB1Gs0xggV+ZDXVkq1mPJVmYZRCjmzwv
	 0wV1euLslrxTJHXoHZLQnYHT9w6rLlH/eL6eyADM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A175F8015B;
	Fri, 17 Dec 2021 00:04:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA6EDF8014C; Fri, 17 Dec 2021 00:04:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49F80F800F4
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 00:04:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49F80F800F4
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="300400614"
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; d="scan'208";a="300400614"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 15:04:14 -0800
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; d="scan'208";a="585344786"
Received: from priyosmi-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.100.174])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 15:04:13 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: SOF: Kconfig: Make the SOF_DEVELOPER_SUPPORT depend on
 SND_SOC_SOF
Date: Thu, 16 Dec 2021 17:03:50 -0600
Message-Id: <20211216230350.343857-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Paul Olaru <paul.olaru@oss.nxp.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
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

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

SND_SOC_SOF_DEVELOPER_SUPPORT contains options affecting how the built
SOF driver stack will behave, enables debug options and other features.

These options have no meaning if the SND_SOC_SOF is not even enabled.

If we have SOF client options under developer_support and debug they can
be selected to be built even without the core, but they do need symbols
from the core (the sof-client API) which can result build failure.

In Kconfig we can have
SND_SOC_SOF_TOPLEVEL=y
SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST=y

for example, which will make the flood client to be built, but the SOF core
is not as SND_SOC_SOF is not selected.

Reviewed-by: Paul Olaru <paul.olaru@oss.nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
index ac34c330cf0c..1a7d6cefd3b7 100644
--- a/sound/soc/sof/Kconfig
+++ b/sound/soc/sof/Kconfig
@@ -63,7 +63,7 @@ config SND_SOC_SOF_DEBUG_PROBES
 
 config SND_SOC_SOF_DEVELOPER_SUPPORT
 	bool "SOF developer options support"
-	depends on EXPERT
+	depends on EXPERT && SND_SOC_SOF
 	help
 	  This option unlocks SOF developer options for debug/performance/
 	  code hardening.
-- 
2.25.1

