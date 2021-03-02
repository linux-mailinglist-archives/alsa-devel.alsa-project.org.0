Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4468F32AC08
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 22:05:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9F8F191D;
	Tue,  2 Mar 2021 22:04:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9F8F191D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614719129;
	bh=zMf8aJRYucYdFGPXsz+xx4K2Czf/FwbVLZVTqa2mqGQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=igQw/2xY9svz5QABqqAkCRYhakPo2oMA4arTVvAQbv/QE7hoVFmOGXpSfbbNT7vlh
	 zENbJ25BYwvYY02T2u5KfuJZgiKbKGZkEBE0bE5gOXsetfgFTUjUSym4eXkH/UvEOB
	 waflCTwYakVUZB8v0RS+J0kVjGiNKJ+a971GXxTY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E45DEF804E4;
	Tue,  2 Mar 2021 22:00:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6C7EF80425; Tue,  2 Mar 2021 22:00:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71232F80271
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 22:00:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71232F80271
IronPort-SDR: W4rDPEioo2ZSMHw/egdKU91u0I9CRW56Nampa0nbzfWmTvDEQCkx5+OQIUmZM+jP7n6r14U1Ip
 lFkQs/i5Chkw==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="174623779"
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="174623779"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:00:33 -0800
IronPort-SDR: rpb2QOCPaWFVs1/ARuITElWlnSXN4113mtuLvJV+wNiRNWJ7xyNReKQE4iREh/ckkh52hRtK5b
 cmrXRAOWkARw==
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="373727812"
Received: from btucker-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.60.230])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:00:32 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 9/9] ASoC: qcom: q6dsp: fix kernel-doc warning
Date: Tue,  2 Mar 2021 14:59:26 -0600
Message-Id: <20210302205926.49063-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302205926.49063-1-pierre-louis.bossart@linux.intel.com>
References: <20210302205926.49063-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

make W=1 warning:

sound/soc/qcom/qdsp6/q6afe.c:1460: warning: expecting prototype for
q6afe_dam_port_prepare(). Prototype was for
q6afe_cdc_dma_port_prepare() instead

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/qcom/qdsp6/q6afe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index 6f700c311337..38f6042fe893 100644
--- a/sound/soc/qcom/qdsp6/q6afe.c
+++ b/sound/soc/qcom/qdsp6/q6afe.c
@@ -1448,7 +1448,7 @@ int q6afe_i2s_port_prepare(struct q6afe_port *port, struct q6afe_i2s_cfg *cfg)
 EXPORT_SYMBOL_GPL(q6afe_i2s_port_prepare);
 
 /**
- * q6afe_dam_port_prepare() - Prepare dma afe port.
+ * q6afe_cdc_dma_port_prepare() - Prepare dma afe port.
  *
  * @port: Instance of afe port
  * @cfg: DMA configuration for the afe port
-- 
2.25.1

