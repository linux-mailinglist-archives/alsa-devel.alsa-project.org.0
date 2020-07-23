Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1C722AD30
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jul 2020 13:05:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1345D167A;
	Thu, 23 Jul 2020 13:04:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1345D167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595502332;
	bh=0o49vx0Oxgja/KHvQRcnnAaq66x9hf/9HyRxV2WsBH4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YRY+FeX1U5bNbyR7tKXijQWj1VuBlL+JBBS1GdnmdHvL2AKhj52TqLCzMCBIk0Z3K
	 7AnscHHwvdMtUySF6sNWE2+fmm+8tuNfqLh3Sk+0Bo/Y86QuXrqDNecdNUQjYh8kNv
	 aIBzCO2nvHju+B1BO7exdVzL7mz5kJmirAU+g8Po=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A0BFF8011F;
	Thu, 23 Jul 2020 13:03:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2E69F80212; Thu, 23 Jul 2020 13:03:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 220D7F8011F
 for <alsa-devel@alsa-project.org>; Thu, 23 Jul 2020 13:03:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 220D7F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="NDQnnQXB"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06NB1BHo023093; Thu, 23 Jul 2020 06:03:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type;
 s=PODMain02222019; bh=vR7Op+9CnSyyZV8CafMYW9yuQQMwR7TgOJ+yWu8HpAQ=;
 b=NDQnnQXBm5mFTxJqPt4BBGP/fwpxkwomWnlmGCwdIQOxqm9xFDJC36MT/dMkx8aqF5sB
 05GpIbwsn0crGeBDHnNmol4Q0tYKA83XC8lkpbmRXPcwYat77HM7ZALMN8v9ZL1kQhF6
 b1HL380SNDMPT1hcwLd7ri98HNuVB5dE7zG0kBukV8BzgSqSRUpomJ3rYaTpqiaxtdk8
 4Exxn+zUp+lOmsPQH8iCmIcIAJtQdmHirQ68XvZAn52WmUtl+stTJ1RmWIEK+mFvg3gM
 JVjTzWoJNqa1NJ5J9Bz6uUepYoONsGO26+pn5FF9I8DyP8h8W5ViCYkPinO+/97Lln08 yg== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 32bwgnqbgk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 23 Jul 2020 06:03:23 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Thu, 23 Jul
 2020 12:03:21 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Thu, 23 Jul 2020 12:03:21 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9FF4B45;
 Thu, 23 Jul 2020 11:03:21 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH] ASoC: wm_adsp: Support new metadata block ID's
Date: Thu, 23 Jul 2020 12:03:21 +0100
Message-ID: <20200723110321.16382-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com
 ip4:5.172.152.52 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 spamscore=0
 clxscore=1015 mlxscore=0 suspectscore=1 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007230083
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 james.schulman@cirrus.com, lgirdwood@gmail.com, david.rhodes@cirrus.com
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

From: James Schulman <james.schulman@cirrus.com>

Coefficient files now support additional metadata blocks, these
contain machine parsable text strings describing the parameters
contained in the coefficient file.

Signed-off-by: James Schulman <james.schulman@cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 1 +
 sound/soc/codecs/wmfw.h    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 88c397c700ee9..410cca57da52d 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -2621,6 +2621,7 @@ static int wm_adsp_load_coeff(struct wm_adsp *dsp)
 		switch (type) {
 		case (WMFW_NAME_TEXT << 8):
 		case (WMFW_INFO_TEXT << 8):
+		case (WMFW_METADATA << 8):
 			break;
 		case (WMFW_ABSOLUTE << 8):
 			/*
diff --git a/sound/soc/codecs/wmfw.h b/sound/soc/codecs/wmfw.h
index 4278aa6aeb01b..7423272c30e94 100644
--- a/sound/soc/codecs/wmfw.h
+++ b/sound/soc/codecs/wmfw.h
@@ -180,6 +180,7 @@ struct wmfw_coeff_item {
 
 #define WMFW_ABSOLUTE         0xf0
 #define WMFW_ALGORITHM_DATA   0xf2
+#define WMFW_METADATA         0xfc
 #define WMFW_NAME_TEXT        0xfe
 #define WMFW_INFO_TEXT        0xff
 
-- 
2.11.0

