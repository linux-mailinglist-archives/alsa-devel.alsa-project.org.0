Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 790CB409858
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Sep 2021 18:06:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C6001733;
	Mon, 13 Sep 2021 18:05:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C6001733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631549170;
	bh=WghWNjJLIITRAptmjEXOBmYZ6hsjLeybOdnqnKedeFU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u2J2SlUVytozstEuCfFAEzjiSuWYsoz3ojL2YnI7Do/x1CcOX0sCiP3jL8Bwt1tpI
	 WTd12Pt/nRKfyiD0wAiyGrNVUmBwWD3MNol0WLcKIZ/tifczLFBQuC4VKaVLMPhfM1
	 Dcc29a3SYCFDD4WXWsStIy24EO5n4IbCnj/rsM7c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C494F804AB;
	Mon, 13 Sep 2021 18:02:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F088FF804E4; Mon, 13 Sep 2021 18:01:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46540F80169
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 18:01:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46540F80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="LuIO1MC7"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18DFp9LB002377; 
 Mon, 13 Sep 2021 11:01:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=wdFVgjB00yCsr89iLWeYOrzzdD9y1E57vzDVzvvoFPg=;
 b=LuIO1MC7803TOJyM2fnOgQ5JWqShJoDDhiSbwr6ytiO05JqaTZh3zZO35xC/buTrhUSX
 yjZrhOFWgFWrNxFWr4DTUKwHNAIU94FxuFauS0WYtiR3RacXihAVVlC0WESlWY0AbL31
 jecPwv7sNS8h9QsS6/YazDAVPf/Aq8Jl2gkAWj0uOEZ4LhPpanTsBHPb3YvUe1qqQEsR
 hxeN9oK3a1talCIUkvwJZmZ3C6+7edlYBKl63cj1FXVN0fn1yZfeH4KbubZtOmTPKnpk
 1S8c1O5cf2jrq+CejTO2k6Q4f0bvjCDle2wHCIGr4T29TwMUHAYn/3oz4RAHY7y5z/Yg tw== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3b29n3r0ag-5
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
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 003D52A9;
 Mon, 13 Sep 2021 16:01:19 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH 07/16] ASoC: wm_adsp: Separate some ASoC and generic functions
Date: Mon, 13 Sep 2021 17:00:48 +0100
Message-ID: <20210913160057.103842-8-simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210913160057.103842-1-simont@opensource.cirrus.com>
References: <20210913160057.103842-1-simont@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: GoXiE9DU6lirj1rPHPCnN_UhdQwXCQdK
X-Proofpoint-ORIG-GUID: GoXiE9DU6lirj1rPHPCnN_UhdQwXCQdK
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

Split some functions into ASoC and generic portions so that existing
interfaces can be retained whilst allowing the implementation to be
moved out of ASoC.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 109 ++++++++++++++++++++++++++-----------
 1 file changed, 76 insertions(+), 33 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index cfa8f1476c00..c0ca46e04418 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -2771,7 +2771,7 @@ static int cs_dsp_create_name(struct wm_adsp *dsp)
 	return 0;
 }
 
-static int wm_adsp_common_init(struct wm_adsp *dsp)
+static int cs_dsp_common_init(struct wm_adsp *dsp)
 {
 	int ret;
 
@@ -2781,19 +2781,30 @@ static int wm_adsp_common_init(struct wm_adsp *dsp)
 
 	INIT_LIST_HEAD(&dsp->alg_regions);
 	INIT_LIST_HEAD(&dsp->ctl_list);
+
+	mutex_init(&dsp->pwr_lock);
+
+	return 0;
+}
+
+static void wm_adsp_common_init(struct wm_adsp *dsp)
+{
 	INIT_LIST_HEAD(&dsp->compr_list);
 	INIT_LIST_HEAD(&dsp->buffer_list);
-
-	mutex_init(&dsp->pwr_lock);
-
-	return 0;
 }
 
-int wm_adsp1_init(struct wm_adsp *dsp)
+static int cs_dsp_adsp1_init(struct wm_adsp *dsp)
 {
 	dsp->ops = &cs_dsp_adsp1_ops;
 
-	return wm_adsp_common_init(dsp);
+	return cs_dsp_common_init(dsp);
+}
+
+int wm_adsp1_init(struct wm_adsp *dsp)
+{
+	wm_adsp_common_init(dsp);
+
+	return cs_dsp_adsp1_init(dsp);
 }
 EXPORT_SYMBOL_GPL(wm_adsp1_init);
 
@@ -3096,11 +3107,8 @@ static int cs_dsp_halo_configure_mpu(struct wm_adsp *dsp, unsigned int lock_regi
 	return regmap_multi_reg_write(dsp->regmap, config, ARRAY_SIZE(config));
 }
 
-int wm_adsp2_set_dspclk(struct snd_soc_dapm_widget *w, unsigned int freq)
+static int cs_dsp_set_dspclk(struct wm_adsp *dsp, unsigned int freq)
 {
-	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
-	struct wm_adsp *dsps = snd_soc_component_get_drvdata(component);
-	struct wm_adsp *dsp = &dsps[w->shift];
 	int ret;
 
 	ret = regmap_update_bits(dsp->regmap, dsp->base + ADSP2_CLOCKING,
@@ -3111,6 +3119,15 @@ int wm_adsp2_set_dspclk(struct snd_soc_dapm_widget *w, unsigned int freq)
 
 	return ret;
 }
+
+int wm_adsp2_set_dspclk(struct snd_soc_dapm_widget *w, unsigned int freq)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct wm_adsp *dsps = snd_soc_component_get_drvdata(component);
+	struct wm_adsp *dsp = &dsps[w->shift];
+
+	return cs_dsp_set_dspclk(dsp, freq);
+}
 EXPORT_SYMBOL_GPL(wm_adsp2_set_dspclk);
 
 int wm_adsp2_preloader_get(struct snd_kcontrol *kcontrol,
@@ -3364,14 +3381,10 @@ int wm_adsp2_component_remove(struct wm_adsp *dsp, struct snd_soc_component *com
 }
 EXPORT_SYMBOL_GPL(wm_adsp2_component_remove);
 
-int wm_adsp2_init(struct wm_adsp *dsp)
+static int cs_dsp_adsp2_init(struct wm_adsp *dsp)
 {
 	int ret;
 
-	ret = wm_adsp_common_init(dsp);
-	if (ret)
-		return ret;
-
 	switch (dsp->rev) {
 	case 0:
 		/*
@@ -3396,29 +3409,37 @@ int wm_adsp2_init(struct wm_adsp *dsp)
 		break;
 	}
 
+	return cs_dsp_common_init(dsp);
+}
+
+int wm_adsp2_init(struct wm_adsp *dsp)
+{
 	INIT_WORK(&dsp->boot_work, wm_adsp_boot_work);
 
-	return 0;
+	wm_adsp_common_init(dsp);
+
+	return cs_dsp_adsp2_init(dsp);
 }
 EXPORT_SYMBOL_GPL(wm_adsp2_init);
 
-int wm_halo_init(struct wm_adsp *dsp)
+static int cs_dsp_halo_init(struct wm_adsp *dsp)
 {
-	int ret;
-
-	ret = wm_adsp_common_init(dsp);
-	if (ret)
-		return ret;
-
 	dsp->ops = &cs_dsp_halo_ops;
 
+	return cs_dsp_common_init(dsp);
+}
+
+int wm_halo_init(struct wm_adsp *dsp)
+{
 	INIT_WORK(&dsp->boot_work, wm_adsp_boot_work);
 
-	return 0;
+	wm_adsp_common_init(dsp);
+
+	return cs_dsp_halo_init(dsp);
 }
 EXPORT_SYMBOL_GPL(wm_halo_init);
 
-void wm_adsp2_remove(struct wm_adsp *dsp)
+static void cs_dsp_remove(struct wm_adsp *dsp)
 {
 	struct wm_coeff_ctl *ctl;
 
@@ -3429,6 +3450,11 @@ void wm_adsp2_remove(struct wm_adsp *dsp)
 		cs_dsp_free_ctl_blk(ctl);
 	}
 }
+
+void wm_adsp2_remove(struct wm_adsp *dsp)
+{
+	cs_dsp_remove(dsp);
+}
 EXPORT_SYMBOL_GPL(wm_adsp2_remove);
 
 static inline int wm_adsp_compr_attached(struct wm_adsp_compr *compr)
@@ -4346,9 +4372,8 @@ static void wm_adsp_fatal_error(struct wm_adsp *dsp)
 	}
 }
 
-irqreturn_t wm_adsp2_bus_error(int irq, void *data)
+static void cs_dsp_adsp2_bus_error(struct wm_adsp *dsp)
 {
-	struct wm_adsp *dsp = (struct wm_adsp *)data;
 	unsigned int val;
 	struct regmap *regmap = dsp->regmap;
 	int ret = 0;
@@ -4407,14 +4432,20 @@ irqreturn_t wm_adsp2_bus_error(int irq, void *data)
 
 error:
 	mutex_unlock(&dsp->pwr_lock);
+}
+
+irqreturn_t wm_adsp2_bus_error(int irq, void *data)
+{
+	struct wm_adsp *dsp = (struct wm_adsp *)data;
+
+	cs_dsp_adsp2_bus_error(dsp);
 
 	return IRQ_HANDLED;
 }
 EXPORT_SYMBOL_GPL(wm_adsp2_bus_error);
 
-irqreturn_t wm_halo_bus_error(int irq, void *data)
+static void cs_dsp_halo_bus_error(struct wm_adsp *dsp)
 {
-	struct wm_adsp *dsp = (struct wm_adsp *)data;
 	struct regmap *regmap = dsp->regmap;
 	unsigned int fault[6];
 	struct reg_sequence clear[] = {
@@ -4464,15 +4495,20 @@ irqreturn_t wm_halo_bus_error(int irq, void *data)
 
 exit_unlock:
 	mutex_unlock(&dsp->pwr_lock);
+}
+
+irqreturn_t wm_halo_bus_error(int irq, void *data)
+{
+	struct wm_adsp *dsp = (struct wm_adsp *)data;
+
+	cs_dsp_halo_bus_error(dsp);
 
 	return IRQ_HANDLED;
 }
 EXPORT_SYMBOL_GPL(wm_halo_bus_error);
 
-irqreturn_t wm_halo_wdt_expire(int irq, void *data)
+static void cs_dsp_halo_wdt_expire(struct wm_adsp *dsp)
 {
-	struct wm_adsp *dsp = data;
-
 	mutex_lock(&dsp->pwr_lock);
 
 	cs_dsp_warn(dsp, "WDT Expiry Fault\n");
@@ -4481,6 +4517,13 @@ irqreturn_t wm_halo_wdt_expire(int irq, void *data)
 	wm_adsp_fatal_error(dsp);
 
 	mutex_unlock(&dsp->pwr_lock);
+}
+
+irqreturn_t wm_halo_wdt_expire(int irq, void *data)
+{
+	struct wm_adsp *dsp = data;
+
+	cs_dsp_halo_wdt_expire(dsp);
 
 	return IRQ_HANDLED;
 }
-- 
2.33.0

