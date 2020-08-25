Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1C725247D
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 01:55:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C07A16BE;
	Wed, 26 Aug 2020 01:54:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C07A16BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598399728;
	bh=4KGblwNbB/KEH21QrB5v/3JPcjw8KNX+RSosygDwmDc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oJgH3xnicFUwK+mzFAzJ0Fj9smYbPWNLBLr4jwoi4ofCtOud5mw9Z0gSoU8mYbRTP
	 mSaBHge4HqtyghiRJ0n95saWYuyfN//qYrgTLVHrEM+tIxlahj19PFYrzFDT67vjC4
	 FHjLMMX31jQ1RyEWrzNkABy19wIUppWqoI4wtMls=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21B80F802E7;
	Wed, 26 Aug 2020 01:51:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 718B3F80269; Wed, 26 Aug 2020 01:51:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D71CF80260
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 01:51:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D71CF80260
IronPort-SDR: aLRCt1FAgI2j112B1Q17tWVFBoQOI8rEFGaTa31lFnp09i8CDoQF4hOQcrcU/0Gu5eiplbHkcX
 WArc0AftKLhQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9724"; a="157253468"
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; d="scan'208";a="157253468"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2020 16:51:01 -0700
IronPort-SDR: K/dhjHp9gx+XqIgsVDGYqMLyzaz3gnWnyUZYvOE+MWnqYzB8OVzHcjDgacL2fEFIo9aQW/haNH
 GJ3/XpJZWUMQ==
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; d="scan'208";a="443819025"
Received: from cdurvasu-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.209.42.42])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2020 16:51:00 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 7/7] ASoC: SOF: sof-of-dev: Add .arch_ops field
Date: Tue, 25 Aug 2020 16:50:40 -0700
Message-Id: <20200825235040.1586478-8-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200825235040.1586478-1-ranjani.sridharan@linux.intel.com>
References: <20200825235040.1586478-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Daniel Baluta <daniel.baluta@gmail.com>, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Iulian Olaru <iulianolaru249@yahoo.com>
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

From: Iulian Olaru <iulianolaru249@yahoo.com>

Add .arch_ops field in the sof_imx8x_ops structure.
The inclusion of this field will allow the usage of functions from
sof/core.c in order to print debug information such as the registers and
a stack dump in case of a firmware ops.

The SND_SOC_SOF_XTENSA is added in the imx/Kconfig file so the compilation
is successful.

Signed-off-by: Iulian Olaru <iulianolaru249@yahoo.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@gmail.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/imx/Kconfig | 2 ++
 sound/soc/sof/imx/imx8.c  | 7 +++++++
 sound/soc/sof/imx/imx8m.c | 4 ++++
 3 files changed, 13 insertions(+)

diff --git a/sound/soc/sof/imx/Kconfig b/sound/soc/sof/imx/Kconfig
index 8230285baa43..23bfd79d09c3 100644
--- a/sound/soc/sof/imx/Kconfig
+++ b/sound/soc/sof/imx/Kconfig
@@ -30,6 +30,7 @@ config SND_SOC_SOF_IMX8_SUPPORT
 
 config SND_SOC_SOF_IMX8
 	tristate
+	select SND_SOC_SOF_XTENSA
 	help
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level
@@ -44,6 +45,7 @@ config SND_SOC_SOF_IMX8M_SUPPORT
 
 config SND_SOC_SOF_IMX8M
 	tristate
+	select SND_SOC_SOF_XTENSA
 	help
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level
diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 325bf59e27c1..3b9ffc760cb5 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -424,6 +424,9 @@ struct snd_sof_dsp_ops sof_imx8_ops = {
 	/* firmware loading */
 	.load_firmware	= snd_sof_load_firmware_memcpy,
 
+	/* Firmware ops */
+	.arch_ops = &sof_xtensa_arch_ops,
+
 	/* DAI drivers */
 	.drv = imx8_dai,
 	.num_drv = ARRAY_SIZE(imx8_dai),
@@ -464,6 +467,9 @@ struct snd_sof_dsp_ops sof_imx8x_ops = {
 	/* firmware loading */
 	.load_firmware	= snd_sof_load_firmware_memcpy,
 
+	/* Firmware ops */
+	.arch_ops = &sof_xtensa_arch_ops,
+
 	/* DAI drivers */
 	.drv = imx8_dai,
 	.num_drv = ARRAY_SIZE(imx8_dai),
@@ -477,4 +483,5 @@ struct snd_sof_dsp_ops sof_imx8x_ops = {
 };
 EXPORT_SYMBOL(sof_imx8x_ops);
 
+MODULE_IMPORT_NS(SND_SOC_SOF_XTENSA);
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
index c4f1ca939068..ca23ac99a63d 100644
--- a/sound/soc/sof/imx/imx8m.c
+++ b/sound/soc/sof/imx/imx8m.c
@@ -277,6 +277,9 @@ struct snd_sof_dsp_ops sof_imx8m_ops = {
 	/* firmware loading */
 	.load_firmware	= snd_sof_load_firmware_memcpy,
 
+	/* Firmware ops */
+	.arch_ops = &sof_xtensa_arch_ops,
+
 	/* DAI drivers */
 	.drv = imx8m_dai,
 	.num_drv = ARRAY_SIZE(imx8m_dai),
@@ -289,4 +292,5 @@ struct snd_sof_dsp_ops sof_imx8m_ops = {
 };
 EXPORT_SYMBOL(sof_imx8m_ops);
 
+MODULE_IMPORT_NS(SND_SOC_SOF_XTENSA);
 MODULE_LICENSE("Dual BSD/GPL");
-- 
2.25.1

