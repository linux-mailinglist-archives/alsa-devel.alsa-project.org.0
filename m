Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D024C69B06D
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Feb 2023 17:16:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A76CF7C;
	Fri, 17 Feb 2023 17:15:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A76CF7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676650593;
	bh=kJxXbKlypsVbG89OaXJ2v7WSZoek6l/vP4i4MFV55zU=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dPr12tD7tfiQA433TDF05w6eXhtiQieF1LS+ySjD59YU+8moZeE6fh9KssSnx8ugm
	 +MDuxc4qOqdGK/m/KI+rsWYKY2tViwQUEk+umXmI0hg+S4IBDXxKnOT+XJdXRLgDyA
	 oKvGKnaX6j0dLkL2A37m2dS0wTXRA51V8/B872/E=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 11D45F8053B;
	Fri, 17 Feb 2023 17:14:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1527F8052D; Fri, 17 Feb 2023 17:14:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1606AF804B2
	for <alsa-devel@alsa-project.org>; Fri, 17 Feb 2023 17:14:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1606AF804B2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=i03YE08w
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31HFh1JO028722;
	Fri, 17 Feb 2023 10:14:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=89OqfVmfn1Au+gkokDwDQ8MKFgxhf0rl2z2ZybdFitE=;
 b=i03YE08wPY3OrJ2YQYBIkNvsvPtd2sMwXp/7hG/75z2NwRc2Ey6Q3lvPm4KkwVKtkr+n
 nm9dFQd4IABiY2mM4vV5z4K5ILurPTPtOz4xA9rvDY6ncu5q14FVmGW9v7R0nqnHI6Hw
 +7u/7jQR42QK3MF4H6JCIoiLXnD3WyskNUh0psdbUBXsBjPHqNfqrLGYfXPFvBRt25xb
 DU3eKVQAggERUX5BpsUYExaLGupEShUOSGKftW8ezGUm0NveC/0B/p67wNjDNbFRk7l7
 ZATHqn3zIuuCslB5oKl+XstClizwH6wvwPx+qTrsV0aXIXKFli+FD0/1QaRXgbQdgV8n RA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3nt1btgsph-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Feb 2023 10:14:14 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.21; Fri, 17 Feb
 2023 10:14:10 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.21 via Frontend
 Transport; Fri, 17 Feb 2023 10:14:10 -0600
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 741F146B;
	Fri, 17 Feb 2023 16:14:10 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
        <cezary.rojewski@intel.com>, <peter.ujfalusi@linux.intel.com>,
        <yung-chuan.liao@linux.intel.com>, <kai.vehmanen@linux.intel.com>
Subject: [PATCH 04/10] ASoC: wm_adsp: Support DSPs that don't require firmware
 download
Date: Fri, 17 Feb 2023 16:14:04 +0000
Message-ID: <20230217161410.915202-5-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230217161410.915202-1-rf@opensource.cirrus.com>
References: <20230217161410.915202-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: pNCSzsW1GfLqnax6WjOhuvOOtdapJCMA
X-Proofpoint-GUID: pNCSzsW1GfLqnax6WjOhuvOOtdapJCMA
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: CFJLG47I5H45QTV5K2LE3APE32RIRJZB
X-Message-ID-Hash: CFJLG47I5H45QTV5K2LE3APE32RIRJZB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CFJLG47I5H45QTV5K2LE3APE32RIRJZB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Simon Trimmer <simont@opensource.cirrus.com>

When a DSP can self-boot from ROM it is not necessary to download
firmware - when the DSP has the wmfw_optional flag set not finding a
wmfw firmware file is a successful outcome and not an error condition.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 3 +++
 sound/soc/codecs/wm_adsp.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 854d9366a745..8176b6173de9 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -850,6 +850,9 @@ static int wm_adsp_request_firmware_files(struct wm_adsp *dsp,
 		return 0;
 	}
 
+	if (dsp->wmfw_optional)
+		return 0;
+
 	adsp_err(dsp, "Failed to request firmware <%s>%s-%s-%s<-%s<%s>>.wmfw\n",
 		 cirrus_dir, dsp->part, dsp->fwf_name, wm_adsp_fw[dsp->fw].file,
 		 system_name, asoc_component_prefix);
diff --git a/sound/soc/codecs/wm_adsp.h b/sound/soc/codecs/wm_adsp.h
index dc2f7a096e26..173dcae2c260 100644
--- a/sound/soc/codecs/wm_adsp.h
+++ b/sound/soc/codecs/wm_adsp.h
@@ -34,6 +34,7 @@ struct wm_adsp {
 	unsigned int sys_config_size;
 
 	int fw;
+	bool wmfw_optional;
 
 	struct work_struct boot_work;
 	int (*pre_run)(struct wm_adsp *dsp);
-- 
2.30.2

