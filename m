Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 238BA4DC2F8
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 10:36:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAC6B1A9B;
	Thu, 17 Mar 2022 10:36:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAC6B1A9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647509813;
	bh=X1v3FGDIsm+004cqb3Dc60DULLL2Cbi4f+nFacbWTgo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pZeYQOtLvpulWnvkkL/xii01ga+WVarnMuYp3KGBorOkN5IdOt7YXYA/nA5oN04IH
	 s9Db1a0x3Ry4IjoMIoE0CAKoY8xbiRa8BoshCh/09zHEU3HaO8Exspddjab02lsAzG
	 4Ohpp6QJuDy8VJLi0XB7UvyD2WQunDyaKuI0SOEE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1FF0F80588;
	Thu, 17 Mar 2022 10:32:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5417EF80519; Thu, 17 Mar 2022 10:32:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBDCFF80132
 for <alsa-devel@alsa-project.org>; Thu, 17 Mar 2022 10:31:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBDCFF80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="DoqU3ZVy"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22H5dQJX011402;
 Thu, 17 Mar 2022 04:31:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=fZnbEi3pbb9N3DLApUDIz41sBK2iZT83PUC2XBQ5GYs=;
 b=DoqU3ZVyU6cokYTUsS+dC0SWRRbRc1zqNTf21zsTaDVrdWcTdbktBUu9uQxelEWlcq4q
 416aleQVOmfQQWiIN6SININcPAWyjN04Hxl4qxszVoTjDnCZPEoIHAwl18wtFZFUFTit
 5nljoh+r4nDmusvgvJj3dHxmARjjx4JdR6vJmmjjNm9SGl1ar4ADzmC/K9QiYrMAafUe
 DPewvBmT5HFV8QFDHqmm8896729Yb6xjun7mAvDISzhv8wkeCiHOldm67IzajzdVEBgt
 b/pp2BuCpg/zy39YEz4ynupV0XnEwNuU+iKKGTfl6ran/yZ1uVB76CHh9+pfZKX0tb5b 4A== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3et642cbn5-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 17 Mar 2022 04:31:37 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 17 Mar
 2022 09:31:34 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Thu, 17 Mar 2022 09:31:34 +0000
Received: from aryzen.ad.cirrus.com (unknown [198.61.64.95])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A414F459;
 Thu, 17 Mar 2022 09:31:34 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v4 15/16] ASoC: dt-bindings: cs35l41: Document CS35l41
 External Boost
Date: Thu, 17 Mar 2022 09:31:19 +0000
Message-ID: <20220317093120.168534-16-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220317093120.168534-1-tanureal@opensource.cirrus.com>
References: <20220317093120.168534-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 0fedwZEGRWnAFzCviljm_6Xnw8hGMO_z
X-Proofpoint-ORIG-GUID: 0fedwZEGRWnAFzCviljm_6Xnw8hGMO_z
X-Proofpoint-Spam-Reason: safe
Cc: David Rhodes <drhodes@opensource.cirrus.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Lucas Tanure <tanureal@opensource.cirrus.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
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

From: David Rhodes <drhodes@opensource.cirrus.com>

Document internal and external boost feature for ASoC CS35L41.
For internal boost the following properties are required:
- cirrus,boost-peak-milliamp
- cirrus,boost-ind-nanohenry
- cirrus,boost-cap-microfarad

For external boost, the GPIO1 must be configured as output,
so the following properties are required:
- cirrus,gpio1-src-select = <1>
- cirrus,gpio1-output-enable

Signed-off-by: David Rhodes <drhodes@opensource.cirrus.com>
Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---
 .../bindings/sound/cirrus,cs35l41.yaml        | 44 +++++++++++++++++--
 1 file changed, 41 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs35l41.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs35l41.yaml
index 3235702ce402..09b515924c59 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs35l41.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs35l41.yaml
@@ -75,6 +75,19 @@ properties:
     maximum: 3
     default: 2
 
+  cirrus,boost-type:
+    description:
+      Configures the type of Boost being used.
+      Internal boost requires boost-peak-milliamp, boost-ind-nanohenry and
+      boost-cap-microfarad.
+      External Boost must have GPIO1 as GPIO output. GPIO1 will be set high to
+      enable boost voltage.
+      0 = Internal Boost
+      1 = External Boost
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    minimum: 0
+    maximum: 1
+
   cirrus,gpio1-polarity-invert:
     description:
       Boolean which specifies whether the GPIO1
@@ -131,9 +144,32 @@ required:
   - compatible
   - reg
   - "#sound-dai-cells"
-  - cirrus,boost-peak-milliamp
-  - cirrus,boost-ind-nanohenry
-  - cirrus,boost-cap-microfarad
+
+allOf:
+  - if:
+      properties:
+        cirrus,boost-type:
+            const: 0
+    then:
+      required:
+        - cirrus,boost-peak-milliamp
+        - cirrus,boost-ind-nanohenry
+        - cirrus,boost-cap-microfarad
+    else:
+      if:
+        properties:
+          cirrus,boost-type:
+            const: 1
+      then:
+        required:
+          - cirrus,gpio1-output-enable
+          - cirrus,gpio1-src-select
+        properties:
+          cirrus,boost-peak-milliamp: false
+          cirrus,boost-ind-nanohenry: false
+          cirrus,boost-cap-microfarad: false
+          cirrus,gpio1-src-select:
+            enum: [1]
 
 additionalProperties: false
 
@@ -150,6 +186,8 @@ examples:
           VA-supply = <&dummy_vreg>;
           VP-supply = <&dummy_vreg>;
           reset-gpios = <&gpio 110 0>;
+
+          cirrus,boost-type = <0>;
           cirrus,boost-peak-milliamp = <4500>;
           cirrus,boost-ind-nanohenry = <1000>;
           cirrus,boost-cap-microfarad = <15>;
-- 
2.35.1

