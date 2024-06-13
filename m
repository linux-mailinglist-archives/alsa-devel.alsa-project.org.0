Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA6F9073EA
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 15:38:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B9BFB65;
	Thu, 13 Jun 2024 15:38:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B9BFB65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718285935;
	bh=UCBTzL1qL8X8ZCTfmKXBbLWhLhxnZdvEMzrhg4rYKu8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=H03EVL7SLlIIQpzuM8xB3BbsCjSi1TBaKdkTTWi/PMArYPKBdq4nsZF9U1FSZZhiA
	 Kpay3hwj/c9jpevUkdflQx2z3Yms4hvqqd9h3narfyPq6i2+Sa9yUpN6X+un13X7vu
	 flnnSRt4YNHud8gPWOrLKW7Xn6zohbe0CV4G8z90=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB741F80608; Thu, 13 Jun 2024 15:38:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D00F7F805EF;
	Thu, 13 Jun 2024 15:38:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15EAEF805C3; Thu, 13 Jun 2024 15:38:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CF586F805C2
	for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2024 15:38:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF586F805C2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=N5W7o3YK
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 45D4lvcj009171;
	Thu, 13 Jun 2024 08:38:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=NPkea6m5QVm6o9Dai1C1bE9KqmhX1E2abI8TVNCkjFU=; b=
	N5W7o3YKnv7rWCg37rEQ5lfVydgjpNt4Pt4ncEuwNPDwn8wI9cn5FYpFGtUqoxsq
	XnAhys5+h1+TcV2+F4gDQBEsNKU0ZheuUwtypK6FwqOtP65XgH1XhDE5Cl+A2Qn8
	iad/YVlgfaFeIv7THEnvCJdUjYaJ+IN6fHFpz/7JA7sByiSZ4czgmpbEXzP3jnoa
	/BCth1D5PnQhuKeuRDZJm6yMCnALzdGRHByvEGRFdNYh1XfSmpbwD0IvPMsmzwCL
	yWinBIOslRsGkJuen+2RJ3V1NvVVLd/3D2mn1nQhQ4UJki2i7QhlaQ1SHyprwMBK
	UR1r+do0pA0GORXL2Ay28Q==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3yqb8ehcdq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 08:38:00 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Jun
 2024 14:37:57 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Thu, 13 Jun 2024 14:37:57 +0100
Received: from EDIN6ZZ2FY3.ad.cirrus.com (EDIN6ZZ2FY3.ad.cirrus.com
 [198.61.65.41])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id F01CB820248;
	Thu, 13 Jun 2024 13:37:56 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <soyer@irl.hu>, <shenghao-ding@ti.com>, <kevin-lu@ti.com>,
        <baojun.xu@ti.com>, Simon Trimmer <simont@opensource.cirrus.com>
Subject: [PATCH 3/3] ALSA: hda: tas2781: Component should be unbound before
 deconstruction
Date: Thu, 13 Jun 2024 14:37:13 +0100
Message-ID: <20240613133713.75550-4-simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613133713.75550-1-simont@opensource.cirrus.com>
References: <20240613133713.75550-1-simont@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: LhD2iKBj_iW7K0krGQz1Cvp1ZfsBMFx9
X-Proofpoint-GUID: LhD2iKBj_iW7K0krGQz1Cvp1ZfsBMFx9
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: K3EO23OZCE3LTEKEB3D55AQZHYXFZWIR
X-Message-ID-Hash: K3EO23OZCE3LTEKEB3D55AQZHYXFZWIR
X-MailFrom: prvs=38942f2995=simont@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K3EO23OZCE3LTEKEB3D55AQZHYXFZWIR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The interface associated with the hda_component should be deactivated
before the driver is deconstructed during removal.

Fixes: 4e7914eb1dae ("ALSA: hda/tas2781: remove sound controls in unbind")
Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
---
 sound/pci/hda/tas2781_hda_i2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index 75f7674c66ee..fdee6592c502 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -777,11 +777,11 @@ static void tas2781_hda_remove(struct device *dev)
 {
 	struct tas2781_hda *tas_hda = dev_get_drvdata(dev);
 
+	component_del(tas_hda->dev, &tas2781_hda_comp_ops);
+
 	pm_runtime_get_sync(tas_hda->dev);
 	pm_runtime_disable(tas_hda->dev);
 
-	component_del(tas_hda->dev, &tas2781_hda_comp_ops);
-
 	pm_runtime_put_noidle(tas_hda->dev);
 
 	tasdevice_remove(tas_hda->priv);
-- 
2.34.1

