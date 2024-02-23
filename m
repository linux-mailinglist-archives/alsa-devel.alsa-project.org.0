Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 225D886160B
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Feb 2024 16:40:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F287828;
	Fri, 23 Feb 2024 16:40:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F287828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708702836;
	bh=OKdQJCFhAqqpbWVPBGX0dPyvOIVA2y3RPVYZ2iQ4DF8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JZjSnZVOcvs7+dNx6TZikc7yWTOX5touK+TdJ0sJdfITKhLdz+atjSa3itL6SOAzj
	 kQa2H6y4CUYUqCsQ3AL7kp8N6YlRMFan1UE1/EtCsks8wAC+TnYHj+Cd5dqqjt5pBa
	 muEQ9kB1O9WnSBPk+seHCAFqiXGX+6Spp0T2DFb0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04FABF805EA; Fri, 23 Feb 2024 16:39:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 213E4F805EA;
	Fri, 23 Feb 2024 16:39:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A5E9F80496; Fri, 23 Feb 2024 16:39:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 69EB3F80104
	for <alsa-devel@alsa-project.org>; Fri, 23 Feb 2024 16:39:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69EB3F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=R4ITCF05
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41N8gUBT005505;
	Fri, 23 Feb 2024 09:39:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=LAKmFjKtKhPNxrQSxKAdVi250lMdkTuizyIqCUftZ3M=; b=
	R4ITCF05QtPO7pRl+w9TMFyOjNN+svra9CtJZWMMpKdInp4+k4MkAyRHAOm9gRRl
	lkck96bIEp36BU0NJccCZLxqcQKN/1bJzB45D2aqNCqLiP56p62WkN5sMnFl3O2C
	/vR3LpkJXllZIC3I9EGev5ieE0su/2Fv01xHf4m1v4VkLlf8sqgvKCCg860lsFOP
	0NVewGGRugd5J+5o46TxhkuT8nvel/WNzp6T9xkLU/DwRhG7KwKqOQo+3Y4mrqOe
	2duUkjjn0331uH7ELkUXjX9upzOud964X5PqQDrxcVE/XLvhwvxlbgbncfEJU6mR
	6DSbSsT9w4TGJY+3mUayMQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3wd205m5pe-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Feb 2024 09:39:13 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 23 Feb
 2024 15:39:10 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Fri, 23 Feb 2024 15:39:10 +0000
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 6799D82024B;
	Fri, 23 Feb 2024 15:39:10 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>
Subject: [PATCH v2 1/6] ASoC: wm_adsp: Add wm_adsp_start() and wm_adsp_stop()
Date: Fri, 23 Feb 2024 15:39:05 +0000
Message-ID: <20240223153910.2063698-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240223153910.2063698-1-rf@opensource.cirrus.com>
References: <20240223153910.2063698-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: nUbU09Aytq7CW1IUBSvrxt0qntPr0FIe
X-Proofpoint-GUID: nUbU09Aytq7CW1IUBSvrxt0qntPr0FIe
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: H7GSKCEB7U6WZO7WCUZVWVXOKAM4ZJJN
X-Message-ID-Hash: H7GSKCEB7U6WZO7WCUZVWVXOKAM4ZJJN
X-MailFrom: prvs=97835e8ec7=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H7GSKCEB7U6WZO7WCUZVWVXOKAM4ZJJN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Separate the functionality of wm_adsp_event() into two exported
functions wm_adsp_start() and wm_adsp_stop().

This allows the codec driver to start and stop the DSP outside of a
DAPM widget.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 27 ++++++++++++++++++---------
 sound/soc/codecs/wm_adsp.h |  2 ++
 2 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 36ea0dcdc7ab..e451c009f2d9 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -1092,27 +1092,36 @@ static void wm_adsp_event_post_stop(struct cs_dsp *cs_dsp)
 	dsp->fatal_error = false;
 }
 
+int wm_adsp_run(struct wm_adsp *dsp)
+{
+	flush_work(&dsp->boot_work);
+
+	return cs_dsp_run(&dsp->cs_dsp);
+}
+EXPORT_SYMBOL_GPL(wm_adsp_run);
+
+void wm_adsp_stop(struct wm_adsp *dsp)
+{
+	cs_dsp_stop(&dsp->cs_dsp);
+}
+EXPORT_SYMBOL_GPL(wm_adsp_stop);
+
 int wm_adsp_event(struct snd_soc_dapm_widget *w,
 		  struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct wm_adsp *dsps = snd_soc_component_get_drvdata(component);
 	struct wm_adsp *dsp = &dsps[w->shift];
-	int ret = 0;
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
-		flush_work(&dsp->boot_work);
-		ret = cs_dsp_run(&dsp->cs_dsp);
-		break;
+		return wm_adsp_run(dsp);
 	case SND_SOC_DAPM_PRE_PMD:
-		cs_dsp_stop(&dsp->cs_dsp);
-		break;
+		wm_adsp_stop(dsp);
+		return 0;
 	default:
-		break;
+		return 0;
 	}
-
-	return ret;
 }
 EXPORT_SYMBOL_GPL(wm_adsp_event);
 
diff --git a/sound/soc/codecs/wm_adsp.h b/sound/soc/codecs/wm_adsp.h
index 067d807a7ca8..e53dfcf1f78f 100644
--- a/sound/soc/codecs/wm_adsp.h
+++ b/sound/soc/codecs/wm_adsp.h
@@ -98,6 +98,8 @@ irqreturn_t wm_adsp2_bus_error(int irq, void *data);
 irqreturn_t wm_halo_bus_error(int irq, void *data);
 irqreturn_t wm_halo_wdt_expire(int irq, void *data);
 
+int wm_adsp_run(struct wm_adsp *dsp);
+void wm_adsp_stop(struct wm_adsp *dsp);
 int wm_adsp_event(struct snd_soc_dapm_widget *w,
 		  struct snd_kcontrol *kcontrol, int event);
 
-- 
2.30.2

