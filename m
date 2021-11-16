Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA04453735
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Nov 2021 17:20:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D418A1720;
	Tue, 16 Nov 2021 17:19:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D418A1720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637079622;
	bh=PckBAme0KW0Bzs9qbnWfDF6iA8JdwMjFHp2tUjkc3bo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qs5Y20Wc9rkA5QnLVYIyuTt5SRnwRS4jAltDkkEG8zZwwu4J5qmV2lU2q0R/HGazx
	 lr6tdNkcKX+xBbkwi4yvbKqV3SnLjT5YLmFFLQ2YA+QaKfojHd6TrXZGV2Qg5DnjcJ
	 W2I7kJozaBVpsz5SvY6DYYak6M7WLXWlYd1lRgMo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6232F8051E;
	Tue, 16 Nov 2021 17:16:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D70B8F8051A; Tue, 16 Nov 2021 17:16:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5044CF80134
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 17:16:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5044CF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="m+hK2yJp"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AG7fwnK025797;
 Tue, 16 Nov 2021 10:16:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=mzE3Dbaalakly94KMLknTeJN5a3hqsD9yPHl2nW6sMY=;
 b=m+hK2yJpf0dmtP1SZn8uoFI/ua15jaZk+d4EkaPXf4fsHktTIc5gMDWmEOraWVbSdNVN
 F5YyRY8ViTkyCgILaYUWP6MSr6XZsAUpXBD8E3lhy/21KrBQu73gR+JwPf7thJQvJbmk
 //yzUS4ZJAeTTzTm0dF+OO2/KPBQmCAVrIX3Bvs6EndRs8TDL7LtRi/kRavTDZdmuaJ2
 y12ghDbhJUIQgFcrhnpwiAypC7ct44jxki2qW3QKR7oBQsmmqJc+GCLaoS2gYZpyI1QF
 EpA/slJU/YqNFelBM9ZVOSR0jJPjF11OGxR7LBh6XcqPZpXOLZC5mIWeGc7guAzMm7zP mg== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3cbjn01x5t-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 16 Nov 2021 10:16:13 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 16 Nov
 2021 16:16:09 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Tue, 16 Nov 2021 16:16:09 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 86D9315A5;
 Tue, 16 Nov 2021 16:16:09 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 07/10] firmware: cs_dsp: Perform NULL check in
 cs_dsp_coeff_write/read_ctrl
Date: Tue, 16 Nov 2021 16:16:06 +0000
Message-ID: <20211116161609.12223-7-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211116161609.12223-1-ckeepax@opensource.cirrus.com>
References: <20211116161609.12223-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: vKfU0R8hHVTaSkuU6_96EuRZuPh164lq
X-Proofpoint-ORIG-GUID: vKfU0R8hHVTaSkuU6_96EuRZuPh164lq
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

Add a NULL check to the cs_dsp_coeff_write/read_ctrl functions. This is
a major convenience for users of the cs_dsp library as it allows the call
to cs_dsp_get_ctl to be inlined with the call to read/write the control
itself.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/firmware/cirrus/cs_dsp.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index 62ba4ebbf11f5..9eecd16265375 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -758,6 +758,9 @@ int cs_dsp_coeff_write_ctrl(struct cs_dsp_coeff_ctl *ctl, const void *buf, size_
 
 	lockdep_assert_held(&ctl->dsp->pwr_lock);
 
+	if (!ctl)
+		return -ENOENT;
+
 	if (ctl->flags & WMFW_CTL_FLAG_VOLATILE)
 		ret = -EPERM;
 	else if (buf != ctl->cache)
@@ -817,6 +820,9 @@ int cs_dsp_coeff_read_ctrl(struct cs_dsp_coeff_ctl *ctl, void *buf, size_t len)
 
 	lockdep_assert_held(&ctl->dsp->pwr_lock);
 
+	if (!ctl)
+		return -ENOENT;
+
 	if (ctl->flags & WMFW_CTL_FLAG_VOLATILE) {
 		if (ctl->enabled && ctl->dsp->running)
 			return cs_dsp_coeff_read_ctrl_raw(ctl, buf, len);
-- 
2.11.0

