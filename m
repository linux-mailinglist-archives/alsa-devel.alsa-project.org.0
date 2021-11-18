Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48854455A14
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 12:21:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB6521867;
	Thu, 18 Nov 2021 12:21:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB6521867
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637234516;
	bh=gG0vdj8q5I9orqNJUN+Eqe0dPgrAZ8mt0BdjK085SiU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BkgQ6r34DRHSKw4jlGfoDged2prv3mdJ3r43wMXNGbZxPa/kNm8et0k2k3vxZuypJ
	 HoyYQEZukgHvDxaXQSA6Y1SmtISZtCLUlyBL6zxfaRfTIlTxn//tY7ff4KD9+Pmtbc
	 NM/hoXrHObwe5xSBI74p+U0tM6jRwFhOeblok1Js=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EA37F80115;
	Thu, 18 Nov 2021 12:20:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB464F80272; Thu, 18 Nov 2021 12:20:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCD09F800FA
 for <alsa-devel@alsa-project.org>; Thu, 18 Nov 2021 12:20:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCD09F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="Xel9SELG"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637234431; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=V0O5o9Y5iT8rkl0A/PwJ6T3Pn0iIKrXiHMODcgx8FkE=;
 b=Xel9SELGY703o9x0QJgMisPxW3UrmPytGqdeR5oBrEQBjx3HwsDZ4THCEWkpRD64y9BIh0my
 pQM3tCH6ZjNXmZzs3parabV4YH72/KE4XBWrFJB+UAQzyJAKOGidgWGYyAtu1bzJbekHsZUL
 j+/XJa6xqsug3D1Cmsg1M/9IkXI=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 619636fded14d5980ff95f6f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 18 Nov 2021 11:20:29
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 64175C4360C; Thu, 18 Nov 2021 11:20:28 +0000 (UTC)
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 95489C4338F;
 Thu, 18 Nov 2021 11:20:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 95489C4338F
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
Subject: [PATCH] ASoC: codecs: MBHC: Remove useless condition check
Date: Thu, 18 Nov 2021 16:50:11 +0530
Message-Id: <1637234411-554-1-git-send-email-srivasam@codeaurora.org>
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

Remove redundant conditional check and clean code in special
headset support functions.

Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
---
 sound/soc/codecs/wcd-mbhc-v2.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/wcd-mbhc-v2.c b/sound/soc/codecs/wcd-mbhc-v2.c
index d6545e4..99586ce 100644
--- a/sound/soc/codecs/wcd-mbhc-v2.c
+++ b/sound/soc/codecs/wcd-mbhc-v2.c
@@ -1055,12 +1055,8 @@ static bool wcd_mbhc_check_for_spl_headset(struct wcd_mbhc *mbhc)
 	hs_threshold = wcd_mbhc_get_spl_hs_thres(mbhc);
 	hph_threshold = wcd_mbhc_adc_get_hph_thres(mbhc);
 
-	if (output_mv > hs_threshold || output_mv < hph_threshold) {
-		if (mbhc->force_linein == true)
-			is_spl_hs = false;
-	} else {
+	if (!(output_mv > hs_threshold || output_mv < hph_threshold))
 		is_spl_hs = true;
-	}
 
 	/* Back MIC_BIAS2 to 1.8v if the type is not special headset */
 	if (!is_spl_hs) {
@@ -1149,13 +1145,13 @@ static void wcd_correct_swch_plug(struct work_struct *work)
 		plug_type = wcd_mbhc_get_plug_from_adc(mbhc, output_mv);
 		is_pa_on = wcd_mbhc_read_field(mbhc, WCD_MBHC_HPH_PA_EN);
 
-		if ((output_mv > hs_threshold) && (!is_spl_hs)) {
+		if (output_mv > hs_threshold && !is_spl_hs) {
 			is_spl_hs = wcd_mbhc_check_for_spl_headset(mbhc);
 			output_mv = wcd_measure_adc_once(mbhc, MUX_CTL_IN2P);
 
 			if (is_spl_hs) {
-				hs_threshold = (hs_threshold * wcd_mbhc_get_micbias(mbhc)) /
-									micbias_mv;
+				hs_threshold *= wcd_mbhc_get_micbias(mbhc);
+				hs_threshold /= micbias_mv;
 			}
 		}
 
@@ -1185,7 +1181,7 @@ static void wcd_correct_swch_plug(struct work_struct *work)
 		}
 
 		/* cable is extension cable */
-		if (output_mv > hs_threshold || mbhc->force_linein == true)
+		if (output_mv > hs_threshold || mbhc->force_linein)
 			plug_type = MBHC_PLUG_TYPE_HIGH_HPH;
 	}
 
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

