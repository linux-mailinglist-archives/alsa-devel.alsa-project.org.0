Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEC577CCF3
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 14:51:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3FB283A;
	Tue, 15 Aug 2023 14:50:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3FB283A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692103906;
	bh=8BHoVAYiMiYBCDhJ0oAvzbKLjs+/yyH+8/AHT86Rtp4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZPBxvZVFupdWQKvXfSBaGGVOu6v+/HIGv4oLdgf7V/YaEGUhYA5iQEhkS/6gq5z7J
	 gh2nrVXG2ElotIqUMcvBB8Wu2JEjFT/X/4jjygA0VCeprM0zNZgsLkVMbb4Dl83Mih
	 jVPLWm6QSYuvkL8cBWTC0hkb7jIOYQ2NcYyv83BM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D780EF80564; Tue, 15 Aug 2023 14:50:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A301AF80564;
	Tue, 15 Aug 2023 14:50:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29364F8016D; Tue, 15 Aug 2023 14:48:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B6F8F8016A
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 14:48:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B6F8F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=eZpy70PM
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37FC59WF010995;
	Tue, 15 Aug 2023 07:48:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=LlWeKf7KuiLdz34J272ICd3ELQqwNKf+XzE8CM8lfc0=; b=
	eZpy70PMJzevq7QifiuKI7VswhmD4x/fqSDxRKt2hOGJvqnfOfJ7BpsSzeSgjEjO
	pp60Xj+zjNZ/7HudoCfrxrKJR5TZRa+jis/CXtRU4tKAu/V+69u8tv2N24jEUbCr
	j9CnVL65l5F6E6E/sUe1eEcCHE1M7FHLIhHfO2n1Imb//i0R9cl/Phw/37lB368Z
	1WePUcjEDv6gvRV34A6DDvyk2kqYs/p3b2g8e3dpRpIEc+sYCFek0gwnFu5r7Cfh
	6c2rXeNTntcDKjQzrN3mJm3k5dnT4zc25CwYhMOmki/GTUgWKl56P+BkTEF7mgjy
	cmUg0E3DUPv+DQijoEr0cw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3se6uhjxk5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Aug 2023 07:48:31 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 15 Aug
 2023 13:48:29 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.30 via Frontend Transport; Tue, 15 Aug 2023 13:48:29 +0100
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.65.68])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5A32D3575;
	Tue, 15 Aug 2023 12:48:29 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>
Subject: [PATCH 1/2] ASoC: wm_adsp: Support powering-up DSP without trying to
 load firmware
Date: Tue, 15 Aug 2023 13:48:25 +0100
Message-ID: <20230815124826.5447-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230815124826.5447-1-rf@opensource.cirrus.com>
References: <20230815124826.5447-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: k5s9gD_wb2dBJzTyGWJQwAIcLxeZYfQR
X-Proofpoint-ORIG-GUID: k5s9gD_wb2dBJzTyGWJQwAIcLxeZYfQR
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: FSIZ7BM5DQ36C5AATCKIDACGWJK45TP4
X-Message-ID-Hash: FSIZ7BM5DQ36C5AATCKIDACGWJK45TP4
X-MailFrom: prvs=3591ab1424=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FSIZ7BM5DQ36C5AATCKIDACGWJK45TP4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a flag to wm_adsp_power_up() that indicates whether it should attempt
to find and load firmware files.

This is to support DSPs that have built-in firmware that may already have
been patched (for example, by the BIOS). In that case the patch must not
be overwritten because that could corrupt the running firmware.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56.c |  4 ++--
 sound/soc/codecs/wm_adsp.c | 16 +++++++++-------
 sound/soc/codecs/wm_adsp.h |  2 +-
 3 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 80e7fddae926..98cfcae554af 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -656,7 +656,7 @@ static void cs35l56_secure_patch(struct cs35l56_private *cs35l56)
 	int ret;
 
 	/* Use wm_adsp to load and apply the firmware patch and coefficient files */
-	ret = wm_adsp_power_up(&cs35l56->dsp);
+	ret = wm_adsp_power_up(&cs35l56->dsp, true);
 	if (ret)
 		dev_dbg(cs35l56->base.dev, "%s: wm_adsp_power_up ret %d\n", __func__, ret);
 	else
@@ -686,7 +686,7 @@ static void cs35l56_patch(struct cs35l56_private *cs35l56)
 		goto err;
 
 	/* Use wm_adsp to load and apply the firmware patch and coefficient files */
-	ret = wm_adsp_power_up(&cs35l56->dsp);
+	ret = wm_adsp_power_up(&cs35l56->dsp, true);
 	if (ret) {
 		dev_dbg(cs35l56->base.dev, "%s: wm_adsp_power_up ret %d\n", __func__, ret);
 		goto err;
diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 13f500fa9a5f..6fc34f41b175 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -998,7 +998,7 @@ int wm_adsp2_preloader_put(struct snd_kcontrol *kcontrol,
 }
 EXPORT_SYMBOL_GPL(wm_adsp2_preloader_put);
 
-int wm_adsp_power_up(struct wm_adsp *dsp)
+int wm_adsp_power_up(struct wm_adsp *dsp, bool load_firmware)
 {
 	int ret = 0;
 	char *wmfw_filename = NULL;
@@ -1006,11 +1006,13 @@ int wm_adsp_power_up(struct wm_adsp *dsp)
 	char *coeff_filename = NULL;
 	const struct firmware *coeff_firmware = NULL;
 
-	ret = wm_adsp_request_firmware_files(dsp,
-					     &wmfw_firmware, &wmfw_filename,
-					     &coeff_firmware, &coeff_filename);
-	if (ret)
-		return ret;
+	if (load_firmware) {
+		ret = wm_adsp_request_firmware_files(dsp,
+						     &wmfw_firmware, &wmfw_filename,
+						     &coeff_firmware, &coeff_filename);
+		if (ret)
+			return ret;
+	}
 
 	ret = cs_dsp_power_up(&dsp->cs_dsp,
 			      wmfw_firmware, wmfw_filename,
@@ -1037,7 +1039,7 @@ static void wm_adsp_boot_work(struct work_struct *work)
 					   struct wm_adsp,
 					   boot_work);
 
-	wm_adsp_power_up(dsp);
+	wm_adsp_power_up(dsp, true);
 }
 
 int wm_adsp_early_event(struct snd_soc_dapm_widget *w,
diff --git a/sound/soc/codecs/wm_adsp.h b/sound/soc/codecs/wm_adsp.h
index 3044f964ac14..067d807a7ca8 100644
--- a/sound/soc/codecs/wm_adsp.h
+++ b/sound/soc/codecs/wm_adsp.h
@@ -91,7 +91,7 @@ int wm_adsp1_event(struct snd_soc_dapm_widget *w,
 int wm_adsp_early_event(struct snd_soc_dapm_widget *w,
 			struct snd_kcontrol *kcontrol, int event);
 
-int wm_adsp_power_up(struct wm_adsp *dsp);
+int wm_adsp_power_up(struct wm_adsp *dsp, bool load_firmware);
 void wm_adsp_power_down(struct wm_adsp *dsp);
 
 irqreturn_t wm_adsp2_bus_error(int irq, void *data);
-- 
2.30.2

