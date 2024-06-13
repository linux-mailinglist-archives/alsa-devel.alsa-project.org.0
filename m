Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FA29073ED
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 15:39:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49C2EDF8;
	Thu, 13 Jun 2024 15:39:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49C2EDF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718285963;
	bh=Rsa9LIJVLCfEEDfRcJqmUcTi+WPu7QmEWLsbETwevYo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XBbIoUe/qVD96oRgrAVeO+GC01roYtNrxAc29aQkE1HVbUDfoTKHyowdvnnWzDVwz
	 xVuszK5iidlvIg7bPCI7daajBzau4zWSoljsSbbSw5TvruPX/9KJDaH3KAOCzhJnpi
	 L0ll/sd1Rb4QbVnbh8mDAmFmcMfnK7+ZJphQ4R4o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 072C8F8062E; Thu, 13 Jun 2024 15:38:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E2A81F8061B;
	Thu, 13 Jun 2024 15:38:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93730F805E0; Thu, 13 Jun 2024 15:38:10 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D1030F80448
	for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2024 15:38:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1030F80448
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=nbeDsZIQ
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 45D4iWlr013712;
	Thu, 13 Jun 2024 08:38:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=S5+j64neUDQ+dJuwRMUcq1jrgKa4cIarmoNF4x/Fz/I=; b=
	nbeDsZIQddeRfaSxJnGNOMQlWBLcT4pfNOpyMaYtgwmEiMgnvwne4fLeeAb88rTT
	Dm+kr2BqXufz8MASwbYDF4m3AHgN34Vq2gt4wISw0VvmJyckS7J/MP0hgTyfo7BS
	Dvy27/prA0ApZB1wqlpVUQ9DXFAjK+BxXwFRZpJ+wmfH/HOQ/GIqmGSJ1+jKk9CU
	hDiDfEiLNyZ/WO6Cn1D5qtbHJdUOo6wJJzbRUvFwYvDqsqmLXuLCRSer11I7M4Vi
	kXRKjRbK8A36KDR/77YIhauP5QSRB9CLIFemY4ZTEM7pJpcbS1/2y2wt5ilpOiKP
	UN5ICaN3m2O5os433k864g==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3yqskgreva-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 08:38:05 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Jun
 2024 14:37:55 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Thu, 13 Jun 2024 14:37:55 +0100
Received: from EDIN6ZZ2FY3.ad.cirrus.com (EDIN6ZZ2FY3.ad.cirrus.com
 [198.61.65.41])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id E4790820248;
	Thu, 13 Jun 2024 13:37:54 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <soyer@irl.hu>, <shenghao-ding@ti.com>, <kevin-lu@ti.com>,
        <baojun.xu@ti.com>, Simon Trimmer <simont@opensource.cirrus.com>
Subject: [PATCH 2/3] ALSA: hda: cs35l41: Component should be unbound before
 deconstruction
Date: Thu, 13 Jun 2024 14:37:12 +0100
Message-ID: <20240613133713.75550-3-simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613133713.75550-1-simont@opensource.cirrus.com>
References: <20240613133713.75550-1-simont@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: ZUQfwjpz7gjGbeVXX6N9VTg_IYKDCY5r
X-Proofpoint-ORIG-GUID: ZUQfwjpz7gjGbeVXX6N9VTg_IYKDCY5r
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: AWNQFKLEM36I43PHX3USJH2R4H3VX6UZ
X-Message-ID-Hash: AWNQFKLEM36I43PHX3USJH2R4H3VX6UZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AWNQFKLEM36I43PHX3USJH2R4H3VX6UZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The interface associated with the hda_component should be deactivated
before the driver is deconstructed during removal.

Fixes: 7b2f3eb492da ("ALSA: hda: cs35l41: Add support for CS35L41 in HDA systems")
Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index d54d4d60b03e..031703f010be 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -2019,6 +2019,8 @@ void cs35l41_hda_remove(struct device *dev)
 {
 	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
 
+	component_del(cs35l41->dev, &cs35l41_hda_comp_ops);
+
 	pm_runtime_get_sync(cs35l41->dev);
 	pm_runtime_dont_use_autosuspend(cs35l41->dev);
 	pm_runtime_disable(cs35l41->dev);
@@ -2026,8 +2028,6 @@ void cs35l41_hda_remove(struct device *dev)
 	if (cs35l41->halo_initialized)
 		cs35l41_remove_dsp(cs35l41);
 
-	component_del(cs35l41->dev, &cs35l41_hda_comp_ops);
-
 	acpi_dev_put(cs35l41->dacpi);
 
 	pm_runtime_put_noidle(cs35l41->dev);
-- 
2.34.1

