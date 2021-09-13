Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BECD3409852
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Sep 2021 18:05:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F58016F0;
	Mon, 13 Sep 2021 18:04:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F58016F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631549104;
	bh=AzlyPLzpPdXthCsGtinwKwlPi3zJ2g1H3KNkrPj2ONY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gDlS+MbpVHj+/7wYosncv/2JbfV/KYW4RB6sWCEU6HiJshxm8O7BBWHgL0RGYkuwi
	 WiBZCrbAZk/nEJZA1Zly08jQTXi18nwJtRe4XaCwb8/8MCKdv/uaPmRBgugOQPICtz
	 DrCVJftWc5j9ZijhKyTwbUa/0PFAkUhXPsY6MkJE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82C9FF80517;
	Mon, 13 Sep 2021 18:02:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36A83F804FF; Mon, 13 Sep 2021 18:01:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52922F80227
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 18:01:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52922F80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="idZveM7+"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18DAEA6R014550; 
 Mon, 13 Sep 2021 11:01:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=UNW6YLCu8N7NBgj0Um5cDJoIU3x5aC6pJkkvSB49KOM=;
 b=idZveM7+eyXZjdMQvX+hV0jqqcDBnZbEYiBHb6yaafff4i/ytCpoEl7ufTRbp/dxDGTa
 e977WaM2nYR11MnAdP/PMp51bNdzNsSgmPoS4FFKzkb060RGqohUPZnOrNQch5aWI/It
 J1YCUYMnGjaFqOqjhRQnQ4AUOE6q7rpMgKRrAbyJAntzPwJluPqL9XCBR1wNou8pRXmO
 ab7a3+LrQH4hzXc//Gt3Hr7iQjbvjgNOtzH9p8ZZyr1hLnNOUAw0SL2jDRGDJEXnNmjM
 agXHYCLywTolW7sc7Zc5JQvBXn7ZWJP6XEiRsUXRNNXJghVUcaCU1XD/jSSDeFQS7FkX kA== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3b1n5drxkd-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 13 Sep 2021 11:01:25 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Mon, 13 Sep
 2021 17:01:21 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Mon, 13 Sep 2021 17:01:21 +0100
Received: from simont-vb.lan?044ad.cirrus.com (unknown [198.90.238.152])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A710D11C6;
 Mon, 13 Sep 2021 16:01:21 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH 13/16] ASoC: wm_adsp: move firmware loading to client
Date: Mon, 13 Sep 2021 17:00:54 +0100
Message-ID: <20210913160057.103842-14-simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210913160057.103842-1-simont@opensource.cirrus.com>
References: <20210913160057.103842-1-simont@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: hTPUjZbeyRJva-U6aXPxkUKAV3uIF2Cr
X-Proofpoint-ORIG-GUID: hTPUjZbeyRJva-U6aXPxkUKAV3uIF2Cr
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Simon Trimmer <simont@opensource.cirrus.com>, linux-kernel@vger.kernel.org
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

This is preparation for moving the generic DSP support out of ASoC.
Passing the firmware as parameters into the power_up functions
simplifies the generic code that will be moved out of wm_adsp.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 163 +++++++++++++++++++++++++------------
 1 file changed, 112 insertions(+), 51 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index c2e1eb8ff357..3b5b0cce7b35 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -29,6 +29,7 @@
 #include <sound/jack.h>
 #include <sound/initval.h>
 #include <sound/tlv.h>
+#include <linux/firmware.h>
 
 #include "wm_adsp.h"
 
@@ -1797,6 +1798,60 @@ static unsigned int cs_dsp_adsp1_parse_sizes(struct wm_adsp *dsp,
 	return pos + sizeof(*adsp1_sizes);
 }
 
+static void wm_adsp_release_firmware_files(struct wm_adsp *dsp,
+					   const struct firmware *wmfw_firmware,
+					   char *wmfw_filename,
+					   const struct firmware *coeff_firmware,
+					   char *coeff_filename)
+{
+	if (wmfw_firmware)
+		release_firmware(wmfw_firmware);
+	kfree(wmfw_filename);
+
+	if (coeff_firmware)
+		release_firmware(coeff_firmware);
+	kfree(coeff_filename);
+}
+
+static int wm_adsp_request_firmware_file(struct wm_adsp *dsp,
+					 const struct firmware **firmware,
+					 char **filename,
+					 char *suffix)
+{
+	int ret = 0;
+
+	*filename = kasprintf(GFP_KERNEL, "%s-%s-%s.%s", dsp->part, dsp->fwf_name,
+			      wm_adsp_fw[dsp->fw].file, suffix);
+	if (*filename == NULL)
+		return -ENOMEM;
+
+	ret = request_firmware(firmware, *filename, dsp->dev);
+	if (ret != 0) {
+		adsp_err(dsp, "Failed to request '%s'\n", *filename);
+		kfree(*filename);
+		*filename = NULL;
+	}
+
+	return ret;
+}
+
+static int wm_adsp_request_firmware_files(struct wm_adsp *dsp,
+					  const struct firmware **wmfw_firmware,
+					  char **wmfw_filename,
+					  const struct firmware **coeff_firmware,
+					  char **coeff_filename)
+{
+	int ret = 0;
+
+	ret = wm_adsp_request_firmware_file(dsp, wmfw_firmware, wmfw_filename, "wmfw");
+	if (ret != 0)
+		return ret;
+
+	wm_adsp_request_firmware_file(dsp, coeff_firmware, coeff_filename, "bin");
+
+	return 0;
+}
+
 static unsigned int cs_dsp_adsp2_parse_sizes(struct wm_adsp *dsp,
 					     const char * const file,
 					     unsigned int pos,
@@ -1837,10 +1892,10 @@ static bool cs_dsp_halo_validate_version(struct wm_adsp *dsp, unsigned int versi
 	}
 }
 
-static int cs_dsp_load(struct wm_adsp *dsp, const char *fw_file_name)
+static int cs_dsp_load(struct wm_adsp *dsp, const struct firmware *firmware,
+		       const char *file)
 {
 	LIST_HEAD(buf_list);
-	const struct firmware *firmware;
 	struct regmap *regmap = dsp->regmap;
 	unsigned int pos = 0;
 	const struct wmfw_header *header;
@@ -1849,25 +1904,12 @@ static int cs_dsp_load(struct wm_adsp *dsp, const char *fw_file_name)
 	const struct wmfw_region *region;
 	const struct cs_dsp_region *mem;
 	const char *region_name;
-	char *file, *text = NULL;
+	char *text = NULL;
 	struct cs_dsp_buf *buf;
 	unsigned int reg;
 	int regions = 0;
 	int ret, offset, type;
 
-	file = kzalloc(PAGE_SIZE, GFP_KERNEL);
-	if (file == NULL)
-		return -ENOMEM;
-
-	snprintf(file, PAGE_SIZE, "%s-%s-%s.wmfw", dsp->part, dsp->fwf_name,
-		 fw_file_name);
-	file[PAGE_SIZE - 1] = '\0';
-
-	ret = request_firmware(&firmware, file, dsp->dev);
-	if (ret != 0) {
-		cs_dsp_err(dsp, "Failed to request '%s'\n", file);
-		goto out;
-	}
 	ret = -EINVAL;
 
 	pos = sizeof(*header) + sizeof(*adsp1_sizes) + sizeof(*footer);
@@ -2031,10 +2073,7 @@ static int cs_dsp_load(struct wm_adsp *dsp, const char *fw_file_name)
 out_fw:
 	regmap_async_complete(regmap);
 	cs_dsp_buf_free(&buf_list);
-	release_firmware(firmware);
 	kfree(text);
-out:
-	kfree(file);
 
 	return ret;
 }
@@ -2582,45 +2621,33 @@ static int cs_dsp_halo_setup_algs(struct wm_adsp *dsp)
 	return ret;
 }
 
-static int cs_dsp_load_coeff(struct wm_adsp *dsp, const char *fw_file_name)
+static int cs_dsp_load_coeff(struct wm_adsp *dsp, const struct firmware *firmware,
+			     const char *file)
 {
 	LIST_HEAD(buf_list);
 	struct regmap *regmap = dsp->regmap;
 	struct wmfw_coeff_hdr *hdr;
 	struct wmfw_coeff_item *blk;
-	const struct firmware *firmware;
 	const struct cs_dsp_region *mem;
 	struct cs_dsp_alg_region *alg_region;
 	const char *region_name;
 	int ret, pos, blocks, type, offset, reg;
-	char *file;
 	struct cs_dsp_buf *buf;
 
-	file = kzalloc(PAGE_SIZE, GFP_KERNEL);
-	if (file == NULL)
-		return -ENOMEM;
+	if (!firmware)
+		return 0;
 
-	snprintf(file, PAGE_SIZE, "%s-%s-%s.bin", dsp->part, dsp->fwf_name,
-		 fw_file_name);
-	file[PAGE_SIZE - 1] = '\0';
-
-	ret = request_firmware(&firmware, file, dsp->dev);
-	if (ret != 0) {
-		cs_dsp_warn(dsp, "Failed to request '%s'\n", file);
-		ret = 0;
-		goto out;
-	}
 	ret = -EINVAL;
 
 	if (sizeof(*hdr) >= firmware->size) {
-		cs_dsp_err(dsp, "%s: file too short, %zu bytes\n",
+		cs_dsp_err(dsp, "%s: coefficient file too short, %zu bytes\n",
 			   file, firmware->size);
 		goto out_fw;
 	}
 
 	hdr = (void *)&firmware->data[0];
 	if (memcmp(hdr->magic, "WMDR", 4) != 0) {
-		cs_dsp_err(dsp, "%s: invalid magic\n", file);
+		cs_dsp_err(dsp, "%s: invalid coefficient magic\n", file);
 		goto out_fw;
 	}
 
@@ -2769,10 +2796,7 @@ static int cs_dsp_load_coeff(struct wm_adsp *dsp, const char *fw_file_name)
 
 out_fw:
 	regmap_async_complete(regmap);
-	release_firmware(firmware);
 	cs_dsp_buf_free(&buf_list);
-out:
-	kfree(file);
 	return ret;
 }
 
@@ -2837,7 +2861,10 @@ int wm_adsp1_init(struct wm_adsp *dsp)
 }
 EXPORT_SYMBOL_GPL(wm_adsp1_init);
 
-static int cs_dsp_adsp1_power_up(struct wm_adsp *dsp, const char *fw_file_name, const char *fw_name)
+static int cs_dsp_adsp1_power_up(struct wm_adsp *dsp,
+				 const struct firmware *wmfw_firmware, char *wmfw_filename,
+				 const struct firmware *coeff_firmware, char *coeff_filename,
+				 const char *fw_name)
 {
 	unsigned int val;
 	int ret;
@@ -2871,7 +2898,7 @@ static int cs_dsp_adsp1_power_up(struct wm_adsp *dsp, const char *fw_file_name,
 		}
 	}
 
-	ret = cs_dsp_load(dsp, fw_file_name);
+	ret = cs_dsp_load(dsp, wmfw_firmware, wmfw_filename);
 	if (ret != 0)
 		goto err_ena;
 
@@ -2879,7 +2906,7 @@ static int cs_dsp_adsp1_power_up(struct wm_adsp *dsp, const char *fw_file_name,
 	if (ret != 0)
 		goto err_ena;
 
-	ret = cs_dsp_load_coeff(dsp, fw_file_name);
+	ret = cs_dsp_load_coeff(dsp, coeff_firmware, coeff_filename);
 	if (ret != 0)
 		goto err_ena;
 
@@ -2949,14 +2976,29 @@ int wm_adsp1_event(struct snd_soc_dapm_widget *w,
 	struct wm_adsp *dsps = snd_soc_component_get_drvdata(component);
 	struct wm_adsp *dsp = &dsps[w->shift];
 	int ret = 0;
+	char *wmfw_filename = NULL;
+	const struct firmware *wmfw_firmware = NULL;
+	char *coeff_filename = NULL;
+	const struct firmware *coeff_firmware = NULL;
 
 	dsp->component = component;
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
+		ret = wm_adsp_request_firmware_files(dsp,
+						     &wmfw_firmware, &wmfw_filename,
+						     &coeff_firmware, &coeff_filename);
+		if (ret)
+			break;
+
 		ret = cs_dsp_adsp1_power_up(dsp,
-					    wm_adsp_fw[dsp->fw].file,
+					    wmfw_firmware, wmfw_filename,
+					    coeff_firmware, coeff_filename,
 					    wm_adsp_fw_text[dsp->fw]);
+
+		wm_adsp_release_firmware_files(dsp,
+					       wmfw_firmware, wmfw_filename,
+					       coeff_firmware, coeff_filename);
 		break;
 	case SND_SOC_DAPM_PRE_PMD:
 		cs_dsp_adsp1_power_down(dsp);
@@ -3176,8 +3218,10 @@ static void cs_dsp_halo_stop_watchdog(struct wm_adsp *dsp)
 			   HALO_WDT_EN_MASK, 0);
 }
 
-static void cs_dsp_power_up(struct wm_adsp *dsp, const char *fw_file_name,
-			    const char *fw_name)
+static int cs_dsp_power_up(struct wm_adsp *dsp,
+			   const struct firmware *wmfw_firmware, char *wmfw_filename,
+			   const struct firmware *coeff_firmware, char *coeff_filename,
+			   const char *fw_name)
 {
 	int ret;
 
@@ -3197,7 +3241,7 @@ static void cs_dsp_power_up(struct wm_adsp *dsp, const char *fw_file_name,
 			goto err_mem;
 	}
 
-	ret = cs_dsp_load(dsp, fw_file_name);
+	ret = cs_dsp_load(dsp, wmfw_firmware, wmfw_filename);
 	if (ret != 0)
 		goto err_ena;
 
@@ -3205,7 +3249,7 @@ static void cs_dsp_power_up(struct wm_adsp *dsp, const char *fw_file_name,
 	if (ret != 0)
 		goto err_ena;
 
-	ret = cs_dsp_load_coeff(dsp, fw_file_name);
+	ret = cs_dsp_load_coeff(dsp, coeff_firmware, coeff_filename);
 	if (ret != 0)
 		goto err_ena;
 
@@ -3221,8 +3265,7 @@ static void cs_dsp_power_up(struct wm_adsp *dsp, const char *fw_file_name,
 
 	mutex_unlock(&dsp->pwr_lock);
 
-	return;
-
+	return 0;
 err_ena:
 	if (dsp->ops->disable_core)
 		dsp->ops->disable_core(dsp);
@@ -3231,6 +3274,8 @@ static void cs_dsp_power_up(struct wm_adsp *dsp, const char *fw_file_name,
 		dsp->ops->disable_memory(dsp);
 err_mutex:
 	mutex_unlock(&dsp->pwr_lock);
+
+	return ret;
 }
 
 static void cs_dsp_power_down(struct wm_adsp *dsp)
@@ -3264,10 +3309,26 @@ static void wm_adsp_boot_work(struct work_struct *work)
 	struct wm_adsp *dsp = container_of(work,
 					   struct wm_adsp,
 					   boot_work);
+	int ret = 0;
+	char *wmfw_filename = NULL;
+	const struct firmware *wmfw_firmware = NULL;
+	char *coeff_filename = NULL;
+	const struct firmware *coeff_firmware = NULL;
+
+	ret = wm_adsp_request_firmware_files(dsp,
+					     &wmfw_firmware, &wmfw_filename,
+					     &coeff_firmware, &coeff_filename);
+	if (ret)
+		return;
 
 	cs_dsp_power_up(dsp,
-			wm_adsp_fw[dsp->fw].file,
+			wmfw_firmware, wmfw_filename,
+			coeff_firmware, coeff_filename,
 			wm_adsp_fw_text[dsp->fw]);
+
+	wm_adsp_release_firmware_files(dsp,
+				       wmfw_firmware, wmfw_filename,
+				       coeff_firmware, coeff_filename);
 }
 
 int wm_adsp_early_event(struct snd_soc_dapm_widget *w,
-- 
2.33.0

