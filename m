Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CF591A8F5
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2024 16:16:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBF50210F;
	Thu, 27 Jun 2024 16:16:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBF50210F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719497804;
	bh=9YqJTubGTx+2YPeZhaxmp+45YbJc2gS/PY01yV8BwZU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QPdnR2UV8z6VhXrSgOmkrN0ULFtTNHmWl/4Qn38HmQS+iUgh+BXZgAb7EKDmUmjCM
	 FIsj1ROJxe5YZA9S4MPiGJ2WBCk0rvU18dTROc8V2zYAcm32FAj4JhyYwF+kljX2Op
	 YV6AitYy9KfOwlXdTtk/VRxPZlDdEL82vSqbztlo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD8EEF805AC; Thu, 27 Jun 2024 16:16:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C9AB6F8049C;
	Thu, 27 Jun 2024 16:16:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0021F80495; Thu, 27 Jun 2024 16:16:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3090AF80423
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 16:14:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3090AF80423
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=m29gxQh6
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 45RCpTLM015656;
	Thu, 27 Jun 2024 09:14:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=iah8EI97og4cNxeYRMlxZ12pErCcQ4nSGjYeVU+S3Ns=; b=
	m29gxQh6mKJj6ueklP1SqzDc+nxTwcmotBpybjUv8Y1ylDavFmydbcOXUS119umH
	GOvLNWzwf/mBXAL7T425s4oWduiGEsUb2LMg25XZOPAaj3GuY2DNqSYm8EvLDGJ0
	ixU6Kl9fqK9iwXC4aM+7V3YtVtvDW8dxE6HDHq2vVJYAlUtWPMQkIismYR/6LWY/
	JI8bMY+jW632v9JTCXSdkwEjU3jTCCprNXPkCbhDwzt6m808OszWk6EQEiC3SeKD
	c3910W+Ub3kMTvY2il1LeJNiwtV7rkfFfMhe7Ugxf7oINl3HOYfGPRp/ZVfl8YlC
	THwbBRcs3nBo6LbjKTie4Q==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ywu1hwh36-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 09:14:35 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Jun
 2024 15:14:32 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Thu, 27 Jun 2024 15:14:32 +0100
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 66A0082F2A1;
	Thu, 27 Jun 2024 14:14:32 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>
Subject: [PATCH 2/4] firmware: cs_dsp: Return error if block header overflows
 file
Date: Thu, 27 Jun 2024 15:14:30 +0100
Message-ID: <20240627141432.93056-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240627141432.93056-1-rf@opensource.cirrus.com>
References: <20240627141432.93056-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: ZVJy6K1THrPYGfDTLhvegFe97raA3jI1
X-Proofpoint-GUID: ZVJy6K1THrPYGfDTLhvegFe97raA3jI1
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 4BQ4NUE5EXQF7AMTMDJK7LU4X577T6T5
X-Message-ID-Hash: 4BQ4NUE5EXQF7AMTMDJK7LU4X577T6T5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4BQ4NUE5EXQF7AMTMDJK7LU4X577T6T5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Return an error from cs_dsp_power_up() if a block header is longer
than the amount of data left in the file.

The previous code in cs_dsp_load() and cs_dsp_load_coeff() would loop
while there was enough data left in the file for a valid region. This
protected against overrunning the end of the file data, but it didn't
abort the file processing with an error.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: f6bc909e7673 ("firmware: cs_dsp: add driver to support firmware loading on Cirrus Logic DSPs")
---
 drivers/firmware/cirrus/cs_dsp.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index 6eca62d31e20..47cf91be99a1 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -1444,8 +1444,13 @@ static int cs_dsp_load(struct cs_dsp *dsp, const struct firmware *firmware,
 	cs_dsp_dbg(dsp, "%s: timestamp %llu\n", file,
 		   le64_to_cpu(footer->timestamp));
 
-	while (pos < firmware->size &&
-	       sizeof(*region) < firmware->size - pos) {
+	while (pos < firmware->size) {
+		/* Is there enough data for a complete block header? */
+		if (sizeof(*region) > firmware->size - pos) {
+			ret = -EOVERFLOW;
+			goto out_fw;
+		}
+
 		region = (void *)&(firmware->data[pos]);
 		region_name = "Unknown";
 		reg = 0;
@@ -2133,8 +2138,13 @@ static int cs_dsp_load_coeff(struct cs_dsp *dsp, const struct firmware *firmware
 	pos = le32_to_cpu(hdr->len);
 
 	blocks = 0;
-	while (pos < firmware->size &&
-	       sizeof(*blk) < firmware->size - pos) {
+	while (pos < firmware->size) {
+		/* Is there enough data for a complete block header? */
+		if (sizeof(*blk) > firmware->size - pos) {
+			ret = -EOVERFLOW;
+			goto out_fw;
+		}
+
 		blk = (void *)(&firmware->data[pos]);
 
 		type = le16_to_cpu(blk->type);
-- 
2.39.2

