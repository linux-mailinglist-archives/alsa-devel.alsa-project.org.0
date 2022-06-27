Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACA555BA5C
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jun 2022 16:13:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B25A316BC;
	Mon, 27 Jun 2022 16:13:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B25A316BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656339237;
	bh=mrTY+LhhQN0SUSD9+W/ZTD+DapxlZFWCRwfvGj9VXGs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ATkTeYyeXXkdBNSVVdy9ZXeMPRwOZldjWYYzstXu7NnulTBLZQbZPCDm5/x4avHaX
	 JE8ke886O1J47zwlHXIhaztdSYtMyJ7b7GlhUWr8d24MtbKwwTdhnq5eTj8TYhGxeT
	 LJExXzQniwCKRSim+2LlX9Crh2Yq1c9u0nPmfJFM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2340F8053C;
	Mon, 27 Jun 2022 16:12:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 449CFF80536; Mon, 27 Jun 2022 16:12:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA038F80107
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 16:12:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA038F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="fnaYPZ5u"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25RCn06J027978;
 Mon, 27 Jun 2022 09:12:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=LBdjpKTcBhVvtkLLUBtkb/1VdJ7fQ8gDmZFGNTWayfE=;
 b=fnaYPZ5uPq36JgjWi/d2PV5oyTX1D7bprGTyECuQXLlcUaYQuPqFwEYju+UoDdZxhvp7
 idlKzgaw2f0iGhObVQb4lKJozYh8X1QQRKdKMGuu0sXVeDlxCtoWPKbJvZgg+xy/zBJ/
 LJmIpbNFfhdBqHm3FqepN8s3JvU8AhZDroUo9IFtnAj1w/ANLDHRQLkghOy4MRbt2iRB
 Zw/HvJKbFs7OfzdgTcZRASXRJRe9we7vlXTfTN8iLHXqVKKy1NvNzsXXTuU5dzKUKGe9
 zSVjMNNIvEyS6HX1ahpF4A0GjRuj8CuiVcyI43z2vrVGq6thcPQaLWwn2pSsMF5Nz3Hd Gg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gwxsq2qjm-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 27 Jun 2022 09:12:04 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 27 Jun
 2022 15:12:02 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Mon, 27 Jun 2022 15:12:02 +0100
Received: from sbinding-cirrus-dsktp.ad.cirrus.com (unknown [198.90.238.163])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4C9AB2A1;
 Mon, 27 Jun 2022 14:12:02 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v2 2/2] ASoC: cs35l41: Read System Name from ACPI _SUB to
 identify firmware
Date: Mon, 27 Jun 2022 15:11:48 +0100
Message-ID: <20220627141148.804319-3-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627141148.804319-1-sbinding@opensource.cirrus.com>
References: <20220627141148.804319-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: nVqwWAef1-kB0jlDTGZjUHy0HqOHRlIi
X-Proofpoint-ORIG-GUID: nVqwWAef1-kB0jlDTGZjUHy0HqOHRlIi
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
 sound/soc/codecs/cs35l41.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index 8766e19d85f1..9ab016094b32 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -6,6 +6,7 @@
 //
 // Author: David Rhodes <david.rhodes@cirrus.com>
 
+#include <linux/acpi.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/init.h>
@@ -1142,6 +1143,24 @@ static int cs35l41_dsp_init(struct cs35l41_private *cs35l41)
 	return ret;
 }
 
+static int cs35l41_probe_acpi(struct cs35l41_private *cs35l41)
+{
+	acpi_handle handle = ACPI_HANDLE(cs35l41->dev);
+	const char *sub;
+
+	/* If there is no ACPI_HANDLE, there is no ACPI for this system, return 0 */
+	if (!handle)
+		return 0;
+
+	sub = acpi_get_subsystem_id(handle);
+	if (IS_ERR(sub))
+		return PTR_ERR(sub);
+
+	cs35l41->dsp.system_name = sub;
+	dev_dbg(cs35l41->dev, "Susystem ID: %s\n", cs35l41->dsp.system_name);
+	return 0;
+}
+
 int cs35l41_probe(struct cs35l41_private *cs35l41, const struct cs35l41_hw_cfg *hw_cfg)
 {
 	u32 regid, reg_revid, i, mtl_revid, int_status, chipid_match;
@@ -1270,6 +1289,10 @@ int cs35l41_probe(struct cs35l41_private *cs35l41, const struct cs35l41_hw_cfg *
 		goto err;
 	}
 
+	ret = cs35l41_probe_acpi(cs35l41);
+	if (ret < 0)
+		goto err;
+
 	ret = cs35l41_dsp_init(cs35l41);
 	if (ret < 0)
 		goto err;
@@ -1316,6 +1339,7 @@ void cs35l41_remove(struct cs35l41_private *cs35l41)
 	pm_runtime_disable(cs35l41->dev);
 
 	regmap_write(cs35l41->regmap, CS35L41_IRQ1_MASK1, 0xFFFFFFFF);
+	kfree(cs35l41->dsp.system_name);
 	wm_adsp2_remove(&cs35l41->dsp);
 	cs35l41_safe_reset(cs35l41->regmap, cs35l41->hw_cfg.bst_type);
 
-- 
2.25.1

