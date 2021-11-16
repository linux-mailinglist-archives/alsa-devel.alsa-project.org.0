Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 958C7453720
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Nov 2021 17:18:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E326016B9;
	Tue, 16 Nov 2021 17:17:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E326016B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637079503;
	bh=M2yy0tu2yiLT//ISSCEUBk4SU+JtHKEuisAU4mbVoQg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RAjt+lPkTEkPM7eYZXZ0qeKeFfiHGK+e2E3EAJ2p0w3l6f4+mzrnCtNLECCRq8YxA
	 h2ugVnV62F8MgHLTRtHZriaOOrC4z8kI3p87iQ1tlNUfTbDJsOmPN26pTCCtzSlSdD
	 tnouQYPFY/+Cp6JDrugjhDZKu6Z/tcFED63Inz54=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78B33F804FB;
	Tue, 16 Nov 2021 17:16:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 753F7F804FA; Tue, 16 Nov 2021 17:16:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C962F80272
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 17:16:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C962F80272
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="VfCOBeLm"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AG7fwnJ025797;
 Tue, 16 Nov 2021 10:16:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=CwApPCF3hG3Mox50pUSckm5n1NySjOvvsfG42xgsXXw=;
 b=VfCOBeLmrQtl+6IVIcfdQEhccelqVqc6uk/ISUQZsYgPU+7t4Nxj7rodXLolp2PzOiS+
 +sKy6RlMq/Hay2ivLauCUdbXbXm/gusd7vAlzGhIvqt3IV93dsiwr4elZQAqP0zStsIT
 PwNufoBb9IauxNCauNRuCaKlmGon/TOZ6c7wgyKyH0fG/H/RZiUZ8ICsVQSH5UOPv46q
 deXNXCg69wyW89VnE3eKQi8yJ6osNKZa/GmFkVo+3pjejtJfQP9NzxVt79i9kAMSShij
 I6Q/j5g6oCQcS1r1PX/XsFQQwPLCntau9YpbgE+fmMMpzhbtjAbwrmHZOo9jGZroOera fQ== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3cbjn01x5t-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 16 Nov 2021 10:16:12 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 16 Nov
 2021 16:16:09 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Tue, 16 Nov 2021 16:16:09 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6E69E11DC;
 Tue, 16 Nov 2021 16:16:09 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 05/10] firmware: cs_dsp: Print messages from bin files
Date: Tue, 16 Nov 2021 16:16:04 +0000
Message-ID: <20211116161609.12223-5-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211116161609.12223-1-ckeepax@opensource.cirrus.com>
References: <20211116161609.12223-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: Avamphc_AhhZdJDI7P3wQ6WKsTwljtbj
X-Proofpoint-ORIG-GUID: Avamphc_AhhZdJDI7P3wQ6WKsTwljtbj
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com
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

The coefficient file contains various info strings, and the equivalent
strings are printed from the WMFW file as it is loaded. Add support
for printing these from the coefficient file as well.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/firmware/cirrus/cs_dsp.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index ef7afadea42d1..3d21574f3a443 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -1968,6 +1968,7 @@ static int cs_dsp_load_coeff(struct cs_dsp *dsp, const struct firmware *firmware
 	struct cs_dsp_alg_region *alg_region;
 	const char *region_name;
 	int ret, pos, blocks, type, offset, reg, version;
+	char *text = NULL;
 	struct cs_dsp_buf *buf;
 
 	if (!firmware)
@@ -2025,6 +2026,8 @@ static int cs_dsp_load_coeff(struct cs_dsp *dsp, const struct firmware *firmware
 		region_name = "Unknown";
 		switch (type) {
 		case (WMFW_NAME_TEXT << 8):
+			text = kzalloc(le32_to_cpu(blk->len) + 1, GFP_KERNEL);
+			break;
 		case (WMFW_INFO_TEXT << 8):
 		case (WMFW_METADATA << 8):
 			break;
@@ -2094,6 +2097,13 @@ static int cs_dsp_load_coeff(struct cs_dsp *dsp, const struct firmware *firmware
 			break;
 		}
 
+		if (text) {
+			memcpy(text, blk->data, le32_to_cpu(blk->len));
+			cs_dsp_info(dsp, "%s: %s\n", dsp->fw_name, text);
+			kfree(text);
+			text = NULL;
+		}
+
 		if (reg) {
 			if (le32_to_cpu(blk->len) >
 			    firmware->size - pos - sizeof(*blk)) {
@@ -2144,6 +2154,7 @@ static int cs_dsp_load_coeff(struct cs_dsp *dsp, const struct firmware *firmware
 out_fw:
 	regmap_async_complete(regmap);
 	cs_dsp_buf_free(&buf_list);
+	kfree(text);
 	return ret;
 }
 
-- 
2.11.0

