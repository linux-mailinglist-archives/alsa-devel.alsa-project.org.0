Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E24F6874CE8
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Mar 2024 12:03:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9012846;
	Thu,  7 Mar 2024 12:03:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9012846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709809398;
	bh=ZYEX9P7puv9lEbiZYmALqk/NyV6qZh9JWibH9V3LTwA=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=IJmjqACFRF6ojSEQUIArFDO82ZprJo8CfNKFzUXqNCy2r+Pq5LonwW1mh7f7TdtmW
	 ACn23SPLWuowbudxmVaAcUcY9U6hJLiFn1EZAGytJ6cJOkJyjrxaMqP8TDlw2mR7wU
	 Hw2fRHIE7FMtIAR4ecx88/KmGy0JJAtqhVvLgXls=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7CFA0F8057A; Thu,  7 Mar 2024 12:02:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 36574F8057D;
	Thu,  7 Mar 2024 12:02:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5DA97F8024E; Thu,  7 Mar 2024 12:02:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 89660F80087
	for <alsa-devel@alsa-project.org>; Thu,  7 Mar 2024 12:02:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89660F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=eWSfgExZ
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4275LZKl032521;
	Thu, 7 Mar 2024 05:02:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=b
	iYfRWZpVTnCEFD0PEPQzFspaGqHimN3uGEojMKIy20=; b=eWSfgExZfQ/JugLPN
	UCaAjj8FjGYA07m/nCy5K9mntomHaPrEskfHaMZMWwBuEZbOavF7fySJ4kwTtdJI
	VNR0sF+vJdFhkqR9FykB2Y48KTZmG8jSEck13/9Ju+VbUxV105PHEkIojyelAv4S
	l1vbGAhJTsSuBu/YUCGCM32ZneuAJQBokUUvaolQqGjKxVPzyrUh81sS7POH2alT
	QGxg+RzSsPZPtGh5JXVBr6QMFNtLe5edOS8or6tdkAIp8MpBMdfZQV3xLLYNvcwP
	XpcWxaVhqQEXkcAqPGQZjCS85ojo4vGU8Z7KnZNxMlv3U9bvRzviW4WXRvNsC9rX
	/akSA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3wm2d2nxe5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Mar 2024 05:02:29 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 7 Mar 2024
 11:02:27 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4
 via Frontend Transport; Thu, 7 Mar 2024 11:02:27 +0000
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 8FD7082024B;
	Thu,  7 Mar 2024 11:02:27 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>
Subject: [PATCH] ASoC: wm_adsp: Fix missing mutex_lock in wm_adsp_write_ctl()
Date: Thu, 7 Mar 2024 11:02:27 +0000
Message-ID: <20240307110227.41421-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: n_kVY7arxyRYDYcPdj0LkKnHbJ-ufm7T
X-Proofpoint-GUID: n_kVY7arxyRYDYcPdj0LkKnHbJ-ufm7T
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: GVYZGCZRHV6VNA6JOGTYQUCOTTEKVA7Y
X-Message-ID-Hash: GVYZGCZRHV6VNA6JOGTYQUCOTTEKVA7Y
X-MailFrom: prvs=07964fdf23=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GVYZGCZRHV6VNA6JOGTYQUCOTTEKVA7Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

wm_adsp_write_ctl() must hold the pwr_lock mutex when calling
cs_dsp_get_ctl().

This was previously partially fixed by commit 781118bc2fc1
("ASoC: wm_adsp: Fix missing locking in wm_adsp_[read|write]_ctl()")
but this only put locking around the call to cs_dsp_coeff_write_ctrl(),
missing the call to cs_dsp_get_ctl().

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: 781118bc2fc1 ("ASoC: wm_adsp: Fix missing locking in wm_adsp_[read|write]_ctl()")
---
 sound/soc/codecs/wm_adsp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index e451c009f2d9..7d5c096e06cd 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -683,11 +683,12 @@ static void wm_adsp_control_remove(struct cs_dsp_coeff_ctl *cs_ctl)
 int wm_adsp_write_ctl(struct wm_adsp *dsp, const char *name, int type,
 		      unsigned int alg, void *buf, size_t len)
 {
-	struct cs_dsp_coeff_ctl *cs_ctl = cs_dsp_get_ctl(&dsp->cs_dsp, name, type, alg);
+	struct cs_dsp_coeff_ctl *cs_ctl;
 	struct wm_coeff_ctl *ctl;
 	int ret;
 
 	mutex_lock(&dsp->cs_dsp.pwr_lock);
+	cs_ctl = cs_dsp_get_ctl(&dsp->cs_dsp, name, type, alg);
 	ret = cs_dsp_coeff_write_ctrl(cs_ctl, 0, buf, len);
 	mutex_unlock(&dsp->cs_dsp.pwr_lock);
 
-- 
2.30.2

