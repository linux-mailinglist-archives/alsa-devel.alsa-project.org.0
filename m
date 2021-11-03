Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6683B44407A
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Nov 2021 12:20:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED31C1688;
	Wed,  3 Nov 2021 12:19:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED31C1688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635938439;
	bh=fN8rRkxFlqXfMvflTvkBhu1iT96RlvfsA6JK2tFk/+0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pSCG8hr4trnb/7napbmTAbLveuVzFEUHxI7YnmBp2lyaOfWrq2dsz65nIoMZF7/WO
	 TOr3cNqWDmDk7xZWfVsxuPKhTu0VBGoGHvHBa7rsWLq5XV0O0jPrCgXmmCWfXElMGm
	 zi28ViKZyKf67uG7RSNsLzi5iSsepZQ73EXbH0No=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 636BAF80279;
	Wed,  3 Nov 2021 12:19:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D76BBF8026A; Wed,  3 Nov 2021 12:19:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F60BF800FA
 for <alsa-devel@alsa-project.org>; Wed,  3 Nov 2021 12:19:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F60BF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="xlYvWjY6"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1635938347; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=oLZUnexHipFhVS5amL3s8Fca7/+eucc3eTwLaelyq90=;
 b=xlYvWjY6sg47rpHyYnSYA03O2VwYpEd5st4YT+32GUCFqDroh0mWpjOoLk+cXNn5n9HihwX3
 Let5UkLvYx2yu+hxozOBSO3hJLfwA/KFaHyCv8N99gXvoFX8xcC3Npoyauh4/Gb8veozopSx
 3GgFJqAWvIpE/t+zkQ/GFv0kcp0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 61827025545d7d365fef644a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 03 Nov 2021 11:19:01
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 299FFC43460; Wed,  3 Nov 2021 11:19:01 +0000 (UTC)
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4A634C4338F;
 Wed,  3 Nov 2021 11:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 4A634C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To: agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
 bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
Subject: [PATCH] ASoC: codecs: MBHC: Add support for special headset
Date: Wed,  3 Nov 2021 16:48:44 +0530
Message-Id: <1635938324-17763-1-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Cc: Venkata Prasad Potturu <potturu@codeaurora.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
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

Update MBHC driver to support special headset such as apple
and huwawei headsets.

Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
---
 sound/soc/codecs/wcd-mbhc-v2.c | 78 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 74 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wcd-mbhc-v2.c b/sound/soc/codecs/wcd-mbhc-v2.c
index 405128c..3b4cd39 100644
--- a/sound/soc/codecs/wcd-mbhc-v2.c
+++ b/sound/soc/codecs/wcd-mbhc-v2.c
@@ -1022,6 +1022,57 @@ static int wcd_mbhc_get_plug_from_adc(struct wcd_mbhc *mbhc, int adc_result)
 	return plug_type;
 }
 
+static int wcd_mbhc_get_spl_hs_thres(struct wcd_mbhc *mbhc)
+{
+	int hs_threshold, micbias_mv;
+
+	micbias_mv = wcd_mbhc_get_micbias(mbhc);
+	if (mbhc->cfg->hs_thr && mbhc->cfg->micb_mv != WCD_MBHC_ADC_MICBIAS_MV) {
+		if (mbhc->cfg->micb_mv == micbias_mv)
+			hs_threshold = mbhc->cfg->hs_thr;
+		else
+			hs_threshold = (mbhc->cfg->hs_thr * micbias_mv) /
+								mbhc->cfg->micb_mv;
+	} else {
+		hs_threshold = ((WCD_MBHC_ADC_HS_THRESHOLD_MV * micbias_mv) /
+							WCD_MBHC_ADC_MICBIAS_MV);
+	}
+	return hs_threshold;
+}
+
+static bool wcd_mbhc_check_for_spl_headset(struct wcd_mbhc *mbhc)
+{
+	bool is_spl_hs = false;
+	int output_mv, hs_threshold, hph_threshold;
+
+	if (!mbhc->mbhc_cb->mbhc_micb_ctrl_thr_mic)
+		return false;
+
+	/* Bump up MIC_BIAS2 to 2.7V */
+	mbhc->mbhc_cb->mbhc_micb_ctrl_thr_mic(mbhc->component, MIC_BIAS_2, true);
+	usleep_range(10000, 10100);
+
+	output_mv = wcd_measure_adc_once(mbhc, MUX_CTL_IN2P);
+	hs_threshold = wcd_mbhc_get_spl_hs_thres(mbhc);
+	hph_threshold = wcd_mbhc_adc_get_hph_thres(mbhc);
+
+	if (output_mv > hs_threshold || output_mv < hph_threshold) {
+		if (mbhc->force_linein == true)
+			is_spl_hs = false;
+	} else {
+		is_spl_hs = true;
+	}
+
+	/* Back MIC_BIAS2 to 1.8v if the type is not special headset */
+	if (!is_spl_hs) {
+		mbhc->mbhc_cb->mbhc_micb_ctrl_thr_mic(mbhc->component, MIC_BIAS_2, false);
+		/* Add 10ms delay for micbias to settle */
+		usleep_range(10000, 10100);
+	}
+
+	return is_spl_hs;
+}
+
 static void wcd_correct_swch_plug(struct work_struct *work)
 {
 	struct wcd_mbhc *mbhc;
@@ -1029,12 +1080,14 @@ static void wcd_correct_swch_plug(struct work_struct *work)
 	enum wcd_mbhc_plug_type plug_type = MBHC_PLUG_TYPE_INVALID;
 	unsigned long timeout;
 	int pt_gnd_mic_swap_cnt = 0;
-	int output_mv, cross_conn, hs_threshold, try = 0;
+	int output_mv, cross_conn, hs_threshold, try = 0, micbias_mv;
+	bool is_spl_hs = false;
 	bool is_pa_on;
 
 	mbhc = container_of(work, struct wcd_mbhc, correct_plug_swch);
 	component = mbhc->component;
 
+	micbias_mv = wcd_mbhc_get_micbias(mbhc);
 	hs_threshold = wcd_mbhc_adc_get_hs_thres(mbhc);
 
 	/* Mask ADC COMPLETE interrupt */
@@ -1097,6 +1150,18 @@ static void wcd_correct_swch_plug(struct work_struct *work)
 		plug_type = wcd_mbhc_get_plug_from_adc(mbhc, output_mv);
 		is_pa_on = wcd_mbhc_read_field(mbhc, WCD_MBHC_HPH_PA_EN);
 
+
+		if ((output_mv > hs_threshold) &&
+		    (!is_spl_hs)) {
+			is_spl_hs = wcd_mbhc_check_for_spl_headset(mbhc);
+			output_mv = wcd_measure_adc_once(mbhc, MUX_CTL_IN2P);
+
+			if (is_spl_hs) {
+				hs_threshold = (hs_threshold * wcd_mbhc_get_micbias(mbhc)) /
+									micbias_mv;
+			}
+		}
+
 		if ((output_mv <= hs_threshold) && !is_pa_on) {
 			/* Check for cross connection*/
 			cross_conn = wcd_check_cross_conn(mbhc);
@@ -1122,14 +1187,19 @@ static void wcd_correct_swch_plug(struct work_struct *work)
 			}
 		}
 
-		if (output_mv > hs_threshold) /* cable is extension cable */
+		/* cable is extension cable */
+		if (output_mv > hs_threshold || mbhc->force_linein == true)
 			plug_type = MBHC_PLUG_TYPE_HIGH_HPH;
 	}
 
 	wcd_mbhc_bcs_enable(mbhc, plug_type, true);
 
-	if (plug_type == MBHC_PLUG_TYPE_HIGH_HPH)
-		wcd_mbhc_write_field(mbhc, WCD_MBHC_ELECT_ISRC_EN, 1);
+	if (plug_type == MBHC_PLUG_TYPE_HIGH_HPH) {
+		if (is_spl_hs)
+			plug_type = MBHC_PLUG_TYPE_HEADSET;
+		else
+			wcd_mbhc_write_field(mbhc, WCD_MBHC_ELECT_ISRC_EN, 1);
+	}
 
 	wcd_mbhc_write_field(mbhc, WCD_MBHC_ADC_MODE, 0);
 	wcd_mbhc_write_field(mbhc, WCD_MBHC_ADC_EN, 0);
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

