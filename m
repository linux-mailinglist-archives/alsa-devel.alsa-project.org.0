Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2D32AFA96
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Nov 2020 22:37:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E9E61796;
	Wed, 11 Nov 2020 22:36:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E9E61796
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605130660;
	bh=78qWbjqQ3Dmo9fhPQk1zwa5IHaavEEAMB7lxa2Kpmes=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MRX+LFWRZ4XdjAYotn7YPfa++AFjWJkrjl2pBoDZcB4pwfdlls0J6iRoEQWMaLT4W
	 jUkrjJeaQOtpgjMw6w2oSBiMdMOKgbk1fvvXFlJw+vjndC3G7+LXLnEbK2laoSsIuB
	 7fnnXIKjsgxXxtnEBn+ge9zpY0I7CAZEXu/D4xkA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E9D4F801F5;
	Wed, 11 Nov 2020 22:36:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8953BF80290; Wed, 11 Nov 2020 22:35:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8957F800AE
 for <alsa-devel@alsa-project.org>; Wed, 11 Nov 2020 22:35:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8957F800AE
IronPort-SDR: VhIkZoUYFqz4C+3Q/jxH7Z4XyL9abNnHLuOZMXEBG1n+0eSQps3Pqaeab5NTrIIKYpC0Ph+/PN
 kbm7D74Wd03g==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="157237652"
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; d="scan'208";a="157237652"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2020 13:35:46 -0800
IronPort-SDR: JUcWlNQGIID+2pkRWUfY9MsNwHfNFNuYGHELCA0Xg3SYRhvmK8+V+mvXjiak7k0ZMTpfzud9TC
 AYOrvUmphf2Q==
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; d="scan'208";a="328266627"
Received: from cmurill1-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.130.147])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2020 13:35:45 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/4] ASoC: SOF: imx: fix Kconfig punctuation
Date: Wed, 11 Nov 2020 15:35:30 -0600
Message-Id: <20201111213533.149963-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201111213533.149963-1-pierre-louis.bossart@linux.intel.com>
References: <20201111213533.149963-1-pierre-louis.bossart@linux.intel.com>
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

