Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7CE63665B
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Nov 2022 17:59:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E38716DB;
	Wed, 23 Nov 2022 17:58:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E38716DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669222780;
	bh=8iI2qLXCjg+O0nmV8IaJ1LBkZNXdhB20vMpSomLEuI4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l4axHQkDtX9ga85xTZ4O/T3FFMH9OrZZJyVjMcy6r03lsJ0YXIIM7+GO+fE7RcuzC
	 CscuJSGKFd4GRCJZSrIKbl986B6Xqygu2mcFcMnEHuI2u0nGQkkZggRmVP34am8XYv
	 MM+n7GuEPW0RgNWr/GHsS7PhGKUD4QV9B37ZSxSc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 881B5F8052E;
	Wed, 23 Nov 2022 17:58:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7FB11F80249; Wed, 23 Nov 2022 17:58:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58035F80249
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 17:58:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58035F80249
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="jGTSRilq"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2ANFXduS006384; Wed, 23 Nov 2022 10:58:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=undvmwFEvRPQUPi2f8r9jtjOCibt7dyqMNuLYGsabHA=;
 b=jGTSRilqRr9YvM1dN69kSrNkh7nEcrdmnL4+K8Od+wubOfipjVfq88QqcV36r4ye1T6+
 m94Qpd5+VF2giKfCyKxGaE4J9dCAl/EBhzTyUjhwYxomVSiXKFYxbrRC/dr7OtBeQVzO
 WxqS+p7EbAncyI2I6Qm2iMTaQghCXLzS1mAnb0exjzVKJsYZKFZl1b4Hb4njWqkfMJvu
 MQmraK9TWG01R4J5v8FRef8+MLXEWc9bSFv8zX4c/N/FtBeq7rwyqgrsitMHW7Vl53js
 srus0QbBu2CaYXcl7h0+OQ5QXlX79FiM3HGozYfYF9NzIkrVTRPHmHPy/vEwdYwQgbXv HA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3kxwe6w536-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Nov 2022 10:58:13 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Wed, 23 Nov
 2022 10:58:11 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.20 via Frontend Transport; Wed, 23 Nov 2022 10:58:11 -0600
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.111])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6E18AB10;
 Wed, 23 Nov 2022 16:58:11 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH v2 1/2] firmware: cs_dsp: cs_dsp_coeff_write_ctrl() should
 report changed
Date: Wed, 23 Nov 2022 16:58:10 +0000
Message-ID: <20221123165811.3014472-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221123165811.3014472-1-rf@opensource.cirrus.com>
References: <20221123165811.3014472-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: n7iAUIsEFDAu8asQrDFFZNuM1FtzhEfb
X-Proofpoint-GUID: n7iAUIsEFDAu8asQrDFFZNuM1FtzhEfb
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
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

From: Simon Trimmer <simont@opensource.cirrus.com>

ALSA callers need to know whether there was a change to the value so
that they can report a control write change correctly.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/firmware/cirrus/cs_dsp.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index 81cc3d0f6eec..17b7198b87dc 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -752,7 +752,7 @@ static int cs_dsp_coeff_write_ctrl_raw(struct cs_dsp_coeff_ctl *ctl,
  *
  * Must be called with pwr_lock held.
  *
- * Return: Zero for success, a negative number on error.
+ * Return: < 0 on error, 1 when the control value changed and 0 when it has not.
  */
 int cs_dsp_coeff_write_ctrl(struct cs_dsp_coeff_ctl *ctl,
 			    unsigned int off, const void *buf, size_t len)
@@ -767,16 +767,23 @@ int cs_dsp_coeff_write_ctrl(struct cs_dsp_coeff_ctl *ctl,
 	if (len + off * sizeof(u32) > ctl->len)
 		return -EINVAL;
 
-	if (ctl->flags & WMFW_CTL_FLAG_VOLATILE)
+	if (ctl->flags & WMFW_CTL_FLAG_VOLATILE) {
 		ret = -EPERM;
-	else if (buf != ctl->cache)
-		memcpy(ctl->cache + off * sizeof(u32), buf, len);
+	} else if (buf != ctl->cache) {
+		if (memcmp(ctl->cache + off * sizeof(u32), buf, len))
+			memcpy(ctl->cache + off * sizeof(u32), buf, len);
+		else
+			return 0;
+	}
 
 	ctl->set = 1;
 	if (ctl->enabled && ctl->dsp->running)
 		ret = cs_dsp_coeff_write_ctrl_raw(ctl, off, buf, len);
 
-	return ret;
+	if (ret < 0)
+		return ret;
+
+	return 1;
 }
 EXPORT_SYMBOL_GPL(cs_dsp_coeff_write_ctrl);
 
-- 
2.30.2

