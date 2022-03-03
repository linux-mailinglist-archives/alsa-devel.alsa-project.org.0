Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EF44CC418
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Mar 2022 18:38:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07E081F26;
	Thu,  3 Mar 2022 18:37:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07E081F26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646329091;
	bh=ZO1hUxy2lnj/F0dCFzwJWMLYaPJfUJp7PiZsb0Ie4G4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jb1IB836Xcui5cvT6WthWQl3lCgzzBprQ4iBM3kW+6cTaJwxWq3SMkiTuDCg+JhGa
	 4Hp+RN9/nEA9R9ByXCG6kRr6fn+5VKNKeyl5mdn4YVxywzXs4P9X9SQCvrISrXDo91
	 oxcw7n8t5hJ2B8q7jpT3d6VuRO1xieH6i+3w2x7k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 795AAF805C7;
	Thu,  3 Mar 2022 18:31:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1786F80566; Thu,  3 Mar 2022 18:31:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 153FDF8051C
 for <alsa-devel@alsa-project.org>; Thu,  3 Mar 2022 18:31:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 153FDF8051C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="g+OQFWkv"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 223509TC013880;
 Thu, 3 Mar 2022 11:31:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=z2fc2suZ+MHtbqH3QN+bDHATpXXT3tY9Afoe8H+gZ68=;
 b=g+OQFWkvuqSvjoavSKb4vnyMnpqgnjQMJkl1VFIaSzcww2qJ0XThNxzduxWUpyYw+gHC
 jR3gHP/fMxW06P2ig0pcuz05VSL9NZ4hq6uUPuSmys4MKYUIxwSdPqGVRidpa7bzfxZL
 rFa8Ml65cVmI1KnhITVeYE7b7KzkyXm1c5jx0Q0A2LIFCPeT6sy12HiYV3GqqC3f32QS
 kEyfC31V2ub+EYTle57XdVjBnzY70mjuqjxHs4rA8PnfxoWsrY223Rd/Adr40GOR9/vu
 KkLk0rWaEO16S7ttvTvUyS4SPyVnF56aRMyec6wzTjTX3d9arZ7pZNuLcY5ipBe7tpWW Xg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ejncq8ybn-11
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 03 Mar 2022 11:31:13 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Mar
 2022 17:31:09 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Thu, 3 Mar 2022 17:31:09 +0000
Received: from aryzen.ad.cirrus.com (unknown [198.61.65.198])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 655877C;
 Thu,  3 Mar 2022 17:31:09 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 20/20] Documentation: devicetree: CS35l41 External Boost
Date: Thu, 3 Mar 2022 17:30:59 +0000
Message-ID: <20220303173059.269657-21-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220303173059.269657-1-tanureal@opensource.cirrus.com>
References: <20220303173059.269657-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: acrCWVnMzuspv1OFGQKuo6DOKsawI3RB
X-Proofpoint-GUID: acrCWVnMzuspv1OFGQKuo6DOKsawI3RB
X-Proofpoint-Spam-Reason: safe
Cc: David Rhodes <drhodes@opensource.cirrus.com>, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
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

Document external boost feature on CS35L41

Signed-off-by: David Rhodes <drhodes@opensource.cirrus.com>
---
 .../bindings/sound/cirrus,cs35l41.yaml        | 42 +++++++++++++++++--
 1 file changed, 39 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs35l41.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs35l41.yaml
index 3235702ce402..51b5d86661d5 100644
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
+          contains:
+            const: 0
+
+    then:
+      required:
+        - cirrus,boost-peak-milliamp
+        - cirrus,boost-ind-nanohenry
+        - cirrus,boost-cap-microfarad
+
+  - if:
+      properties:
+        cirrus,boost-type:
+          contains:
+            const: 1
+
+    then:
+      required:
+        - cirrus,gpio1-output-enable
+      properties:
+        cirrus,gpio1-src-select:
+          const: 1
 
 additionalProperties: false
 
-- 
2.35.1

