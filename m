Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A002E7B8C
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Dec 2020 18:26:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EEEE1847;
	Wed, 30 Dec 2020 18:25:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EEEE1847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609349190;
	bh=qVcm01fTdpC+HPLTI0HQV04UJbNR5/gdhqO9VDOyvQM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=O6MBBxGYyAdLmgIwSxoiPk7GW9OTu09OTukbNCvB64L/uhqeLLz6tKUgGqn9MuKK2
	 e1Ok3wN2CF3qZRRjokOWIf43w5Fn2Ag9EB5SyqAYoa1cbUPx1ff+KkdQfraHAXMEoX
	 AivrCIsBZWHVy6Ct7sCrDQCKFnOPSvqpARaplqYU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF05EF80249;
	Wed, 30 Dec 2020 18:24:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 223B2F801F5; Wed, 30 Dec 2020 18:24:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C3D0F801ED
 for <alsa-devel@alsa-project.org>; Wed, 30 Dec 2020 18:24:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C3D0F801ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="GEKin0jN"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0BUHHJba022267; Wed, 30 Dec 2020 11:24:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=nHfeDmUdDzzSQruILSReW1tu+QSdBTHweUHxHjYb7hQ=;
 b=GEKin0jN1G/ffhlw6Io2EM2Ribit5RxAcANYkZ2e2tyjfmbOrZFs2BxIaNG0RWiL/6D2
 x1XTHGbNfZPIyCeZgCF5czUWJ+MRiCw8y/aLHTxhU7lrppgA2TYl0cBZWEefeK5t3+9M
 9DPGOpQypc4FQRhfVBRvsjr4hC/LcAz11K+XAF3+WAIDcrlgddR6nR3prNG4IQ83GHTR
 Gu2lgNyH2K+CV8l0Lnbl/JtnYtX41HvzDItxjVn+/4qJW12u2eIOCFb8Q7fSwGNU3Qbv
 MHb2ksSjIKyZPVl1bU3SPfxKZDOINOvVDlbrlOOMZwR/2ce6/ZazQitgB0Ooa/UuWnoI Lw== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 35p2fs3gmx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 30 Dec 2020 11:24:33 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Wed, 30 Dec
 2020 17:24:32 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Wed, 30 Dec 2020 17:24:32 +0000
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.64.77])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4DD4345;
 Wed, 30 Dec 2020 17:24:31 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 1/2] ASoC: wm_adsp: Only use __be32 for big-endian data
Date: Wed, 30 Dec 2020 17:24:26 +0000
Message-ID: <20201230172427.13865-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 impostorscore=0 mlxscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 mlxlogscore=999 spamscore=0 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012300108
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org
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

This fixes some minor cases where u32 or unsigned int types were used
to store big-endian data, and __be32 types used to store both big-endian
and cpu-endian data. This was producing sparse warnings.

Most cases resulted from using the same variable to hold the big-endian
value and its converted cpu-endian value. These can be simply fixed by
introducing another local variable, or avoiding storing the intermediate
value back into the original variable.

One special case is the raw_buf used in the compressed streams to transfer
data from DSP to user-side. The endian conversion happens in-place (as
there's no point introducing another buffer) so a cast to (__be32 *) is
added when passing it to wm_adsp_read_raw_data_block().

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 33 ++++++++++++++++-----------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 5b7d81a91df3..8cfa8ac1b8c4 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -980,7 +980,7 @@ static int wm_coeff_write_acked_control(struct wm_coeff_ctl *ctl,
 					unsigned int event_id)
 {
 	struct wm_adsp *dsp = ctl->dsp;
-	u32 val = cpu_to_be32(event_id);
+	__be32 val = cpu_to_be32(event_id);
 	unsigned int reg;
 	int i, ret;
 
@@ -3704,6 +3704,7 @@ static int wm_adsp_write_data_word(struct wm_adsp *dsp, int mem_type,
 				   unsigned int mem_addr, u32 data)
 {
 	struct wm_adsp_region const *mem = wm_adsp_find_region(dsp, mem_type);
+	__be32 val = cpu_to_be32(data & 0x00ffffffu);
 	unsigned int reg;
 
 	if (!mem)
@@ -3711,9 +3712,7 @@ static int wm_adsp_write_data_word(struct wm_adsp *dsp, int mem_type,
 
 	reg = dsp->ops->region_to_reg(mem, mem_addr);
 
-	data = cpu_to_be32(data & 0x00ffffffu);
-
-	return regmap_raw_write(dsp->regmap, reg, &data, sizeof(data));
+	return regmap_raw_write(dsp->regmap, reg, &val, sizeof(val));
 }
 
 static inline int wm_adsp_buffer_read(struct wm_adsp_compr_buf *buf,
@@ -3870,7 +3869,8 @@ static int wm_adsp_buffer_parse_coeff(struct wm_coeff_ctl *ctl)
 {
 	struct wm_adsp_host_buf_coeff_v1 coeff_v1;
 	struct wm_adsp_compr_buf *buf;
-	unsigned int val, reg;
+	unsigned int reg, version;
+	__be32 bufp;
 	int ret, i;
 
 	ret = wm_coeff_base_reg(ctl, &reg);
@@ -3878,17 +3878,17 @@ static int wm_adsp_buffer_parse_coeff(struct wm_coeff_ctl *ctl)
 		return ret;
 
 	for (i = 0; i < 5; ++i) {
-		ret = regmap_raw_read(ctl->dsp->regmap, reg, &val, sizeof(val));
+		ret = regmap_raw_read(ctl->dsp->regmap, reg, &bufp, sizeof(bufp));
 		if (ret < 0)
 			return ret;
 
-		if (val)
+		if (bufp)
 			break;
 
 		usleep_range(1000, 2000);
 	}
 
-	if (!val) {
+	if (!bufp) {
 		adsp_err(ctl->dsp, "Failed to acquire host buffer\n");
 		return -EIO;
 	}
@@ -3898,7 +3898,7 @@ static int wm_adsp_buffer_parse_coeff(struct wm_coeff_ctl *ctl)
 		return -ENOMEM;
 
 	buf->host_buf_mem_type = ctl->alg_region.type;
-	buf->host_buf_ptr = be32_to_cpu(val);
+	buf->host_buf_ptr = be32_to_cpu(bufp);
 
 	ret = wm_adsp_buffer_populate(buf);
 	if (ret < 0)
@@ -3918,14 +3918,13 @@ static int wm_adsp_buffer_parse_coeff(struct wm_coeff_ctl *ctl)
 	if (ret < 0)
 		return ret;
 
-	coeff_v1.versions = be32_to_cpu(coeff_v1.versions);
-	val = coeff_v1.versions & HOST_BUF_COEFF_COMPAT_VER_MASK;
-	val >>= HOST_BUF_COEFF_COMPAT_VER_SHIFT;
+	version = be32_to_cpu(coeff_v1.versions) & HOST_BUF_COEFF_COMPAT_VER_MASK;
+	version >>= HOST_BUF_COEFF_COMPAT_VER_SHIFT;
 
-	if (val > HOST_BUF_COEFF_SUPPORTED_COMPAT_VER) {
+	if (version > HOST_BUF_COEFF_SUPPORTED_COMPAT_VER) {
 		adsp_err(ctl->dsp,
 			 "Host buffer coeff ver %u > supported version %u\n",
-			 val, HOST_BUF_COEFF_SUPPORTED_COMPAT_VER);
+			 version, HOST_BUF_COEFF_SUPPORTED_COMPAT_VER);
 		return -EINVAL;
 	}
 
@@ -3935,9 +3934,9 @@ static int wm_adsp_buffer_parse_coeff(struct wm_coeff_ctl *ctl)
 			      (char *)&coeff_v1.name);
 
 	compr_dbg(buf, "host_buf_ptr=%x coeff version %u\n",
-		  buf->host_buf_ptr, val);
+		  buf->host_buf_ptr, version);
 
-	return val;
+	return version;
 }
 
 static int wm_adsp_buffer_init(struct wm_adsp *dsp)
@@ -4269,7 +4268,7 @@ static int wm_adsp_buffer_capture_block(struct wm_adsp_compr *compr, int target)
 
 	/* Read data from DSP */
 	ret = wm_adsp_read_raw_data_block(buf->dsp, mem_type, adsp_addr,
-					  nwords, compr->raw_buf);
+					  nwords, (__be32 *)compr->raw_buf);
 	if (ret < 0)
 		return ret;
 
-- 
2.20.1

