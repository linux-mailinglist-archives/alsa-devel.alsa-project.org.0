Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE7B8D8027
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2024 12:37:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5544EB60;
	Mon,  3 Jun 2024 12:37:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5544EB60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717411055;
	bh=L7mPsWE59fLvt2m/9tRf4t9eVGbAAWQn7bYALXOm/6w=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Cq9fyB2UbXvjU3Yc+e6QfCQVg59dnjA3Nt2jrSJ4sotJiMB/c1luuRM29mdZMDIb/
	 +rlqfdueJRQnrHCpmiL9ubjKe3AvyI3W9NpBtgC/qFaOL2mQihBTeXMv3i1owNBF6I
	 6yYafaSF41Ck5tX2pvH9jGurmDr1AjBWj1HnS0o0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B980F80687; Mon,  3 Jun 2024 12:35:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 429BEF8067A;
	Mon,  3 Jun 2024 12:35:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9853BF805B5; Mon,  3 Jun 2024 12:35:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9B9FBF800FA
	for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2024 12:35:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B9FBF800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=FfxWepnR
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4535l7pb018316;
	Mon, 3 Jun 2024 05:35:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=VxH3GmQdzZ7kvCvsSqTihyPEgS2wEiWRURtVFqWL3f8=; b=
	FfxWepnRYN8xgX7v/vrigGIb+xuDHa+B4dTc1PX45i5IJ3AZ3GSSlF8wfjTRsSWD
	Bbcbxj7kZcSMmRgauqwsK/dtWllGuuEL83GxHppWISvVRfYAI8+3J8flbOUAGsKh
	Tqtk4mQIIKfxnqfvHYI2sDP8YqNpuqsSPn8aPXDOowfIKAaAKsoZPjgdZ8DN6XKt
	PQdB26YD+rljvuttOeJJ8PPaR8A3eZVK08mkQ5Ir9Tjkj6KZ2i8bxc8DXdDaro59
	ViYouuarIPoDyvatN1YkHdxc+tThYFVSKM7mzRfnIb2ZVRh+invHNqf+D4z8RsYu
	GtaM3SYRz4pvmGhHs5CLTg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3yg11xscbq-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 05:35:30 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Jun 2024
 11:35:27 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 3 Jun 2024 11:35:27 +0100
Received: from EDIN6ZZ2FY3.ad.cirrus.com (EDIN6ZZ2FY3.ad.cirrus.com
 [198.61.64.166])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 496AF82024A;
	Mon,  3 Jun 2024 10:35:27 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <soyer@irl.hu>, <shenghao-ding@ti.com>, <kevin-lu@ti.com>,
        <baojun.xu@ti.com>, <kailang@realtek.com>,
        Simon Trimmer
	<simont@opensource.cirrus.com>
Subject: [PATCH 3/7] ALSA: hda/tas2781: Component should be unbound before
 deconstruction
Date: Mon, 3 Jun 2024 11:35:20 +0100
Message-ID: <20240603103524.32442-4-simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240603103524.32442-1-simont@opensource.cirrus.com>
References: <20240603103524.32442-1-simont@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 2_eWtm-DasY4CugLiLYehl-6UxDlDY-J
X-Proofpoint-ORIG-GUID: 2_eWtm-DasY4CugLiLYehl-6UxDlDY-J
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: MBT5CU2CS3QUORPHD5SQJMEH6WTNADAX
X-Message-ID-Hash: MBT5CU2CS3QUORPHD5SQJMEH6WTNADAX
X-MailFrom: prvs=388426604e=simont@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MBT5CU2CS3QUORPHD5SQJMEH6WTNADAX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The interface associated with the hda_component should be deactivated
before the driver is deconstructed during removal.

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

