Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB3E91A8EC
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2024 16:15:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87721219F;
	Thu, 27 Jun 2024 16:15:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87721219F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719497751;
	bh=6jDAlflBv/YZdf9ZHqsY3Y35p2+LrOTUzLx16ZHWd3E=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VLzoYcCVTD+tB5LI45eVXD4TsvQFyUGuGYCjBEDqOYkb+XojnSUUpz21BXTl6AbKc
	 9gTw9LaeS4dsqLf9iFv3okfbCSJnWgy1lmU+Y9byh8MsmPw6yKEDeIHye8iyl3FqUn
	 dtPGSrQQ7VfK2IvmasuR6ZcpAxvESu4NxkD+3yZs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D03BDF805FA; Thu, 27 Jun 2024 16:14:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 21F80F80600;
	Thu, 27 Jun 2024 16:14:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54495F8049C; Thu, 27 Jun 2024 16:14:45 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D6584F80495
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 16:14:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6584F80495
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=M/sPwg4A
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 45RCpTLO015656;
	Thu, 27 Jun 2024 09:14:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=DcqH+QtIBmifbY+nps/NMX/BsWl+LDnWFq2ml2fw2jg=; b=
	M/sPwg4AXGoUhNRqSrdL8MGX498XMaxfFsUx/BFDMS56Si3DewSRzbcoe80KkQF/
	uujfNVI1ToNOUXJCtK7hwwGJowVFUtrd4OZMcR2zhZ+WfACZd426lJoEhxOWJv5s
	lzUEp+xo2swiC/WL7C6qjD71HXkdf4FepUbqogfTZIcNG8KHNBMYN//3yTguFRFN
	vUlLdKuSY+/z6kPbfPBp3I/BD7UnTmQpL59F7HqQqfa6Yy1t9gyF7rQtScWIuymZ
	ryUcWjV83Ha+OuF4YRf1RibK1WdDcqSl5xUagk0b0tStcwd+Hl7bkEWYx9E/nf5h
	0M0fGyEOkIfuN6+Qsalf4g==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ywu1hwh36-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 09:14:36 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Jun
 2024 15:14:32 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Thu, 27 Jun 2024 15:14:32 +0100
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 75DD782F2A3;
	Thu, 27 Jun 2024 14:14:32 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>
Subject: [PATCH 4/4] firmware: cs_dsp: Prevent buffer overrun when processing
 V2 alg headers
Date: Thu, 27 Jun 2024 15:14:32 +0100
Message-ID: <20240627141432.93056-5-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240627141432.93056-1-rf@opensource.cirrus.com>
References: <20240627141432.93056-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: n4srKqtiDej1aFtbQEWd-UmTvfuMDUvh
X-Proofpoint-GUID: n4srKqtiDej1aFtbQEWd-UmTvfuMDUvh
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: HYFWA53VOUOKME57MERNOFMSUK2GCTQ4
X-Message-ID-Hash: HYFWA53VOUOKME57MERNOFMSUK2GCTQ4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HYFWA53VOUOKME57MERNOFMSUK2GCTQ4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Check that all fields of a V2 algorithm header fit into the available
firmware data buffer.

The wmfw V2 format introduced variable-length strings in the algorithm
block header. This means the overall header length is variable, and the
position of most fields varies depending on the length of the string
fields. Each field must be checked to ensure that it does not overflow
the firmware data buffer.

As this ia bugfix patch, the fixes avoid making any significant change to
the existing code. This makes it easier to review and less likely to
introduce new bugs.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: f6bc909e7673 ("firmware: cs_dsp: add driver to support firmware loading on Cirrus Logic DSPs")
---
 drivers/firmware/cirrus/cs_dsp.c | 144 ++++++++++++++++++++++++-------
 1 file changed, 113 insertions(+), 31 deletions(-)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index 13ff08870d69..16484ab9b09d 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -1107,9 +1107,16 @@ struct cs_dsp_coeff_parsed_coeff {
 	int len;
 };
 
-static int cs_dsp_coeff_parse_string(int bytes, const u8 **pos, const u8 **str)
+static int cs_dsp_coeff_parse_string(int bytes, const u8 **pos, unsigned int avail,
+				     const u8 **str)
 {
-	int length;
+	int length, total_field_len;
+
+	/* String fields are at least one __le32 */
+	if (sizeof(__le32) > avail) {
+		*pos = NULL;
+		return 0;
+	}
 
 	switch (bytes) {
 	case 1:
@@ -1122,10 +1129,16 @@ static int cs_dsp_coeff_parse_string(int bytes, const u8 **pos, const u8 **str)
 		return 0;
 	}
 
+	total_field_len = ((length + bytes) + 3) & ~0x03;
+	if ((unsigned int)total_field_len > avail) {
+		*pos = NULL;
+		return 0;
+	}
+
 	if (str)
 		*str = *pos + bytes;
 
-	*pos += ((length + bytes) + 3) & ~0x03;
+	*pos += total_field_len;
 
 	return length;
 }
@@ -1150,51 +1163,100 @@ static int cs_dsp_coeff_parse_int(int bytes, const u8 **pos)
 	return val;
 }
 
-static inline void cs_dsp_coeff_parse_alg(struct cs_dsp *dsp, const u8 **data,
-					  struct cs_dsp_coeff_parsed_alg *blk)
+static int cs_dsp_coeff_parse_alg(struct cs_dsp *dsp,
+				  const struct wmfw_region *region,
+				  struct cs_dsp_coeff_parsed_alg *blk)
 {
 	const struct wmfw_adsp_alg_data *raw;
+	unsigned int data_len = le32_to_cpu(region->len);
+	unsigned int pos;
+	const u8 *tmp;
+
+	raw = (const struct wmfw_adsp_alg_data *)region->data;
 
 	switch (dsp->fw_ver) {
 	case 0:
 	case 1:
-		raw = (const struct wmfw_adsp_alg_data *)*data;
-		*data = raw->data;
+		if (sizeof(*raw) > data_len)
+			return -EOVERFLOW;
 
 		blk->id = le32_to_cpu(raw->id);
 		blk->name = raw->name;
 		blk->name_len = strlen(raw->name);
 		blk->ncoeff = le32_to_cpu(raw->ncoeff);
+
+		pos = sizeof(*raw);
 		break;
 	default:
-		blk->id = cs_dsp_coeff_parse_int(sizeof(raw->id), data);
-		blk->name_len = cs_dsp_coeff_parse_string(sizeof(u8), data,
+		if (sizeof(raw->id) > data_len)
+			return -EOVERFLOW;
+
+		tmp = region->data;
+		blk->id = cs_dsp_coeff_parse_int(sizeof(raw->id), &tmp);
+		pos = tmp - region->data;
+
+		tmp = &region->data[pos];
+		blk->name_len = cs_dsp_coeff_parse_string(sizeof(u8), &tmp, data_len - pos,
 							  &blk->name);
-		cs_dsp_coeff_parse_string(sizeof(u16), data, NULL);
-		blk->ncoeff = cs_dsp_coeff_parse_int(sizeof(raw->ncoeff), data);
+		if (!tmp)
+			return -EOVERFLOW;
+
+		pos = tmp - region->data;
+		cs_dsp_coeff_parse_string(sizeof(u16), &tmp, data_len - pos, NULL);
+		if (!tmp)
+			return -EOVERFLOW;
+
+		pos = tmp - region->data;
+		if (sizeof(raw->ncoeff) > (data_len - pos))
+			return -EOVERFLOW;
+
+		blk->ncoeff = cs_dsp_coeff_parse_int(sizeof(raw->ncoeff), &tmp);
+		pos += sizeof(raw->ncoeff);
 		break;
 	}
 
+	if ((int)blk->ncoeff < 0)
+		return -EOVERFLOW;
+
 	cs_dsp_dbg(dsp, "Algorithm ID: %#x\n", blk->id);
 	cs_dsp_dbg(dsp, "Algorithm name: %.*s\n", blk->name_len, blk->name);
 	cs_dsp_dbg(dsp, "# of coefficient descriptors: %#x\n", blk->ncoeff);
+
+	return pos;
 }
 
-static inline void cs_dsp_coeff_parse_coeff(struct cs_dsp *dsp, const u8 **data,
-					    struct cs_dsp_coeff_parsed_coeff *blk)
+static int cs_dsp_coeff_parse_coeff(struct cs_dsp *dsp,
+				    const struct wmfw_region *region,
+				    unsigned int pos,
+				    struct cs_dsp_coeff_parsed_coeff *blk)
 {
 	const struct wmfw_adsp_coeff_data *raw;
+	unsigned int data_len = le32_to_cpu(region->len);
+	unsigned int blk_len, blk_end_pos;
 	const u8 *tmp;
-	int length;
+
+	raw = (const struct wmfw_adsp_coeff_data *)&region->data[pos];
+	if (sizeof(raw->hdr) > (data_len - pos))
+		return -EOVERFLOW;
+
+	blk_len = le32_to_cpu(raw->hdr.size);
+	if (blk_len > S32_MAX)
+		return -EOVERFLOW;
+
+	if (blk_len > (data_len - pos - sizeof(raw->hdr)))
+		return -EOVERFLOW;
+
+	blk_end_pos = pos + sizeof(raw->hdr) + blk_len;
+
+	blk->offset = le16_to_cpu(raw->hdr.offset);
+	blk->mem_type = le16_to_cpu(raw->hdr.type);
 
 	switch (dsp->fw_ver) {
 	case 0:
 	case 1:
-		raw = (const struct wmfw_adsp_coeff_data *)*data;
-		*data = *data + sizeof(raw->hdr) + le32_to_cpu(raw->hdr.size);
+		if (sizeof(*raw) > (data_len - pos))
+			return -EOVERFLOW;
 
-		blk->offset = le16_to_cpu(raw->hdr.offset);
-		blk->mem_type = le16_to_cpu(raw->hdr.type);
 		blk->name = raw->name;
 		blk->name_len = strlen(raw->name);
 		blk->ctl_type = le16_to_cpu(raw->ctl_type);
@@ -1202,19 +1264,33 @@ static inline void cs_dsp_coeff_parse_coeff(struct cs_dsp *dsp, const u8 **data,
 		blk->len = le32_to_cpu(raw->len);
 		break;
 	default:
-		tmp = *data;
-		blk->offset = cs_dsp_coeff_parse_int(sizeof(raw->hdr.offset), &tmp);
-		blk->mem_type = cs_dsp_coeff_parse_int(sizeof(raw->hdr.type), &tmp);
-		length = cs_dsp_coeff_parse_int(sizeof(raw->hdr.size), &tmp);
-		blk->name_len = cs_dsp_coeff_parse_string(sizeof(u8), &tmp,
+		pos += sizeof(raw->hdr);
+		tmp = &region->data[pos];
+		blk->name_len = cs_dsp_coeff_parse_string(sizeof(u8), &tmp, data_len - pos,
 							  &blk->name);
-		cs_dsp_coeff_parse_string(sizeof(u8), &tmp, NULL);
-		cs_dsp_coeff_parse_string(sizeof(u16), &tmp, NULL);
+		if (!tmp)
+			return -EOVERFLOW;
+
+		pos = tmp - region->data;
+		cs_dsp_coeff_parse_string(sizeof(u8), &tmp, data_len - pos, NULL);
+		if (!tmp)
+			return -EOVERFLOW;
+
+		pos = tmp - region->data;
+		cs_dsp_coeff_parse_string(sizeof(u16), &tmp, data_len - pos, NULL);
+		if (!tmp)
+			return -EOVERFLOW;
+
+		pos = tmp - region->data;
+		if (sizeof(raw->ctl_type) + sizeof(raw->flags) + sizeof(raw->len) >
+		    (data_len - pos))
+			return -EOVERFLOW;
+
 		blk->ctl_type = cs_dsp_coeff_parse_int(sizeof(raw->ctl_type), &tmp);
+		pos += sizeof(raw->ctl_type);
 		blk->flags = cs_dsp_coeff_parse_int(sizeof(raw->flags), &tmp);
+		pos += sizeof(raw->flags);
 		blk->len = cs_dsp_coeff_parse_int(sizeof(raw->len), &tmp);
-
-		*data = *data + sizeof(raw->hdr) + length;
 		break;
 	}
 
@@ -1224,6 +1300,8 @@ static inline void cs_dsp_coeff_parse_coeff(struct cs_dsp *dsp, const u8 **data,
 	cs_dsp_dbg(dsp, "\tCoefficient flags: %#x\n", blk->flags);
 	cs_dsp_dbg(dsp, "\tALSA control type: %#x\n", blk->ctl_type);
 	cs_dsp_dbg(dsp, "\tALSA control len: %#x\n", blk->len);
+
+	return blk_end_pos;
 }
 
 static int cs_dsp_check_coeff_flags(struct cs_dsp *dsp,
@@ -1247,12 +1325,16 @@ static int cs_dsp_parse_coeff(struct cs_dsp *dsp,
 	struct cs_dsp_alg_region alg_region = {};
 	struct cs_dsp_coeff_parsed_alg alg_blk;
 	struct cs_dsp_coeff_parsed_coeff coeff_blk;
-	const u8 *data = region->data;
-	int i, ret;
+	int i, pos, ret;
+
+	pos = cs_dsp_coeff_parse_alg(dsp, region, &alg_blk);
+	if (pos < 0)
+		return pos;
 
-	cs_dsp_coeff_parse_alg(dsp, &data, &alg_blk);
 	for (i = 0; i < alg_blk.ncoeff; i++) {
-		cs_dsp_coeff_parse_coeff(dsp, &data, &coeff_blk);
+		pos = cs_dsp_coeff_parse_coeff(dsp, region, pos, &coeff_blk);
+		if (pos < 0)
+			return pos;
 
 		switch (coeff_blk.ctl_type) {
 		case WMFW_CTL_TYPE_BYTES:
-- 
2.39.2

