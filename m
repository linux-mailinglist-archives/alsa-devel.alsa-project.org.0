Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B03932F4F98
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jan 2021 17:11:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 172FE173B;
	Wed, 13 Jan 2021 17:10:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 172FE173B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610554303;
	bh=j7Rk9C1+lwAT7zEat+N12+5H/0ejFsp4m0fs7HI6lok=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WdGuXr1tCHSSQNAmFYPgzLGqtHSh/4tsmgGfykhxLD5u7mYIyGmZVVFRxSvbAawR/
	 vMrcg9ixQqkyc1ip3OAs2uMlA25bRqCHQ0fKqlD07A3sp7B28+UdMdp8qQnYyLGpFv
	 AYEp+etC12FWaxT4tEhnjsWFI+3aLKBw6Bb5kXGY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72C4DF8026D;
	Wed, 13 Jan 2021 17:10:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EC22F8026B; Wed, 13 Jan 2021 17:10:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 260BBF80113
 for <alsa-devel@alsa-project.org>; Wed, 13 Jan 2021 17:10:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 260BBF80113
IronPort-SDR: gfBkmPd1MSvDjiAHANV2V8u7V3h/SCTuPhhnuXrx7ND4nCdUZ4MWSUnjLFnR/VeJ9pJthSiOFi
 otZGfvfr2ZjQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9863"; a="165315763"
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; d="scan'208";a="165315763"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2021 08:10:11 -0800
IronPort-SDR: qEGdnaIIaAisaq9vq6yJe7qzmEdgn+EbifMe6GaU1V0aqouak5uvV9hOB5D5a8T9o5SpAaSb2N
 BgCeFAqsqf7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; d="scan'208";a="353533399"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga008.fm.intel.com with ESMTP; 13 Jan 2021 08:10:07 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: Intel: initial support to AlderLake-P
Date: Wed, 13 Jan 2021 18:07:04 +0200
Message-Id: <20210113160704.4106353-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 daniel.baluta@nxp.com
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

Add PCI id for the AlderLake-P.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 sound/soc/sof/sof-pci-dev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index 63b989e3ec40..9c3cb719e268 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -512,6 +512,8 @@ static const struct pci_device_id sof_pci_ids[] = {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_ALDERLAKE)
 	{ PCI_DEVICE(0x8086, 0x7ad0),
 		.driver_data = (unsigned long)&adls_desc},
+	{ PCI_DEVICE(0x8086, 0x51c8),
+		.driver_data = (unsigned long)&tgl_desc},
 #endif
 	{ 0, }
 };
-- 
2.29.2

