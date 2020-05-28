Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FF01E5D4B
	for <lists+alsa-devel@lfdr.de>; Thu, 28 May 2020 12:40:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A03317BF;
	Thu, 28 May 2020 12:40:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A03317BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590662454;
	bh=NrtY/I3W5W0KfIRDmoR/ZjWuC+qNcSukuOZm/6BrGaE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hA4PwFzVSUthEbJWrVQps5quOYVZF23MndbgNKuCpn8dArsjnUEDETUrBYh+/3tyK
	 /AUdu93s0wGI1DK4HjjjH9e6UwbbTEwX2TKmYx6yigW1iq1zk5wZf5465rrPu14TxL
	 xY8HMskuHBP78gRMDgoHFrfUGuZTPpHo8cdY65rE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 601BCF80150;
	Thu, 28 May 2020 12:39:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BAA59F80150; Thu, 28 May 2020 12:39:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700127.outbound.protection.outlook.com [40.107.70.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FB80F800FF
 for <alsa-devel@alsa-project.org>; Thu, 28 May 2020 12:39:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FB80F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=maximintegrated.onmicrosoft.com
 header.i=@maximintegrated.onmicrosoft.com header.b="dCycvlnJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UzJdfV6nqob57WFGB7ZC/aX2wTI2YpiuqFa1hUVTV8Hd+1B2wciMLlciL+tGRRMa9JMnAoUQ/ZVD6POp8tnV4vN29IffrlO2z0sNOtztxd3O/tP5YQkgTmZ0cq7vQ6kN1sJLj1dgL2XkD57CuSAD73D24HFTofHP0sXHKj549HwFGOvz5MIvxnrEJmglhRmai9axbo1nSDWFtwVfG0beC7td2yn2NepE9nAPKv5638tOlb931P9jOpG6AbXrgjwDCn2G0zGXWHDij1/yw6Wm1ZRXlYPXbY7ZoDl7GF1P6donLNrAOvQX37kb+d53CL6cIYmgO16n/kJgoJcDpxnelQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avu9Y04WZuMh4391AGHTo20Ol8+DxdCDGcsos98Gjic=;
 b=oaqXmh+YAqvHSHA14qeXPZQiQT3STudqPC3FL2Vdr3FIgK6DA81GpGvbZvb3H99KxwhMMs87j8GOokmZqB+PX/BEaOEmbddmcM7zcjaynvaMR7wjmvkd3OPznfNZYjq/gnWjEWmUhj3zMQ125q4FiNES3uLd/wzyy0aXxRHsHeQ3NUUPCvE2oiQ4Amkzj5MTcSt4xVRPa8Uqm85tvagOdrg+4nTBhSa++xObKc69ApHkRuFC3kOZgI2OpeF+1cQFNfgl6pYxC6rT6DVllHwiVvv9VsI8kCpMpg1OlKCpnZIpoi9En5pgPjDG2/tMIBXPMu6ja48MWweu9K6YBW6gVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=maximintegrated.com; dmarc=pass action=none
 header.from=maximintegrated.com; dkim=pass header.d=maximintegrated.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maximintegrated.onmicrosoft.com;
 s=selector2-maximintegrated-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avu9Y04WZuMh4391AGHTo20Ol8+DxdCDGcsos98Gjic=;
 b=dCycvlnJDZelqNcja/P9WoDEK1xLz3p49Id4Q8wD6K6kCgmRcu4GOWymnqUrKKcI/F0SC6hqA8hO6t1qR1gEMofl1n/aRxURna9XRHXJUizLm5hGC7eWzG5g+w4crQ+uX/5yI0JICd2kPx32HR7wt3iuqMh5aNOEnu7UydAdnn4=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=maximintegrated.com;
Received: from MWHPR11MB2047.namprd11.prod.outlook.com (2603:10b6:300:2a::12)
 by MWHPR11MB1613.namprd11.prod.outlook.com (2603:10b6:301:e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Thu, 28 May
 2020 10:38:56 +0000
Received: from MWHPR11MB2047.namprd11.prod.outlook.com
 ([fe80::994e:6a48:f660:f363]) by MWHPR11MB2047.namprd11.prod.outlook.com
 ([fe80::994e:6a48:f660:f363%5]) with mapi id 15.20.3021.030; Thu, 28 May 2020
 10:38:56 +0000
From: Steve Lee <steves.lee@maximintegrated.com>
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [V6 PATCH 1/2] dt-bindings: Added device tree binding for max98390
Date: Thu, 28 May 2020 19:37:55 +0900
Message-Id: <20200528103755.17381-1-steves.lee@maximintegrated.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SL2PR01CA0010.apcprd01.prod.exchangelabs.com
 (2603:1096:100:41::22) To MWHPR11MB2047.namprd11.prod.outlook.com
 (2603:10b6:300:2a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2001:2d8:e22f:b8e8:5407:3d9a:e3a8:441)
 by SL2PR01CA0010.apcprd01.prod.exchangelabs.com (2603:1096:100:41::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend
 Transport; Thu, 28 May 2020 10:38:52 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [2001:2d8:e22f:b8e8:5407:3d9a:e3a8:441]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e7567213-1a73-4a0a-d40c-08d802f3527f
X-MS-TrafficTypeDiagnostic: MWHPR11MB1613:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR11MB1613015E901B9A9DDA75DB99928E0@MWHPR11MB1613.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-Forefront-PRVS: 0417A3FFD2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TSsJ2dvfS3lwowPqqmDAKmDRWk/YypAWZkZ/YaSxzPpRw06Lj5ICbBdNigvAdcaPHAq8hisp1tZu0ihGYM/NvBkaEd+K+zFBirwTDGLbsdfj4WDkLDgq4CS3PqohdB7ECewddydLnKPM7Rip4IwKYAht9ktc6jKXoTvs7E3X8uWMqkM4dwoiZ2VtfadY+1fRINCkHmx35kdGkE7beJj0BE7luRoJ4tsEgPvOn0z3xmRwLJFJHzehPBqf81lwq+h44FbkxctkYlw3GD9iO5N+pGGdPQchlvIDvNmp8vFTDDC8faZHL9IwA71AAPGP8UCMuqbZ2whMHsHB3BVCN41cW91WkvgxKv3R9UX98L2SurOcmIm27OwUZsjtT8cZ89mUVEizhW0O/CyJ9Y+ry0nl2fxN/i7wmDI+mFaDco4OQ/aoBViVruHJ1C8GE5pGXjWnCiKRa8EChNgxBVWW0tVNOw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB2047.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(366004)(346002)(396003)(376002)(136003)(8936002)(86362001)(6486002)(69590400007)(8676002)(6512007)(2616005)(1076003)(478600001)(52116002)(16526019)(2906002)(6506007)(36756003)(186003)(966005)(66946007)(107886003)(316002)(66476007)(4326008)(66556008)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: LGiaRLMJjGOwDvfBQ9dO6oxRJf2LNCvNuqDW1ocqhU20+2ZKxO2jhamskErHoMuIg1Wbs6V++h6gQdNOqcmOBzjCGVmhfk8Qjv+aTKApkudI4jbLPp1GAx3k3vWOo958Ymtm8rgfgna1y9xQohb7aMyRk8CAl2tKpqkaLG7Bi1/UeeOnQRKe+aqohccT9AmWAOBTTFvrIlddjKkDBPHVT4wSLoYTszlBdj+4a2yVqPnCXuicM098wIiccDO5MBZAK2jIBZh0wQXWoZI31dpqbtw7jT8hM8moQLn4sxki/YOuw7r7br3uZpq42/oSQQwb6MMxn0AEHL4K7V7nuULuGla1h8a0NEnlihvbxMisIT3kMNWolFFxoWerZR6KyL+tp6B49CZcQwc+sA1Opy+X9U9jr/PG0uImfukQq4m5Joq1CYyN/DrB6sFjPxckqX1C1tOwUEY5MCuiTKP4OY76NKQS9UYy1VJBI/AwRWbdvijkXmlxD2o37eXc6lGxkTMBRDqClRFQlRQuZcTt7oa/2IoLwUCZJC1PdqMLhsH+6Ss=
X-OriginatorOrg: maximintegrated.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7567213-1a73-4a0a-d40c-08d802f3527f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2020 10:38:56.1990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd909df-ea69-4788-a554-f24b7854ad03
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u/UOArI1tJA1bwdEeFhqdHPGBg61Rebl5PgRHMjIlfOVliHQeZVMar0cFHLAlcZDm7TE4hC6TRBQ4w6KoeZbpTQBmJtL05ACAp1+KrMD4Jg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1613
Cc: ryan.lee.maxim@gmail.com, Steve Lee <steves.lee@maximintegrated.com>,
 ryans.lee@maximintegrated.com, steves.lee.maxim@gmail.com
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

Add DT binding of max98390 amplifier driver.

Signed-off-by: Steve Lee <steves.lee@maximintegrated.com>
---
Changed since V5:
	* Change txt to yaml and fix up the examples.
Changed since V4:
	* No changes.
Changed since V3:
	* No changes.
Changed since V2:
	* No changes.
Changed since V1:
	* Modified sample text in example

 .../bindings/sound/maxim,max98390.yaml        | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/maxim,max98390.yaml

diff --git a/Documentation/devicetree/bindings/sound/maxim,max98390.yaml b/Documentation/devicetree/bindings/sound/maxim,max98390.yaml
new file mode 100644
index 000000000000..1ed4ab9e1c37
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/maxim,max98390.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/maxim,max98390.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim Integrated MAX98390 Speaker Amplifier with Integrated Dynamic Speaker Management
+
+maintainers:
+  - Steve Lee <steves.lee@maximintegrated.com>
+
+properties:
+  compatible:
+      const: maxim,max98390
+
+  reg:
+    maxItems: 1
+    description: I2C address of the device.
+
+  temperature_calib:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: The calculated temperature data was measured while doing the calibration. Data : Temp / 100 * 2^12
+
+  r0_calib:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: This is r0 calibration data which was measured in factory mode.
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    max98390: amplifier@38 {
+            compatible = "maxim,max98390";
+            reg = <0x38>;
+            maxim,temperature_calib = <1024>;
+            maxim,r0_calib = <100232>;
+    };
-- 
2.17.1

