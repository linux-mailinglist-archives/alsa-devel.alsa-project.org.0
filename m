Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0BA8D6588
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2024 17:16:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7428ADEC;
	Fri, 31 May 2024 17:16:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7428ADEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717168577;
	bh=e+bL2RoRUJlaWlprGpWktgCZQsKmm2hk0ARDnnJF7nM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DHajioiULywQ3sXtzJu9RPN5J4Xp9oWzHm1FKLYZZvaMm9tlD3/6HrN3aVobFKTod
	 w0/rCTOlh8rF1FNoq2Dy0baQz/MqM6pqLG5m/2FKedHveUnhtJEtwQRzcYC8cUDLU2
	 A2OvnOm7N2qRHiWijjfypPv0ZPEI30S2MyLy7bU4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EDBAAF805E1; Fri, 31 May 2024 17:15:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C7E2F805C5;
	Fri, 31 May 2024 17:15:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2B86F804FF; Fri, 31 May 2024 17:15:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9FBD3F8026D
	for <alsa-devel@alsa-project.org>; Fri, 31 May 2024 17:15:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FBD3F8026D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=CLZcLiF3
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 44VB0WSq017940;
	Fri, 31 May 2024 10:15:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=qUsSAY8N7AKSenNGLa8xZV3wN1+8yO51gSj1XEWRIaQ=; b=
	CLZcLiF3fZZsVHXhgFHJEslpe79acK49wAoZBxqvkL6cHilbPZ7Sx9y8kLiQqaTU
	JrDmbfSmcTr2DtnPPoVQTv5aznA2zLqyy5NSXJUpax6qj3xZbSB5gaBN0JJKY0Rh
	10ESmzp9exw7Be8QgHLrIn5z9fLnlC1rRLOIsapbn+JbcCtxy6eV51q5HAQbmBOM
	4VnHkrUHz2pkGXfsyeq5m91pp+uixsAMBcYHPMmZ0n2zK76MSJIe+N6YArOooZiz
	NAEgv6hpv8QlVopHGlPg5UqcCijLEm8I6aCp4u+kmzkl1NFUuxtGzU9AZoSdUQKw
	xgphlkPrlK3yJP1fapmMNA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ybcdhe0a3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 10:15:12 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 31 May
 2024 16:15:10 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Fri, 31 May 2024 16:15:10 +0100
Received: from EDIN6ZZ2FY3.ad.cirrus.com (EDIN6ZZ2FY3.ad.cirrus.com
 [198.61.65.72])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id AE85982024B;
	Fri, 31 May 2024 15:15:09 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <soyer@irl.hu>, <shenghao-ding@ti.com>, <kevin-lu@ti.com>,
        <baojun.xu@ti.com>, <kailang@realtek.com>,
        Simon Trimmer
	<simont@opensource.cirrus.com>
Subject: [PATCH 1/7] ALSA: hda: cs35l56: Component should be unbound before
 deconstruction
Date: Fri, 31 May 2024 16:14:03 +0100
Message-ID: <20240531151409.80284-2-simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240531151409.80284-1-simont@opensource.cirrus.com>
References: <20240531151409.80284-1-simont@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: b3wft8Zp-wn9IqPAuSloKUX1mfEWAe5b
X-Proofpoint-ORIG-GUID: b3wft8Zp-wn9IqPAuSloKUX1mfEWAe5b
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: IRGYL456E2JJHKJE27YHGMB6F6YX7AKE
X-Message-ID-Hash: IRGYL456E2JJHKJE27YHGMB6F6YX7AKE
X-MailFrom: prvs=3881dca93d=simont@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IRGYL456E2JJHKJE27YHGMB6F6YX7AKE/>
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
 sound/pci/hda/cs35l56_hda.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
index 0923e2589f5f..e134ede6c5aa 100644
--- a/sound/pci/hda/cs35l56_hda.c
+++ b/sound/pci/hda/cs35l56_hda.c
@@ -1077,12 +1077,12 @@ void cs35l56_hda_remove(struct device *dev)
 {
 	struct cs35l56_hda *cs35l56 = dev_get_drvdata(dev);
 
+	component_del(cs35l56->base.dev, &cs35l56_hda_comp_ops);
+
 	pm_runtime_dont_use_autosuspend(cs35l56->base.dev);
 	pm_runtime_get_sync(cs35l56->base.dev);
 	pm_runtime_disable(cs35l56->base.dev);
 
-	component_del(cs35l56->base.dev, &cs35l56_hda_comp_ops);
-
 	cs_dsp_remove(&cs35l56->cs_dsp);
 
 	kfree(cs35l56->system_name);
-- 
2.34.1

