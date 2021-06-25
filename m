Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CF63B49DF
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Jun 2021 22:53:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 870F11663;
	Fri, 25 Jun 2021 22:52:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 870F11663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624654422;
	bh=8F71Pc3PL5v+8NOuGAVg1oM1Alh5C8CvfQZ8TBi5N7E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rzAEXpq2vc7D/wzL8DkxpCHiGWDNHldkgdKEvezuXQR41/kLhCsHDub/hHlFakxXT
	 hMKZOkYMsNVtCr35nCYe/sopF+hw31hkfK6E8I6kByyVauVbJwK1MfB5xL/fSsjZKk
	 yK+vGbqRRbbl71UdTTUQqDjhaRwtTcCTXOhBehXg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFA14F804DA;
	Fri, 25 Jun 2021 22:51:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5EDBF804D6; Fri, 25 Jun 2021 22:51:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04B1AF8012C
 for <alsa-devel@alsa-project.org>; Fri, 25 Jun 2021 22:51:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04B1AF8012C
IronPort-SDR: MHpGepPYv5ZzJzb1+Gy/tjlX8fIp92/2dVy0wveT9fhDjK0eXlsgWFrF8/FHPkMxcmpKYmcRoJ
 oUInT1v692DA==
X-IronPort-AV: E=McAfee;i="6200,9189,10026"; a="188122679"
X-IronPort-AV: E=Sophos;i="5.83,299,1616482800"; d="scan'208";a="188122679"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2021 13:51:11 -0700
IronPort-SDR: zkbJPn4/x2AixQhORd90HTpWamnRAHjvtR96FD/PAgY0Yim8Tu3bRZtaFTFIPmDnfD3l5DxuUW
 DjWDgqe8HoxA==
X-IronPort-AV: E=Sophos;i="5.83,299,1616482800"; d="scan'208";a="640223034"
Received: from rlcervan-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.127.151])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2021 13:50:58 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/4] ASoC: SOF: add a helper to get topology configured bclk
Date: Fri, 25 Jun 2021 15:50:41 -0500
Message-Id: <20210625205042.65181-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210625205042.65181-1-pierre-louis.bossart@linux.intel.com>
References: <20210625205042.65181-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org, Brent Lu <brent.lu@intel.com>,
 Bard Liao <bard.liao@intel.com>,
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

From: Brent Lu <brent.lu@intel.com>

Add helper function sof_dai_ssp_bclk() to get the BCLK frequency
configured by topology.

Reviewed-by: Bard Liao <bard.liao@intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/sof.h       |  1 +
 sound/soc/sof/sof-audio.c | 42 ++++++++++++++++++++++++++++++++-------
 2 files changed, 36 insertions(+), 7 deletions(-)

diff --git a/include/sound/sof.h b/include/sound/sof.h
index 502ed9b8d6a1..6a1cd8e783d8 100644
--- a/include/sound/sof.h
+++ b/include/sound/sof.h
@@ -101,5 +101,6 @@ struct sof_dev_desc {
 };
 
 int sof_dai_get_mclk(struct snd_soc_pcm_runtime *rtd);
+int sof_dai_get_bclk(struct snd_soc_pcm_runtime *rtd);
 
 #endif
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 510883cd9107..989912f2b739 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -433,11 +433,10 @@ struct snd_sof_dai *snd_sof_find_dai(struct snd_soc_component *scomp,
 	return NULL;
 }
 
-/*
- * Helper to get SSP MCLK from a pcm_runtime.
- * Return 0 if not exist.
- */
-int sof_dai_get_mclk(struct snd_soc_pcm_runtime *rtd)
+#define SOF_DAI_CLK_INTEL_SSP_MCLK	0
+#define SOF_DAI_CLK_INTEL_SSP_BCLK	1
+
+static int sof_dai_get_clk(struct snd_soc_pcm_runtime *rtd, int clk_type)
 {
 	struct snd_soc_component *component =
 		snd_soc_rtdcom_lookup(rtd, SOF_AUDIO_PCM_DRV_NAME);
@@ -450,16 +449,45 @@ int sof_dai_get_mclk(struct snd_soc_pcm_runtime *rtd)
 
 	switch (dai->dai_config->type) {
 	case SOF_DAI_INTEL_SSP:
-		return dai->dai_config->ssp.mclk_rate;
+		switch (clk_type) {
+		case SOF_DAI_CLK_INTEL_SSP_MCLK:
+			return dai->dai_config->ssp.mclk_rate;
+		case SOF_DAI_CLK_INTEL_SSP_BCLK:
+			return dai->dai_config->ssp.bclk_rate;
+		default:
+			dev_err(rtd->dev, "fail to get SSP clk %d rate\n",
+				clk_type);
+			return -EINVAL;
+		}
+		break;
 	default:
 		/* not yet implemented for platforms other than the above */
-		dev_err(rtd->dev, "mclk for dai_config->type %d not supported yet!\n",
+		dev_err(rtd->dev, "DAI type %d not supported yet!\n",
 			dai->dai_config->type);
 		return -EINVAL;
 	}
 }
+
+/*
+ * Helper to get SSP MCLK from a pcm_runtime.
+ * Return 0 if not exist.
+ */
+int sof_dai_get_mclk(struct snd_soc_pcm_runtime *rtd)
+{
+	return sof_dai_get_clk(rtd, SOF_DAI_CLK_INTEL_SSP_MCLK);
+}
 EXPORT_SYMBOL(sof_dai_get_mclk);
 
+/*
+ * Helper to get SSP BCLK from a pcm_runtime.
+ * Return 0 if not exist.
+ */
+int sof_dai_get_bclk(struct snd_soc_pcm_runtime *rtd)
+{
+	return sof_dai_get_clk(rtd, SOF_DAI_CLK_INTEL_SSP_BCLK);
+}
+EXPORT_SYMBOL(sof_dai_get_bclk);
+
 /*
  * SOF Driver enumeration.
  */
-- 
2.25.1

