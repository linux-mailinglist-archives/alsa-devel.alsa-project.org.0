Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 770993766FB
	for <lists+alsa-devel@lfdr.de>; Fri,  7 May 2021 16:19:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15C82950;
	Fri,  7 May 2021 16:18:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15C82950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620397170;
	bh=ttqlcIEvsoZqOvfJMdqkz4y7bFaRj+Lp7CTZByO76Iw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=m/Zz5QcO2V/0feu/8orWG1OKTEbRBTdZ/109EKxSsjiIBvjf68jpK/Xs784YnJCa4
	 Qg+ryR9ND2nCDjFNbS+38MaGTgrUmehycCZ8jHW/bVW8UL7KMOy5sh5cTZABVXYQie
	 M2glRf+l9wBXQ1uFEuZ+HVMc1fXZsFZ2EXbt11qA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C4EEF80108;
	Fri,  7 May 2021 16:18:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B57EF8025F; Fri,  7 May 2021 16:18:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EEE6BF80108
 for <alsa-devel@alsa-project.org>; Fri,  7 May 2021 16:17:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEE6BF80108
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ZzIfIczv"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 147EGFvM021020; Fri, 7 May 2021 09:17:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=SZBo2PyY6+f1NclI68uT3I38iQFKaDyMG1kSzhG7sfk=;
 b=ZzIfIczvZCs/JSZF0LFvDlBmx7wV1OaB+RXUMt2NMo5qa35b/valPdB8xHDb1SnkA6PD
 7MjsRAMoc0ZKMYlf+BSZm7FCnEh8hQ33EtlzsYxmQcgvtv2URp0xY5s1KqFhgeRovZNL
 Krm65g59vSOwjn14nWoPA/JYeAwV22TfhEHMKA53KWAzGpOhzitCht1ZCJ+BrDhtu/qo
 uV2MY2WBAlMbmmkyyuhHKl3fC1fhHqNIGKDoHWv698KwYLRjoqG5DbukqYhlTg5mN30W
 uv2/fnkfcwBlhn+6meMzLz2OvCGPgy+Zni1bkowGqzTBqEEleDReNJ3j3ssh2Pkufbzf og== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 38csprgv0f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 07 May 2021 09:17:51 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 7 May 2021
 15:17:49 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Fri, 7 May 2021 15:17:49 +0100
Received: from aryzen.ad.cirrus.com (unknown [198.61.65.123])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4ACDC11CF;
 Fri,  7 May 2021 14:17:49 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: James Schulman <james.schulman@cirrus.com>, David Rhodes
 <david.rhodes@cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>
Subject: [PATCH] ASoC: cs42l42: make HSBIAS_SENSE_EN optional
Date: Fri, 7 May 2021 15:17:48 +0100
Message-ID: <20210507141748.742037-1-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: r_Oko66ia9opLrF_fz7gfqozAPiifelm
X-Proofpoint-GUID: r_Oko66ia9opLrF_fz7gfqozAPiifelm
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105070098
Cc: Vitaly Rodionov <vitalyr@opensource.cirrus.com>,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Lucas Tanure <tanureal@opensource.cirrus.com>
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

From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>

HSBIAS_SENSE_EN configures HSBIAS output current sense through
the external 2.21-k resistor. HSBIAS_SENSE is hardware feature to reduce
the potential pop noise during the headset plug out slowly. But on some
platforms ESD voltage will affect it causing test to fail, especially
with CTIA headset type. For different hardware setups, a designer might
want to tweak default behavior.

Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---
 .../devicetree/bindings/sound/cs42l42.txt     | 10 ++++++++++
 include/dt-bindings/sound/cs42l42.h           |  3 +++
 sound/soc/codecs/cs42l42.c                    | 20 ++++++++++++++++++-
 sound/soc/codecs/cs42l42.h                    |  1 +
 4 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/cs42l42.txt b/Documentation/devicetree/bindings/sound/cs42l42.txt
index 7dfaa2ab906f..e75f191d2945 100644
--- a/Documentation/devicetree/bindings/sound/cs42l42.txt
+++ b/Documentation/devicetree/bindings/sound/cs42l42.txt
@@ -81,6 +81,16 @@ Optional properties:
   < x1 x2 x3 x4 >
   Default = < 15 8 4 1>
 
+  - cirrus,hs-bias-sense-en: Configures HSBIAS output current sense through
+  the external 2.21-k resistor. HSBIAS_SENSE is hardware feature to reduce
+  the potential pop noise during the headset plug out slowly. But on some
+  platforms ESD voltage will affect it causing test to fail, especially
+  with CTIA headset type. For different hardware setups, a designer might
+  want to tweak default behavior.
+
+  0 - disabled
+  1 - enabled
+  Default = 1
 
 Example:
 
diff --git a/include/dt-bindings/sound/cs42l42.h b/include/dt-bindings/sound/cs42l42.h
index f25d83c6188b..788e1598b15f 100644
--- a/include/dt-bindings/sound/cs42l42.h
+++ b/include/dt-bindings/sound/cs42l42.h
@@ -66,4 +66,7 @@
 #define CS42L42_HSBIAS_RAMP_TIME2			90
 #define CS42L42_HSBIAS_RAMP_TIME3			170
 
+#define CS42L42_HSBIAS_SENSE_ON  1
+#define CS42L42_HSBIAS_SENSE_OFF 0
+
 #endif /* __DT_CS42L42_H */
diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index d9f8da7a68d0..139245c6b720 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -1032,7 +1032,7 @@ static void cs42l42_process_hs_type_detect(struct cs42l42_private *cs42l42)
 			CS42L42_AUTO_HSBIAS_HIZ_MASK |
 			CS42L42_TIP_SENSE_EN_MASK |
 			CS42L42_HSBIAS_SENSE_TRIP_MASK,
-			(1 << CS42L42_HSBIAS_SENSE_EN_SHIFT) |
+			(cs42l42->hs_bias_sense_en << CS42L42_HSBIAS_SENSE_EN_SHIFT) |
 			(1 << CS42L42_AUTO_HSBIAS_HIZ_SHIFT) |
 			(0 << CS42L42_TIP_SENSE_EN_SHIFT) |
 			(3 << CS42L42_HSBIAS_SENSE_TRIP_SHIFT));
@@ -1807,6 +1807,24 @@ static int cs42l42_handle_device_data(struct device *dev,
 			(cs42l42->hs_bias_ramp_rate <<
 			CS42L42_HSBIAS_RAMP_SHIFT));
 
+	ret = device_property_read_u32(dev, "cirrus,hs-bias-sense-en", &val);
+	if (!ret) {
+		switch (val) {
+		case CS42L42_HSBIAS_SENSE_OFF:
+		case CS42L42_HSBIAS_SENSE_ON:
+			cs42l42->hs_bias_sense_en = val;
+			break;
+		default:
+			dev_err(dev,
+				"Wrong cirrus,hs-bias-sense-en DT value %d\n",
+				val);
+			cs42l42->hs_bias_sense_en = CS42L42_HSBIAS_SENSE_ON;
+			break;
+		}
+	} else {
+		cs42l42->hs_bias_sense_en = CS42L42_HSBIAS_SENSE_ON;
+	}
+
 	return 0;
 }
 
diff --git a/sound/soc/codecs/cs42l42.h b/sound/soc/codecs/cs42l42.h
index 2e0d3836bd7e..24f7be228d5f 100644
--- a/sound/soc/codecs/cs42l42.h
+++ b/sound/soc/codecs/cs42l42.h
@@ -787,6 +787,7 @@ struct  cs42l42_private {
 	u8 bias_thresholds[CS42L42_NUM_BIASES];
 	u8 hs_bias_ramp_rate;
 	u8 hs_bias_ramp_time;
+	u8 hs_bias_sense_en;
 	u8 stream_use;
 };
 
-- 
2.31.1

