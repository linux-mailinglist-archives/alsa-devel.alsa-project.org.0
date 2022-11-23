Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80785636276
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Nov 2022 15:53:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25A701685;
	Wed, 23 Nov 2022 15:52:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25A701685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669215214;
	bh=3bwt6dvXF/V1G8FOhCZElZ58leuQE5hIF8buAzz/D5g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UiaxX2DFJIr0PU2v3ufintMJlnnx9bekAaOipzGFz3d1bcBkhrUwySd34W3c28FUI
	 aIFpnpOpHowX7scawezW5z2jkdjUlO+qso6B+74xdj/uQYkUYAKp8u9NoUX1rngzTi
	 mnXa2bZugdXjddf4Gh5HTPYI45Bwcr21/hqP8Ykk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D478F800BB;
	Wed, 23 Nov 2022 15:51:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58F39F80557; Wed, 23 Nov 2022 15:51:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92AB1F80249
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 15:51:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92AB1F80249
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="KDRQK8/+"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AN7beZl029400; Wed, 23 Nov 2022 08:51:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=bIfpAGBt40UBSTkshq1rt/7yCo42+WIeyjdXEHc6Y2A=;
 b=KDRQK8/+NEMLoE3/2etiJuhgA0bYTz2SmUXGb4ut+rXBrvcpGKqS1t4XxzAAdZaiY4Hz
 4OPlpj8aGiewKk/BcODXAm3pwKq2V+1m4ahHlWzzY911gpeHk023nOnArr8wYZz2YUXg
 qRoNgqczPje+aSG6NBbonf4rAo763m3IXY5g7J2mqgEX/XNtoAyxsOmW4/OPjY5dJ063
 /Zs9H/oxnNWLvqV4VB26jl+UqDi9bygYvV1ba73LVY3nXShIXKKM1+lOC4OsBGqXLfbL
 8LRMElRSgIaIS9An29+N/p4X3mfqTywl0WOFotd98/o+KjcnidQkboAY+/HVbuGUm0Dz Ng== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3kxwe6w04h-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Nov 2022 08:51:43 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Wed, 23 Nov
 2022 08:51:40 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.20 via
 Frontend Transport; Wed, 23 Nov 2022 08:51:40 -0600
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.111])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5F56EB10;
 Wed, 23 Nov 2022 14:51:40 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 2/2] ASoC: wm_adsp: Return whether changed when writing
 controls
Date: Wed, 23 Nov 2022 14:51:40 +0000
Message-ID: <20221123145140.2784030-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221123145140.2784030-1-rf@opensource.cirrus.com>
References: <20221123145140.2784030-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: JqgZWqMS2z8PdX-yZIPHyvOFJaxoVDVa
X-Proofpoint-GUID: JqgZWqMS2z8PdX-yZIPHyvOFJaxoVDVa
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

Functions that update cs_dsp controls need to handle return codes that
indicate whether the control value changed. A return code of 1 indicates
a change, 0 indicates no-change and a negative value is an error
condition.

Acked controls implicitly change value when written so a successful
write shall always report that the value changed.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 34a94b011518..9b1b522c9350 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -419,16 +419,21 @@ static int wm_coeff_tlv_put(struct snd_kcontrol *kctl,
 		(struct soc_bytes_ext *)kctl->private_value;
 	struct wm_coeff_ctl *ctl = bytes_ext_to_ctl(bytes_ext);
 	struct cs_dsp_coeff_ctl *cs_ctl = ctl->cs_ctl;
+	void *scratch;
 	int ret = 0;
 
-	mutex_lock(&cs_ctl->dsp->pwr_lock);
+	scratch = vmalloc(size);
+	if (!scratch)
+		return -ENOMEM;
 
-	if (copy_from_user(cs_ctl->cache, bytes, size))
+	if (copy_from_user(scratch, bytes, size)) {
 		ret = -EFAULT;
-	else
-		ret = cs_dsp_coeff_write_ctrl(cs_ctl, 0, cs_ctl->cache, size);
-
-	mutex_unlock(&cs_ctl->dsp->pwr_lock);
+	} else {
+		mutex_lock(&cs_ctl->dsp->pwr_lock);
+		ret = cs_dsp_coeff_write_ctrl(cs_ctl, 0, scratch, size);
+		mutex_unlock(&cs_ctl->dsp->pwr_lock);
+	}
+	vfree(scratch);
 
 	return ret;
 }
@@ -455,7 +460,10 @@ static int wm_coeff_put_acked(struct snd_kcontrol *kctl,
 
 	mutex_unlock(&cs_ctl->dsp->pwr_lock);
 
-	return ret;
+	if (ret < 0)
+		return ret;
+
+	return 1;
 }
 
 static int wm_coeff_get(struct snd_kcontrol *kctl,
@@ -682,10 +690,10 @@ int wm_adsp_write_ctl(struct wm_adsp *dsp, const char *name, int type,
 	int ret;
 
 	ret = cs_dsp_coeff_write_ctrl(cs_ctl, 0, buf, len);
-	if (ret)
+	if (ret < 0)
 		return ret;
 
-	if (cs_ctl->flags & WMFW_CTL_FLAG_SYS)
+	if (ret == 0 || (cs_ctl->flags & WMFW_CTL_FLAG_SYS))
 		return 0;
 
 	ctl = cs_ctl->priv;
-- 
2.30.2

