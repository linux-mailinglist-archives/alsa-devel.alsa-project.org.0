Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3086D2B0AA8
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Nov 2020 17:47:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A59641835;
	Thu, 12 Nov 2020 17:46:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A59641835
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605199630;
	bh=78qWbjqQ3Dmo9fhPQk1zwa5IHaavEEAMB7lxa2Kpmes=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o02fznZZpXllWspWMe9oMdJC1W8QhIFPP0HVNtgjOBK2OfF9xMHDEQEc1fg5eA+w/
	 RpxI0MDzledfP1vDDQU2WW7Jm/0gY5OwmVqJuiKE3XuLfd7/OxP0x97BB3RwBW2N+k
	 C8j1vpk4l4gm9tSAVrEl5BBw118MddrPRZCKBMfg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D6FAF804CB;
	Thu, 12 Nov 2020 17:44:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09B59F801D5; Thu, 12 Nov 2020 17:44:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46E58F801D5
 for <alsa-devel@alsa-project.org>; Thu, 12 Nov 2020 17:44:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46E58F801D5
IronPort-SDR: VgHKKMFUtOaR6+Zrt+gzGidLwlkm1TRsk4PGgJCA7TirZPc7x2v+0dsg6Qr3r3rMBjLSxO+LI5
 57Bc6UKoCxgQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="170508855"
X-IronPort-AV: E=Sophos;i="5.77,472,1596524400"; d="scan'208";a="170508855"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 08:44:38 -0800
IronPort-SDR: G+JRcNykfb788qPC2T33dLBL4/BqpSFZtjeFfzM8YkNQ5cAFFzZ/OqjVNUEhriNouvKRo7fgX+
 +ypxYRrrs2hQ==
X-IronPort-AV: E=Sophos;i="5.77,472,1596524400"; d="scan'208";a="355251422"
Received: from uikram-mobl1.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.213.181.67])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 08:44:37 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 1/4] ASoC: SOF: imx: fix Kconfig punctuation
Date: Thu, 12 Nov 2020 10:44:22 -0600
Message-Id: <20201112164425.25603-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112164425.25603-1-pierre-louis.bossart@linux.intel.com>
References: <20201112164425.25603-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 tiwai@suse.de, Randy Dunlap <rdunlap@infradead.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Rander Wang <rander.wang@linux.intel.com>
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

From: Randy Dunlap <rdunlap@infradead.org>

Add periods at the end of sentences in help text.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 sound/soc/sof/imx/Kconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/imx/Kconfig b/sound/soc/sof/imx/Kconfig
index 48f998a19ddb..49d605cb09a5 100644
--- a/sound/soc/sof/imx/Kconfig
+++ b/sound/soc/sof/imx/Kconfig
@@ -17,7 +17,7 @@ config SND_SOC_SOF_IMX_OF
 	select SND_SOC_SOF_IMX8M if SND_SOC_SOF_IMX8M_SUPPORT
 	help
 	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level
+	  'select' statements at a higher level.
 
 config SND_SOC_SOF_IMX_COMMON
 	tristate
@@ -30,7 +30,7 @@ config SND_SOC_SOF_IMX8_SUPPORT
 	depends on IMX_SCU=y || IMX_SCU=SND_SOC_SOF_IMX_OF
 	depends on IMX_DSP=y || IMX_DSP=SND_SOC_SOF_IMX_OF
 	help
-	  This adds support for Sound Open Firmware for NXP i.MX8 platforms
+	  This adds support for Sound Open Firmware for NXP i.MX8 platforms.
 	  Say Y if you have such a device.
 	  If unsure select "N".
 
@@ -40,13 +40,13 @@ config SND_SOC_SOF_IMX8
 	select SND_SOC_SOF_XTENSA
 	help
 	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level
+	  'select' statements at a higher level.
 
 config SND_SOC_SOF_IMX8M_SUPPORT
 	bool "SOF support for i.MX8M"
 	depends on IMX_DSP=y || IMX_DSP=SND_SOC_SOF_OF
 	help
-	  This adds support for Sound Open Firmware for NXP i.MX8M platforms
+	  This adds support for Sound Open Firmware for NXP i.MX8M platforms.
 	  Say Y if you have such a device.
 	  If unsure select "N".
 
@@ -56,6 +56,6 @@ config SND_SOC_SOF_IMX8M
 	select SND_SOC_SOF_XTENSA
 	help
 	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level
+	  'select' statements at a higher level.
 
 endif ## SND_SOC_SOF_IMX_IMX_TOPLEVEL
-- 
2.25.1

