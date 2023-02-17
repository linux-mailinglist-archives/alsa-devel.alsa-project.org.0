Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0249969B070
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Feb 2023 17:17:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EC8DF97;
	Fri, 17 Feb 2023 17:16:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EC8DF97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676650622;
	bh=/iYpVVZFChNHg/kZPDEuTHqKmns60d2q0qK47y/KBEU=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=litiBhnHIwGfm+bR20WQ1frCa2CvQAdZh/o6O0zqpOWbXAeo78fBTNeKr75KkKRjQ
	 6hXxaZSdNHiHnxDxJ75otrm/azZrWDZo090SrX1tb2iB4NhGZ5r5RJ3m/53r/AR9/h
	 r+idEjqtdQ3yUqEHB9XqCLNT753+s8Fo58Xl+raw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A58CF80552;
	Fri, 17 Feb 2023 17:14:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2751F80534; Fri, 17 Feb 2023 17:14:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 60BFEF80496
	for <alsa-devel@alsa-project.org>; Fri, 17 Feb 2023 17:14:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60BFEF80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=h+/92DbX
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31HFh1JN028722;
	Fri, 17 Feb 2023 10:14:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=uFBC8RrDMvweaYvhR9SIiEznOkshqG+7URIf1J9cblY=;
 b=h+/92DbXWXznSvOt3wq8s+mQwPxInTjKchMcoASO29y4V9K3m0+zWH3OCYIhhDUbR09P
 67fbHPs5NmMnUqFLuonq/ANVNdvr4zEDZOAoXM/nRby2iyiKozmm77apErDr6D+/aIfH
 2TD2uZ2MsnnsJ8z0MWi0SxqEWG295r2AuMeLWJWMS2B0b9zA632VT5NQkaJ7fXOw05ex
 gZqWbJbiDQ/1zVPk+QCrNtwfI4LQp+mij1RM+ZnsscRRl42T34b6m1IVK/pUE8fant5W
 7066rRUqtzWnvU171awu5wGMt1EjYUBPi9lsvVsYhvMxBpNRGyqIwL1YNKawJpsJCCh0 LA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3nt1btgsph-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Feb 2023 10:14:13 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.21; Fri, 17 Feb
 2023 10:14:10 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.21 via Frontend
 Transport; Fri, 17 Feb 2023 10:14:10 -0600
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 82E2C45;
	Fri, 17 Feb 2023 16:14:10 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
        <cezary.rojewski@intel.com>, <peter.ujfalusi@linux.intel.com>,
        <yung-chuan.liao@linux.intel.com>, <kai.vehmanen@linux.intel.com>
Subject: [PATCH 05/10] ASoC: wm_adsp: Expose the DSP boot work actions as
 wm_adsp_power_up()
Date: Fri, 17 Feb 2023 16:14:05 +0000
Message-ID: <20230217161410.915202-6-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230217161410.915202-1-rf@opensource.cirrus.com>
References: <20230217161410.915202-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: RG7P-JmcHNI6CJLGP3WPDr-j2beVBUOF
X-Proofpoint-GUID: RG7P-JmcHNI6CJLGP3WPDr-j2beVBUOF
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: AM2PLAOSWZFIIRPXNCZFW6G775IVLI6U
X-Message-ID-Hash: AM2PLAOSWZFIIRPXNCZFW6G775IVLI6U
X-MailFrom: prvs=74127981b7=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Simon Trimmer <simont@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AM2PLAOSWZFIIRPXNCZFW6G775IVLI6U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Simon Trimmer <simont@opensource.cirrus.com>

To support self-booting DSPs that are considered always running, the work
that is usually invoked as part of a DAPM sequence needs to be triggered
by a client of wm_adsp as part of it's startup sequence.

These actions load firmware files that might create ALSA controls and
apply configuration to the device.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 27 ++++++++++++++++++---------
 sound/soc/codecs/wm_adsp.h |  2 ++
 2 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 8176b6173de9..d4bffa2f7005 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -998,11 +998,8 @@ int wm_adsp2_preloader_put(struct snd_kcontrol *kcontrol,
 }
 EXPORT_SYMBOL_GPL(wm_adsp2_preloader_put);
 
-static void wm_adsp_boot_work(struct work_struct *work)
+int wm_adsp_power_up(struct wm_adsp *dsp)
 {
-	struct wm_adsp *dsp = container_of(work,
-					   struct wm_adsp,
-					   boot_work);
 	int ret = 0;
 	char *wmfw_filename = NULL;
 	const struct firmware *wmfw_firmware = NULL;
@@ -1013,16 +1010,28 @@ static void wm_adsp_boot_work(struct work_struct *work)
 					     &wmfw_firmware, &wmfw_filename,
 					     &coeff_firmware, &coeff_filename);
 	if (ret)
-		return;
+		return ret;
 
-	cs_dsp_power_up(&dsp->cs_dsp,
-			wmfw_firmware, wmfw_filename,
-			coeff_firmware, coeff_filename,
-			wm_adsp_fw_text[dsp->fw]);
+	ret = cs_dsp_power_up(&dsp->cs_dsp,
+			      wmfw_firmware, wmfw_filename,
+			      coeff_firmware, coeff_filename,
+			      wm_adsp_fw_text[dsp->fw]);
 
 	wm_adsp_release_firmware_files(dsp,
 				       wmfw_firmware, wmfw_filename,
 				       coeff_firmware, coeff_filename);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(wm_adsp_power_up);
+
+static void wm_adsp_boot_work(struct work_struct *work)
+{
+	struct wm_adsp *dsp = container_of(work,
+					   struct wm_adsp,
+					   boot_work);
+
+	wm_adsp_power_up(dsp);
 }
 
 int wm_adsp_early_event(struct snd_soc_dapm_widget *w,
diff --git a/sound/soc/codecs/wm_adsp.h b/sound/soc/codecs/wm_adsp.h
index 173dcae2c260..769904d34a87 100644
--- a/sound/soc/codecs/wm_adsp.h
+++ b/sound/soc/codecs/wm_adsp.h
@@ -91,6 +91,8 @@ int wm_adsp1_event(struct snd_soc_dapm_widget *w,
 int wm_adsp_early_event(struct snd_soc_dapm_widget *w,
 			struct snd_kcontrol *kcontrol, int event);
 
+int wm_adsp_power_up(struct wm_adsp *dsp);
+
 irqreturn_t wm_adsp2_bus_error(int irq, void *data);
 irqreturn_t wm_halo_bus_error(int irq, void *data);
 irqreturn_t wm_halo_wdt_expire(int irq, void *data);
-- 
2.30.2

