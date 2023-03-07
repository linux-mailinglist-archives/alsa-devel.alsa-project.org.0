Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A37D06ADA8B
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 10:41:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 109641406;
	Tue,  7 Mar 2023 10:40:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 109641406
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678182088;
	bh=ErWg1BOuVSvW/oBQ5U44NxW/wNGP6/5WUt9x3Z46EL8=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SnpaAkcJoByjGCg1VdKNeFAhJRBGw5naG027P/x8RvXFZnM9G26k3gE2gsX+97StY
	 KRCwFC1zVSp17RoHti8LtEeb6Yx/r1SZtFGjHtfYVgxxgKGPdwFiMUr0+FZ4Ggai0b
	 CeYwaCf+Vs/XeL704Xuxb2Wupy7XVoitOSxnY99s=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A4D3F80529;
	Tue,  7 Mar 2023 10:39:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83DFDF8042F; Tue,  7 Mar 2023 10:39:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D48A4F800C9
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 10:39:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D48A4F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ji0IldVn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678181944; x=1709717944;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ErWg1BOuVSvW/oBQ5U44NxW/wNGP6/5WUt9x3Z46EL8=;
  b=ji0IldVnIgbhglXsiX/5OgzeF0MnZNOu19UTYKk/1UB3nR4PvBo75/iE
   WE9e3nvtZmea38I+8Gna9bMfYO7SGcvfx3j6NnBcs3bBzJdad6iUU0UJl
   mkrgz5hZw4ADfo5sIVGsw1PytGk51IMW3j+pVdF9rL1zGRz16sG4Sz/iJ
   zqYBC4JMgt+x3LwKYPC4V6GUWkuL4swzMdKkyHnec3BOBNEOpmHEXiKDq
   L+OrMAUPMAleFuSlWCPqmZEJumBRCqMLZseS24ccb3pbeGtFrUga5tIbo
   /u+cogbcRzNRQ+ZJt+VCgjzvXH7GRWbKB5ps5nbi+4K9YuUr/lOytT5p+
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="338132604"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400";
   d="scan'208";a="338132604"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 01:38:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="676504886"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400";
   d="scan'208";a="676504886"
Received: from rganesh-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.47.75])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 01:38:55 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 1/4] ASoC: SOF: Intel: MTL: Fix the device description
Date: Tue,  7 Mar 2023 11:39:11 +0200
Message-Id: <20230307093914.25409-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307093914.25409-1-peter.ujfalusi@linux.intel.com>
References: <20230307093914.25409-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YIMWZ43QYSLKKSH7POB6DBX7VC2AYD3Q
X-Message-ID-Hash: YIMWZ43QYSLKKSH7POB6DBX7VC2AYD3Q
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YIMWZ43QYSLKKSH7POB6DBX7VC2AYD3Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Add the missing ops_free callback.

Fixes: 064520e8aeaa ("ASoC: SOF: Intel: Add support for MeteorLake (MTL)")

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/pci-mtl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/intel/pci-mtl.c b/sound/soc/sof/intel/pci-mtl.c
index 6e4e6d4ef5a5..b183dc0014b4 100644
--- a/sound/soc/sof/intel/pci-mtl.c
+++ b/sound/soc/sof/intel/pci-mtl.c
@@ -46,6 +46,7 @@ static const struct sof_dev_desc mtl_desc = {
 	.nocodec_tplg_filename = "sof-mtl-nocodec.tplg",
 	.ops = &sof_mtl_ops,
 	.ops_init = sof_mtl_ops_init,
+	.ops_free = hda_ops_free,
 };
 
 /* PCI IDs */
-- 
2.39.2

