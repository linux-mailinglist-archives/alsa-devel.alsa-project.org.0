Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB752467C74
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Dec 2021 18:24:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C92923FF;
	Fri,  3 Dec 2021 18:24:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C92923FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638552298;
	bh=aS0lNqioKeFdqy58GL3kZG+7dWoFjoKQNzygrLn9qWs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Klm4mty8TAGNeGNpm+ITDtSMzKniT+g6jQjtL/RbbX60vUuLHjR7T/xSE+wW4REO9
	 SqvNQYt3pSfqy7+jxlizyMLcUQeG1zRYEWv30SZSafBGPExSaQGF4gcj8kSBPhTK04
	 zRdqJ5OJ5900MYgfH74c8GqeEeYo4Ad4ZpXnJVLM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE489F800D3;
	Fri,  3 Dec 2021 18:23:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3CEDF800D3; Fri,  3 Dec 2021 18:23:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05572F800D3
 for <alsa-devel@alsa-project.org>; Fri,  3 Dec 2021 18:23:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05572F800D3
X-IronPort-AV: E=McAfee;i="6200,9189,10187"; a="217036492"
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="217036492"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 09:23:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="561783289"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga008.fm.intel.com with ESMTP; 03 Dec 2021 09:23:25 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 1/2] ASoC: SOF: Intel: pci-tgl: add ADL-N support
Date: Fri,  3 Dec 2021 19:15:41 +0200
Message-Id: <20211203171542.1021399-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com
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

Add PCI DID for Intel AlderLake-N.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/pci-tgl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sof/intel/pci-tgl.c b/sound/soc/sof/intel/pci-tgl.c
index f2ea34df9741..302068fd0b81 100644
--- a/sound/soc/sof/intel/pci-tgl.c
+++ b/sound/soc/sof/intel/pci-tgl.c
@@ -114,6 +114,8 @@ static const struct pci_device_id sof_pci_ids[] = {
 		.driver_data = (unsigned long)&adl_desc},
 	{ PCI_DEVICE(0x8086, 0x51cc), /* ADL-M */
 		.driver_data = (unsigned long)&adl_desc},
+	{ PCI_DEVICE(0x8086, 0x54c8), /* ADL-N */
+		.driver_data = (unsigned long)&adl_desc},
 	{ 0, }
 };
 MODULE_DEVICE_TABLE(pci, sof_pci_ids);

base-commit: 0695ad92fe1a0bb7697eb92c6a145a73c5ab0e24
-- 
2.34.1

