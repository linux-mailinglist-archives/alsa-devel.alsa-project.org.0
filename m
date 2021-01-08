Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1632EF589
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jan 2021 17:09:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67975172F;
	Fri,  8 Jan 2021 17:08:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67975172F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610122165;
	bh=wadWVVJV3pMHrb2U76avAlvxL6DUqq12r5eur0k9OwA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rz6jAYQ62omombZHBpOj8ENH5y6mKCgkBGuuDKj/TTbWicKIFyUsbBoRrhTGqXviY
	 227ridZIJu3nJTnKazk3hqYZlQWCQcOOpFIirUgbxWjQCpk6gZAisW1unRyvwqnhi+
	 h2eSPhM1GJ0lakJq8zKLU5zxHFwOOb6zRKZLB1Iw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BB78F80506;
	Fri,  8 Jan 2021 17:05:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1C35F80165; Fri,  8 Jan 2021 17:05:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD913F80165
 for <alsa-devel@alsa-project.org>; Fri,  8 Jan 2021 17:05:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD913F80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="oJ5K4MIT"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 108G2EoY011561; Fri, 8 Jan 2021 10:05:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=kOekwXaZfSzN5B1r/aiMtLh+hLUch+Y8pXk00v7FV8I=;
 b=oJ5K4MITbPRuVJtx9dPXSS661PHDCyQCrnd23VoiyFcfqPtvWjFD6vXGOghK5aFkh4t0
 4ySW1Rnyj8zU1lr1yMNIwBlrGILAOTLyhdlFTGxsfqvonQdMHVCED3H0q1i3/vk9Ff3c
 PQOqVqy+w7CSViB2V7LYFB30/h6LnEp0OSZ406zbFopfYNkISh0OqhKayejVfRvCrCEG
 +pMgabUx+uMEcxFnUpA61NMytQk8vfqXsrr/qBrAP9J1sY5l4vrgB9GhEjlWHGyd5aOF
 GjNjmVAo9SHH3FlXgweDUXQlOrVh1jGycqq32xCr6f/D2iJI8rZ2ihb0F7pckeIAQufz GQ== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 35wqjka90t-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 08 Jan 2021 10:05:09 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Fri, 8 Jan 2021
 16:05:07 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Fri, 8 Jan 2021 16:05:07 +0000
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.64.226])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 0395C11CE;
 Fri,  8 Jan 2021 16:05:06 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>,
 <kuninori.morimoto.gx@renesas.com>, <nsaenzjulienne@suse.de>,
 <f.fainelli@gmail.com>
Subject: [PATCH v4 2/6] dt-bindings: audio-graph-card: Add plls and sysclks
 properties
Date: Fri, 8 Jan 2021 16:04:57 +0000
Message-ID: <20210108160501.7638-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108160501.7638-1-rf@opensource.cirrus.com>
References: <20210108160501.7638-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101080091
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
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

The audio-graph-card driver has properties for configuring the clocking
for DAIs within a component, but is missing properties for setting
up the PLLs and sysclks of the component.

This patch adds the two new properties 'plls' and 'sysclks' so that the
audio-graph-driver can fully configure the component clocking.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 .../bindings/sound/audio-graph.yaml           | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph.yaml b/Documentation/devicetree/bindings/sound/audio-graph.yaml
index 4b46794e5153..9e0819205a17 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph.yaml
@@ -39,6 +39,52 @@ properties:
   mic-det-gpio:
     maxItems: 1
 
+  plls:
+    description: |
+      A list of component pll settings. There are 4 cells per PLL setting:
+        - phandle to the node of the codec or cpu component,
+        - component PLL id,
+        - component clock source id,
+        - frequency (in Hz) of the PLL output clock.
+      The PLL id and clock source id are specific to the particular component
+      so see the relevant component driver for the ids. Typically the
+      clock source id indicates the pin the source clock is connected to.
+      The same phandle can appear in multiple entries so that several plls
+      can be set in the same component.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+
+  plls-clocks:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description: |
+      A list of clock names giving the source clock for each setting
+      in the plls property.
+
+  sysclks:
+    description: |
+      A list of component sysclk settings. There are 4 cells per sysclk
+      setting:
+        - phandle to the node of the codec or cpu component,
+        - component sysclk id,
+        - component clock source id,
+        - direction of the clock: 0 if the clock is an input to the component,
+          1 if it is an output.
+      The sysclk id and clock source id are specific to the particular
+      component so see the relevant component driver for the ids. Typically
+      the clock source id indicates the pin the source clock is connected to.
+      The same phandle can appear in multiple entries so that several sysclks
+      can be set in the same component.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+
+  sysclks-clocks:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description: |
+      A list of clock names giving the source clock for each setting
+      in the sysclks property.
+
+dependencies:
+  plls: [ plls-clocks ]
+  sysclks: [ sysclks-clocks ]
+
 required:
   - dais
 
-- 
2.20.1

