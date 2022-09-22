Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 235F55E5F50
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Sep 2022 12:04:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0490843;
	Thu, 22 Sep 2022 12:03:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0490843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663841089;
	bh=2Tmuyx0p237epaP0cGElthhLtwvri63vuDK9srs1uA0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QL8p/OeOc7Q85Ux8Sa8MsBWtiwuo1RCrB7fexn8DEPKI79qXdG+jCA8rMxOif4YWL
	 egEaUs08COi9qDGw2fyUp1eR6y3/Sgd/1PsMYZBZX4Swmugjx0vQKxpOr3B2Isv0eb
	 uuLkUUOyOVObZ1Au9b1Up42dmP6o+z9z2Qc+B7os=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C91C2F80538;
	Thu, 22 Sep 2022 12:03:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BB85F804E7; Thu, 22 Sep 2022 12:03:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D8EFF80256
 for <alsa-devel@alsa-project.org>; Thu, 22 Sep 2022 12:03:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D8EFF80256
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="XmQ5mBrO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663841001; x=1695377001;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2Tmuyx0p237epaP0cGElthhLtwvri63vuDK9srs1uA0=;
 b=XmQ5mBrOqgVAjYjL6b8vod5P/yEk11uXzw4yoDL1kB8QqmPnzTkLQb0G
 ETtX8rMY5G+JRb/6o6cghav2J+iqlTD8ytfVYSlyKaUG8VrKS//QrwV0f
 oPj6xBjps+z5qX/0eJYwx8cRA8N2WVOwdxSR+T+PI7o6QuXLmglaEuidP
 4/ba/PA6x3RywV54nRKwiW5XUscaKSvhyNG00E01q3Jj3cAJM9+BFRE3J
 N3mjYqGCEUe/6fxL8HAyH4LcDHte3x99n/IY1h+j/4WFpsnISQM0rX1uV
 thyMScRoJi2qELstZv04hFP/nXXxy1fHq4VlioZlfwFVmk8ITCoVpasBK Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="300241289"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="300241289"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 03:03:18 -0700
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="622036214"
Received: from icostanz-mobl1.amr.corp.intel.com (HELO pbossart-mobl3.home)
 ([10.251.210.149])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 03:03:15 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ASoC: SOF: Intel: pci-tgl: reorder PCI IDs
Date: Thu, 22 Sep 2022 12:02:53 +0200
Message-Id: <20220922100254.27159-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220922100254.27159-1-pierre-louis.bossart@linux.intel.com>
References: <20220922100254.27159-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

No functionality change, just sort ADL PCI IDs by increasing order.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/pci-tgl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/pci-tgl.c b/sound/soc/sof/intel/pci-tgl.c
index 34eeec3c1851f..1e0f7f0734e75 100644
--- a/sound/soc/sof/intel/pci-tgl.c
+++ b/sound/soc/sof/intel/pci-tgl.c
@@ -252,8 +252,6 @@ static const struct pci_device_id sof_pci_ids[] = {
 		.driver_data = (unsigned long)&rpls_desc},
 	{ PCI_DEVICE(0x8086, 0x51c8), /* ADL-P */
 		.driver_data = (unsigned long)&adl_desc},
-	{ PCI_DEVICE(0x8086, 0x51cd), /* ADL-P */
-		.driver_data = (unsigned long)&adl_desc},
 	{ PCI_DEVICE(0x8086, 0x51c9), /* ADL-PS */
 		.driver_data = (unsigned long)&adl_desc},
 	{ PCI_DEVICE(0x8086, 0x51ca), /* RPL-P */
@@ -262,6 +260,8 @@ static const struct pci_device_id sof_pci_ids[] = {
 		.driver_data = (unsigned long)&rpl_desc},
 	{ PCI_DEVICE(0x8086, 0x51cc), /* ADL-M */
 		.driver_data = (unsigned long)&adl_desc},
+	{ PCI_DEVICE(0x8086, 0x51cd), /* ADL-P */
+		.driver_data = (unsigned long)&adl_desc},
 	{ PCI_DEVICE(0x8086, 0x54c8), /* ADL-N */
 		.driver_data = (unsigned long)&adl_desc},
 	{ 0, }
-- 
2.34.1

