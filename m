Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA46454731
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Nov 2021 14:27:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C6461906;
	Wed, 17 Nov 2021 14:26:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C6461906
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637155648;
	bh=PckBAme0KW0Bzs9qbnWfDF6iA8JdwMjFHp2tUjkc3bo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QgY3eFdsedIzqjrquc1gASeAymnkDQ0ypvM2f4KYhCamGlIQPJemn1WW40Ow/3NQ0
	 RnY3d1wom5UcMvFZdIqG3YFRvP2uTr2mZGPiZFTJUkyoxxhRBIRmmVhrX/GbfqcX33
	 UnjLOFz8O1pFHQsb9AIwUWsRMp5tbAiYclHt3xwA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DEBA0F8052D;
	Wed, 17 Nov 2021 14:23:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D34AF8051B; Wed, 17 Nov 2021 14:23:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C017F804D6
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 14:23:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C017F804D6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="SfZFvF+q"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AH4qhZe020405;
 Wed, 17 Nov 2021 07:23:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=mzE3Dbaalakly94KMLknTeJN5a3hqsD9yPHl2nW6sMY=;
 b=SfZFvF+q7zEjHM+xi+NAu3Wl+lesupxTscEplxDqWxXMyCoABIRC0dvWP4miK6R9Hp+/
 B0vc5AyLg+4yRWyhemztdRcpDdy4H81N819JUl6pnOmOoKZw/OkwaQoBj7stJVtH+xNQ
 IiTEJVyCzDSc2zB6bXteqzO5ueEKpqJOVGDC5iUH5IXN0k0TW7CL3wP0eaZ8hno4NwAO
 3ZF4IZTIpb4ZlNeA0JwDSl16nvt2uIAqRod2Rg5vnZ2sokb5ypytcjGufK1FDGwt3YH/
 6TbYP2DAVORd5W2XHu7fX88JbgKpwWmmmTq89ZAuRJzbcri9cq3XS1s6TrOWE03GFHsE 6A== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ccgtn14sf-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 17 Nov 2021 07:23:05 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 17 Nov
 2021 13:23:00 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Wed, 17 Nov 2021 13:23:00 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C931B11AF;
 Wed, 17 Nov 2021 13:23:00 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH v2 07/10] firmware: cs_dsp: Perform NULL check in
 cs_dsp_coeff_write/read_ctrl
Date: Wed, 17 Nov 2021 13:22:57 +0000
Message-ID: <20211117132300.1290-7-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211117132300.1290-1-ckeepax@opensource.cirrus.com>
References: <20211117132300.1290-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: RvkFy2WnyDpT0CMCq9mtf_3n42KgGsnK
X-Proofpoint-ORIG-GUID: RvkFy2WnyDpT0CMCq9mtf_3n42KgGsnK
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

