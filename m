Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F77E56A6BB
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 17:12:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 323A3164F;
	Thu,  7 Jul 2022 17:11:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 323A3164F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657206747;
	bh=C8RuvHlJKWK+dxR/gTQaEvcXkGZsWZ36wQJSrPYAQSQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OiJOTyktPRW6O3QxVhpDNOzSiDEvhcEptw0nWPhPngju/p9FMZYVrzDWPphrqEOxb
	 g6GokmsAf5pIAij4Q2CoaGalDvWMunDFJAK6hc+vTvnBWRO4LD593yCh+pabNHeEiA
	 /5z2oNr/cD5lyJF6nBCbATSAjVv5rPiLgHo4Xz3g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B68E3F8052E;
	Thu,  7 Jul 2022 17:10:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7118EF800C5; Thu,  7 Jul 2022 17:10:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56BFBF800C5
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 17:10:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56BFBF800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ANNggG/r"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 267BU6Jj020187;
 Thu, 7 Jul 2022 10:10:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=UfB0AtssFWbge7uYqusm8PWaR1RC5vwgwqzBrLQ/xmY=;
 b=ANNggG/rnq+6UXUbnyk6mJSwr/wnsbpwM3wDey9u06OW5b5Px/IDQS4ApK8HT4InSA9m
 hmD5pxqBKaLweLuj2vmiBjX0+xEJrkpYCPSgm3nK2Mjtw2fpvYUWFXmUNzEjSLgVQAdH
 BB8gEfinnka0eXZPIywEtfmOzlESxnQxbBLfuvuFGjznNWjHUCLvjYbvHHgfxMY7DEgJ
 2Gu2ek4FUoPQUX1lvyVdIK8BWPO4keRu4R8LNQAMUxuBMhfYAiMljzOhtayY6dDdlSOd
 Eh5TrkK769BK4vZllLbvP03jzk6OYXsP2XTH0b7Jord4xEWy04DN87t/IT1AD69Z2Vxk ag== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3h4ucmjr6f-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 07 Jul 2022 10:10:48 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 7 Jul
 2022 16:10:44 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 7 Jul 2022 16:10:44 +0100
Received: from sbinding-cirrus-dsktp.ad.cirrus.com
 (NEWBNB750653-PC.ad.cirrus.com [198.90.238.195])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 34C6E2A9;
 Thu,  7 Jul 2022 15:10:44 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v6 2/2] ASoC: cs35l41: Read System Name from ACPI _SUB to
 identify firmware
Date: Thu, 7 Jul 2022 16:10:37 +0100
Message-ID: <20220707151037.3901050-3-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220707151037.3901050-1-sbinding@opensource.cirrus.com>
References: <20220707151037.3901050-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: sPX_SsKzF5jd2GxbOz3BpVz2-DyFvmNC
X-Proofpoint-ORIG-GUID: sPX_SsKzF5jd2GxbOz3BpVz2-DyFvmNC
X-Proofpoint-Spam-Reason: safe
Cc: linux-acpi@vger.kernel.org, alsa-devel@alsa-project.org,
 Stefan Binding <sbinding@opensource.cirrus.com>, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
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

When loading firmware, wm_adsp uses a number of parameters to
determine the path of the firmware and tuning files to load.
One of these parameters is system_name.
Add support in cs35l41 to read this system name from the ACPI
_SUB ID in order to uniquely identify the firmware and tuning
mapped to a particular system.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l41.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index 8766e19d85f1..c223d83e02cf 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -6,6 +6,7 @@
 //
 // Author: David Rhodes <david.rhodes@cirrus.com>
 
+#include <linux/acpi.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/init.h>
@@ -1142,6 +1143,30 @@ static int cs35l41_dsp_init(struct cs35l41_private *cs35l41)
 	return ret;
 }
 
+static int cs35l41_acpi_get_name(struct cs35l41_private *cs35l41)
+{
+	acpi_handle handle = ACPI_HANDLE(cs35l41->dev);
+	const char *sub;
+
+	/* If there is no ACPI_HANDLE, there is no ACPI for this system, return 0 */
+	if (!handle)
+		return 0;
+
+	sub = acpi_get_subsystem_id(handle);
+	if (IS_ERR(sub)) {
+		/* If bad ACPI, return 0 and fallback to legacy firmware path, otherwise fail */
+		if (PTR_ERR(sub) == -ENODATA)
+			return 0;
+		else
+			return PTR_ERR(sub);
+	}
+
+	cs35l41->dsp.system_name = sub;
+	dev_dbg(cs35l41->dev, "Subsystem ID: %s\n", cs35l41->dsp.system_name);
+
+	return 0;
+}
+
 int cs35l41_probe(struct cs35l41_private *cs35l41, const struct cs35l41_hw_cfg *hw_cfg)
 {
 	u32 regid, reg_revid, i, mtl_revid, int_status, chipid_match;
@@ -1270,6 +1295,10 @@ int cs35l41_probe(struct cs35l41_private *cs35l41, const struct cs35l41_hw_cfg *
 		goto err;
 	}
 
+	ret = cs35l41_acpi_get_name(cs35l41);
+	if (ret < 0)
+		goto err;
+
 	ret = cs35l41_dsp_init(cs35l41);
 	if (ret < 0)
 		goto err;
@@ -1316,6 +1345,7 @@ void cs35l41_remove(struct cs35l41_private *cs35l41)
 	pm_runtime_disable(cs35l41->dev);
 
 	regmap_write(cs35l41->regmap, CS35L41_IRQ1_MASK1, 0xFFFFFFFF);
+	kfree(cs35l41->dsp.system_name);
 	wm_adsp2_remove(&cs35l41->dsp);
 	cs35l41_safe_reset(cs35l41->regmap, cs35l41->hw_cfg.bst_type);
 
-- 
2.25.1

