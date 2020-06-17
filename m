Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 094421FD2CD
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jun 2020 18:51:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC8F0167F;
	Wed, 17 Jun 2020 18:50:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC8F0167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592412693;
	bh=muHVtr/HaRUfqaoD3C6StiI2xpfQaCTGGLnSeItPwDk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rG5xDR1KbWhhNpGxp33oGwVGC5kuiyfqfcZTaGAOhpPmiB2SpUrp/YDwWHTtTCnDG
	 mZQHwPT/Srjo6cYceM23brWBqnGCJGWph+o0dMPBi8SlaSSgjyny0p313vU9K8/NUX
	 JMNlVRpZV1T4E6pdi5T7JBN9r6nJUTLjNFnWOVpw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16832F802A7;
	Wed, 17 Jun 2020 18:48:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E16CF8025F; Wed, 17 Jun 2020 18:48:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2319AF801D9
 for <alsa-devel@alsa-project.org>; Wed, 17 Jun 2020 18:48:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2319AF801D9
IronPort-SDR: dNulY60ftSZPo98wZzEJQogbNoNgTstXcBOywL5bhwo73frYNi7zSh//zK0qbwv1xTUc+cE5P4
 o4b9qCQROscg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2020 09:48:03 -0700
IronPort-SDR: Off22vtaQdswYEBUsHwivy/rK1Y6JudvfEPWypHiryZwRBxUC01ypHe98kJ/bMLE94qqJuqudt
 PPp2aZ3dF0Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,523,1583222400"; d="scan'208";a="261776799"
Received: from zdsmith-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.229.128])
 by fmsmga007.fm.intel.com with ESMTP; 17 Jun 2020 09:48:02 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/3] ASoC: SOF: Intel: add PCI IDs for ICL-H and TGL-H
Date: Wed, 17 Jun 2020 11:47:55 -0500
Message-Id: <20200617164755.18104-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200617164755.18104-1-pierre-louis.bossart@linux.intel.com>
References: <20200617164755.18104-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

Usually the DSP is not traditionally enabled on H skews but this might
be used moving forward.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/sof-pci-dev.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index f3cb2db67130..aa3532ba1434 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -409,8 +409,11 @@ static const struct pci_device_id sof_pci_ids[] = {
 		.driver_data = (unsigned long)&cfl_desc},
 #endif
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_ICELAKE)
-	{ PCI_DEVICE(0x8086, 0x34C8),
+	{ PCI_DEVICE(0x8086, 0x34C8), /* ICL-LP */
 		.driver_data = (unsigned long)&icl_desc},
+	{ PCI_DEVICE(0x8086, 0x3dc8), /* ICL-H */
+		.driver_data = (unsigned long)&icl_desc},
+
 #endif
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_JASPERLAKE)
 	{ PCI_DEVICE(0x8086, 0x38c8),
@@ -427,8 +430,11 @@ static const struct pci_device_id sof_pci_ids[] = {
 		.driver_data = (unsigned long)&cml_desc},
 #endif
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_TIGERLAKE)
-	{ PCI_DEVICE(0x8086, 0xa0c8),
+	{ PCI_DEVICE(0x8086, 0xa0c8), /* TGL-LP */
 		.driver_data = (unsigned long)&tgl_desc},
+	{ PCI_DEVICE(0x8086, 0x43c8), /* TGL-H */
+		.driver_data = (unsigned long)&tgl_desc},
+
 #endif
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_ELKHARTLAKE)
 	{ PCI_DEVICE(0x8086, 0x4b55),
-- 
2.20.1

