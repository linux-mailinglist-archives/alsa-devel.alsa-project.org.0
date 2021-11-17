Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB17545472A
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Nov 2021 14:25:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C6A618B6;
	Wed, 17 Nov 2021 14:24:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C6A618B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637155548;
	bh=QHoRIhS5lEyHz2/JvCtJj9Yg1+k716/jOZzJOTh6RKI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=joxQHhpBHHUONMWc0OBpXFeSqOlXnbitauZgcWLDc/J6qeHoUfUS2HpMIKx98kmSJ
	 gPnXeRdJklcC+3iRpwW3/JkY35iWOrLSoh/Dhp8wChC4jMK6hHF1MSpxUjHHC0l+sc
	 zxn91R9ECuRoVq9sl4FP/97ZDpwbvT1IyjmJDvRA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 990E4F80507;
	Wed, 17 Nov 2021 14:23:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D06A7F804FC; Wed, 17 Nov 2021 14:23:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B4E9F802A0
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 14:23:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B4E9F802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="at6tt3Jf"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AH4qhZf020405;
 Wed, 17 Nov 2021 07:23:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=ucnLTrENrU3gCvpEMUqkV/GCowJNYd+whal20vxEQPs=;
 b=at6tt3JfFumKm23RkQYfndp/UaXpnC/GCLQtxfHtDo3+znVbhL2in5ZwwnvBvCynZdXo
 IKjtxRh1nSQwXoCsrn89YqkDntc/nMShaJQZ77+0J0CjhO4qCrLdlHRQwkNqNFnKqxHr
 Eev+XvY91zhudHxGxTXBFmSelqKg4pkG0VMBh4qnTz2A6m46DJ9uvq1Eaat0hjqEX5wB
 7a2uImtBFejVi8lEnRIMD5CZ14F8WPReCIDoxaCMqbOAiFxscswu4+a2AiZ0M2u4LPAN
 PtLPGD3UDPddOQ2B4IFO8++GGv10QkYkBPWigVkDv5hfIY/unFA7Ql9sPQ/Qrwiw3oBs Cw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ccgtn14sf-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 17 Nov 2021 07:23:06 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 17 Nov
 2021 13:23:00 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Wed, 17 Nov 2021 13:23:00 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id BD3CA15A6;
 Wed, 17 Nov 2021 13:23:00 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH v2 06/10] firmware: cs_dsp: Add support for rev 2 coefficient
 files
Date: Wed, 17 Nov 2021 13:22:56 +0000
Message-ID: <20211117132300.1290-6-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211117132300.1290-1-ckeepax@opensource.cirrus.com>
References: <20211117132300.1290-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: yDshEyN3fdCUYPf5ST7utJ0nZ8lmOKgT
X-Proofpoint-ORIG-GUID: yDshEyN3fdCUYPf5ST7utJ0nZ8lmOKgT
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

Add support for the revision 2 coefficient file, this format is
identical to revision 1 and was simply added by accident to some
firmware. However unfortunately many firmwares have leaked into
production using this and as such driver support really needs to
be added for it.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/firmware/cirrus/cs_dsp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index 3d21574f3a443..62ba4ebbf11f5 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -1990,6 +1990,7 @@ static int cs_dsp_load_coeff(struct cs_dsp *dsp, const struct firmware *firmware
 
 	switch (be32_to_cpu(hdr->rev) & 0xff) {
 	case 1:
+	case 2:
 		break;
 	default:
 		cs_dsp_err(dsp, "%s: Unsupported coefficient file format %d\n",
-- 
2.11.0

