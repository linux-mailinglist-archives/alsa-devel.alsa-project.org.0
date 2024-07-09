Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 265FF92BD82
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2024 16:54:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52563845;
	Tue,  9 Jul 2024 16:54:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52563845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720536853;
	bh=kHic7sC6ZH2AbrBooEeaERzQHXRTdQ9dm5ISCUWeMZQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vOM/I7iADSMdpOooirINV5E8iAzwfmJL1ddG5hlvCpZ+iNreve3o2/JF1FBft1eNB
	 i7W3iYDRZrtJP/mdaUWpGFloyeh1eXiZIFRHNicaj0LVi1SCZQei3Vl8bNBY5UVU9e
	 tpTyd29yDG2PBn/8qLuVg/P3UiyAQHZyUE6zf4SY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70010F805EB; Tue,  9 Jul 2024 16:53:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CD95F805FA;
	Tue,  9 Jul 2024 16:53:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 234E2F8019B; Tue,  9 Jul 2024 16:52:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4F43BF801F5
	for <alsa-devel@alsa-project.org>; Tue,  9 Jul 2024 16:52:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F43BF801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=GL1w3MEd
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4699SgHb015345;
	Tue, 9 Jul 2024 09:51:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=NN3wIvV31GO7VEkUhfRXkdoFpo5rlVSBv89Npcmj1vg=; b=
	GL1w3MEd9gIcn7yXiPjrlwi39FDDdvRwiib1oTlBuilpYoe5dg5xdvvdTddZWJiX
	ffC9EJzroAdUdFkLB897gjRy081vFKEHLNSEzFWhvOmTGNdplnA6cOvdD0yi1rBA
	g39DaInbBCu/naAypjMFvW51OK8f3dTw9tHm4dErY8VS4+ecrzuk187Tl+8Mwzie
	Fl/ZjgsnT7WUU9Z2LW57tKyQ/uWq4sUJG+owQJ2dT747KugAgmL3DCfk2A0WNbfN
	feYNjvAojJ2EsU6MDVCcG/+ivtjhFhCzmTceG4oAEPcPTVIql/Iq4l1XgtKnFhZ1
	cWkugfGhQfItfsNZAKLIeQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4073axtqjf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 09:51:59 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 9 Jul 2024
 15:51:57 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Tue, 9 Jul 2024 15:51:57 +0100
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id F229282024D;
	Tue,  9 Jul 2024 14:51:56 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>
Subject: [PATCH 1/4] firmware: cs_dsp: Don't allocate temporary buffer for
 info text
Date: Tue, 9 Jul 2024 15:51:53 +0100
Message-ID: <20240709145156.268074-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240709145156.268074-1-rf@opensource.cirrus.com>
References: <20240709145156.268074-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 3KAlLF-uM4roJ-Jm4ZeW2xcjU8uXJgjN
X-Proofpoint-GUID: 3KAlLF-uM4roJ-Jm4ZeW2xcjU8uXJgjN
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: SAUCIDY4NZYCSBCBEHRKQY3MYNGWEF7K
X-Message-ID-Hash: SAUCIDY4NZYCSBCBEHRKQY3MYNGWEF7K
X-MailFrom: prvs=4920b5cb13=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SAUCIDY4NZYCSBCBEHRKQY3MYNGWEF7K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Don't allocate a temporary buffer to hold a NUL-terminated copy
of the NAME/INFO string from the wmfw/bin. It can be printed
directly to the log. Also limit the maximum number of characters
that will be logged from this string.

The NAME/INFO blocks in the firmware files are an array of
characters with a length, not a NUL-terminated C string. The
original code allocated a temporary buffer to make a
NUL-terminated copy of the string and then passed that to
dev_info(). There's no need for this: printf formatting can
use "%.*s" to print a character array of a given length.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/firmware/cirrus/cs_dsp.c | 35 +++++++-------------------------
 1 file changed, 7 insertions(+), 28 deletions(-)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index 89fd63205a6e..bf25107a98ee 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -12,6 +12,7 @@
 #include <linux/ctype.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/seq_file.h>
@@ -1473,7 +1474,6 @@ static int cs_dsp_load(struct cs_dsp *dsp, const struct firmware *firmware,
 	const struct wmfw_region *region;
 	const struct cs_dsp_region *mem;
 	const char *region_name;
-	char *text = NULL;
 	struct cs_dsp_buf *buf;
 	unsigned int reg;
 	int regions = 0;
@@ -1545,15 +1545,15 @@ static int cs_dsp_load(struct cs_dsp *dsp, const struct firmware *firmware,
 
 		region_name = "Unknown";
 		reg = 0;
-		text = NULL;
 		offset = le32_to_cpu(region->offset) & 0xffffff;
 		type = be32_to_cpu(region->type) & 0xff;
 
 		switch (type) {
+		case WMFW_INFO_TEXT:
 		case WMFW_NAME_TEXT:
-			region_name = "Firmware name";
-			text = kzalloc(le32_to_cpu(region->len) + 1,
-				       GFP_KERNEL);
+			region_name = "Info/Name";
+			cs_dsp_info(dsp, "%s: %.*s\n", file,
+				    min(le32_to_cpu(region->len), 100), region->data);
 			break;
 		case WMFW_ALGORITHM_DATA:
 			region_name = "Algorithm";
@@ -1561,11 +1561,6 @@ static int cs_dsp_load(struct cs_dsp *dsp, const struct firmware *firmware,
 			if (ret != 0)
 				goto out_fw;
 			break;
-		case WMFW_INFO_TEXT:
-			region_name = "Information";
-			text = kzalloc(le32_to_cpu(region->len) + 1,
-				       GFP_KERNEL);
-			break;
 		case WMFW_ABSOLUTE:
 			region_name = "Absolute";
 			reg = offset;
@@ -1599,13 +1594,6 @@ static int cs_dsp_load(struct cs_dsp *dsp, const struct firmware *firmware,
 			   regions, le32_to_cpu(region->len), offset,
 			   region_name);
 
-		if (text) {
-			memcpy(text, region->data, le32_to_cpu(region->len));
-			cs_dsp_info(dsp, "%s: %s\n", file, text);
-			kfree(text);
-			text = NULL;
-		}
-
 		if (reg) {
 			buf = cs_dsp_buf_alloc(region->data,
 					       le32_to_cpu(region->len),
@@ -1647,7 +1635,6 @@ static int cs_dsp_load(struct cs_dsp *dsp, const struct firmware *firmware,
 out_fw:
 	regmap_async_complete(regmap);
 	cs_dsp_buf_free(&buf_list);
-	kfree(text);
 
 	if (ret == -EOVERFLOW)
 		cs_dsp_err(dsp, "%s: file content overflows file data\n", file);
@@ -2180,7 +2167,6 @@ static int cs_dsp_load_coeff(struct cs_dsp *dsp, const struct firmware *firmware
 	struct cs_dsp_alg_region *alg_region;
 	const char *region_name;
 	int ret, pos, blocks, type, offset, reg, version;
-	char *text = NULL;
 	struct cs_dsp_buf *buf;
 
 	if (!firmware)
@@ -2249,7 +2235,8 @@ static int cs_dsp_load_coeff(struct cs_dsp *dsp, const struct firmware *firmware
 		region_name = "Unknown";
 		switch (type) {
 		case (WMFW_NAME_TEXT << 8):
-			text = kzalloc(le32_to_cpu(blk->len) + 1, GFP_KERNEL);
+			cs_dsp_info(dsp, "%s: %.*s\n", dsp->fw_name,
+				    min(le32_to_cpu(blk->len), 100), blk->data);
 			break;
 		case (WMFW_INFO_TEXT << 8):
 		case (WMFW_METADATA << 8):
@@ -2321,13 +2308,6 @@ static int cs_dsp_load_coeff(struct cs_dsp *dsp, const struct firmware *firmware
 			break;
 		}
 
-		if (text) {
-			memcpy(text, blk->data, le32_to_cpu(blk->len));
-			cs_dsp_info(dsp, "%s: %s\n", dsp->fw_name, text);
-			kfree(text);
-			text = NULL;
-		}
-
 		if (reg) {
 			buf = cs_dsp_buf_alloc(blk->data,
 					       le32_to_cpu(blk->len),
@@ -2367,7 +2347,6 @@ static int cs_dsp_load_coeff(struct cs_dsp *dsp, const struct firmware *firmware
 out_fw:
 	regmap_async_complete(regmap);
 	cs_dsp_buf_free(&buf_list);
-	kfree(text);
 
 	if (ret == -EOVERFLOW)
 		cs_dsp_err(dsp, "%s: file content overflows file data\n", file);
-- 
2.39.2

