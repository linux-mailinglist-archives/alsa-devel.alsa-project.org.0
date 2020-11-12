Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FB12B0A08
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Nov 2020 17:33:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0781F17E4;
	Thu, 12 Nov 2020 17:32:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0781F17E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605198805;
	bh=PLiZ1Y8Ywf4XqZrbm0RA0wjQAORQv5MA9INbbgicHhA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Aa/5rk6hu+lcKYqPyWL/vXtpUBiQwFJrewTeuHFZ1TyQwXeRYaKWEqHkB0Q74e4VC
	 DrdAEg06XeyqKxyybrU3/XY16YYqdq1Wk0K0XyHOe2uWbL4uiAC5LesgUzH5nDPi3k
	 JgUxWhed6DIGyxJY/6nw+iIjDsw0T+YrWaqzkzU8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFBEDF801EB;
	Thu, 12 Nov 2020 17:31:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F25F2F804BD; Thu, 12 Nov 2020 17:31:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB18FF80161
 for <alsa-devel@alsa-project.org>; Thu, 12 Nov 2020 17:31:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB18FF80161
IronPort-SDR: aZqj5+gjx+8u9VdxhsUxJo869m9aWEfCLNQAj74TtQTwYR6RS7j/YOoF79zfP+iwwDy+CSAZnw
 4Iuik0unbyFw==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="231956986"
X-IronPort-AV: E=Sophos;i="5.77,472,1596524400"; d="scan'208";a="231956986"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 08:31:13 -0800
IronPort-SDR: s+NGXjghxbo758VVFxHEzqLkctEFzRa/lAnMbEsezpZdlaBfo8DhUDVZoNgvx706t2+CWZdNe2
 wC2kVhAzMXJg==
X-IronPort-AV: E=Sophos;i="5.77,472,1596524400"; d="scan'208";a="532228317"
Received: from nsalmulx-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.36.117])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 08:31:11 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/4] ASoC: SOF: use inclusive language for bclk and fsync
Date: Thu, 12 Nov 2020 10:30:58 -0600
Message-Id: <20201112163100.5081-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112163100.5081-1-pierre-louis.bossart@linux.intel.com>
References: <20201112163100.5081-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Mirror alsa-lib definitions w/ codec_provider (CP) and
codec_consumer (CC).

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/sof/dai.h  | 16 +++++++++++-----
 sound/soc/sof/topology.c | 18 +++++++++---------
 2 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/include/sound/sof/dai.h b/include/sound/sof/dai.h
index 34f135adf8ec..6bb403e8c5ee 100644
--- a/include/sound/sof/dai.h
+++ b/include/sound/sof/dai.h
@@ -34,15 +34,21 @@
 #define SOF_DAI_FMT_IB_NF	(3 << 8) /**< invert BCLK + nor FRM */
 #define SOF_DAI_FMT_IB_IF	(4 << 8) /**< invert BCLK + FRM */
 
-#define SOF_DAI_FMT_CBM_CFM	(0 << 12) /**< codec clk & FRM master */
-#define SOF_DAI_FMT_CBS_CFM	(2 << 12) /**< codec clk slave & FRM master */
-#define SOF_DAI_FMT_CBM_CFS	(3 << 12) /**< codec clk master & frame slave */
-#define SOF_DAI_FMT_CBS_CFS	(4 << 12) /**< codec clk & FRM slave */
+#define SOF_DAI_FMT_CBP_CFP	(0 << 12) /**< codec bclk provider & frame provider */
+#define SOF_DAI_FMT_CBC_CFP	(2 << 12) /**< codec bclk consumer & frame provider */
+#define SOF_DAI_FMT_CBP_CFC	(3 << 12) /**< codec bclk provider & frame consumer */
+#define SOF_DAI_FMT_CBC_CFC	(4 << 12) /**< codec bclk consumer & frame consumer */
+
+/* keep old definitions for backwards compatibility */
+#define SOF_DAI_FMT_CBM_CFM	SOF_DAI_FMT_CBP_CFP
+#define SOF_DAI_FMT_CBS_CFM	SOF_DAI_FMT_CBC_CFP
+#define SOF_DAI_FMT_CBM_CFS	SOF_DAI_FMT_CBP_CFC
+#define SOF_DAI_FMT_CBS_CFS	SOF_DAI_FMT_CBC_CFC
 
 #define SOF_DAI_FMT_FORMAT_MASK		0x000f
 #define SOF_DAI_FMT_CLOCK_MASK		0x00f0
 #define SOF_DAI_FMT_INV_MASK		0x0f00
-#define SOF_DAI_FMT_MASTER_MASK		0xf000
+#define SOF_DAI_FMT_CLOCK_PROVIDER_MASK	0xf000
 
 /** \brief Types of DAI */
 enum sof_ipc_dai_type {
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 28f101aaf5cd..b6b32a7a91f8 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -2786,18 +2786,18 @@ static void sof_dai_set_format(struct snd_soc_tplg_hw_config *hw_config,
 			       struct sof_ipc_dai_config *config)
 {
 	/* clock directions wrt codec */
-	if (hw_config->bclk_provider == SND_SOC_TPLG_BCLK_CM) {
-		/* codec is bclk master */
-		if (hw_config->fsync_provider == SND_SOC_TPLG_FSYNC_CM)
-			config->format |= SOF_DAI_FMT_CBM_CFM;
+	if (hw_config->bclk_provider == SND_SOC_TPLG_BCLK_CP) {
+		/* codec is bclk provider */
+		if (hw_config->fsync_provider == SND_SOC_TPLG_FSYNC_CP)
+			config->format |= SOF_DAI_FMT_CBP_CFP;
 		else
-			config->format |= SOF_DAI_FMT_CBM_CFS;
+			config->format |= SOF_DAI_FMT_CBP_CFC;
 	} else {
-		/* codec is bclk slave */
-		if (hw_config->fsync_provider == SND_SOC_TPLG_FSYNC_CM)
-			config->format |= SOF_DAI_FMT_CBS_CFM;
+		/* codec is bclk consumer */
+		if (hw_config->fsync_provider == SND_SOC_TPLG_FSYNC_CP)
+			config->format |= SOF_DAI_FMT_CBC_CFP;
 		else
-			config->format |= SOF_DAI_FMT_CBS_CFS;
+			config->format |= SOF_DAI_FMT_CBC_CFC;
 	}
 
 	/* inverted clocks ? */
-- 
2.25.1

