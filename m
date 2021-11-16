Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A9E453739
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Nov 2021 17:20:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CB821730;
	Tue, 16 Nov 2021 17:19:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CB821730
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637079645;
	bh=PylKyHKKMn6zrW7HNydXwOQN9nKd7SzVbFmfJZ9BXHs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dhR9sZftyJ2ZZHhqdYrpjrJ77Opo2PMg2hIslkRRqbs8LNPEllbbwup7ZQkovH001
	 XxCZSOzZkPmp9E/MZfn6aEr/583VScuygmnNWPkWrcEQ6cAQPdpxmS1qZKmEX6gJwg
	 5IVll4omLXEcud+so3L5E1jIfgWHP2KYjkF/XMoU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9C62F80528;
	Tue, 16 Nov 2021 17:16:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14937F80134; Tue, 16 Nov 2021 17:16:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D7B7F80089
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 17:16:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D7B7F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="V6kBluGN"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AG7fwnN025797;
 Tue, 16 Nov 2021 10:16:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=QAoxXsT5eQgbB1Noac3ZqDQBjgotizDF6cr+IrrWqsI=;
 b=V6kBluGNxVmaXVUxsOc4pPWsC7O46ArDNXBdwAnp2HxMJnQwvYOw9TYhcj1fFM8zi1qt
 MqWkurf9t9YEkJeGJvIRGJ0Gb+9Xhzb5pixSStesngN8kzbI4/nEmqBGlyyOFJeVIw42
 f8rAJdcD5u5b6USau1LhqTBR1crKCS/486mUAgLgkNFyvtwG0Bv8Iq4avwiozv8Qh3uC
 ugzgVdFAwbV9+EWEQSvjsdjukdoYeiCLIUKpUtSW4ToPVzp2UIHt6HClvGfEZfwaoo3W
 VYundt6G+12gYWzpW5ifuSeZqcRWJ5raTSWhRAY0Er70YGnRP32DVXl1wZXlD9PVMGFS DA== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3cbjn01x5t-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 16 Nov 2021 10:16:15 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 16 Nov
 2021 16:16:09 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Tue, 16 Nov 2021 16:16:09 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id ACA5311DC;
 Tue, 16 Nov 2021 16:16:09 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 10/10] firmware: cs_dsp: Allow creation of event controls
Date: Tue, 16 Nov 2021 16:16:09 +0000
Message-ID: <20211116161609.12223-10-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211116161609.12223-1-ckeepax@opensource.cirrus.com>
References: <20211116161609.12223-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: 2rncs3MxcmksIk2fCTsatqtP8FWlqzjN
X-Proofpoint-ORIG-GUID: 2rncs3MxcmksIk2fCTsatqtP8FWlqzjN
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

Some firmwares contain controls intended to convey firmware state back
to the host. Whilst more infrastructure will probably be needed for
these in time, as a first step allow creation of the controls, so said
firmwares arn't completely rejected.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/firmware/cirrus/cs_dsp.c     | 1 +
 include/linux/firmware/cirrus/wmfw.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index 5fe08de91ecd3..3814cbba0a544 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -1177,6 +1177,7 @@ static int cs_dsp_parse_coeff(struct cs_dsp *dsp,
 				return -EINVAL;
 			break;
 		case WMFW_CTL_TYPE_HOSTEVENT:
+		case WMFW_CTL_TYPE_FWEVENT:
 			ret = cs_dsp_check_coeff_flags(dsp, &coeff_blk,
 						       WMFW_CTL_FLAG_SYS |
 						       WMFW_CTL_FLAG_VOLATILE |
diff --git a/include/linux/firmware/cirrus/wmfw.h b/include/linux/firmware/cirrus/wmfw.h
index a19bf7c6fc8b0..74e5a4f6c13a0 100644
--- a/include/linux/firmware/cirrus/wmfw.h
+++ b/include/linux/firmware/cirrus/wmfw.h
@@ -29,6 +29,7 @@
 #define WMFW_CTL_TYPE_ACKED       0x1000 /* acked control */
 #define WMFW_CTL_TYPE_HOSTEVENT   0x1001 /* event control */
 #define WMFW_CTL_TYPE_HOST_BUFFER 0x1002 /* host buffer pointer */
+#define WMFW_CTL_TYPE_FWEVENT     0x1004 /* firmware event control */
 
 struct wmfw_header {
 	char magic[4];
-- 
2.11.0

