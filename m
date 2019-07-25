Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E62F375448
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2019 18:41:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 545CB1EDC;
	Thu, 25 Jul 2019 18:40:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 545CB1EDC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564072889;
	bh=MWBDh6Yd8ZIB3rwCHzkuprwkNKWBFvZHr8+HXGYDadM=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=a+oKMU7EK1Mp9MqZpVGaWXjXa5KyUEwZn4f5DK/G+DO8l++/p0NbKTmhA+ovW1FXU
	 n0jjp9bNh2qUqzCcVmqTjzaPo+TgRajGqz8GFpy9WnVMmTKVhdMB7KYZEjhQtk/wH5
	 ots0UMNy3PqboRoQna7wwGvt0vS/F90uGmvgvh8o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26E4FF800E8;
	Thu, 25 Jul 2019 18:39:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA52BF80448; Thu, 25 Jul 2019 18:39:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B67F6F800F5
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 18:39:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B67F6F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="W8ade1lx"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x6PFwJsh020615; Thu, 25 Jul 2019 11:39:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type;
 s=PODMain02222019; bh=puyJVjJLXQkoulvbNut1CYAdsVVnKX3LHMGsZRHXE+o=;
 b=W8ade1lxtT/quw9Bk7PDuhd9ORQneCCwaMGljLXUhtIstIIuCqZhiag+GiDR/QFcPfjY
 WxD13/QPhca5EcqIJ60QK4q+NGremqO0L299jqeuybzBxhZcyzJTey2QfWwbIoao6t2b
 cOpU/Q5gOgbYu5XBikCrDc0aJ9kIN4rsoLPHRCkjOt+SLAH2GlCJ4JwolOHElKVADfV3
 rTCWaKKGmF7V1f0/C9FkcwVGa63FFRZngwF95RIba/ajA2QGwidYRNt1j5H2yiatQHAU
 ix1k3idquP/LMOJBEwyA4XCfttXnrvxuiCPtDV2Utlg4xZlfwfFgdtKxArV/rKxrcRIU VQ== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 2tx61nkefv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 25 Jul 2019 11:39:33 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 25 Jul
 2019 17:39:31 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Thu, 25 Jul 2019 17:39:31 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A040245;
 Thu, 25 Jul 2019 17:39:31 +0100 (BST)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Date: Thu, 25 Jul 2019 17:39:29 +0100
Message-ID: <20190725163931.24964-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 mlxscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=1
 malwarescore=0 lowpriorityscore=0 mlxlogscore=708 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1906280000
 definitions=main-1907250188
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com
Subject: [alsa-devel] [PATCH 1/3] ASoC: wm_adsp: Allow bus error handler to
	be called directly
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

There is no need for end drivers to add helper functions to allow the
bus error handler to be called, simply update the prototype so it can be
called directly.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs47l90.c | 9 +--------
 sound/soc/codecs/wm_adsp.c | 6 ++++--
 sound/soc/codecs/wm_adsp.h | 4 ++--
 3 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/cs47l90.c b/sound/soc/codecs/cs47l90.c
index c4ecb0e6911af..67cac60a859dd 100644
--- a/sound/soc/codecs/cs47l90.c
+++ b/sound/soc/codecs/cs47l90.c
@@ -2402,13 +2402,6 @@ static irqreturn_t cs47l90_adsp2_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static irqreturn_t cs47l90_dsp_bus_error(int irq, void *data)
-{
-	struct wm_adsp *dsp = (struct wm_adsp *)data;
-
-	return wm_adsp2_bus_error(dsp);
-}
-
 static int cs47l90_component_probe(struct snd_soc_component *component)
 {
 	struct cs47l90 *cs47l90 = snd_soc_component_get_drvdata(component);
@@ -2558,7 +2551,7 @@ static int cs47l90_probe(struct platform_device *pdev)
 
 		if (ret == 0) {
 			ret = madera_init_bus_error_irq(&cs47l90->core, i,
-							cs47l90_dsp_bus_error);
+							wm_adsp2_bus_error);
 			if (ret != 0)
 				wm_adsp2_remove(&cs47l90->core.adsp[i]);
 		}
diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index f5fbadc5e7e25..ae28d9907c30f 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -4242,8 +4242,9 @@ static void wm_adsp_fatal_error(struct wm_adsp *dsp)
 	}
 }
 
-irqreturn_t wm_adsp2_bus_error(struct wm_adsp *dsp)
+irqreturn_t wm_adsp2_bus_error(int irq, void *data)
 {
+	struct wm_adsp *dsp = (struct wm_adsp *)data;
 	unsigned int val;
 	struct regmap *regmap = dsp->regmap;
 	int ret = 0;
@@ -4307,8 +4308,9 @@ irqreturn_t wm_adsp2_bus_error(struct wm_adsp *dsp)
 }
 EXPORT_SYMBOL_GPL(wm_adsp2_bus_error);
 
-irqreturn_t wm_halo_bus_error(struct wm_adsp *dsp)
+irqreturn_t wm_halo_bus_error(int irq, void *data)
 {
+	struct wm_adsp *dsp = (struct wm_adsp *)data;
 	struct regmap *regmap = dsp->regmap;
 	unsigned int fault[6];
 	struct reg_sequence clear[] = {
diff --git a/sound/soc/codecs/wm_adsp.h b/sound/soc/codecs/wm_adsp.h
index 3b03d1eb986f0..aa634ef6c9f51 100644
--- a/sound/soc/codecs/wm_adsp.h
+++ b/sound/soc/codecs/wm_adsp.h
@@ -171,8 +171,8 @@ int wm_adsp1_event(struct snd_soc_dapm_widget *w,
 int wm_adsp_early_event(struct snd_soc_dapm_widget *w,
 			struct snd_kcontrol *kcontrol, int event);
 
-irqreturn_t wm_adsp2_bus_error(struct wm_adsp *adsp);
-irqreturn_t wm_halo_bus_error(struct wm_adsp *dsp);
+irqreturn_t wm_adsp2_bus_error(int irq, void *data);
+irqreturn_t wm_halo_bus_error(int irq, void *data);
 irqreturn_t wm_halo_wdt_expire(int irq, void *data);
 
 int wm_adsp_event(struct snd_soc_dapm_widget *w,
-- 
2.11.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
