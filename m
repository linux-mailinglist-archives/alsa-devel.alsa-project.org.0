Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8237C44FF1C
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Nov 2021 08:13:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB7DA1663;
	Mon, 15 Nov 2021 08:12:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB7DA1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636960395;
	bh=NmaNMM9z+8Q8V2Jw8CpKQceUOw9d8LTVVzsu6BHTEoo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=C0mYaOpBCG3JfC/ArU4qoKa6S/pw5/CY0EtPdZpU8VceNi++3V+zXew3v2DLqVrd+
	 Y6QWgwxncbcxiiLC2rCGxs/mpSMr8zfAxHRsCacInu1NFqLgpg0ldERSXl+KumgQvM
	 DNmrKc4mO8xsrzly1jJnwdQarvMG3twgUgypBlBk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83189F80163;
	Mon, 15 Nov 2021 08:11:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E955DF8027D; Mon, 15 Nov 2021 08:11:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE892F80163
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 08:11:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE892F80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="L2fRp9uv"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1636960307; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=qGxv+XsX7+bD5RWmhMsu38FzWS6QGNazoB2gG6O7qcM=;
 b=L2fRp9uvJgZzhVRkFSRFLszmLSM3a1jWbyXi3jNrhNbtIBHGyjegbsgwNeHtzIvvvEhZiwQY
 joppSVGELbwMzG0lWXRZPUMSy7u2Voa2++KMtttQepXIpsx/Jfxu2p76t30mLVjFRPnt/EPN
 ToDj7B8kCiYkDwLYPDL3ARf4Ez0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 619208314db4233966348453 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 15 Nov 2021 07:11:45
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8838DC4360D; Mon, 15 Nov 2021 07:11:45 +0000 (UTC)
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7A8F9C4338F;
 Mon, 15 Nov 2021 07:11:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 7A8F9C4338F
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
Subject: [PATCH v2] ASoC: codecs: MBHC: Add support for special headset
Date: Mon, 15 Nov 2021 12:41:28 +0530
Message-Id: <1636960288-27537-1-git-send-email-srivasam@codeaurora.org>
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

Changes Since V1:
    -- Fix typo errors.

Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wcd-mbhc-v2.c | 75 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 71 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wcd-mbhc-v2.c b/sound/soc/codecs/wcd-mbhc-v2.c
index 405128c..d6545e4 100644
--- a/sound/soc/codecs/wcd-mbhc-v2.c
+++ b/sound/soc/codecs/wcd-mbhc-v2.c
@@ -1022,6 +1022,56 @@ static int wcd_mbhc_get_plug_from_adc(struct wcd_mbhc *mbhc, int adc_result)
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
+			hs_threshold = (mbhc->cfg->hs_thr * micbias_mv) / mbhc->cfg->micb_mv;
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
@@ -1029,12 +1079,14 @@ static void wcd_correct_swch_plug(struct work_struct *work)
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
@@ -1097,6 +1149,16 @@ static void wcd_correct_swch_plug(struct work_struct *work)
 		plug_type = wcd_mbhc_get_plug_from_adc(mbhc, output_mv);
 		is_pa_on = wcd_mbhc_read_field(mbhc, WCD_MBHC_HPH_PA_EN);
 
+		if ((output_mv > hs_threshold) && (!is_spl_hs)) {
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
@@ -1122,14 +1184,19 @@ static void wcd_correct_swch_plug(struct work_struct *work)
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

