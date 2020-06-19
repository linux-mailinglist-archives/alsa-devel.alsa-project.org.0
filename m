Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61405201D1C
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jun 2020 23:30:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA2FF167D;
	Fri, 19 Jun 2020 23:29:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA2FF167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592602217;
	bh=X5kEV9j1bvBSqSo0nAOX/0dJBmixJOYPc3lEpSp3TzQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OyoXgCgH5s7vWoUnwXrujolH43yGhq6TUqCdFpPeSMFykf6yUl8F2WorHYIWKk9sU
	 NLgs92h0VPupIKymAFRsZsaUgt7zYtskj9AO7LUDAhevtUvG9VdNMde4rcWlybLqxt
	 CEmLhboo/Rvmgn9jGPT246bkQz0KFxrEwRWLIURg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05FC0F80255;
	Fri, 19 Jun 2020 23:28:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 199ECF80252; Fri, 19 Jun 2020 23:28:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83F3FF800EF
 for <alsa-devel@alsa-project.org>; Fri, 19 Jun 2020 23:28:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83F3FF800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="MJuy2uGZ"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05JLQewp032439; Fri, 19 Jun 2020 16:28:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=RGBYEOquVFiP9E+QCrFCPTeGKNNE7Y2tiQeVJ5VAMe0=;
 b=MJuy2uGZOD0+yHBXWBOI60Ee2ARNBdUoTDpMnNDlCXsvy7PDUDf1p3tBvl/bUMm1s3DX
 H6y4EbANWfCWvPKfRIiX3qLhSVoTF8trXOEX0E2f41aio4TwyUuZn3CptqThqjV2hZW+
 oUIQoFmeK6mzX95e52ormk4D76npxuZY7u8AnsCDELTx9YtavfrZzCkG8TSInJWBFBT+
 6PPEzUzTvenfd+Bj42HdgR9zNE9xKTGwAXeXyBlK+R4dZKjDBFqK3yWbVxSXyOhWIwGP
 roPwrtyKbGRXhwDB6AFR3x2kCyY7k/NqlS/THvw2d7Qq8u7WVF5kseA477UQD01PqiTa WA== 
Authentication-Results: ppops.net;
 spf=pass smtp.mailfrom=David.Rhodes@cirrus.com
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 31q664wsue-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 19 Jun 2020 16:28:21 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Fri, 19 Jun
 2020 22:28:19 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Fri, 19 Jun 2020 22:28:19 +0100
Received: from localhost.localdomain (unknown [141.131.234.189])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id DB6272C8;
 Fri, 19 Jun 2020 21:28:17 +0000 (UTC)
From: David Rhodes <david.rhodes@cirrus.com>
To: <ckeepax@opensource.cirrus.com>, <alsa-devel@alsa-project.org>,
 <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: wm_adsp: Add controls for calibration and diagnostic FW
Date: Fri, 19 Jun 2020 16:26:51 -0500
Message-ID: <20200619212651.2739-1-david.rhodes@cirrus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com
 include:_spf1.cirrus.com include:_spf2.cirrus.com include:_spf3.cirrus.com
 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 spamscore=0
 mlxscore=0 priorityscore=1501 mlxlogscore=999 impostorscore=0 phishscore=0
 adultscore=0 suspectscore=2 lowpriorityscore=0 clxscore=1011
 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006190151
Cc: Vlad Karpovich <Vlad.Karpovich@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>
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

From: Vlad Karpovich <Vlad.Karpovich@cirrus.com>

Exposed additional mixer controls to select calibration or diagnostic
firmware.

'Calibration' --> chip-dsp<id>-spk-cali.wmfw (.bin)
'Diagnostic'  --> chip-dsp<id>-spk-diag.wmfw (.bin)

Signed-off-by: Vlad Karpovich <Vlad.Karpovich@cirrus.com>
Signed-off-by: David Rhodes <david.rhodes@cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 4e63defa6857..d9d2bb5a1945 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -363,9 +363,11 @@ static void wm_adsp_buf_free(struct list_head *list)
 #define WM_ADSP_FW_ASR      7
 #define WM_ADSP_FW_TRACE    8
 #define WM_ADSP_FW_SPK_PROT 9
-#define WM_ADSP_FW_MISC     10
+#define WM_ADSP_FW_SPK_CALI 10
+#define WM_ADSP_FW_SPK_DIAG 11
+#define WM_ADSP_FW_MISC     12
 
-#define WM_ADSP_NUM_FW      11
+#define WM_ADSP_NUM_FW      13
 
 static const char *wm_adsp_fw_text[WM_ADSP_NUM_FW] = {
 	[WM_ADSP_FW_MBC_VSS] =  "MBC/VSS",
@@ -378,6 +380,8 @@ static const char *wm_adsp_fw_text[WM_ADSP_NUM_FW] = {
 	[WM_ADSP_FW_ASR] =      "ASR Assist",
 	[WM_ADSP_FW_TRACE] =    "Dbg Trace",
 	[WM_ADSP_FW_SPK_PROT] = "Protection",
+	[WM_ADSP_FW_SPK_CALI] = "Calibration",
+	[WM_ADSP_FW_SPK_DIAG] = "Diagnostic",
 	[WM_ADSP_FW_MISC] =     "Misc",
 };
 
@@ -612,6 +616,8 @@ static const struct {
 		.caps = trace_caps,
 	},
 	[WM_ADSP_FW_SPK_PROT] = { .file = "spk-prot" },
+	[WM_ADSP_FW_SPK_CALI] = { .file = "spk-cali" },
+	[WM_ADSP_FW_SPK_DIAG] = { .file = "spk-diag" },
 	[WM_ADSP_FW_MISC] =     { .file = "misc" },
 };
 
-- 
2.25.1

