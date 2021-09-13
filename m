Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47969409843
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Sep 2021 18:03:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0AE21695;
	Mon, 13 Sep 2021 18:02:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0AE21695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631549009;
	bh=N0QUUU2HQq4ArDS+U0yWRWJn9YlUsc6NGpUFQr/y/sY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ftCdmfb9vmMq0d/tY8Sa4YQ3tEglhisbrjj809+oeTLrO4ULCVvb5isaqPLPwjUY/
	 YEbJwz+ExBGZpkQK6eZzU8Sl7ZVO2GgL3JtY3RZvA+qDFScynICcwkj6E72yj1ZYGc
	 j7+KOQ7sZiSBGef3rN0Uqr7jzOBL/driMCv1ts3s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5554EF804ED;
	Mon, 13 Sep 2021 18:01:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D48A5F80128; Mon, 13 Sep 2021 18:01:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2EB3EF80128
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 18:01:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EB3EF80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="TSrb4orT"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18DAEA6N014550; 
 Mon, 13 Sep 2021 11:01:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=kd7HwlHwt18qgeDb7UqgfVXVNIZB6qoOcVxR90CXHl4=;
 b=TSrb4orT8kawL6iscEjgt2X78Omb8ngLxwQ3r9K0BCVAKVXhb0gJ/pdCa+kwU8Bo9Iga
 DZk5bA+mQoTbVpwMG5t1qpWGsOgmGr8GGIPNb5aC1fVhYrq8EQ/D4HFqMpLjM+DhXmpe
 lyqs5HLGAOcs4DSTkSvBLfIXAZwLMZVZAIrJoUQo96++O+aJQfRVINnFa8hEzpmgPKK0
 l1/nNMmAvMt1c8ykp6sJLqNzgG0+d2xhnGrpcYtrz9uiqB82fNyFLMDuMvtODnqqTla1
 d7e3awGkTjQ6anQEchUR5fpN0V/VhJKFqgqJaIpRSI0La+/N4k8vfr1VtFtjkSN0L8C/ EA== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3b1n5drxkd-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 13 Sep 2021 11:01:21 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Mon, 13 Sep
 2021 17:01:18 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Mon, 13 Sep 2021 17:01:18 +0100
Received: from simont-vb.lan?044ad.cirrus.com (unknown [198.90.238.152])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 756262A9;
 Mon, 13 Sep 2021 16:01:18 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH 03/16] ASoC: wm_adsp: Switch to using wm_coeff_read_ctrl for
 compressed buffers
Date: Mon, 13 Sep 2021 17:00:44 +0100
Message-ID: <20210913160057.103842-4-simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210913160057.103842-1-simont@opensource.cirrus.com>
References: <20210913160057.103842-1-simont@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: I3YWvJ4wy9kZkMSc-UklCNoRqb0VAUJ3
X-Proofpoint-ORIG-GUID: I3YWvJ4wy9kZkMSc-UklCNoRqb0VAUJ3
X-Proofpoint-Spam-Reason: safe
Cc: Simon Trimmer <simont@opensource.cirrus.com>, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 linux-kernel@vger.kernel.org
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

From: Charles Keepax <ckeepax@opensource.cirrus.com>

When parsing a compressed buffer from the firmware the driver currently
open codes reading the firmware coefficient containing the buffer
description. Improve this slightly by using the coefficient read
functions already provided by the wm_adsp driver. It is worth noting
this change requires the running variable to be set before
wm_adsp_buffer_init is called, however this is safe, since its all still
under the power lock and nothing in the compressed code gates itself on
running.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index b300af6fdd41..9c3d4b96fd7c 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -3277,14 +3277,14 @@ int wm_adsp_event(struct snd_soc_dapm_widget *w,
 				goto err;
 		}
 
+		dsp->running = true;
+
 		if (wm_adsp_fw[dsp->fw].num_caps != 0) {
 			ret = wm_adsp_buffer_init(dsp);
 			if (ret < 0)
 				goto err;
 		}
 
-		dsp->running = true;
-
 		mutex_unlock(&dsp->pwr_lock);
 		break;
 
@@ -3869,26 +3869,21 @@ static int wm_adsp_buffer_parse_coeff(struct wm_coeff_ctl *ctl)
 {
 	struct wm_adsp_host_buf_coeff_v1 coeff_v1;
 	struct wm_adsp_compr_buf *buf;
-	unsigned int reg, version;
-	__be32 bufp;
+	unsigned int version;
 	int ret, i;
 
-	ret = wm_coeff_base_reg(ctl, &reg);
-	if (ret)
-		return ret;
-
 	for (i = 0; i < 5; ++i) {
-		ret = regmap_raw_read(ctl->dsp->regmap, reg, &bufp, sizeof(bufp));
+		ret = wm_coeff_read_ctrl(ctl, &coeff_v1, sizeof(coeff_v1));
 		if (ret < 0)
 			return ret;
 
-		if (bufp)
+		if (coeff_v1.host_buf_ptr)
 			break;
 
 		usleep_range(1000, 2000);
 	}
 
-	if (!bufp) {
+	if (!coeff_v1.host_buf_ptr) {
 		adsp_err(ctl->dsp, "Failed to acquire host buffer\n");
 		return -EIO;
 	}
@@ -3898,7 +3893,7 @@ static int wm_adsp_buffer_parse_coeff(struct wm_coeff_ctl *ctl)
 		return -ENOMEM;
 
 	buf->host_buf_mem_type = ctl->alg_region.type;
-	buf->host_buf_ptr = be32_to_cpu(bufp);
+	buf->host_buf_ptr = be32_to_cpu(coeff_v1.host_buf_ptr);
 
 	ret = wm_adsp_buffer_populate(buf);
 	if (ret < 0)
@@ -3913,11 +3908,6 @@ static int wm_adsp_buffer_parse_coeff(struct wm_coeff_ctl *ctl)
 		return 0;
 	}
 
-	ret = regmap_raw_read(ctl->dsp->regmap, reg, &coeff_v1,
-			      sizeof(coeff_v1));
-	if (ret < 0)
-		return ret;
-
 	version = be32_to_cpu(coeff_v1.versions) & HOST_BUF_COEFF_COMPAT_VER_MASK;
 	version >>= HOST_BUF_COEFF_COMPAT_VER_SHIFT;
 
-- 
2.33.0

