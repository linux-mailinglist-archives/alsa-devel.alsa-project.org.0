Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E83D3554A80
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 15:09:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77AB11F1B;
	Wed, 22 Jun 2022 15:08:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77AB11F1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655903347;
	bh=SsYKZ7uvv9yaQ/JCZsQGKadLQnqUgXyz0MIqg9apmNQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IBEyhnCnydYDeXcGqjl2E1uSO7ACOi0d91g7jPFQ8lKKWm5OKOzpHCI9JByiHVO/9
	 vjvkeVW2lSZy4Xf3OsAr21Lndz4V6f8MGhGksCnt7WzjWTKaGv+5cc1zh1qN0qbcIO
	 7AxFfEyR49kuqxPUCTxFi+paRu+SVypg7MayZ59M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29BC4F80118;
	Wed, 22 Jun 2022 15:08:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82333F80424; Wed, 22 Jun 2022 15:08:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 497ECF80118
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 15:07:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 497ECF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="MlsgOdH4"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25MAmnr9022149;
 Wed, 22 Jun 2022 08:07:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=OX/zp2cZpxgV2NdCHL6oybnWUUgNbKlj6YCC3UjHsj8=;
 b=MlsgOdH4YkjEB0DDKt8BGnqDA5rxtsjnGdphz1xwuB2UY3Me98DJwra2qPc7ODDOekYd
 Tiod9IbwtUVkru6dDgeJsqwbzBDIctt03JPcy1A+C29y/OTbJ1VAfvW2ogoDIKXm5UGq
 aTvXLSRn+mY9Tatq+fqJLrzWXZ98Z87Rhr89+wCDFVpObX1f2v9R0Pv04AjOE39Nlo6l
 6c4PDEsLzy3WiP3FRKP12vYsNFG1m8qry8YLToDG3ftOMxQj+17VAdPYLx3tzD2TNqJK
 hGXEqkYfTMfLup4BHuTa0JBT8Op4NB2zyNU/Du7U6Vrc+NUp9cjNBWLSs0uxfX+RPhAW 5g== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gsc41d2wc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 22 Jun 2022 08:07:57 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 22 Jun
 2022 14:07:55 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Wed, 22 Jun 2022 14:07:55 +0100
Received: from sbinding-cirrus-dsktp.ad.cirrus.com (unknown [198.90.238.151])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 440627C;
 Wed, 22 Jun 2022 13:07:55 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v1 2/2] ASoC: cs35l41: Read System Name from ACPI _SUB to
 identify firmware
Date: Wed, 22 Jun 2022 14:07:30 +0100
Message-ID: <20220622130730.1573747-3-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220622130730.1573747-1-sbinding@opensource.cirrus.com>
References: <20220622130730.1573747-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: d4Xer4K1ffLl8TVON-jfV70-VNLBo7W_
X-Proofpoint-ORIG-GUID: d4Xer4K1ffLl8TVON-jfV70-VNLBo7W_
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
 sound/soc/codecs/cs35l41.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index 8766e19d85f1..5df04a2ab5a3 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -6,6 +6,7 @@
 //
 // Author: David Rhodes <david.rhodes@cirrus.com>
 
+#include <linux/acpi.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/init.h>
@@ -1142,6 +1143,28 @@ static int cs35l41_dsp_init(struct cs35l41_private *cs35l41)
 	return ret;
 }
 
+static int cs35l41_probe_acpi(struct cs35l41_private *cs35l41)
+{
+	struct acpi_device *adev;
+	int ret;
+	char sub[ACPI_MAX_SUB_BUF_SIZE];
+
+	adev = ACPI_COMPANION(cs35l41->dev);
+	/* If there is no ACPI_COMPANION, there is no ACPI for this system, return 0 */
+	if (!adev)
+		return 0;
+
+	ret = acpi_get_sub(adev->handle, sub, sizeof(sub));
+	if (ret < 0)
+		return ret;
+
+	cs35l41->dsp.system_name = devm_kstrdup(cs35l41->dev, sub, GFP_KERNEL);
+	if (!cs35l41->dsp.system_name)
+		return -ENOMEM;
+
+	return 0;
+}
+
 int cs35l41_probe(struct cs35l41_private *cs35l41, const struct cs35l41_hw_cfg *hw_cfg)
 {
 	u32 regid, reg_revid, i, mtl_revid, int_status, chipid_match;
@@ -1270,6 +1293,10 @@ int cs35l41_probe(struct cs35l41_private *cs35l41, const struct cs35l41_hw_cfg *
 		goto err;
 	}
 
+	ret = cs35l41_probe_acpi(cs35l41);
+	if (ret < 0)
+		goto err;
+
 	ret = cs35l41_dsp_init(cs35l41);
 	if (ret < 0)
 		goto err;
-- 
2.25.1

