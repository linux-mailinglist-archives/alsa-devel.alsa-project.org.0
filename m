Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 623A692BD8A
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2024 16:56:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9850C93A;
	Tue,  9 Jul 2024 16:55:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9850C93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720536965;
	bh=Ij4C3w8dAUmZS8jiq4VbNchaZ9uf5BArZniso9j2Wms=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iYqvflR010aEzPQfjLf6pYIX8vJsHdlSVBOeEPJo/JSGQ2FKAD0hV7aSQUMPsJKNN
	 g8zh9VKAKeDdp3SfmPbka9NUgHm34SDf5z49wKdzccP+mq9g9FYYm3arYIW/FYIXNG
	 U02vvmt6ZjQ4IvgQYG6/sfSOv1+35VFNXZooN0cQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38236F805C6; Tue,  9 Jul 2024 16:55:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 90A09F805D8;
	Tue,  9 Jul 2024 16:55:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 705EAF8019B; Tue,  9 Jul 2024 16:52:19 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 02B98F80494
	for <alsa-devel@alsa-project.org>; Tue,  9 Jul 2024 16:52:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02B98F80494
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=c9nkzybT
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4699SgHd015345;
	Tue, 9 Jul 2024 09:52:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=z7r55chf67cOgUDruDOw4O5x+ATWaOhhgwvyJEKnqDw=; b=
	c9nkzybTIpOmLkyDjGh7jR2tRS7R76KoGFnR8WamiwGVeg+teeCwzMvwNBQ+uVCt
	+nZbs/Uu/Ye19ycsAnZ2N5GEWt73vj6MKl8Y8E8NHIDFIDP4Sat3fTzJRHKfb7J2
	Ph963jV3G8q7eb5nLoyLhzAYoC6T9MSoPraUbXtoO26aA9qlwgBIZD4dzHYdOYLD
	mwnt+m1pDiJxk9OqPcgzlNk7pvBB7JSAvoQ3gt04sVC2+jhW+FzyF1ctnAZIbedC
	LZO6/erdB8vRF1lNis4CFF9RGrC2/Wlt1e3h3gqcj1v3cpIbrM9TQe0QS5ijYdH/
	kgY1jRDRWfdG/BqlSB1+CA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4073axtqjf-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 09:52:01 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 9 Jul 2024
 15:51:57 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Tue, 9 Jul 2024 15:51:57 +0100
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 2424A820259;
	Tue,  9 Jul 2024 14:51:57 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>
Subject: [PATCH 4/4] firmware: cs_dsp: Rename fw_ver to wmfw_ver
Date: Tue, 9 Jul 2024 15:51:56 +0100
Message-ID: <20240709145156.268074-5-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240709145156.268074-1-rf@opensource.cirrus.com>
References: <20240709145156.268074-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: f3ubVwF3Xvm_CRayawi4WLiUnt678VJ2
X-Proofpoint-GUID: f3ubVwF3Xvm_CRayawi4WLiUnt678VJ2
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: W7P756ZBPQQR4NPQ7D5AZRMDAA4E6TC4
X-Message-ID-Hash: W7P756ZBPQQR4NPQ7D5AZRMDAA4E6TC4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W7P756ZBPQQR4NPQ7D5AZRMDAA4E6TC4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Rename the confusingly named struct member fw_ver to wmfw_ver. It
contains the wmfw format version of the loaded wmfw file.

This commit also contains an update to wm_adsp for the new name.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/firmware/cirrus/cs_dsp.c       | 22 +++++++++++-----------
 include/linux/firmware/cirrus/cs_dsp.h |  2 +-
 sound/soc/codecs/wm_adsp.c             |  2 +-
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index 141a6c9d6737..b4dd1a768f1e 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -1051,7 +1051,7 @@ static int cs_dsp_create_control(struct cs_dsp *dsp,
 
 	ctl->fw_name = dsp->fw_name;
 	ctl->alg_region = *alg_region;
-	if (subname && dsp->fw_ver >= 2) {
+	if (subname && dsp->wmfw_ver >= 2) {
 		ctl->subname_len = subname_len;
 		ctl->subname = kasprintf(GFP_KERNEL, "%.*s", subname_len, subname);
 		if (!ctl->subname) {
@@ -1178,7 +1178,7 @@ static int cs_dsp_coeff_parse_alg(struct cs_dsp *dsp,
 
 	raw = (const struct wmfw_adsp_alg_data *)region->data;
 
-	switch (dsp->fw_ver) {
+	switch (dsp->wmfw_ver) {
 	case 0:
 	case 1:
 		if (sizeof(*raw) > data_len)
@@ -1255,7 +1255,7 @@ static int cs_dsp_coeff_parse_coeff(struct cs_dsp *dsp,
 	blk->offset = le16_to_cpu(raw->hdr.offset);
 	blk->mem_type = le16_to_cpu(raw->hdr.type);
 
-	switch (dsp->fw_ver) {
+	switch (dsp->wmfw_ver) {
 	case 0:
 	case 1:
 		if (sizeof(*raw) > (data_len - pos))
@@ -1502,7 +1502,7 @@ static int cs_dsp_load(struct cs_dsp *dsp, const struct firmware *firmware,
 		goto out_fw;
 	}
 
-	dsp->fw_ver = header->ver;
+	dsp->wmfw_ver = header->ver;
 
 	if (header->core != dsp->type) {
 		cs_dsp_err(dsp, "%s: invalid core %d != %d\n",
@@ -1551,7 +1551,7 @@ static int cs_dsp_load(struct cs_dsp *dsp, const struct firmware *firmware,
 		case WMFW_INFO_TEXT:
 		case WMFW_NAME_TEXT:
 			region_name = "Info/Name";
-			cs_dsp_info(dsp, "%s (rev %d): %.*s\n", file, dsp->fw_ver,
+			cs_dsp_info(dsp, "%s (rev %d): %.*s\n", file, dsp->wmfw_ver,
 				    min(le32_to_cpu(region->len), 100), region->data);
 			break;
 		case WMFW_ALGORITHM_DATA:
@@ -1782,7 +1782,7 @@ static struct cs_dsp_alg_region *cs_dsp_create_region(struct cs_dsp *dsp,
 
 	list_add_tail(&alg_region->list, &dsp->alg_regions);
 
-	if (dsp->fw_ver > 0)
+	if (dsp->wmfw_ver > 0)
 		cs_dsp_ctl_fixup_base(dsp, alg_region);
 
 	return alg_region;
@@ -1905,7 +1905,7 @@ static int cs_dsp_adsp1_setup_algs(struct cs_dsp *dsp)
 			ret = PTR_ERR(alg_region);
 			goto out;
 		}
-		if (dsp->fw_ver == 0) {
+		if (dsp->wmfw_ver == 0) {
 			if (i + 1 < n_algs) {
 				len = be32_to_cpu(adsp1_alg[i + 1].dm);
 				len -= be32_to_cpu(adsp1_alg[i].dm);
@@ -1927,7 +1927,7 @@ static int cs_dsp_adsp1_setup_algs(struct cs_dsp *dsp)
 			ret = PTR_ERR(alg_region);
 			goto out;
 		}
-		if (dsp->fw_ver == 0) {
+		if (dsp->wmfw_ver == 0) {
 			if (i + 1 < n_algs) {
 				len = be32_to_cpu(adsp1_alg[i + 1].zm);
 				len -= be32_to_cpu(adsp1_alg[i].zm);
@@ -2018,7 +2018,7 @@ static int cs_dsp_adsp2_setup_algs(struct cs_dsp *dsp)
 			ret = PTR_ERR(alg_region);
 			goto out;
 		}
-		if (dsp->fw_ver == 0) {
+		if (dsp->wmfw_ver == 0) {
 			if (i + 1 < n_algs) {
 				len = be32_to_cpu(adsp2_alg[i + 1].xm);
 				len -= be32_to_cpu(adsp2_alg[i].xm);
@@ -2040,7 +2040,7 @@ static int cs_dsp_adsp2_setup_algs(struct cs_dsp *dsp)
 			ret = PTR_ERR(alg_region);
 			goto out;
 		}
-		if (dsp->fw_ver == 0) {
+		if (dsp->wmfw_ver == 0) {
 			if (i + 1 < n_algs) {
 				len = be32_to_cpu(adsp2_alg[i + 1].ym);
 				len -= be32_to_cpu(adsp2_alg[i].ym);
@@ -2062,7 +2062,7 @@ static int cs_dsp_adsp2_setup_algs(struct cs_dsp *dsp)
 			ret = PTR_ERR(alg_region);
 			goto out;
 		}
-		if (dsp->fw_ver == 0) {
+		if (dsp->wmfw_ver == 0) {
 			if (i + 1 < n_algs) {
 				len = be32_to_cpu(adsp2_alg[i + 1].zm);
 				len -= be32_to_cpu(adsp2_alg[i].zm);
diff --git a/include/linux/firmware/cirrus/cs_dsp.h b/include/linux/firmware/cirrus/cs_dsp.h
index 8078dc377948..2e649810169f 100644
--- a/include/linux/firmware/cirrus/cs_dsp.h
+++ b/include/linux/firmware/cirrus/cs_dsp.h
@@ -167,7 +167,7 @@ struct cs_dsp {
 	const struct cs_dsp_region *mem;
 	int num_mems;
 
-	int fw_ver;
+	int wmfw_ver;
 
 	bool booted;
 	bool running;
diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 68d2d6444533..9f8549b34e30 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -601,7 +601,7 @@ static int wm_adsp_control_add(struct cs_dsp_coeff_ctl *cs_ctl)
 		return -EINVAL;
 	}
 
-	switch (cs_dsp->fw_ver) {
+	switch (cs_dsp->wmfw_ver) {
 	case 0:
 	case 1:
 		ret = scnprintf(name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN,
-- 
2.39.2

