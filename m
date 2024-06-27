Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D48691A8E4
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2024 16:15:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A949B1E93;
	Thu, 27 Jun 2024 16:15:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A949B1E93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719497718;
	bh=9D/2PaOW6MKVyp7k7rOu+102ZV2kHkSiZRo5a83CszQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=D94m9MS2ygaIzru4iBz0aQC9nWfYZoj6B2sd80V+JPvhEdrw1eQ/h88oSAAWqEvzM
	 D/oyr/GOjisIe4xKJks9kO4lLqeG6naLfSu0rYyuFbz2PWjSRt8ZvLicjmAlJkooLS
	 t4f4OrT4P8pLFuyngHbXDsg1TJFvV4Aye+WeKVhY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E14EEF80589; Thu, 27 Jun 2024 16:14:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3B57F80154;
	Thu, 27 Jun 2024 16:14:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A7A7F804F2; Thu, 27 Jun 2024 16:14:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2BF25F800E4
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 16:14:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BF25F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=PTQRTOUk
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 45RCpTLL015656;
	Thu, 27 Jun 2024 09:14:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Mf466zPNszl4cwSOtyzf4Z5XuNbdlzhvEDQrtGPSQks=; b=
	PTQRTOUkPHyjAvMeLpRrIGQr314Oo2gkaCmYvUe3WtufnzQdRPudpl8m8EpepXtM
	c3s5Wbn6CTEimuT2ld7NaaENdu8oYi3U32x+FJXO/S6+cGEb4tq31N3S/xISd6ai
	RYvRckxqd14yEvq/W5tnNMXCIWb/CzTSUiBrM+sIszw8vpR6e/8ZwZ9KDC+Of7r7
	fv1zkZn4PSqzZHNq+nKH3RBC/VVqAPia3PxUUqvK3lzHgJAMQ+Y9SSHP5h1ULTZ0
	5u/R1cLsbzgHdW6dxgeJmRS+ZvkvrBI0kB0Km7QAUKTU3H8N/6E6JIebT40tZNJb
	vySqSX5jUxNbbOqsLztxKA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ywu1hwh36-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 09:14:34 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Jun
 2024 15:14:32 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Thu, 27 Jun 2024 15:14:32 +0100
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 690FE82F2A2;
	Thu, 27 Jun 2024 14:14:32 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>
Subject: [PATCH 3/4] firmware: cs_dsp: Validate payload length before
 processing block
Date: Thu, 27 Jun 2024 15:14:31 +0100
Message-ID: <20240627141432.93056-4-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240627141432.93056-1-rf@opensource.cirrus.com>
References: <20240627141432.93056-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: SwvW2r7efNwRyuBMy-RoQ0aJXmVsIGtF
X-Proofpoint-GUID: SwvW2r7efNwRyuBMy-RoQ0aJXmVsIGtF
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: SF5J6N3JFC4HWUJXZTK42RZIE2QOTFDJ
X-Message-ID-Hash: SF5J6N3JFC4HWUJXZTK42RZIE2QOTFDJ
X-MailFrom: prvs=3908a169f9=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SF5J6N3JFC4HWUJXZTK42RZIE2QOTFDJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Move the payload length check in cs_dsp_load() and cs_dsp_coeff_load()
to be done before the block is processed.

The check that the length of a block payload does not exceed the number
of remaining bytes in the firwmware file buffer was being done near the
end of the loop iteration. However, some code before that check used the
length field without validating it.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: f6bc909e7673 ("firmware: cs_dsp: add driver to support firmware loading on Cirrus Logic DSPs")
---
 drivers/firmware/cirrus/cs_dsp.c | 36 +++++++++++++-------------------
 1 file changed, 15 insertions(+), 21 deletions(-)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index 47cf91be99a1..13ff08870d69 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -1452,6 +1452,12 @@ static int cs_dsp_load(struct cs_dsp *dsp, const struct firmware *firmware,
 		}
 
 		region = (void *)&(firmware->data[pos]);
+
+		if (le32_to_cpu(region->len) > firmware->size - pos - sizeof(*region)) {
+			ret = -EOVERFLOW;
+			goto out_fw;
+		}
+
 		region_name = "Unknown";
 		reg = 0;
 		text = NULL;
@@ -1508,16 +1514,6 @@ static int cs_dsp_load(struct cs_dsp *dsp, const struct firmware *firmware,
 			   regions, le32_to_cpu(region->len), offset,
 			   region_name);
 
-		if (le32_to_cpu(region->len) >
-		    firmware->size - pos - sizeof(*region)) {
-			cs_dsp_err(dsp,
-				   "%s.%d: %s region len %d bytes exceeds file length %zu\n",
-				   file, regions, region_name,
-				   le32_to_cpu(region->len), firmware->size);
-			ret = -EINVAL;
-			goto out_fw;
-		}
-
 		if (text) {
 			memcpy(text, region->data, le32_to_cpu(region->len));
 			cs_dsp_info(dsp, "%s: %s\n", file, text);
@@ -2147,6 +2143,11 @@ static int cs_dsp_load_coeff(struct cs_dsp *dsp, const struct firmware *firmware
 
 		blk = (void *)(&firmware->data[pos]);
 
+		if (le32_to_cpu(blk->len) > firmware->size - pos - sizeof(*blk)) {
+			ret = -EOVERFLOW;
+			goto out_fw;
+		}
+
 		type = le16_to_cpu(blk->type);
 		offset = le16_to_cpu(blk->offset);
 		version = le32_to_cpu(blk->ver) >> 8;
@@ -2243,17 +2244,6 @@ static int cs_dsp_load_coeff(struct cs_dsp *dsp, const struct firmware *firmware
 		}
 
 		if (reg) {
-			if (le32_to_cpu(blk->len) >
-			    firmware->size - pos - sizeof(*blk)) {
-				cs_dsp_err(dsp,
-					   "%s.%d: %s region len %d bytes exceeds file length %zu\n",
-					   file, blocks, region_name,
-					   le32_to_cpu(blk->len),
-					   firmware->size);
-				ret = -EINVAL;
-				goto out_fw;
-			}
-
 			buf = cs_dsp_buf_alloc(blk->data,
 					       le32_to_cpu(blk->len),
 					       &buf_list);
@@ -2293,6 +2283,10 @@ static int cs_dsp_load_coeff(struct cs_dsp *dsp, const struct firmware *firmware
 	regmap_async_complete(regmap);
 	cs_dsp_buf_free(&buf_list);
 	kfree(text);
+
+	if (ret == -EOVERFLOW)
+		cs_dsp_err(dsp, "%s: file content overflows file data\n", file);
+
 	return ret;
 }
 
-- 
2.39.2

