Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7754B140E
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Feb 2022 18:22:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFEE71A9E;
	Thu, 10 Feb 2022 18:21:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFEE71A9E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644513732;
	bh=w7uwVl4mP3o01g2Uv4Bnz0wdOJQcMeql3F1iyXNWTzo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BiUdxtvzppXhkUYuuaw8TulGeXQJmTKWPcXWa7GPU05PM9H6mlMMYSjFmZXWhd+Rb
	 EyLaN54MVwTaWKyFdYihKr5VTMFp8/mdB9YooUSgVMhAAs4+hX6P4BgMZr8+TcYOon
	 UGUb9W7G/a4sXwxpv8wzCwnXWarzFOKgvb95d6Tg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5949BF8016C;
	Thu, 10 Feb 2022 18:21:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7FFAFF80423; Thu, 10 Feb 2022 18:21:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64C5CF80054
 for <alsa-devel@alsa-project.org>; Thu, 10 Feb 2022 18:20:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64C5CF80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="omHt6ylG"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21AEBvVi026091;
 Thu, 10 Feb 2022 11:20:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=bmZTuOO/Gj022BXF+TJK2aROHFrRP13ng3PUabwtbUM=;
 b=omHt6ylGaiUfPDL1SYqKOP83EgX2nm9ksGXOrXMuB9B3L/sicM5qTH5YIW6qRIQlvuem
 EEXjMbLnGEStb+/zOi1CzHEWr9Pa9TPHp3ZBSvwxJja8fkNRMieawa+cNmGhAxnB8cUl
 CXmMJhHtWfJB3vRcKZL79Z07FTooWj+Ke7JpQH7qMOBkbEaMdaI/qQA8Qds4z8Hb3tjx
 13FcZtZefwqT21NaWO6uI/6m5UAjMJDqvcnSimIDnp83QVjdJF6TOsxvriA0beSd8YzD
 aIVTHTYRO88cYM6CsmYdGQtEMtWnPDpdhDK804zaMy/HRjw45ocfkMHOqY2/AtnlQqWR Eg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3e4brb9y38-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 10 Feb 2022 11:20:56 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 10 Feb
 2022 17:20:53 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Thu, 10 Feb 2022 17:20:53 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 3F80811DC;
 Thu, 10 Feb 2022 17:20:53 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 2/3] ASoC: wm_adsp: Make compressed buffers optional
Date: Thu, 10 Feb 2022 17:20:52 +0000
Message-ID: <20220210172053.22782-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220210172053.22782-1-ckeepax@opensource.cirrus.com>
References: <20220210172053.22782-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 9OQ-02tKgo1BFRy9-2MbDD_HEihTUppK
X-Proofpoint-GUID: 9OQ-02tKgo1BFRy9-2MbDD_HEihTUppK
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Vlad.Karpovich@cirrus.com, lgirdwood@gmail.com
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

Newer firmwares will support compressed buffers that may or may not
exist, for example debugging streams. Update the driver to make a
compressed stream optional. A warning will still be generated at DSP
boot time and opening the stream will fail if the compressed buffer in
question does not exist, however the DSP can still be booted and other
features used.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 54 ++++++++++++++++++++++++++++------------------
 1 file changed, 33 insertions(+), 21 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 0582585236a28..8e5ebc4838ec3 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -1373,8 +1373,6 @@ static struct wm_adsp_compr_buf *wm_adsp_buffer_alloc(struct wm_adsp *dsp)
 
 	wm_adsp_buffer_clear(buf);
 
-	list_add_tail(&buf->list, &dsp->buffer_list);
-
 	return buf;
 }
 
@@ -1391,10 +1389,6 @@ static int wm_adsp_buffer_parse_legacy(struct wm_adsp *dsp)
 		return -EINVAL;
 	}
 
-	buf = wm_adsp_buffer_alloc(dsp);
-	if (!buf)
-		return -ENOMEM;
-
 	xmalg = dsp->sys_config_size / sizeof(__be32);
 
 	addr = alg_region->base + xmalg + ALG_XM_FIELD(magic);
@@ -1405,12 +1399,16 @@ static int wm_adsp_buffer_parse_legacy(struct wm_adsp *dsp)
 	if (magic != WM_ADSP_ALG_XM_STRUCT_MAGIC)
 		return -ENODEV;
 
+	buf = wm_adsp_buffer_alloc(dsp);
+	if (!buf)
+		return -ENOMEM;
+
 	addr = alg_region->base + xmalg + ALG_XM_FIELD(host_buf_ptr);
 	for (i = 0; i < 5; ++i) {
 		ret = cs_dsp_read_data_word(&dsp->cs_dsp, WMFW_ADSP2_XM, addr,
 					    &buf->host_buf_ptr);
 		if (ret < 0)
-			return ret;
+			goto err;
 
 		if (buf->host_buf_ptr)
 			break;
@@ -1418,18 +1416,27 @@ static int wm_adsp_buffer_parse_legacy(struct wm_adsp *dsp)
 		usleep_range(1000, 2000);
 	}
 
-	if (!buf->host_buf_ptr)
-		return -EIO;
+	if (!buf->host_buf_ptr) {
+		ret = -EIO;
+		goto err;
+	}
 
 	buf->host_buf_mem_type = WMFW_ADSP2_XM;
 
 	ret = wm_adsp_buffer_populate(buf);
 	if (ret < 0)
-		return ret;
+		goto err;
+
+	list_add_tail(&buf->list, &dsp->buffer_list);
 
 	compr_dbg(buf, "legacy host_buf_ptr=%x\n", buf->host_buf_ptr);
 
 	return 0;
+
+err:
+	kfree(buf);
+
+	return ret;
 }
 
 static int wm_adsp_buffer_parse_coeff(struct cs_dsp_coeff_ctl *cs_ctl)
@@ -1437,7 +1444,7 @@ static int wm_adsp_buffer_parse_coeff(struct cs_dsp_coeff_ctl *cs_ctl)
 	struct wm_adsp_host_buf_coeff_v1 coeff_v1;
 	struct wm_adsp_compr_buf *buf;
 	struct wm_adsp *dsp = container_of(cs_ctl->dsp, struct wm_adsp, cs_dsp);
-	unsigned int version;
+	unsigned int version = 0;
 	int ret, i;
 
 	for (i = 0; i < 5; ++i) {
@@ -1466,16 +1473,14 @@ static int wm_adsp_buffer_parse_coeff(struct cs_dsp_coeff_ctl *cs_ctl)
 
 	ret = wm_adsp_buffer_populate(buf);
 	if (ret < 0)
-		return ret;
+		goto err;
 
 	/*
 	 * v0 host_buffer coefficients didn't have versioning, so if the
 	 * control is one word, assume version 0.
 	 */
-	if (cs_ctl->len == 4) {
-		compr_dbg(buf, "host_buf_ptr=%x\n", buf->host_buf_ptr);
-		return 0;
-	}
+	if (cs_ctl->len == 4)
+		goto done;
 
 	version = be32_to_cpu(coeff_v1.versions) & HOST_BUF_COEFF_COMPAT_VER_MASK;
 	version >>= HOST_BUF_COEFF_COMPAT_VER_SHIFT;
@@ -1484,7 +1489,8 @@ static int wm_adsp_buffer_parse_coeff(struct cs_dsp_coeff_ctl *cs_ctl)
 		adsp_err(dsp,
 			 "Host buffer coeff ver %u > supported version %u\n",
 			 version, HOST_BUF_COEFF_SUPPORTED_COMPAT_VER);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err;
 	}
 
 	cs_dsp_remove_padding((u32 *)&coeff_v1.name, ARRAY_SIZE(coeff_v1.name));
@@ -1492,10 +1498,18 @@ static int wm_adsp_buffer_parse_coeff(struct cs_dsp_coeff_ctl *cs_ctl)
 	buf->name = kasprintf(GFP_KERNEL, "%s-dsp-%s", dsp->part,
 			      (char *)&coeff_v1.name);
 
+done:
+	list_add_tail(&buf->list, &dsp->buffer_list);
+
 	compr_dbg(buf, "host_buf_ptr=%x coeff version %u\n",
 		  buf->host_buf_ptr, version);
 
 	return version;
+
+err:
+	kfree(buf);
+
+	return ret;
 }
 
 static int wm_adsp_buffer_init(struct wm_adsp *dsp)
@@ -1523,10 +1537,8 @@ static int wm_adsp_buffer_init(struct wm_adsp *dsp)
 	if (list_empty(&dsp->buffer_list)) {
 		/* Fall back to legacy support */
 		ret = wm_adsp_buffer_parse_legacy(dsp);
-		if (ret) {
-			adsp_err(dsp, "Failed to parse legacy: %d\n", ret);
-			goto error;
-		}
+		if (ret)
+			adsp_warn(dsp, "Failed to parse legacy: %d\n", ret);
 	}
 
 	return 0;
-- 
2.11.0

