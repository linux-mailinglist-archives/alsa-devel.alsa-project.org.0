Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 549F06C10C4
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 12:26:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF3E1210;
	Mon, 20 Mar 2023 12:25:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF3E1210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679311565;
	bh=XWD/gcI9/BbtRfE5GnEkaKuIH1P0ZHSGLbRrD3F5mcY=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=H/77a+H/IXOvM/UA0cycp0y/G8oChXBVqn8q7ujkhIQiQYZmjZirhIglrLESXGB/M
	 0qUJVVyYVNk2LgFqP665SRQo8rkchKID317GovUWnA489ZfhM32NPOPzL0CcdBsamP
	 J2v8PcGYfP0UScLCY45ZqFNBxxxK/oX9s5T0eMzs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EE51F8055A;
	Mon, 20 Mar 2023 12:23:28 +0100 (CET)
To: <broonie@kernel.org>, <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH v3 6/8] ASoC: wm_adsp: Add support for loading bin files
 without wmfw
Date: Mon, 20 Mar 2023 11:22:43 +0000
In-Reply-To: <20230320112245.115720-1-rf@opensource.cirrus.com>
References: <20230320112245.115720-1-rf@opensource.cirrus.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IU7OQSBS272KUY5LW6QH7FJTXAXKYVA4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167931140648.26.12842285182456366955@mailman-core.alsa-project.org>
From: Richard Fitzgerald via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Simon Trimmer <simont@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B37F8F80254; Mon, 20 Mar 2023 12:23:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C0EB8F804FE
	for <alsa-devel@alsa-project.org>; Mon, 20 Mar 2023 12:22:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0EB8F804FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=jwMpr+85
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32K6xMZi028388;
	Mon, 20 Mar 2023 06:22:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=EKnDAwCfy9GRT/qvjYxeHgVu90MN/3twhG33D7PV3Pw=;
 b=jwMpr+85uOHvZl8nVQtcC2eWXwoJvGgrjBKStZteg6HYDZE40ZpIMKjtF5QusrJ8WUci
 jfDRCar1j+IvDqaq/J4LfuvkgQAsgdPB+tGU/iv+rLa8xcSgg5bdvmrcY3DGwN8AC1br
 +dP3UhDzV1QJF8VTefRPQwOKlGs2objLhXfoQtCTfN8AGMDzmq5CRwX9ViLWJeJoOh9A
 TTILbxBKNvjLR/aiIdFngER61UwSLredPxxK7WSmJPZOuwzNAiCy3m9gw1lY9pLVquzy
 1lKqtnF+z2jW1rc9i+en7YsqqEY7Iux3BLa6s0eSUvSwklG/8KkM7WQ+LfOHyi8x7rOw 5A==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3pd9qptc80-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Mar 2023 06:22:48 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Mon, 20 Mar
 2023 06:22:45 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.25 via Frontend
 Transport; Mon, 20 Mar 2023 06:22:45 -0500
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E4A9511D4;
	Mon, 20 Mar 2023 11:22:45 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH v3 6/8] ASoC: wm_adsp: Add support for loading bin files
 without wmfw
Date: Mon, 20 Mar 2023 11:22:43 +0000
Message-ID: <20230320112245.115720-7-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230320112245.115720-1-rf@opensource.cirrus.com>
References: <20230320112245.115720-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: HexwZbFcq_TtVm_dyJI1QkMk_t5MLavq
X-Proofpoint-ORIG-GUID: HexwZbFcq_TtVm_dyJI1QkMk_t5MLavq
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: IU7OQSBS272KUY5LW6QH7FJTXAXKYVA4
X-Message-ID-Hash: IU7OQSBS272KUY5LW6QH7FJTXAXKYVA4
X-MailFrom: prvs=8443a53618=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Simon Trimmer <simont@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IU7OQSBS272KUY5LW6QH7FJTXAXKYVA4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Simon Trimmer <simont@opensource.cirrus.com>

A self-booted DSP may have a file of coefficients to apply to the device
even when there is no firmware to download.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index d4bffa2f7005..c23c306dc38d 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -850,8 +850,29 @@ static int wm_adsp_request_firmware_files(struct wm_adsp *dsp,
 		return 0;
 	}
 
-	if (dsp->wmfw_optional)
+	if (dsp->wmfw_optional) {
+		if (system_name) {
+			if (asoc_component_prefix)
+				wm_adsp_request_firmware_file(dsp, coeff_firmware, coeff_filename,
+							      cirrus_dir, system_name,
+							      asoc_component_prefix, "bin");
+
+			if (!*coeff_firmware)
+				wm_adsp_request_firmware_file(dsp, coeff_firmware, coeff_filename,
+							      cirrus_dir, system_name,
+							      NULL, "bin");
+		}
+
+		if (!*coeff_firmware)
+			wm_adsp_request_firmware_file(dsp, coeff_firmware, coeff_filename,
+						      "", NULL, NULL, "bin");
+
+		if (!*coeff_firmware)
+			wm_adsp_request_firmware_file(dsp, coeff_firmware, coeff_filename,
+						      cirrus_dir, NULL, NULL, "bin");
+
 		return 0;
+	}
 
 	adsp_err(dsp, "Failed to request firmware <%s>%s-%s-%s<-%s<%s>>.wmfw\n",
 		 cirrus_dir, dsp->part, dsp->fwf_name, wm_adsp_fw[dsp->fw].file,
-- 
2.30.2

