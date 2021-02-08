Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEE83143F5
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Feb 2021 00:38:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D56A816B4;
	Tue,  9 Feb 2021 00:37:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D56A816B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612827486;
	bh=d8KaIN8Qj4Q1MAT4zPdG0Zjw88RjmF+aPz0m8+X2mCs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qTp/9QZzwdZWUWK/3a3PcpeOF3XhH+V6EbeX8TtLhG3YuZB9GBBU6/YFf/08wLzH2
	 Kzfq7wvHsi6khWfdJljIK2kQhnIZmm5QFqL8PfCHw2lkT4cPSB3Rqn6wLNOdUgJR7J
	 I+igLHiKEaAxiCRG8d7+shBuOcmUO3YOD2E2xIvw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A948EF8042F;
	Tue,  9 Feb 2021 00:34:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33352F8032C; Tue,  9 Feb 2021 00:34:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2AC57F80169
 for <alsa-devel@alsa-project.org>; Tue,  9 Feb 2021 00:33:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AC57F80169
IronPort-SDR: 219w1jabW/U15ESvYUvnhPNXUML8JUZUf9RoWm1k2DpvPUdJGUztSHGoIsGIJUXZ67SjWzwt06
 kMxqENTKjn5Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="168923504"
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; d="scan'208";a="168923504"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 15:33:54 -0800
IronPort-SDR: /tYisP39gIqWv7onKPVSTOMQxNSm7uUEK2XPd//Z6tge2gwce0TkLb4+cNgHcsjP95Ql6lw6I+
 Rm7HJJrVVvSQ==
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; d="scan'208";a="374741338"
Received: from pmane-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.145.183])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 15:33:53 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 05/11] ASoC: Intel: sof_sdw: detect DMIC number based on
 mach params
Date: Mon,  8 Feb 2021 17:33:30 -0600
Message-Id: <20210208233336.59449-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208233336.59449-1-pierre-louis.bossart@linux.intel.com>
References: <20210208233336.59449-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bard Liao <bard.liao@intel.com>, Rander Wang <rander.wang@intel.com>
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

From: Rander Wang <rander.wang@intel.com>

Current driver create DMIC dai based on quirk for each platforms,
so we need to add quirk for new platforms. Now driver reports DMIC
number to machine driver and machine driver can create DMIC dai based
on this information. The old check is reserved for some platforms
may be failed to set the DMIC number in BIOS.

Reviewed-by: Bard Liao <bard.liao@intel.com>
Signed-off-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index d1251a6ac3af..06f07dd45fb4 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -955,7 +955,7 @@ static int sof_card_dai_links_create(struct device *dev,
 		ctx->idisp_codec = true;
 
 	/* enable dmic01 & dmic16k */
-	dmic_num = (sof_sdw_quirk & SOF_SDW_PCH_DMIC) ? 2 : 0;
+	dmic_num = (sof_sdw_quirk & SOF_SDW_PCH_DMIC || mach_params->dmic_num) ? 2 : 0;
 	comp_num += dmic_num;
 
 	dev_dbg(dev, "sdw %d, ssp %d, dmic %d, hdmi %d", sdw_be_num, ssp_num,
-- 
2.25.1

