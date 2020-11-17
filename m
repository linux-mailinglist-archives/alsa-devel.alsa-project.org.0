Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 958B92B682E
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Nov 2020 16:04:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 363D2178B;
	Tue, 17 Nov 2020 16:04:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 363D2178B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605625498;
	bh=oaYZ3SqstJuYFKmG4jh/Bk107+ZqJJ843vvVYjU9vgw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vg8JXk4/P+mNPCuS4v+NLPGL+KAjZuEZl9CRZHS8oxkPzp+9UqO8Ioqk2prNChdzG
	 lmHsJeskitNMr7UcjgIpA+y8w+RfWtIHsdmC8RkO3B1n8Y5XkyUlSLMnChHE9XdTVW
	 fcBeto4HuOpK5V4Cr/XIfG5eV0oUHZVQvpwxMkko=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0AE6F801F9;
	Tue, 17 Nov 2020 16:03:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 695EBF801F5; Tue, 17 Nov 2020 16:03:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32151F800FE;
 Tue, 17 Nov 2020 16:02:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32151F800FE
IronPort-SDR: VXu2yAp4lz+A3X1PQeh3SwbkFEUW7hmPRzRfDOlxKGpZaBPALQGPTtEhCL3MghIZknfCRCm8qV
 ty9O6aQzk+nA==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="150206688"
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; d="scan'208";a="150206688"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2020 07:02:32 -0800
IronPort-SDR: rRnEpKTXnMvuULl90wbdLFtQX3BcyC/GaJbP9D+CgG1niRNVEVaFgjuQTBbtH1o7AeaA7n7Qck
 g03xR/bqyg8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; d="scan'208";a="340919682"
Received: from glewandosky.igk.intel.com ([10.237.149.85])
 by orsmga002.jf.intel.com with ESMTP; 17 Nov 2020 07:02:29 -0800
From: Gustaw Lewandowski <gustaw.lewandowski@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2] ASoC: Intel: catpt: select WANT_DEV_COREDUMP
Date: Tue, 17 Nov 2020 15:52:23 +0100
Message-Id: <20201117145223.21222-1-gustaw.lewandowski@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: cezary.rojewski@intel.com, patch@alsa-project.org, tiwai@suse.de,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 Gustaw Lewandowski <gustaw.lewandowski@linux.intel.com>, broonie@kernel.org,
 Piotr Maziarz <piotrx.maziarz@linux.intel.com>
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

From: Piotr Maziarz <piotrx.maziarz@linux.intel.com>

Select WANT_DEV_COREDUMP for catpt driver.

Signed-off-by: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
Signed-off-by: Gustaw Lewandowski <gustaw.lewandowski@linux.intel.com>

--
Changes in v2:
 - change should be added to catpt only
---
 sound/soc/intel/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index a5b446d5af19..52ae7c981f56 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -24,6 +24,7 @@ config SND_SOC_INTEL_CATPT
 	depends on DMADEVICES && SND_DMA_SGBUF
 	select DW_DMAC_CORE
 	select SND_SOC_ACPI_INTEL_MATCH
+	select WANT_DEV_COREDUMP
 	help
 	  Enable support for Intel(R) Haswell and Broadwell platforms
 	  with I2S codec present. This is a recommended option.
-- 
2.29.0

