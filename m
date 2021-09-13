Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F55409855
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Sep 2021 18:05:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E0171719;
	Mon, 13 Sep 2021 18:04:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E0171719
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631549145;
	bh=Yy68pLIdOujivvdb5qcTluVWmDgm0ycHbadZTSjVoFQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pBAPRYX66bYu9NVpArq+uhzxNSxL19wF0sMPPCES1I/V6tz9Vy3xCA3zht+iJtMT5
	 Bur1uxbduO8bwIa64EO4t8nPBbwl2Sqi61sBUZzsUI42L+qtuq9iqaSqOhUij/+eoI
	 T9m1BBCBP96JQKpli+rLU3BIy/Ga3J3cMB9qlRK8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9C22F80520;
	Mon, 13 Sep 2021 18:02:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CA8EF804FB; Mon, 13 Sep 2021 18:01:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DED9F804E4
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 18:01:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DED9F804E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Z1vco6Hn"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18DFp9LC002377; 
 Mon, 13 Sep 2021 11:01:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=0AHconZbAZxez7UrWlvJ6FLsmn2f+B8NIFyjCTsyQoI=;
 b=Z1vco6Hn7U5zmwY/Ju8/CtC/ddF3D0l+xCc0ufyB0mygVdsgt82Nn7bqeX7btB6okEJ+
 z0BEH3GlB2lO+gkdITPEQMJwvSmqm+QkoQClffw8c3/pSdjfRCt068J9QaatoyBQkQbp
 3BIvv2avPaTf7hsw+QB4f8YYv/YRDQsrJ7+hYwB2UmsOYMbBu4Ed05XYcjMmTlZRHkxB
 VHoW3n/5VaK58uhWaQT6xTdlLEQAqXGTMD+MP6jeiuldl/nL024KbeqP8yk9FNgsfq1u
 O5v8w9lORahFDgGw+CfOEC6FuNif5Wd2Qzi8HHa12pyhR+09cdKJttFnihlYvERwIx/j Iw== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3b29n3r0ag-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 13 Sep 2021 11:01:25 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Mon, 13 Sep
 2021 17:01:20 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Mon, 13 Sep 2021 17:01:20 +0100
Received: from simont-vb.lan?044ad.cirrus.com (unknown [198.90.238.152])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 3FFBFB16;
 Mon, 13 Sep 2021 16:01:20 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH 08/16] ASoC: wm_adsp: Split DSP power operations into helper
 functions
Date: Mon, 13 Sep 2021 17:00:49 +0100
Message-ID: <20210913160057.103842-9-simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210913160057.103842-1-simont@opensource.cirrus.com>
References: <20210913160057.103842-1-simont@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 6flmPVs1Vr_a8yztf8Rfzuh6wV3xC_sJ
X-Proofpoint-ORIG-GUID: 6flmPVs1Vr_a8yztf8Rfzuh6wV3xC_sJ
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Simon Trimmer <simont@opensource.cirrus.com>, linux-kernel@vger.kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>
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

This is preparation for moving the generic DSP support out of
ASoC. This change separates the generic handling of power and state
transitions from the DAPM API wrapper.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 545 ++++++++++++++++++++-----------------
 1 file changed, 298 insertions(+), 247 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index c0ca46e04418..1bca3922a6b8 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -2808,6 +2808,108 @@ int wm_adsp1_init(struct wm_adsp *dsp)
 }
 EXPORT_SYMBOL_GPL(wm_adsp1_init);
 
+static int cs_dsp_adsp1_power_up(struct wm_adsp *dsp)
+{
+	unsigned int val;
+	int ret;
+
+	mutex_lock(&dsp->pwr_lock);
+
+	regmap_update_bits(dsp->regmap, dsp->base + ADSP1_CONTROL_30,
+			   ADSP1_SYS_ENA, ADSP1_SYS_ENA);
+
+	/*
+	 * For simplicity set the DSP clock rate to be the
+	 * SYSCLK rate rather than making it configurable.
+	 */
+	if (dsp->sysclk_reg) {
+		ret = regmap_read(dsp->regmap, dsp->sysclk_reg, &val);
+		if (ret != 0) {
+			cs_dsp_err(dsp, "Failed to read SYSCLK state: %d\n", ret);
+			goto err_mutex;
+		}
+
+		val = (val & dsp->sysclk_mask) >> dsp->sysclk_shift;
+
+		ret = regmap_update_bits(dsp->regmap,
+					 dsp->base + ADSP1_CONTROL_31,
+					 ADSP1_CLK_SEL_MASK, val);
+		if (ret != 0) {
+			cs_dsp_err(dsp, "Failed to set clock rate: %d\n", ret);
+			goto err_mutex;
+		}
+	}
+
+	ret = cs_dsp_load(dsp);
+	if (ret != 0)
+		goto err_ena;
+
+	ret = cs_dsp_adsp1_setup_algs(dsp);
+	if (ret != 0)
+		goto err_ena;
+
+	ret = cs_dsp_load_coeff(dsp);
+	if (ret != 0)
+		goto err_ena;
+
+	/* Initialize caches for enabled and unset controls */
+	ret = cs_dsp_coeff_init_control_caches(dsp);
+	if (ret != 0)
+		goto err_ena;
+
+	/* Sync set controls */
+	ret = cs_dsp_coeff_sync_controls(dsp);
+	if (ret != 0)
+		goto err_ena;
+
+	dsp->booted = true;
+
+	/* Start the core running */
+	regmap_update_bits(dsp->regmap, dsp->base + ADSP1_CONTROL_30,
+			   ADSP1_CORE_ENA | ADSP1_START,
+			   ADSP1_CORE_ENA | ADSP1_START);
+
+	dsp->running = true;
+
+	mutex_unlock(&dsp->pwr_lock);
+
+	return 0;
+
+err_ena:
+	regmap_update_bits(dsp->regmap, dsp->base + ADSP1_CONTROL_30,
+			   ADSP1_SYS_ENA, 0);
+err_mutex:
+	mutex_unlock(&dsp->pwr_lock);
+	return ret;
+}
+
+static void cs_dsp_adsp1_power_down(struct wm_adsp *dsp)
+{
+	struct wm_coeff_ctl *ctl;
+
+	mutex_lock(&dsp->pwr_lock);
+
+	dsp->running = false;
+	dsp->booted = false;
+
+	/* Halt the core */
+	regmap_update_bits(dsp->regmap, dsp->base + ADSP1_CONTROL_30,
+			   ADSP1_CORE_ENA | ADSP1_START, 0);
+
+	regmap_update_bits(dsp->regmap, dsp->base + ADSP1_CONTROL_19,
+			   ADSP1_WDMA_BUFFER_LENGTH_MASK, 0);
+
+	regmap_update_bits(dsp->regmap, dsp->base + ADSP1_CONTROL_30,
+			   ADSP1_SYS_ENA, 0);
+
+	list_for_each_entry(ctl, &dsp->ctl_list, list)
+		ctl->enabled = 0;
+
+	cs_dsp_free_alg_regions(dsp);
+
+	mutex_unlock(&dsp->pwr_lock);
+}
+
 int wm_adsp1_event(struct snd_soc_dapm_widget *w,
 		   struct snd_kcontrol *kcontrol,
 		   int event)
@@ -2815,108 +2917,21 @@ int wm_adsp1_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct wm_adsp *dsps = snd_soc_component_get_drvdata(component);
 	struct wm_adsp *dsp = &dsps[w->shift];
-	struct wm_coeff_ctl *ctl;
-	int ret;
-	unsigned int val;
+	int ret = 0;
 
 	dsp->component = component;
 
-	mutex_lock(&dsp->pwr_lock);
-
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
-		regmap_update_bits(dsp->regmap, dsp->base + ADSP1_CONTROL_30,
-				   ADSP1_SYS_ENA, ADSP1_SYS_ENA);
-
-		/*
-		 * For simplicity set the DSP clock rate to be the
-		 * SYSCLK rate rather than making it configurable.
-		 */
-		if (dsp->sysclk_reg) {
-			ret = regmap_read(dsp->regmap, dsp->sysclk_reg, &val);
-			if (ret != 0) {
-				cs_dsp_err(dsp, "Failed to read SYSCLK state: %d\n", ret);
-				goto err_mutex;
-			}
-
-			val = (val & dsp->sysclk_mask) >> dsp->sysclk_shift;
-
-			ret = regmap_update_bits(dsp->regmap,
-						 dsp->base + ADSP1_CONTROL_31,
-						 ADSP1_CLK_SEL_MASK, val);
-			if (ret != 0) {
-				cs_dsp_err(dsp, "Failed to set clock rate: %d\n", ret);
-				goto err_mutex;
-			}
-		}
-
-		ret = cs_dsp_load(dsp);
-		if (ret != 0)
-			goto err_ena;
-
-		ret = cs_dsp_adsp1_setup_algs(dsp);
-		if (ret != 0)
-			goto err_ena;
-
-		ret = cs_dsp_load_coeff(dsp);
-		if (ret != 0)
-			goto err_ena;
-
-		/* Initialize caches for enabled and unset controls */
-		ret = cs_dsp_coeff_init_control_caches(dsp);
-		if (ret != 0)
-			goto err_ena;
-
-		/* Sync set controls */
-		ret = cs_dsp_coeff_sync_controls(dsp);
-		if (ret != 0)
-			goto err_ena;
-
-		dsp->booted = true;
-
-		/* Start the core running */
-		regmap_update_bits(dsp->regmap, dsp->base + ADSP1_CONTROL_30,
-				   ADSP1_CORE_ENA | ADSP1_START,
-				   ADSP1_CORE_ENA | ADSP1_START);
-
-		dsp->running = true;
+		ret = cs_dsp_adsp1_power_up(dsp);
 		break;
-
 	case SND_SOC_DAPM_PRE_PMD:
-		dsp->running = false;
-		dsp->booted = false;
-
-		/* Halt the core */
-		regmap_update_bits(dsp->regmap, dsp->base + ADSP1_CONTROL_30,
-				   ADSP1_CORE_ENA | ADSP1_START, 0);
-
-		regmap_update_bits(dsp->regmap, dsp->base + ADSP1_CONTROL_19,
-				   ADSP1_WDMA_BUFFER_LENGTH_MASK, 0);
-
-		regmap_update_bits(dsp->regmap, dsp->base + ADSP1_CONTROL_30,
-				   ADSP1_SYS_ENA, 0);
-
-		list_for_each_entry(ctl, &dsp->ctl_list, list)
-			ctl->enabled = 0;
-
-
-		cs_dsp_free_alg_regions(dsp);
+		cs_dsp_adsp1_power_down(dsp);
 		break;
-
 	default:
 		break;
 	}
 
-	mutex_unlock(&dsp->pwr_lock);
-
-	return 0;
-
-err_ena:
-	regmap_update_bits(dsp->regmap, dsp->base + ADSP1_CONTROL_30,
-			   ADSP1_SYS_ENA, 0);
-err_mutex:
-	mutex_unlock(&dsp->pwr_lock);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(wm_adsp1_event);
@@ -3019,63 +3034,6 @@ static void cs_dsp_adsp2v2_disable_core(struct wm_adsp *dsp)
 	regmap_write(dsp->regmap, dsp->base + ADSP2V2_WDMA_CONFIG_2, 0);
 }
 
-static void wm_adsp_boot_work(struct work_struct *work)
-{
-	struct wm_adsp *dsp = container_of(work,
-					   struct wm_adsp,
-					   boot_work);
-	int ret;
-
-	mutex_lock(&dsp->pwr_lock);
-
-	if (dsp->ops->enable_memory) {
-		ret = dsp->ops->enable_memory(dsp);
-		if (ret != 0)
-			goto err_mutex;
-	}
-
-	if (dsp->ops->enable_core) {
-		ret = dsp->ops->enable_core(dsp);
-		if (ret != 0)
-			goto err_mem;
-	}
-
-	ret = cs_dsp_load(dsp);
-	if (ret != 0)
-		goto err_ena;
-
-	ret = dsp->ops->setup_algs(dsp);
-	if (ret != 0)
-		goto err_ena;
-
-	ret = cs_dsp_load_coeff(dsp);
-	if (ret != 0)
-		goto err_ena;
-
-	/* Initialize caches for enabled and unset controls */
-	ret = cs_dsp_coeff_init_control_caches(dsp);
-	if (ret != 0)
-		goto err_ena;
-
-	if (dsp->ops->disable_core)
-		dsp->ops->disable_core(dsp);
-
-	dsp->booted = true;
-
-	mutex_unlock(&dsp->pwr_lock);
-
-	return;
-
-err_ena:
-	if (dsp->ops->disable_core)
-		dsp->ops->disable_core(dsp);
-err_mem:
-	if (dsp->ops->disable_memory)
-		dsp->ops->disable_memory(dsp);
-err_mutex:
-	mutex_unlock(&dsp->pwr_lock);
-}
-
 static int cs_dsp_halo_configure_mpu(struct wm_adsp *dsp, unsigned int lock_regions)
 {
 	struct reg_sequence config[] = {
@@ -3185,39 +3143,108 @@ static void cs_dsp_halo_stop_watchdog(struct wm_adsp *dsp)
 			   HALO_WDT_EN_MASK, 0);
 }
 
+static void cs_dsp_power_up(struct wm_adsp *dsp)
+{
+	int ret;
+
+	mutex_lock(&dsp->pwr_lock);
+
+	if (dsp->ops->enable_memory) {
+		ret = dsp->ops->enable_memory(dsp);
+		if (ret != 0)
+			goto err_mutex;
+	}
+
+	if (dsp->ops->enable_core) {
+		ret = dsp->ops->enable_core(dsp);
+		if (ret != 0)
+			goto err_mem;
+	}
+
+	ret = cs_dsp_load(dsp);
+	if (ret != 0)
+		goto err_ena;
+
+	ret = dsp->ops->setup_algs(dsp);
+	if (ret != 0)
+		goto err_ena;
+
+	ret = cs_dsp_load_coeff(dsp);
+	if (ret != 0)
+		goto err_ena;
+
+	/* Initialize caches for enabled and unset controls */
+	ret = cs_dsp_coeff_init_control_caches(dsp);
+	if (ret != 0)
+		goto err_ena;
+
+	if (dsp->ops->disable_core)
+		dsp->ops->disable_core(dsp);
+
+	dsp->booted = true;
+
+	mutex_unlock(&dsp->pwr_lock);
+
+	return;
+
+err_ena:
+	if (dsp->ops->disable_core)
+		dsp->ops->disable_core(dsp);
+err_mem:
+	if (dsp->ops->disable_memory)
+		dsp->ops->disable_memory(dsp);
+err_mutex:
+	mutex_unlock(&dsp->pwr_lock);
+}
+
+static void cs_dsp_power_down(struct wm_adsp *dsp)
+{
+	struct wm_coeff_ctl *ctl;
+
+	mutex_lock(&dsp->pwr_lock);
+
+	cs_dsp_debugfs_clear(dsp);
+
+	dsp->fw_id = 0;
+	dsp->fw_id_version = 0;
+
+	dsp->booted = false;
+
+	if (dsp->ops->disable_memory)
+		dsp->ops->disable_memory(dsp);
+
+	list_for_each_entry(ctl, &dsp->ctl_list, list)
+		ctl->enabled = 0;
+
+	cs_dsp_free_alg_regions(dsp);
+
+	mutex_unlock(&dsp->pwr_lock);
+
+	cs_dsp_dbg(dsp, "Shutdown complete\n");
+}
+
+static void wm_adsp_boot_work(struct work_struct *work)
+{
+	struct wm_adsp *dsp = container_of(work,
+					   struct wm_adsp,
+					   boot_work);
+
+	cs_dsp_power_up(dsp);
+}
+
 int wm_adsp_early_event(struct snd_soc_dapm_widget *w,
 			struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct wm_adsp *dsps = snd_soc_component_get_drvdata(component);
 	struct wm_adsp *dsp = &dsps[w->shift];
-	struct wm_coeff_ctl *ctl;
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		queue_work(system_unbound_wq, &dsp->boot_work);
 		break;
 	case SND_SOC_DAPM_PRE_PMD:
-		mutex_lock(&dsp->pwr_lock);
-
-		cs_dsp_debugfs_clear(dsp);
-
-		dsp->fw_id = 0;
-		dsp->fw_id_version = 0;
-
-		dsp->booted = false;
-
-		if (dsp->ops->disable_memory)
-			dsp->ops->disable_memory(dsp);
-
-		list_for_each_entry(ctl, &dsp->ctl_list, list)
-			ctl->enabled = 0;
-
-		cs_dsp_free_alg_regions(dsp);
-
-		mutex_unlock(&dsp->pwr_lock);
-
-		cs_dsp_dbg(dsp, "Shutdown complete\n");
+		cs_dsp_power_down(dsp);
 		break;
 	default:
 		break;
@@ -3240,102 +3267,126 @@ static void cs_dsp_adsp2_stop_core(struct wm_adsp *dsp)
 			   ADSP2_CORE_ENA | ADSP2_START, 0);
 }
 
+static int wm_adsp_event_post_run(struct wm_adsp *dsp)
+{
+	if (wm_adsp_fw[dsp->fw].num_caps != 0)
+		return wm_adsp_buffer_init(dsp);
+
+	return 0;
+}
+
+static void wm_adsp_event_post_stop(struct wm_adsp *dsp)
+{
+	if (wm_adsp_fw[dsp->fw].num_caps != 0)
+		wm_adsp_buffer_free(dsp);
+
+	dsp->fatal_error = false;
+}
+
+static int cs_dsp_run(struct wm_adsp *dsp)
+{
+	int ret;
+
+	mutex_lock(&dsp->pwr_lock);
+
+	if (!dsp->booted) {
+		ret = -EIO;
+		goto err;
+	}
+
+	if (dsp->ops->enable_core) {
+		ret = dsp->ops->enable_core(dsp);
+		if (ret != 0)
+			goto err;
+	}
+
+	/* Sync set controls */
+	ret = cs_dsp_coeff_sync_controls(dsp);
+	if (ret != 0)
+		goto err;
+
+	if (dsp->ops->lock_memory) {
+		ret = dsp->ops->lock_memory(dsp, dsp->lock_regions);
+		if (ret != 0) {
+			cs_dsp_err(dsp, "Error configuring MPU: %d\n", ret);
+			goto err;
+		}
+	}
+
+	if (dsp->ops->start_core) {
+		ret = dsp->ops->start_core(dsp);
+		if (ret != 0)
+			goto err;
+	}
+
+	dsp->running = true;
+
+	ret = wm_adsp_event_post_run(dsp);
+	if (ret < 0)
+		goto err;
+
+	mutex_unlock(&dsp->pwr_lock);
+
+	return 0;
+
+err:
+	if (dsp->ops->stop_core)
+		dsp->ops->stop_core(dsp);
+	if (dsp->ops->disable_core)
+		dsp->ops->disable_core(dsp);
+	mutex_unlock(&dsp->pwr_lock);
+
+	return ret;
+}
+
+static void cs_dsp_stop(struct wm_adsp *dsp)
+{
+	/* Tell the firmware to cleanup */
+	cs_dsp_signal_event_controls(dsp, CS_DSP_FW_EVENT_SHUTDOWN);
+
+	if (dsp->ops->stop_watchdog)
+		dsp->ops->stop_watchdog(dsp);
+
+	/* Log firmware state, it can be useful for analysis */
+	if (dsp->ops->show_fw_status)
+		dsp->ops->show_fw_status(dsp);
+
+	mutex_lock(&dsp->pwr_lock);
+
+	dsp->running = false;
+
+	if (dsp->ops->stop_core)
+		dsp->ops->stop_core(dsp);
+	if (dsp->ops->disable_core)
+		dsp->ops->disable_core(dsp);
+
+	wm_adsp_event_post_stop(dsp);
+
+	mutex_unlock(&dsp->pwr_lock);
+
+	cs_dsp_dbg(dsp, "Execution stopped\n");
+}
+
 int wm_adsp_event(struct snd_soc_dapm_widget *w,
 		  struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct wm_adsp *dsps = snd_soc_component_get_drvdata(component);
 	struct wm_adsp *dsp = &dsps[w->shift];
-	int ret;
+	int ret = 0;
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
 		flush_work(&dsp->boot_work);
-
-		mutex_lock(&dsp->pwr_lock);
-
-		if (!dsp->booted) {
-			ret = -EIO;
-			goto err;
-		}
-
-		if (dsp->ops->enable_core) {
-			ret = dsp->ops->enable_core(dsp);
-			if (ret != 0)
-				goto err;
-		}
-
-		/* Sync set controls */
-		ret = cs_dsp_coeff_sync_controls(dsp);
-		if (ret != 0)
-			goto err;
-
-		if (dsp->ops->lock_memory) {
-			ret = dsp->ops->lock_memory(dsp, dsp->lock_regions);
-			if (ret != 0) {
-				cs_dsp_err(dsp, "Error configuring MPU: %d\n", ret);
-				goto err;
-			}
-		}
-
-		if (dsp->ops->start_core) {
-			ret = dsp->ops->start_core(dsp);
-			if (ret != 0)
-				goto err;
-		}
-
-		dsp->running = true;
-
-		if (wm_adsp_fw[dsp->fw].num_caps != 0) {
-			ret = wm_adsp_buffer_init(dsp);
-			if (ret < 0)
-				goto err;
-		}
-
-		mutex_unlock(&dsp->pwr_lock);
+		ret = cs_dsp_run(dsp);
 		break;
-
 	case SND_SOC_DAPM_PRE_PMD:
-		/* Tell the firmware to cleanup */
-		cs_dsp_signal_event_controls(dsp, CS_DSP_FW_EVENT_SHUTDOWN);
-
-		if (dsp->ops->stop_watchdog)
-			dsp->ops->stop_watchdog(dsp);
-
-		/* Log firmware state, it can be useful for analysis */
-		if (dsp->ops->show_fw_status)
-			dsp->ops->show_fw_status(dsp);
-
-		mutex_lock(&dsp->pwr_lock);
-
-		dsp->running = false;
-
-		if (dsp->ops->stop_core)
-			dsp->ops->stop_core(dsp);
-		if (dsp->ops->disable_core)
-			dsp->ops->disable_core(dsp);
-
-		if (wm_adsp_fw[dsp->fw].num_caps != 0)
-			wm_adsp_buffer_free(dsp);
-
-		dsp->fatal_error = false;
-
-		mutex_unlock(&dsp->pwr_lock);
-
-		cs_dsp_dbg(dsp, "Execution stopped\n");
+		cs_dsp_stop(dsp);
 		break;
-
 	default:
 		break;
 	}
 
-	return 0;
-err:
-	if (dsp->ops->stop_core)
-		dsp->ops->stop_core(dsp);
-	if (dsp->ops->disable_core)
-		dsp->ops->disable_core(dsp);
-	mutex_unlock(&dsp->pwr_lock);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(wm_adsp_event);
-- 
2.33.0

