Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA87889D04
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 12:34:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F6E71948;
	Mon, 25 Mar 2024 12:34:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F6E71948
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711366477;
	bh=Yvm1ITiJ6DW0IKz2Ba2u1RwD7wwThJTJi5J/ZFOcMc0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=D5RKbnFdYZBH6q1jgexJ9ZaV6w4tVbpSEyu05POmCARfQBWu28N4V4E81oiCrmeRW
	 E6C18HALEjLI5KZOT4jnqBERC2Dk7uQkuE1cKDzR0M2XThsyR9dS1o5gP6aK40un06
	 VWjcUHDIesBVqnEEh7eGbZ4J7T01jWYcJnE+fUfA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CE95F8057A; Mon, 25 Mar 2024 12:34:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C0696F8057B;
	Mon, 25 Mar 2024 12:34:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70750F80563; Mon, 25 Mar 2024 12:31:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B0BDBF801EB
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 12:31:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0BDBF801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=iHPBeikq
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42P3P0Pl021761;
	Mon, 25 Mar 2024 06:31:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=+EDcZtTQ41n90nBFxc6G+fzMbqcoxZNT7pgkNgTsu8s=; b=
	iHPBeikqvAaN5MJzu+E8pxD1n0A8qzY4ZZmqPH2yqP4X+biUkge65aQd1Li19M2i
	MiJ3U3mupUltTsUaCyYXOyKg3o1Yfiu/MvTRmsxsfQaC5YovsrsUXMZeaz4Eof2W
	j+ZFYY5cvvTRBkkDT5Ubd/1PJo2Am/ti0VIKHnl84RIvzK6E1kaF6ewicNWaaL5t
	X2uNrc6vxAUFWwYFMooTQzG2gUc+nNY+zUd51e72E7WO02+OC387eT/tLAtXOzjY
	M3RPk6VX44GXgwZiOi3lOyT6ojIonkIVLdfD/yfgzq2+u7MPjfs24lm+oLGAaiU4
	rdGeWp/ynW/51sDlpIDXOg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3x1vfyb6v1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 06:31:29 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 25 Mar
 2024 11:31:27 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.4 via Frontend Transport; Mon, 25 Mar 2024 11:31:27 +0000
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 48602820258;
	Mon, 25 Mar 2024 11:31:27 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Simon
 Trimmer" <simont@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>
Subject: [PATCH 4/5] ASoC: wm_adsp: Remove notification of driver write
Date: Mon, 25 Mar 2024 11:31:26 +0000
Message-ID: <20240325113127.112783-5-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240325113127.112783-1-rf@opensource.cirrus.com>
References: <20240325113127.112783-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: X9KMIdiyRNJ9lhYXNYzchXJPLARbbllz
X-Proofpoint-GUID: X9KMIdiyRNJ9lhYXNYzchXJPLARbbllz
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: F6GHGVVHV77VNZPM672X7AWUHL76PWXZ
X-Message-ID-Hash: F6GHGVVHV77VNZPM672X7AWUHL76PWXZ
X-MailFrom: prvs=081491209a=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F6GHGVVHV77VNZPM672X7AWUHL76PWXZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Simon Trimmer <simont@opensource.cirrus.com>

Any control that the driver is updating should be marked as SYSTEM and
therefore will not have an ALSA control to notify.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 8e366902ee4e..6e348d49a89c 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -672,7 +672,6 @@ int wm_adsp_write_ctl(struct wm_adsp *dsp, const char *name, int type,
 		      unsigned int alg, void *buf, size_t len)
 {
 	struct cs_dsp_coeff_ctl *cs_ctl;
-	struct wm_coeff_ctl *ctl;
 	int ret;
 
 	mutex_lock(&dsp->cs_dsp.pwr_lock);
@@ -683,12 +682,7 @@ int wm_adsp_write_ctl(struct wm_adsp *dsp, const char *name, int type,
 	if (ret < 0)
 		return ret;
 
-	if (ret == 0 || (cs_ctl->flags & WMFW_CTL_FLAG_SYS))
-		return 0;
-
-	ctl = cs_ctl->priv;
-
-	return snd_soc_component_notify_control(dsp->component, ctl->name);
+	return 0;
 }
 EXPORT_SYMBOL_GPL(wm_adsp_write_ctl);
 
-- 
2.39.2

