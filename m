Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF972B0A12
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Nov 2020 17:34:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0985182B;
	Thu, 12 Nov 2020 17:33:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0985182B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605198888;
	bh=BVnxiL5ELJwHBqz8/TninkkX9Xaw/0yBXoNB95kZ3uA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OJd8LQXnTVmReWu91doreRyeUp1acxXU82AmyFfXIWxijE2c89SR3uNBAiGiV1o10
	 9SGkkkGnHL74B2nfhqkt9hTSW1MVyc8V0cD51Y94H4P9qsb+izah2RNJbpod42Zfuo
	 m2gl2UfYXpAA0fEqXq7VQxMH2ND4MT2oKVy4/OK0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41B82F804F3;
	Thu, 12 Nov 2020 17:31:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E833F80290; Thu, 12 Nov 2020 17:31:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDA6AF802C4
 for <alsa-devel@alsa-project.org>; Thu, 12 Nov 2020 17:31:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDA6AF802C4
IronPort-SDR: OZbqSVj+cIS0bOGQoSF+YO5+vmpIVdl66772yu+YuY4uXeToPeypJ5NhddQAi/aOz25b8z12uY
 sLmwMgnTukkA==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="231956991"
X-IronPort-AV: E=Sophos;i="5.77,472,1596524400"; d="scan'208";a="231956991"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 08:31:14 -0800
IronPort-SDR: YYTBl41ix6PlSdOf2AO50KktDRPmSroMiHT0eAwtRmmeu70op6Q4lKD1zNes5PKCiGR1aq2SSK
 lip5L4ndv4iw==
X-IronPort-AV: E=Sophos;i="5.77,472,1596524400"; d="scan'208";a="532228312"
Received: from nsalmulx-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.36.117])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 08:31:11 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/4] ASoC: topology: use inclusive language for bclk and fsync
Date: Thu, 12 Nov 2020 10:30:57 -0600
Message-Id: <20201112163100.5081-2-pierre-louis.bossart@linux.intel.com>
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

Mirror suggested changes in alsa-lib.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/soc-dai.h   | 32 ++++++++++++++++++++------------
 include/uapi/sound/asoc.h | 22 ++++++++++++++--------
 sound/soc/soc-topology.c  | 24 ++++++++++++------------
 sound/soc/sof/topology.c  |  6 +++---
 4 files changed, 49 insertions(+), 35 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 7a85a6f83ca8..4bf759f025d2 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -72,21 +72,29 @@ struct snd_compr_stream;
 #define SND_SOC_DAIFMT_IB_IF		(4 << 8) /* invert BCLK + FRM */
 
 /*
- * DAI hardware clock masters.
+ * DAI hardware clock providers/consumers
  *
  * This is wrt the codec, the inverse is true for the interface
- * i.e. if the codec is clk and FRM master then the interface is
- * clk and frame secondary.
+ * i.e. if the codec is clk and FRM provider then the interface is
+ * clk and frame consumer.
  */
-#define SND_SOC_DAIFMT_CBM_CFM		(1 << 12) /* codec clk & FRM master */
-#define SND_SOC_DAIFMT_CBS_CFM		(2 << 12) /* codec clk secondary & FRM master */
-#define SND_SOC_DAIFMT_CBM_CFS		(3 << 12) /* codec clk master & frame secondary */
-#define SND_SOC_DAIFMT_CBS_CFS		(4 << 12) /* codec clk & FRM secondary */
-
-#define SND_SOC_DAIFMT_FORMAT_MASK	0x000f
-#define SND_SOC_DAIFMT_CLOCK_MASK	0x00f0
-#define SND_SOC_DAIFMT_INV_MASK		0x0f00
-#define SND_SOC_DAIFMT_MASTER_MASK	0xf000
+#define SND_SOC_DAIFMT_CBP_CFP		(1 << 12) /* codec clk provider & frame provider */
+#define SND_SOC_DAIFMT_CBC_CFP		(2 << 12) /* codec clk consumer & frame provider */
+#define SND_SOC_DAIFMT_CBP_CFC		(3 << 12) /* codec clk provider & frame consumer */
+#define SND_SOC_DAIFMT_CBC_CFC		(4 << 12) /* codec clk consumer & frame follower */
+
+/* previous definitions kept for backwards-compatibility, do not use in new contributions */
+#define SND_SOC_DAIFMT_CBM_CFM		SND_SOC_DAIFMT_CBP_CFP
+#define SND_SOC_DAIFMT_CBS_CFM		SND_SOC_DAIFMT_CBC_CFP
+#define SND_SOC_DAIFMT_CBM_CFS		SND_SOC_DAIFMT_CBP_CFC
+#define SND_SOC_DAIFMT_CBS_CFS		SND_SOC_DAIFMT_CBC_CFC
+
+#define SND_SOC_DAIFMT_FORMAT_MASK		0x000f
+#define SND_SOC_DAIFMT_CLOCK_MASK		0x00f0
+#define SND_SOC_DAIFMT_INV_MASK			0x0f00
+#define SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK	0xf000
+
+#define SND_SOC_DAIFMT_MASTER_MASK	SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK
 
 /*
  * Master Clock Directions
diff --git a/include/uapi/sound/asoc.h b/include/uapi/sound/asoc.h
index a74ca232f1fc..da61398b1f8f 100644
--- a/include/uapi/sound/asoc.h
+++ b/include/uapi/sound/asoc.h
@@ -170,16 +170,22 @@
 #define SND_SOC_TPLG_LNK_FLGBIT_VOICE_WAKEUP            (1 << 3)
 
 /* DAI topology BCLK parameter
- * For the backwards capability, by default codec is bclk master
+ * For the backwards capability, by default codec is bclk provider
  */
-#define SND_SOC_TPLG_BCLK_CM         0 /* codec is bclk master */
-#define SND_SOC_TPLG_BCLK_CS         1 /* codec is bclk slave */
+#define SND_SOC_TPLG_BCLK_CP         0 /* codec is bclk provider */
+#define SND_SOC_TPLG_BCLK_CC         1 /* codec is bclk consumer */
+/* keep previous definitions for compatibility */
+#define SND_SOC_TPLG_BCLK_CM         SND_SOC_TPLG_BCLK_CP
+#define SND_SOC_TPLG_BCLK_CS         SND_SOC_TPLG_BCLK_CC
 
 /* DAI topology FSYNC parameter
- * For the backwards capability, by default codec is fsync master
+ * For the backwards capability, by default codec is fsync provider
  */
-#define SND_SOC_TPLG_FSYNC_CM         0 /* codec is fsync master */
-#define SND_SOC_TPLG_FSYNC_CS         1 /* codec is fsync slave */
+#define SND_SOC_TPLG_FSYNC_CP         0 /* codec is fsync provider */
+#define SND_SOC_TPLG_FSYNC_CC         1 /* codec is fsync consumer */
+/* keep previous definitions for compatibility */
+#define SND_SOC_TPLG_FSYNC_CM         SND_SOC_TPLG_FSYNC_CP
+#define SND_SOC_TPLG_FSYNC_CS         SND_SOC_TPLG_FSYNC_CC
 
 /*
  * Block Header.
@@ -336,8 +342,8 @@ struct snd_soc_tplg_hw_config {
 	__u8 clock_gated;	/* SND_SOC_TPLG_DAI_CLK_GATE_ value */
 	__u8 invert_bclk;	/* 1 for inverted BCLK, 0 for normal */
 	__u8 invert_fsync;	/* 1 for inverted frame clock, 0 for normal */
-	__u8 bclk_master;	/* SND_SOC_TPLG_BCLK_ value */
-	__u8 fsync_master;	/* SND_SOC_TPLG_FSYNC_ value */
+	__u8 bclk_provider;	/* SND_SOC_TPLG_BCLK_ value */
+	__u8 fsync_provider;	/* SND_SOC_TPLG_FSYNC_ value */
 	__u8 mclk_direction;    /* SND_SOC_TPLG_MCLK_ value */
 	__le16 reserved;	/* for 32bit alignment */
 	__le32 mclk_rate;	/* MCLK or SYSCLK freqency in Hz */
diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 07c60187e9ea..eb2633dd6454 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -2017,7 +2017,7 @@ static void set_link_hw_format(struct snd_soc_dai_link *link,
 			struct snd_soc_tplg_link_config *cfg)
 {
 	struct snd_soc_tplg_hw_config *hw_config;
-	unsigned char bclk_master, fsync_master;
+	unsigned char bclk_provider, fsync_provider;
 	unsigned char invert_bclk, invert_fsync;
 	int i;
 
@@ -2057,18 +2057,18 @@ static void set_link_hw_format(struct snd_soc_dai_link *link,
 			link->dai_fmt |= SND_SOC_DAIFMT_IB_IF;
 
 		/* clock masters */
-		bclk_master = (hw_config->bclk_master ==
-			       SND_SOC_TPLG_BCLK_CM);
-		fsync_master = (hw_config->fsync_master ==
-				SND_SOC_TPLG_FSYNC_CM);
-		if (bclk_master && fsync_master)
-			link->dai_fmt |= SND_SOC_DAIFMT_CBM_CFM;
-		else if (!bclk_master && fsync_master)
-			link->dai_fmt |= SND_SOC_DAIFMT_CBS_CFM;
-		else if (bclk_master && !fsync_master)
-			link->dai_fmt |= SND_SOC_DAIFMT_CBM_CFS;
+		bclk_provider = (hw_config->bclk_provider ==
+			       SND_SOC_TPLG_BCLK_CP);
+		fsync_provider = (hw_config->fsync_provider ==
+				SND_SOC_TPLG_FSYNC_CP);
+		if (bclk_provider && fsync_provider)
+			link->dai_fmt |= SND_SOC_DAIFMT_CBP_CFP;
+		else if (!bclk_provider && fsync_provider)
+			link->dai_fmt |= SND_SOC_DAIFMT_CBC_CFP;
+		else if (bclk_provider && !fsync_provider)
+			link->dai_fmt |= SND_SOC_DAIFMT_CBP_CFC;
 		else
-			link->dai_fmt |= SND_SOC_DAIFMT_CBS_CFS;
+			link->dai_fmt |= SND_SOC_DAIFMT_CBC_CFC;
 	}
 }
 
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index b0132fa56fe2..28f101aaf5cd 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -2786,15 +2786,15 @@ static void sof_dai_set_format(struct snd_soc_tplg_hw_config *hw_config,
 			       struct sof_ipc_dai_config *config)
 {
 	/* clock directions wrt codec */
-	if (hw_config->bclk_master == SND_SOC_TPLG_BCLK_CM) {
+	if (hw_config->bclk_provider == SND_SOC_TPLG_BCLK_CM) {
 		/* codec is bclk master */
-		if (hw_config->fsync_master == SND_SOC_TPLG_FSYNC_CM)
+		if (hw_config->fsync_provider == SND_SOC_TPLG_FSYNC_CM)
 			config->format |= SOF_DAI_FMT_CBM_CFM;
 		else
 			config->format |= SOF_DAI_FMT_CBM_CFS;
 	} else {
 		/* codec is bclk slave */
-		if (hw_config->fsync_master == SND_SOC_TPLG_FSYNC_CM)
+		if (hw_config->fsync_provider == SND_SOC_TPLG_FSYNC_CM)
 			config->format |= SOF_DAI_FMT_CBS_CFM;
 		else
 			config->format |= SOF_DAI_FMT_CBS_CFS;
-- 
2.25.1

