Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CA57C769A
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Oct 2023 21:21:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33664E95;
	Thu, 12 Oct 2023 21:20:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33664E95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697138508;
	bh=q5WLXoIBQW7WGaww7V805wk3LOohYxdLIZJQ5SFmGmA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Orc3KaGihya7cgQpBV+rNA/V7vmzjFWRbrzrwQdrrLQ+DJhW9SBVrQiGb742/C9vO
	 11i+Yth04wNm7hNJF9zCW+8R6LLb/STcbFZry6s3nkcpOeSxcuAkI0UUbYmN6vnY4v
	 f7MFzjTKJIyx2FkUKD7HzbOw42553tGNGM/HA1EM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1E26F805AC; Thu, 12 Oct 2023 21:19:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 13367F805A9;
	Thu, 12 Oct 2023 21:19:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1BA33F80578; Thu, 12 Oct 2023 21:19:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0630BF802E8
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 21:19:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0630BF802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=D1bYwiVx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697138357; x=1728674357;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=q5WLXoIBQW7WGaww7V805wk3LOohYxdLIZJQ5SFmGmA=;
  b=D1bYwiVxDDa8Mu1zTNdoZX5Up9tLF/3Ng4VsOKHFNyrPTMDqRTHK6t5W
   WWljXVtDQt3WP/2np5U70D8hJYWsfrQxUTANgUNDVv8HmS13QJfruT76g
   Jm5PA2mZgmn0tvF6j+fI++ZDn9XNMCUUTCUTtughW66x7kXskKHHA9d4Q
   m/85WSEi5PcLRywoQbEgJS59kln0dJRix2xvNDGM7C603dVLSgeOC9OpY
   oyxzUHKtDkzKDh0eDDb0PZLewaFA4Gb2412ZPiGtvHGgjTXI/sbNdi7KQ
   MQY1QNT99jsMUi8TxfSmv+ccXbPRRzol98XiWjlexq24VWvf9u9icGU6H
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="383875375"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="383875375"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:19:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="1001628022"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="1001628022"
Received: from gchoudha-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.hsd1.md.comcast.net) ([10.212.114.241])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:19:01 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Rander Wang <rander.wang@intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 4/4] ASoC: SOF: make .remove callback return void
Date: Thu, 12 Oct 2023 15:18:50 -0400
Message-Id: <20231012191850.147140-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012191850.147140-1-pierre-louis.bossart@linux.intel.com>
References: <20231012191850.147140-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7V32PUQVGBYQQNOVA4JRMBQSRM2L4EIQ
X-Message-ID-Hash: 7V32PUQVGBYQQNOVA4JRMBQSRM2L4EIQ
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7V32PUQVGBYQQNOVA4JRMBQSRM2L4EIQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We don't use the returned value and return 0 anyways, let's follow the
example of platform drivers and simplify the definitions.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/amd/acp.c                | 4 ++--
 sound/soc/sof/amd/acp.h                | 2 +-
 sound/soc/sof/imx/imx8.c               | 4 +---
 sound/soc/sof/imx/imx8m.c              | 4 +---
 sound/soc/sof/imx/imx8ulp.c            | 4 +---
 sound/soc/sof/intel/byt.c              | 4 +---
 sound/soc/sof/intel/hda.c              | 4 +---
 sound/soc/sof/intel/hda.h              | 2 +-
 sound/soc/sof/mediatek/mt8186/mt8186.c | 4 +---
 sound/soc/sof/mediatek/mt8195/mt8195.c | 4 +---
 sound/soc/sof/ops.h                    | 6 ++----
 sound/soc/sof/sof-priv.h               | 2 +-
 12 files changed, 14 insertions(+), 30 deletions(-)

diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index 19a801908b56..603ea5fc0d0d 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -575,7 +575,7 @@ int amd_sof_acp_probe(struct snd_sof_dev *sdev)
 }
 EXPORT_SYMBOL_NS(amd_sof_acp_probe, SND_SOC_SOF_AMD_COMMON);
 
-int amd_sof_acp_remove(struct snd_sof_dev *sdev)
+void amd_sof_acp_remove(struct snd_sof_dev *sdev)
 {
 	struct acp_dev_data *adata = sdev->pdata->hw_pdata;
 
@@ -588,7 +588,7 @@ int amd_sof_acp_remove(struct snd_sof_dev *sdev)
 	if (adata->dmic_dev)
 		platform_device_unregister(adata->dmic_dev);
 
-	return acp_reset(sdev);
+	acp_reset(sdev);
 }
 EXPORT_SYMBOL_NS(amd_sof_acp_remove, SND_SOC_SOF_AMD_COMMON);
 
diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
index 4dcceb764769..6814f2051104 100644
--- a/sound/soc/sof/amd/acp.h
+++ b/sound/soc/sof/amd/acp.h
@@ -220,7 +220,7 @@ int configure_and_run_sha_dma(struct acp_dev_data *adata, void *image_addr,
 
 /* ACP device probe/remove */
 int amd_sof_acp_probe(struct snd_sof_dev *sdev);
-int amd_sof_acp_remove(struct snd_sof_dev *sdev);
+void amd_sof_acp_remove(struct snd_sof_dev *sdev);
 
 /* DSP Loader callbacks */
 int acp_sof_dsp_run(struct snd_sof_dev *sdev);
diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index e375f29b21d1..170740bce839 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -338,7 +338,7 @@ static int imx8_probe(struct snd_sof_dev *sdev)
 	return ret;
 }
 
-static int imx8_remove(struct snd_sof_dev *sdev)
+static void imx8_remove(struct snd_sof_dev *sdev)
 {
 	struct imx8_priv *priv = sdev->pdata->hw_pdata;
 	int i;
@@ -350,8 +350,6 @@ static int imx8_remove(struct snd_sof_dev *sdev)
 		device_link_del(priv->link[i]);
 		dev_pm_domain_detach(priv->pd_dev[i], false);
 	}
-
-	return 0;
 }
 
 /* on i.MX8 there is 1 to 1 match between type and BAR idx */
diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
index 198a9cd74019..2680f061ba42 100644
--- a/sound/soc/sof/imx/imx8m.c
+++ b/sound/soc/sof/imx/imx8m.c
@@ -269,14 +269,12 @@ static int imx8m_probe(struct snd_sof_dev *sdev)
 	return ret;
 }
 
-static int imx8m_remove(struct snd_sof_dev *sdev)
+static void imx8m_remove(struct snd_sof_dev *sdev)
 {
 	struct imx8m_priv *priv = sdev->pdata->hw_pdata;
 
 	imx8_disable_clocks(sdev, priv->clks);
 	platform_device_unregister(priv->ipc_dev);
-
-	return 0;
 }
 
 /* on i.MX8 there is 1 to 1 match between type and BAR idx */
diff --git a/sound/soc/sof/imx/imx8ulp.c b/sound/soc/sof/imx/imx8ulp.c
index c04601965014..ca6edb85ff71 100644
--- a/sound/soc/sof/imx/imx8ulp.c
+++ b/sound/soc/sof/imx/imx8ulp.c
@@ -278,14 +278,12 @@ static int imx8ulp_probe(struct snd_sof_dev *sdev)
 	return ret;
 }
 
-static int imx8ulp_remove(struct snd_sof_dev *sdev)
+static void imx8ulp_remove(struct snd_sof_dev *sdev)
 {
 	struct imx8ulp_priv *priv = sdev->pdata->hw_pdata;
 
 	imx8_disable_clocks(sdev, priv->clks);
 	platform_device_unregister(priv->ipc_dev);
-
-	return 0;
 }
 
 /* on i.MX8 there is 1 to 1 match between type and BAR idx */
diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index 82ab4b0fabf3..373527b206d7 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -100,11 +100,9 @@ static int byt_resume(struct snd_sof_dev *sdev)
 	return 0;
 }
 
-static int byt_remove(struct snd_sof_dev *sdev)
+static void byt_remove(struct snd_sof_dev *sdev)
 {
 	byt_reset_dsp_disable_int(sdev);
-
-	return 0;
 }
 
 static int byt_acpi_probe(struct snd_sof_dev *sdev)
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index a1732af2b1be..29f4e043aade 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1317,7 +1317,7 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 	return ret;
 }
 
-int hda_dsp_remove(struct snd_sof_dev *sdev)
+void hda_dsp_remove(struct snd_sof_dev *sdev)
 {
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	const struct sof_intel_dsp_desc *chip = hda->desc;
@@ -1377,8 +1377,6 @@ int hda_dsp_remove(struct snd_sof_dev *sdev)
 	sof_hda_bus_exit(sdev);
 
 	hda_codec_i915_exit(sdev);
-
-	return 0;
 }
 
 int hda_power_down_dsp(struct snd_sof_dev *sdev)
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 7c575ba9462c..0ebc042c5ce1 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -577,7 +577,7 @@ struct sof_intel_hda_stream {
  * DSP Core services.
  */
 int hda_dsp_probe(struct snd_sof_dev *sdev);
-int hda_dsp_remove(struct snd_sof_dev *sdev);
+void hda_dsp_remove(struct snd_sof_dev *sdev);
 int hda_dsp_core_power_up(struct snd_sof_dev *sdev, unsigned int core_mask);
 int hda_dsp_core_run(struct snd_sof_dev *sdev, unsigned int core_mask);
 int hda_dsp_enable_core(struct snd_sof_dev *sdev, unsigned int core_mask);
diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index 3717fdeae3a6..b69fa788b16f 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -391,7 +391,7 @@ static int mt8186_dsp_probe(struct snd_sof_dev *sdev)
 	return ret;
 }
 
-static int mt8186_dsp_remove(struct snd_sof_dev *sdev)
+static void mt8186_dsp_remove(struct snd_sof_dev *sdev)
 {
 	struct adsp_priv *priv = sdev->pdata->hw_pdata;
 
@@ -399,8 +399,6 @@ static int mt8186_dsp_remove(struct snd_sof_dev *sdev)
 	mt8186_sof_hifixdsp_shutdown(sdev);
 	adsp_sram_power_off(sdev);
 	mt8186_adsp_clock_off(sdev);
-
-	return 0;
 }
 
 static int mt8186_dsp_shutdown(struct snd_sof_dev *sdev)
diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index b873e1534dd0..cac0a085f60a 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -388,7 +388,7 @@ static int mt8195_dsp_shutdown(struct snd_sof_dev *sdev)
 	return snd_sof_suspend(sdev->dev);
 }
 
-static int mt8195_dsp_remove(struct snd_sof_dev *sdev)
+static void mt8195_dsp_remove(struct snd_sof_dev *sdev)
 {
 	struct platform_device *pdev = container_of(sdev->dev, struct platform_device, dev);
 	struct adsp_priv *priv = sdev->pdata->hw_pdata;
@@ -396,8 +396,6 @@ static int mt8195_dsp_remove(struct snd_sof_dev *sdev)
 	platform_device_unregister(priv->ipc_dev);
 	adsp_sram_power_on(&pdev->dev, false);
 	adsp_clock_off(sdev);
-
-	return 0;
 }
 
 static int mt8195_dsp_suspend(struct snd_sof_dev *sdev, u32 target_state)
diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index a494bdef3739..5be1cf80bb42 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -43,12 +43,10 @@ static inline int snd_sof_probe(struct snd_sof_dev *sdev)
 	return sof_ops(sdev)->probe(sdev);
 }
 
-static inline int snd_sof_remove(struct snd_sof_dev *sdev)
+static inline void snd_sof_remove(struct snd_sof_dev *sdev)
 {
 	if (sof_ops(sdev)->remove)
-		return sof_ops(sdev)->remove(sdev);
-
-	return 0;
+		sof_ops(sdev)->remove(sdev);
 }
 
 static inline int snd_sof_shutdown(struct snd_sof_dev *sdev)
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index d4f6702e93dc..40bca5f80428 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -166,7 +166,7 @@ struct snd_sof_dsp_ops {
 
 	/* probe/remove/shutdown */
 	int (*probe)(struct snd_sof_dev *sof_dev); /* mandatory */
-	int (*remove)(struct snd_sof_dev *sof_dev); /* optional */
+	void (*remove)(struct snd_sof_dev *sof_dev); /* optional */
 	int (*shutdown)(struct snd_sof_dev *sof_dev); /* optional */
 
 	/* DSP core boot / reset */
-- 
2.39.2

