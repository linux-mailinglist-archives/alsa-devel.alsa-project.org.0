Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC04454726
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Nov 2021 14:25:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD72D189E;
	Wed, 17 Nov 2021 14:24:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD72D189E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637155519;
	bh=tFDbxoGLljU8oDjzaaht1VYjR7/0npPhs1s533W8MU0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N2HYDBkMCnZwVOD9GB1qWqPBZILG89AaGh0fJ2E/oXV+0+cJzm7SsiPJUB+J2Bbbv
	 VNHkiUxvykwuMj+UZVke2DIRQ1ZImBWcNpmXR9nDKjW4b5DHtINlXV3hTBMjOdeDg/
	 BP4PoAq73c+b+ofh/GFNQblbAavBsmUWKZJN0mb4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 948CBF802A0;
	Wed, 17 Nov 2021 14:23:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 893EFF804FA; Wed, 17 Nov 2021 14:23:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89B16F8049C
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 14:23:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89B16F8049C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="f4iexHlj"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AH52dPY021845;
 Wed, 17 Nov 2021 07:23:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=PZs1hlCw+51JcQ8hrC4c3PYYujS0T6IY9IRDfkz2wD0=;
 b=f4iexHljZrcHrqeF9S5VCEV157Rk6UvQVfMpDpTXD96JeINTyxoMBokejJx2M/rUvm0L
 humXxs/yFOBLbDm+SwxAwMHgb8lq+M9otxrk7c1fEfTN3bCxs4owb1YfX6sxF3wiCapl
 wf+TRxcRuvtAA0ncLakvyvKjtbCn8m753II6/ryC37zkcAZc4gfp9nENmRHVpJBTmG02
 jesnWe64446olJr85V+1kc9vVjncy7Vd5Q956bQJMwS2RgCjXuFe/mXpYiIN0XndNJLS
 Hr/UX/0XeDTR3xZrEkZtsQAm3q/QJcFpjvfuEcH1FmTCs7Qf5cuTCPXI/m8ZPo3Woovd yQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ccryb8jhf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 17 Nov 2021 07:23:02 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 17 Nov
 2021 13:23:00 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Wed, 17 Nov 2021 13:23:00 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 91F5515A0;
 Wed, 17 Nov 2021 13:23:00 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH v2 03/10] firmware: cs_dsp: Add version checks on coefficient
 loading
Date: Wed, 17 Nov 2021 13:22:53 +0000
Message-ID: <20211117132300.1290-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211117132300.1290-1-ckeepax@opensource.cirrus.com>
References: <20211117132300.1290-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: A52X4ZbyeLLltl4AzAB3vsBddHGaP7R9
X-Proofpoint-ORIG-GUID: A52X4ZbyeLLltl4AzAB3vsBddHGaP7R9
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

The firmware coefficient files contain version information that is
currently ignored by the cs_dsp code. This information specifies which
version of the firmware the coefficient were generated for. Add a check
into the code which prints a warning in the case the coefficient and
firmware differ in version, in many cases this will be ok but it is not
always, so best to let the user know there is a potential issue.

Co-authored-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Updated signed-off-bys

 drivers/firmware/cirrus/cs_dsp.c       | 49 +++++++++++++++++++++++++---------
 include/linux/firmware/cirrus/cs_dsp.h |  2 ++
 2 files changed, 38 insertions(+), 13 deletions(-)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index 0d1ba7d8efa47..0da454a8498d0 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -1569,7 +1569,7 @@ EXPORT_SYMBOL_GPL(cs_dsp_find_alg_region);
 
 static struct cs_dsp_alg_region *cs_dsp_create_region(struct cs_dsp *dsp,
 						      int type, __be32 id,
-						      __be32 base)
+						      __be32 ver, __be32 base)
 {
 	struct cs_dsp_alg_region *alg_region;
 
@@ -1579,6 +1579,7 @@ static struct cs_dsp_alg_region *cs_dsp_create_region(struct cs_dsp *dsp,
 
 	alg_region->type = type;
 	alg_region->alg = be32_to_cpu(id);
+	alg_region->ver = be32_to_cpu(ver);
 	alg_region->base = be32_to_cpu(base);
 
 	list_add_tail(&alg_region->list, &dsp->alg_regions);
@@ -1628,14 +1629,14 @@ static void cs_dsp_parse_wmfw_v3_id_header(struct cs_dsp *dsp,
 		    nalgs);
 }
 
-static int cs_dsp_create_regions(struct cs_dsp *dsp, __be32 id, int nregions,
-				 const int *type, __be32 *base)
+static int cs_dsp_create_regions(struct cs_dsp *dsp, __be32 id, __be32 ver,
+				 int nregions, const int *type, __be32 *base)
 {
 	struct cs_dsp_alg_region *alg_region;
 	int i;
 
 	for (i = 0; i < nregions; i++) {
-		alg_region = cs_dsp_create_region(dsp, type[i], id, base[i]);
+		alg_region = cs_dsp_create_region(dsp, type[i], id, ver, base[i]);
 		if (IS_ERR(alg_region))
 			return PTR_ERR(alg_region);
 	}
@@ -1670,12 +1671,14 @@ static int cs_dsp_adsp1_setup_algs(struct cs_dsp *dsp)
 	cs_dsp_parse_wmfw_id_header(dsp, &adsp1_id.fw, n_algs);
 
 	alg_region = cs_dsp_create_region(dsp, WMFW_ADSP1_ZM,
-					  adsp1_id.fw.id, adsp1_id.zm);
+					  adsp1_id.fw.id, adsp1_id.fw.ver,
+					  adsp1_id.zm);
 	if (IS_ERR(alg_region))
 		return PTR_ERR(alg_region);
 
 	alg_region = cs_dsp_create_region(dsp, WMFW_ADSP1_DM,
-					  adsp1_id.fw.id, adsp1_id.dm);
+					  adsp1_id.fw.id, adsp1_id.fw.ver,
+					  adsp1_id.dm);
 	if (IS_ERR(alg_region))
 		return PTR_ERR(alg_region);
 
@@ -1698,6 +1701,7 @@ static int cs_dsp_adsp1_setup_algs(struct cs_dsp *dsp)
 
 		alg_region = cs_dsp_create_region(dsp, WMFW_ADSP1_DM,
 						  adsp1_alg[i].alg.id,
+						  adsp1_alg[i].alg.ver,
 						  adsp1_alg[i].dm);
 		if (IS_ERR(alg_region)) {
 			ret = PTR_ERR(alg_region);
@@ -1719,6 +1723,7 @@ static int cs_dsp_adsp1_setup_algs(struct cs_dsp *dsp)
 
 		alg_region = cs_dsp_create_region(dsp, WMFW_ADSP1_ZM,
 						  adsp1_alg[i].alg.id,
+						  adsp1_alg[i].alg.ver,
 						  adsp1_alg[i].zm);
 		if (IS_ERR(alg_region)) {
 			ret = PTR_ERR(alg_region);
@@ -1771,17 +1776,20 @@ static int cs_dsp_adsp2_setup_algs(struct cs_dsp *dsp)
 	cs_dsp_parse_wmfw_id_header(dsp, &adsp2_id.fw, n_algs);
 
 	alg_region = cs_dsp_create_region(dsp, WMFW_ADSP2_XM,
-					  adsp2_id.fw.id, adsp2_id.xm);
+					  adsp2_id.fw.id, adsp2_id.fw.ver,
+					  adsp2_id.xm);
 	if (IS_ERR(alg_region))
 		return PTR_ERR(alg_region);
 
 	alg_region = cs_dsp_create_region(dsp, WMFW_ADSP2_YM,
-					  adsp2_id.fw.id, adsp2_id.ym);
+					  adsp2_id.fw.id, adsp2_id.fw.ver,
+					  adsp2_id.ym);
 	if (IS_ERR(alg_region))
 		return PTR_ERR(alg_region);
 
 	alg_region = cs_dsp_create_region(dsp, WMFW_ADSP2_ZM,
-					  adsp2_id.fw.id, adsp2_id.zm);
+					  adsp2_id.fw.id, adsp2_id.fw.ver,
+					  adsp2_id.zm);
 	if (IS_ERR(alg_region))
 		return PTR_ERR(alg_region);
 
@@ -1806,6 +1814,7 @@ static int cs_dsp_adsp2_setup_algs(struct cs_dsp *dsp)
 
 		alg_region = cs_dsp_create_region(dsp, WMFW_ADSP2_XM,
 						  adsp2_alg[i].alg.id,
+						  adsp2_alg[i].alg.ver,
 						  adsp2_alg[i].xm);
 		if (IS_ERR(alg_region)) {
 			ret = PTR_ERR(alg_region);
@@ -1827,6 +1836,7 @@ static int cs_dsp_adsp2_setup_algs(struct cs_dsp *dsp)
 
 		alg_region = cs_dsp_create_region(dsp, WMFW_ADSP2_YM,
 						  adsp2_alg[i].alg.id,
+						  adsp2_alg[i].alg.ver,
 						  adsp2_alg[i].ym);
 		if (IS_ERR(alg_region)) {
 			ret = PTR_ERR(alg_region);
@@ -1848,6 +1858,7 @@ static int cs_dsp_adsp2_setup_algs(struct cs_dsp *dsp)
 
 		alg_region = cs_dsp_create_region(dsp, WMFW_ADSP2_ZM,
 						  adsp2_alg[i].alg.id,
+						  adsp2_alg[i].alg.ver,
 						  adsp2_alg[i].zm);
 		if (IS_ERR(alg_region)) {
 			ret = PTR_ERR(alg_region);
@@ -1873,7 +1884,7 @@ static int cs_dsp_adsp2_setup_algs(struct cs_dsp *dsp)
 	return ret;
 }
 
-static int cs_dsp_halo_create_regions(struct cs_dsp *dsp, __be32 id,
+static int cs_dsp_halo_create_regions(struct cs_dsp *dsp, __be32 id, __be32 ver,
 				      __be32 xm_base, __be32 ym_base)
 {
 	static const int types[] = {
@@ -1882,7 +1893,7 @@ static int cs_dsp_halo_create_regions(struct cs_dsp *dsp, __be32 id,
 	};
 	__be32 bases[] = { xm_base, xm_base, ym_base, ym_base };
 
-	return cs_dsp_create_regions(dsp, id, ARRAY_SIZE(types), types, bases);
+	return cs_dsp_create_regions(dsp, id, ver, ARRAY_SIZE(types), types, bases);
 }
 
 static int cs_dsp_halo_setup_algs(struct cs_dsp *dsp)
@@ -1910,7 +1921,7 @@ static int cs_dsp_halo_setup_algs(struct cs_dsp *dsp)
 
 	cs_dsp_parse_wmfw_v3_id_header(dsp, &halo_id.fw, n_algs);
 
-	ret = cs_dsp_halo_create_regions(dsp, halo_id.fw.id,
+	ret = cs_dsp_halo_create_regions(dsp, halo_id.fw.id, halo_id.fw.ver,
 					 halo_id.xm_base, halo_id.ym_base);
 	if (ret)
 		return ret;
@@ -1934,6 +1945,7 @@ static int cs_dsp_halo_setup_algs(struct cs_dsp *dsp)
 			    be32_to_cpu(halo_alg[i].ym_base));
 
 		ret = cs_dsp_halo_create_regions(dsp, halo_alg[i].alg.id,
+						 halo_alg[i].alg.ver,
 						 halo_alg[i].xm_base,
 						 halo_alg[i].ym_base);
 		if (ret)
@@ -1955,7 +1967,7 @@ static int cs_dsp_load_coeff(struct cs_dsp *dsp, const struct firmware *firmware
 	const struct cs_dsp_region *mem;
 	struct cs_dsp_alg_region *alg_region;
 	const char *region_name;
-	int ret, pos, blocks, type, offset, reg;
+	int ret, pos, blocks, type, offset, reg, version;
 	struct cs_dsp_buf *buf;
 
 	if (!firmware)
@@ -1999,6 +2011,7 @@ static int cs_dsp_load_coeff(struct cs_dsp *dsp, const struct firmware *firmware
 
 		type = le16_to_cpu(blk->type);
 		offset = le16_to_cpu(blk->offset);
+		version = le32_to_cpu(blk->ver) >> 8;
 
 		cs_dsp_dbg(dsp, "%s.%d: %x v%d.%d.%d\n",
 			   file, blocks, le32_to_cpu(blk->id),
@@ -2056,6 +2069,16 @@ static int cs_dsp_load_coeff(struct cs_dsp *dsp, const struct firmware *firmware
 			alg_region = cs_dsp_find_alg_region(dsp, type,
 							    le32_to_cpu(blk->id));
 			if (alg_region) {
+				if (version != alg_region->ver)
+					cs_dsp_warn(dsp,
+						    "Algorithm coefficient version %d.%d.%d but expected %d.%d.%d\n",
+						   (version >> 16) & 0xFF,
+						   (version >> 8) & 0xFF,
+						   version & 0xFF,
+						   (alg_region->ver >> 16) & 0xFF,
+						   (alg_region->ver >> 8) & 0xFF,
+						   alg_region->ver & 0xFF);
+
 				reg = alg_region->base;
 				reg = dsp->ops->region_to_reg(mem, reg);
 				reg += offset;
diff --git a/include/linux/firmware/cirrus/cs_dsp.h b/include/linux/firmware/cirrus/cs_dsp.h
index 3a54b1afc48fc..ce54705e2becf 100644
--- a/include/linux/firmware/cirrus/cs_dsp.h
+++ b/include/linux/firmware/cirrus/cs_dsp.h
@@ -54,12 +54,14 @@ struct cs_dsp_region {
  * struct cs_dsp_alg_region - Describes a logical algorithm region in DSP address space
  * @list:	List node for internal use
  * @alg:	Algorithm id
+ * @ver:	Expected algorithm version
  * @type:	Memory region type
  * @base:	Address of region
  */
 struct cs_dsp_alg_region {
 	struct list_head list;
 	unsigned int alg;
+	unsigned int ver;
 	int type;
 	unsigned int base;
 };
-- 
2.11.0

