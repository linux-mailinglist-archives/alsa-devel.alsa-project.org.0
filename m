Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1329453729
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Nov 2021 17:19:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B56416EE;
	Tue, 16 Nov 2021 17:18:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B56416EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637079561;
	bh=QHoRIhS5lEyHz2/JvCtJj9Yg1+k716/jOZzJOTh6RKI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VUwSDDeOhII5EHEJboZeE5mQJUpOa6xF/TDUhe44iYn1rYkZ6rQs9zFGuDz7OxY3x
	 HpLj0YAwaezVHZatoEtWpIG86mff6IarN7WeQc4qBOYEhItLwcAErp5XBX0kt/eTeL
	 qutySUVfGktylmN1FrG9MMhmI3Ybg5uaeOYyEhQE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97C20F804C1;
	Tue, 16 Nov 2021 17:16:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3550EF804FC; Tue, 16 Nov 2021 17:16:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2FF39F802C4
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 17:16:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FF39F802C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="g3Gam93j"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AG7FCjf005416;
 Tue, 16 Nov 2021 10:16:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=ucnLTrENrU3gCvpEMUqkV/GCowJNYd+whal20vxEQPs=;
 b=g3Gam93jZgI8FEjvfTcxofcd2AcrjdntmkCaFN4fJAgUApPDNATTgt7tN+5cmrQmi4+M
 yzWG3RAgaid3eLZRQ1mZdF8iXl6WxNFvXyJNF4s0LoQYau+Yk0pzd8WBWOnnBAEJ0JVv
 H41ppJWkvQe+d/KnCOsKlFt2bNbRl7IOPeGyuI9G14Op9MMfsh7+gKb45vrHqQnaGtZZ
 Lpk5hLlkChe6n3r245FlZQrX1GBpofwQjkMix5KX17cgYtZc4ABmgB4wjm+ozgZnqhzv
 MqrvvI2auOEB9O3Y+W14cJkqA5xv1cuzWG1Weva8G95uwVS+RzencsIEeNVjEkeJ4Pix iw== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3cbdjgt2t5-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 16 Nov 2021 10:16:12 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 16 Nov
 2021 16:16:09 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Tue, 16 Nov 2021 16:16:09 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7AC9215A4;
 Tue, 16 Nov 2021 16:16:09 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 06/10] firmware: cs_dsp: Add support for rev 2 coefficient
 files
Date: Tue, 16 Nov 2021 16:16:05 +0000
Message-ID: <20211116161609.12223-6-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211116161609.12223-1-ckeepax@opensource.cirrus.com>
References: <20211116161609.12223-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: IvQSVoMhXdWy-5Tl6pb-FpfWG3q3T8aD
X-Proofpoint-GUID: IvQSVoMhXdWy-5Tl6pb-FpfWG3q3T8aD
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

