Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E05437ACEC
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 19:16:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61D5617EE;
	Tue, 11 May 2021 19:15:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61D5617EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620753409;
	bh=baD/F6sf3gpC/4TK9yXygw3POnnxlPykaaP/WqLljs4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hcO2vDVZAuJ2nptVKhdkcQG8pWfmk7Juno9kxogAISupHTLDkPCz+Z2ty3jcvrL6R
	 xY2vmOdFCwMJt8sjydE9Hdz/GtaycjdUev0c7PZwqRZhZbwp+zMqmEGpezo5DQtGt3
	 3AI6FWx363qolkgZvPQR300UP40Yb9qP2bXJ7Aws=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63FE6F80156;
	Tue, 11 May 2021 19:15:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6F27F80163; Tue, 11 May 2021 19:15:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9CD4F80129
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 19:15:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9CD4F80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="cBybCAMf"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14BGvGp6011536; Tue, 11 May 2021 12:15:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=Xa+ean9MiU4hVDM0HPZBGSRpPSG5zBNhErDmDjnyE/0=;
 b=cBybCAMfuh+SY8MiGbmqqk87DonixrbKj3vcF+Q/ms9udCt4eJuzYSHM22MHND0K5m2Y
 QNkg0N6bTSUtazeSzB+1c0aG5Ajf3MDlv5j86fBRfvvgk5RTv7nd+mTsYEiLGdgtc3Ak
 4siP9DvhWALDw79dqBBw7RyhM7XRFZXxsvBQ6Lv/pSwin4KO+6MOmIpgrM9GYnn8paX4
 LjFauqnXHfIyMQumPEJUZddVDe9XkmPX2PSGXa7CHTGkg/qKUhNqC/izj6qGnq+DDRUn
 gffDC4obXLtIDmd9z+LT2RuVtiUyA0mt3c/mkJ53yRK6dFJixauR6bJbeS0tV2dQAO2s MQ== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 38f2d4swq3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 11 May 2021 12:15:10 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 11 May
 2021 18:15:08 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Tue, 11 May 2021 18:15:08 +0100
Received: from simont-vb.lan?044ad.cirrus.com (unknown [198.90.238.134])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B9F7711CF;
 Tue, 11 May 2021 17:15:07 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH] ASoC: wm_adsp: mark more data structures with the const
 qualifier
Date: Tue, 11 May 2021 18:14:59 +0100
Message-ID: <20210511171459.270169-1-simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: qAbnz4XNqpXGEV9fWeswMCh7HsH6fc8C
X-Proofpoint-ORIG-GUID: qAbnz4XNqpXGEV9fWeswMCh7HsH6fc8C
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011
 spamscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 malwarescore=0 mlxscore=0 phishscore=0 priorityscore=1501 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105110118
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Simon Trimmer <simont@opensource.cirrus.com>, linux-kernel@vger.kernel.org
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

The callback structures and memory region type table can be marked as
const as they will not change during use.

Fix checkpatch warning against wm_adsp_find_region function by moving
const keyword to form the 'static const struct' pattern.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 18 +++++++++---------
 sound/soc/codecs/wm_adsp.h |  2 +-
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 3dc119daf2f6..37aa020f23f6 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -303,9 +303,9 @@
 #define HALO_MPU_VIO_ERR_SRC_MASK           0x00007fff
 #define HALO_MPU_VIO_ERR_SRC_SHIFT                   0
 
-static struct wm_adsp_ops wm_adsp1_ops;
-static struct wm_adsp_ops wm_adsp2_ops[];
-static struct wm_adsp_ops wm_halo_ops;
+static const struct wm_adsp_ops wm_adsp1_ops;
+static const struct wm_adsp_ops wm_adsp2_ops[];
+static const struct wm_adsp_ops wm_halo_ops;
 
 struct wm_adsp_buf {
 	struct list_head list;
@@ -824,7 +824,7 @@ const struct soc_enum wm_adsp_fw_enum[] = {
 };
 EXPORT_SYMBOL_GPL(wm_adsp_fw_enum);
 
-static struct wm_adsp_region const *wm_adsp_find_region(struct wm_adsp *dsp,
+static const struct wm_adsp_region *wm_adsp_find_region(struct wm_adsp *dsp,
 							int type)
 {
 	int i;
@@ -2240,7 +2240,7 @@ static void wmfw_v3_parse_id_header(struct wm_adsp *dsp,
 }
 
 static int wm_adsp_create_regions(struct wm_adsp *dsp, __be32 id, int nregions,
-				int *type, __be32 *base)
+				const int *type, __be32 *base)
 {
 	struct wm_adsp_alg_region *alg_region;
 	int i;
@@ -2487,7 +2487,7 @@ static int wm_adsp2_setup_algs(struct wm_adsp *dsp)
 static int wm_halo_create_regions(struct wm_adsp *dsp, __be32 id,
 				  __be32 xm_base, __be32 ym_base)
 {
-	int types[] = {
+	static const int types[] = {
 		WMFW_ADSP2_XM, WMFW_HALO_XM_PACKED,
 		WMFW_ADSP2_YM, WMFW_HALO_YM_PACKED
 	};
@@ -4500,13 +4500,13 @@ irqreturn_t wm_halo_wdt_expire(int irq, void *data)
 }
 EXPORT_SYMBOL_GPL(wm_halo_wdt_expire);
 
-static struct wm_adsp_ops wm_adsp1_ops = {
+static const struct wm_adsp_ops wm_adsp1_ops = {
 	.validate_version = wm_adsp_validate_version,
 	.parse_sizes = wm_adsp1_parse_sizes,
 	.region_to_reg = wm_adsp_region_to_reg,
 };
 
-static struct wm_adsp_ops wm_adsp2_ops[] = {
+static const struct wm_adsp_ops wm_adsp2_ops[] = {
 	{
 		.sys_config_size = sizeof(struct wm_adsp_system_config_xm_hdr),
 		.parse_sizes = wm_adsp2_parse_sizes,
@@ -4567,7 +4567,7 @@ static struct wm_adsp_ops wm_adsp2_ops[] = {
 	},
 };
 
-static struct wm_adsp_ops wm_halo_ops = {
+static const struct wm_adsp_ops wm_halo_ops = {
 	.sys_config_size = sizeof(struct wm_halo_system_config_xm_hdr),
 	.parse_sizes = wm_adsp2_parse_sizes,
 	.validate_version = wm_halo_validate_version,
diff --git a/sound/soc/codecs/wm_adsp.h b/sound/soc/codecs/wm_adsp.h
index 1996350b817e..f22131d9cc29 100644
--- a/sound/soc/codecs/wm_adsp.h
+++ b/sound/soc/codecs/wm_adsp.h
@@ -64,7 +64,7 @@ struct wm_adsp {
 	struct regmap *regmap;
 	struct snd_soc_component *component;
 
-	struct wm_adsp_ops *ops;
+	const struct wm_adsp_ops *ops;
 
 	unsigned int base;
 	unsigned int base_sysinfo;
-- 
2.31.1

