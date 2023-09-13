Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E7679EDEB
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 18:03:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E904950;
	Wed, 13 Sep 2023 18:03:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E904950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694621036;
	bh=Fc/n/Sc0dEy0WIX1DxUSjPln+fBMG7ne0OW7o2s+B5w=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=V6O1aQGu84ogOetM+9WUV5BlL7a/Win/Kd3PAtnCGaXO1cy9SvsZzWxbUq1WNIRuK
	 HmT8eNfQ1KZnHNMDd5W/aTtQrpZBt0YtscsZr1pjx2punIb1hjo0R57PjE13doZwBl
	 VnKEvArdF6U6fWWQcDGLSkd2kmCwx7c+UITfQqN0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16629F8055C; Wed, 13 Sep 2023 18:03:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ADF30F80246;
	Wed, 13 Sep 2023 18:03:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51925F80425; Wed, 13 Sep 2023 18:03:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5F754F801F5
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 18:02:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F754F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=erKjCEdl
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38DFQNmf015064;
	Wed, 13 Sep 2023 11:02:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=4
	dxWaJPvr2QnmomnbN1/XJKlzqqGpJ4ZCyl1FkfwbuU=; b=erKjCEdlTFErWs6yb
	/6S5kNShx40qWneHewW/2h5stjBXxq2lL9yJNGgmlmIryCpOKXZqhfuG/zQueSjU
	ZyoaIcmixgPDBa1EENn1dqZAmnFNkIbV/CCrQqqIQ1ZJUwHFhTAyPeNE54ks2ios
	tghEtHGb0Z3wPQWWcu+b9M2pJ4JiSRhe/dfqNW4QEM0mbiCJGxXxNs4YapYjjB/A
	r00svrhucWYpBKOLYhdXMZOJ8VdW7cBn/j0GiTvRycpZ5gXJZA7YF5mAYoxhTNyp
	gzkdsI2hf+d9cOdDzktRbCfqIZYL7xnIO8L93vdSb7DjwDWEC/eOhXherWvzHo2A
	yJNcg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3t2y7u155j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Sep 2023 11:02:52 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Wed, 13 Sep
 2023 17:02:50 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Wed, 13 Sep 2023 17:02:50 +0100
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.125])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 393F915B9;
	Wed, 13 Sep 2023 16:02:50 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH] ASoC: wm_adsp: Fix missing locking in
 wm_adsp_[read|write]_ctl()
Date: Wed, 13 Sep 2023 17:02:50 +0100
Message-ID: <20230913160250.3700346-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Zy09iuh4OJHrYMobOncWbEkyA3PD04ba
X-Proofpoint-ORIG-GUID: Zy09iuh4OJHrYMobOncWbEkyA3PD04ba
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: M4OZGQ3MZMOMHH5ZT5K2I5DM5BW2MSPT
X-Message-ID-Hash: M4OZGQ3MZMOMHH5ZT5K2I5DM5BW2MSPT
X-MailFrom: prvs=4620548a1c=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M4OZGQ3MZMOMHH5ZT5K2I5DM5BW2MSPT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

wm_adsp_read_ctl() and wm_adsp_write_ctl() must hold the cs_dsp pwr_lock
mutex when calling cs_dsp_coeff_read_ctrl() and cs_dsp_coeff_write_ctrl().

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
These functions aren't currently used so this fix doesn't need
to be backported.
---
 sound/soc/codecs/wm_adsp.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 6fc34f41b175..d1b9238d391e 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -687,7 +687,10 @@ int wm_adsp_write_ctl(struct wm_adsp *dsp, const char *name, int type,
 	struct wm_coeff_ctl *ctl;
 	int ret;
 
+	mutex_lock(&dsp->cs_dsp.pwr_lock);
 	ret = cs_dsp_coeff_write_ctrl(cs_ctl, 0, buf, len);
+	mutex_unlock(&dsp->cs_dsp.pwr_lock);
+
 	if (ret < 0)
 		return ret;
 
@@ -703,8 +706,14 @@ EXPORT_SYMBOL_GPL(wm_adsp_write_ctl);
 int wm_adsp_read_ctl(struct wm_adsp *dsp, const char *name, int type,
 		     unsigned int alg, void *buf, size_t len)
 {
-	return cs_dsp_coeff_read_ctrl(cs_dsp_get_ctl(&dsp->cs_dsp, name, type, alg),
-				      0, buf, len);
+	int ret;
+
+	mutex_lock(&dsp->cs_dsp.pwr_lock);
+	ret = cs_dsp_coeff_read_ctrl(cs_dsp_get_ctl(&dsp->cs_dsp, name, type, alg),
+				     0, buf, len);
+	mutex_unlock(&dsp->cs_dsp.pwr_lock);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(wm_adsp_read_ctl);
 
-- 
2.30.2

