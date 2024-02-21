Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D1885E086
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Feb 2024 16:07:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 037C97F8;
	Wed, 21 Feb 2024 16:07:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 037C97F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708528033;
	bh=uf6vpbcIoUtdbhnJ3basXbSQ/u2ojbk1oT1gnr/GaPg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DkFwCTzXIY/bVDbN0l/KO0YM0PS5rtECD43fwwZVjdfIkeNnAKwqebmRbD/I01cZC
	 kYUdjw74xUix/fvwka36xyuYT0CbU64T/vgzV0GR7M+d/Cxem9dbgMAunXYhg/chLz
	 EEulmFD+4SKKDm6oH/JYGpXQmYNTMR8NsuLIDXk4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DBC76F80678; Wed, 21 Feb 2024 16:05:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3AE4F80621;
	Wed, 21 Feb 2024 16:05:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A919F80601; Wed, 21 Feb 2024 16:05:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E0B21F80496
	for <alsa-devel@alsa-project.org>; Wed, 21 Feb 2024 16:05:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0B21F80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=D6E2nmUs
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41L72AP2020807;
	Wed, 21 Feb 2024 09:05:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=jxurZ9g8byiCpiiilA/KSypC/QlK/0d0/qRchJfkX/o=; b=
	D6E2nmUsC1Dv7F3EMC4iI4D9UrsdLWIVk7rDEd4DH1psPQmOnSFmgjzW0ijNNxqH
	47VzgMsIlooEwFJcGUimPMxbI46E+p/DDUvv/LWAabsc6IlnTzDcpeMR2HyI4aWt
	k7Oj9uFHBezZuVP+ID6WW2Ndve4MYak047jaMXWiK5seBVrydSCYjfYICtKMl92z
	Jb/mL/TayVb1dT9zhjKsXJhrZ3I1p9TcxVU487p3ao7nyQhuAasQItWFZIfocNmj
	SfDghvp3cJeRTDBdgkhGg58XSTiMYGlTHyR/orReDxz+51LtX/wDDqSIuRRxeOm9
	fO8nc7r0HC6zydFWhUbBKA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3wd207h58t-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 09:05:12 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 21 Feb
 2024 15:05:07 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Wed, 21 Feb 2024 15:05:07 +0000
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 48CA8820259;
	Wed, 21 Feb 2024 15:05:07 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>
Subject: [PATCH 7/9] ALSA: hda: hda_cs_dsp_ctl: Add helper function to write
 calibration
Date: Wed, 21 Feb 2024 15:05:05 +0000
Message-ID: <20240221150507.1039979-8-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240221150507.1039979-1-rf@opensource.cirrus.com>
References: <20240221150507.1039979-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: w0IK1iOTQqvTEzp0K88FP1p3gONu8Es5
X-Proofpoint-ORIG-GUID: w0IK1iOTQqvTEzp0K88FP1p3gONu8Es5
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: SJFBHEYXKLRS6BPQ6XR662FCQLLSZEMS
X-Message-ID-Hash: SJFBHEYXKLRS6BPQ6XR662FCQLLSZEMS
X-MailFrom: prvs=97814b2c7f=rf@opensource.cirrus.com
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add hda_cs_dsp_write_cal_coeffs(), a helper function to write amp
calibration data to firmware controls.

The calibration data is passed in a struct cirrus_amp_cal_data and
a definition of the firmware algorithm controls in a struct
cirrus_amp_cal_controls.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/pci/hda/hda_cs_dsp_ctl.c | 47 ++++++++++++++++++++++++++++++++++
 sound/pci/hda/hda_cs_dsp_ctl.h |  4 +++
 2 files changed, 51 insertions(+)

diff --git a/sound/pci/hda/hda_cs_dsp_ctl.c b/sound/pci/hda/hda_cs_dsp_ctl.c
index 0f5fdd44721c..bdc21a117dd2 100644
--- a/sound/pci/hda/hda_cs_dsp_ctl.c
+++ b/sound/pci/hda/hda_cs_dsp_ctl.c
@@ -10,6 +10,7 @@
 #include <sound/soc.h>
 #include <linux/firmware/cirrus/cs_dsp.h>
 #include <linux/firmware/cirrus/wmfw.h>
+#include <sound/cs-amp-lib.h>
 #include "hda_cs_dsp_ctl.h"
 
 #define ADSP_MAX_STD_CTRL_SIZE               512
@@ -247,6 +248,52 @@ int hda_cs_dsp_read_ctl(struct cs_dsp *dsp, const char *name, int type,
 }
 EXPORT_SYMBOL_NS_GPL(hda_cs_dsp_read_ctl, SND_HDA_CS_DSP_CONTROLS);
 
+static int hda_cs_dsp_write_cal_coeff(struct cs_dsp *cs_dsp,
+				      const struct cirrus_amp_cal_controls *controls,
+				      const char *ctl_name, unsigned int val)
+{
+	__be32 beval = cpu_to_be32(val);
+	int ret;
+
+	ret = hda_cs_dsp_write_ctl(cs_dsp, ctl_name, controls->mem_region,
+				   controls->alg_id, &beval, 4);
+	if (ret) {
+		dev_err(cs_dsp->dev, "Failed to write control %s: %d\n", ctl_name, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+int hda_cs_dsp_write_cal_coeffs(struct cs_dsp *cs_dsp,
+				const struct cirrus_amp_cal_controls *controls,
+				const struct cirrus_amp_cal_data *data)
+{
+	int ret;
+
+	dev_dbg(cs_dsp->dev, "Calibration: Ambient=%#x, Status=%#x, R0=%d\n",
+		data->calAmbient, data->calStatus, data->calR);
+
+	ret = hda_cs_dsp_write_cal_coeff(cs_dsp, controls, controls->ambient, data->calAmbient);
+	if (ret)
+		return ret;
+
+	ret = hda_cs_dsp_write_cal_coeff(cs_dsp, controls, controls->calr, data->calR);
+	if (ret)
+		return ret;
+
+	ret = hda_cs_dsp_write_cal_coeff(cs_dsp, controls, controls->status, data->calStatus);
+	if (ret)
+		return ret;
+
+	ret = hda_cs_dsp_write_cal_coeff(cs_dsp, controls, controls->checksum, data->calR + 1);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(hda_cs_dsp_write_cal_coeffs, SND_HDA_CS_DSP_CONTROLS);
+
 MODULE_DESCRIPTION("CS_DSP ALSA Control HDA Library");
 MODULE_AUTHOR("Stefan Binding, <sbinding@opensource.cirrus.com>");
 MODULE_LICENSE("GPL");
diff --git a/sound/pci/hda/hda_cs_dsp_ctl.h b/sound/pci/hda/hda_cs_dsp_ctl.h
index 2cf93359c4f2..329531672005 100644
--- a/sound/pci/hda/hda_cs_dsp_ctl.h
+++ b/sound/pci/hda/hda_cs_dsp_ctl.h
@@ -10,6 +10,7 @@
 #ifndef __HDA_CS_DSP_CTL_H__
 #define __HDA_CS_DSP_CTL_H__
 
+#include <sound/cs-amp-lib.h>
 #include <sound/soc.h>
 #include <linux/firmware/cirrus/cs_dsp.h>
 
@@ -35,5 +36,8 @@ int hda_cs_dsp_write_ctl(struct cs_dsp *dsp, const char *name, int type,
 			 unsigned int alg, const void *buf, size_t len);
 int hda_cs_dsp_read_ctl(struct cs_dsp *dsp, const char *name, int type,
 			unsigned int alg, void *buf, size_t len);
+int hda_cs_dsp_write_cal_coeffs(struct cs_dsp *cs_dsp,
+				const struct cirrus_amp_cal_controls *controls,
+				const struct cirrus_amp_cal_data *data);
 
 #endif /*__HDA_CS_DSP_CTL_H__*/
-- 
2.30.2

