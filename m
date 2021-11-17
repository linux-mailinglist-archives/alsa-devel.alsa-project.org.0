Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E199F45472C
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Nov 2021 14:26:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7825818D1;
	Wed, 17 Nov 2021 14:25:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7825818D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637155583;
	bh=3fV/B9AlZYXuH8HlDffUvRhvPsD8016wWe/MtGSG/ak=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p0rK++c5eaevCI5P+wDuEaES1ikeai5arbS2W2bFtGz4qnR1X3E/5SpcuYii2C988
	 G9dnJ216XZyBS5G/uOQMJ9CFvlYpKzfJB9IfrzUIPDFnadtO0QBZrqGhOQtGSin/KX
	 Km7NLpwQikpPaDogt7wD2r5p0h3KDNNENpzDdwSw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79756F80518;
	Wed, 17 Nov 2021 14:23:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3621F804FB; Wed, 17 Nov 2021 14:23:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E68CF8028B
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 14:23:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E68CF8028B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="AbX53eWe"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AH4qhZa020405;
 Wed, 17 Nov 2021 07:23:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=z0nJe9uGRxEe0PLwiAfAnOPr7nVq5vC8ndE2yaGCud4=;
 b=AbX53eWesfhGWlKKDjuTkVTQp12+HmvgHD4m5R8rOY/yg4sufVsZffxXyclLsecJRjwo
 lXSjcgyaIOzX8eRSJDSoT6Gv3r51wXCrAOhQjJnBKebKEZ6rpt2cLDVG3eHg/ylcuX5h
 3TcpTq5wQnIK+jMQlTSjE4Ps2Cr5PCSSBqgWLGK7YvEJRzHlJ4R0yTLm5m1xHfEAt9DS
 VgnFOmzQJS59Q7pe9CraKTtls6GIwRt5jxIbnqKYQ4hLJa+qkdLhghSCsxMgxw1ED0zw
 TKCXdllrC2VNjqwXae15r1SYetojYJ/ksAVP732ERtb7FEk+xu0ezk7Pj9d5c+L+fOOD 8g== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ccgtn14sf-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 17 Nov 2021 07:23:02 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 17 Nov
 2021 13:23:00 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Wed, 17 Nov 2021 13:23:00 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 83DFC11AF;
 Wed, 17 Nov 2021 13:23:00 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH v2 02/10] firmware: cs_dsp: Add lockdep asserts to interface
 functions
Date: Wed, 17 Nov 2021 13:22:52 +0000
Message-ID: <20211117132300.1290-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211117132300.1290-1-ckeepax@opensource.cirrus.com>
References: <20211117132300.1290-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: LSswTg3YIVriS7ml3mSbLVCXoV7FQqDq
X-Proofpoint-ORIG-GUID: LSswTg3YIVriS7ml3mSbLVCXoV7FQqDq
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

Some of the control functions exposed by the cs_dsp code require the
pwr_lock to be held by the caller. Add lockdep_assert_held calls to
ensure this is done correctly.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/firmware/cirrus/cs_dsp.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index 1a0c6c793f6a7..0d1ba7d8efa47 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -653,6 +653,8 @@ int cs_dsp_coeff_write_acked_control(struct cs_dsp_coeff_ctl *ctl, unsigned int
 	unsigned int reg;
 	int i, ret;
 
+	lockdep_assert_held(&dsp->pwr_lock);
+
 	if (!dsp->running)
 		return -EPERM;
 
@@ -754,6 +756,8 @@ int cs_dsp_coeff_write_ctrl(struct cs_dsp_coeff_ctl *ctl, const void *buf, size_
 {
 	int ret = 0;
 
+	lockdep_assert_held(&ctl->dsp->pwr_lock);
+
 	if (ctl->flags & WMFW_CTL_FLAG_VOLATILE)
 		ret = -EPERM;
 	else if (buf != ctl->cache)
@@ -811,6 +815,8 @@ int cs_dsp_coeff_read_ctrl(struct cs_dsp_coeff_ctl *ctl, void *buf, size_t len)
 {
 	int ret = 0;
 
+	lockdep_assert_held(&ctl->dsp->pwr_lock);
+
 	if (ctl->flags & WMFW_CTL_FLAG_VOLATILE) {
 		if (ctl->enabled && ctl->dsp->running)
 			return cs_dsp_coeff_read_ctrl_raw(ctl, buf, len);
@@ -1453,6 +1459,8 @@ struct cs_dsp_coeff_ctl *cs_dsp_get_ctl(struct cs_dsp *dsp, const char *name, in
 {
 	struct cs_dsp_coeff_ctl *pos, *rslt = NULL;
 
+	lockdep_assert_held(&dsp->pwr_lock);
+
 	list_for_each_entry(pos, &dsp->ctl_list, list) {
 		if (!pos->subname)
 			continue;
@@ -1548,6 +1556,8 @@ struct cs_dsp_alg_region *cs_dsp_find_alg_region(struct cs_dsp *dsp,
 {
 	struct cs_dsp_alg_region *alg_region;
 
+	lockdep_assert_held(&dsp->pwr_lock);
+
 	list_for_each_entry(alg_region, &dsp->alg_regions, list) {
 		if (id == alg_region->alg && type == alg_region->type)
 			return alg_region;
@@ -2783,6 +2793,8 @@ int cs_dsp_read_raw_data_block(struct cs_dsp *dsp, int mem_type, unsigned int me
 	unsigned int reg;
 	int ret;
 
+	lockdep_assert_held(&dsp->pwr_lock);
+
 	if (!mem)
 		return -EINVAL;
 
@@ -2836,6 +2848,8 @@ int cs_dsp_write_data_word(struct cs_dsp *dsp, int mem_type, unsigned int mem_ad
 	__be32 val = cpu_to_be32(data & 0x00ffffffu);
 	unsigned int reg;
 
+	lockdep_assert_held(&dsp->pwr_lock);
+
 	if (!mem)
 		return -EINVAL;
 
-- 
2.11.0

