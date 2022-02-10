Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4D34B1411
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Feb 2022 18:22:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F3891AA0;
	Thu, 10 Feb 2022 18:21:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F3891AA0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644513767;
	bh=iCLNTfpQJFFbyELTgzBJKNVvgxfvsH8MxI1zM6ttyiw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xh2309w9gb18L30fw9nA+eQh+NZySR4oQ2H9/jPB9edDg4i9z5bpqnGawfVSE1Cz6
	 bunq7777luTToBWODeYuWNKWZFjNpKrSWeiEguQ2qZRPV6lBPVXUB5r8cd5OBwEF2m
	 ndqf+vMazR+kc9VoG7wc1oOc+lAro9odJl9G2xuk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD0DEF804AC;
	Thu, 10 Feb 2022 18:21:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD971F80302; Thu, 10 Feb 2022 18:21:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B90A7F8013D
 for <alsa-devel@alsa-project.org>; Thu, 10 Feb 2022 18:20:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B90A7F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="AShIqHe1"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21AEBNjS025596;
 Thu, 10 Feb 2022 11:20:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=opLz0YF9twg7fDDwq/vize/4Am+R+TU5ADoJDsZOuw0=;
 b=AShIqHe1xW1Mdr5EqlakWm2PmYuE2km+vRQM9DGb5+VfhmpAZrzyIUmGQ+CbIT2qDZar
 xG+fjOTZPJ4ldnfbSZwCu+tfawV2EzVVysAOx9UmIAgVBJoHs6Fjce5AsCL49c7ToURP
 oKe8eW8wVYPd3N+Ao9MZ9U/Xm1WosYj9RkgU8KNWpVFKA1izVQ+G86foGycoUdOAMT9u
 aJio2w327eycVcEZC7rTnc1D6MVqrH3fAahdxnw67GScRT46N5HZiavRZVApNjuBlpcX
 bMR7ZRk+xw6DVFqjbogBLfUAqEd9dojGU4EyhCpKSBXoHxh/uxDXEq17pfkq2j/I65MG 3g== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3e4detss0h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 10 Feb 2022 11:20:54 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 10 Feb
 2022 17:20:53 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Thu, 10 Feb 2022 17:20:53 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4EF79B10;
 Thu, 10 Feb 2022 17:20:53 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 3/3] ASoC: wm_adsp: Add trace caps to speaker protection FW
Date: Thu, 10 Feb 2022 17:20:53 +0000
Message-ID: <20220210172053.22782-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220210172053.22782-1-ckeepax@opensource.cirrus.com>
References: <20220210172053.22782-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: amz0nJaQRQjWdI2aZjrWwGWgw0MrfIwH
X-Proofpoint-ORIG-GUID: amz0nJaQRQjWdI2aZjrWwGWgw0MrfIwH
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Vlad.Karpovich@cirrus.com, lgirdwood@gmail.com
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

Enable access to the speaker protection firmware debug stream
using compress stream API and lower minimum fragment size to
16 words.

Signed-off-by: Vlad Karpovich <Vlad.Karpovich@cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 8e5ebc4838ec3..7a32efa1fd90e 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -180,7 +180,7 @@ struct wm_adsp_compr {
 
 #define WM_ADSP_MIN_FRAGMENTS          1
 #define WM_ADSP_MAX_FRAGMENTS          256
-#define WM_ADSP_MIN_FRAGMENT_SIZE      (64 * CS_DSP_DATA_WORD_SIZE)
+#define WM_ADSP_MIN_FRAGMENT_SIZE      (16 * CS_DSP_DATA_WORD_SIZE)
 #define WM_ADSP_MAX_FRAGMENT_SIZE      (4096 * CS_DSP_DATA_WORD_SIZE)
 
 #define WM_ADSP_ALG_XM_STRUCT_MAGIC    0x49aec7
@@ -296,7 +296,12 @@ static const struct {
 		.num_caps = ARRAY_SIZE(trace_caps),
 		.caps = trace_caps,
 	},
-	[WM_ADSP_FW_SPK_PROT] = { .file = "spk-prot" },
+	[WM_ADSP_FW_SPK_PROT] = {
+		.file = "spk-prot",
+		.compr_direction = SND_COMPRESS_CAPTURE,
+		.num_caps = ARRAY_SIZE(trace_caps),
+		.caps = trace_caps,
+	},
 	[WM_ADSP_FW_SPK_CALI] = { .file = "spk-cali" },
 	[WM_ADSP_FW_SPK_DIAG] = { .file = "spk-diag" },
 	[WM_ADSP_FW_MISC] =     { .file = "misc" },
-- 
2.11.0

