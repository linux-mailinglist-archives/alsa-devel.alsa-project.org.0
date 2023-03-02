Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FA26ACAE4
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 18:42:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A906E115B;
	Mon,  6 Mar 2023 18:41:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A906E115B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678124564;
	bh=ln47P1AbJA3caFwEGsJ+7K3FS1GTT1IFFh8ThllBDlc=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SUfsOL2ygtMy8lzIFHWQOxaZ1YbyjyznN7Mlv7slgt9G4t5YRgzyDYTPDQ4OOBoRd
	 MaVrAW228fdHyH7Cbp7FJP0A1lXlKdHj9vfH2K8KwnO89NF/b8XXrAtRe27VTWyMpD
	 hIOK5GmbUg9nS3wLukmu2mwX3tRljXM+GS70tFcE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 30BD4F805A1;
	Mon,  6 Mar 2023 18:39:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7FA40F804B1; Thu,  2 Mar 2023 18:12:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A00EAF800DF
	for <alsa-devel@alsa-project.org>; Thu,  2 Mar 2023 18:12:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A00EAF800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=PSJuZZuK
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3225JDQG001850;
	Thu, 2 Mar 2023 11:12:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=dPToRk/+soaeY948VOsT5VDpfTszKykVdxRQIdaJ4k8=;
 b=PSJuZZuKFZAJFx++1QVdEjpEynxBQ+RKcS/NhyUL1dtOGuqErZUqjboQQGhUHgtcF3Ux
 syFN0/DIOfKuZlZEqsqF8aIKZ6/8vdqu2XFatWIOhgcoEEnTT8LQruyOiHdYJFCC2lJh
 n8f5qrG+rrk8qZWYl5O57S6N1PvSCM4lFyBQi4+MIFMUdzhdvkZHIU7NBfxS8W/M+nSe
 m+MJuhN2vJTLtxGEb5sCunP4gj49idaVDVQxTCgH8XXHedHKkXuGHNmS9b62bmhLtg/b
 BgXO4JnTJIa1KZTtQMEXn28amGw9ypEQ4TKa/2KXzy7DhUtERXk9eGHQTtq/9/aINzwU 0Q==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3nyfmt9227-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Mar 2023 11:12:21 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Thu, 2 Mar
 2023 11:12:19 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Thu, 2 Mar 2023 11:12:19 -0600
Received: from vkarpovich-ThinkStation-P620.crystal.cirrus.com
 (vkarpovich-ThinkStation-P620.ad.cirrus.com [141.131.206.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 63DA8B06;
	Thu,  2 Mar 2023 17:12:18 +0000 (UTC)
From: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 2/5] ASoC: dt-bindings: cs35l45: GPIOs configuration
Date: Thu, 2 Mar 2023 11:11:51 -0600
Message-ID: <20230302171154.2342527-2-vkarpovi@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230302171154.2342527-1-vkarpovi@opensource.cirrus.com>
References: <20230302171154.2342527-1-vkarpovi@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Km3LwH9Vd3VWyf0TnFFQ867Q-rSQEjpz
X-Proofpoint-GUID: Km3LwH9Vd3VWyf0TnFFQ867Q-rSQEjpz
X-Proofpoint-Spam-Reason: safe
X-MailFrom: prvs=8425611b2f=vkarpovi@opensource.cirrus.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: CRXXWOQWW54343I5T5C4GXGQ7VXPF2DV
X-Message-ID-Hash: CRXXWOQWW54343I5T5C4GXGQ7VXPF2DV
X-Mailman-Approved-At: Mon, 06 Mar 2023 17:39:01 +0000
CC: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org,
 "Vlad.Karpovich" <vkarpovi@opensource.cirrus.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CRXXWOQWW54343I5T5C4GXGQ7VXPF2DV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: "Vlad.Karpovich" <vkarpovi@opensource.cirrus.com>

This adds description of CS35L45 GPIOs configuration.

Signed-off-by: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
---
 .../bindings/sound/cirrus,cs35l45.yaml        | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
index 184a1344ea76..34c2867e2fd9 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
@@ -47,6 +47,74 @@ properties:
     maximum: 3
     default: 2
 
+patternProperties:
+  "^cirrus,gpio-ctrl[1-3]$":
+    description:
+      GPIO pins configuration.
+    type: object
+    additionalProperties: false
+    properties:
+      gpio-dir:
+        description:
+          GPIO pin direction. Valid only when 'gpio-ctrl' is 1
+            0 = Output
+            1 = Input
+        $ref: "/schemas/types.yaml#/definitions/uint32"
+        minimum: 0
+        maximum: 1
+        default: 1
+      gpio-lvl:
+        description:
+          GPIO level. Valid only when 'gpio-ctrl' is 1 and 'gpio-dir' is 0
+            0 = Low
+            1 = High
+        $ref: "/schemas/types.yaml#/definitions/uint32"
+        minimum: 0
+        maximum: 1
+        default: 0
+      gpio-op-cfg:
+        description:
+          GPIO level. Valid only when 'gpio-ctrl' is 1 and 'gpio-dir' is 0
+            0 = CMOS
+            1 = Open Drain
+        $ref: "/schemas/types.yaml#/definitions/uint32"
+        minimum: 0
+        maximum: 1
+        default: 0
+      gpio-pol:
+        description:
+          GPIO output polarity select. Valid only when 'gpio-ctrl' is 1
+          and 'gpio-dir' is 0
+            0 = Non-inverted, Active High
+            1 = Inverted, Active Low
+        $ref: "/schemas/types.yaml#/definitions/uint32"
+        minimum: 0
+        maximum: 1
+        default: 0
+      gpio-ctrl:
+        description:
+          Defines the function of the GPIO pin.
+          GPIO1
+            0 = High impedance input
+            1 = Pin acts as a GPIO, direction controlled by 'gpio-dir'
+            2 = Pin acts as MDSYNC, direction controlled by MDSYNC
+            3-7 = Reserved
+          GPIO2
+            0 = High impedance input
+            1 = Pin acts as a GPIO, direction controlled by 'gpio-dir'
+            2 = Pin acts as open drain INT
+            3 = Reserved
+            4 = Pin acts as push-pull output INT. Active low.
+            5 = Pin acts as push-pull output INT. Active high.
+            6,7 = Reserved
+          GPIO3
+            0 = High impedance input
+            1 = Pin acts as a GPIO, direction controlled by 'gpio-dir'
+            2-7 = Reserved
+        $ref: "/schemas/types.yaml#/definitions/uint32"
+        minimum: 0
+        maximum: 7
+        default: 0
 required:
   - compatible
   - reg
@@ -71,5 +139,15 @@ examples:
           reset-gpios = <&gpio 110 0>;
           cirrus,asp-sdout-hiz-ctrl = <(CS35L45_ASP_TX_HIZ_UNUSED |
                                         CS35L45_ASP_TX_HIZ_DISABLED)>;
+          cirrus,gpio-ctrl1 {
+             gpio-ctrl = <0x2>;
+          };
+          cirrus,gpio-ctrl2 {
+             gpio-ctrl = <0x2>;
+          };
+          cirrus,gpio-ctrl3 {
+             gpio-ctrl = <0x1>;
+             gpio-dir = <0x1>;
+          };
         };
     };
-- 
2.25.1

