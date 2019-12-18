Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D67C1252E9
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 21:14:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C0DB166D;
	Wed, 18 Dec 2019 21:13:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C0DB166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576700041;
	bh=XyD47VUrhwLD1RfBmnIW5hFeAgBKciGM6/tUNxBNV+4=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=oTbK3f0IIfqbTBUqfAr5OPhNWmkuHRNSYU6QPfQZ6KqhJhOP/Dhr9B0E/0KtCVTSc
	 YrShJZ3vrth9qOL1fo6eechdFH01i2sOpgy17NFCWTkuJj9IwgxqeYQnd0mFYps7pm
	 FcrlR0LW1uf4xSe34YhID5B3nI0FDNixOUGBVZPI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 829F1F802FB;
	Wed, 18 Dec 2019 21:06:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 087ECF802E7; Wed, 18 Dec 2019 21:05:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id AF162F802E0
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 21:05:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF162F802E0
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D9DF411FB;
 Wed, 18 Dec 2019 12:05:52 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 57DA83F67D;
 Wed, 18 Dec 2019 12:05:52 -0800 (PST)
Date: Wed, 18 Dec 2019 20:05:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Guido Roncarolo <guido.roncarolo@nxp.com>
In-Reply-To: <20191218002616.7652-8-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20191218002616.7652-8-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: imx: Describe SAI parameters to be
	sent to DSP" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: SOF: imx: Describe SAI parameters to be sent to DSP

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 9c1d4cf6ac26f890d82278326f6c7552c53ffb65 Mon Sep 17 00:00:00 2001
From: Guido Roncarolo <guido.roncarolo@nxp.com>
Date: Tue, 17 Dec 2019 18:26:15 -0600
Subject: [PATCH] ASoC: SOF: imx: Describe SAI parameters to be sent to DSP

Introduce sof_ipc_dai_sai_params to keep information that
we get from topology and we send to DSP FW.
For the moment it is identical to ESAI one but it will
evolve shortly independently

Signed-off-by: Guido Roncarolo <guido.roncarolo@nxp.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191218002616.7652-8-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/sof/dai-imx.h     | 20 ++++++++++++++++++++
 include/sound/sof/dai.h         |  1 +
 include/uapi/sound/sof/tokens.h |  3 +--
 3 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/include/sound/sof/dai-imx.h b/include/sound/sof/dai-imx.h
index e02fb0b0fae1..ff9088dcc6f2 100644
--- a/include/sound/sof/dai-imx.h
+++ b/include/sound/sof/dai-imx.h
@@ -31,4 +31,24 @@ struct sof_ipc_dai_esai_params {
 	uint16_t reserved2;	/* alignment */
 } __packed;
 
+/* SAI Configuration Request - SOF_IPC_DAI_SAI_CONFIG */
+struct sof_ipc_dai_sai_params {
+	struct sof_ipc_hdr hdr;
+
+	/* MCLK */
+	uint16_t reserved1;
+	uint16_t mclk_id;
+	uint32_t mclk_direction;
+
+	uint32_t mclk_rate;	/* MCLK frequency in Hz */
+	uint32_t fsync_rate;	/* FSYNC frequency in Hz */
+	uint32_t bclk_rate;	/* BCLK frequency in Hz */
+
+	/* TDM */
+	uint32_t tdm_slots;
+	uint32_t rx_slots;
+	uint32_t tx_slots;
+	uint16_t tdm_slot_width;
+	uint16_t reserved2;	/* alignment */
+} __packed;
 #endif
diff --git a/include/sound/sof/dai.h b/include/sound/sof/dai.h
index c229565767e5..2565edd336f1 100644
--- a/include/sound/sof/dai.h
+++ b/include/sound/sof/dai.h
@@ -75,6 +75,7 @@ struct sof_ipc_dai_config {
 		struct sof_ipc_dai_hda_params hda;
 		struct sof_ipc_dai_alh_params alh;
 		struct sof_ipc_dai_esai_params esai;
+		struct sof_ipc_dai_sai_params sai;
 	};
 } __packed;
 
diff --git a/include/uapi/sound/sof/tokens.h b/include/uapi/sound/sof/tokens.h
index a9a5c4d0a892..2a25cd8da503 100644
--- a/include/uapi/sound/sof/tokens.h
+++ b/include/uapi/sound/sof/tokens.h
@@ -113,8 +113,7 @@
 #define SOF_TKN_EFFECT_TYPE	SOF_TKN_PROCESS_TYPE
 
 /* SAI */
-#define SOF_TKN_IMX_SAI_FIRST_TOKEN		1000
-/* TODO: Add SAI tokens */
+#define SOF_TKN_IMX_SAI_MCLK_ID			1000
 
 /* ESAI */
 #define SOF_TKN_IMX_ESAI_MCLK_ID		1100
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
