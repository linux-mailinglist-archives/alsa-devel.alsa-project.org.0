Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8BB28E2A7
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Oct 2020 16:57:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83A2216FF;
	Wed, 14 Oct 2020 16:56:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83A2216FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602687428;
	bh=X6kvu6hIFvF4T6UIaZWyyUsUDClXVnGfSYO2/zrwt2c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cDMnizjn1tD8vlIXH0kix4X00w06/K8aYI+jXRwx+v8OLBYtSF0O7LKhlu8d8yND1
	 dKI+/boxRWoPXBihyZipKOccjdsWQ35AGSXPQC95Kwmr0MF8w+jwteT+kHjNONUXW0
	 hwXehWQky465RrG28cz6C+125jCMgBp8YvmaTwWg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D073F8012B;
	Wed, 14 Oct 2020 16:54:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD121F80274; Wed, 14 Oct 2020 16:54:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6361F800F6
 for <alsa-devel@alsa-project.org>; Wed, 14 Oct 2020 16:54:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6361F800F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="eabBocoK"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 09EEpi81023902; Wed, 14 Oct 2020 09:54:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=9XWilk56wxWCD+dN2HKKYxzBT3c3C3CzLDThlC0mYw4=;
 b=eabBocoKBbHpL8CBnl6EQsJ3xicnEwn4bHygmuM5SMyZaLd4gkz1FlRkjur/diDqQzPm
 xFvLPz4nSXxiyOAXV8704aG5rbXHkEng26U5nli7d3VNwgdd1OJVaNHw8OtlJNLM+dOT
 MzhYomqOEVKz4s5PBFaiKJOjxmr4qCPrAXtOVUeGybdaOvrV+lKNHNtEzyx7aMyamdkN
 o0ddqs0fwzY4drDsmgP08hyeTbgeZO0g3VvJ5yIps+fjaFNhHWk3rJJXgWOSNJBwU0ya
 bbzem/M9rAIk7K3IuIQIoEHnTlUmpX9C6pd7jkx6MBWO8G1Adeektg7hsfdwZpsh54nN JQ== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 343ac1wbwc-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 14 Oct 2020 09:54:35 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Wed, 14 Oct
 2020 15:54:33 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Wed, 14 Oct 2020 15:54:33 +0100
Received: from AUSNPC0LSNW1-debian.ad.cirrus.com (ausnpc0lsnw1.ad.cirrus.com
 [198.61.64.143])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2DC7A2C1;
 Wed, 14 Oct 2020 14:54:33 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <nsaenzjulienne@suse.de>
Subject: [PATCH 2/7] ASoC: simple-card: Add plls and sysclks DT schema
Date: Wed, 14 Oct 2020 15:54:13 +0100
Message-ID: <20201014145418.31838-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201014145418.31838-1-rf@opensource.cirrus.com>
References: <20201014145418.31838-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 mlxscore=0 spamscore=0 bulkscore=0 mlxlogscore=706 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010140108
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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

This adds the two new properties 'plls' and 'sysclks' to the dt bindings
schema document. These add the ability to set values that will be
passed to snd_soc_component_set_sysclk() and snd_soc_component_set_pll().

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 .../bindings/sound/simple-card.yaml           | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
index 35e669020296..48c9a4313d58 100644
--- a/Documentation/devicetree/bindings/sound/simple-card.yaml
+++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
@@ -92,6 +92,25 @@ definitions:
     description: the widget names for which pin switches must be created.
     $ref: /schemas/types.yaml#/definitions/string-array
 
+  plls:
+    description: |
+      A list of component pll settings that will be applied with
+      snd_soc_component_set_pll. Each entry is a phandle to the node of the
+      codec or cpu component, followed by the four arguments id, source,
+      frequency_in, frequency_out. Multiple entries can have the same phandle
+      so that several plls can be set in the same component.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+
+  sysclks:
+    description: |
+      A list of component sysclk settings that will be applied with
+      snd_soc_component_set_sysclk. Each entry is a phandle to the node of
+      the codec or cpu component, followed by the four arguments id, source,
+      frequency, direction. Direction is 0 if the clock is an input, 1 if it
+      is an output. Multiple entries can have the same phandle so that several
+      clocks can be set in the same component.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+
   format:
     description: audio format.
     items:
@@ -192,6 +211,10 @@ patternProperties:
     $ref: "#/definitions/prefix"
   "^simple-audio-card,pin-switches$":
     $ref: "#/definitions/pin-switches"
+  "^simple-audio-card,plls$":
+    $ref: "#/definitions/plls"
+  "^simple-audio-card,sysclks$":
+    $ref: "#/definitions/sysclks"
   "^simple-audio-card,hp-det-gpio$":
     maxItems: 1
   "^simple-audio-card,mic-det-gpio$":
@@ -489,3 +512,36 @@ examples:
             };
         };
     };
+
+#--------------------
+# Codec with component PLL and SYSCLK settings
+#--------------------
+  - |
+    sound {
+        compatible = "simple-audio-card";
+
+        simple-audio-card,plls = <
+            &cs47l15 1 1 32768 98304000
+        >;
+
+        simple-audio-card,sysclks = <
+            &cs47l15 1 4 98304000 0
+            &cs47l15 8 4 147456000 0
+        >;
+
+        simple-audio-card,format = "i2s";
+        simple-audio-card,bitclock-master = <&cs47l15_codec_dai>;
+        simple-audio-card,frame-master = <&cs47l15_codec_dai>;
+
+        simple-audio-card,cpu {
+            sound-dai = <&axi_i2s0 0>;
+        };
+
+        cs47l15_codec_dai: simple-audio-card,codec {
+            sound-dai = <&cs47l15 0>;
+
+            /* Disable dai_set_sysclk() */
+            system-clock-frequency = <0>;
+            mclk-fs = <0>;
+        };
+    };
-- 
2.20.1

